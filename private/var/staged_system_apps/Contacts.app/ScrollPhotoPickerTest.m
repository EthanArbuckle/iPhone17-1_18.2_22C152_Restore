@interface ScrollPhotoPickerTest
- (BOOL)prepareForTestWithOptions:(id)a3;
- (CNTestNavigationControllerDelegate)navControllerDelegate;
- (void)didShow:(id)a3;
- (void)editAndScrollContactViewController:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)prepareForNextTest;
- (void)resetDelegate;
- (void)setNavControllerDelegate:(id)a3;
@end

@implementation ScrollPhotoPickerTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ScrollPhotoPickerTest;
  BOOL v5 = [(ContactsTest *)&v32 prepareForTestWithOptions:v4];
  if (v5)
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
      v29[2] = sub_10000C6E0;
      v29[3] = &unk_10001C510;
      objc_copyWeak(&v30, &location);
      v12 = +[CNTestNavigationControllerDelegate delegateWithDelegate:v11 willShowViewControllerHandler:0 didShowViewControllerHandler:v29];
      [(ScrollPhotoPickerTest *)self setNavControllerDelegate:v12];

      v13 = [(ScrollPhotoPickerTest *)self navControllerDelegate];
      [v10 setDelegate:v13];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      [v8 setDelegate:self];
    }
    v14 = [v4 objectForKey:@"scrollMemberAtIndex"];
    signed int v15 = [v14 intValue];

    v16 = [(ContactsTest *)self contactNavigationController];
    v17 = [v16 dataSource];
    v18 = [v17 contacts];
    v19 = [v18 objectAtIndexedSubscript:v15];

    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_10000C73C;
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
  [(ScrollPhotoPickerTest *)self resetDelegate];
  v3.receiver = self;
  v3.super_class = (Class)ScrollPhotoPickerTest;
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
    v6 = [(ScrollPhotoPickerTest *)self navControllerDelegate];
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
    [(ScrollPhotoPickerTest *)self editAndScrollContactViewController:v7];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)editAndScrollContactViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 contentViewController];
  [v5 toggleEditing:0];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000CAC0;
  v8[3] = &unk_10001C538;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
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