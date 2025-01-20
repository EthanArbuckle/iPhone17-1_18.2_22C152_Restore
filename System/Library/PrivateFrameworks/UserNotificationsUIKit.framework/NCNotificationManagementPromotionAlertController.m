@interface NCNotificationManagementPromotionAlertController
- (void)_configureView;
@end

@implementation NCNotificationManagementPromotionAlertController

- (void)_configureView
{
  v3 = [(NCNotificationManagementAlertController *)self request];
  v4 = [v3 topLevelSectionIdentifier];

  v5 = (void *)MEMORY[0x1E4FB1410];
  v6 = NCUserNotificationsUIKitFrameworkBundle();
  v7 = [v6 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_DELIVER_IMMEDIATELY" value:&stru_1F2F516F8 table:0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__NCNotificationManagementPromotionAlertController__configureView__block_invoke;
  v26[3] = &unk_1E6A94CB8;
  v26[4] = self;
  id v8 = v4;
  id v27 = v8;
  v9 = [v5 _actionWithTitle:v7 image:0 style:0 handler:0 shouldDismissHandler:v26];

  [(NCNotificationManagementPromotionAlertController *)self addAction:v9];
  v10 = [(NCNotificationManagementAlertController *)self settingsDelegate];
  v11 = [v10 notificationManagementControllerRequestsSystemSettings:self];

  if ([v11 isScheduledDeliveryEnabled])
  {
    v12 = (void *)MEMORY[0x1E4FB1410];
    v13 = NCUserNotificationsUIKitFrameworkBundle();
    v14 = [v13 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_DELIVER_IN_SUMMARY" value:&stru_1F2F516F8 table:0];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __66__NCNotificationManagementPromotionAlertController__configureView__block_invoke_2;
    v23 = &unk_1E6A94CB8;
    v24 = self;
    id v25 = v8;
    v15 = [v12 _actionWithTitle:v14 image:0 style:0 handler:0 shouldDismissHandler:&v20];

    -[NCNotificationManagementPromotionAlertController addAction:](self, "addAction:", v15, v20, v21, v22, v23, v24);
  }
  v16 = (void *)MEMORY[0x1E4FB1410];
  v17 = NCUserNotificationsUIKitFrameworkBundle();
  v18 = [v17 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_CANCEL" value:&stru_1F2F516F8 table:0];
  v19 = [v16 actionWithTitle:v18 style:1 handler:0];
  [(NCNotificationManagementPromotionAlertController *)self addAction:v19];
}

uint64_t __66__NCNotificationManagementPromotionAlertController__configureView__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) settingsDelegate];
  v3 = *(void **)(a1 + 32);
  v4 = [v3 request];
  [v2 notificationManagementController:v3 setScheduledDelivery:0 forNotificationRequest:v4 withSectionIdentifier:*(void *)(a1 + 40)];

  return 1;
}

uint64_t __66__NCNotificationManagementPromotionAlertController__configureView__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) settingsDelegate];
  v3 = *(void **)(a1 + 32);
  v4 = [v3 request];
  [v2 notificationManagementController:v3 setScheduledDelivery:1 forNotificationRequest:v4 withSectionIdentifier:*(void *)(a1 + 40)];

  return 1;
}

@end