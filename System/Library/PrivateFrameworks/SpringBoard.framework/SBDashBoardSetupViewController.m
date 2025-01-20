@interface SBDashBoardSetupViewController
- (BOOL)_haveImportantLanguagesChangedFrom:(id)a3;
- (BOOL)_isSecurityResearchDevice;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isCyclingComponents:(unint64_t)a3;
- (SBDashBoardSetupViewController)initWithCoverSheetViewController:(id)a3;
- (SBDashBoardSetupViewController)initWithCoverSheetViewController:(id)a3 telephonyManager:(id)a4;
- (id)_alignedMarketingOrdering;
- (id)_applicableIdentifierForDictionary:(id)a3 identifier:(id)a4;
- (id)_currentActivationLockStringsDictionary;
- (id)_currentLanguageIdentifier;
- (id)_currentStoreRestrictedStringsDictionary;
- (id)_displayStringForLocalizedString:(id)a3 fallbackString:(id)a4;
- (id)_importantLanguageIdentifiers;
- (id)_subcriptionDataSourceDescription:(int64_t)a3;
- (id)_subscriptionInfoForSubscriptionDataSource:(int64_t)a3;
- (id)_supportedLanguageIdentifierFromRegionalLanguageIdentifier:(id)a3 countryCode:(id)a4;
- (id)firstSupportedLanguageIdentifierInRegionalLanguageIdentifiers:(id)a3 countryCode:(id)a4;
- (int64_t)presentationPriority;
- (int64_t)presentationType;
- (unint64_t)_componentsRelevantToPointerSuppression;
- (unint64_t)_componentsToStartCycling;
- (void)_animateComponentsForNewCycle;
- (void)_cancelWifiScan;
- (void)_checkIfActivationLocked;
- (void)_didClickHomeAffordance:(id)a3;
- (void)_evaluateUpdatingLanguageForImportantLanguageChanges;
- (void)_handleHoverEvent:(id)a3;
- (void)_incrementLocalizedStringsForNewCycle;
- (void)_infoButtonTapped:(id)a3;
- (void)_regulatoryInfoButtonTapped:(id)a3;
- (void)_resetDisplayedLocalizedStringsImmediately:(BOOL)a3;
- (void)_retrieveChildIconIfNecessaryWithCompletion:(id)a3;
- (void)_startCyclingComponents:(unint64_t)a3 withDelay:(double)a4;
- (void)_startWifiScan;
- (void)_stopCyclingComponents:(unint64_t)a3;
- (void)_updateDisplayedStrings;
- (void)_updateForLockInfo:(id)a3;
- (void)_updateLanguageFromSubscriptionDataSource:(int64_t)a3;
- (void)_updateLanguageFromTelephony;
- (void)_updateStringOrderingForLanguageChange;
- (void)_updateWifiPrimaryLanguageFromDiscoveredCountryCodes:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBDashBoardSetupViewController

- (SBDashBoardSetupViewController)initWithCoverSheetViewController:(id)a3
{
  id v4 = a3;
  v5 = +[SBTelephonyManager sharedTelephonyManager];
  v6 = [(SBDashBoardSetupViewController *)self initWithCoverSheetViewController:v4 telephonyManager:v5];

  return v6;
}

- (SBDashBoardSetupViewController)initWithCoverSheetViewController:(id)a3 telephonyManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SBDashBoardSetupViewController;
  v8 = [(SBDashBoardSetupViewController *)&v28 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.springboard.fetchappleaccount", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = +[SBSetupManager sharedInstance];
    setupManager = v8->_setupManager;
    v8->_setupManager = (SBSetupManager *)v12;

    objc_storeWeak((id *)&v8->_coverSheetViewController, v6);
    objc_storeStrong((id *)&v8->_telephonyManager, a4);
    [(SBDashBoardSetupViewController *)v8 _updateStringOrderingForLanguageChange];
    v8->_customDelayDuration = 1.5;
    v14 = [MEMORY[0x1E4F78A20] sharedInstance];
    id v27 = 0;
    LOBYTE(v9) = [v14 needOwnershipWarning:&v27];
    v15 = (NSDictionary *)v27;
    v8->_isStoreRestricted = (char)v9;

    storeRestrictedStrings = v8->_storeRestrictedStrings;
    v8->_storeRestrictedStrings = v15;
    v17 = v15;

    [(SBDashBoardSetupViewController *)v8 _checkIfActivationLocked];
    v18 = [(SBDashBoardSetupViewController *)v8 setupView];
    v19 = [v18 homeAffordanceView];

    [v19 setSystemPointerInteractionEnabled:1];
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v8 action:sel__didClickHomeAffordance_];
    pointerClickGestureRecognizer = v8->_pointerClickGestureRecognizer;
    v8->_pointerClickGestureRecognizer = (UITapGestureRecognizer *)v20;

    [(UITapGestureRecognizer *)v8->_pointerClickGestureRecognizer setDelegate:v8];
    [v19 addGestureRecognizer:v8->_pointerClickGestureRecognizer];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v8 action:sel__handleHoverEvent_];
    hoverGestureRecognizer = v8->_hoverGestureRecognizer;
    v8->_hoverGestureRecognizer = (UIHoverGestureRecognizer *)v22;

    v24 = [(SBDashBoardSetupViewController *)v8 view];
    [v24 addGestureRecognizer:v8->_hoverGestureRecognizer];

    v25 = [(id)SBApp telephonyStateProvider];

    [v25 addObserver:v8];
    [(SBDashBoardSetupViewController *)v8 _updateLanguageFromTelephony];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(id)SBApp telephonyStateProvider];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardSetupViewController;
  [(CSCoverSheetViewControllerBase *)&v4 dealloc];
}

- (void)_didClickHomeAffordance:(id)a3
{
  id v4 = [MEMORY[0x1E4F5E380] actionWithType:11];
  [(CSCoverSheetViewControllerBase *)self sendAction:v4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_pointerClickGestureRecognizer == a3) {
    return [a4 _isPointerTouch];
  }
  else {
    return 0;
  }
}

- (void)_handleHoverEvent:(id)a3
{
  id v22 = a3;
  if ([v22 state] == 2)
  {
    id v4 = [(SBDashBoardSetupViewController *)self setupView];
    [v22 locationInView:v4];
    CGFloat v6 = v5;
    CGFloat v8 = v7;

    v9 = [(SBDashBoardSetupViewController *)self setupView];
    dispatch_queue_t v10 = [v9 homeAffordanceView];

    [v10 extendedFrameForPointerAnimationSuppression];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    unint64_t v19 = [(SBDashBoardSetupViewController *)self _componentsRelevantToPointerSuppression];
    v25.origin.x = v12;
    v25.origin.y = v14;
    v25.size.width = v16;
    v25.size.height = v18;
    v24.x = v6;
    v24.y = v8;
    BOOL v20 = CGRectContainsPoint(v25, v24);
    BOOL v21 = [(SBDashBoardSetupViewController *)self isCyclingComponents:v19];
    if (v20)
    {
      if (v21) {
        [(SBDashBoardSetupViewController *)self _stopCyclingComponents:v19];
      }
    }
    else if (!v21)
    {
      [(SBDashBoardSetupViewController *)self _startCyclingComponents:v19 withDelay:0.25];
    }
  }
}

- (unint64_t)_componentsRelevantToPointerSuppression
{
  return 6;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardSetupViewController;
  if (![(CSCoverSheetViewControllerBase *)&v15 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    char v5 = 0;
    if (v6 > 23)
    {
      if (v6 == 24)
      {
        [(SBDashBoardSetupViewController *)self _startCyclingComponents:[(SBDashBoardSetupViewController *)self _componentsToStartCycling] withDelay:0.5];
        CGFloat v12 = [(SBDashBoardSetupViewController *)self setupView];
        [v12 setInfoButtonVisible:1 animated:1 withDelay:0.5];

        double v13 = [(SBDashBoardSetupViewController *)self setupView];
        [v13 setChildIconVisible:1 animated:1 withDelay:0.5];

        [(SBDashBoardSetupViewController *)self _checkIfActivationLocked];
      }
      else
      {
        if (v6 != 25) {
          goto LABEL_14;
        }
        [(SBDashBoardSetupViewController *)self _stopCyclingComponents:63];
        dispatch_queue_t v10 = [(SBDashBoardSetupViewController *)self setupView];
        [v10 setInfoButtonVisible:0 animated:0 withDelay:0.0];

        double v11 = [(SBDashBoardSetupViewController *)self setupView];
        [v11 setChildIconVisible:0 animated:0 withDelay:0.0];
      }
    }
    else
    {
      if (v6 != 1)
      {
        if (v6 != 8) {
          goto LABEL_14;
        }
        [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
      }
      double v7 = [(SBDashBoardSetupViewController *)self setupView];
      CGFloat v8 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
      v9 = [v8 legibilitySettings];
      [v7 setLegibilitySettings:v9];
    }
    char v5 = 0;
    goto LABEL_14;
  }
  char v5 = [v4 isConsumable];
LABEL_14:

  return v5;
}

- (void)loadView
{
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = SBFEffectiveHomeButtonType() == 2;
  double v13 = [SBDashBoardSetupView alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  objc_super v15 = [WeakRetained coverSheetContext];
  CGFloat v16 = -[SBDashBoardSetupView initWithFrame:usingHomeAffordance:coverSheetContext:isStoreRestricted:isSecurityResearchDevice:](v13, "initWithFrame:usingHomeAffordance:coverSheetContext:isStoreRestricted:isSecurityResearchDevice:", v12, v15, self->_isStoreRestricted, [(SBDashBoardSetupViewController *)self _isSecurityResearchDevice], v5, v7, v9, v11);

  [(SBDashBoardSetupView *)v16 setAutoresizingMask:18];
  double v17 = [(SBDashBoardSetupView *)v16 infoButton];
  [v17 addTarget:self action:sel__infoButtonTapped_ forControlEvents:64];

  queue = self->_queue;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __42__SBDashBoardSetupViewController_loadView__block_invoke;
  v23 = &unk_1E6AF5290;
  CGPoint v24 = self;
  CGRect v25 = v16;
  unint64_t v19 = v16;
  dispatch_async(queue, &v20);
  -[SBDashBoardSetupViewController setView:](self, "setView:", v19, v20, v21, v22, v23, v24);
}

void __42__SBDashBoardSetupViewController_loadView__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__SBDashBoardSetupViewController_loadView__block_invoke_2;
  v2[3] = &unk_1E6AF8E68;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _retrieveChildIconIfNecessaryWithCompletion:v2];
}

void __42__SBDashBoardSetupViewController_loadView__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__SBDashBoardSetupViewController_loadView__block_invoke_3;
    v5[3] = &unk_1E6AF5290;
    id v6 = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __42__SBDashBoardSetupViewController_loadView__block_invoke_3(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:*(void *)(a1 + 32)];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 40) setChildIconView:v2];
  [*(id *)(a1 + 40) setChildIconVisible:1 animated:1 withDelay:0.0];
}

- (void)viewDidLoad
{
  id v3 = [(SBDashBoardSetupViewController *)self view];
  [(CSCoverSheetViewControllerBase *)self registerView:v3 forRole:2];

  [(SBDashBoardSetupViewController *)self _startCyclingComponents:[(SBDashBoardSetupViewController *)self _componentsToStartCycling] withDelay:self->_customDelayDuration];
  double v4 = [(SBDashBoardSetupViewController *)self setupView];
  [v4 setInfoButtonVisible:1 animated:1 withDelay:self->_customDelayDuration];

  double v5 = [(SBDashBoardSetupViewController *)self setupView];
  [v5 setChildIconVisible:1 animated:1 withDelay:self->_customDelayDuration];

  [(SBDashBoardSetupViewController *)self setOverrideUserInterfaceStyle:1];
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardSetupViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardSetupViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(SBDashBoardSetupViewController *)self _startWifiScan];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardSetupViewController;
  [(CSCoverSheetViewControllerBase *)&v7 viewDidAppear:a3];
  [(SBDashBoardSetupViewController *)self _startCyclingComponents:[(SBDashBoardSetupViewController *)self _componentsToStartCycling] withDelay:0.5];
  objc_super v4 = [(SBDashBoardSetupViewController *)self setupView];
  [v4 setInfoButtonVisible:1 animated:1 withDelay:0.5];

  double v5 = [(SBDashBoardSetupViewController *)self setupView];
  [v5 setChildIconVisible:1 animated:1 withDelay:0.5];

  objc_super v6 = [MEMORY[0x1E4F5E380] actionWithType:3];
  [(CSCoverSheetViewControllerBase *)self sendAction:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardSetupViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillDisappear:a3];
  [(SBDashBoardSetupViewController *)self _stopCyclingComponents:6];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardSetupViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidDisappear:a3];
  [(SBDashBoardSetupViewController *)self _stopCyclingComponents:63];
  objc_super v4 = [(SBDashBoardSetupViewController *)self setupView];
  [v4 setInfoButtonVisible:0 animated:0 withDelay:0.0];

  double v5 = [(SBDashBoardSetupViewController *)self setupView];
  [v5 setChildIconVisible:0 animated:0 withDelay:0.0];

  [(SBDashBoardSetupViewController *)self _cancelWifiScan];
}

- (void)_retrieveChildIconIfNecessaryWithCompletion:(id)a3
{
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F9AA38] current];
  double v5 = [MEMORY[0x1E4F179C8] defaultStore];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke;
  v8[3] = &unk_1E6AF8EB8;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  objc_msgSend(v5, "aa_primaryAppleAccountWithCompletion:", v8);
}

void __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_cold_1();
    }

    goto LABEL_5;
  }
  uint64_t v8 = [*(id *)(a1 + 32) isChild];
  if (!v8
    || (id v9 = (void *)v8,
        [v5 appleID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_6;
  }
  uint64_t v17 = 0;
  CGFloat v18 = &v17;
  uint64_t v19 = 0x2050000000;
  double v11 = (void *)getAAUIProfilePictureStoreClass_softClass;
  uint64_t v20 = getAAUIProfilePictureStoreClass_softClass;
  if (!getAAUIProfilePictureStoreClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getAAUIProfilePictureStoreClass_block_invoke;
    v16[3] = &unk_1E6AF56B0;
    v16[4] = &v17;
    __getAAUIProfilePictureStoreClass_block_invoke((uint64_t)v16);
    double v11 = (void *)v18[3];
  }
  BOOL v12 = v11;
  _Block_object_dispose(&v17, 8);
  id v13 = objc_alloc_init(v12);
  [v13 setPictureDiameter:95.0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_2;
  v14[3] = &unk_1E6AF8E90;
  id v15 = *(id *)(a1 + 40);
  [v13 profilePictureForAccountOwnerWithCompletion:v14];

LABEL_6:
}

void __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_2_cold_1();
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 8;
}

- (void)aggregateAppearance:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SBDashBoardSetupViewController;
  [(CSCoverSheetViewControllerBase *)&v36 aggregateAppearance:v4];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [MEMORY[0x1E4F5E3C0] wallpaper];
  id v7 = [v6 hidden:1];
  uint64_t v8 = [v5 setWithObject:v7];
  [v4 setComponents:v8];

  id v9 = [MEMORY[0x1E4F5E3C0] homeAffordance];
  id v10 = [v9 priority:80];
  double v11 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  BOOL v12 = [v10 identifier:v11];
  id v13 = [v12 hidden:1];
  [v4 addComponent:v13];

  CGFloat v14 = [MEMORY[0x1E4F5E3C0] footerCallToActionLabel];
  id v15 = [v14 priority:80];
  CGFloat v16 = [v15 hidden:1];
  [v4 addComponent:v16];

  uint64_t v17 = [MEMORY[0x1E4F5E3C0] quickActions];
  CGFloat v18 = [v17 priority:80];
  uint64_t v19 = [v18 hidden:1];
  [v4 addComponent:v19];

  if (!_os_feature_enabled_impl() || self->_isStoreRestricted || self->_regulatoryInfoViewController)
  {
    uint64_t v20 = [MEMORY[0x1E4F5E3C0] background];
    uint64_t v21 = [v20 priority:80];
    id v22 = [MEMORY[0x1E4F428B8] whiteColor];
    v23 = [v21 color:v22];
    [v4 addComponent:v23];
  }
  else
  {
    uint64_t v20 = objc_opt_new();
    uint64_t v21 = [v20 priority:80];
    id v22 = [v21 style:&unk_1F3349668];
    [v4 addComponent:v22];
  }

  if (self->_isActivationLocked && !BYSetupAssistantHasCompletedInitialRun() || self->_isStoreRestricted)
  {
    CGPoint v24 = [MEMORY[0x1E4F5E3C0] proudLock];
    CGRect v25 = [v24 priority:80];
    v26 = [v25 hidden:1];
    [v4 addComponent:v26];
  }
  if (!_os_feature_enabled_impl() || self->_isStoreRestricted || self->_regulatoryInfoViewController)
  {
    id v27 = objc_alloc(MEMORY[0x1E4F43228]);
    objc_super v28 = [MEMORY[0x1E4F428B8] blackColor];
    v29 = v27;
    uint64_t v30 = 2;
  }
  else
  {
    id v35 = objc_alloc(MEMORY[0x1E4F43228]);
    objc_super v28 = [MEMORY[0x1E4F428B8] whiteColor];
    v29 = v35;
    uint64_t v30 = 1;
  }
  v31 = (void *)[v29 initWithStyle:v30 contentColor:v28];
  [v4 setLegibilitySettings:v31];

  v32 = objc_opt_new();
  v33 = [v32 priority:80];
  v34 = [v33 shouldRenderInline:1];
  [v4 addComponent:v34];
}

- (void)aggregateBehavior:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardSetupViewController;
  [(CSCoverSheetViewControllerBase *)&v6 aggregateBehavior:v4];
  if (self->_activationInfoViewController) {
    uint64_t v5 = 9;
  }
  else {
    uint64_t v5 = 10;
  }
  [v4 setIdleTimerDuration:v5];
  [v4 setIdleTimerMode:2];
  [v4 setIdleWarnMode:1];
  if (self->_isStoreRestricted) {
    [v4 addRestrictedCapabilities:4152];
  }
}

- (void)_startCyclingComponents:(unint64_t)a3 withDelay:(double)a4
{
  unint64_t v4 = self->_componentsToCycle | a3;
  self->_componentsToCycle = v4;
  BOOL v5 = self->_isCyclingComponents || v4 == 0;
  if (!v5 && ![(NSTimer *)self->_cycleStartTimer isValid])
  {
    [(SBDashBoardSetupViewController *)self _resetDisplayedLocalizedStringsImmediately:0];
    if (a4 <= 0.0)
    {
      [(SBDashBoardSetupViewController *)self _animateComponentsForNewCycle];
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v8 = (void *)MEMORY[0x1E4F1CB00];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __68__SBDashBoardSetupViewController__startCyclingComponents_withDelay___block_invoke;
      v11[3] = &unk_1E6AF8EE0;
      objc_copyWeak(&v12, &location);
      v11[4] = self;
      id v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:v11 block:a4];
      cycleStartTimer = self->_cycleStartTimer;
      self->_cycleStartTimer = v9;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __68__SBDashBoardSetupViewController__startCyclingComponents_withDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v4 = WeakRetained;
    [WeakRetained[140] invalidate];
    id v3 = v4[140];
    v4[140] = 0;

    [*(id *)(a1 + 32) _animateComponentsForNewCycle];
    id WeakRetained = v4;
  }
}

- (void)_animateComponentsForNewCycle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  char v4 = [WeakRetained isInScreenOffMode];

  BOOL v5 = [(SBDashBoardSetupViewController *)self view];
  objc_super v6 = [v5 window];

  int v7 = [(SBDashBoardSetupViewController *)self _appearState];
  if ((v4 & 1) == 0 && v6 && v7 == 2)
  {
    unint64_t componentsToCycle = self->_componentsToCycle;
    self->_isCyclingComponents = componentsToCycle != 0;
    if (componentsToCycle)
    {
      objc_initWeak(&location, self);
      [(SBDashBoardSetupViewController *)self _updateDisplayedStrings];
      id v9 = [(SBDashBoardSetupViewController *)self setupView];
      unint64_t v10 = self->_componentsToCycle;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __63__SBDashBoardSetupViewController__animateComponentsForNewCycle__block_invoke;
      v11[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v12, &location);
      [v9 animateComponents:v10 toActive:1 withCompletion:v11];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    self->_isCyclingComponents = 0;
  }
}

void __63__SBDashBoardSetupViewController__animateComponentsForNewCycle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _incrementLocalizedStringsForNewCycle];
    [v2 rebuildAppearance];
    [v2 _animateComponentsForNewCycle];
    id WeakRetained = v2;
  }
}

- (BOOL)isCyclingComponents:(unint64_t)a3
{
  return (self->_componentsToCycle & a3) != 0;
}

- (void)_stopCyclingComponents:(unint64_t)a3
{
  if (self->_isCyclingComponents)
  {
    if (!a3) {
      return;
    }
    BOOL v5 = (self->_componentsToCycle & ~a3) != 0;
    self->_componentsToCycle &= ~a3;
    self->_isCyclingComponents = v5;
    int v7 = [(SBDashBoardSetupViewController *)self setupView];
    [(NSTimer *)v7 animateComponents:a3 toActive:0 withCompletion:0];
    cycleStartTimer = v7;
  }
  else
  {
    if (![(NSTimer *)self->_cycleStartTimer isValid]) {
      return;
    }
    [(NSTimer *)self->_cycleStartTimer invalidate];
    cycleStartTimer = self->_cycleStartTimer;
    self->_cycleStartTimer = 0;
  }
}

- (void)_incrementLocalizedStringsForNewCycle
{
  unint64_t v3 = self->_currentStringsIndex + 1;
  self->_currentStringsIndex = v3;
  if (v3 >= [(NSMutableArray *)self->_currentStringsOrdering count])
  {
    char v4 = (NSMutableArray *)[(NSArray *)self->_stringsOrdering mutableCopy];
    currentStringsOrdering = self->_currentStringsOrdering;
    self->_currentStringsOrdering = v4;

    self->_currentStringsIndex = 0;
LABEL_5:
    if (!self->_shouldResetOrderingOnNextCycle) {
      return;
    }
    goto LABEL_6;
  }
  if (self->_currentStringsIndex <= 5) {
    goto LABEL_5;
  }
LABEL_6:
  [(SBDashBoardSetupViewController *)self _resetDisplayedLocalizedStringsImmediately:0];
}

- (void)_resetDisplayedLocalizedStringsImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSMutableArray removeObjectsInRange:](self->_currentStringsOrdering, "removeObjectsInRange:", 0, self->_currentStringsIndex);
  id v7 = [(SBDashBoardSetupViewController *)self _importantLanguageIdentifiers];
  [(NSMutableArray *)self->_currentStringsOrdering removeObjectsInArray:v7];
  currentStringsOrdering = self->_currentStringsOrdering;
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
  [(NSMutableArray *)currentStringsOrdering insertObjects:v7 atIndexes:v6];

  self->_currentStringsIndex = 0;
  if (v3) {
    [(SBDashBoardSetupViewController *)self _updateDisplayedStrings];
  }
  self->_shouldResetOrderingOnNextCycle = 0;
}

- (void)_updateDisplayedStrings
{
  v48[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBDashBoardSetupViewController *)self setupView];
  char v4 = [(SBDashBoardSetupViewController *)self _currentLanguageIdentifier];
  BOOL v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = [v5 localizations];
  v48[0] = v4;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  id v9 = [v6 preferredLocalizationsFromArray:v7 forPreferences:v8];
  uint64_t v10 = [v9 firstObject];
  double v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = v4;
  }
  id v13 = v12;

  uint64_t v14 = SBFEffectiveHomeButtonType();
  if (v14 == 2) {
    id v15 = @"SWIPE_UP_TO_OPEN";
  }
  else {
    id v15 = @"PRESS_HOME_TO_OPEN";
  }
  CGFloat v16 = @"Press home to open";
  if (v14 == 2) {
    CGFloat v16 = @"Swipe up to open";
  }
  uint64_t v17 = v16;
  CGFloat v18 = v15;
  uint64_t v19 = [v5 localizedStringForKey:@"GREETING" value:@"Hello" table:@"CoverSheetCommon" localization:v13];
  v47 = v5;
  uint64_t v20 = [v5 localizedStringForKey:v18 value:v17 table:@"CoverSheetCommon" localization:v13];

  v45 = (void *)v19;
  [v3 setTitleString:v19 forLanguage:v13];
  if (v21 < 1.5) {
    double v21 = 1.5;
  }
  self->_customDelayDuration = v21;
  v44 = (void *)v20;
  v46 = v13;
  [v3 setCallToActionString:v20 forLanguage:v13];
  if (self->_isStoreRestricted)
  {
    id v22 = [(SBDashBoardSetupViewController *)self _applicableIdentifierForDictionary:self->_storeRestrictedStrings identifier:v4];
    v23 = [(NSDictionary *)self->_storeRestrictedStrings bs_safeDictionaryForKey:v22];
    v42 = [NSString stringWithFormat:@"Missing Title for %@ -> %@", v4, v22];
    v41 = [NSString stringWithFormat:@"Missing Body for %@ -> %@", v4, v22];
    v40 = [NSString stringWithFormat:@"Missing Link for %@ -> %@", v4, v22];
    CGPoint v24 = v23;
    v43 = v23;
    CGRect v25 = objc_msgSend(v23, "bs_safeStringForKey:", *MEMORY[0x1E4F78A38]);
    v26 = objc_msgSend(v23, "bs_safeStringForKey:", *MEMORY[0x1E4F78A28]);
    objc_msgSend(v24, "bs_safeStringForKey:", *MEMORY[0x1E4F78A30]);
    v28 = id v27 = v3;
    v29 = [(SBDashBoardSetupViewController *)self _displayStringForLocalizedString:v25 fallbackString:v42];
    uint64_t v30 = [(SBDashBoardSetupViewController *)self _displayStringForLocalizedString:v26 fallbackString:v41];
    v31 = [(SBDashBoardSetupViewController *)self _displayStringForLocalizedString:v28 fallbackString:v40];
    [v27 setStoreRestrictedStrings:v29 bodyString:v30 linkString:v31 forLanguage:v4];

    BOOL v3 = v27;
  }
  if (self->_isActivationLocked)
  {
    v32 = [(SBDashBoardSetupViewController *)self _applicableIdentifierForDictionary:self->_activationLockStrings identifier:v4];
    v33 = [(NSDictionary *)self->_activationLockStrings bs_safeDictionaryForKey:v32];
    v34 = [NSString stringWithFormat:@"Missing Title for %@ -> %@", v4, v32];
    id v35 = [NSString stringWithFormat:@"Missing Description for %@ -> %@", v4, v32];
    objc_super v36 = objc_msgSend(v33, "bs_safeStringForKey:", @"ActivationLockInfoTitle");
    v37 = objc_msgSend(v33, "bs_safeStringForKey:", @"ActivationLockInfoDescription");
    v38 = [(SBDashBoardSetupViewController *)self _displayStringForLocalizedString:v36 fallbackString:v34];
    v39 = [(SBDashBoardSetupViewController *)self _displayStringForLocalizedString:v37 fallbackString:v35];
    [v3 setActivationLockWarningString:v38 detailString:v39 forLanguage:v4];
  }
  [v3 setNeedsLayout];
}

- (id)_displayStringForLocalizedString:(id)a3 fallbackString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  if (!v5)
  {
    uint64_t v8 = SBLogDashBoard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SBDashBoardSetupViewController _displayStringForLocalizedString:fallbackString:]();
    }

    if (os_variant_has_internal_content()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  id v9 = v7;

  return v9;
}

- (id)_applicableIdentifierForDictionary:(id)a3 identifier:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v7 = [a3 allKeys];
  v14[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v9 = [v5 preferredLocalizationsFromArray:v7 forPreferences:v8];

  uint64_t v10 = [v9 firstObject];
  double v11 = v10;
  if (!v10) {
    uint64_t v10 = v6;
  }
  id v12 = v10;

  return v12;
}

- (id)_alignedMarketingOrdering
{
  id v2 = (void *)MEMORY[0x1E4F1CA48];
  BOOL v3 = [MEMORY[0x1E4F1CA20] baseSystemLanguages];
  char v4 = [v2 arrayWithArray:v3];

  uint64_t v5 = SBFEffectiveHomeButtonType();
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = @"PRESS_HOME_TO_OPEN";
  if (v5 == 2) {
    id v7 = @"SWIPE_UP_TO_OPEN";
  }
  uint64_t v8 = v7;
  id v9 = [v6 localizedStringForKey:v8 value:0 table:@"CoverSheetCommon" localization:@"pt-BR"];
  uint64_t v10 = [v6 localizedStringForKey:v8 value:0 table:@"CoverSheetCommon" localization:@"pt-PT"];
  if (([v9 isEqualToString:v10] & 1) == 0)
  {
    uint64_t v11 = [v4 count];
    if ([v4 count])
    {
      uint64_t v12 = 0;
      while (1)
      {
        id v13 = [v4 objectAtIndex:v12];
        char v14 = [v13 isEqualToString:@"pt"];

        if (v14) {
          break;
        }
        if (++v12 >= (unint64_t)[v4 count]) {
          goto LABEL_10;
        }
      }
      uint64_t v11 = v12;
    }
LABEL_10:
    [v4 insertObject:@"pt-PT" atIndex:v11 + 1];
  }
  [v4 addObject:@"zh_HK"];

  return v4;
}

- (void)_updateStringOrderingForLanguageChange
{
  BOOL v3 = [(SBDashBoardSetupViewController *)self _alignedMarketingOrdering];
  stringsOrdering = self->_stringsOrdering;
  self->_stringsOrdering = v3;

  uint64_t v5 = (NSMutableArray *)[(NSArray *)self->_stringsOrdering mutableCopy];
  currentStringsOrdering = self->_currentStringsOrdering;
  self->_currentStringsOrdering = v5;
}

- (id)_currentStoreRestrictedStringsDictionary
{
  storeRestrictedStrings = self->_storeRestrictedStrings;
  BOOL v3 = [(SBDashBoardSetupViewController *)self _currentLanguageIdentifier];
  char v4 = [(NSDictionary *)storeRestrictedStrings objectForKey:v3];

  return v4;
}

- (id)_currentActivationLockStringsDictionary
{
  activationLockStrings = self->_activationLockStrings;
  BOOL v3 = [(SBDashBoardSetupViewController *)self _currentLanguageIdentifier];
  char v4 = [(NSDictionary *)activationLockStrings objectForKey:v3];

  return v4;
}

- (id)_currentLanguageIdentifier
{
  return (id)[(NSMutableArray *)self->_currentStringsOrdering objectAtIndex:self->_currentStringsIndex];
}

- (id)_importantLanguageIdentifiers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  char v4 = v3;
  if (self->_telephonyPrimaryLanguage) {
    objc_msgSend(v3, "addObject:");
  }
  wifiPrimaryLanguage = self->_wifiPrimaryLanguage;
  if (wifiPrimaryLanguage
    && ![(NSString *)wifiPrimaryLanguage isEqualToString:self->_telephonyPrimaryLanguage])
  {
    [v4 addObject:self->_wifiPrimaryLanguage];
  }
  id v6 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  id v7 = v6;
  if (v6
    && ([v6 isEqualToString:self->_telephonyPrimaryLanguage] & 1) == 0
    && ([v7 isEqualToString:self->_wifiPrimaryLanguage] & 1) == 0)
  {
    [v4 addObject:v7];
  }
  uint64_t v8 = SBLogDashBoard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 debugDescription];
    int v12 = 138543362;
    id v13 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Important Languages: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  if (![v4 count])
  {
    uint64_t v10 = SBLogDashBoard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "No languages determined, defaulting to en", (uint8_t *)&v12, 2u);
    }

    [v4 addObject:@"en"];
  }

  return v4;
}

- (id)_subscriptionInfoForSubscriptionDataSource:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v3 = [(SBTelephonyManager *)self->_telephonyManager _secondarySubscriptionInfo];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    BOOL v3 = [(SBTelephonyManager *)self->_telephonyManager _primarySubscriptionInfo];
  }
  a2 = v3;
LABEL_6:
  return (id)(id)a2;
}

- (id)_subcriptionDataSourceDescription:(int64_t)a3
{
  if (a3) {
    return @"Secondary Subscription Data Source";
  }
  else {
    return @"Primary Subscription Data Source";
  }
}

- (void)_updateLanguageFromSubscriptionDataSource:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[SBDashBoardSetupViewController _subscriptionInfoForSubscriptionDataSource:](self, "_subscriptionInfoForSubscriptionDataSource:");
  id v6 = [v5 lastKnownNetworkCountryCode];
  id v7 = [MEMORY[0x1E4F1CA20] languagesForRegion:v6 subdivision:0 withThreshold:0 filter:0];
  uint64_t v8 = [(SBDashBoardSetupViewController *)self firstSupportedLanguageIdentifierInRegionalLanguageIdentifiers:v7 countryCode:v6];
  id v9 = SBLogDashBoard();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(SBDashBoardSetupViewController *)self _subcriptionDataSourceDescription:a3];
    int v16 = 138543618;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Supported language identifier: %{public}@, subscription data source: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v11 = [(SBDashBoardSetupViewController *)self _importantLanguageIdentifiers];
  int v12 = self->_telephonyPrimaryLanguage;
  objc_storeStrong((id *)&self->_telephonyPrimaryLanguage, v8);
  id v13 = SBLogDashBoard();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    uint64_t v17 = v12;
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[Cell][Primary] Language changed from %{public}@ to %{public}@", (uint8_t *)&v16, 0x16u);
  }

  if ([(NSString *)self->_telephonyPrimaryLanguage isEqualToString:v12]
    || ![(SBDashBoardSetupViewController *)self _haveImportantLanguagesChangedFrom:v11])
  {

LABEL_12:
    [(SBDashBoardSetupViewController *)self _updateStringOrderingForLanguageChange];
    goto LABEL_13;
  }
  uint64_t v14 = SBLogDashBoard();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 firstObject];
    int v16 = 138543362;
    uint64_t v17 = v15;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[Cell][Primary] Updating important languages, previous best was: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  [(SBDashBoardSetupViewController *)self _evaluateUpdatingLanguageForImportantLanguageChanges];

LABEL_13:
}

- (void)_updateLanguageFromTelephony
{
  [(SBDashBoardSetupViewController *)self _updateLanguageFromSubscriptionDataSource:0];
  if (!self->_telephonyPrimaryLanguage)
  {
    [(SBDashBoardSetupViewController *)self _updateLanguageFromSubscriptionDataSource:1];
  }
}

- (id)firstSupportedLanguageIdentifierInRegionalLanguageIdentifiers:(id)a3 countryCode:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[SBDashBoardSetupViewController _supportedLanguageIdentifierFromRegionalLanguageIdentifier:countryCode:](self, "_supportedLanguageIdentifierFromRegionalLanguageIdentifier:countryCode:", *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
        if (v13)
        {
          id v15 = (void *)v13;
          uint64_t v14 = v8;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = SBLogDashBoard();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v7;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "No supported languages found for country code: %{public}@", buf, 0xCu);
  }
  id v15 = 0;
LABEL_13:

  return v15;
}

- (id)_supportedLanguageIdentifierFromRegionalLanguageIdentifier:(id)a3 countryCode:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA20] languageFromLanguage:v6 byReplacingRegion:a4];
  if ([v7 length])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28B50];
    currentStringsOrdering = self->_currentStringsOrdering;
    v21[0] = v7;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    uint64_t v11 = [v8 preferredLocalizationsFromArray:currentStringsOrdering forPreferences:v10];
    int v12 = [v11 firstObject];

    uint64_t v13 = SBLogDashBoard();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543874;
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2114;
      long long v20 = v7;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Supported language: %{public}@ found for identifier: %{public}@, languageWithRegion: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    uint64_t v13 = SBLogDashBoard();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = v6;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "No supported language found for identifier: %{public}@, languageWithRegion: %{public}@", (uint8_t *)&v15, 0x16u);
    }
    int v12 = 0;
  }

  return v12;
}

- (void)_updateWifiPrimaryLanguageFromDiscoveredCountryCodes:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v4;
  uint64_t v38 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v9 = [MEMORY[0x1E4F70FE8] preferredLanguagesForRegion:v7];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v39 = v9;
        uint64_t v10 = [v9 reverseObjectEnumerator];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v57 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v45 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = [(SBDashBoardSetupViewController *)self _supportedLanguageIdentifierFromRegionalLanguageIdentifier:*(void *)(*((void *)&v44 + 1) + 8 * j) countryCode:v7];
              if (v15) {
                [v8 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v57 count:16];
          }
          while (v12);
        }

        [v5 setObject:v8 forKeyedSubscript:v7];
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v38);
  }

  id v16 = SBLogDashBoard();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = (NSString *)v5;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Preferred language identifiers for wifi discovered country codes: %{public}@", buf, 0xCu);
  }

  __int16 v17 = [v5 allValues];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    do
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v19 = obj;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v56 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v41;
        do
        {
          for (uint64_t k = 0; k != v21; ++k)
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * k);
            CGRect v25 = [v5 objectForKeyedSubscript:v24];
            v26 = [v25 lastObject];
            if (v26)
            {
              if (([v35 containsObject:v26] & 1) == 0) {
                [v35 addObject:v26];
              }
              [v25 removeLastObject];
            }
            if (![v25 count]) {
              [v5 setObject:0 forKeyedSubscript:v24];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v56 count:16];
        }
        while (v21);
      }

      id v27 = [v5 allValues];
      uint64_t v28 = [v27 count];
    }
    while (v28);
  }
  if ([v35 count])
  {
    v29 = [(SBDashBoardSetupViewController *)self _importantLanguageIdentifiers];
    uint64_t v30 = [v29 firstObject];
    v31 = [v35 firstObject];
    v32 = self->_wifiPrimaryLanguage;
    objc_storeStrong((id *)&self->_wifiPrimaryLanguage, v31);
    v33 = SBLogDashBoard();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v53 = v32;
      __int16 v54 = 2114;
      v55 = v31;
      _os_log_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_DEFAULT, "[WiFi] Language changed from %{public}@ to %{public}@", buf, 0x16u);
    }

    if (![(NSString *)self->_wifiPrimaryLanguage isEqualToString:v32]
      && [(SBDashBoardSetupViewController *)self _haveImportantLanguagesChangedFrom:v29])
    {
      v34 = SBLogDashBoard();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v53 = v30;
        _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "[WiFi] Updating important languages, previous best was: %{public}@", buf, 0xCu);
      }

      [(SBDashBoardSetupViewController *)self _evaluateUpdatingLanguageForImportantLanguageChanges];
    }
  }
}

- (BOOL)_haveImportantLanguagesChangedFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(SBDashBoardSetupViewController *)self _importantLanguageIdentifiers];
  uint64_t v6 = [v4 count];
  if (v6 == [v5 count])
  {
    if ([v5 count])
    {
      unint64_t v7 = 0;
      do
      {
        id v8 = [v4 objectAtIndex:v7];
        uint64_t v9 = [v5 objectAtIndex:v7];
        char v10 = [v8 isEqualToString:v9];

        if ((v10 & 1) == 0) {
          break;
        }
        ++v7;
      }
      while (v7 < [v5 count]);
      char v11 = v10 ^ 1;
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)_evaluateUpdatingLanguageForImportantLanguageChanges
{
  if (self->_isCyclingComponents) {
    self->_shouldResetOrderingOnNextCycle = 1;
  }
  else {
    [(SBDashBoardSetupViewController *)self _resetDisplayedLocalizedStringsImmediately:1];
  }
}

- (void)_checkIfActivationLocked
{
  BOOL v3 = [MEMORY[0x1E4F61A48] sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke;
  v4[3] = &unk_1E6AF8F08;
  v4[4] = self;
  [v3 activationLockInfoFromDeviceWithCompletion:v4];
}

void __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke_cold_1(v6, v7);
    }
  }
  else
  {
    if (![v5 isRestrictedSKU])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke_141;
      v8[3] = &unk_1E6AF5290;
      void v8[4] = *(void *)(a1 + 32);
      id v9 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v8);

      goto LABEL_5;
    }
    unint64_t v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Activation Lock] Info available, but SKU is restricted.", buf, 2u);
    }
  }

LABEL_5:
}

uint64_t __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke_141(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForLockInfo:*(void *)(a1 + 40)];
}

- (void)_updateForLockInfo:(id)a3
{
  BOOL isActivationLocked = self->_isActivationLocked;
  id v5 = a3;
  self->_BOOL isActivationLocked = [v5 isActivationLocked];
  id v6 = [v5 maskedAppleID];
  unint64_t v7 = (NSString *)[v6 copy];
  maskedAppleID = self->_maskedAppleID;
  self->_maskedAppleID = v7;

  id v9 = [v5 localeStrings];

  char v10 = (NSDictionary *)[v9 copy];
  activationLockStrings = self->_activationLockStrings;
  self->_activationLockStrings = v10;

  if (isActivationLocked != self->_isActivationLocked)
  {
    uint64_t v12 = [(SBDashBoardSetupViewController *)self setupView];
    [v12 setActivationLocked:self->_isActivationLocked];

    [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
  }
}

- (unint64_t)_componentsToStartCycling
{
  if (self->_isActivationLocked) {
    return 63;
  }
  else {
    return 31;
  }
}

- (void)_infoButtonTapped:(id)a3
{
  id v4 = [(SBDashBoardSetupViewController *)self setupView];
  id v5 = v4;
  activationInfoViewController = self->_activationInfoViewController;
  if (*(_OWORD *)&self->_activationInfoViewController == 0)
  {
    id v9 = objc_alloc_init(SBActivationInfoViewController);
    char v10 = [(CSCoverSheetViewControllerBase *)self legibilitySettings];
    [(SBActivationInfoViewController *)v9 setLegibilitySettings:v10];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke;
    v18[3] = &unk_1E6AF8F30;
    v18[4] = self;
    id v19 = v9;
    id v20 = v5;
    char v11 = v9;
    [(SBDashBoardSetupViewController *)self bs_addChildViewController:v11 animated:0 transitionBlock:v18];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke_2;
    v15[3] = &unk_1E6AF53D0;
    unint64_t v7 = v4;
    id v16 = v7;
    __int16 v17 = self;
    [(SBDashBoardSetupViewController *)self bs_removeChildViewController:activationInfoViewController animated:0 transitionBlock:v15];
    regulatoryInfoViewController = self->_regulatoryInfoViewController;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke_3;
    v12[3] = &unk_1E6AF53D0;
    uint64_t v13 = v7;
    uint64_t v14 = self;
    [(SBDashBoardSetupViewController *)self bs_removeChildViewController:regulatoryInfoViewController animated:0 transitionBlock:v12];

    char v11 = v16;
  }

  [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
  [v5 setNeedsLayout];
}

void __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1056), *(id *)(a1 + 40));
  unint64_t v7 = a2;
  id v4 = *(void **)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) view];
  [v4 setActivationInfoView:v5];

  id v6 = [*(id *)(a1 + 40) regulatoryInfoButton];
  [v6 addTarget:*(void *)(a1 + 32) action:sel__regulatoryInfoButtonTapped_ forControlEvents:64];

  v7[2]();
}

void __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  unint64_t v7 = a2;
  [v3 setActivationInfoView:0];
  id v4 = [*(id *)(*(void *)(a1 + 40) + 1056) regulatoryInfoButton];
  [v4 removeTarget:*(void *)(a1 + 40) action:0 forControlEvents:64];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v5 + 1056);
  *(void *)(v5 + 1056) = 0;

  v7[2]();
}

void __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 setRegulatoryInfoView:0];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v4 + 1064);
  *(void *)(v4 + 1064) = 0;

  v6[2]();
}

- (void)_regulatoryInfoButtonTapped:(id)a3
{
  uint64_t v4 = self->_regulatoryInfoViewController;
  uint64_t v5 = [(SBDashBoardSetupViewController *)self setupView];
  if (!v4)
  {
    id v6 = [[SBSetupRegulatoryInfoViewController alloc] initWithNibName:0 bundle:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__SBDashBoardSetupViewController__regulatoryInfoButtonTapped___block_invoke;
    v7[3] = &unk_1E6AF8F30;
    v7[4] = self;
    uint64_t v4 = v6;
    id v8 = v4;
    id v9 = v5;
    [(SBDashBoardSetupViewController *)self bs_addChildViewController:v4 animated:0 transitionBlock:v7];
  }
  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
  [v5 setNeedsLayout];
}

void __62__SBDashBoardSetupViewController__regulatoryInfoButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1064), *(id *)(a1 + 40));
  id v6 = a2;
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 40) view];
  [v4 setRegulatoryInfoView:v5];

  v6[2]();
}

- (BOOL)_isSecurityResearchDevice
{
  return MGGetBoolAnswer();
}

- (void)_startWifiScan
{
  if (!self->_wifiScanner && !self->_wifiPrimaryLanguage)
  {
    BOOL v3 = objc_alloc_init(SBSetupWiFiScanner);
    wifiScanner = self->_wifiScanner;
    self->_wifiScanner = v3;

    uint64_t v5 = self->_wifiScanner;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__SBDashBoardSetupViewController__startWifiScan__block_invoke;
    v6[3] = &unk_1E6AF8F58;
    v6[4] = self;
    [(SBSetupWiFiScanner *)v5 beginScanningWithCompletionHandler:v6];
  }
}

void __48__SBDashBoardSetupViewController__startWifiScan__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SBDashBoardSetupViewController__startWifiScan__block_invoke_2;
  v5[3] = &unk_1E6AF5290;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __48__SBDashBoardSetupViewController__startWifiScan__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1048);
  *(void *)(v2 + 1048) = 0;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _updateWifiPrimaryLanguageFromDiscoveredCountryCodes:v5];
}

- (void)_cancelWifiScan
{
  [(SBSetupWiFiScanner *)self->_wifiScanner cancel];
  wifiScanner = self->_wifiScanner;
  self->_wifiScanner = 0;
}

- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SBDashBoardSetupViewController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __81__SBDashBoardSetupViewController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  uint64_t v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Subscription info changed. Updating Language...", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updateLanguageFromTelephony];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pointerClickGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currentStringsOrdering, 0);
  objc_storeStrong((id *)&self->_stringsOrdering, 0);
  objc_storeStrong((id *)&self->_maskedAppleID, 0);
  objc_storeStrong((id *)&self->_activationLockStrings, 0);
  objc_storeStrong((id *)&self->_storeRestrictedStrings, 0);
  objc_storeStrong((id *)&self->_cycleStartTimer, 0);
  objc_storeStrong((id *)&self->_telephonyPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_wifiPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_configureKey, 0);
  objc_storeStrong((id *)&self->_telephonyManager, 0);
  objc_destroyWeak((id *)&self->_coverSheetViewController);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_regulatoryInfoViewController, 0);
  objc_storeStrong((id *)&self->_activationInfoViewController, 0);
  objc_storeStrong((id *)&self->_wifiScanner, 0);
}

void __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "failed to fetch apple account with error %{public}@", v1, 0xCu);
}

void __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "failed to fetch profile picture with error %{public}@", v1, 0xCu);
}

- (void)_displayStringForLocalizedString:fallbackString:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "%@", v1, 0xCu);
}

void __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Error getting activation lock info: %{private}@", v4, 0xCu);
}

@end