@interface PKPaymentPassActionGroupDataController
- (PKPaymentPassActionGroupDataController)initWithPass:(id)a3 actionGroups:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6;
- (UIViewController)viewController;
- (void)remoteGroupActionsViewControllerDidCancel:(id)a3;
- (void)remoteGroupActionsViewControllerDidPerformFetchActionGroup:(id)a3;
- (void)remoteGroupActionsViewControllerDidPerformPayment:(id)a3;
- (void)selectActionGroupViewControllerDidCancel:(id)a3;
- (void)selectActionGroupViewControllerDidPerformFetchActionGroup:(id)a3;
@end

@implementation PKPaymentPassActionGroupDataController

- (PKPaymentPassActionGroupDataController)initWithPass:(id)a3 actionGroups:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentPassActionGroupDataController;
  v15 = [(PKPaymentPassActionGroupDataController *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pass, a3);
    objc_storeStrong((id *)&v16->_actionGroups, a4);
    objc_storeStrong((id *)&v16->_paymentDataProvider, a5);
    objc_storeStrong((id *)&v16->_webService, a6);
  }

  return v16;
}

- (UIViewController)viewController
{
  NSUInteger v3 = [(NSArray *)self->_actionGroups count];
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = [(NSArray *)self->_actionGroups firstObject];
      v5 = [[PKRemoteActionGroupViewController alloc] initWithPass:self->_pass actionGroup:v4 paymentDataProvider:self->_paymentDataProvider webService:self->_webService];
      [(PKRemoteActionGroupViewController *)v5 setDelegate:self];
    }
    else
    {
      v5 = [[PKSelectActionGroupViewController alloc] initWithPass:self->_pass actionGroups:self->_actionGroups paymentDataProvider:self->_paymentDataProvider webService:self->_webService];
      [(PKRemoteActionGroupViewController *)v5 setDelegate:self];
    }
  }
  else
  {
    v5 = 0;
  }

  return (UIViewController *)v5;
}

- (void)remoteGroupActionsViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v5 = [v3 navigationController];

  id v4 = (id)[v5 popViewControllerAnimated:0];
}

- (void)remoteGroupActionsViewControllerDidPerformFetchActionGroup:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v5 = [v3 navigationController];

  id v4 = (id)[v5 popViewControllerAnimated:0];
}

- (void)remoteGroupActionsViewControllerDidPerformPayment:(id)a3
{
  id v5 = a3;
  id v3 = [v5 navigationController];
  id v4 = (id)[v3 popViewControllerAnimated:0];

  [v5 setDelegate:0];
}

- (void)selectActionGroupViewControllerDidCancel:(id)a3
{
  id v5 = a3;
  id v3 = [v5 navigationController];
  id v4 = (id)[v3 popViewControllerAnimated:0];

  [v5 setDelegate:0];
}

- (void)selectActionGroupViewControllerDidPerformFetchActionGroup:(id)a3
{
  id v5 = a3;
  id v3 = [v5 navigationController];
  id v4 = (id)[v3 popViewControllerAnimated:0];

  [v5 setDelegate:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_actionGroups, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end