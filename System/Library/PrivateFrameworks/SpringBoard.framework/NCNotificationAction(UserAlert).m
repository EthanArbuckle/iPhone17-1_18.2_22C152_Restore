@interface NCNotificationAction(UserAlert)
+ (id)defaultNotificationActionForSBAlertItem:()UserAlert;
+ (id)dismissNotificationActionForSBAlertItem:()UserAlert;
@end

@implementation NCNotificationAction(UserAlert)

+ (id)defaultNotificationActionForSBAlertItem:()UserAlert
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"%@-%lu-default", v7, objc_msgSend(v3, "hash")];

  [v4 setIdentifier:v8];
  [v4 setActivationMode:0];
  [v4 setRequiresAuthentication:0];
  v9 = [(NCUserAlertActionRunner *)[NCUserAlertDefaultActionRunner alloc] initWithSBAlertItem:v3];

  [v4 setActionRunner:v9];
  return v4;
}

+ (id)dismissNotificationActionForSBAlertItem:()UserAlert
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"%@-%lu-dismiss", v7, objc_msgSend(v3, "hash")];

  [v4 setIdentifier:v8];
  [v4 setActivationMode:0];
  [v4 setRequiresAuthentication:0];
  v9 = [(NCUserAlertActionRunner *)[NCUserAlertDismissActionRunner alloc] initWithSBAlertItem:v3];

  [v4 setActionRunner:v9];
  return v4;
}

@end