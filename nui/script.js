let id = 0;
let activeNotifications = {};
function createNotification(message, title, icon) {
    id++;
    let notification = `
    <div id="notify-${id}" class="notify">
        <div id="notify-icon">
            <i class="${icon} notify-icon"></i>
        </div>
        <div id="notify-main">
            <span id="notify-title">${title}</span>
            <span id="notify-message">${message}</span>
        </div>
        <div id="stack-${id}" class="stack"></div>
        <div id="progressbar-${id}" class="progressbar"></div>
    </div>
    `;
    return notification;
}

$(document).ready(function() {
    let notifications = $('#notifications');
    
    function addNotification(message, title, duration, mainColor, backgroundColor, icon, scraped) {
        for (let i in activeNotifications) {
            if (activeNotifications[i] == scraped)
            {
                $(`#stack-${i}`).text(Number($(`#stack-${i}`).text()) + 1);
                $(`#stack-${i}`).css('opacity', '1.0');
                return;
            }
        }
        notifications.append(createNotification(message, title, icon));
        duration = duration ? duration : 5000;
        let progressbar = $(`#progressbar-${id}`)
        let notify = $(`#notify-${id}`);
        notify.css('--main', mainColor);
        notify.css('--background', backgroundColor);
        progressbar.css('--duration', duration + "ms");
        notify.addClass('show');
        activeNotifications[id] = scraped;
        progressbar.css('width', '100%').delay(Number(duration)).queue(function() {
            notify.removeClass('show');
            notify.addClass('hide');
            delete activeNotifications[id];
            setTimeout(function() {
                notify.remove();
            }, 300)
        });
    }

    window.addEventListener('message', function(event) {
        if (event.data.notification)
        {
            let data = event.data.notification
            if (data) 
            {
                let scraped = JSON.stringify(data);
                addNotification(data.message, data.title, data.duration, data.mainColor, data.backgroundColor, data.icon, scraped);
            }
        }
        else if (event.data.updatedColors)
        {
            $(':root').css('--main', event.data.updatedColors.mainColor);
            $(':root').css('--background', event.data.updatedColors.backgroundColor);
        }
    });    
});
