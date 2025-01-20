@interface UINotificationSettingsAction
- (UINotificationSettingsAction)initWithNotification:(id)a3;
- (UINotificationSettingsAction)initWithXPCDictionary:(id)a3;
- (UNNotification)notification;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)UIActionType;
@end

@implementation UINotificationSettingsAction

- (UINotificationSettingsAction)initWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  if (v4)
  {
    v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    [v5 setObject:v6 forSetting:1];
  }
  v11.receiver = self;
  v11.super_class = (Class)UINotificationSettingsAction;
  v7 = [(UINotificationSettingsAction *)&v11 initWithInfo:v5 timeout:0 forResponseOnQueue:0 withHandler:0.0];
  if (v7)
  {
    uint64_t v8 = [v4 copy];
    notification = v7->_notification;
    v7->_notification = (UNNotification *)v8;
  }
  return v7;
}

- (int64_t)UIActionType
{
  return 32;
}

- (UINotificationSettingsAction)initWithXPCDictionary:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UINotificationSettingsAction;
  v3 = [(UINotificationSettingsAction *)&v10 initWithXPCDictionary:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [(UINotificationSettingsAction *)v3 info];
    v6 = [v5 objectForSetting:1];

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F445C8], "bs_secureDecodedFromData:", v6);
    notification = v4->_notification;
    v4->_notification = (UNNotification *)v7;
  }
  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"notification";
  }
  else {
    return 0;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 == 1)
  {
    uint64_t v7 = [(UNNotification *)self->_notification description];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void).cxx_destruct
{
}

@end