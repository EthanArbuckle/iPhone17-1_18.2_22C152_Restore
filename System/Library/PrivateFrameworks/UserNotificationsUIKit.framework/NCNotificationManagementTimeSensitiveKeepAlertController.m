@interface NCNotificationManagementTimeSensitiveKeepAlertController
- (void)_configureView;
@end

@implementation NCNotificationManagementTimeSensitiveKeepAlertController

- (void)_configureView
{
  v3 = NCUserNotificationsUIKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_TIME_SENSITIVE_SUGGESTION_EXPLANATION" value:&stru_1F2F516F8 table:0];
  [(NCNotificationManagementTimeSensitiveKeepAlertController *)self setTitle:v4];

  v5 = (void *)MEMORY[0x1E4FB1410];
  v6 = NCUserNotificationsUIKitFrameworkBundle();
  v7 = [v6 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_TIME_SENSITIVE_SUGGESTION_KEEP_ON" value:&stru_1F2F516F8 table:0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__NCNotificationManagementTimeSensitiveKeepAlertController__configureView__block_invoke;
  v13[3] = &unk_1E6A94D58;
  v13[4] = self;
  v8 = [v5 _actionWithTitle:v7 image:0 style:0 handler:0 shouldDismissHandler:v13];

  [(NCNotificationManagementTimeSensitiveKeepAlertController *)self addAction:v8];
  v9 = (void *)MEMORY[0x1E4FB1410];
  v10 = NCUserNotificationsUIKitFrameworkBundle();
  v11 = [v10 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_CANCEL" value:&stru_1F2F516F8 table:0];
  v12 = [v9 actionWithTitle:v11 style:1 handler:0];
  [(NCNotificationManagementTimeSensitiveKeepAlertController *)self addAction:v12];
}

uint64_t __74__NCNotificationManagementTimeSensitiveKeepAlertController__configureView__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) settingsDelegate];
  v3 = *(void **)(a1 + 32);
  v4 = [v3 request];
  v5 = [*(id *)(a1 + 32) request];
  v6 = [v5 topLevelSectionIdentifier];
  [v2 notificationManagementController:v3 setAllowsTimeSensitive:1 forNotificationRequest:v4 withSectionIdentifier:v6];

  return 1;
}

@end