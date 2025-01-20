@interface ICQUILegacyPurchaseFlowController
- (void)beginFlowWithPresenter:(id)a3 action:(id)a4 completion:(id)a5;
- (void)manager:(id)a3 didCompleteWithError:(id)a4;
- (void)manager:(id)a3 loadDidFailWithError:(id)a4;
- (void)managerDidCancel:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation ICQUILegacyPurchaseFlowController

- (void)beginFlowWithPresenter:(id)a3 action:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "Presenting legacy cloud storage offers flow.", v21, 2u);
  }

  offerManager = self->_offerManager;
  if (!offerManager)
  {
    v13 = objc_alloc_init(ICQUICloudStorageOffersManager);
    v14 = self->_offerManager;
    self->_offerManager = v13;

    [(ICQUICloudStorageOffersManager *)self->_offerManager setDelegate:self];
    offerManager = self->_offerManager;
  }
  [(ICQUICloudStorageOffersManager *)offerManager setShouldOfferDeviceOffers:*MEMORY[0x263F5FEC8] == (void)v8];
  v15 = (void *)[v9 copy];

  id flowCompletion = self->_flowCompletion;
  self->_id flowCompletion = v15;

  id v17 = objc_alloc_init(MEMORY[0x263F25D70]);
  v18 = (UINavigationController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v17];
  navController = self->_navController;
  self->_navController = v18;

  [(UINavigationController *)self->_navController setModalPresentationStyle:2];
  [(UINavigationController *)self->_navController setModalTransitionStyle:0];
  [v10 presentViewController:self->_navController animated:1 completion:0];

  v20 = [(UINavigationController *)self->_navController presentationController];
  [v20 setDelegate:self];

  [(ICQUICloudStorageOffersManager *)self->_offerManager beginFlowWithNavigationController:self->_navController modally:0];
}

- (void)managerDidCancel:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Cloud storage offers flow did cancel.", v7, 2u);
  }

  if (self->_flowCompletion)
  {
    v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.Preferences.cloud-storage-offers" code:1 userInfo:0];
    (*((void (**)(void))self->_flowCompletion + 2))();
    id flowCompletion = self->_flowCompletion;
    self->_id flowCompletion = 0;
  }
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Cloud storage offers flow did complete with error: %@", (uint8_t *)&v11, 0xCu);
  }

  id flowCompletion = (void (**)(id, BOOL, id))self->_flowCompletion;
  if (flowCompletion)
  {
    if (v5)
    {
      id v8 = [v5 domain];
      if ([v8 isEqualToString:@"com.apple.Preferences.cloud-storage-offers"]) {
        BOOL v9 = [v5 code] == 2;
      }
      else {
        BOOL v9 = 0;
      }

      id flowCompletion = (void (**)(id, BOOL, id))self->_flowCompletion;
    }
    else
    {
      BOOL v9 = 1;
    }
    flowCompletion[2](flowCompletion, v9, v5);
    id v10 = self->_flowCompletion;
    self->_id flowCompletion = 0;
  }
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Cloud storage offers flow did fail with error: %@", (uint8_t *)&v8, 0xCu);
  }

  id flowCompletion = (void (**)(id, void, id))self->_flowCompletion;
  if (flowCompletion) {
    flowCompletion[2](flowCompletion, 0, v5);
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Legacy purchase flow was dismissed.", v5, 2u);
  }

  [(ICQUILegacyPurchaseFlowController *)self managerDidCancel:self->_offerManager];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_flowCompletion, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_offerManager, 0);
}

@end