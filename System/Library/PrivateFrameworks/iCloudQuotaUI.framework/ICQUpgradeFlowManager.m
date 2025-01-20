@interface ICQUpgradeFlowManager
+ (BOOL)shouldShowForOffer:(id)a3;
+ (BOOL)shouldSubclassShowForOffer:(id)a3;
+ (NSMutableArray)activeFlowManagers;
+ (void)addActiveFlowManager:(id)a3;
+ (void)flowManagerWithJourneyId:(id)a3 params:(id)a4 completion:(id)a5;
+ (void)needsToRunWithCompletion:(id)a3;
+ (void)removeActiveFlowManager:(id)a3;
- (AAUIRemoteUIController)remoteUIController;
- (BOOL)_shouldPresentLiftUIFlow;
- (BOOL)_shouldPresentRemoteFlow;
- (BOOL)completedFamilySetup;
- (BOOL)isLiftUIFlow;
- (BOOL)needsNetwork;
- (BOOL)shouldNavigationControllerBeDismissed;
- (ICQAlertController)upgradeAlertController;
- (ICQLiftUIPresenter)liftUIPresenter;
- (ICQLink)icqLink;
- (ICQOffer)offer;
- (ICQUIOSLOPresenter)osloPresenter;
- (ICQUIRemoteUIPresenter)remoteUIPresenter;
- (ICQUpgradeFlowManager)init;
- (ICQUpgradeFlowManager)initWithJourneyId:(id)a3;
- (ICQUpgradeFlowManager)initWithJourneyId:(id)a3 params:(id)a4;
- (ICQUpgradeFlowManager)initWithOffer:(id)a3;
- (ICQUpgradeFlowManagerDelegate)delegate;
- (ICQUpgradeFlowOptions)flowOptions;
- (NSArray)serverHooks;
- (NSData)preloadedRemoteUIData;
- (NSDictionary)bindings;
- (NSString)closeURL;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (NSURL)serverUIURL;
- (UINavigationController)hostingNavigationController;
- (icq_signpost_s)loadLiftUISignpost;
- (icq_signpost_s)loadRemoteUISignpost;
- (id)_allowedInProcessClients;
- (id)_navControllerWithRootVC:(id)a3;
- (id)addParams:(id)a3 toJourneyURL:(id)a4;
- (id)initBaseclassWithOffer:(id)a3;
- (id)presentationContext;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)_addAlertActionForAlertSpec:(id)a3 buttonIndex:(int64_t)a4;
- (void)_beginRemoteFlowWithURL:(id)a3;
- (void)_beginRemoteFlowWithViewController:(id)a3;
- (void)_cancelFlow;
- (void)_clearBusyOfferViewController;
- (void)_configurePresentingViewController:(id)a3;
- (void)_configurePresentingViewController:(id)a3 andPresentedViewController:(id)a4;
- (void)_configurePresentingViewController:(id)a3 preloadedRemoteUIData:(id)a4;
- (void)_handleRemoteUIActionWithURLString:(id)a3 httpMethod:(id)a4;
- (void)_initiateFamilySetupFlow;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4;
- (void)_presentLiftUIInParentViewController:(id)a3;
- (void)_presentLiftUIUsingViewController:(id)a3;
- (void)_presentPageWithSpecification:(id)a3;
- (void)_presentRemoteUIUsingViewController:(id)a3;
- (void)_presentRemoteUIUsingViewController:(id)a3 withData:(id)a4;
- (void)_presentRemoteViewWithData:(id)a3 andRequest:(id)a4;
- (void)_presentUpgradeComplete;
- (void)_sendDelegateCancel;
- (void)_sendDelegateComplete;
- (void)_sendDelegateDidPresentViewController:(id)a3;
- (void)_sendDelegateLoadError:(id)a3;
- (void)_setBusyOfferViewController:(id)a3;
- (void)_simulateDoneButton;
- (void)_tappedAlertLink:(id)a3;
- (void)beginFlowWithPresentingViewController:(id)a3;
- (void)beginJourney;
- (void)beginOSLOFlowWithPresentingViewController:(id)a3;
- (void)beginPostPurchaseFlowWithLink:(id)a3 offer:(id)a4;
- (void)beginRemoteUpgradeFlowWithICQLink:(id)a3;
- (void)beginRemoteUpgradeFlowWithICQLink:(id)a3 presenter:(id)a4;
- (void)dismissNavigationControllerAnimated:(BOOL)a3 success:(BOOL)a4 completion:(id)a5;
- (void)dismissObjectModelsAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissUpgradeFlowWithSuccess:(BOOL)a3;
- (void)liftUIPresenter:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5;
- (void)liftUIPresenter:(id)a3 performAction:(int64_t)a4 parameters:(id)a5 completion:(id)a6;
- (void)liftUIPresenterDidCancel:(id)a3;
- (void)liftUIPresenterDidComplete:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presentFlowHostedInNavigationController:(id)a3;
- (void)presentHostingNavigationController;
- (void)presentRemoteViewWithData:(id)a3 andURL:(id)a4;
- (void)purchaseFlowCompletedWith:(BOOL)a3 error:(id)a4;
- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4;
- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)remoteUIControllerDidDismiss:(id)a3;
- (void)remoteUIFlowManager:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5;
- (void)sender:(id)a3 action:(int64_t)a4 parameters:(id)a5;
- (void)setBindings:(id)a3;
- (void)setCloseURL:(id)a3;
- (void)setCompletedFamilySetup:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowOptions:(id)a3;
- (void)setHostingNavigationController:(id)a3;
- (void)setIcqLink:(id)a3;
- (void)setLiftUIPresenter:(id)a3;
- (void)setLoadLiftUISignpost:(icq_signpost_s)a3;
- (void)setLoadRemoteUISignpost:(icq_signpost_s)a3;
- (void)setOsloPresenter:(id)a3;
- (void)setPreloadedRemoteUIData:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setRemoteUIController:(id)a3;
- (void)setRemoteUIPresenter:(id)a3;
- (void)setServerHooks:(id)a3;
- (void)setShouldNavigationControllerBeDismissed:(BOOL)a3;
- (void)setUpgradeAlertController:(id)a3;
- (void)showNetworkFailurePage;
- (void)showUpgradeFailurePage;
- (void)startFlowWithParentViewController:(id)a3;
@end

@implementation ICQUpgradeFlowManager

- (ICQUpgradeFlowManager)init
{
  v3 = [MEMORY[0x263F88928] sharedOfferManager];
  v4 = [v3 currentOffer];
  v5 = [(ICQUpgradeFlowManager *)self initWithOffer:v4];

  return v5;
}

- (ICQUpgradeFlowManager)initWithOffer:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICQUpgradeFlowManager;
  v5 = [(ICQUpgradeFlowManager *)&v14 init];
  if (v5)
  {
    v6 = v5;
    v7 = [v4 upgradeFlowSpecification];
    uint64_t v8 = [v7 offerType];

    v9 = +[ICQUIUpgradeFlowFactory flowManagerClassForOfferType:v8];
    if (v9)
    {
      v10 = (ICQUpgradeFlowManager *)[[v9 alloc] initSubclassWithOffer:v4];
    }
    else
    {
      v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = _ICQStringForOfferType();
        *(_DWORD *)buf = 138543362;
        v16 = v12;
        _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "Unable to locate correct subclass for flow type %{public}@", buf, 0xCu);
      }
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)initBaseclassWithOffer:(id)a3
{
  v27[7] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ICQUpgradeFlowManager;
  v6 = [(ICQUpgradeFlowManager *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_offer, a3);
    uint64_t v8 = [[ICQUpgradeStorageHook alloc] initWithOffer:v7->_offer flowDelegate:v7];
    upgradeStorageHook = v7->_upgradeStorageHook;
    v7->_upgradeStorageHook = v8;

    v10 = [[ICQBundlesHook alloc] initWithFlowManager:v7];
    v27[0] = v10;
    v11 = [[ICQFamilySharingHook alloc] initWithFlowDelegate:v7];
    v27[1] = v11;
    v12 = objc_alloc_init(ICQUpgradePhotosCloudEnableHook);
    v27[2] = v12;
    v13 = objc_alloc_init(ICQUpgradePhotosOptimizeEnableHook);
    v27[3] = v13;
    objc_super v14 = objc_alloc_init(ICQUIManageSubHook);
    v27[4] = v14;
    v27[5] = v7->_upgradeStorageHook;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    v15 = (void *)getFALaunchServicesHookClass_softClass;
    uint64_t v26 = getFALaunchServicesHookClass_softClass;
    if (!getFALaunchServicesHookClass_softClass)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __getFALaunchServicesHookClass_block_invoke;
      v22[3] = &unk_264921E58;
      v22[4] = &v23;
      __getFALaunchServicesHookClass_block_invoke((uint64_t)v22);
      v15 = (void *)v24[3];
    }
    v16 = v15;
    _Block_object_dispose(&v23, 8);
    id v17 = objc_alloc_init(v16);
    v27[6] = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:7];
    serverHooks = v7->_serverHooks;
    v7->_serverHooks = (NSArray *)v18;
  }
  return v7;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, a3);
  id v5 = a3;
  [(ICQUpgradeStorageHook *)self->_upgradeStorageHook setPresentingSceneIdentifier:self->_presentingSceneIdentifier];
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, a3);
  id v5 = a3;
  [(ICQUpgradeStorageHook *)self->_upgradeStorageHook setPresentingSceneBundleIdentifier:self->_presentingSceneBundleIdentifier];
}

- (NSURL)serverUIURL
{
  v3 = [(ICQUpgradeFlowManager *)self icqLink];
  id v4 = [v3 actionURL];

  if (v4)
  {
    id v5 = [(ICQUpgradeFlowManager *)self icqLink];
    uint64_t v6 = [v5 actionURL];
LABEL_5:
    v9 = (void *)v6;

    goto LABEL_6;
  }
  v7 = [(ICQUpgradeFlowManager *)self offer];
  uint64_t v8 = [v7 serverUIURL];

  if (v8)
  {
    id v5 = [(ICQUpgradeFlowManager *)self offer];
    uint64_t v6 = [v5 serverUIURL];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_6:
  return (NSURL *)v9;
}

+ (BOOL)shouldShowForOffer:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 upgradeFlowSpecification];
  if (v4)
  {
    uint64_t v5 = [v3 level];

    if (v5)
    {
      id v4 = [v3 upgradeFlowSpecification];
      uint64_t v6 = [v4 offerType];

      v7 = +[ICQUIUpgradeFlowFactory flowManagerClassForOfferType:v6];
      LODWORD(v4) = [(objc_class *)v7 shouldSubclassShowForOffer:v3];
      uint64_t v8 = _ICQGetLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = NSStringFromClass(v7);
        v10 = (void *)v9;
        v11 = @"NO";
        if (v4) {
          v11 = @"YES";
        }
        int v13 = 138412546;
        uint64_t v14 = v9;
        __int16 v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "+[%@ shouldShowForOffer:] == %@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

- (void)_tappedAlertLink:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 text];
    [v4 action];
    v7 = _ICQStringForAction();
    uint64_t v8 = [v4 parameters];
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v6;
    __int16 v26 = 2114;
    v27 = v7;
    __int16 v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "tapped %{public}@ button; action:%{public}@ parameters:%@",
      buf,
      0x20u);
  }
  uint64_t v9 = [v4 parameters];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F88810]];

  if (v10)
  {
    v11 = [MEMORY[0x263F88928] sharedOfferManager];
    v12 = [(ICQUpgradeFlowManager *)self offer];
    int v13 = [v12 offerId];
    [v11 updateOfferId:v13 buttonId:v10 info:0 completion:0];
  }
  uint64_t v14 = [v4 action];
  char v15 = v14 - 100;
  if ((unint64_t)(v14 - 100) > 0x12) {
    goto LABEL_10;
  }
  if (((1 << v15) & 0x711F8) != 0)
  {
LABEL_7:
    v16 = [v4 parameters];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke;
    v23[3] = &unk_264921C58;
    v23[4] = self;
    [(ICQUpgradeFlowManager *)self _performPageButtonActionWithParameters:v16 completion:v23];

    goto LABEL_15;
  }
  if (((1 << v15) & 0x205) != 0)
  {
LABEL_11:
    uint64_t v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      [v4 action];
      uint64_t v18 = _ICQStringForAction();
      v19 = [v4 parameters];
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "Alert action:%@ parameters:%@ unexpected", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (v14 == 101)
  {
LABEL_14:
    [(ICQUpgradeFlowManager *)self _sendDelegateCancel];
    goto LABEL_15;
  }
LABEL_10:
  switch(v14)
  {
    case 0:
    case 2:
    case 3:
      goto LABEL_11;
    case 1:
      goto LABEL_14;
    case 4:
      goto LABEL_7;
    case 5:
      [(ICQUpgradeFlowManager *)self _sendDelegateComplete];
      break;
    case 6:
      v20 = [v4 parameters];
      objc_super v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263F88820]];

      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke_83;
      v22[3] = &unk_264921C80;
      v22[4] = self;
      [(ICQUpgradeFlowManager *)self _openURL:v21 completion:v22];

      break;
    default:
      break;
  }
LABEL_15:
}

void __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke_2;
  block[3] = &unk_264921C30;
  char v11 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = _ICQGetLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      LOWORD(v10) = 0;
      id v5 = "button action succeeded";
      uint64_t v6 = v3;
      uint32_t v7 = 2;
LABEL_6:
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, v7);
    }
  }
  else if (v4)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543362;
    uint64_t v11 = v8;
    id v5 = "button action failed with error %{public}@";
    uint64_t v6 = v3;
    uint32_t v7 = 12;
    goto LABEL_6;
  }

  return [*(id *)(a1 + 40) _sendDelegateComplete];
}

uint64_t __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke_83(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDelegateComplete];
}

- (void)_addAlertActionForAlertSpec:(id)a3 buttonIndex:(int64_t)a4
{
  id v6 = a3;
  uint32_t v7 = [v6 linkForButtonIndex:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = (void *)MEMORY[0x263F82400];
    int v10 = [v7 text];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __65__ICQUpgradeFlowManager__addAlertActionForAlertSpec_buttonIndex___block_invoke;
    char v15 = &unk_264921CA8;
    v16 = self;
    id v17 = v8;
    uint64_t v11 = [v9 actionWithTitle:v10 style:0 handler:&v12];

    if (v11)
    {
      -[ICQAlertController addAction:](self->_upgradeAlertController, "addAction:", v11, v12, v13, v14, v15, v16);
      if ([v6 defaultButtonIndex] == a4) {
        [(ICQAlertController *)self->_upgradeAlertController setPreferredAction:v11];
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
}

uint64_t __65__ICQUpgradeFlowManager__addAlertActionForAlertSpec_buttonIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tappedAlertLink:*(void *)(a1 + 40)];
}

- (void)beginRemoteUpgradeFlowWithICQLink:(id)a3
{
}

- (void)beginRemoteUpgradeFlowWithICQLink:(id)a3 presenter:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(ICQUpgradeFlowManager *)self setIcqLink:v6];
  uint64_t v8 = [(ICQUpgradeFlowManager *)self offer];
  id v9 = [v6 actionURL];
  [v8 _updateRequestedServerUIURLWithURL:v9];

  int v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(ICQUpgradeFlowManager *)self offer];
    [v11 action];
    uint64_t v12 = _ICQStringForAction();
    [v6 action];
    uint64_t v13 = _ICQStringForAction();
    int v15 = 136315650;
    v16 = "-[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:presenter:]";
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "%s: Overriding offer action %@ with link action %@", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v14 = [(ICQUpgradeFlowManager *)self offer];
  objc_msgSend(v14, "updateOfferWithAction:", objc_msgSend(v6, "action"));

  [(ICQUpgradeFlowManager *)self _beginRemoteFlowWithViewController:v7];
}

- (void)_beginRemoteFlowWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQUpgradeFlowManager *)self offer];
  [v5 _updateRequestedServerUIURLWithURL:v4];

  [(ICQUpgradeFlowManager *)self _beginRemoteFlowWithViewController:0];
}

- (void)_beginRemoteFlowWithViewController:(id)a3
{
  id v4 = a3;
  id v15 = +[ICQUIOutOfProcessUpgradeFlowManager sharedManager];
  id v5 = [(ICQUpgradeFlowManager *)self delegate];
  [v15 setDelegate:v5];

  id v6 = [(ICQUpgradeFlowManager *)self flowOptions];
  [v15 setFlowOptions:v6];

  id v7 = [(ICQUpgradeFlowManager *)self offer];
  [v15 setOffer:v7];

  uint64_t v8 = [(ICQUpgradeFlowManager *)self icqLink];
  [v15 setLink:v8];

  [v15 setFlowManager:self];
  id v9 = [v4 view];
  int v10 = [v9 window];
  uint64_t v11 = [v10 windowScene];
  uint64_t v12 = [v11 _sceneIdentifier];
  [v15 setPresentingSceneIdentifier:v12];

  uint64_t v13 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v14 = [v13 bundleIdentifier];
  [v15 setPresentingSceneBundleIdentifier:v14];

  [v15 beginFlowWithViewController:v4];
}

- (void)beginFlowWithPresentingViewController:(id)a3
{
  id v4 = a3;
  if ([(ICQUpgradeFlowManager *)self _shouldPresentRemoteFlow]) {
    [(ICQUpgradeFlowManager *)self _beginRemoteFlowWithViewController:v4];
  }
  else {
    [(ICQUpgradeFlowManager *)self _configurePresentingViewController:v4];
  }
}

- (void)_configurePresentingViewController:(id)a3 andPresentedViewController:(id)a4
{
  id v6 = (UIViewController *)a3;
  objc_storeStrong((id *)&self->_hostingNavigationController, a4);
  id v7 = a4;
  [(UINavigationController *)self->_hostingNavigationController setDelegate:self];
  uint64_t v8 = [(UINavigationController *)self->_hostingNavigationController navigationBar];
  id v9 = [(ICQUpgradeFlowManager *)self flowOptions];
  int v10 = [v9 navigationBarTintColor];
  [v8 setTintColor:v10];

  self->_shouldNavigationControllerBeDismissed = 1;
  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = v6;
  uint64_t v12 = v6;

  [(UINavigationController *)self->_hostingNavigationController addBlurEffect];
  id v14 = [(ICQUpgradeFlowManager *)self offer];
  uint64_t v13 = [v14 requestedServerUIURL];
  [(ICQUpgradeFlowManager *)self presentRemoteViewWithData:0 andURL:v13];
}

- (void)_configurePresentingViewController:(id)a3
{
}

- (void)_configurePresentingViewController:(id)a3 preloadedRemoteUIData:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (![(ICQUpgradeFlowManager *)self _shouldPresentLiftUIFlow])
  {
    id v9 = [(ICQUpgradeFlowManager *)self offer];
    int v10 = [v9 upgradeFlowSpecification];

    uint64_t v11 = [(ICQUpgradeFlowManager *)self offer];
    uint64_t v12 = [v11 alertSpecificationAtIndex:0];
    [v10 setStartAlert:v12];

    if (v8)
    {
      uint64_t v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(ICQUpgradeFlowManager *)self offer];
        id v15 = [v14 requestedServerUIURL];
        *(_DWORD *)buf = 138412290;
        v74 = v15;
        _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "presenting remoteUI URL %@ with preloaded data", buf, 0xCu);
      }
      v16 = self;
      id v17 = v7;
      id v18 = v8;
    }
    else
    {
      __int16 v19 = [(ICQUpgradeFlowManager *)self offer];
      v20 = [v19 requestedServerUIURL];

      if (!v20)
      {
        v24 = [v10 startPage];

        if (v24)
        {
          uint64_t v25 = _ICQGetLogSystem();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C821000, v25, OS_LOG_TYPE_DEFAULT, "presenting start page", buf, 2u);
          }

          __int16 v26 = [(ICQUpgradeFlowManager *)self offer];
          v27 = [v26 serverUIURL];

          if (v27)
          {
            __int16 v28 = [(ICQUpgradeFlowManager *)self offer];
            v29 = [v28 bundleIdentifier];
            int v30 = [v29 isEqualToString:@"com.apple.icq"];

            if (v30)
            {
              objc_storeStrong((id *)&self->_hostingNavigationController, a3);
              [(UINavigationController *)self->_hostingNavigationController setDelegate:self];
              v31 = [(UINavigationController *)self->_hostingNavigationController navigationBar];
              v32 = [(ICQUpgradeFlowManager *)self flowOptions];
              v33 = [v32 navigationBarTintColor];
              [v31 setTintColor:v33];

              self->_shouldNavigationControllerBeDismissed = 1;
            }
            else
            {
              v54 = (void *)[objc_alloc(MEMORY[0x263F25D70]) initWithNibName:0 bundle:0];
              v55 = [(ICQUpgradeFlowManager *)self _navControllerWithRootVC:v54];
              hostingNavigationController = self->_hostingNavigationController;
              self->_hostingNavigationController = v55;

              v57 = [(UINavigationController *)self->_hostingNavigationController navigationBar];
              v58 = [(ICQUpgradeFlowManager *)self flowOptions];
              v59 = [v58 navigationBarTintColor];
              [v57 setTintColor:v59];

              if ([(ICQOffer *)self->_offer action] == 118)
              {
                v60 = _ICQGetLogSystem();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v74 = "-[ICQUpgradeFlowManager _configurePresentingViewController:preloadedRemoteUIData:]";
                  _os_log_impl(&dword_22C821000, v60, OS_LOG_TYPE_DEFAULT, "%s, Detected action direct to oslo, skipping presentation and saving presenting view controller", buf, 0xCu);
                }

                objc_storeStrong((id *)&self->_presentingViewController, a3);
              }
              else
              {
                self->_shouldNavigationControllerBeDismissed = 1;
                [v7 presentPreferredSizeWithViewController:self->_hostingNavigationController animated:1 completion:0];
              }
            }
            [(UINavigationController *)self->_hostingNavigationController addBlurEffect];
            [(ICQUpgradeFlowManager *)self presentRemoteViewWithData:0 andURL:v27];
          }
          else
          {
            v42 = _ICQGetLogSystem();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22C821000, v42, OS_LOG_TYPE_DEFAULT, "presenting native view", buf, 2u);
            }

            [(id)objc_opt_class() addActiveFlowManager:self];
            v43 = [ICQViewController alloc];
            v44 = [v10 startPage];
            v45 = [(ICQViewController *)v43 initWithPageSpecification:v44];

            v46 = [(ICQUpgradeFlowManager *)self flowOptions];
            v47 = [v46 buttonTintColor];
            [(ICQViewController *)v45 setButtonTintColor:v47];

            v48 = [(ICQUpgradeFlowManager *)self offer];
            v49 = [v48 bundleIdentifier];
            int v50 = [v49 isEqualToString:@"com.apple.icq"];

            if (v50)
            {
              objc_storeStrong((id *)&self->_hostingNavigationController, a3);
              [(UINavigationController *)self->_hostingNavigationController addBlurEffect];
              [(UINavigationController *)self->_hostingNavigationController setDelegate:self];
              v51 = [(UINavigationController *)self->_hostingNavigationController navigationBar];
              v52 = [(ICQUpgradeFlowManager *)self flowOptions];
              v53 = [v52 navigationBarTintColor];
              [v51 setTintColor:v53];

              self->_shouldNavigationControllerBeDismissed = 1;
              [(UINavigationController *)self->_hostingNavigationController pushViewController:v45 animated:0];
              [(ICQUpgradeFlowManager *)self _sendDelegateDidPresentViewController:v45];
            }
            else
            {
              v65 = [(ICQUpgradeFlowManager *)self _navControllerWithRootVC:v45];
              v66 = self->_hostingNavigationController;
              self->_hostingNavigationController = v65;

              [(UINavigationController *)self->_hostingNavigationController addBlurEffect];
              v67 = [(UINavigationController *)self->_hostingNavigationController navigationBar];
              v68 = [(ICQUpgradeFlowManager *)self flowOptions];
              v69 = [v68 navigationBarTintColor];
              [v67 setTintColor:v69];

              self->_shouldNavigationControllerBeDismissed = 1;
              v70 = self->_hostingNavigationController;
              v71[0] = MEMORY[0x263EF8330];
              v71[1] = 3221225472;
              v71[2] = __82__ICQUpgradeFlowManager__configurePresentingViewController_preloadedRemoteUIData___block_invoke;
              v71[3] = &unk_264921B68;
              v71[4] = self;
              v72 = v45;
              [v7 presentPreferredSizeWithViewController:v70 animated:1 completion:v71];
            }
          }
        }
        else
        {
          v34 = [v10 startAlert];

          if (!v34)
          {
            v61 = _ICQGetLogSystem();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              v62 = NSNumber;
              v63 = [(ICQUpgradeFlowManager *)self offer];
              objc_msgSend(v62, "numberWithInteger:", objc_msgSend(v63, "level"));
              v64 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v74 = v64;
              _os_log_impl(&dword_22C821000, v61, OS_LOG_TYPE_DEFAULT, "offer level %@ missing upgrade flow specification", buf, 0xCu);
            }
            [(ICQUpgradeFlowManager *)self _sendDelegateCancel];
            goto LABEL_12;
          }
          v27 = [v10 startAlert];
          v35 = (void *)MEMORY[0x263F88928];
          v36 = [v27 message];
          v37 = [v27 altMessage];
          v38 = [v35 stringWithPlaceholderFormat:v36 alternateString:v37];

          v39 = [v27 title];
          v40 = +[ICQAlertController alertControllerWithTitle:v39 message:v38 preferredStyle:1];
          upgradeAlertController = self->_upgradeAlertController;
          self->_upgradeAlertController = v40;

          [(ICQUpgradeFlowManager *)self _addAlertActionForAlertSpec:v27 buttonIndex:1];
          [(ICQUpgradeFlowManager *)self _addAlertActionForAlertSpec:v27 buttonIndex:2];
          [(ICQUpgradeFlowManager *)self _addAlertActionForAlertSpec:v27 buttonIndex:3];
          [v7 presentViewController:self->_upgradeAlertController animated:1 completion:&__block_literal_global_0];
        }
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v21 = _ICQGetLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [(ICQUpgradeFlowManager *)self offer];
        uint64_t v23 = [v22 requestedServerUIURL];
        *(_DWORD *)buf = 138412290;
        v74 = v23;
        _os_log_impl(&dword_22C821000, v21, OS_LOG_TYPE_DEFAULT, "presenting remoteUI URL %@", buf, 0xCu);
      }
      v16 = self;
      id v17 = v7;
      id v18 = 0;
    }
    [(ICQUpgradeFlowManager *)v16 _presentRemoteUIUsingViewController:v17 withData:v18];
    goto LABEL_12;
  }
  [(ICQUpgradeFlowManager *)self _presentLiftUIUsingViewController:v7];
LABEL_13:
}

uint64_t __82__ICQUpgradeFlowManager__configurePresentingViewController_preloadedRemoteUIData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDelegateDidPresentViewController:*(void *)(a1 + 40)];
}

- (void)startFlowWithParentViewController:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(ICQUpgradeFlowManager *)self _shouldPresentLiftUIFlow])
  {
    [(ICQUpgradeFlowManager *)self _presentLiftUIInParentViewController:v4];
  }
  else
  {
    id v5 = [[ICQUISpinnerViewController alloc] initWithNibName:0 bundle:0];
    id v6 = [(ICQUpgradeFlowManager *)self _navControllerWithRootVC:v5];
    [(ICQUpgradeFlowManager *)self setHostingNavigationController:v6];

    id v7 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    id v8 = [v7 navigationBar];
    id v9 = [(ICQUpgradeFlowManager *)self flowOptions];
    int v10 = [v9 navigationBarTintColor];
    [v8 setTintColor:v10];

    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    __int16 v19 = __59__ICQUpgradeFlowManager_startFlowWithParentViewController___block_invoke;
    v20 = &unk_264921B68;
    uint64_t v21 = self;
    uint64_t v12 = v5;
    v22 = v12;
    dispatch_after(v11, MEMORY[0x263EF83A0], &v17);
    if ([(ICQOffer *)self->_offer action] == 118)
    {
      uint64_t v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[ICQUpgradeFlowManager startFlowWithParentViewController:]";
        _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "%s, Detected action direct to oslo, skipping presentation and saving presenting view controller", buf, 0xCu);
      }

      id v14 = (UIViewController *)v4;
      presentingViewController = self->_presentingViewController;
      self->_presentingViewController = v14;
    }
    else
    {
      [(ICQUpgradeFlowManager *)self setShouldNavigationControllerBeDismissed:1];
      presentingViewController = [(ICQUpgradeFlowManager *)self hostingNavigationController];
      [v4 addChildAndPinToEdgesWithChildViewController:presentingViewController];
    }

    v16 = [(ICQUpgradeFlowManager *)self serverUIURL];
    [(ICQUpgradeFlowManager *)self presentRemoteViewWithData:0 andURL:v16];
  }
}

void __59__ICQUpgradeFlowManager_startFlowWithParentViewController___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F824A8]);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"CANCEL" value:&stru_26DFF2C90 table:@"CloudGroup"];
  id v6 = (id)[v2 initWithTitle:v4 style:0 target:*(void *)(a1 + 32) action:sel__cancelFlow];

  id v5 = [*(id *)(a1 + 40) navigationItem];
  [v5 setLeftBarButtonItem:v6];
}

- (void)_presentLiftUIUsingViewController:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICQUpgradeFlowManager *)self serverUIURL];

  if (v5)
  {
    id v6 = _ICQSignpostLogSystem();
    id v7 = objc_opt_new();
    uint64_t v8 = _ICQSignpostCreateWithObject();
    unint64_t v10 = v9;

    dispatch_time_t v11 = _ICQSignpostLogSystem();
    uint64_t v12 = v11;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      uint64_t v13 = [(ICQUpgradeFlowManager *)self serverUIURL];
      *(_DWORD *)buf = 138412290;
      v46 = v13;
      _os_signpost_emit_with_name_impl(&dword_22C821000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "UpsellLoadLiftUI", " enableTelemetry=YES URL: %@", buf, 0xCu);
    }
    id v14 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:](v8, self);
    }

    self->_loadLiftUISignpost.identifier = v8;
    self->_loadLiftUISignpost.timestamp = v10;
    self->_isLiftUIFlow = 1;
    id v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(ICQUpgradeFlowManager *)self serverUIURL];
      *(_DWORD *)buf = 138412290;
      v46 = v16;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Starting liftUI flow using url %@", buf, 0xCu);
    }
    uint64_t v17 = [(ICQUpgradeFlowManager *)self offer];
    uint64_t v18 = [v17 XMLSpecification];
    __int16 v19 = [v18 placeholderReplacementsWithDeviceInfo:0];

    v20 = [(ICQUpgradeFlowManager *)self icqLink];
    uint64_t v21 = [v20 serverUIContent];

    v22 = [ICQLiftUIPresenter alloc];
    if (v21)
    {
      uint64_t v23 = [(ICQUpgradeFlowManager *)self icqLink];
      v24 = [v23 serverUIContent];
      uint64_t v25 = [(ICQLiftUIPresenter *)v22 initWithContent:v24 account:0 data:v19];
      [(ICQUpgradeFlowManager *)self setLiftUIPresenter:v25];
    }
    else
    {
      uint64_t v23 = [(ICQUpgradeFlowManager *)self serverUIURL];
      v24 = [(ICQLiftUIPresenter *)v22 initWithURL:v23 account:0 data:v19];
      [(ICQUpgradeFlowManager *)self setLiftUIPresenter:v24];
    }

    v27 = [(ICQUpgradeFlowManager *)self liftUIPresenter];
    [v27 setDelegate:self];

    __int16 v28 = [(ICQUpgradeFlowManager *)self offer];
    v29 = [v28 bundleIdentifier];
    int v30 = [v29 isEqualToString:@"com.apple.icq"];

    objc_opt_class();
    int v31 = v30 & objc_opt_isKindOfClass();
    if (v31 == 1)
    {
      [(ICQUpgradeFlowManager *)self setHostingNavigationController:v4];
    }
    else
    {
      v32 = [(ICQUpgradeFlowManager *)self _navControllerWithRootVC:0];
      [(ICQUpgradeFlowManager *)self setHostingNavigationController:v32];
    }
    v33 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    v34 = [v33 navigationBar];
    uint64_t v35 = [(ICQUpgradeFlowManager *)self flowOptions];
    v36 = [(id)v35 navigationBarTintColor];
    [v34 setTintColor:v36];

    v37 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    [v37 setDelegate:self];

    [(ICQUpgradeFlowManager *)self setShouldNavigationControllerBeDismissed:1];
    v38 = [(ICQUpgradeFlowManager *)self liftUIPresenter];
    v39 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    LOBYTE(v35) = [v38 pushInNavigationController:v39 animated:0];

    if (v35)
    {
      v40 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
      [v40 setNavigationBarHidden:1];

      if (v31)
      {
        [(ICQUpgradeFlowManager *)self _sendDelegateDidPresentViewController:v4];
      }
      else
      {
        v42 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __59__ICQUpgradeFlowManager__presentLiftUIUsingViewController___block_invoke;
        v43[3] = &unk_264921B68;
        v43[4] = self;
        id v44 = v4;
        [v44 presentPreferredSizeWithViewController:v42 animated:1 completion:v43];
      }
    }
    else
    {
      v41 = _ICQGetLogSystem();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:]();
      }

      [(ICQUpgradeFlowManager *)self _sendDelegateCancel];
    }
  }
  else
  {
    __int16 v26 = _ICQGetLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:]();
    }

    [(ICQUpgradeFlowManager *)self _sendDelegateCancel];
  }
}

uint64_t __59__ICQUpgradeFlowManager__presentLiftUIUsingViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDelegateDidPresentViewController:*(void *)(a1 + 40)];
}

- (void)_presentLiftUIInParentViewController:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICQUpgradeFlowManager *)self serverUIURL];

  if (v5)
  {
    id v6 = _ICQSignpostLogSystem();
    id v7 = objc_opt_new();
    uint64_t v8 = _ICQSignpostCreateWithObject();
    unint64_t v10 = v9;

    dispatch_time_t v11 = _ICQSignpostLogSystem();
    uint64_t v12 = v11;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      uint64_t v13 = [(ICQUpgradeFlowManager *)self serverUIURL];
      int v38 = 138412290;
      v39 = v13;
      _os_signpost_emit_with_name_impl(&dword_22C821000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "UpsellLoadLiftUI", " enableTelemetry=YES URL: %@", (uint8_t *)&v38, 0xCu);
    }
    id v14 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:](v8, self);
    }

    self->_loadLiftUISignpost.identifier = v8;
    self->_loadLiftUISignpost.timestamp = v10;
    self->_isLiftUIFlow = 1;
    id v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(ICQUpgradeFlowManager *)self serverUIURL];
      int v38 = 138412290;
      v39 = v16;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Starting liftUI flow using url %@", (uint8_t *)&v38, 0xCu);
    }
    uint64_t v17 = [(ICQUpgradeFlowManager *)self offer];
    uint64_t v18 = [v17 XMLSpecification];
    __int16 v19 = [v18 placeholderReplacementsWithDeviceInfo:0];

    v20 = [(ICQUpgradeFlowManager *)self icqLink];
    uint64_t v21 = [v20 serverUIContent];

    v22 = [ICQLiftUIPresenter alloc];
    if (v21)
    {
      uint64_t v23 = [(ICQUpgradeFlowManager *)self icqLink];
      v24 = [v23 serverUIContent];
      uint64_t v25 = [(ICQLiftUIPresenter *)v22 initWithContent:v24 account:0 data:v19];
      [(ICQUpgradeFlowManager *)self setLiftUIPresenter:v25];
    }
    else
    {
      uint64_t v23 = [(ICQUpgradeFlowManager *)self serverUIURL];
      v24 = [(ICQLiftUIPresenter *)v22 initWithURL:v23 account:0 data:v19];
      [(ICQUpgradeFlowManager *)self setLiftUIPresenter:v24];
    }

    v27 = [(ICQUpgradeFlowManager *)self liftUIPresenter];
    [v27 setDelegate:self];

    __int16 v28 = [(ICQUpgradeFlowManager *)self _navControllerWithRootVC:0];
    [(ICQUpgradeFlowManager *)self setHostingNavigationController:v28];

    v29 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    int v30 = [v29 navigationBar];
    uint64_t v31 = [(ICQUpgradeFlowManager *)self flowOptions];
    v32 = [(id)v31 navigationBarTintColor];
    [v30 setTintColor:v32];

    v33 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    [v33 setNavigationBarHidden:1];

    [(ICQUpgradeFlowManager *)self setShouldNavigationControllerBeDismissed:1];
    v34 = [(ICQUpgradeFlowManager *)self liftUIPresenter];
    uint64_t v35 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    LOBYTE(v31) = [v34 pushInNavigationController:v35 animated:0];

    if (v31)
    {
      v36 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
      [v4 addChildAndPinToEdgesWithChildViewController:v36];

      [(ICQUpgradeFlowManager *)self _sendDelegateDidPresentViewController:v4];
    }
    else
    {
      v37 = _ICQGetLogSystem();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:]();
      }

      [(ICQUpgradeFlowManager *)self _sendDelegateCancel];
    }
  }
  else
  {
    __int16 v26 = _ICQGetLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:]();
    }

    [(ICQUpgradeFlowManager *)self _sendDelegateCancel];
  }
}

- (void)_presentRemoteUIUsingViewController:(id)a3
{
}

- (void)_presentRemoteUIUsingViewController:(id)a3 withData:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (objc_class *)MEMORY[0x263F25D70];
  id v9 = a4;
  unint64_t v10 = (void *)[[v8 alloc] initWithNibName:0 bundle:0];
  dispatch_time_t v11 = [(ICQUpgradeFlowManager *)self _navControllerWithRootVC:v10];
  [(ICQUpgradeFlowManager *)self setHostingNavigationController:v11];

  uint64_t v12 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
  uint64_t v13 = [v12 navigationBar];
  id v14 = [(ICQUpgradeFlowManager *)self flowOptions];
  id v15 = [v14 navigationBarTintColor];
  [v13 setTintColor:v15];

  if ([(ICQOffer *)self->_offer action] == 118)
  {
    v16 = _ICQGetLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      v20 = "-[ICQUpgradeFlowManager _presentRemoteUIUsingViewController:withData:]";
      _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, "%s, Detected action direct to oslo, skipping presentation and saving presenting view controller", (uint8_t *)&v19, 0xCu);
    }

    objc_storeStrong((id *)&self->_presentingViewController, a3);
  }
  else
  {
    [(ICQUpgradeFlowManager *)self setShouldNavigationControllerBeDismissed:1];
    uint64_t v17 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    [v7 presentPreferredSizeWithViewController:v17 animated:1 completion:0];
  }
  [(UINavigationController *)self->_hostingNavigationController addBlurEffect];
  uint64_t v18 = [(ICQUpgradeFlowManager *)self serverUIURL];
  [(ICQUpgradeFlowManager *)self presentRemoteViewWithData:v9 andURL:v18];
}

- (void)presentRemoteViewWithData:(id)a3 andURL:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "presenting remote view with url = %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [MEMORY[0x263F08BD8] requestWithURL:v6];
  [(ICQUpgradeFlowManager *)self _presentRemoteViewWithData:v7 andRequest:v9];
}

- (void)_presentRemoteViewWithData:(id)a3 andRequest:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412290;
    id v34 = v7;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "presenting remote view with request = %@", (uint8_t *)&v33, 0xCu);
  }

  id v9 = _ICQSignpostLogSystem();
  int v10 = objc_opt_new();
  uint64_t v11 = _ICQSignpostCreateWithObject();
  unint64_t v13 = v12;

  id v14 = _ICQSignpostLogSystem();
  id v15 = v14;
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v16 = [(ICQUpgradeFlowManager *)self offer];
    uint64_t v17 = [v16 remoteUIURL];
    int v33 = 138412290;
    id v34 = v17;
    _os_signpost_emit_with_name_impl(&dword_22C821000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "UpsellLoadRemoteUI", " enableTelemetry=YES URL: %@", (uint8_t *)&v33, 0xCu);
  }
  uint64_t v18 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[ICQUpgradeFlowManager _presentRemoteViewWithData:andRequest:](v11, self);
  }

  self->_loadRemoteUISignpost.identifier = v11;
  self->_loadRemoteUISignpost.timestamp = v13;
  int v19 = (AAUIRemoteUIController *)objc_alloc_init(MEMORY[0x263F25D30]);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = v19;

  [(AAUIRemoteUIController *)self->_remoteUIController setDelegate:self];
  [(AAUIRemoteUIController *)self->_remoteUIController setNavigationController:self->_hostingNavigationController];
  [(AAUIRemoteUIController *)self->_remoteUIController setHostViewController:self->_hostingNavigationController];
  id v21 = objc_alloc(MEMORY[0x263F637C0]);
  v22 = self->_remoteUIController;
  uint64_t v23 = [(ICQUpgradeFlowManager *)self serverHooks];
  v24 = (RUIServerHookHandler *)[v21 initWithRemoteUIController:v22 hooks:v23];
  serverHookHandler = self->_serverHookHandler;
  self->_serverHookHandler = v24;

  if ([MEMORY[0x263F88978] isServerMockingEnabled]
    && ([MEMORY[0x263F88978] defaultStringValueForKey:@"_ICQ_MOCK_BUY_PAGE"],
        __int16 v26 = objc_claimAutoreleasedReturnValue(),
        v26,
        v26))
  {
    v27 = _ICQGetLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_22C821000, v27, OS_LOG_TYPE_DEFAULT, "Mocking buy page", (uint8_t *)&v33, 2u);
    }

    __int16 v28 = [MEMORY[0x263F88978] defaultStringValueForKey:@"_ICQ_MOCK_BUY_PAGE"];
    v29 = [v28 dataUsingEncoding:4];
    int v30 = self->_remoteUIController;
    uint64_t v31 = [v7 URL];
    [(AAUIRemoteUIController *)v30 loadData:v29 baseURL:v31];
  }
  else if (v6)
  {
    v32 = self->_remoteUIController;
    __int16 v28 = [v7 URL];
    [(AAUIRemoteUIController *)v32 loadData:v6 baseURL:v28];
  }
  else
  {
    __int16 v28 = (void *)[v7 mutableCopy];
    [v28 setTimeoutInterval:30.0];
    [(AAUIRemoteUIController *)self->_remoteUIController loadRequest:v28 completion:0];
  }
}

+ (NSMutableArray)activeFlowManagers
{
  if (activeFlowManagers_onceToken != -1) {
    dispatch_once(&activeFlowManagers_onceToken, &__block_literal_global_117);
  }
  id v2 = (void *)activeFlowManagers_sActiveFlowManagers;
  return (NSMutableArray *)v2;
}

void __43__ICQUpgradeFlowManager_activeFlowManagers__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)activeFlowManagers_sActiveFlowManagers;
  activeFlowManagers_sActiveFlowManagers = v0;
}

+ (void)addActiveFlowManager:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "adding active flow manager %p", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [a1 activeFlowManagers];
  [v6 addObject:v4];
}

+ (void)removeActiveFlowManager:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "removing active flow manager %p", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [a1 activeFlowManagers];
  [v6 removeObject:v4];
}

- (void)_setBusyOfferViewController:(id)a3
{
  objc_storeStrong((id *)&self->_busyOfferViewController, a3);
  id v4 = a3;
  id v5 = [v4 view];
  [v5 setUpgradeMode:1];
  [v4 setCancelEnabled:0];
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [NSURL URLWithString:v5];
      if (!v7) {
        goto LABEL_13;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_13:
        if (v6) {
          v6[2](v6);
        }
        id v7 = 0;
LABEL_16:

        goto LABEL_17;
      }
      id v7 = v5;
    }
    id v8 = [MEMORY[0x263F01880] defaultWorkspace];
    int v9 = [v8 openSensitiveURL:v7 withOptions:MEMORY[0x263EFFA78]];

    int v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = @"NO";
      if (v9) {
        uint64_t v11 = @"YES";
      }
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "open URL %@ succeeded:%@", (uint8_t *)&v12, 0x16u);
    }

    if (v6) {
      v6[2](v6);
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (id)_allowedInProcessClients
{
  if (_allowedInProcessClients_onceToken != -1) {
    dispatch_once(&_allowedInProcessClients_onceToken, &__block_literal_global_123);
  }
  id v2 = (void *)_allowedInProcessClients_allowedClients;
  return v2;
}

void __49__ICQUpgradeFlowManager__allowedInProcessClients__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26E01EB88];
  v1 = (void *)_allowedInProcessClients_allowedClients;
  _allowedInProcessClients_allowedClients = v0;
}

- (BOOL)_shouldPresentRemoteFlow
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 bundleIdentifier];

  id v5 = [(ICQUpgradeFlowManager *)self _allowedInProcessClients];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      int v10 = v4;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "%@ is allowed in process UI", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6 ^ 1;
}

- (BOOL)_shouldPresentLiftUIFlow
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(ICQUpgradeFlowManager *)self icqLink];
  if (v3)
  {
  }
  else
  {
    id v4 = [(ICQUpgradeFlowManager *)self offer];
    uint64_t v5 = [v4 action];

    if (v5 == 115)
    {
      int v6 = _ICQGetLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        id v7 = "Offer action is ICQActionLaunchLiftUI, launching LiftUI...";
LABEL_11:
        _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v18, 2u);
      }
LABEL_17:
      BOOL v16 = 1;
      goto LABEL_18;
    }
  }
  id v8 = [(ICQUpgradeFlowManager *)self icqLink];
  if (v8)
  {

    goto LABEL_12;
  }
  int v9 = [(ICQUpgradeFlowManager *)self offer];
  uint64_t v10 = [v9 action];

  if (v10 == 121)
  {
    int v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      id v7 = "Offer action is ICQActionLaunchUpgradeFlowWithLiftUI, launching LiftUI...";
      goto LABEL_11;
    }
    goto LABEL_17;
  }
LABEL_12:
  uint64_t v11 = [(ICQUpgradeFlowManager *)self icqLink];
  if ([v11 action] == 121)
  {

    goto LABEL_15;
  }
  int v12 = [(ICQUpgradeFlowManager *)self icqLink];
  uint64_t v13 = [v12 action];

  if (v13 == 115)
  {
LABEL_15:
    int v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [(ICQUpgradeFlowManager *)self icqLink];
      [v14 action];
      id v15 = _ICQStringForAction();
      int v18 = 138412290;
      int v19 = v15;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "ICQLink action is %@, launching LiftUI...", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_17;
  }
  int v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "This is not a LiftUI flow, launching non-LiftUI flow...", (uint8_t *)&v18, 2u);
  }
  BOOL v16 = 0;
LABEL_18:

  return v16;
}

- (id)_navControllerWithRootVC:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[ICQRemoteUINavigationController alloc] initWithRootViewController:v4];

  [(ICQRemoteUINavigationController *)v5 setModalInPresentation:1];
  if (objc_msgSend(MEMORY[0x263F82670], "icqui_isiPad")) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = -2;
  }
  [(ICQRemoteUINavigationController *)v5 setModalPresentationStyle:v6];
  [MEMORY[0x263F82E10] ICQUIUpsellPrefferredPresentationSize];
  -[ICQRemoteUINavigationController setPreferredContentSize:](v5, "setPreferredContentSize:");
  [(ICQRemoteUINavigationController *)v5 setDelegate:self];
  return v5;
}

+ (BOOL)shouldSubclassShowForOffer:(id)a3
{
  return 1;
}

- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "subclass must override", v5, 2u);
  }
}

- (BOOL)needsNetwork
{
  return 1;
}

- (void)_cancelFlow
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "canceling flow", v4, 2u);
  }

  [(ICQUpgradeFlowManager *)self sender:self action:1 parameters:MEMORY[0x263EFFA78]];
}

- (void)_presentPageWithSpecification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICQUpgradeFlowManager *)self bindings];

  if (v5)
  {
    uint64_t v6 = [(ICQUpgradeFlowManager *)self bindings];
    uint64_t v7 = [v4 copyWithBindings:v6];

    id v4 = (id)v7;
  }
  id v8 = [(ICQUpgradeFlowManager *)self offer];
  int v9 = [v8 isBuddyOffer];

  if (v9)
  {
    uint64_t v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "presenting buddy view controller", buf, 2u);
    }

    uint64_t v11 = [[ICQBuddyOfferViewController alloc] initWithPageSpecification:v4];
  }
  else
  {
    uint64_t v11 = [[ICQViewController alloc] initWithPageSpecification:v4];
    int v12 = [(ICQUpgradeFlowManager *)self flowOptions];
    uint64_t v13 = [v12 buttonTintColor];
    [(ICQBuddyOfferViewController *)v11 setButtonTintColor:v13];
  }
  __int16 v14 = [(ICQUpgradeFlowManager *)self hostingNavigationController];

  if (v14 && v11)
  {
    id v15 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    [v15 pushViewController:v11 animated:1];

    [(ICQUpgradeFlowManager *)self _sendDelegateDidPresentViewController:v11];
  }
  else
  {
    BOOL v16 = _ICQGetLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, "improper page specification -- cancelling flow", v17, 2u);
    }

    [(ICQUpgradeFlowManager *)self _sendDelegateCancel];
  }
}

- (void)_presentUpgradeComplete
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "ERROR: _presentUpgradeComplete is an old code path that should not be used anymore", v7, 2u);
  }

  id v4 = [(ICQUpgradeFlowManager *)self offer];
  uint64_t v5 = [v4 upgradeFlowSpecification];
  uint64_t v6 = [v5 upgradeSuccessPage];

  [(ICQUpgradeFlowManager *)self _presentPageWithSpecification:v6];
}

- (void)_clearBusyOfferViewController
{
  if (self->_busyOfferViewController)
  {
    dispatch_time_t v3 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__ICQUpgradeFlowManager__clearBusyOfferViewController__block_invoke;
    block[3] = &unk_264921C80;
    void block[4] = self;
    dispatch_after(v3, MEMORY[0x263EF83A0], block);
  }
}

void __54__ICQUpgradeFlowManager__clearBusyOfferViewController__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) view];
  [v4 setUpgradeMode:0];
  [*(id *)(*(void *)(a1 + 32) + 24) setCancelEnabled:1];
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_time_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v6 setPageDelegate:self];
  }
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F82670], "icqui_isiPad", a3)) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)dismissNavigationControllerAnimated:(BOOL)a3 success:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    [v10 setShouldSignalDelegateOnDismiss:0];

    uint64_t v11 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    [v11 setDidCompletePurchaseFlowWithSuccess:v5];
  }
  id v12 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
  [v12 dismissViewControllerAnimated:1 completion:v7];
}

- (void)sender:(id)a3 action:(int64_t)a4 parameters:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 'd':
LABEL_4:
      uint64_t v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = _ICQStringForAction();
        *(_DWORD *)buf = 138412802;
        id v38 = v8;
        __int16 v39 = 2112;
        uint64_t v40 = v12;
        __int16 v41 = 2112;
        id v42 = v9;
        _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "ICQUpgradeFlowManager: sender:%@ action:%@ parameters:%@ unexpected", buf, 0x20u);
      }
      break;
    case 'e':
LABEL_21:
      uint64_t v23 = _ICQGetLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = _ICQStringForAction();
        *(_DWORD *)buf = 138412290;
        id v38 = v24;
        _os_log_impl(&dword_22C821000, v23, OS_LOG_TYPE_DEFAULT, "ICQActionDismiss (%@)", buf, 0xCu);
      }
      if ([(ICQUpgradeFlowManager *)self shouldNavigationControllerBeDismissed])
      {
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke;
        v36[3] = &unk_264921C80;
        v36[4] = self;
        [(ICQUpgradeFlowManager *)self dismissNavigationControllerAnimated:1 success:0 completion:v36];
      }
      else
      {
LABEL_29:
        [(ICQUpgradeFlowManager *)self _sendDelegateCancel];
      }
      break;
    case 'f':
      uint64_t v25 = _ICQGetLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = _ICQStringForAction();
        *(_DWORD *)buf = 138412802;
        id v38 = v8;
        __int16 v39 = 2112;
        uint64_t v40 = v26;
        __int16 v41 = 2112;
        id v42 = v9;
        _os_log_impl(&dword_22C821000, v25, OS_LOG_TYPE_DEFAULT, "ICQUpgradeFlowManager: sender:%@ action:%@ parameters:%@ not yet implemented", buf, 0x20u);
      }
      break;
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'p':
      goto LABEL_7;
    case 'm':
      [(ICQUpgradeFlowManager *)self _initiateFamilySetupFlow];
      break;
    case 'n':
    case 'o':
    case 'q':
    case 'r':
    case 's':
      break;
    case 't':
    case 'u':
    case 'v':
      uint64_t v10 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v9];
      [v10 setObject:&unk_26E01ECA8 forKey:@"osloPurchase"];

      id v9 = v10;
LABEL_7:
      uint64_t v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = _ICQStringForAction();
        *(_DWORD *)buf = 138412290;
        id v38 = v14;
        _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "ICQActionPurchaseBuy (%@)", buf, 0xCu);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(ICQUpgradeFlowManager *)self _setBusyOfferViewController:v8];
      }
      id v15 = [(ICQUpgradeFlowManager *)self offer];
      BOOL v16 = [v15 upgradeFlowSpecification];

      if ([(ICQUpgradeFlowManager *)self needsNetwork]
        && ([MEMORY[0x263F88918] isNetworkReachable] & 1) == 0)
      {
        uint64_t v17 = _ICQGetLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "network is needed, but not reachable", buf, 2u);
        }

        int v18 = [v16 upgradeFailurePageForNetwork];
        [(ICQUpgradeFlowManager *)self _presentPageWithSpecification:v18];

        [(ICQUpgradeFlowManager *)self _clearBusyOfferViewController];
      }
      else
      {
        objc_initWeak((id *)buf, self);
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_151;
        v31[3] = &unk_264921CF8;
        objc_copyWeak(&v35, (id *)buf);
        id v32 = v8;
        id v33 = v16;
        id v34 = self;
        [(ICQUpgradeFlowManager *)self _performPageButtonActionWithParameters:v9 completion:v31];

        objc_destroyWeak(&v35);
        objc_destroyWeak((id *)buf);
      }

      break;
    default:
      switch(a4)
      {
        case 0:
        case 2:
        case 3:
          goto LABEL_4;
        case 1:
          goto LABEL_21;
        case 4:
          goto LABEL_7;
        case 5:
          v27 = _ICQGetLogSystem();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C821000, v27, OS_LOG_TYPE_DEFAULT, "ICQActionPurchaseComplete", buf, 2u);
          }

          if (![(ICQUpgradeFlowManager *)self shouldNavigationControllerBeDismissed])goto LABEL_29; {
          v30[0] = MEMORY[0x263EF8330];
          }
          v30[1] = 3221225472;
          v30[2] = __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_159;
          v30[3] = &unk_264921C80;
          v30[4] = self;
          [(ICQUpgradeFlowManager *)self dismissNavigationControllerAnimated:1 success:1 completion:v30];
          break;
        case 6:
          __int16 v28 = _ICQGetLogSystem();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C821000, v28, OS_LOG_TYPE_DEFAULT, "ICQActionOpenURL", buf, 2u);
          }

          v29 = [v9 objectForKeyedSubscript:*MEMORY[0x263F88820]];
          [(ICQUpgradeFlowManager *)self _openURL:v29 completion:0];

          break;
        default:
          goto LABEL_18;
      }
      break;
  }
LABEL_18:
  int v19 = [v9 objectForKeyedSubscript:*MEMORY[0x263F88810]];
  if (v19)
  {
    uint64_t v20 = [MEMORY[0x263F88928] sharedOfferManager];
    id v21 = [(ICQUpgradeFlowManager *)self offer];
    v22 = [v21 offerId];
    [v20 updateOfferId:v22 buttonId:v19 info:0 completion:0];
  }
}

uint64_t __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDelegateCancel];
}

void __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_151(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"failed";
    if (a2) {
      id v8 = @"succeeded";
    }
    *(_DWORD *)buf = 138543618;
    int v19 = v8;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "button action %{public}@ with error %@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_158;
  v11[3] = &unk_264921CD0;
  id v9 = *(id *)(a1 + 32);
  char v17 = a2;
  id v12 = v9;
  id v13 = v5;
  id v14 = *(id *)(a1 + 40);
  id v15 = WeakRetained;
  uint64_t v16 = *(void *)(a1 + 48);
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_158(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) hideSpinner];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 72))
  {
    if (!v2)
    {
      if ([*(id *)(a1 + 48) needsWiFi]
        && ([MEMORY[0x263F88918] isWifiEnabled] & 1) == 0)
      {
        uint64_t v3 = [*(id *)(a1 + 48) upgradeSuccessPageForWiFi];
      }
      else
      {
        uint64_t v3 = [*(id *)(a1 + 48) upgradePageForSuccess:*(unsigned __int8 *)(a1 + 72)];
      }
      goto LABEL_10;
    }
  }
  else if (!v2)
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Action failed but returned no error!", buf, 2u);
    }
    goto LABEL_12;
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 48), "upgradePageForError:");
LABEL_10:
  id v4 = v3;
  if (!v3) {
    goto LABEL_13;
  }
  [*(id *)(a1 + 56) _presentPageWithSpecification:v3];
LABEL_12:

LABEL_13:
  [*(id *)(a1 + 56) _clearBusyOfferViewController];
  id v5 = [*(id *)(a1 + 64) offer];
  if ([v5 isBuddyOffer])
  {
    int v6 = *(unsigned __int8 *)(a1 + 72);

    if (v6)
    {
      id v7 = _ICQGetLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Sending delegate complete to buddy", v8, 2u);
      }

      [*(id *)(a1 + 56) sender:*(void *)(a1 + 64) action:5 parameters:0];
    }
  }
  else
  {
  }
}

uint64_t __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_159(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDelegateComplete];
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __101__ICQUpgradeFlowManager_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke;
  v9[3] = &unk_264921D20;
  id v10 = v7;
  id v8 = v7;
  objc_msgSend(a4, "icq_addHeadersForUpgradeWithCompletion:", v9);
}

uint64_t __101__ICQUpgradeFlowManager_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = [v7 clientInfo];
  id v9 = [v8 objectForKeyedSubscript:@"closeURL"];
  [(ICQUpgradeFlowManager *)self setCloseURL:v9];

  id v10 = [v8 objectForKeyedSubscript:@"forceRefresh"];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    id v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICQUpgradeFlowManager remoteUIController:didReceiveObjectModel:actionSignal:]();
    }

    +[ICQPurchase clearCacheAndNotifyClients];
  }
  id v13 = [v8 objectForKeyedSubscript:@"didCancel"];
  char v14 = [v13 BOOLValue];

  if (*a5 != 1 || (v14 & 1) != 0)
  {
    v73 = v8;
    id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v72 = self;
    uint64_t v16 = [(ICQUpgradeFlowManager *)self offer];
    char v17 = [v16 XMLSpecification];

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    v74 = v7;
    obuint64_t j = [v7 allPages];
    uint64_t v18 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
    unint64_t v19 = 0x263F88000uLL;
    uint64_t v75 = v17;
    if (v18)
    {
      uint64_t v20 = v18;
      id v21 = @"placeholder";
      uint64_t v22 = *(void *)v88;
      id v76 = v15;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v88 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          uint64_t v25 = *(void **)(v19 + 2424);
          __int16 v26 = [v24 navTitle];
          v27 = [v25 findPlaceholdersInString:v26];
          [v15 unionSet:v27];

          __int16 v28 = *(void **)(v19 + 2424);
          v29 = [v24 navSubTitle];
          int v30 = [v28 findPlaceholdersInString:v29];
          [v15 unionSet:v30];

          uint64_t v31 = [v24 subElementWithID:v21];
          id v32 = v31;
          if (v31)
          {
            id v33 = [v31 identifier];
            uint64_t v34 = [v32 body];
            id v35 = (void *)v34;
            if (v33 && v34)
            {
              uint64_t v36 = v20;
              uint64_t v37 = v22;
              unint64_t v38 = v19;
              __int16 v39 = v21;
              uint64_t v40 = [v17 stringForPlaceholder:v34];
              if (v40)
              {
                [v32 setBody:v40];
              }
              else
              {
                __int16 v41 = _ICQGetLogSystem();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v94 = v35;
                  _os_log_impl(&dword_22C821000, v41, OS_LOG_TYPE_DEFAULT, "failed to replace %@", buf, 0xCu);
                }

                char v17 = v75;
              }

              id v21 = v39;
              unint64_t v19 = v38;
              uint64_t v22 = v37;
              uint64_t v20 = v36;
              id v15 = v76;
            }
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
      }
      while (v20);
    }

    id v42 = _ICQGetLogSystem();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v94 = v15;
      _os_log_impl(&dword_22C821000, v42, OS_LOG_TYPE_DEFAULT, "placeholder set = %@", buf, 0xCu);
    }

    id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v44 = v15;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v83 objects:v92 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v84 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v83 + 1) + 8 * j);
          int v50 = [v17 stringForPlaceholder:v49];
          [v43 setValue:v50 forKey:v49];
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v83 objects:v92 count:16];
      }
      while (v46);
    }
    v77 = v44;

    v51 = _ICQGetLogSystem();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v94 = v43;
      _os_log_impl(&dword_22C821000, v51, OS_LOG_TYPE_DEFAULT, "wordsToReplace* = %@", buf, 0xCu);
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v52 = [v74 allPages];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v79 objects:v91 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v80;
      do
      {
        for (uint64_t k = 0; k != v54; ++k)
        {
          if (*(void *)v80 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = *(void **)(*((void *)&v79 + 1) + 8 * k);
          v58 = *(void **)(v19 + 2424);
          v59 = [v57 navTitle];
          v60 = [v58 replaceWordsIn:v59 with:v43];
          [v57 setNavTitle:v60];

          v61 = *(void **)(v19 + 2424);
          v62 = [v57 navSubTitle];
          v63 = [v61 replaceWordsIn:v62 with:v43];
          [v57 setNavSubTitle:v63];

          v64 = _ICQGetLogSystem();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            v65 = [v57 navTitle];
            *(_DWORD *)buf = 138412290;
            id v94 = v65;
            _os_log_impl(&dword_22C821000, v64, OS_LOG_TYPE_DEFAULT, "navtitle = %@", buf, 0xCu);
          }
          v66 = _ICQGetLogSystem();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            v67 = [v57 navSubTitle];
            *(_DWORD *)buf = 138412290;
            id v94 = v67;
            _os_log_impl(&dword_22C821000, v66, OS_LOG_TYPE_DEFAULT, "navSubTitle = %@", buf, 0xCu);
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v79 objects:v91 count:16];
      }
      while (v54);
    }

    id v7 = v74;
    [(RUIServerHookHandler *)v72->_serverHookHandler processObjectModel:v74 isModal:1];
    v68 = [(ICQUpgradeFlowManager *)v72 hostingNavigationController];
    int v69 = [v68 isNavigationBarHidden];

    if (v69)
    {
      v70 = _ICQGetLogSystem();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v70, OS_LOG_TYPE_DEFAULT, "Navigation bar is hidden, resetting it to be visible.", buf, 2u);
      }

      v71 = [(ICQUpgradeFlowManager *)v72 hostingNavigationController];
      [v71 setNavigationBarHidden:0];
    }
    id v8 = v73;
  }
  else
  {
    [(ICQUpgradeFlowManager *)self dismissUpgradeFlowWithSuccess:1];
    [(RUIServerHookHandler *)self->_serverHookHandler processObjectModel:v7 isModal:1];
  }
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t Nanoseconds = _ICQSignpostGetNanoseconds();
  id v9 = _ICQSignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t identifier = self->_loadRemoteUISignpost.identifier;
  if (identifier - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    id v12 = @"NO";
    if (!v7) {
      id v12 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v12;
    _os_signpost_emit_with_name_impl(&dword_22C821000, v10, OS_SIGNPOST_INTERVAL_END, identifier, "UpsellLoadRemoteUI", "Success: %@", buf, 0xCu);
  }

  id v13 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int identifier_low = LOWORD(self->_loadRemoteUISignpost.identifier);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = identifier_low;
    if (v7) {
      v29 = @"NO";
    }
    else {
      v29 = @"YES";
    }
    *(_WORD *)&buf[8] = 2048;
    *(double *)&buf[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v29;
    _os_log_debug_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) UpsellLoadRemoteUI Success: %@", buf, 0x1Cu);
  }

  if (v7)
  {
    char v14 = [v7 userInfo];
    id v15 = [v14 objectForKeyedSubscript:@"statusCode"];
    BOOL v16 = [v15 intValue] == 401;

    if (!v16)
    {
      self->_renewCredentialsCount = 0;
LABEL_15:
      BOOL v19 = [v7 code] == -1009;
      uint64_t v20 = _ICQGetLogSystem();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          uint64_t v22 = [v7 debugDescription];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v22;
          _os_log_impl(&dword_22C821000, v20, OS_LOG_TYPE_DEFAULT, "RemoteUIController finished loading with network error: %@", buf, 0xCu);
        }
        [(ICQUpgradeFlowManager *)self showNetworkFailurePage];
      }
      else
      {
        if (v21)
        {
          uint64_t v23 = [v7 debugDescription];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v23;
          _os_log_impl(&dword_22C821000, v20, OS_LOG_TYPE_DEFAULT, "RemoteUIController finished loading with error: %@", buf, 0xCu);
        }
        [(ICQUpgradeFlowManager *)self showUpgradeFailurePage];
      }
      goto LABEL_27;
    }
    if (self->_renewCredentialsCount)
    {
      char v17 = _ICQGetLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ICQUpgradeFlowManager remoteUIController:didFinishLoadWithError:]();
      }

      self->_renewCredentialsCount = 0;
      didComplete = (void (**)(id, void))self->_didComplete;
      if (didComplete) {
        didComplete[2](didComplete, 0);
      }
      goto LABEL_15;
    }
    self->_renewCredentialsCount = 1;
    v24 = _ICQGetLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v24, OS_LOG_TYPE_DEFAULT, "We've got a 401, let's try renewing credentials", buf, 2u);
    }

    objc_initWeak(&location, self);
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x2050000000;
    uint64_t v25 = (void *)getINDaemonConnectionClass_softClass;
    uint64_t v36 = getINDaemonConnectionClass_softClass;
    if (!getINDaemonConnectionClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __getINDaemonConnectionClass_block_invoke;
      *(void *)&buf[24] = &unk_264921E58;
      unint64_t v38 = &v33;
      __getINDaemonConnectionClass_block_invoke((uint64_t)buf);
      uint64_t v25 = (void *)v34[3];
    }
    __int16 v26 = v25;
    _Block_object_dispose(&v33, 8);
    id v27 = objc_alloc_init(v26);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __67__ICQUpgradeFlowManager_remoteUIController_didFinishLoadWithError___block_invoke;
    v30[3] = &unk_264921D48;
    objc_copyWeak(&v31, &location);
    [v27 renewCredentialsWithCompletion:v30];
    objc_destroyWeak(&v31);

    objc_destroyWeak(&location);
  }
LABEL_27:
}

void __67__ICQUpgradeFlowManager_remoteUIController_didFinishLoadWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Renew credential results: %lu - error: %@", buf, 0x16u);
  }

  if (WeakRetained)
  {
    if (a2)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__ICQUpgradeFlowManager_remoteUIController_didFinishLoadWithError___block_invoke_167;
      block[3] = &unk_264921C80;
      void block[4] = WeakRetained;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      id v8 = _ICQGetLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Hey, it worked. Let's replay the request.", buf, 2u);
      }

      id v9 = [WeakRetained remoteUIController];
      id v10 = [WeakRetained serverUIURL];
      int v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:MEMORY[0x263EFFA78] requiringSecureCoding:0 error:0];
      [v9 loadURL:v10 postBody:v11];
    }
  }
}

uint64_t __67__ICQUpgradeFlowManager_remoteUIController_didFinishLoadWithError___block_invoke_167(uint64_t a1)
{
  return [*(id *)(a1 + 32) showUpgradeFailurePage];
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  objc_storeStrong((id *)&self->_hostingNavigationController, a4);
  id v6 = a4;
  [(UINavigationController *)self->_hostingNavigationController setDelegate:self];
}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "RemoteUI modal navigation controller dismissed.", v5, 2u);
  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = [(ICQUpgradeFlowManager *)self closeURL];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F88908];
    uint64_t v8 = *MEMORY[0x263F88808];
    id v6 = [(ICQUpgradeFlowManager *)self closeURL];
    v9[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v5 performAction:124 parameters:v7 options:2];
  }
  [(ICQUpgradeFlowManager *)self _cancelFlow];
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v5 = a4;
  id v6 = [v5 clientInfo];
  id v7 = [v6 objectForKeyedSubscript:@"action"];
  uint64_t v8 = _ICQActionForServerActionString();

  if (v8 == 118)
  {
    id v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Detected clientInfo action Direct to Oslo. Attempting to launch oslo.", buf, 2u);
    }

    id v10 = [v5 subElementWithID:@"upgradeButton"];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __74__ICQUpgradeFlowManager_remoteUIController_didPresentObjectModel_modally___block_invoke;
    v12[3] = &unk_264921B68;
    id v13 = v5;
    id v14 = v10;
    id v11 = v10;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

uint64_t __74__ICQUpgradeFlowManager_remoteUIController_didPresentObjectModel_modally___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateElement:*(void *)(a1 + 40) completion:&__block_literal_global_175];
}

void __74__ICQUpgradeFlowManager_remoteUIController_didPresentObjectModel_modally___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Direct to Oslo, activating button. success: %hhd error: %@", (uint8_t *)v6, 0x12u);
  }
}

- (void)showNetworkFailurePage
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v3 = [(ICQOffer *)self->_offer upgradeFlowSpecification];
  id v4 = [v3 upgradeFailurePageForNetwork];

  [(ICQUpgradeFlowManager *)self _presentPageWithSpecification:v4];
}

- (void)showUpgradeFailurePage
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v3 = [(ICQOffer *)self->_offer upgradeFlowSpecification];
  id v4 = [v3 upgradeFailurePage];

  [(ICQUpgradeFlowManager *)self _presentPageWithSpecification:v4];
}

- (void)dismissUpgradeFlowWithSuccess:(BOOL)a3
{
  if (self->_hostingNavigationController)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __55__ICQUpgradeFlowManager_dismissUpgradeFlowWithSuccess___block_invoke;
    v3[3] = &unk_264921D90;
    BOOL v4 = a3;
    v3[4] = self;
    [(ICQUpgradeFlowManager *)self dismissNavigationControllerAnimated:1 success:a3 completion:v3];
  }
}

uint64_t __55__ICQUpgradeFlowManager_dismissUpgradeFlowWithSuccess___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 _sendDelegateComplete];
  }
  else {
    return [v2 _sendDelegateCancel];
  }
}

- (BOOL)isLiftUIFlow
{
  return self->_isLiftUIFlow;
}

- (void)presentHostingNavigationController
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    presentingViewController = self->_presentingViewController;
    hostingNavigationController = self->_hostingNavigationController;
    int v8 = 138412546;
    uint64_t v9 = presentingViewController;
    __int16 v10 = 2112;
    id v11 = hostingNavigationController;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "ICQUpgradeFlowManger manual presentation request. presentingViewController: %@ hostingNavigationController: %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v6 = self->_presentingViewController;
  if (v6)
  {
    __int16 v7 = self->_hostingNavigationController;
    if (v7)
    {
      self->_shouldNavigationControllerBeDismissed = 1;
      [(UIViewController *)v6 presentPreferredSizeWithViewController:v7 animated:1 completion:0];
    }
  }
}

- (id)presentationContext
{
  p_hostingNavigationController = (void **)&self->_hostingNavigationController;
  BOOL v4 = [(UINavigationController *)self->_hostingNavigationController presentingViewController];
  if (v4)
  {
  }
  else
  {
    id v5 = [(UINavigationController *)self->_hostingNavigationController parentViewController];

    if (!v5) {
      p_hostingNavigationController = (void **)&self->_presentingViewController;
    }
  }
  id v6 = *p_hostingNavigationController;
  return v6;
}

- (void)_simulateDoneButton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ICQUpgradeFlowManager__simulateDoneButton__block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__ICQUpgradeFlowManager__simulateDoneButton__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Simulating tap of post-purchase Done button.", v5, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v6 = *MEMORY[0x263F88810];
  v7[0] = @"appCtxSuccessBtnId";
  BOOL v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 sender:v3 action:5 parameters:v4];
}

- (void)_initiateFamilySetupFlow
{
  if ([(ICQUpgradeFlowManager *)self completedFamilySetup])
  {
    uint64_t v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Family setup already completed. Ignoring.", buf, 2u);
    }
  }
  else
  {
    *(void *)buf = 0;
    uint64_t v18 = buf;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy_;
    BOOL v21 = __Block_byref_object_dispose_;
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    BOOL v4 = (void *)getFACircleStateControllerClass_softClass;
    uint64_t v31 = getFACircleStateControllerClass_softClass;
    if (!getFACircleStateControllerClass_softClass)
    {
      *(void *)uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __getFACircleStateControllerClass_block_invoke;
      __int16 v26 = &unk_264921E58;
      id v27 = &v28;
      __getFACircleStateControllerClass_block_invoke((uint64_t)v23);
      BOOL v4 = (void *)v29[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v28, 8);
    id v22 = (id)[[v5 alloc] initWithPresenter:self->_hostingNavigationController];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    uint64_t v6 = (void *)getFACircleContextClass_softClass;
    uint64_t v31 = getFACircleContextClass_softClass;
    if (!getFACircleContextClass_softClass)
    {
      *(void *)uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __getFACircleContextClass_block_invoke;
      __int16 v26 = &unk_264921E58;
      id v27 = &v28;
      __getFACircleContextClass_block_invoke((uint64_t)v23);
      uint64_t v6 = (void *)v29[3];
    }
    __int16 v7 = v6;
    _Block_object_dispose(&v28, 8);
    id v8 = [v7 alloc];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v9 = (id *)getFACircleEventTypeInitiateSymbolLoc_ptr;
    uint64_t v31 = getFACircleEventTypeInitiateSymbolLoc_ptr;
    if (!getFACircleEventTypeInitiateSymbolLoc_ptr)
    {
      *(void *)uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __getFACircleEventTypeInitiateSymbolLoc_block_invoke;
      __int16 v26 = &unk_264921E58;
      id v27 = &v28;
      __int16 v10 = (void *)FamilyCircleUILibrary();
      id v11 = dlsym(v10, "FACircleEventTypeInitiate");
      *(void *)(v27[1] + 24) = v11;
      getFACircleEventTypeInitiateSymbolLoc_ptr = *(void *)(v27[1] + 24);
      uint64_t v9 = (id *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (v9)
    {
      id v12 = *v9;
      id v13 = (void *)[v8 initWithEventType:v12];

      [v13 setClientName:@"iCloudStorage"];
      id v14 = _ICQGetLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "Initiating Family setup flow", v23, 2u);
      }

      __int16 v15 = (void *)*((void *)v18 + 5);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __49__ICQUpgradeFlowManager__initiateFamilySetupFlow__block_invoke;
      v16[3] = &unk_264921DB8;
      v16[4] = self;
      v16[5] = buf;
      [v15 performOperationWithContext:v13 completion:v16];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
  }
}

void __49__ICQUpgradeFlowManager__initiateFamilySetupFlow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Completed Family setup flow with success:%d error:%{public}@", (uint8_t *)v9, 0x12u);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  [*(id *)(a1 + 32) setCompletedFamilySetup:a2];
  [*(id *)(a1 + 32) _simulateDoneButton];
}

- (void)_sendDelegateLoadError:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(ICQUpgradeFlowManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  uint64_t v6 = [(ICQUpgradeFlowManager *)self delegate];
  uint64_t v7 = v6;
  if (v5)
  {
    [v6 upgradeFlowManagerDidFail:self error:v9];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v7 = [(ICQUpgradeFlowManager *)self delegate];
    [v7 manager:self loadDidFailWithError:v9];
  }

LABEL_6:
}

- (void)_sendDelegateCancel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ICQUpgradeFlowManager__sendDelegateCancel__block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__ICQUpgradeFlowManager__sendDelegateCancel__block_invoke(uint64_t a1)
{
  [(id)objc_opt_class() removeActiveFlowManager:*(void *)(a1 + 32)];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 upgradeFlowManagerDidCancel:*(void *)(a1 + 32)];
  }
}

- (void)_sendDelegateComplete
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ICQUpgradeFlowManager__sendDelegateComplete__block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __46__ICQUpgradeFlowManager__sendDelegateComplete__block_invoke(uint64_t a1)
{
  [(id)objc_opt_class() removeActiveFlowManager:*(void *)(a1 + 32)];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 upgradeFlowManagerDidComplete:*(void *)(a1 + 32)];

    char v5 = (void *)MEMORY[0x263F888E8];
    [v5 sendEventFor:3 withBundleID:0 link:0];
  }
}

- (void)_sendDelegateDidPresentViewController:(id)a3
{
  id v7 = a3;
  id v4 = [(ICQUpgradeFlowManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(ICQUpgradeFlowManager *)self delegate];
    [v6 upgradeFlowManager:self didPresentViewController:v7];
  }
}

- (ICQUpgradeFlowManager)initWithJourneyId:(id)a3 params:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [MEMORY[0x263F88928] sharedOfferManager];
  id v9 = [v8 currentDefaultOffer];

  __int16 v10 = [(ICQUpgradeFlowManager *)self initWithOffer:v9];
  if (!v10)
  {
LABEL_6:
    id v16 = v10;
    goto LABEL_10;
  }
  id v11 = [v9 journeyLinkForId:v6];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = [v11 serverUIURL];
    id v14 = [(ICQUpgradeFlowManager *)v10 addParams:v7 toJourneyURL:v13];

    [v12 setServerUIURL:v14];
    [(ICQUpgradeFlowManager *)v10 setIcqLink:v12];
    __int16 v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      uint64_t v20 = v14;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Created flow manager with journey URL: %@", (uint8_t *)&v19, 0xCu);
    }

    goto LABEL_6;
  }
  uint64_t v17 = _ICQGetLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[ICQUpgradeFlowManager initWithJourneyId:params:]((uint64_t)v6, (uint64_t)v9, v17);
  }

  id v16 = 0;
LABEL_10:

  return v16;
}

- (ICQUpgradeFlowManager)initWithJourneyId:(id)a3
{
  return [(ICQUpgradeFlowManager *)self initWithJourneyId:a3 params:0];
}

+ (void)flowManagerWithJourneyId:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = [MEMORY[0x263F88928] sharedOfferManager];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__ICQUpgradeFlowManager_flowManagerWithJourneyId_params_completion___block_invoke;
  v14[3] = &unk_264921DE0;
  id v16 = v8;
  id v17 = v9;
  id v15 = v7;
  id v11 = v8;
  id v12 = v9;
  id v13 = v7;
  [v10 getDefaultOfferWithCompletion:v14];
}

void __68__ICQUpgradeFlowManager_flowManagerWithJourneyId_params_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [[ICQUpgradeFlowManager alloc] initWithOffer:v5];
  id v8 = [v5 journeyLinkForId:a1[4]];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = a1[5];
    id v11 = [v8 serverUIURL];
    id v12 = [(ICQUpgradeFlowManager *)v7 addParams:v10 toJourneyURL:v11];

    [v9 setServerUIURL:v12];
    [(ICQUpgradeFlowManager *)v7 setIcqLink:v9];
    id v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v12;
      _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "Created flow manager with journey URL: %@", (uint8_t *)&v15, 0xCu);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __68__ICQUpgradeFlowManager_flowManagerWithJourneyId_params_completion___block_invoke_cold_1(a1 + 4, (uint64_t)v5, v14);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)beginJourney
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "requestedServerUIURL is nil. Use initWithJourneyId: to initialize %{public}@ before calling beginJourney", (uint8_t *)&v4, 0xCu);
}

- (id)addParams:(id)a3 toJourneyURL:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [a4 absoluteString];
  id v7 = (void *)[v6 mutableCopy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [NSString stringWithFormat:@"&%@", *(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v7 appendString:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = [NSURL URLWithString:v7];

  return v14;
}

- (void)liftUIPresenterDidComplete:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ICQUpgradeFlowManager liftUIPresenterDidComplete:]";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__ICQUpgradeFlowManager_liftUIPresenterDidComplete___block_invoke;
  v5[3] = &unk_264921C80;
  v5[4] = self;
  [(ICQUpgradeFlowManager *)self dismissNavigationControllerAnimated:1 success:1 completion:v5];
}

uint64_t __52__ICQUpgradeFlowManager_liftUIPresenterDidComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDelegateComplete];
}

- (void)liftUIPresenterDidCancel:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[ICQUpgradeFlowManager liftUIPresenterDidCancel:]";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v5 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __50__ICQUpgradeFlowManager_liftUIPresenterDidCancel___block_invoke;
  v6[3] = &unk_264921C80;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

uint64_t __50__ICQUpgradeFlowManager_liftUIPresenterDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDelegateCancel];
}

- (void)liftUIPresenter:(id)a3 performAction:(int64_t)a4 parameters:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = _ICQStringForAction();
    *(_DWORD *)buf = 136315394;
    uint64_t v35 = "-[ICQUpgradeFlowManager liftUIPresenter:performAction:parameters:completion:]";
    __int16 v36 = 2112;
    uint64_t v37 = v13;
    _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "%s action:%@", buf, 0x16u);
  }
  id v14 = objc_alloc_init(MEMORY[0x263F637A8]);
  [v14 setName:@"LiftUI Proxy"];
  [v14 setClientInfo:v10];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v15 = [(ICQUpgradeFlowManager *)self serverHooks];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v20 shouldMatchModel:v14])
        {
          [v20 setDelegate:self];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __77__ICQUpgradeFlowManager_liftUIPresenter_performAction_parameters_completion___block_invoke;
          v26[3] = &unk_264921E30;
          id v28 = v11;
          v26[4] = v20;
          v26[5] = self;
          uint64_t v24 = v25;
          id v27 = v25;
          [v20 processObjectModel:v14 completion:v26];

          goto LABEL_16;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  if (a4 == 112
    && ([v10 objectForKeyedSubscript:@"url"],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        v21,
        v21))
  {
    id v22 = [v10 objectForKeyedSubscript:@"url"];
    uint64_t v23 = [v10 objectForKeyedSubscript:@"httpMethod"];
    [(ICQUpgradeFlowManager *)self _handleRemoteUIActionWithURLString:v22 httpMethod:v23];

    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
    uint64_t v24 = v25;
  }
  else
  {
    uint64_t v24 = v25;
    [(ICQUpgradeFlowManager *)self sender:v25 action:a4 parameters:v10];
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
  }
LABEL_16:
}

void __77__ICQUpgradeFlowManager_liftUIPresenter_performAction_parameters_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __77__ICQUpgradeFlowManager_liftUIPresenter_performAction_parameters_completion___block_invoke_2;
  v7[3] = &unk_264921E08;
  char v12 = a2;
  id v8 = v5;
  id v11 = *(id *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __77__ICQUpgradeFlowManager_liftUIPresenter_performAction_parameters_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 72)) {
      int v4 = @"YES";
    }
    else {
      int v4 = @"NO";
    }
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "LiftUI server hook handler completed with success:%@ error:%@", (uint8_t *)&v9, 0x16u);
  }

  if (*(void *)(a1 + 64))
  {
    id v5 = [*(id *)(a1 + 40) continuationResponseBody];
    if (v5)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 48) + 72), v5);
      [*(id *)(a1 + 56) updateStoreDataForKey:@"refreshBody" value:v5];
    }
    id v6 = [*(id *)(a1 + 32) domain];
    if ([v6 isEqualToString:*MEMORY[0x263F27850]])
    {
      uint64_t v7 = [*(id *)(a1 + 32) code];

      if (v7 == 6)
      {
        id v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_14:
        v8();

        return;
      }
    }
    else
    {
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_14;
  }
}

- (void)_handleRemoteUIActionWithURLString:(id)a3 httpMethod:(id)a4
{
  id v6 = (__CFString *)a4;
  uint64_t v17 = v6;
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = @"POST";
  }
  id v8 = (void *)MEMORY[0x263F089E0];
  int v9 = [NSURL URLWithString:a3];
  id v10 = [v8 requestWithURL:v9];

  __int16 v11 = [(__CFString *)v7 uppercaseString];
  int v12 = [v11 isEqualToString:@"POST"];

  if (v12)
  {
    nextRefreshBody = self->_nextRefreshBody;
    self->_nextRefreshBody = 0;
    id v14 = nextRefreshBody;

    int v15 = [MEMORY[0x263F08AC0] dataWithPropertyList:v14 format:100 options:0 error:0];

    [v10 setHTTPBody:v15];
    uint64_t v16 = [(__CFString *)v7 uppercaseString];
    [v10 setHTTPMethod:v16];
  }
  [(ICQUpgradeFlowManager *)self _presentRemoteViewWithData:0 andRequest:v10];
}

- (void)liftUIPresenter:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a5;
  uint64_t Nanoseconds = _ICQSignpostGetNanoseconds();
  int v9 = _ICQSignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t identifier = self->_loadLiftUISignpost.identifier;
  if (identifier - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = @"NO";
    if (v5) {
      int v12 = @"YES";
    }
    int v21 = 138412290;
    *(void *)id v22 = v12;
    _os_signpost_emit_with_name_impl(&dword_22C821000, v10, OS_SIGNPOST_INTERVAL_END, identifier, "UpsellLoadLiftUI", "Success: %@", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v13 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int identifier_low = LOWORD(self->_loadLiftUISignpost.identifier);
    int v21 = 67109634;
    *(_DWORD *)id v22 = identifier_low;
    if (v5) {
      uint64_t v20 = @"YES";
    }
    else {
      uint64_t v20 = @"NO";
    }
    *(_WORD *)&v22[4] = 2048;
    *(double *)&v22[6] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v23 = 2112;
    uint64_t v24 = v20;
    _os_log_debug_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) UpsellLoadLiftUI Success: %@", (uint8_t *)&v21, 0x1Cu);
  }

  if (!v5)
  {
    uint64_t v14 = [v7 code];
    int v15 = _ICQGetLogSystem();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14 == -1009)
    {
      if (v16)
      {
        uint64_t v17 = [v7 debugDescription];
        int v21 = 138412290;
        *(void *)id v22 = v17;
        _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "RemoteUIController finished loading with network error: %@", (uint8_t *)&v21, 0xCu);
      }
      [(ICQUpgradeFlowManager *)self showNetworkFailurePage];
    }
    else
    {
      if (v16)
      {
        uint64_t v18 = [v7 debugDescription];
        int v21 = 138412290;
        *(void *)id v22 = v18;
        _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "RemoteUIController finished loading with error: %@", (uint8_t *)&v21, 0xCu);
      }
      [(ICQUpgradeFlowManager *)self showUpgradeFailurePage];
    }
  }
}

- (void)dismissObjectModelsAnimated:(BOOL)a3 completion:(id)a4
{
  id v4 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentFlowHostedInNavigationController:(id)a3
{
  id v5 = a3;
  id v6 = [(ICQUpgradeFlowManager *)self offer];
  id v7 = [v6 upgradeFlowSpecification];

  id v8 = [(ICQUpgradeFlowManager *)self offer];
  int v9 = [v8 alertSpecificationAtIndex:0];
  [v7 setStartAlert:v9];

  id v10 = [v7 startPage];

  if (!v10)
  {
    int v12 = [v7 startAlert];

    uint64_t v13 = _ICQGetLogSystem();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        __int16 v18 = 0;
        int v15 = "startAlert not supported for hosted presentation";
        BOOL v16 = (uint8_t *)&v18;
LABEL_8:
        _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
      }
    }
    else if (v14)
    {
      __int16 v17 = 0;
      int v15 = "offer missing upgrade flow specification";
      BOOL v16 = (uint8_t *)&v17;
      goto LABEL_8;
    }

    __int16 v11 = ICQCreateError();
    [(ICQUpgradeFlowManager *)self _sendDelegateLoadError:v11];
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_hostingNavigationController, a3);
  [(UINavigationController *)self->_hostingNavigationController setDelegate:self];
  self->_shouldNavigationControllerBeDismissed = 0;
  __int16 v11 = [v7 startPage];
  [(ICQUpgradeFlowManager *)self _presentPageWithSpecification:v11];
LABEL_10:
}

- (void)remoteUIFlowManager:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      __int16 v11 = @"YES";
    }
    else {
      __int16 v11 = @"NO";
    }
    int v12 = [v9 localizedDescription];
    int v16 = 136315906;
    __int16 v17 = "-[ICQUpgradeFlowManager remoteUIFlowManager:didLoadWithSuccess:error:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    int v21 = v11;
    __int16 v22 = 2112;
    __int16 v23 = v12;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "%s: %@, success: %@, error: %@", (uint8_t *)&v16, 0x2Au);
  }
  uint64_t v13 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
  int v14 = [v13 isNavigationBarHidden];

  if (v14)
  {
    int v15 = [(ICQUpgradeFlowManager *)self hostingNavigationController];
    [v15 setNavigationBarHidden:0];
  }
}

- (void)beginOSLOFlowWithPresentingViewController:(id)a3
{
  osloPresenter = self->_osloPresenter;
  if (!osloPresenter)
  {
    id v5 = a3;
    BOOL v6 = [[ICQUIOSLOPresenter alloc] initWithOffer:self->_offer link:self->_icqLink presenter:v5];

    id v7 = self->_osloPresenter;
    self->_osloPresenter = v6;

    [(ICQUIOSLOPresenter *)self->_osloPresenter setDelegate:self];
    osloPresenter = self->_osloPresenter;
  }
  [(ICQUIOSLOPresenter *)osloPresenter beginOSLOPurchaseFlow];
}

- (void)purchaseFlowCompletedWith:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    osloPresenter = self->_osloPresenter;
    if (v4) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    id v10 = [v6 localizedDescription];
    int v14 = 136315906;
    int v15 = "-[ICQUpgradeFlowManager purchaseFlowCompletedWith:error:]";
    __int16 v16 = 2112;
    __int16 v17 = osloPresenter;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    int v21 = v10;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@, success: %@, error: %@", (uint8_t *)&v14, 0x2Au);
  }
  __int16 v11 = [(ICQUpgradeFlowManager *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(ICQUpgradeFlowManager *)self delegate];
    [v13 upgradeFlowManagerDidComplete:self];
  }
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (ICQLink)icqLink
{
  return self->_icqLink;
}

- (void)setIcqLink:(id)a3
{
}

- (ICQUpgradeFlowOptions)flowOptions
{
  return self->_flowOptions;
}

- (void)setFlowOptions:(id)a3
{
}

- (ICQUpgradeFlowManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQUpgradeFlowManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (NSDictionary)bindings
{
  return self->_bindings;
}

- (void)setBindings:(id)a3
{
}

- (NSData)preloadedRemoteUIData
{
  return self->_preloadedRemoteUIData;
}

- (void)setPreloadedRemoteUIData:(id)a3
{
}

- (BOOL)shouldNavigationControllerBeDismissed
{
  return self->_shouldNavigationControllerBeDismissed;
}

- (void)setShouldNavigationControllerBeDismissed:(BOOL)a3
{
  self->_shouldNavigationControllerBeDismissed = a3;
}

- (UINavigationController)hostingNavigationController
{
  return self->_hostingNavigationController;
}

- (void)setHostingNavigationController:(id)a3
{
}

- (ICQAlertController)upgradeAlertController
{
  return self->_upgradeAlertController;
}

- (void)setUpgradeAlertController:(id)a3
{
}

- (BOOL)completedFamilySetup
{
  return self->_completedFamilySetup;
}

- (void)setCompletedFamilySetup:(BOOL)a3
{
  self->_completedFamilySetup = a3;
}

- (AAUIRemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void)setRemoteUIController:(id)a3
{
}

- (NSString)closeURL
{
  return self->_closeURL;
}

- (void)setCloseURL:(id)a3
{
}

- (ICQLiftUIPresenter)liftUIPresenter
{
  return self->_liftUIPresenter;
}

- (void)setLiftUIPresenter:(id)a3
{
}

- (ICQUIRemoteUIPresenter)remoteUIPresenter
{
  return self->_remoteUIPresenter;
}

- (void)setRemoteUIPresenter:(id)a3
{
}

- (ICQUIOSLOPresenter)osloPresenter
{
  return self->_osloPresenter;
}

- (void)setOsloPresenter:(id)a3
{
}

- (NSArray)serverHooks
{
  return self->_serverHooks;
}

- (void)setServerHooks:(id)a3
{
}

- (icq_signpost_s)loadLiftUISignpost
{
  unint64_t timestamp = self->_loadLiftUISignpost.timestamp;
  unint64_t identifier = self->_loadLiftUISignpost.identifier;
  result.unint64_t timestamp = timestamp;
  result.unint64_t identifier = identifier;
  return result;
}

- (void)setLoadLiftUISignpost:(icq_signpost_s)a3
{
  self->_loadLiftUISignpost = a3;
}

- (icq_signpost_s)loadRemoteUISignpost
{
  unint64_t timestamp = self->_loadRemoteUISignpost.timestamp;
  unint64_t identifier = self->_loadRemoteUISignpost.identifier;
  result.unint64_t timestamp = timestamp;
  result.unint64_t identifier = identifier;
  return result;
}

- (void)setLoadRemoteUISignpost:(icq_signpost_s)a3
{
  self->_loadRemoteUISignpost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHooks, 0);
  objc_storeStrong((id *)&self->_osloPresenter, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_storeStrong((id *)&self->_closeURL, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_upgradeAlertController, 0);
  objc_storeStrong((id *)&self->_hostingNavigationController, 0);
  objc_storeStrong((id *)&self->_preloadedRemoteUIData, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_flowOptions, 0);
  objc_storeStrong((id *)&self->_icqLink, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_nextRefreshBody, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
  objc_storeStrong((id *)&self->_upgradeStorageHook, 0);
  objc_storeStrong((id *)&self->_busyOfferViewController, 0);
  objc_storeStrong(&self->_didComplete, 0);
}

- (void)beginPostPurchaseFlowWithLink:(id)a3 offer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v16 = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Preparing out of process upgradeFlowManager to preent purchase completion flow.", v16, 2u);
  }

  id v9 = +[ICQUIOutOfProcessUpgradeFlowManager sharedManager];
  id v10 = [(ICQUpgradeFlowManager *)self delegate];
  [v9 setDelegate:v10];

  __int16 v11 = [(ICQUpgradeFlowManager *)self flowOptions];
  [v9 setFlowOptions:v11];

  char v12 = [(ICQUpgradeFlowManager *)self offer];
  [v9 setOffer:v12];

  uint64_t v13 = [(ICQUpgradeFlowManager *)self icqLink];
  [v9 setLink:v13];

  [v9 setFlowManager:self];
  int v14 = [MEMORY[0x263F086E0] mainBundle];
  int v15 = [v14 bundleIdentifier];
  [v9 setPresentingSceneBundleIdentifier:v15];

  [v9 beginPostPurchaseFlowWithOffer:v6 link:v7];
}

+ (void)needsToRunWithCompletion:(id)a3
{
  id v4 = a3;
  if (needsToRunWithCompletion__onceToken != -1) {
    dispatch_once(&needsToRunWithCompletion__onceToken, &__block_literal_global_12);
  }
  id v5 = [MEMORY[0x263F88928] sharedOfferManager];
  char v6 = [v5 isBuddyOfferEnabled];

  if (v6)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    char v24 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 0;
    dispatch_time_t v7 = dispatch_time(0, 10000000000);
    id v8 = needsToRunWithCompletion__dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_2;
    block[3] = &unk_264922930;
    id v19 = v21;
    __int16 v20 = v23;
    id v9 = v4;
    id v18 = v9;
    dispatch_after(v7, v8, block);
    id v10 = [MEMORY[0x263F88928] sharedOfferManager];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_9;
    v12[3] = &unk_264922980;
    int v14 = v23;
    int v15 = v21;
    id v13 = v9;
    id v16 = a1;
    [v10 getOfferForBundleIdentifier:@"com.apple.purplebuddy" completion:v12];

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);
  }
  else
  {
    __int16 v11 = ICQCreateErrorWithMessage();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
  }
}

void __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.cloud.quota.buddyNeedsToRun", 0);
  int v1 = (void *)needsToRunWithCompletion__dispatchQueue;
  needsToRunWithCompletion__dispatchQueue = (uint64_t)v0;
}

void __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_2(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    uint64_t v2 = _ICQGetLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "needsToRunWithCompletion: took too long to determine answer, so NERP", v5, 2u);
    }

    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
    {
      uint64_t v3 = a1[4];
      id v4 = ICQCreateErrorWithMessage();
      (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
    }
  }
}

void __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_time_t v7 = needsToRunWithCompletion__dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_2_10;
  block[3] = &unk_264922958;
  uint64_t v16 = *(void *)(a1 + 48);
  id v13 = v6;
  long long v11 = *(_OWORD *)(a1 + 32);
  id v8 = (id)v11;
  long long v15 = v11;
  id v14 = v5;
  uint64_t v17 = *(void *)(a1 + 56);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_2_10(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    if (*(void *)(a1 + 32))
    {
      uint64_t v2 = _ICQGetLogSystem();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(__CFString **)(a1 + 32);
        int v11 = 138412290;
        char v12 = v3;
        _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Setup Assistant should not run upgrade flow due to ICQ error %@", (uint8_t *)&v11, 0xCu);
      }

      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_12:
      v4();
      return;
    }
    if ([*(id *)(a1 + 40) isBuddyOffer])
    {
      int v5 = [*(id *)(a1 + 72) shouldShowForOffer:*(void *)(a1 + 40)];
      id v6 = _ICQGetLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_time_t v7 = @"should not";
        if (v5) {
          dispatch_time_t v7 = @"should";
        }
        int v11 = 138543362;
        char v12 = v7;
        _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Setup Assitant %{public}@ run upgrade flow", (uint8_t *)&v11, 0xCu);
      }

      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_12;
    }
    id v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "ERROR: offer is not a buddy offer", (uint8_t *)&v11, 2u);
    }

    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = ICQCreateErrorWithMessage();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
}

- (void)_presentLiftUIUsingViewController:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Unable to start liftUI flow. Missing URL!", v2, v3, v4, v5, v6);
}

- (void)_presentLiftUIUsingViewController:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Failed to start LiftUI flow", v2, v3, v4, v5, v6);
}

- (void)_presentLiftUIUsingViewController:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 serverUIURL];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22C821000, v3, v4, "SIGNPOST BEGIN [id: %hu]: UpsellLoadLiftUI  enableTelemetry=YES URL: %@", v5, v6, v7, v8, 2u);
}

- (void)_presentRemoteViewWithData:(uint64_t)a1 andRequest:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 offer];
  uint64_t v3 = [v2 remoteUIURL];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22C821000, v4, v5, "SIGNPOST BEGIN [id: %hu]: UpsellLoadRemoteUI  enableTelemetry=YES URL: %@", v6, v7, v8, v9, 2u);
}

- (void)remoteUIController:didReceiveObjectModel:actionSignal:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Unable to present upsell, user is already a subscriber! Asking CSF to refresh status", v2, v3, v4, v5, v6);
}

- (void)remoteUIController:didFinishLoadWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "We've hit another 401, nothing more we can do here...", v2, v3, v4, v5, v6);
}

- (void)initWithJourneyId:(NSObject *)a3 params:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4(&dword_22C821000, a2, a3, "Unable to retrieve journey link with id %@, in offer %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __68__ICQUpgradeFlowManager_flowManagerWithJourneyId_params_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4(&dword_22C821000, a2, a3, "Unable to retrieve journey link with id %@, in offer %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end