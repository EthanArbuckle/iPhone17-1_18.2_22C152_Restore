@interface NotificationViewController
- (CGSize)calculatePreferredContentSize;
- (ConcreteContentAvailableViewController)presentedContentViewController;
- (void)didReceiveNotification:(id)a3;
@end

@implementation NotificationViewController

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  v5 = [(NotificationViewController *)self presentedContentViewController];

  if (!v5)
  {
    v6 = +[UIColor appTintColor];
    v7 = [(NotificationViewController *)self view];
    [v7 setTintColor:v6];

    v8 = +[NotificationViewControllerFactory contentAvailableViewControllerForNotification:v4];
    [v8 loadViewIfNeeded];
    v9 = [(NotificationViewController *)self extensionContext];
    v10 = [v9 notificationActions];
    v11 = [v8 actionsWithDefaultActions:v10];

    if (v11)
    {
      v12 = [(NotificationViewController *)self extensionContext];
      [v12 setNotificationActions:v11];
    }
    if (v8)
    {
      v13 = [(NotificationViewController *)self view];
      [v8 view];
      v14 = v29 = v11;
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(NotificationViewController *)self addChildViewController:v8];
      [v13 addSubview:v14];
      [v8 didMoveToParentViewController:self];
      v28 = [v13 topAnchor];
      v27 = [v14 topAnchor];
      v26 = [v28 constraintEqualToAnchor:v27];
      v30[0] = v26;
      v25 = [v13 leadingAnchor];
      v24 = [v14 leadingAnchor];
      v23 = [v25 constraintEqualToAnchor:v24];
      v30[1] = v23;
      v22 = [v13 bottomAnchor];
      v15 = [v14 bottomAnchor];
      v16 = [v22 constraintEqualToAnchor:v15];
      v30[2] = v16;
      v17 = [v13 trailingAnchor];
      [v14 trailingAnchor];
      v19 = id v18 = v4;
      v20 = [v17 constraintEqualToAnchor:v19];
      v30[3] = v20;
      v21 = +[NSArray arrayWithObjects:v30 count:4];

      id v4 = v18;
      +[NSLayoutConstraint activateConstraints:v21];
      objc_storeStrong((id *)&self->_presentedContentViewController, v8);

      v11 = v29;
    }
  }
}

- (CGSize)calculatePreferredContentSize
{
  v3 = [(NotificationViewController *)self presentedContentViewController];
  id v4 = [v3 view];
  [v4 bounds];
  double v6 = v5;

  double height = UILayoutFittingCompressedSize.height;
  v8 = [(NotificationViewController *)self presentedContentViewController];
  v9 = [v8 view];
  [v9 systemLayoutSizeFittingSize:v6 height];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.width = v14;
  return result;
}

- (ConcreteContentAvailableViewController)presentedContentViewController
{
  return self->_presentedContentViewController;
}

- (void).cxx_destruct
{
}

@end