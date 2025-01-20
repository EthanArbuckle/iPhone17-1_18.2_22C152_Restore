@interface NCNotificationManagementViewController
+ (id)notificationManagementAlertControllerForNotificationRequest:(id)a3 withPresentingView:(id)a4 settingsDelegate:(id)a5;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (CGSize)preferredContentSize;
- (NCNotificationManagementControllerSettingsDelegate)settingsDelegate;
- (NCNotificationManagementViewController)initWithRequest:(id)a3;
- (NCNotificationRequest)request;
- (NSURL)settingsURL;
- (id)_newManagementView;
- (id)_sectionSettingsForSectionIdentifier:(id)a3;
- (id)_systemSettings;
- (id)notificationManagementController:(id)a3 sectionSettingsForSectionIdentifier:(id)a4;
- (id)notificationManagementViewPresenter:(id)a3 sectionSettingsForSectionIdentifier:(id)a4;
- (void)_deliveryButtonTapped:(id)a3;
- (void)_onOffToggleButtonTapped:(id)a3;
- (void)_setAllowsCriticalAlerts:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5;
- (void)_setAllowsNotifications:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5;
- (void)_setAllowsTimeSensitive:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5;
- (void)_setDeliverQuietly:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5;
- (void)_setMuted:(BOOL)a3 untilDate:(id)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6 threadIdentifier:(id)a7;
- (void)_setScheduledDelivery:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5;
- (void)loadView;
- (void)notificationManagementController:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementController:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementController:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementController:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementController:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8;
- (void)notificationManagementController:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8;
- (void)notificationManagementViewPresenter:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)setRequest:(id)a3;
- (void)setSettingsDelegate:(id)a3;
- (void)setSettingsURL:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NCNotificationManagementViewController

+ (id)notificationManagementAlertControllerForNotificationRequest:(id)a3 withPresentingView:(id)a4 settingsDelegate:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  v8 = [v7 topLevelSectionIdentifier];
  v9 = [[NCNotificationManagementViewController alloc] initWithRequest:v7];

  [(NCNotificationManagementViewController *)v9 setSettingsDelegate:v6];
  v10 = objc_alloc_init(NCNotificationManagementAlertController);
  [(NCNotificationManagementAlertController *)v10 setContentViewController:v9];
  v11 = (void *)MEMORY[0x1E4FB1410];
  v12 = NCUserNotificationsUIKitFrameworkBundle();
  v13 = [v12 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_SETTINGS" value:&stru_1F2F516F8 table:0];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __138__NCNotificationManagementViewController_notificationManagementAlertControllerForNotificationRequest_withPresentingView_settingsDelegate___block_invoke;
  v25 = &unk_1E6A94CB8;
  v26 = v9;
  id v27 = v8;
  id v14 = v8;
  v15 = v9;
  v16 = [v11 _actionWithTitle:v13 image:0 style:0 handler:0 shouldDismissHandler:&v22];

  -[NCNotificationManagementAlertController addAction:](v10, "addAction:", v16, v22, v23, v24, v25);
  v17 = (void *)MEMORY[0x1E4FB1410];
  v18 = NCUserNotificationsUIKitFrameworkBundle();
  v19 = [v18 localizedStringForKey:@"NOTIFICATION_MANAGEMENT_CANCEL" value:&stru_1F2F516F8 table:0];
  v20 = [v17 actionWithTitle:v19 style:1 handler:0];
  [(NCNotificationManagementAlertController *)v10 addAction:v20];

  return v10;
}

uint64_t __138__NCNotificationManagementViewController_notificationManagementAlertControllerForNotificationRequest_withPresentingView_settingsDelegate___block_invoke(uint64_t a1)
{
  v2 = dispatch_get_global_queue(25, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __138__NCNotificationManagementViewController_notificationManagementAlertControllerForNotificationRequest_withPresentingView_settingsDelegate___block_invoke_2;
  v4[3] = &unk_1E6A91A68;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v2, v4);

  return 1;
}

void __138__NCNotificationManagementViewController_notificationManagementAlertControllerForNotificationRequest_withPresentingView_settingsDelegate___block_invoke_2(uint64_t a1)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v3 = [*(id *)(a1 + 32) settingsURL];
  uint64_t v4 = *MEMORY[0x1E4F62688];
  v20[0] = *MEMORY[0x1E4F626A0];
  v20[1] = v4;
  v21[0] = MEMORY[0x1E4F1CC38];
  v21[1] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v13 = 0;
  [v2 openSensitiveURL:v3 withOptions:v5 error:&v13];
  id v6 = v13;

  if (v6)
  {
    id v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = a1 + 32;
      v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(v10 + 8);
      v11 = v7;
      v12 = [v8 settingsURL];
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      v17 = v12;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_error_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_ERROR, "Error opening Settings for %{public}@, %{public}@, %{public}@", buf, 0x20u);
    }
  }
}

- (NCNotificationManagementViewController)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationManagementViewController;
  id v6 = [(NCNotificationManagementViewController *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (id)_newManagementView
{
  v3 = [(NCNotificationRequest *)self->_request parentSectionIdentifier];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NCNotificationRequest *)self->_request sectionIdentifier];
  }
  id v6 = v5;

  id v7 = [(NCNotificationManagementViewController *)self settingsDelegate];
  v8 = [v7 notificationManagementController:self sectionSettingsForSectionIdentifier:v6];

  objc_super v9 = [v8 displayName];
  int v10 = [(NCNotificationRequest *)self->_request isCriticalAlert];
  v11 = NCUserNotificationsUIKitFrameworkBundle();
  v12 = v11;
  if (v10) {
    id v13 = @"NOTIFICATION_MANAGEMENT_SUBTITLE_CRITICAL_ALERTS";
  }
  else {
    id v13 = @"NOTIFICATION_MANAGEMENT_SUBTITLE_DEFAULT";
  }
  id v14 = [v11 localizedStringForKey:v13 value:&stru_1F2F516F8 table:0];

  self->_isDeliveredQuietly = [v8 isDeliveredQuietly];
  objc_msgSend(MEMORY[0x1E4F1CB10], "nc_notificationSettingsURLForSectionIdentifier:isAppClip:", v6, objc_msgSend(v8, "isAppClip"));
  uint64_t v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  settingsURL = self->_settingsURL;
  self->_settingsURL = v15;

  v17 = [v8 settingsIcon];
  if (!v17)
  {
    __int16 v18 = [(NCNotificationManagementViewController *)self traitCollection];
    v17 = NCIconImageForApplicationIdentifierWithFormat(v6, 17, [v18 userInterfaceStyle]);
  }
  id v19 = [[NCNotificationManagementView alloc] initWithIcon:v17 title:v9 subtitle:v14 sectionSettings:v8 criticalAlert:[(NCNotificationRequest *)self->_request isCriticalAlert]];

  return v19;
}

- (void)loadView
{
  v3 = [(NCNotificationManagementViewController *)self _newManagementView];
  platterView = self->_platterView;
  self->_platterView = v3;

  id v5 = self->_platterView;

  [(NCNotificationManagementViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationManagementViewController;
  [(NCNotificationManagementViewController *)&v5 viewDidLoad];
  v3 = [(NCNotificationManagementView *)self->_platterView deliveryButton];
  [v3 addTarget:self action:sel__deliveryButtonTapped_ forControlEvents:64];

  uint64_t v4 = [(NCNotificationManagementView *)self->_platterView onOffToggleButton];
  [v4 addTarget:self action:sel__onOffToggleButtonTapped_ forControlEvents:64];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationManagementViewController;
  [(NCNotificationManagementViewController *)&v4 viewWillAppear:a3];
  [(NCNotificationManagementViewController *)self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationManagementViewController;
  [(NCNotificationManagementViewController *)&v4 viewWillDisappear:a3];
  [(NCNotificationManagementViewController *)self resignFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationManagementViewController;
  [(NCNotificationManagementViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(NCNotificationManagementViewController *)self settingsDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationManagementControllerDidDismissManagementView:self];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (CGSize)preferredContentSize
{
  v18.receiver = self;
  v18.super_class = (Class)NCNotificationManagementViewController;
  [(NCNotificationManagementViewController *)&v18 preferredContentSize];
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 _referenceBounds];
    double v8 = v7;

    if (v8 > 355.0) {
      double v8 = 355.0;
    }
    objc_super v9 = [(NCNotificationManagementViewController *)self view];
    objc_msgSend(v9, "sizeThatFits:", v8, 1.79769313e308);
    double v11 = v10;
    double v13 = v12;

    v17.receiver = self;
    v17.super_class = (Class)NCNotificationManagementViewController;
    -[NCNotificationManagementViewController setPreferredContentSize:](&v17, sel_setPreferredContentSize_, v11, v13);
  }
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationManagementViewController;
  [(NCNotificationManagementViewController *)&v16 preferredContentSize];
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)_deliveryButtonTapped:(id)a3
{
  BOOL isDeliveredQuietly = self->_isDeliveredQuietly;
  objc_super v5 = [(NCNotificationManagementViewController *)self settingsDelegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__NCNotificationManagementViewController__deliveryButtonTapped___block_invoke;
  v7[3] = &unk_1E6A942B8;
  id v8 = v5;
  objc_super v9 = self;
  BOOL v10 = isDeliveredQuietly;
  id v6 = v5;
  [(NCNotificationManagementViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

void __64__NCNotificationManagementViewController__deliveryButtonTapped___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = *(void **)(a1 + 40);
  BOOL v4 = *(unsigned char *)(a1 + 48) == 0;
  id v7 = [v3 request];
  objc_super v5 = [*(id *)(a1 + 40) request];
  id v6 = [v5 sectionIdentifier];
  [v2 notificationManagementController:v3 setDeliverQuietly:v4 forNotificationRequest:v7 withSectionIdentifier:v6];
}

- (void)_onOffToggleButtonTapped:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init(NCNotificationManagementViewPresenter);
  viewPresenter = self->_viewPresenter;
  self->_viewPresenter = v5;

  [(NCNotificationManagementViewPresenter *)self->_viewPresenter setDelegate:self];
  id v7 = self->_viewPresenter;
  id v8 = [(NCNotificationManagementViewController *)self request];
  [(NCNotificationManagementViewPresenter *)v7 presentNotificationManagementViewType:3 forNotificationRequest:v8 withPresentingViewController:self withPresentingView:v4];
}

- (id)notificationManagementController:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return [(NCNotificationManagementViewController *)self _sectionSettingsForSectionIdentifier:a4];
}

- (void)notificationManagementController:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
}

- (void)notificationManagementController:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
}

- (void)notificationManagementController:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
}

- (void)notificationManagementController:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
}

- (void)notificationManagementController:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8
{
}

- (void)notificationManagementController:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
}

- (id)notificationManagementViewPresenter:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return [(NCNotificationManagementViewController *)self _sectionSettingsForSectionIdentifier:a4];
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
}

- (void)notificationManagementViewPresenter:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
}

- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8
{
}

- (void)notificationManagementViewPresenter:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
}

- (id)_sectionSettingsForSectionIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NCNotificationManagementViewController *)self settingsDelegate];
  id v6 = [v5 notificationManagementController:self sectionSettingsForSectionIdentifier:v4];

  return v6;
}

- (id)_systemSettings
{
  double v3 = [(NCNotificationManagementViewController *)self settingsDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 notificationManagementControllerRequestsSystemSettings:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_setAllowsNotifications:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(NCNotificationManagementViewController *)self settingsDelegate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __111__NCNotificationManagementViewController__setAllowsNotifications_forNotificationRequest_withSectionIdentifier___block_invoke;
  v14[3] = &unk_1E6A94CE0;
  id v15 = v10;
  objc_super v16 = self;
  BOOL v19 = a3;
  id v17 = v8;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(NCNotificationManagementViewController *)self dismissViewControllerAnimated:1 completion:v14];
}

uint64_t __111__NCNotificationManagementViewController__setAllowsNotifications_forNotificationRequest_withSectionIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notificationManagementController:*(void *)(a1 + 40) setAllowsNotifications:*(unsigned __int8 *)(a1 + 64) forNotificationRequest:*(void *)(a1 + 48) withSectionIdentifier:*(void *)(a1 + 56)];
}

- (void)_setDeliverQuietly:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(NCNotificationManagementViewController *)self settingsDelegate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__NCNotificationManagementViewController__setDeliverQuietly_forNotificationRequest_withSectionIdentifier___block_invoke;
  v14[3] = &unk_1E6A94CE0;
  id v15 = v10;
  objc_super v16 = self;
  BOOL v19 = a3;
  id v17 = v8;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(NCNotificationManagementViewController *)self dismissViewControllerAnimated:1 completion:v14];
}

uint64_t __106__NCNotificationManagementViewController__setDeliverQuietly_forNotificationRequest_withSectionIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notificationManagementController:*(void *)(a1 + 40) setDeliverQuietly:*(unsigned __int8 *)(a1 + 64) forNotificationRequest:*(void *)(a1 + 48) withSectionIdentifier:*(void *)(a1 + 56)];
}

- (void)_setAllowsCriticalAlerts:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(NCNotificationManagementViewController *)self settingsDelegate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __112__NCNotificationManagementViewController__setAllowsCriticalAlerts_forNotificationRequest_withSectionIdentifier___block_invoke;
  v14[3] = &unk_1E6A94CE0;
  id v15 = v10;
  objc_super v16 = self;
  BOOL v19 = a3;
  id v17 = v8;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(NCNotificationManagementViewController *)self dismissViewControllerAnimated:1 completion:v14];
}

uint64_t __112__NCNotificationManagementViewController__setAllowsCriticalAlerts_forNotificationRequest_withSectionIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notificationManagementController:*(void *)(a1 + 40) setAllowsCriticalAlerts:*(unsigned __int8 *)(a1 + 64) forNotificationRequest:*(void *)(a1 + 48) withSectionIdentifier:*(void *)(a1 + 56)];
}

- (void)_setAllowsTimeSensitive:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(NCNotificationManagementViewController *)self settingsDelegate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __111__NCNotificationManagementViewController__setAllowsTimeSensitive_forNotificationRequest_withSectionIdentifier___block_invoke;
  v14[3] = &unk_1E6A94CE0;
  id v15 = v10;
  objc_super v16 = self;
  BOOL v19 = a3;
  id v17 = v8;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(NCNotificationManagementViewController *)self dismissViewControllerAnimated:1 completion:v14];
}

uint64_t __111__NCNotificationManagementViewController__setAllowsTimeSensitive_forNotificationRequest_withSectionIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notificationManagementController:*(void *)(a1 + 40) setAllowsTimeSensitive:*(unsigned __int8 *)(a1 + 64) forNotificationRequest:*(void *)(a1 + 48) withSectionIdentifier:*(void *)(a1 + 56)];
}

- (void)_setMuted:(BOOL)a3 untilDate:(id)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_super v16 = [(NCNotificationManagementViewController *)self settingsDelegate];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __124__NCNotificationManagementViewController__setMuted_untilDate_forNotificationRequest_withSectionIdentifier_threadIdentifier___block_invoke;
  v22[3] = &unk_1E6A94D08;
  id v23 = v16;
  v24 = self;
  BOOL v29 = a3;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  id v21 = v16;
  [(NCNotificationManagementViewController *)self dismissViewControllerAnimated:1 completion:v22];
}

uint64_t __124__NCNotificationManagementViewController__setMuted_untilDate_forNotificationRequest_withSectionIdentifier_threadIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notificationManagementController:*(void *)(a1 + 40) setMuted:*(unsigned __int8 *)(a1 + 80) untilDate:*(void *)(a1 + 48) forNotificationRequest:*(void *)(a1 + 56) withSectionIdentifier:*(void *)(a1 + 64) threadIdentifier:*(void *)(a1 + 72)];
}

- (void)_setScheduledDelivery:(BOOL)a3 forNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(NCNotificationManagementViewController *)self settingsDelegate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__NCNotificationManagementViewController__setScheduledDelivery_forNotificationRequest_withSectionIdentifier___block_invoke;
  v14[3] = &unk_1E6A94CE0;
  id v15 = v10;
  objc_super v16 = self;
  BOOL v19 = a3;
  id v17 = v8;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(NCNotificationManagementViewController *)self dismissViewControllerAnimated:1 completion:v14];
}

uint64_t __109__NCNotificationManagementViewController__setScheduledDelivery_forNotificationRequest_withSectionIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notificationManagementController:*(void *)(a1 + 40) setScheduledDelivery:*(unsigned __int8 *)(a1 + 64) forNotificationRequest:*(void *)(a1 + 48) withSectionIdentifier:*(void *)(a1 + 56)];
}

- (NCNotificationManagementControllerSettingsDelegate)settingsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsDelegate);

  return (NCNotificationManagementControllerSettingsDelegate *)WeakRetained;
}

- (void)setSettingsDelegate:(id)a3
{
}

- (NSURL)settingsURL
{
  return self->_settingsURL;
}

- (void)setSettingsURL:(id)a3
{
}

- (NCNotificationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsDelegate);
  objc_storeStrong((id *)&self->_viewPresenter, 0);
  objc_storeStrong((id *)&self->_settingsURL, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_platterView, 0);
}

@end