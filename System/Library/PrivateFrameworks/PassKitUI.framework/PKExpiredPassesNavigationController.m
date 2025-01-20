@interface PKExpiredPassesNavigationController
- (PKExpiredPassesNavigationController)init;
- (PKExpiredPassesNavigationController)initWithExistingGroupsController:(id)a3;
- (PKExpiredPassesNavigationController)initWithExistingGroupsController:(id)a3 delegate:(id)a4;
- (PKExpiredPassesViewController)expiredPassesViewController;
@end

@implementation PKExpiredPassesNavigationController

- (PKExpiredPassesNavigationController)init
{
  return [(PKExpiredPassesNavigationController *)self initWithExistingGroupsController:0 delegate:0];
}

- (PKExpiredPassesNavigationController)initWithExistingGroupsController:(id)a3
{
  return [(PKExpiredPassesNavigationController *)self initWithExistingGroupsController:a3 delegate:0];
}

- (PKExpiredPassesNavigationController)initWithExistingGroupsController:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKExpiredPassesNavigationController;
  v8 = [(PKNavigationController *)&v12 init];
  if (v8)
  {
    v9 = [[PKExpiredPassesViewController alloc] initWithExistingGroupsController:v6 delegate:v7];
    expiredPassesViewController = v8->_expiredPassesViewController;
    v8->_expiredPassesViewController = v9;

    [(PKExpiredPassesNavigationController *)v8 pushViewController:v8->_expiredPassesViewController animated:0];
  }

  return v8;
}

- (PKExpiredPassesViewController)expiredPassesViewController
{
  return self->_expiredPassesViewController;
}

- (void).cxx_destruct
{
}

@end