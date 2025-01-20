@interface ScrollContactTest
- (BOOL)prepareForTestWithOptions:(id)a3;
- (CNTestNavigationControllerDelegate)navControllerDelegate;
- (void)didShow:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)prepareForNextTest;
- (void)resetDelegate;
- (void)scrollContactViewController:(id)a3;
- (void)setNavControllerDelegate:(id)a3;
@end

@implementation ScrollContactTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ScrollContactTest;
  BOOL v5 = [(ContactsTest *)&v32 prepareForTestWithOptions:v4];
  if (v5)
  {
    if (![(ContactsTest *)self isIPad])
    {
      v6 = [(ContactsTest *)self contactSplitViewController];
      v7 = [v6 navigationControllerForPPT];

      objc_opt_class();
      id v8 = v7;
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
      id v10 = v9;

      if (v10)
      {
        objc_initWeak(&location, self);
        v11 = [v10 delegate];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000707C;
        v29[3] = &unk_10001C510;
        objc_copyWeak(&v30, &location);
        v12 = +[CNTestNavigationControllerDelegate delegateWithDelegate:v11 willShowViewControllerHandler:0 didShowViewControllerHandler:v29];
        [(ScrollContactTest *)self setNavControllerDelegate:v12];

        v13 = [(ScrollContactTest *)self navControllerDelegate];
        [v10 setDelegate:v13];

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }
      else
      {
        [v8 setDelegate:self];
      }
    }
    v14 = [v4 objectForKey:@"scrollMemberAtIndex"];
    signed int v15 = [v14 intValue];

    v16 = [(ContactsTest *)self contactNavigationController];
    v17 = [v16 dataSource];
    v18 = [v17 contacts];
    v19 = [v18 objectAtIndexedSubscript:v15];

    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_1000070D8;
    v26 = &unk_10001C538;
    v27 = self;
    id v28 = v19;
    id v20 = v19;
    v21 = objc_retainBlock(&v23);
    -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v21, v23, v24, v25, v26, v27);
  }
  return v5;
}

- (void)prepareForNextTest
{
  [(ScrollContactTest *)self resetDelegate];
  v3.receiver = self;
  v3.super_class = (Class)ScrollContactTest;
  [(ContactsTest *)&v3 prepareForNextTest];
}

- (void)resetDelegate
{
  objc_super v3 = [(ContactsTest *)self contactSplitViewController];
  id v9 = [v3 navigationControllerForPPT];

  id v4 = [(ContactsTest *)self contactNavigationController];

  BOOL v5 = v9;
  if (v9 == v4)
  {
    v6 = [(ScrollContactTest *)self navControllerDelegate];
    v7 = [v6 delegate];
    id v8 = [(ContactsTest *)self contactNavigationController];
    [v8 setDelegate:v7];

    BOOL v5 = v9;
  }
}

- (void)didShow:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v10 = v4;
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = v10;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  v7 = v10;
  if (v6
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ((objc_opt_class(),
         [v10 topViewController],
         v7 = objc_claimAutoreleasedReturnValue(),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (id v8 = 0)
      : (id v8 = v7),
        id v9 = v8,
        v7,
        v9))
  {
    [(ScrollContactTest *)self scrollContactViewController:v7];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)scrollContactViewController:(id)a3
{
  id v4 = [a3 contentViewController];
  BOOL v5 = [v4 contactView];

  dispatch_time_t v6 = dispatch_time(0, 500000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000745C;
  v8[3] = &unk_10001C538;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);
}

- (CNTestNavigationControllerDelegate)navControllerDelegate
{
  return self->_navControllerDelegate;
}

- (void)setNavControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end