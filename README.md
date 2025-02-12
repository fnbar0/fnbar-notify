# fnbar-notify
> [!NOTE]  
> This HUD is compatible with [fnbar-hud](https://github.com/fnbar0/fnbar-hud), meaning if you also have this resource installed on your server, players can change color of default notification in the hud settings.

### FiveM Notify system.

## Resource Installation
* Download the repository
* Put the `fnbar-notify` folder in your resources directory
* Add `ensure fnbar-notify` to your server config

## Usage
* `exports['fnbar-notify]:showNotification(data)`

## **Data Table Options**  
The `data` table accepts the following properties:  

| Key                | Type     | Description |
|-------------------|---------|-------------|
| `message`         | `string` | The main text of the notification. **Required.** |
| `title`           | `string` | The title of the notification. **Required.** |
| `duration`        | `number` | The duration of the notification in milliseconds. **Default: 5000.** |
| `mainColor`       | `string` | The main color of the notification (e.g., `#FFFFFF`). **Optional.** |
| `backgroundColor` | `string` | The background color of the notification (e.g., `#000000`). **Optional.** |
| `icon`            | `string` | A [Font Awesome](https://fontawesome.com/icons) icon name (e.g., `fa-solid fa-circle`). **Optional.** |
| `template`        | `string` | The notification type: `success`, `error`, `warning`, or `info`. Determines default styling.  **Optional.** |
| `sound`           | `string` | The sound associated with the notification. Uses the same values as `template` (`success`, `error`, `warning`, `info`). **Optional.** |

## Example usage

```lua
exports['fnbar-notify']:showNotification({
    message = "You have received a new message!",
    title = "New Message",
    duration = 7000,
    mainColor = "#c042ff",
    backgroundColor = "#222222",
    icon = "fa-solid fa-user",
    sound = "success"
})
```
### or

```lua
exports['fnbar-notify']:showNotification({
    message = "You are in the pvp zone!",
    template = warning
})
```

## [Preview](https://www.youtube.com/watch?v=Ec5E5ExfQl8)
