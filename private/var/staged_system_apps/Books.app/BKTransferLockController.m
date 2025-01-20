@interface BKTransferLockController
- (BKAcquireSlotRequest)acquireSlotRequest;
- (UIViewController)presentingViewController;
- (id)completion;
- (void)_handleTransferLockError:(id)a3;
- (void)_showTransferLockBackOffAlert;
- (void)resolveTransferLockWithPresentingViewController:(id)a3 completion:(id)a4;
- (void)setAcquireSlotRequest:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation BKTransferLockController

- (void)resolveTransferLockWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BKTransferLockController *)self setPresentingViewController:v6];
  [(BKTransferLockController *)self setCompletion:v7];
  objc_initWeak(&location, self);
  v8 = objc_alloc_init(BKAcquireSlotRequest);
  [(BKTransferLockController *)self setAcquireSlotRequest:v8];

  v9 = [(BKTransferLockController *)self acquireSlotRequest];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E1F2C;
  v10[3] = &unk_100A44C38;
  objc_copyWeak(&v11, &location);
  [v9 performRequestWithResponseHandler:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_handleTransferLockError:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 userInfo];
  id v6 = BUDynamicCast();

  if ([v4 code] == (id)2
    && +[BKAcquireSlotDialogResponse isDialogResponse:v6])
  {
    objc_initWeak(&location, self);
    id v7 = [[BKAcquireSlotDialogResponse alloc] initWithDialogDictionary:v6];
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_1000E236C;
    v15 = &unk_100A465F0;
    objc_copyWeak(&v16, &location);
    v8 = [(BKAcquireSlotDialogResponse *)v7 createTransferDialogWithCompletion:&v12];
    if (v8)
    {
      v9 = [(BKTransferLockController *)self presentingViewController];
      [v9 presentViewController:v8 animated:1 completion:0];
    }
    else
    {
      v10 = sub_1000EBDE8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create transfer dialog from response: %@", buf, 0xCu);
      }

      uint64_t v11 = [(BKTransferLockController *)self completion];
      v9 = (void *)v11;
      if (v11) {
        (*(void (**)(uint64_t))(v11 + 16))(v11);
      }
      [(BKTransferLockController *)self setCompletion:0];
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else if ([v4 code] == (id)3)
  {
    [(BKTransferLockController *)self _showTransferLockBackOffAlert];
  }
}

- (void)_showTransferLockBackOffAlert
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"Couldn’t Play Audiobook" value:&stru_100A70340 table:0];

  LODWORD(v3) = _os_feature_enabled_impl();
  v5 = +[NSBundle mainBundle];
  id v6 = v5;
  if (v3) {
    CFStringRef v7 = @"You’re using an Apple Account different than the one associated with this device. Try again later.";
  }
  else {
    CFStringRef v7 = @"You’re using an Apple ID different than the one associated with this device. Try again later.";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_100A70340 table:0];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"OK" value:&stru_100A70340 table:0];

  uint64_t v11 = +[UIAlertController alertControllerWithTitle:v4 message:v8 preferredStyle:1];
  objc_initWeak(&location, self);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1000E2834;
  v17 = &unk_100A46618;
  objc_copyWeak(&v18, &location);
  v12 = +[UIAlertAction actionWithTitle:v10 style:1 handler:&v14];
  [v11 addAction:v12, v14, v15, v16, v17];

  uint64_t v13 = [(BKTransferLockController *)self presentingViewController];
  [v13 presentViewController:v11 animated:1 completion:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (BKAcquireSlotRequest)acquireSlotRequest
{
  return self->_acquireSlotRequest;
}

- (void)setAcquireSlotRequest:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_acquireSlotRequest, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end