@interface VUIAppInstallConfirmationViewController
- (UIBarButtonItem)barButtonItem;
- (UIButton)actionButton;
- (VUIAppInstallConfirmationView)confirmationView;
- (VUIAppInstallConfirmationViewController)init;
- (VUIAppInstallConfirmationViewController)initWithInstallable:(id)a3;
- (VUIAppInstallLockup)lockup;
- (WLKInstallable)installable;
- (id)_fileSizeWithDeviceSizes:(id)a3;
- (id)_namedRatingWithRatings:(id)a3;
- (id)actionHandler;
- (id)appStoreHandler;
- (id)cancelationHandler;
- (id)secondaryLinkHandler;
- (unint64_t)state;
- (void)_fetchAppInfo;
- (void)_fetchStoreInfoForAdamID:(id)a3 completion:(id)a4;
- (void)_handleAction;
- (void)_handleAppStore;
- (void)_handleCancel;
- (void)_handleSecondaryLink;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)setActionHandler:(id)a3;
- (void)setAppStoreHandler:(id)a3;
- (void)setBarButtonItem:(id)a3;
- (void)setCancelationHandler:(id)a3;
- (void)setConfirmationView:(id)a3;
- (void)setInstallable:(id)a3;
- (void)setInstallingState;
- (void)setMessage:(id)a3;
- (void)setPreInstallState;
- (void)setSecondaryLinkHandler:(id)a3;
- (void)setSecondaryLinkTitle:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateMessage:(id)a3;
- (void)setUpdateTitle:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation VUIAppInstallConfirmationViewController

- (VUIAppInstallConfirmationViewController)init
{
  return 0;
}

- (VUIAppInstallConfirmationViewController)initWithInstallable:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)VUIAppInstallConfirmationViewController;
    v6 = [(VUIAppInstallConfirmationViewController *)&v12 init];
    if (v6)
    {
      v7 = [VUIAppInstallConfirmationView alloc];
      uint64_t v8 = -[VUIAppInstallConfirmationView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      confirmationView = v6->_confirmationView;
      v6->_confirmationView = (VUIAppInstallConfirmationView *)v8;

      objc_storeStrong((id *)&v6->_installable, a3);
    }
    self = v6;
    v10 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"installable must be non-nil"];
    v10 = 0;
  }

  return v10;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  [(VUIAppInstallConfirmationView *)self->_confirmationView setTitle:v4];
  id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)VUIAppInstallConfirmationViewController;
    [(VUIAppInstallConfirmationViewController *)&v7 setTitle:v4];
  }
}

- (void)setMessage:(id)a3
{
}

- (void)setUpdateMessage:(id)a3
{
}

- (void)setUpdateTitle:(id)a3
{
}

- (void)setSecondaryLinkTitle:(id)a3
{
  confirmationView = self->_confirmationView;
  id v4 = a3;
  id v5 = [(VUIAppInstallConfirmationView *)confirmationView secondaryLinkButton];
  [v5 setTitle:v4 forState:0];
}

- (VUIAppInstallLockup)lockup
{
  return [(VUIAppInstallConfirmationView *)self->_confirmationView lockupView];
}

- (UIButton)actionButton
{
  return [(VUIAppInstallConfirmationView *)self->_confirmationView actionButton];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VUIAppInstallConfirmationViewController;
  [(VUIAppInstallConfirmationViewController *)&v11 viewDidAppear:a3];
  v14 = @"appIds";
  id v4 = [(VUIAppInstallConfirmationViewController *)self installable];
  id v5 = [v4 appBundleIDs];
  uint64_t v6 = [v5 componentsJoinedByString:@", "];
  v15[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  objc_super v12 = @"pageDetails";
  v13 = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v9 = +[VUIMetricsPageEventData createWithPageId:@"AppInstall" andPageType:@"AppInstall" andEventData:v8];

  v10 = +[VUIMetricsController sharedInstance];
  [v10 recordPage:v9];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = [a3 nextFocusedItem];
  uint64_t v6 = [(VUIAppInstallConfirmationView *)self->_confirmationView lockupView];

  if (v5 == v6)
  {
    objc_super v7 = [(VUIAppInstallConfirmationView *)self->_confirmationView actionButton];
    [v7 setEnabled:0];

    uint64_t v8 = [(VUIAppInstallConfirmationView *)self->_confirmationView cancelButton];
    [v8 setEnabled:0];

    id v9 = [(VUIAppInstallConfirmationView *)self->_confirmationView appStoreButton];
    [v9 setEnabled:0];
  }
}

- (void)setPreInstallState
{
  self->_state = 1;
  v3 = [(VUIAppInstallConfirmationViewController *)self lockup];
  id v4 = [v3 installView];
  [v4 setWaiting];

  id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  confirmationView = self->_confirmationView;
  if (v6 == 2)
  {
    uint64_t v8 = [(VUIAppInstallConfirmationView *)confirmationView lockupView];
    [v8 setCanFocus:1];

    id v9 = self->_confirmationView;
    [(VUIAppInstallConfirmationView *)v9 setNeedsFocusUpdate];
  }
  else
  {
    v10 = [(VUIAppInstallConfirmationView *)confirmationView actionButton];
    [v10 setEnabled:0];

    objc_super v11 = [(VUIAppInstallConfirmationView *)self->_confirmationView cancelButton];
    [v11 setEnabled:0];

    id v13 = [(VUIAppInstallConfirmationView *)self->_confirmationView actionButton];
    objc_super v12 = [MEMORY[0x1E4FB1618] lightGrayColor];
    [v13 setBackgroundColor:v12];
  }
}

- (void)setInstallingState
{
  self->_state = 2;
  if ([(NSString *)self->_updateTitle length]) {
    [(VUIAppInstallConfirmationView *)self->_confirmationView setTitle:self->_updateTitle];
  }
  if ([(NSString *)self->_updateMessage length]) {
    [(VUIAppInstallConfirmationView *)self->_confirmationView setMessage:self->_updateMessage];
  }
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 2)
  {
    barButtonItem = self->_barButtonItem;
    uint64_t v6 = +[VUILocalizationManager sharedInstance];
    objc_super v7 = [v6 localizedStringForKey:@"APP_INSTALL_ACTION_TITLE_DONE"];
    [(UIBarButtonItem *)barButtonItem setTitle:v7];

    uint64_t v8 = +[VUILocalizationManager sharedInstance];
    id v9 = [v8 localizedStringForKey:@"APP_INSTALL_ACTION_TITLE_INSTALLING"];

    v10 = [(VUIAppInstallConfirmationView *)self->_confirmationView actionButton];
    [v10 setTitle:v9 forStates:2];
  }
  id v11 = [(VUIAppInstallConfirmationView *)self->_confirmationView actionButton];
  [v11 setAccessibilityIdentifier:@"UIA.TV.Button.install.state=\"installing\""];
}

- (void)loadView
{
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 2)
  {
    id v5 = [(VUIAppInstallConfirmationView *)self->_confirmationView cancelButton];
    [v5 addTarget:self action:sel__handleCancel forControlEvents:0x2000];

    id appStoreHandler = self->_appStoreHandler;
    objc_super v7 = [(VUIAppInstallConfirmationView *)self->_confirmationView appStoreButton];
    uint64_t v8 = v7;
    if (appStoreHandler) {
      [v7 addTarget:self action:sel__handleAppStore forControlEvents:0x2000];
    }
    else {
      [v7 setHidden:1];
    }

    id secondaryLinkHandler = self->_secondaryLinkHandler;
    v16 = [(VUIAppInstallConfirmationView *)self->_confirmationView secondaryLinkButton];
    v17 = v16;
    if (secondaryLinkHandler) {
      [v16 addTarget:self action:sel__handleSecondaryLink forControlEvents:0x2000];
    }
    else {
      [v16 setHidden:1];
    }
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v10 = +[VUILocalizationManager sharedInstance];
    id v11 = [v10 localizedStringForKey:@"APP_INSTALL_ACTION_TITLE_CLOSE"];
    objc_super v12 = (UIBarButtonItem *)[v9 initWithTitle:v11 style:2 target:self action:sel__handleCancel];
    barButtonItem = self->_barButtonItem;
    self->_barButtonItem = v12;

    v14 = [(VUIAppInstallConfirmationViewController *)self navigationItem];
    [v14 setRightBarButtonItem:self->_barButtonItem];
  }
  v18 = [(VUIAppInstallConfirmationView *)self->_confirmationView actionButton];
  [v18 addTarget:self action:sel__handleAction forControlEvents:0x2000];

  [(VUIAppLoadingViewController *)self setView:self->_confirmationView];
  [(VUIAppLoadingViewController *)self setLoading:1];
  [(VUIAppInstallConfirmationViewController *)self _fetchAppInfo];
}

- (void)_handleAction
{
  v6[3] = *MEMORY[0x1E4F143B8];
  actionHandler = (void (**)(id, SEL))self->_actionHandler;
  if (actionHandler) {
    actionHandler[2](actionHandler, a2);
  }
  v3 = +[VUIMetricsController sharedInstance];
  v5[0] = @"targetId";
  v5[1] = @"targetType";
  v6[0] = @"install";
  v6[1] = @"button";
  v5[2] = @"actionType";
  v6[2] = @"install";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v3 recordClick:v4];
}

- (void)_handleCancel
{
  v6[3] = *MEMORY[0x1E4F143B8];
  cancelationHandler = (void (**)(id, unint64_t))self->_cancelationHandler;
  if (cancelationHandler) {
    cancelationHandler[2](self->_cancelationHandler, self->_state);
  }
  v3 = +[VUIMetricsController sharedInstance];
  v5[0] = @"targetId";
  v5[1] = @"targetType";
  v6[0] = @"cancel";
  v6[1] = @"button";
  v5[2] = @"actionType";
  v6[2] = @"cancel";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v3 recordClick:v4];
}

- (void)_handleAppStore
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id appStoreHandler = (void (**)(id, unint64_t))self->_appStoreHandler;
  if (appStoreHandler) {
    appStoreHandler[2](self->_appStoreHandler, self->_state);
  }
  v3 = +[VUIMetricsController sharedInstance];
  v5[0] = @"targetId";
  v5[1] = @"targetType";
  v6[0] = @"appStore";
  v6[1] = @"button";
  v5[2] = @"actionType";
  v6[2] = @"appStore";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v3 recordClick:v4];
}

- (void)_handleSecondaryLink
{
  id secondaryLinkHandler = (void (**)(void))self->_secondaryLinkHandler;
  if (secondaryLinkHandler) {
    secondaryLinkHandler[2]();
  }
}

- (void)_fetchAppInfo
{
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  CGFloat v5 = v4;

  +[VUIAppInstallConfirmationView iconSize];
  double v7 = v6;
  double v9 = v8;
  CGAffineTransformMakeScale(&v45, v5, v5);
  double v10 = v9 * v45.c + v45.a * v7;
  double v11 = v9 * v45.d + v45.b * v7;
  objc_super v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  dispatch_group_enter(v12);
  id v13 = [(VUIAppInstallConfirmationViewController *)self installable];
  v14 = [v13 name];
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__4;
  v43[4] = __Block_byref_object_dispose__4;
  id v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__4;
  v41[4] = __Block_byref_object_dispose__4;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__4;
  v39[4] = __Block_byref_object_dispose__4;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__4;
  v37[4] = __Block_byref_object_dispose__4;
  id v38 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke;
  v34[3] = &unk_1E6DF60A8;
  v36 = v43;
  v15 = v12;
  v35 = v15;
  +[VUIAppIconImageService fetchIconForInstallable:size:completion:](VUIAppIconImageService, "fetchIconForInstallable:size:completion:", v13, v34, v10, v11);
  v16 = [v13 appAdamIDs];
  v17 = [v16 firstObject];

  if (![(__CFString *)v17 length])
  {
    NSLog(&cfstr_Vuiappinstallc.isa);

    v17 = &stru_1F3E921E0;
  }
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke_2;
  v27[3] = &unk_1E6DF60D0;
  objc_copyWeak(&v32, &location);
  v29 = v39;
  v30 = v41;
  v31 = v37;
  v18 = v15;
  v28 = v18;
  [(VUIAppInstallConfirmationViewController *)self _fetchStoreInfoForAdamID:v17 completion:v27];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke_3;
  block[3] = &unk_1E6DF60F8;
  objc_copyWeak(&v26, &location);
  id v21 = v14;
  v22 = v43;
  v23 = v41;
  v24 = v39;
  v25 = v37;
  id v19 = v14;
  dispatch_group_notify(v18, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

void __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v15)
    {
      NSLog(&cfstr_Vuiappinstallc_0.isa);
      if ([v15 hasInAppPurchases])
      {
        double v7 = +[VUILocalizationManager sharedInstance];
        uint64_t v8 = [v7 localizedStringForKey:@"APP_INSTALL_OFFERS_IN_APP_PURCHASES"];
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        double v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;
      }
      double v11 = [v15 contentRatingsBySystemDictionary];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        id v13 = [WeakRetained _namedRatingWithRatings:v11];
      }
      else
      {
        id v13 = 0;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v13);
      if (isKindOfClass) {

      }
      v14 = [v15 subtitle];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 length]) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v14);
      }
    }
    else
    {
      NSLog(&cfstr_Vuiappinstallc_1.isa, v5);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__VUIAppInstallConfirmationViewController__fetchAppInfo__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    v3 = [WeakRetained confirmationView];
    [v3 setAppIcon:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    id v4 = [v8 confirmationView];
    [v4 setAppName:*(void *)(a1 + 32)];

    id v5 = [v8 confirmationView];
    [v5 setAgeRating:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    double v6 = [v8 confirmationView];
    [v6 setIAP:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    double v7 = [v8 confirmationView];
    [v7 setAppSubtitle:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

    [v8 setLoading:0];
    id WeakRetained = v8;
  }
}

- (void)_fetchStoreInfoForAdamID:(id)a3 completion:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = objc_msgSend(MEMORY[0x1E4F4DBD8], "wlk_defaultBag");
  if (v7
    && (uint64_t v8 = [objc_alloc(MEMORY[0x1E4F4DD40]) initWithType:0 clientIdentifier:@"com.tv.videosui" clientVersion:@"1" bag:v7]) != 0)
  {
    uint64_t v9 = (void *)v8;
    v14[0] = v5;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v9 setItemIdentifiers:v10];

    double v11 = [v9 perform];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__VUIAppInstallConfirmationViewController__fetchStoreInfoForAdamID_completion___block_invoke;
    v12[3] = &unk_1E6DF6120;
    id v13 = v6;
    [v11 addFinishBlock:v12];
  }
  else
  {
    NSLog(&cfstr_Vuiappinstallc_2.isa);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VUIAppInstallerErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
  }
}

void __79__VUIAppInstallConfirmationViewController__fetchStoreInfoForAdamID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = [a2 responseDictionary];
  if (v7 || !v5)
  {
    NSLog(&cfstr_Vuiappinstallc_3.isa, v7);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB5028]) initWithDictionary:v5];
    if (*(void *)(a1 + 32))
    {
      NSLog(&cfstr_Vuiappinstallc_4.isa);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (id)_fileSizeWithDeviceSizes:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [MEMORY[0x1E4F4DC48] thinnedAppVariantId];
  objc_msgSend(MEMORY[0x1E4F4DC48], "compatibleProductType", objc_claimAutoreleasedReturnValue());
  v11[1] = uint64_t v4 = 0;
  v11[2] = @"universal";
  while (1)
  {
    id v5 = (id)v11[v4];
    if (v5) {
      break;
    }
    if (++v4 == 3)
    {
      id v6 = 0;
      goto LABEL_6;
    }
  }
  id v6 = [v3 objectForKey:v5];
LABEL_6:
  if ([v5 length]) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    id v8 = 0;
  }
  else {
    id v8 = v6;
  }
  for (uint64_t i = 2; i != -1; --i)

  return v8;
}

- (id)_namedRatingWithRatings:(id)a3
{
  id v3 = [a3 objectForKey:@"appsApple"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 objectForKey:@"name"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)cancelationHandler
{
  return self->_cancelationHandler;
}

- (void)setCancelationHandler:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (id)appStoreHandler
{
  return self->_appStoreHandler;
}

- (void)setAppStoreHandler:(id)a3
{
}

- (id)secondaryLinkHandler
{
  return self->_secondaryLinkHandler;
}

- (void)setSecondaryLinkHandler:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setBarButtonItem:(id)a3
{
}

- (VUIAppInstallConfirmationView)confirmationView
{
  return self->_confirmationView;
}

- (void)setConfirmationView:(id)a3
{
}

- (WLKInstallable)installable
{
  return self->_installable;
}

- (void)setInstallable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installable, 0);
  objc_storeStrong((id *)&self->_confirmationView, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong(&self->_secondaryLinkHandler, 0);
  objc_storeStrong(&self->_appStoreHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong(&self->_cancelationHandler, 0);
  objc_storeStrong((id *)&self->_updateMessage, 0);
  objc_storeStrong((id *)&self->_updateTitle, 0);
}

@end