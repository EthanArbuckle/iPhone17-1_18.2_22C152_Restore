@interface BFFFaceIDViewController
- (BFFFaceIDViewController)init;
- (BFFFaceIDViewControllerDelegate)faceIDViewControllerDelegate;
- (BOOL)_sheetMode;
- (BOOL)completesOnCancel;
- (BOOL)isAnimating;
- (BYCapabilities)capabilities;
- (BYDeviceProvider)deviceProvider;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYPreferencesController)buddyPreferences;
- (LAContext)authContext;
- (OBWelcomeController)contentController;
- (unint64_t)enrollmentConfiguration;
- (void)_didSelectEnroll;
- (void)_didSelectSkip;
- (void)_userDidTapCancelButton:(id)a3;
- (void)controllerWasPopped;
- (void)pearlEnrollController:(id)a3 finishedEnrollWithError:(id)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)resetColorsAnimated:(BOOL)a3;
- (void)setAuthContext:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setCompletesOnCancel:(BOOL)a3;
- (void)setContentController:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setEnrollmentConfiguration:(unint64_t)a3;
- (void)setFaceIDViewControllerDelegate:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)startIndeterminateProgressIndicator;
- (void)stopIndeterminateProgressIndicator;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willStartOver;
@end

@implementation BFFFaceIDViewController

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  id BKUIPearlEnrollControllerClass = getBKUIPearlEnrollControllerClass();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__BFFFaceIDViewController_performExtendedInitializationWithCompletion___block_invoke;
  v6[3] = &unk_26454ABE0;
  v6[4] = self;
  [BKUIPearlEnrollControllerClass preloadWithCompletion:v6];
  if (v4) {
    v4[2](v4, 1);
  }
}

void __71__BFFFaceIDViewController_performExtendedInitializationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 976);
  *(void *)(v5 + 976) = v3;
  id v7 = v3;

  objc_sync_exit(v4);
}

- (BFFFaceIDViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)BFFFaceIDViewController;
  result = [(BFFFaceIDViewController *)&v3 initWithNibName:0 bundle:0];
  if (result) {
    result->_enrollmentConfiguration = 0;
  }
  return result;
}

- (void)viewDidLoad
{
  v39.receiver = self;
  v39.super_class = (Class)BFFFaceIDViewController;
  [(BFFFaceIDViewController *)&v39 viewDidLoad];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"BACK_BUTTON_TITLE" value:&stru_26D1D0C18 table:@"Pearl"];
  uint64_t v5 = [(BFFFaceIDViewController *)self navigationItem];
  [v5 setBackButtonTitle:v4];

  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2050000000;
  v6 = (void *)getBKDeviceClass_softClass;
  uint64_t v48 = getBKDeviceClass_softClass;
  if (!getBKDeviceClass_softClass)
  {
    uint64_t v40 = MEMORY[0x263EF8330];
    uint64_t v41 = 3221225472;
    v42 = __getBKDeviceClass_block_invoke;
    v43 = &unk_26454AB18;
    v44 = &v45;
    __getBKDeviceClass_block_invoke((uint64_t)&v40);
    v6 = (void *)v46[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v45, 8);
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2050000000;
  v8 = (void *)getBKDeviceDescriptorClass_softClass;
  uint64_t v48 = getBKDeviceDescriptorClass_softClass;
  if (!getBKDeviceDescriptorClass_softClass)
  {
    uint64_t v40 = MEMORY[0x263EF8330];
    uint64_t v41 = 3221225472;
    v42 = __getBKDeviceDescriptorClass_block_invoke;
    v43 = &unk_26454AB18;
    v44 = &v45;
    __getBKDeviceDescriptorClass_block_invoke((uint64_t)&v40);
    v8 = (void *)v46[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v45, 8);
  v10 = [v9 deviceDescriptorForType:2];
  v11 = [v7 deviceWithDescriptor:v10 error:0];

  if ([(BFFFaceIDViewController *)self enrollmentConfiguration] == 3)
  {
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2050000000;
    v12 = (void *)getBKUIPeriocularEnableSplashViewControllerClass_softClass;
    uint64_t v48 = getBKUIPeriocularEnableSplashViewControllerClass_softClass;
    if (!getBKUIPeriocularEnableSplashViewControllerClass_softClass)
    {
      uint64_t v40 = MEMORY[0x263EF8330];
      uint64_t v41 = 3221225472;
      v42 = __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke;
      v43 = &unk_26454AB18;
      v44 = &v45;
      __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke((uint64_t)&v40);
      v12 = (void *)v46[3];
    }
    v13 = v12;
    _Block_object_dispose(&v45, 8);
    id v14 = [v13 alloc];
    v37[4] = self;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __38__BFFFaceIDViewController_viewDidLoad__block_invoke;
    v38[3] = &unk_26454AAC8;
    v38[4] = self;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __38__BFFFaceIDViewController_viewDidLoad__block_invoke_2;
    v37[3] = &unk_26454AAC8;
    uint64_t v15 = [v14 initInBuddy:1 bkDevice:v11 upsell:0 withEndEnrollmentActionPrimary:v38 enrollmentActionSecondary:v37];
  }
  else
  {
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2050000000;
    v16 = (void *)getBKUIFaceIDSplashViewControllerClass_softClass;
    uint64_t v48 = getBKUIFaceIDSplashViewControllerClass_softClass;
    if (!getBKUIFaceIDSplashViewControllerClass_softClass)
    {
      uint64_t v40 = MEMORY[0x263EF8330];
      uint64_t v41 = 3221225472;
      v42 = __getBKUIFaceIDSplashViewControllerClass_block_invoke;
      v43 = &unk_26454AB18;
      v44 = &v45;
      __getBKUIFaceIDSplashViewControllerClass_block_invoke((uint64_t)&v40);
      v16 = (void *)v46[3];
    }
    v17 = v16;
    _Block_object_dispose(&v45, 8);
    id v18 = [v17 alloc];
    v35[4] = self;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __38__BFFFaceIDViewController_viewDidLoad__block_invoke_3;
    v36[3] = &unk_26454AAC8;
    v36[4] = self;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __38__BFFFaceIDViewController_viewDidLoad__block_invoke_4;
    v35[3] = &unk_26454AAC8;
    uint64_t v15 = [v18 initInBuddy:1 bkDevice:v11 withEndEnrollmentActionPrimary:v36 enrollmentActionSecondary:v35];
  }
  v19 = (void *)v15;
  [(BFFFaceIDViewController *)self setContentController:v15];

  v20 = [(BFFFaceIDViewController *)self contentController];
  [(BFFFaceIDViewController *)self addChildViewController:v20];

  v21 = [(BFFFaceIDViewController *)self contentController];
  v22 = [v21 view];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = [(BFFFaceIDViewController *)self view];
  v24 = [(BFFFaceIDViewController *)self contentController];
  v25 = [v24 view];
  [v23 addSubview:v25];

  v26 = [(BFFFaceIDViewController *)self contentController];
  v27 = [v26 view];
  v28 = [(BFFFaceIDViewController *)self view];
  [v27 pinToEdges:v28];

  v29 = [(BFFFaceIDViewController *)self contentController];
  [v29 didMoveToParentViewController:self];

  v30 = [(BFFFaceIDViewController *)self contentController];
  v31 = [v30 headerView];
  v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v33 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"FACE_ID_DETAIL"];
  v34 = [v32 localizedStringForKey:v33 value:&stru_26D1D0C18 table:@"Pearl"];
  [v31 setDetailText:v34];
}

uint64_t __38__BFFFaceIDViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didSelectEnroll];
}

uint64_t __38__BFFFaceIDViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didSelectSkip];
}

uint64_t __38__BFFFaceIDViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didSelectEnroll];
}

uint64_t __38__BFFFaceIDViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didSelectSkip];
}

- (void)setCompletesOnCancel:(BOOL)a3
{
  if (self->_completesOnCancel != a3)
  {
    self->_completesOnCancel = a3;
    if (a3)
    {
      id v5 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__userDidTapCancelButton_];
      id v4 = [(BFFFaceIDViewController *)self navigationItem];
      [v4 setLeftBarButtonItem:v5 animated:1];
    }
    else
    {
      id v5 = [(BFFFaceIDViewController *)self navigationItem];
      [v5 setLeftBarButtonItem:0 animated:1];
    }
  }
}

- (void)_userDidTapCancelButton:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21FF9E000, v4, OS_LOG_TYPE_DEFAULT, "Face ID Enroll user did cancel", v7, 2u);
  }

  [(BFFFaceIDViewController *)self resetColorsAnimated:0];
  id v5 = [(BFFFaceIDViewController *)self faceIDViewControllerDelegate];
  v8[0] = self;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [v5 faceIDViewController:self didCompleteWithResult:2 pushedViewControllers:v6];
}

- (void)resetColorsAnimated:(BOOL)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__BFFFaceIDViewController_resetColorsAnimated___block_invoke;
  v4[3] = &unk_26454AAC8;
  v4[4] = self;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__BFFFaceIDViewController_resetColorsAnimated___block_invoke_2;
  v3[3] = &unk_26454AC08;
  v3[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v4 animations:v3 completion:0.3];
}

void __47__BFFFaceIDViewController_resetColorsAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  [v2 setBackgroundColor:0];

  id v4 = [*(id *)(a1 + 32) view];
  objc_super v3 = [MEMORY[0x263F825C8] _systemBackgroundColor];
  [v4 setBackgroundColor:v3];
}

void __47__BFFFaceIDViewController_resetColorsAnimated___block_invoke_2(uint64_t a1)
{
  id v3 = +[BFFStyle sharedStyle];
  v2 = [*(id *)(a1 + 32) navigationController];
  [v3 applyThemeToNavigationController:v2];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BFFFaceIDViewController;
  -[BFFFaceIDViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  if (([(BFFFaceIDViewController *)self isMovingToParentViewController] & 1) == 0)
  {
    id BKUIPearlEnrollControllerClass = getBKUIPearlEnrollControllerClass();
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__BFFFaceIDViewController_viewWillAppear___block_invoke;
    v6[3] = &unk_26454ABE0;
    v6[4] = self;
    [BKUIPearlEnrollControllerClass preloadWithCompletion:v6];
  }
  [(BFFFaceIDViewController *)self resetColorsAnimated:v3];
}

void __42__BFFFaceIDViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 976);
  *(void *)(v5 + 976) = v3;
  id v7 = v3;

  objc_sync_exit(v4);
}

- (void)willStartOver
{
}

- (void)controllerWasPopped
{
  obj = self;
  objc_sync_enter(obj);
  preloadedState = obj->_preloadedState;
  obj->_preloadedState = 0;

  objc_sync_exit(obj);
}

- (void)_didSelectEnroll
{
  v2 = self;
  objc_sync_enter(v2);
  preloadedState = v2->_preloadedState;
  v2->_preloadedState = 0;
  id v4 = preloadedState;

  objc_sync_exit(v2);
  id v14 = (id)[objc_alloc((Class)getBKUIPearlEnrollControllerClass()) initWithPreloadedState:v4];

  objc_msgSend(v14, "setInSheet:", -[BFFFaceIDViewController _sheetMode](v2, "_sheetMode"));
  objc_msgSend(v14, "setEnrollmentConfiguration:", -[BFFFaceIDViewController enrollmentConfiguration](v2, "enrollmentConfiguration"));
  uint64_t v5 = [(BFFFaceIDViewController *)v2 faceIDViewControllerDelegate];
  v6 = [v5 passcodeForFaceIDViewController:v2];
  id v7 = (void *)[v6 copy];

  if ([v7 length])
  {
    [v14 primeWithPasscode:v7];
  }
  else
  {
    v8 = [(BFFFaceIDViewController *)v2 authContext];

    if (v8)
    {
      id v9 = [(BFFFaceIDViewController *)v2 authContext];
      v10 = [v9 externalizedContext];
      [v14 primeWithExternalizedAuthContext:v10];
    }
  }
  [v14 setDelegate:v2];
  [v14 setInBuddy:1];
  id v11 = objc_alloc_init(MEMORY[0x263F829A8]);
  [v11 configureWithTransparentBackground];
  v12 = [v14 navigationItem];
  [v12 setStandardAppearance:v11];

  v13 = [(BFFFaceIDViewController *)v2 navigationController];
  [v13 pushViewController:v14 animated:1];
}

- (void)_didSelectSkip
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  preloadedState = v2->_preloadedState;
  v2->_preloadedState = 0;

  objc_sync_exit(v2);
  id v4 = [(BFFFaceIDViewController *)v2 faceIDViewControllerDelegate];
  v6[0] = v2;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v4 faceIDViewController:v2 didCompleteWithResult:1 pushedViewControllers:v5];
}

- (void)pearlEnrollController:(id)a3 finishedEnrollWithError:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = _BYLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (_BYIsInternalInstall())
    {
      int v10 = 0;
      id v11 = v8;
    }
    else if (v8)
    {
      v12 = NSString;
      id v4 = [v8 domain];
      id v11 = [v12 stringWithFormat:@"<Error domain: %@, code %ld>", v4, objc_msgSend(v8, "code")];
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
      id v11 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v38 = v11;
    _os_log_impl(&dword_21FF9E000, v9, OS_LOG_TYPE_DEFAULT, "Enroll finished with error: %{public}@", buf, 0xCu);
    if (v10)
    {
    }
  }

  if (!v8)
  {
    [(BFFFaceIDViewController *)self resetColorsAnimated:0];
    v19 = [(BFFFaceIDViewController *)self faceIDViewControllerDelegate];
    v34[0] = self;
    v34[1] = v7;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    v24 = v19;
    v25 = self;
    uint64_t v26 = 0;
LABEL_21:
    [v24 faceIDViewController:v25 didCompleteWithResult:v26 pushedViewControllers:v23];
LABEL_31:

    goto LABEL_32;
  }
  v13 = [v8 domain];
  id v14 = getBKUIPearlEnrollErrorDomain();
  if (![v13 isEqualToString:v14] || objc_msgSend(v8, "code") != -1)
  {

    goto LABEL_13;
  }
  BOOL v32 = [(BFFFaceIDViewController *)self completesOnCancel];

  if (v32)
  {
    [(BFFFaceIDViewController *)self resetColorsAnimated:0];
    v19 = [(BFFFaceIDViewController *)self faceIDViewControllerDelegate];
    v36[0] = self;
    v36[1] = v7;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    v24 = v19;
    v25 = self;
    uint64_t v26 = 2;
    goto LABEL_21;
  }
LABEL_13:
  uint64_t v15 = [v8 domain];
  v16 = getBKUIPearlEnrollErrorDomain();
  if ([v15 isEqualToString:v16])
  {
    uint64_t v17 = [v8 code];

    if (v17 == -2)
    {
      [(BFFFaceIDViewController *)self resetColorsAnimated:0];
      id v18 = [v8 userInfo];
      v19 = [v18 objectForKeyedSubscript:*MEMORY[0x263F08608]];

      v20 = [v19 domain];
      if ([v20 isEqualToString:@"com.apple.preferences.biokit"])
      {
        uint64_t v21 = [v19 code];

        if (v21 != 8)
        {
          uint64_t v22 = 1;
          goto LABEL_30;
        }
        v20 = _BYLoggingFacility();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21FF9E000, v20, OS_LOG_TYPE_DEFAULT, "Enroll observed interlock error", buf, 2u);
        }
        uint64_t v22 = 3;
      }
      else
      {
        uint64_t v22 = 1;
      }

LABEL_30:
      v23 = [(BFFFaceIDViewController *)self faceIDViewControllerDelegate];
      v35[0] = self;
      v35[1] = v7;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
      [v23 faceIDViewController:self didCompleteWithResult:v22 pushedViewControllers:v33];

      goto LABEL_31;
    }
  }
  else
  {
  }
  v27 = [(BFFFaceIDViewController *)self navigationController];
  v28 = [v27 topViewController];
  getBKUIPearlEnrollControllerClass();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v30 = [(BFFFaceIDViewController *)self navigationController];
    id v31 = (id)[v30 popToViewController:self animated:1];

    [(BFFFaceIDViewController *)self resetColorsAnimated:1];
  }
LABEL_32:
}

- (BOOL)_sheetMode
{
  id v3 = [MEMORY[0x263F82670] currentDevice];
  if ([v3 userInterfaceIdiom] == 1)
  {
    id v4 = [(BFFFaceIDViewController *)self navigationController];
    if ([v4 modalPresentationStyle] == 2)
    {
      uint64_t v5 = [(BFFFaceIDViewController *)self navigationController];
      v6 = [v5 presentingViewController];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)startIndeterminateProgressIndicator
{
  id v3 = [(BFFFaceIDViewController *)self contentController];
  v2 = [v3 buttonTray];
  [v2 showButtonsBusy];
}

- (void)stopIndeterminateProgressIndicator
{
  id v3 = [(BFFFaceIDViewController *)self contentController];
  v2 = [v3 buttonTray];
  [v2 showButtonsAvailable];
}

- (BOOL)isAnimating
{
  v2 = [(BFFFaceIDViewController *)self contentController];
  id v3 = [v2 buttonTray];
  id v4 = [v3 allButtons];
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global];
  v6 = [v4 filteredArrayUsingPredicate:v5];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

uint64_t __38__BFFFaceIDViewController_isAnimating__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 configuration];
  uint64_t v3 = [v2 showsActivityIndicator];

  return v3;
}

- (BOOL)completesOnCancel
{
  return self->_completesOnCancel;
}

- (unint64_t)enrollmentConfiguration
{
  return self->_enrollmentConfiguration;
}

- (void)setEnrollmentConfiguration:(unint64_t)a3
{
  self->_enrollmentConfiguration = a3;
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (BFFFaceIDViewControllerDelegate)faceIDViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceIDViewControllerDelegate);
  return (BFFFaceIDViewControllerDelegate *)WeakRetained;
}

- (void)setFaceIDViewControllerDelegate:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (OBWelcomeController)contentController
{
  return self->_contentController;
}

- (void)setContentController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_destroyWeak((id *)&self->_faceIDViewControllerDelegate);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
  objc_storeStrong((id *)&self->_preloadedState, 0);
}

@end