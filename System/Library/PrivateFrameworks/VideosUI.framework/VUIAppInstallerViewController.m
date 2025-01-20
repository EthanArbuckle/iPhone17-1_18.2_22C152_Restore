@interface VUIAppInstallerViewController
- (BOOL)displayAppStoreLink;
- (BOOL)displaySecondaryLink;
- (NSString)confirmationBody;
- (NSString)confirmationInstallButtonTitle;
- (NSString)confirmationTitle;
- (NSString)localizedContentTitle;
- (NSString)secondaryLinkTitle;
- (NSString)updateBody;
- (NSString)updateTitle;
- (NSURL)punchoutURL;
- (VUIASDDialogObserver)dialogObserver;
- (VUIAppInstallConfirmationViewController)confirmationController;
- (VUIAppInstallerViewController)init;
- (VUIAppInstallerViewController)initWithInstallable:(id)a3;
- (VUIAppInstallerViewController)initWithInstallable:(id)a3 punchoutURL:(id)a4;
- (WLKInstallable)installable;
- (double)lastProgress;
- (id)completionBlock;
- (id)progressBlock;
- (id)secondaryLinkHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)_beginInstallingApp;
- (void)_dismissAppInstallWithCompletion:(id)a3;
- (void)_finishInstallationWithCompletion:(id)a3;
- (void)_initConfirmation;
- (void)_updateWithInstallProgress:(double)a3;
- (void)beginInstallingAppWithProgressHandler:(id)a3 completion:(id)a4;
- (void)loadView;
- (void)setCompletionBlock:(id)a3;
- (void)setConfirmationBody:(id)a3;
- (void)setConfirmationController:(id)a3;
- (void)setConfirmationInstallButtonTitle:(id)a3;
- (void)setConfirmationTitle:(id)a3;
- (void)setDialogObserver:(id)a3;
- (void)setDisplayAppStoreLink:(BOOL)a3;
- (void)setDisplaySecondaryLink:(BOOL)a3;
- (void)setLastProgress:(double)a3;
- (void)setLocalizedContentTitle:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setPunchoutURL:(id)a3;
- (void)setSecondaryLinkHandler:(id)a3;
- (void)setSecondaryLinkTitle:(id)a3;
- (void)setUpdateBody:(id)a3;
- (void)setUpdateTitle:(id)a3;
@end

@implementation VUIAppInstallerViewController

- (VUIAppInstallerViewController)init
{
  return 0;
}

- (VUIAppInstallerViewController)initWithInstallable:(id)a3
{
  return [(VUIAppInstallerViewController *)self initWithInstallable:a3 punchoutURL:0];
}

- (VUIAppInstallerViewController)initWithInstallable:(id)a3 punchoutURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)VUIAppInstallerViewController;
    v9 = [(VUIAppInstallerViewController *)&v14 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_installable, a3);
      v10->_displayAppStoreLink = 1;
      v11 = objc_alloc_init(VUIASDDialogObserver);
      [(VUIASDDialogObserver *)v11 setPresenterViewController:v10];
      [(VUIAppInstallerViewController *)v10 setDialogObserver:v11];
      [(VUIAppInstallerViewController *)v10 setPunchoutURL:v8];
    }
    self = v10;
    v12 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"installable must be non-nil"];
    v12 = 0;
  }

  return v12;
}

- (void)_initConfirmation
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB5050] defaultAppLibrary];
  v4 = [v3 allAppBundleIdentifiers];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v5 = [(WLKInstallable *)self->_installable appBundleIDs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v88;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v88 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([v4 containsObject:*(void *)(*((void *)&v87 + 1) + 8 * i)])
        {
          unsigned int v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v87 objects:v92 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  unsigned int v9 = 0;
LABEL_11:

  NSLog(&cfstr_AppInstallatio.isa, v9);
  v73 = self->_confirmationTitle;
  v10 = self->_confirmationBody;
  v72 = self->_confirmationInstallButtonTitle;
  v69 = self->_localizedContentTitle;
  v11 = self->_updateBody;
  v71 = self->_updateTitle;
  v70 = [(WLKInstallable *)self->_installable name];
  if (![(NSString *)v73 length])
  {
    v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v13 = [v12 userInterfaceIdiom] == 2;

    objc_super v14 = NSString;
    v15 = +[VUILocalizationManager sharedInstance];
    v16 = v15;
    v17 = @"APP_GET_ALERT_TITLE_FORMAT";
    if (v13) {
      v17 = @"APP_INSTALL_ALERT_TITLE_FORMAT";
    }
    if (v9) {
      v18 = @"APP_UPDATE_ALERT_TITLE_FORMAT";
    }
    else {
      v18 = v17;
    }
    v19 = [v15 localizedStringForKey:v18];
    uint64_t v20 = [v14 stringWithValidatedFormat:v19, @"%@", 0, v70 validFormatSpecifiers error];

    v73 = (NSString *)v20;
  }
  if ([(NSString *)v10 length])
  {
    v68 = (__CFString *)v10;
  }
  else
  {
    if ([(NSString *)v69 length])
    {
      if (v9)
      {
        v21 = NSString;
        v22 = +[VUILocalizationManager sharedInstance];
        v23 = [v22 localizedStringForKey:@"APP_UPDATE_ALERT_MESSAGE_FORMAT"];
        v68 = [v21 stringWithValidatedFormat:v23, @"%@ %@", 0, v69, v70 validFormatSpecifiers error];
      }
      else
      {
        v24 = [MEMORY[0x1E4FB16C8] currentDevice];
        BOOL v25 = [v24 userInterfaceIdiom] == 2;

        v26 = NSString;
        v27 = +[VUILocalizationManager sharedInstance];
        v22 = v27;
        if (v25) {
          [v27 localizedStringForKey:@"APP_INSTALL_ALERT_MESSAGE_FORMAT"];
        }
        else {
        v23 = [v27 localizedStringForKey:@"APP_INSTALL_ALERT_MESSAGE_FORMAT_IOS"];
        }
        v68 = [v26 stringWithValidatedFormat:v23, @"%@ %@", 0, v69, v70 validFormatSpecifiers error];
      }

      v10 = (NSString *)v22;
    }
    else
    {
      v68 = @" ";
    }
  }
  if (![(NSString *)v72 length])
  {
    v28 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v29 = [v28 userInterfaceIdiom] == 2;

    v30 = +[VUILocalizationManager sharedInstance];
    v31 = v30;
    if (v29)
    {
      if (v9) {
        [v30 localizedStringForKey:@"APP_INSTALL_ACTION_TITLE_UPDATE"];
      }
      else {
      uint64_t v32 = [v30 localizedStringForKey:@"APP_INSTALL_ACTION_TITLE_INSTALL"];
      }

      v72 = (NSString *)v32;
    }
    else
    {
      if (v9) {
        v33 = @"APP_INSTALL_ACTION_TITLE_UPDATE";
      }
      else {
        v33 = @"APP_INSTALL_ACTION_TITLE_GET";
      }
      v34 = [v30 localizedStringForKey:v33];

      v72 = [v34 localizedUppercaseString];
      v31 = v34;
    }
  }
  if ([(NSString *)v11 length])
  {
    v35 = (__CFString *)v11;
  }
  else
  {
    if ([(NSString *)v69 length])
    {
      v36 = NSString;
      v37 = +[VUILocalizationManager sharedInstance];
      v38 = v37;
      if (v9) {
        v39 = @"APP_INSTALL_PAGE_UPDATE_SUBTITLE_FORMAT";
      }
      else {
        v39 = @"APP_INSTALL_PAGE_SUBTITLE_FORMAT";
      }
      v40 = [(NSString *)v37 localizedStringForKey:v39];
      v35 = [v36 stringWithValidatedFormat:v40, @"%@ %@", 0, v69, v70 validFormatSpecifiers error];

      v11 = v38;
    }
    else
    {
      v35 = @" ";
    }
  }
  if (![(NSString *)v71 length])
  {
    v41 = NSString;
    v42 = +[VUILocalizationManager sharedInstance];
    v43 = [v42 localizedStringForKey:@"APP_INSTALL_PAGE_TITLE_FORMAT"];
    v44 = [v41 stringWithValidatedFormat:v43, @"%@", 0, v70 validFormatSpecifiers error];

    if (v9)
    {
      v45 = NSString;
      v46 = +[VUILocalizationManager sharedInstance];
      v47 = [v46 localizedStringForKey:@"APP_INSTALL_PAGE_UPDATE_TITLE_FORMAT"];
      v71 = [v45 stringWithValidatedFormat:v47, @"%@", 0, v70 validFormatSpecifiers error];
    }
    else
    {
      v71 = (NSString *)v44;
    }
  }
  v48 = [[VUIAppInstallConfirmationViewController alloc] initWithInstallable:self->_installable];
  confirmationController = self->_confirmationController;
  self->_confirmationController = v48;

  v50 = [(VUIAppInstallerViewController *)self confirmationController];
  [v50 setTitle:v73];

  v51 = [(VUIAppInstallerViewController *)self confirmationController];
  [v51 setMessage:v68];

  v52 = [(VUIAppInstallerViewController *)self confirmationController];
  v53 = [v52 actionButton];
  [v53 setTitle:v72 forState:0];

  v54 = [(VUIAppInstallerViewController *)self confirmationController];
  [v54 setUpdateTitle:v71];

  v55 = [(VUIAppInstallerViewController *)self confirmationController];
  [v55 setUpdateMessage:v35];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke;
  aBlock[3] = &unk_1E6DF71E0;
  objc_copyWeak(&v85, &location);
  aBlock[4] = self;
  v56 = _Block_copy(aBlock);
  v57 = self->_confirmationController;
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_3;
  v82[3] = &unk_1E6DFC438;
  id v58 = v56;
  id v83 = v58;
  [(VUIAppInstallConfirmationViewController *)v57 setCancelationHandler:v82];
  v59 = self->_confirmationController;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_4;
  v80[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v81, &location);
  [(VUIAppInstallConfirmationViewController *)v59 setActionHandler:v80];
  v60 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v60 userInterfaceIdiom] == 2)
  {
    BOOL v61 = !self->_displayAppStoreLink;

    if (!v61)
    {
      objc_initWeak(&from, self->_installable);
      v62 = self->_confirmationController;
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_5;
      v76[3] = &unk_1E6DFC460;
      id v77 = v58;
      objc_copyWeak(&v78, &from);
      [(VUIAppInstallConfirmationViewController *)v62 setAppStoreHandler:v76];
      objc_destroyWeak(&v78);

      objc_destroyWeak(&from);
    }
  }
  else
  {
  }
  v63 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v63 userInterfaceIdiom] == 2)
  {
    BOOL v64 = !self->_displaySecondaryLink;

    if (!v64)
    {
      [(VUIAppInstallConfirmationViewController *)self->_confirmationController setSecondaryLinkTitle:self->_secondaryLinkTitle];
      v65 = self->_confirmationController;
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_7;
      v74[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v75, &location);
      [(VUIAppInstallConfirmationViewController *)v65 setSecondaryLinkHandler:v74];
      objc_destroyWeak(&v75);
    }
  }
  else
  {
  }
  v91 = self->_confirmationController;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  [(VUIAppInstallerViewController *)self setViewControllers:v66];

  v67 = [(VUIAppInstallerViewController *)self navigationBar];
  [v67 _setHidesShadow:1];
  [v67 _setDisableBlurTinting:1];

  objc_destroyWeak(&v81);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&location);
}

void __50__VUIAppInstallerViewController__initConfirmation__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (id *)(a1 + 40);
  if (a2 == 2)
  {
    NSLog(&cfstr_Vuiappinstalle_2.isa);
    id WeakRetained = objc_loadWeakRetained(v3);
    v5 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v6 = [WeakRetained confirmationController];
      uint64_t v7 = [v6 presentingViewController];
      [v7 dismissViewControllerAnimated:1 completion:0];
    }
  }
  else
  {
    NSLog(&cfstr_Vuiappinstalle_1.isa);
    id v8 = objc_loadWeakRetained(v3);
    v5 = v8;
    if (v8)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_2;
      v10[3] = &unk_1E6DF3D58;
      v10[4] = v8;
      [v8 _dismissAppInstallWithCompletion:v10];
    }
  }

  unsigned int v9 = [*(id *)(*(void *)(a1 + 32) + 1520) actionButton];
  [v9 setAccessibilityIdentifier:@"UIA.TV.Button.install.state=\"inactive\""];
}

uint64_t __50__VUIAppInstallerViewController__initConfirmation__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionBlock];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) completionBlock];
    v3[2](v3, 0, 0, 0);
  }
  [*(id *)(a1 + 32) setCompletionBlock:0];
  [*(id *)(a1 + 32) setProgressBlock:0];
  v4 = *(void **)(a1 + 32);
  return [v4 setConfirmationController:0];
}

uint64_t __50__VUIAppInstallerViewController__initConfirmation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__VUIAppInstallerViewController__initConfirmation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    NSLog(&cfstr_Vuiappinstalle_3.isa);
    [WeakRetained _beginInstallingApp];
  }
}

void __50__VUIAppInstallerViewController__initConfirmation__block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  dispatch_time_t v2 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VUIAppInstallerViewController__initConfirmation__block_invoke_6;
  block[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __50__VUIAppInstallerViewController__initConfirmation__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    dispatch_time_t v2 = [WeakRetained appStoreURL];
    NSLog(&cfstr_Vuiappinstalle_4.isa, v2);

    v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v4 = [v5 appStoreURL];
    [v3 openURL:v4 options:MEMORY[0x1E4F1CC08] completionHandler:0];

    id WeakRetained = v5;
  }
}

void __50__VUIAppInstallerViewController__initConfirmation__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    dispatch_time_t v2 = [WeakRetained secondaryLinkHandler];
    v2[2]();

    id WeakRetained = v3;
  }
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)VUIAppInstallerViewController;
  [(VUIAppInstallerViewController *)&v7 loadView];
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 2)
  {
    id v5 = [(VUIAppInstallerViewController *)self view];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [v5 setBackgroundColor:v6];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (!v4) {
    return 2;
  }
  v6.receiver = self;
  v6.super_class = (Class)VUIAppInstallerViewController;
  return [(VUIAppInstallerViewController *)&v6 supportedInterfaceOrientations];
}

- (void)beginInstallingAppWithProgressHandler:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(VUIAppInstallerViewController *)self _dismissAppInstallWithCompletion:0];
  id progressBlock = self->_progressBlock;
  if (progressBlock)
  {
    self->_id progressBlock = 0;
  }
  id completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    self->_id completionBlock = 0;
  }
  v10 = [MEMORY[0x1E4FB5050] defaultAppLibrary];
  [v10 beginIgnoringAppLibraryChanges];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__VUIAppInstallerViewController_beginInstallingAppWithProgressHandler_completion___block_invoke;
  aBlock[3] = &unk_1E6DFC488;
  id v20 = v7;
  id v11 = v7;
  v12 = _Block_copy(aBlock);
  id v13 = self->_completionBlock;
  self->_id completionBlock = v12;

  self->_lastProgress = 0.0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__VUIAppInstallerViewController_beginInstallingAppWithProgressHandler_completion___block_invoke_2;
  v17[3] = &unk_1E6DFC4B0;
  v17[4] = self;
  id v18 = v6;
  id v14 = v6;
  v15 = _Block_copy(v17);
  id v16 = self->_progressBlock;
  self->_id progressBlock = v15;

  [(VUIAppInstallerViewController *)self _initConfirmation];
}

void __82__VUIAppInstallerViewController_beginInstallingAppWithProgressHandler_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  id v7 = [MEMORY[0x1E4FB5050] defaultAppLibrary];
  [v7 endIgnoringAppLibraryChanges];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v8 + 16))(v8, a2, a3, v9);
  }
}

uint64_t __82__VUIAppInstallerViewController_beginInstallingAppWithProgressHandler_completion___block_invoke_2(uint64_t result, double a2)
{
  if (*(void *)(result + 40))
  {
    uint64_t v3 = result;
    result = [*(id *)(result + 32) lastProgress];
    if ((v4.n128_f64[0] * 100.0) != (a2 * 100.0))
    {
      id v5 = *(uint64_t (**)(__n128))(*(void *)(v3 + 40) + 16);
      v4.n128_f64[0] = a2;
      return v5(v4);
    }
  }
  return result;
}

- (void)_beginInstallingApp
{
  [(VUIAppInstallConfirmationViewController *)self->_confirmationController setPreInstallState];
  [(VUIASDDialogObserver *)self->_dialogObserver startListening];
  objc_initWeak(&location, self);
  uint64_t v3 = [MEMORY[0x1E4FB5048] defaultAppInstaller];
  installable = self->_installable;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke;
  v7[3] = &unk_1E6DFC4D8;
  objc_copyWeak(&v8, &location);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3;
  v5[3] = &unk_1E6DFC528;
  objc_copyWeak(&v6, &location);
  [v3 installAppForInstallable:installable sceneIdentifier:0 progressHandler:v7 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke(uint64_t a1, double a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_2;
  v3[3] = &unk_1E6DF6668;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)&a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateWithInstallProgress:*(double *)(a1 + 40)];
  dispatch_time_t v2 = [WeakRetained progressBlock];

  if (v2)
  {
    uint64_t v3 = [WeakRetained progressBlock];
    v3[2](*(double *)(a1 + 40));
  }
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained dialogObserver];

  if (v5)
  {
    id v6 = [WeakRetained dialogObserver];
    [v6 stopListening];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_4;
  v8[3] = &unk_1E6DF3F68;
  v8[4] = WeakRetained;
  id v9 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_4(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_5;
  aBlock[3] = &unk_1E6DFC500;
  dispatch_time_t v2 = *(void **)(a1 + 40);
  void aBlock[4] = *(void *)(a1 + 32);
  id v22 = v2;
  id v3 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3_98;
  v19[3] = &unk_1E6DF92C0;
  id v4 = v3;
  v19[4] = *(void *)(a1 + 32);
  id v20 = v4;
  id v5 = _Block_copy(v19);
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v18 = 0;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "VUIAppInstallerViewController - fetch app link data", v18, 2u);
  }

  id v7 = [*(id *)(a1 + 32) punchoutURL];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29088]);
    id v9 = [*(id *)(a1 + 32) punchoutURL];
    v10 = (void *)[v8 initWithURL:v9 resolvingAgainstBaseURL:0];

    id v11 = [v10 scheme];
    v12 = [v11 lowercaseString];
    if ([v12 isEqualToString:@"https"])
    {
    }
    else
    {
      id v13 = [v10 scheme];
      id v14 = [v13 lowercaseString];
      int v15 = [v14 isEqualToString:@"http"];

      if (!v15)
      {
        (*((void (**)(id, void, void))v4 + 2))(v4, 0, *(void *)(a1 + 32));
        goto LABEL_10;
      }
    }
    id v16 = (void *)MEMORY[0x1E4F22398];
    v17 = [*(id *)(a1 + 32) punchoutURL];
    [v16 afterAppLinksBecomeAvailableForURL:v17 limit:-1 performBlock:v5];

LABEL_10:
    goto LABEL_11;
  }
  (*((void (**)(id, void, void))v4 + 2))(v4, 0, *(void *)(a1 + 32));
LABEL_11:
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "VUIAppInstallerViewController - Posting app install finished.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, *(id *)(a1 + 32));
  id v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_94;
  v10[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v13, buf);
  id v11 = *(id *)(a1 + 40);
  id v9 = v5;
  id v12 = v9;
  [v8 _finishInstallationWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_94(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained confirmationController];
  id v4 = [v3 presentingViewController];

  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v4 == 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUIAppInstallerViewController - Hiding app install display. Headless: %d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, WeakRetained);
  dispatch_time_t v6 = dispatch_time(0, 500000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_95;
  v7[3] = &unk_1E6DF4A58;
  objc_copyWeak(&v10, &buf);
  id v8 = a1[4];
  id v9 = a1[5];
  BOOL v11 = v4 == 0;
  dispatch_after(v6, MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&buf);
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_95(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_initWeak(&location, WeakRetained);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_2_96;
  v3[3] = &unk_1E6DF4A58;
  objc_copyWeak(&v6, &location);
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 56);
  [WeakRetained _dismissAppInstallWithCompletion:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_2_96(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 32)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = *(void *)(a1 + 40) == 0;
  }
  id v10 = WeakRetained;
  id v4 = [WeakRetained progressBlock];

  if (v4)
  {
    id v5 = [v10 progressBlock];
    v5[2](1.0);
  }
  id v6 = [v10 completionBlock];

  if (v6)
  {
    uint64_t v7 = [v10 completionBlock];
    id v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    if (!v9) {
      uint64_t v9 = *(void *)(a1 + 40);
    }
    (*(void (**)(uint64_t, BOOL, BOOL, uint64_t))(v7 + 16))(v7, v3, *(unsigned char *)(a1 + 56) != 0, v9);
  }
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3_98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3_98_cold_1((uint64_t)v6, v7);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  uint64_t v13 = __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_99;
  id v14 = &unk_1E6DF68B8;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v6;
  uint64_t v16 = v9;
  id v17 = v8;
  id v10 = (void *)MEMORY[0x1E4F29060];
  id v11 = v6;
  if ([v10 isMainThread]) {
    v13(block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_99(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_dismissAppInstallWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(VUIAppInstallConfirmationViewController *)self->_confirmationController presentingViewController];
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__VUIAppInstallerViewController__dismissAppInstallWithCompletion___block_invoke;
    v7[3] = &unk_1E6DF3DD0;
    id v8 = v4;
    [v5 dismissViewControllerAnimated:1 completion:v7];
  }
  else if (v4)
  {
    v4[2](v4);
  }
  confirmationController = self->_confirmationController;
  self->_confirmationController = 0;
}

uint64_t __66__VUIAppInstallerViewController__dismissAppInstallWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateWithInstallProgress:(double)a3
{
  if (a3 == 0.0) {
    [(VUIAppInstallConfirmationViewController *)self->_confirmationController setInstallingState];
  }
  id v6 = [(VUIAppInstallConfirmationViewController *)self->_confirmationController lockup];
  id v5 = [v6 installView];
  [v5 setInstallProgress:a3];
}

- (void)_finishInstallationWithCompletion:(id)a3
{
  confirmationController = self->_confirmationController;
  id v4 = a3;
  id v6 = [(VUIAppInstallConfirmationViewController *)confirmationController lockup];
  id v5 = [v6 installView];
  [v5 finishInstallationWithCompletion:v4];
}

- (WLKInstallable)installable
{
  return self->_installable;
}

- (NSString)localizedContentTitle
{
  return self->_localizedContentTitle;
}

- (void)setLocalizedContentTitle:(id)a3
{
}

- (NSString)confirmationTitle
{
  return self->_confirmationTitle;
}

- (void)setConfirmationTitle:(id)a3
{
}

- (NSString)confirmationBody
{
  return self->_confirmationBody;
}

- (void)setConfirmationBody:(id)a3
{
}

- (NSString)updateBody
{
  return self->_updateBody;
}

- (void)setUpdateBody:(id)a3
{
}

- (NSString)updateTitle
{
  return self->_updateTitle;
}

- (void)setUpdateTitle:(id)a3
{
}

- (NSString)confirmationInstallButtonTitle
{
  return self->_confirmationInstallButtonTitle;
}

- (void)setConfirmationInstallButtonTitle:(id)a3
{
}

- (BOOL)displayAppStoreLink
{
  return self->_displayAppStoreLink;
}

- (void)setDisplayAppStoreLink:(BOOL)a3
{
  self->_displayAppStoreLink = a3;
}

- (BOOL)displaySecondaryLink
{
  return self->_displaySecondaryLink;
}

- (void)setDisplaySecondaryLink:(BOOL)a3
{
  self->_displaySecondaryLink = a3;
}

- (NSString)secondaryLinkTitle
{
  return self->_secondaryLinkTitle;
}

- (void)setSecondaryLinkTitle:(id)a3
{
}

- (id)secondaryLinkHandler
{
  return self->_secondaryLinkHandler;
}

- (void)setSecondaryLinkHandler:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (double)lastProgress
{
  return self->_lastProgress;
}

- (void)setLastProgress:(double)a3
{
  self->_lastProgress = a3;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (VUIAppInstallConfirmationViewController)confirmationController
{
  return self->_confirmationController;
}

- (void)setConfirmationController:(id)a3
{
}

- (VUIASDDialogObserver)dialogObserver
{
  return self->_dialogObserver;
}

- (void)setDialogObserver:(id)a3
{
}

- (NSURL)punchoutURL
{
  return self->_punchoutURL;
}

- (void)setPunchoutURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutURL, 0);
  objc_storeStrong((id *)&self->_dialogObserver, 0);
  objc_storeStrong((id *)&self->_confirmationController, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_secondaryLinkHandler, 0);
  objc_storeStrong((id *)&self->_secondaryLinkTitle, 0);
  objc_storeStrong((id *)&self->_confirmationInstallButtonTitle, 0);
  objc_storeStrong((id *)&self->_updateTitle, 0);
  objc_storeStrong((id *)&self->_updateBody, 0);
  objc_storeStrong((id *)&self->_confirmationBody, 0);
  objc_storeStrong((id *)&self->_confirmationTitle, 0);
  objc_storeStrong((id *)&self->_localizedContentTitle, 0);
  objc_storeStrong((id *)&self->_installable, 0);
}

void __52__VUIAppInstallerViewController__beginInstallingApp__block_invoke_3_98_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIAppInstallerViewController::afterAppLinksBecomeAvailableForURL returned with error: %@", (uint8_t *)&v2, 0xCu);
}

@end