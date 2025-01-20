@interface NPKUserNotificationExpressModeEnabled
- (BOOL)wantsBadgedIcon;
- (NPKUserNotificationExpressModeEnabled)initWithPass:(id)a3 expressNotificationType:(unint64_t)a4;
- (id)body;
- (id)notificationCategoryIdentifier;
- (id)title;
- (id)userInfo;
@end

@implementation NPKUserNotificationExpressModeEnabled

- (NPKUserNotificationExpressModeEnabled)initWithPass:(id)a3 expressNotificationType:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NPKUserNotificationExpressModeEnabled;
  v7 = [(NPKPassUserNotification *)&v16 initWithPass:v6];
  if (v7)
  {
    v8 = [v6 paymentPass];
    char v9 = [v8 isHomeKeyPass];

    if (v9)
    {
      v7->_expressNotificationType = a4;
    }
    else
    {
      v10 = pk_General_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        v12 = pk_General_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = objc_opt_class();
          v14 = [v6 uniqueID];
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v13;
          __int16 v19 = 2112;
          v20 = v14;
          _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Warning: %@ only supports notifications for Home Key passes. Pass with uniqueID: %@", buf, 0x16u);
        }
      }

      v7 = 0;
    }
  }

  return v7;
}

- (id)notificationCategoryIdentifier
{
  return @"PDUserNotificationTypePassExpressModeEnabled";
}

- (id)title
{
  unint64_t expressNotificationType = self->_expressNotificationType;
  if (expressNotificationType != 2)
  {
    if (expressNotificationType == 1)
    {
      v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
      v5 = v4;
      id v6 = @"HOME_KEY_UWB_EXPRESS_ENABLED_OPT_OUT_NOTIFICATION_TITLE_WATCH";
      goto LABEL_6;
    }
    if (expressNotificationType) {
      goto LABEL_7;
    }
  }
  v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
  v5 = v4;
  id v6 = @"HOME_KEY_EXPRESS_ENABLED_OPT_OUT_NOTIFICATION_TITLE_WATCH";
LABEL_6:
  v2 = [v4 localizedStringForKey:v6 value:&stru_26CFEBA18 table:@"NanoPassKit-HomeKey"];

LABEL_7:
  return v2;
}

- (id)body
{
  v4 = [(NPKPassUserNotification *)self pass];
  v5 = [v4 localizedDescription];

  unint64_t expressNotificationType = self->_expressNotificationType;
  if (expressNotificationType == 2)
  {
    v7 = NSString;
    v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
    char v9 = v8;
    v10 = @"HOME_KEY_BOTH_EXPRESS_ENABLED_OPT_OUT_NOTIFICATION_MESSAGE_WATCH";
  }
  else if (expressNotificationType == 1)
  {
    v7 = NSString;
    v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
    char v9 = v8;
    v10 = @"HOME_KEY_UWB_EXPRESS_ENABLED_OPT_OUT_NOTIFICATION_MESSAGE_WATCH";
  }
  else
  {
    if (expressNotificationType) {
      goto LABEL_8;
    }
    v7 = NSString;
    v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
    char v9 = v8;
    v10 = @"HOME_KEY_EXPRESS_ENABLED_OPT_OUT_NOTIFICATION_MESSAGE_WATCH_DISABLE_ACTION";
  }
  BOOL v11 = [v8 localizedStringForKey:v10 value:&stru_26CFEBA18 table:@"NanoPassKit-HomeKey"];
  v2 = objc_msgSend(v7, "stringWithFormat:", v11, v5);

LABEL_8:
  return v2;
}

- (id)userInfo
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = *MEMORY[0x263F5C6B0];
  v2 = [(NPKPassUserNotification *)self pass];
  v3 = [v2 uniqueID];
  v6[1] = *MEMORY[0x263F5C918];
  v7[0] = v3;
  v7[1] = @"false";
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (BOOL)wantsBadgedIcon
{
  v3 = [(NPKPassUserNotification *)self pass];
  v4 = [v3 secureElementPass];

  v5 = [(NPKPassUserNotification *)self pass];
  id v6 = [v5 rawIcon];
  if (v6 && v4 && ([v4 isAppleCardPass] & 1) == 0)
  {
    char v9 = [v4 isPeerPaymentPass];

    if ((v9 & 1) == 0)
    {
      BOOL v7 = 1;
      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

@end