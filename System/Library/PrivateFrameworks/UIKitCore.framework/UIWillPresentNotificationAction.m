@interface UIWillPresentNotificationAction
- (BOOL)isDeliverable;
- (BOOL)isLocal;
- (BOOL)isRemote;
- (UIWillPresentNotificationAction)initWithNotification:(id)a3 deliverable:(BOOL)a4 timeout:(double)a5 withHandler:(id)a6;
- (UIWillPresentNotificationAction)initWithNotification:(id)a3 timeout:(double)a4 withHandler:(id)a5;
- (UIWillPresentNotificationAction)initWithXPCDictionary:(id)a3;
- (UNNotification)notification;
- (id)_trigger;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)UIActionType;
@end

@implementation UIWillPresentNotificationAction

- (UIWillPresentNotificationAction)initWithNotification:(id)a3 timeout:(double)a4 withHandler:(id)a5
{
  return [(UIWillPresentNotificationAction *)self initWithNotification:a3 deliverable:1 timeout:a5 withHandler:a4];
}

- (UIWillPresentNotificationAction)initWithNotification:(id)a3 deliverable:(BOOL)a4 timeout:(double)a5 withHandler:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"UIWillPresentNotificationAction.m", 72, @"Invalid parameter not satisfying: %@", @"notification" object file lineNumber description];
  }
  v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
  id v14 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v14 setObject:v13 forSetting:1];
  [v14 setFlag:BSSettingFlagForBool() forSetting:2];
  v20.receiver = self;
  v20.super_class = (Class)UIWillPresentNotificationAction;
  v15 = [(UIWillPresentNotificationAction *)&v20 initWithInfo:v14 timeout:MEMORY[0x1E4F14428] forResponseOnQueue:v12 withHandler:a5];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    notification = v15->_notification;
    v15->_notification = (UNNotification *)v16;

    v15->_isDeliverable = a4;
  }

  return v15;
}

- (BOOL)isLocal
{
  return ![(UIWillPresentNotificationAction *)self isRemote];
}

- (BOOL)isRemote
{
  v2 = [(UIWillPresentNotificationAction *)self _trigger];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_trigger
{
  v2 = [(UIWillPresentNotificationAction *)self notification];
  v3 = [v2 request];
  v4 = [v3 trigger];

  return v4;
}

- (int64_t)UIActionType
{
  return 25;
}

- (UIWillPresentNotificationAction)initWithXPCDictionary:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIWillPresentNotificationAction;
  v3 = [(UIWillPresentNotificationAction *)&v11 initWithXPCDictionary:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(UIWillPresentNotificationAction *)v3 info];
    v6 = [v5 objectForSetting:1];

    v7 = [(UIWillPresentNotificationAction *)v4 info];
    [v7 flagForSetting:2];

    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F445C8], "bs_secureDecodedFromData:", v6);
    notification = v4->_notification;
    v4->_notification = (UNNotification *)v8;

    v4->_isDeliverable = BSSettingFlagIsYes();
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
    v7 = [(UNNotification *)self->_notification description];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (UNNotification)notification
{
  return self->_notification;
}

- (BOOL)isDeliverable
{
  return self->_isDeliverable;
}

- (void).cxx_destruct
{
}

@end