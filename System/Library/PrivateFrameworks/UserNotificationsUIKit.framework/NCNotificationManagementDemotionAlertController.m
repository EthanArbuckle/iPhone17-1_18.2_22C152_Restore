@interface NCNotificationManagementDemotionAlertController
- (BOOL)includeExplanation;
- (NCNotificationManagementDemotionAlertController)initWithRequest:(id)a3 withPresentingView:(id)a4 settingsDelegate:(id)a5 includeExplanation:(BOOL)a6;
- (void)_configureView;
- (void)setIncludeExplanation:(BOOL)a3;
@end

@implementation NCNotificationManagementDemotionAlertController

- (NCNotificationManagementDemotionAlertController)initWithRequest:(id)a3 withPresentingView:(id)a4 settingsDelegate:(id)a5 includeExplanation:(BOOL)a6
{
  BOOL v6 = a6;
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationManagementDemotionAlertController;
  v7 = [(NCNotificationManagementAlertController *)&v10 initWithRequest:a3 withPresentingView:a4 settingsDelegate:a5];
  v8 = v7;
  if (v7) {
    [(NCNotificationManagementDemotionAlertController *)v7 setIncludeExplanation:v6];
  }
  return v8;
}

- (void)_configureView
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  BOOL v6 = [a3 localizedDescription];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  objc_super v10 = v6;
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "Error localizing title for format %{public}@, %{public}@", (uint8_t *)&v7, 0x16u);
}

uint64_t __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) settingsDelegate];
  v3 = [*(id *)(a1 + 32) request];
  int v4 = [v3 isCriticalAlert];

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v6 = [v5 criticalAlertsEnabled] ^ 1;
    int v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v7 request];
    [v2 notificationManagementController:v7 setAllowsCriticalAlerts:v6 forNotificationRequest:v8 withSectionIdentifier:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v9 = [v5 notificationsEnabled] ^ 1;
    objc_super v10 = *(void **)(a1 + 32);
    uint64_t v8 = [v10 request];
    [v2 notificationManagementController:v10 setAllowsNotifications:v9 forNotificationRequest:v8 withSectionIdentifier:*(void *)(a1 + 48)];
  }

  return 1;
}

uint64_t __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_2(uint64_t a1)
{
  v2 = dispatch_get_global_queue(25, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_3;
  v5[3] = &unk_1E6A91A68;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v2, v5);

  return 1;
}

void __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_3(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) request];
  v3 = [v2 userNotification];

  int v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1A18]) initWithNotification:v3];
  v5 = (void *)MEMORY[0x1E4F629C8];
  uint64_t v6 = *MEMORY[0x1E4F62688];
  v15[0] = *MEMORY[0x1E4F626A0];
  v15[1] = v6;
  v16[0] = MEMORY[0x1E4F1CC38];
  v16[1] = MEMORY[0x1E4F1CC38];
  v15[2] = *MEMORY[0x1E4F625E0];
  v14 = v4;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v16[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v9 = [v5 optionsWithDictionary:v8];

  objc_super v10 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  uint64_t v11 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_4;
  v12[3] = &unk_1E6A93D28;
  id v13 = v11;
  [v10 openApplication:v13 withOptions:v9 completion:v12];
}

void __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_4_cold_1(a1, (uint64_t)v6, v7);
    }
  }
}

- (BOOL)includeExplanation
{
  return self->_includeExplanation;
}

- (void)setIncludeExplanation:(BOOL)a3
{
  self->_includeExplanation = a3;
}

void __65__NCNotificationManagementDemotionAlertController__configureView__block_invoke_4_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Error opening Application settings for %{public}@, %{public}@", (uint8_t *)&v4, 0x16u);
}

@end