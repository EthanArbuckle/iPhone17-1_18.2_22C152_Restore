@interface NCNotificationManagementTimeSensitiveTurnOffAlertController
- (void)_configureView;
@end

@implementation NCNotificationManagementTimeSensitiveTurnOffAlertController

- (void)_configureView
{
  v3 = [(NCNotificationManagementAlertController *)self request];
  v4 = [v3 topLevelSectionIdentifier];

  v5 = [(NCNotificationManagementAlertController *)self settingsDelegate];
  v6 = [v5 notificationManagementController:self sectionSettingsForSectionIdentifier:v4];

  v7 = NSString;
  v8 = NCUserNotificationsUIKitFrameworkBundle();
  v9 = [v8 localizedStringForKey:@"NOTIFICATION_REMOTE_MANAGEMENT_MENU_APP_TITLE" value:&stru_1F2F516F8 table:0];
  v10 = [v6 displayName];
  v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);
  [(NCNotificationManagementTimeSensitiveTurnOffAlertController *)self setTitle:v11];

  v12 = (void *)MEMORY[0x1E4FB1410];
  v13 = NCUserNotificationsUIKitFrameworkBundle();
  v14 = [v13 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_TURN_OFF_TIME_SENSITIVE" value:&stru_1F2F516F8 table:0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__NCNotificationManagementTimeSensitiveTurnOffAlertController__configureView__block_invoke;
  v25[3] = &unk_1E6A94D58;
  v25[4] = self;
  v15 = [v12 _actionWithTitle:v14 image:0 style:0 handler:0 shouldDismissHandler:v25];

  [(NCNotificationManagementTimeSensitiveTurnOffAlertController *)self addAction:v15];
  v16 = (void *)MEMORY[0x1E4FB1410];
  v17 = NCUserNotificationsUIKitFrameworkBundle();
  v18 = [v17 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_TURN_OFF_ALL" value:&stru_1F2F516F8 table:0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __77__NCNotificationManagementTimeSensitiveTurnOffAlertController__configureView__block_invoke_2;
  v24[3] = &unk_1E6A94D58;
  v24[4] = self;
  v19 = [v16 _actionWithTitle:v18 image:0 style:0 handler:0 shouldDismissHandler:v24];

  [(NCNotificationManagementTimeSensitiveTurnOffAlertController *)self addAction:v19];
  v20 = (void *)MEMORY[0x1E4FB1410];
  v21 = NCUserNotificationsUIKitFrameworkBundle();
  v22 = [v21 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_CANCEL" value:&stru_1F2F516F8 table:0];
  v23 = [v20 actionWithTitle:v22 style:1 handler:0];
  [(NCNotificationManagementTimeSensitiveTurnOffAlertController *)self addAction:v23];
}

uint64_t __77__NCNotificationManagementTimeSensitiveTurnOffAlertController__configureView__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) settingsDelegate];
  v3 = *(void **)(a1 + 32);
  v4 = [v3 request];
  v5 = [*(id *)(a1 + 32) request];
  v6 = [v5 topLevelSectionIdentifier];
  [v2 notificationManagementController:v3 setAllowsTimeSensitive:0 forNotificationRequest:v4 withSectionIdentifier:v6];

  return 1;
}

uint64_t __77__NCNotificationManagementTimeSensitiveTurnOffAlertController__configureView__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) settingsDelegate];
  v3 = *(void **)(a1 + 32);
  v4 = [v3 request];
  v5 = [*(id *)(a1 + 32) request];
  v6 = [v5 topLevelSectionIdentifier];
  [v2 notificationManagementController:v3 setAllowsNotifications:0 forNotificationRequest:v4 withSectionIdentifier:v6];

  return 1;
}

@end