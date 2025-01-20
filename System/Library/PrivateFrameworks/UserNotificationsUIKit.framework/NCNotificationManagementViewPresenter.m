@interface NCNotificationManagementViewPresenter
- (BOOL)dismissManagementViewIfPresentedAnimated:(BOOL)a3;
- (NCNotificationManagementViewPresenterDelegate)delegate;
- (UIAlertController)notificationManagementAlertViewController;
- (id)notificationManagementController:(id)a3 sectionSettingsForSectionIdentifier:(id)a4;
- (id)notificationManagementControllerRequestsSystemSettings:(id)a3;
- (void)notificationManagementController:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementController:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementController:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementController:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementController:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8;
- (void)notificationManagementController:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6;
- (void)notificationManagementControllerDidDismissManagementView:(id)a3;
- (void)presentNotificationManagementViewType:(unint64_t)a3 forNotificationRequest:(id)a4 withPresentingViewController:(id)a5 withPresentingView:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setNotificationManagementAlertViewController:(id)a3;
@end

@implementation NCNotificationManagementViewPresenter

- (void)presentNotificationManagementViewType:(unint64_t)a3 forNotificationRequest:(id)a4 withPresentingViewController:(id)a5 withPresentingView:(id)a6
{
  id v21 = a4;
  id v10 = a5;
  id v11 = a6;
  switch(a3)
  {
    case 0uLL:
      uint64_t v12 = +[NCNotificationManagementViewController notificationManagementAlertControllerForNotificationRequest:v21 withPresentingView:v11 settingsDelegate:self];
      goto LABEL_12;
    case 1uLL:
      v14 = NCNotificationManagementPromotionAlertController;
      goto LABEL_11;
    case 2uLL:
      v14 = NCNotificationManagementDemotionAlertController;
      goto LABEL_11;
    case 3uLL:
      v13 = [[NCNotificationManagementDemotionAlertController alloc] initWithRequest:v21 withPresentingView:v11 settingsDelegate:self includeExplanation:1];
      int v15 = 0;
      goto LABEL_14;
    case 4uLL:
      v14 = NCNotificationManagementTimeSensitiveKeepAlertController;
      goto LABEL_11;
    case 5uLL:
      v14 = NCNotificationManagementTimeSensitiveTurnOffAlertController;
      goto LABEL_11;
    case 6uLL:
      v14 = NCNotificationManagementMuteAppAlertController;
      goto LABEL_11;
    case 7uLL:
      v14 = NCNotificationManagementMuteThreadAlertController;
LABEL_11:
      uint64_t v12 = [[v14 alloc] initWithRequest:v21 withPresentingView:v11 settingsDelegate:self];
LABEL_12:
      v13 = (NCNotificationManagementDemotionAlertController *)v12;
      break;
    default:
      v13 = 0;
      break;
  }
  int v15 = 1;
LABEL_14:
  v16 = [(NCNotificationManagementViewPresenter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v16 notificationManagementViewPresenterWillPresentManagementView:self];
  }
  if (v13)
  {
    if (v15)
    {
      [(NCNotificationManagementDemotionAlertController *)v13 setModalPresentationStyle:7];
      v17 = [(NCNotificationManagementDemotionAlertController *)v13 popoverPresentationController];
      [v17 setSourceView:v11];

      v18 = [(NCNotificationManagementDemotionAlertController *)v13 popoverPresentationController];
      [v11 bounds];
      objc_msgSend(v18, "setSourceRect:");

      v19 = [(NCNotificationManagementDemotionAlertController *)v13 popoverPresentationController];
      [v19 setPermittedArrowDirections:3];

      v20 = [(NCNotificationManagementDemotionAlertController *)v13 popoverPresentationController];
      [v20 setCanOverlapSourceViewRect:1];
    }
    else
    {
      [(NCNotificationManagementDemotionAlertController *)v13 setModalPresentationStyle:6];
    }
    [(NCNotificationManagementViewPresenter *)self setNotificationManagementAlertViewController:v13];
    [v10 presentViewController:v13 animated:1 completion:0];
  }
}

- (BOOL)dismissManagementViewIfPresentedAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIAlertController *)self->_notificationManagementAlertViewController presentingViewController];
  v6 = v5;
  if (v5)
  {
    [v5 dismissViewControllerAnimated:v3 completion:0];
    notificationManagementAlertViewController = [(NCNotificationManagementViewPresenter *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [notificationManagementAlertViewController notificationManagementViewPresenterDidDismissManagementView:self];
    }
  }
  else
  {
    notificationManagementAlertViewController = self->_notificationManagementAlertViewController;
    self->_notificationManagementAlertViewController = 0;
  }

  return v6 != 0;
}

- (id)notificationManagementController:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  id v5 = a4;
  v6 = [(NCNotificationManagementViewPresenter *)self delegate];
  v7 = [v6 notificationManagementViewPresenter:self sectionSettingsForSectionIdentifier:v5];

  return v7;
}

- (id)notificationManagementControllerRequestsSystemSettings:(id)a3
{
  v4 = [(NCNotificationManagementViewPresenter *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 notificationManagementViewPresenterRequestsSystemSettings:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)notificationManagementController:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = [(NCNotificationManagementViewPresenter *)self delegate];
  [v11 notificationManagementViewPresenter:self setAllowsNotifications:v7 forNotificationRequest:v10 withSectionIdentifier:v9];
}

- (void)notificationManagementController:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = [(NCNotificationManagementViewPresenter *)self delegate];
  [v11 notificationManagementViewPresenter:self setDeliverQuietly:v7 forNotificationRequest:v10 withSectionIdentifier:v9];
}

- (void)notificationManagementController:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = [(NCNotificationManagementViewPresenter *)self delegate];
  [v11 notificationManagementViewPresenter:self setAllowsCriticalAlerts:v7 forNotificationRequest:v10 withSectionIdentifier:v9];
}

- (void)notificationManagementControllerDidDismissManagementView:(id)a3
{
  id v4 = [(NCNotificationManagementViewPresenter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 notificationManagementViewPresenterDidDismissManagementView:self];
  }
}

- (void)notificationManagementController:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = [(NCNotificationManagementViewPresenter *)self delegate];
  [v11 notificationManagementViewPresenter:self setAllowsTimeSensitive:v7 forNotificationRequest:v10 withSectionIdentifier:v9];
}

- (void)notificationManagementController:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8
{
  BOOL v11 = a4;
  id v17 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  v16 = [(NCNotificationManagementViewPresenter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v16 notificationManagementViewPresenter:self setMuted:v11 untilDate:v17 forNotificationRequest:v13 withSectionIdentifier:v14 threadIdentifier:v15];
  }
}

- (void)notificationManagementController:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  BOOL v7 = a4;
  id v11 = a5;
  id v9 = a6;
  id v10 = [(NCNotificationManagementViewPresenter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 notificationManagementViewPresenter:self setScheduledDelivery:v7 forNotificationRequest:v11 withSectionIdentifier:v9];
  }
}

- (NCNotificationManagementViewPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationManagementViewPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIAlertController)notificationManagementAlertViewController
{
  return self->_notificationManagementAlertViewController;
}

- (void)setNotificationManagementAlertViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementAlertViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end