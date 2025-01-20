@interface NCNotificationManagementContentProvider
- (NCNotificationManagementContentProvider)initWithNotificationRequest:(id)a3 managementDelegate:(id)a4;
- (NCNotificationManagementContentProviderDelegate)managementDelegate;
- (NCNotificationRequest)notificationRequest;
- (void)handleManageAction:(id)a3;
- (void)setManagementDelegate:(id)a3;
- (void)setNotificationRequest:(id)a3;
@end

@implementation NCNotificationManagementContentProvider

- (NCNotificationManagementContentProvider)initWithNotificationRequest:(id)a3 managementDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationManagementContentProvider;
  v9 = [(NCNotificationManagementContentProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationRequest, a3);
    objc_storeWeak((id *)&v10->_managementDelegate, v8);
  }

  return v10;
}

- (void)handleManageAction:(id)a3
{
  id v4 = a3;
  id v6 = [(NCNotificationManagementContentProvider *)self managementDelegate];
  v5 = [(NCNotificationManagementContentProvider *)self notificationRequest];
  [v6 notificationManagementContentProvider:self requestsPresentingNotificationManagementViewType:0 forNotificationRequest:v5 withPresentingView:v4];
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (void)setNotificationRequest:(id)a3
{
}

- (NCNotificationManagementContentProviderDelegate)managementDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managementDelegate);

  return (NCNotificationManagementContentProviderDelegate *)WeakRetained;
}

- (void)setManagementDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_managementDelegate);

  objc_storeStrong((id *)&self->_notificationRequest, 0);
}

@end