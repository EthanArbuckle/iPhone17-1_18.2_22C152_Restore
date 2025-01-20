@interface NCNotificationRequestCustomContentProvider
- (id)customContentViewControllerForNotificationRequest:(id)a3;
@end

@implementation NCNotificationRequestCustomContentProvider

- (id)customContentViewControllerForNotificationRequest:(id)a3
{
  id v4 = a3;
  customContentViewController = self->_customContentViewController;
  if (!customContentViewController
    || (-[NCNotificationContentContainerViewController notificationRequest](customContentViewController, "notificationRequest"), v6 = objc_claimAutoreleasedReturnValue(), char v7 = [v6 isEqual:v4], v6, (v7 & 1) == 0))
  {
    v8 = [[NCNotificationContentContainerViewController alloc] initWithNotificationRequest:v4];
    v9 = self->_customContentViewController;
    self->_customContentViewController = v8;
  }
  v10 = self->_customContentViewController;

  return v10;
}

- (void).cxx_destruct
{
}

@end