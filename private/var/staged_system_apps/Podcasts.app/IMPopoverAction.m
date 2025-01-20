@interface IMPopoverAction
- (void)dealloc;
- (void)dismissPopover;
- (void)showViewController:(id)a3 inPopoverFromButton:(id)a4;
- (void)updatePopover;
@end

@implementation IMPopoverAction

- (void)showViewController:(id)a3 inPopoverFromButton:(id)a4
{
  v6 = (UIViewController *)a3;
  [(IMPopoverPresentationAction *)self setPresentingButton:a4];
  v7 = [(IMAction *)self controller];
  id v11 = [v7 delegate];

  [(UIViewController *)v6 setModalPresentationStyle:7];
  [v11 presentViewController:v6 animated:1 completion:0];
  viewControllerPresentedInPopover = self->_viewControllerPresentedInPopover;
  self->_viewControllerPresentedInPopover = v6;
  v9 = v6;

  v10 = [(UIViewController *)v9 popoverPresentationController];

  [v10 setPermittedArrowDirections:3];
  [v10 setDelegate:self];
}

- (void)dealloc
{
  [(IMPopoverAction *)self dismissPopover];
  v3.receiver = self;
  v3.super_class = (Class)IMPopoverAction;
  [(IMPopoverAction *)&v3 dealloc];
}

- (void)dismissPopover
{
  viewControllerPresentedInPopover = self->_viewControllerPresentedInPopover;
  if (viewControllerPresentedInPopover)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A399C;
    block[3] = &unk_10054D570;
    v7 = viewControllerPresentedInPopover;
    v4 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v5 = self->_viewControllerPresentedInPopover;
    self->_viewControllerPresentedInPopover = 0;
  }
}

- (void)updatePopover
{
  objc_super v3 = self->_viewControllerPresentedInPopover;
  uint64_t v4 = [(UIViewController *)v3 presentingViewController];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(UIViewController *)v3 presentingViewController];
    v7 = [v6 traitCollection];
    id v8 = [v7 horizontalSizeClass];

    if (v8 != (id)1)
    {
      objc_initWeak(&location, self);
      v9 = [(IMAction *)self controller];
      v10 = [v9 delegate];

      id v11 = [(UIViewController *)v3 presentingViewController];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000A3BB4;
      v13[3] = &unk_10054F658;
      id v12 = v10;
      id v14 = v12;
      v15 = v3;
      objc_copyWeak(&v16, &location);
      [v11 dismissViewControllerAnimated:0 completion:v13];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (void).cxx_destruct
{
}

@end