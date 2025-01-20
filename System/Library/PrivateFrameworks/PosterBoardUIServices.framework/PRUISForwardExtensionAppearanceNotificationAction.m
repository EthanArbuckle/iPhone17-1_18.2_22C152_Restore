@interface PRUISForwardExtensionAppearanceNotificationAction
- (NSString)notificationName;
- (PRUISForwardExtensionAppearanceNotificationAction)initWithNotificationName:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
@end

@implementation PRUISForwardExtensionAppearanceNotificationAction

- (PRUISForwardExtensionAppearanceNotificationAction)initWithNotificationName:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F29C78];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)[v5 copy];

  [v6 setObject:v7 forSetting:1];
  v10.receiver = self;
  v10.super_class = (Class)PRUISForwardExtensionAppearanceNotificationAction;
  v8 = [(PRUISForwardExtensionAppearanceNotificationAction *)&v10 initWithInfo:v6 responder:0];

  return v8;
}

- (NSString)notificationName
{
  v2 = [(PRUISForwardExtensionAppearanceNotificationAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSString *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"notificationName";
  }
  else {
    return 0;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 == 1)
  {
    v7 = [(PRUISForwardExtensionAppearanceNotificationAction *)self notificationName];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end