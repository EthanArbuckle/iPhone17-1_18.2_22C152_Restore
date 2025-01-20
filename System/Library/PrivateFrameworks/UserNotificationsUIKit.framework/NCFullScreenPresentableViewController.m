@interface NCFullScreenPresentableViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isPanning;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)isStaticContentLoadingComplete;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (MTMaterialView)_backgroundMaterialView;
- (NCFullScreenPresentableViewController)initWithNotificationRequest:(id)a3;
- (NCFullScreenPresentableViewControllerDelegate)delegate;
- (NCFullScreenStagingBannerView)_bannerView;
- (NCNotificationRequest)notificationRequest;
- (NCNotificationStaticContentProviding)staticContentProvider;
- (NSDictionary)notificationUsageTrackingState;
- (NSSet)activeTransitionBlockingAssertions;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (UIView)_backgroundOpaqueView;
- (double)_rubberbandedTranslationForTranslation:(double)a3;
- (double)transitionDuration:(id)a3;
- (id)_backgroundAnimationSettingsForStage:(int64_t)a3;
- (id)activeTransitionBlockingAssertionForReason:(id)a3;
- (id)requestTransitionBlockingAssertionWithReason:(id)a3;
- (int64_t)bannerStage;
- (int64_t)preferredUserInterfaceStyle;
- (void)_animateDismissalWithAdditionalAnimations:(id)a3 completion:(id)a4;
- (void)_animateTransitionToDetailStateForTrigger:(int64_t)a3;
- (void)_askDelegateToExecuteAction:(id)a3 withParameters:(id)a4 animated:(BOOL)a5;
- (void)_configureBackgroundMaterialViewIfNecessary;
- (void)_configureBackgroundOpaqueViewIfNecessary;
- (void)_configureBannerViewIfNecessary;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_executeDefaultAction:(BOOL)a3;
- (void)_handleBannerContentTap;
- (void)_handleBannerDefaultTap;
- (void)_invalidateDetailStageTransitionTimerIfNecessary;
- (void)_requestDismissalWithReason:(id)a3;
- (void)_setPanning:(BOOL)a3;
- (void)_startDetailStageTransitionTimerIfNecessary;
- (void)addPresentableObserver:(id)a3;
- (void)animateTransition:(id)a3;
- (void)contentProvider:(id)a3 performAction:(id)a4 animated:(BOOL)a5;
- (void)draggingDidBeginWithGestureProxy:(id)a3;
- (void)invalidateStaticContent;
- (void)loadStaticContentWithCompletion:(id)a3;
- (void)loadView;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)removePresentableObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationRequest:(id)a3;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NCFullScreenPresentableViewController

- (NCFullScreenPresentableViewController)initWithNotificationRequest:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCFullScreenPresentableViewController;
  v5 = [(NCFullScreenPresentableViewController *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    notificationRequest = v5->_notificationRequest;
    v5->_notificationRequest = (NCNotificationRequest *)v6;

    v8 = objc_alloc_init(NCFullScreenPresentableTransitioningDelegate);
    transitioningDelegate = v5->_transitioningDelegate;
    v5->_transitioningDelegate = v8;

    [(NCFullScreenPresentableViewController *)v5 setTransitioningDelegate:v5->_transitioningDelegate];
  }

  return v5;
}

- (int64_t)bannerStage
{
  if (![(NCFullScreenPresentableViewController *)self isViewLoaded]) {
    return 0;
  }
  bannerView = self->_bannerView;

  return [(NCFullScreenStagingBannerView *)bannerView stage];
}

- (NCNotificationStaticContentProviding)staticContentProvider
{
  if ([(NCFullScreenPresentableViewController *)self isViewLoaded])
  {
    v3 = [(NCFullScreenStagingBannerView *)self->_bannerView staticContentProvider];
  }
  else
  {
    v3 = 0;
  }

  return (NCNotificationStaticContentProviding *)v3;
}

- (BOOL)isStaticContentLoadingComplete
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NCFullScreenPresentableViewController *)v2 staticContentProvider];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      char v4 = [v3 isImageAssetLoadingComplete];
    }
    else {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 0;
  }

  objc_sync_exit(v2);
  return v4;
}

- (void)invalidateStaticContent
{
  if (self->_bannerView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([WeakRetained notificationRequestPresenter:self staticContentProviderForNotificationRequest:self->_notificationRequest], (uint64_t v6 = (NCNotificationRequestFullScreenContentProvider *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      char v4 = [NCNotificationRequestFullScreenContentProvider alloc];
      v5 = [(NCFullScreenPresentableViewController *)self notificationRequest];
      uint64_t v6 = [(NCNotificationRequestCoalescingContentProvider *)v4 initWithNotificationRequest:v5];
    }
    [(NCNotificationRequestContentProvider *)v6 setDelegate:self];
    [(NCFullScreenStagingBannerView *)self->_bannerView setStaticContentProvider:v6];
  }
}

- (void)loadStaticContentWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(NCFullScreenPresentableViewController *)v5 isStaticContentLoadingComplete])
  {
    [(NCFullScreenPresentableViewController *)v5 loadViewIfNeeded];
    uint64_t v6 = [(NCFullScreenPresentableViewController *)v5 staticContentProvider];
    if (objc_opt_respondsToSelector())
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __73__NCFullScreenPresentableViewController_loadStaticContentWithCompletion___block_invoke;
      v7[3] = &unk_1E6A92578;
      id v8 = v4;
      [v6 loadImageAssetsWithCompletion:v7];
    }
  }
  objc_sync_exit(v5);
}

uint64_t __73__NCFullScreenPresentableViewController_loadStaticContentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadView
{
  v3 = [_NCFullScreenPresentableViewControllerView alloc];
  id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  id v4 = -[_NCFullScreenPresentableViewControllerView initWithFrame:](v3, "initWithFrame:");
  [(NCFullScreenPresentableViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)NCFullScreenPresentableViewController;
  [(NCFullScreenPresentableViewController *)&v4 viewDidLoad];
  [(NCFullScreenPresentableViewController *)self _configureBackgroundMaterialViewIfNecessary];
  [(NCFullScreenPresentableViewController *)self _configureBackgroundOpaqueViewIfNecessary];
  [(NCFullScreenPresentableViewController *)self _configureBannerViewIfNecessary];
  v3 = [(NCFullScreenPresentableViewController *)self view];
  [v3 setAccessibilityIdentifier:@"nc-full-screen-presentable-view"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCFullScreenPresentableViewController;
  [(NCFullScreenPresentableViewController *)&v6 viewWillAppear:a3];
  objc_super v4 = [(NCFullScreenPresentableViewController *)self view];
  id v5 = [v4 layer];

  [v5 setAllowsHitTesting:1];
  [v5 setHitTestsAsOpaque:1];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NCFullScreenPresentableViewController;
  [(NCFullScreenPresentableViewController *)&v9 viewIsAppearing:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__NCFullScreenPresentableViewController_viewIsAppearing___block_invoke;
  v8[3] = &unk_1E6A91BB0;
  v8[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
  objc_initWeak(&location, self);
  bannerView = self->_bannerView;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__NCFullScreenPresentableViewController_viewIsAppearing___block_invoke_2;
  v5[3] = &unk_1E6A937A8;
  objc_copyWeak(&v6, &location);
  [(NCFullScreenStagingBannerView *)bannerView transitionToStage:1 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__NCFullScreenPresentableViewController_viewIsAppearing___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void __57__NCFullScreenPresentableViewController_viewIsAppearing___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startDetailStageTransitionTimerIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCFullScreenPresentableViewController;
  [(NCFullScreenPresentableViewController *)&v6 viewWillDisappear:a3];
  objc_super v4 = [(NCFullScreenPresentableViewController *)self view];
  id v5 = [v4 layer];
  [v5 setAllowsHitTesting:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)NCFullScreenPresentableViewController;
  [(NCFullScreenPresentableViewController *)&v13 viewDidDisappear:a3];
  objc_super v4 = self;
  objc_sync_enter(v4);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(NCFullScreenPresentableViewController *)v4 activeTransitionBlockingAssertions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) invalidateWithReason:@"fullScreenPresentable.invalidationReason.dismissed"];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  -[NCFullScreenPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:", a4.width, a4.height);

  [(NCFullScreenPresentableViewController *)self preferredContentSize];
  result.height = v6;
  result.width = v5;
  return result;
}

- (NSString)requesterIdentifier
{
  if (requesterIdentifier_onceToken != -1) {
    dispatch_once(&requesterIdentifier_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)requesterIdentifier___requesterIdentifier;

  return (NSString *)v2;
}

void __60__NCFullScreenPresentableViewController_requesterIdentifier__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v0 = [v2 bundleIdentifier];
  id v1 = (void *)requesterIdentifier___requesterIdentifier;
  requesterIdentifier___requesterIdentifier = v0;
}

- (NSString)requestIdentifier
{
  return (NSString *)[(NCNotificationRequest *)self->_notificationRequest notificationIdentifier];
}

- (BOOL)isDraggingDismissalEnabled
{
  return 0;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (void)draggingDidBeginWithGestureProxy:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke;
  v5[3] = &unk_1E6A93778;
  objc_copyWeak(&v6, &location);
  void v5[4] = self;
  [v4 setActionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained _bannerView];
    uint64_t v8 = [v6 view];
    [v8 bounds];
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    switch([v3 state])
    {
      case 1:
        [v6 _setPanning:1];
        [v6 _invalidateDetailStageTransitionTimerIfNecessary];
        goto LABEL_5;
      case 2:
LABEL_5:
        UIRectGetCenter();
        uint64_t v21 = v20;
        double v23 = v22;
        [v3 translationInCoordinateSpace:v8];
        [*(id *)(a1 + 32) _rubberbandedTranslationForTranslation:v24];
        double v26 = v25;
        double v27 = v23 + v25;
        v28 = [*(id *)(a1 + 32) view];
        [v28 bounds];
        double Height = CGRectGetHeight(v78);
        v30 = +[NCUNUIKitPrototypeDomain rootSettings];
        [v30 interactiveDismissalThreshold];
        double v32 = Height * v31;

        double v33 = -v26;
        if (v26 >= 0.0) {
          double v33 = v26;
        }
        double v34 = fmin(fmax(v33 / v32, 0.0), 1.0);
        v35 = +[NCUNUIKitPrototypeDomain rootSettings];
        [v35 interactiveDismissalMinContentScale];
        double v37 = 1.0 - v34 + v34 * v36;

        v38 = +[NCUNUIKitPrototypeDomain rootSettings];
        [v38 interactiveDismissalMinContentAlpha];
        double v40 = 1.0 - v34 + v34 * v39;

        v41 = +[NCUNUIKitPrototypeDomain rootSettings];
        [v41 interactiveDismissalMinBackgroundProgress];
        double v43 = 1.0 - v34 + v34 * v42;

        v44 = +[NCUNUIKitPrototypeDomain rootSettings];
        v45 = [v44 interactiveDismissalTrackingSettings];
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_2;
        v70[3] = &unk_1E6A937D0;
        uint64_t v73 = v21;
        double v74 = v27;
        double v75 = v37;
        double v76 = v40;
        id v71 = v7;
        v72 = v6;
        double v77 = v43;
        [v45 animateTracking:1 animations:v70 completion:0];

        v19 = v71;
        goto LABEL_8;
      case 3:
        [v3 translationInCoordinateSpace:v8];
        double v47 = v46;
        [v3 velocityInCoordinateSpace:v8];
        double v49 = v48;
        v50 = [v8 traitCollection];
        [v50 displayScale];
        double v52 = NCTranslationWithVelocityAndDefaultScrollViewAcceleration(v49, v51);

        [*(id *)(a1 + 32) _rubberbandedTranslationForTranslation:v47 + v52];
        double v54 = v53;
        v55 = [*(id *)(a1 + 32) view];
        [v55 bounds];
        double v56 = CGRectGetHeight(v79);
        v57 = +[NCUNUIKitPrototypeDomain rootSettings];
        [v57 interactiveDismissalThreshold];
        double v59 = v56 * v58;

        double v60 = -v54;
        if (v54 >= 0.0) {
          double v60 = v54;
        }
        if (v60 <= v59) {
          goto LABEL_3;
        }
        [v6 _setPanning:0];
        [v6 _requestDismissalWithReason:*MEMORY[0x1E4F4F590]];
        break;
      case 4:
      case 5:
LABEL_3:
        [v6 _setPanning:0];
        v17 = +[NCUNUIKitPrototypeDomain rootSettings];
        v18 = [v17 interactiveDismissalAutomaticSettings];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_3;
        v63[3] = &unk_1E6A937F8;
        uint64_t v66 = v10;
        uint64_t v67 = v12;
        uint64_t v68 = v14;
        uint64_t v69 = v16;
        id v64 = v7;
        v65 = v6;
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_4;
        v61[3] = &unk_1E6A937A8;
        objc_copyWeak(&v62, v4);
        [v18 animateTracking:0 animations:v63 completion:v61];

        objc_destroyWeak(&v62);
        v19 = v64;
LABEL_8:

        break;
      default:
        break;
    }
  }
}

void __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64));
  [v2 setTransform:&v5];
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 72)];
  id v3 = [*(id *)(a1 + 40) _backgroundMaterialView];
  [v3 setWeighting:*(double *)(a1 + 80)];

  if ([*(id *)(a1 + 32) stage] >= 2)
  {
    id v4 = [*(id *)(a1 + 40) _backgroundOpaqueView];
    [v4 setAlpha:*(double *)(a1 + 80)];
  }
}

void __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  UIRectGetCenter();
  objc_msgSend(v2, "setCenter:");
  id v3 = *(void **)(a1 + 32);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v7[0] = *MEMORY[0x1E4F1DAB8];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v7];
  [*(id *)(a1 + 32) setAlpha:1.0];
  CGAffineTransform v5 = [*(id *)(a1 + 40) _backgroundMaterialView];
  [v5 setWeighting:1.0];

  if ([*(id *)(a1 + 32) stage] >= 2)
  {
    id v6 = [*(id *)(a1 + 40) _backgroundOpaqueView];
    [v6 setAlpha:1.0];
  }
}

void __74__NCFullScreenPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke_4(uint64_t a1, int a2, char a3)
{
  if (a2 && (a3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _startDetailStageTransitionTimerIfNecessary];
  }
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__NCFullScreenPresentableViewController_presentableWillAppearAsBanner___block_invoke;
  v6[3] = &unk_1E6A93820;
  id v7 = v4;
  id v5 = v4;
  [(NCFullScreenPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_presentableWillAppearAsBanner_ usingBlock:v6];
}

uint64_t __71__NCFullScreenPresentableViewController_presentableWillAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableWillAppearAsBanner:*(void *)(a1 + 32)];
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__NCFullScreenPresentableViewController_presentableDidAppearAsBanner___block_invoke;
  v6[3] = &unk_1E6A93820;
  id v7 = v4;
  id v5 = v4;
  [(NCFullScreenPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_presentableDidAppearAsBanner_ usingBlock:v6];
}

uint64_t __70__NCFullScreenPresentableViewController_presentableDidAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableDidAppearAsBanner:*(void *)(a1 + 32)];
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__NCFullScreenPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_1E6A93848;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NCFullScreenPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_presentableWillDisappearAsBanner_withReason_ usingBlock:v10];
}

uint64_t __85__NCFullScreenPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableWillDisappearAsBanner:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40)];
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__NCFullScreenPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_1E6A93848;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NCFullScreenPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_presentableDidDisappearAsBanner_withReason_ usingBlock:v10];
}

uint64_t __84__NCFullScreenPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableDidDisappearAsBanner:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40)];
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__NCFullScreenPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E6A93820;
  id v7 = v4;
  id v5 = v4;
  [(NCFullScreenPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_userInteractionWillBeginForBannerForPresentable_ usingBlock:v6];
}

uint64_t __89__NCFullScreenPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userInteractionWillBeginForBannerForPresentable:*(void *)(a1 + 32)];
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__NCFullScreenPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E6A93820;
  id v7 = v4;
  id v5 = v4;
  [(NCFullScreenPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_userInteractionDidEndForBannerForPresentable_ usingBlock:v6];
}

uint64_t __86__NCFullScreenPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userInteractionDidEndForBannerForPresentable:*(void *)(a1 + 32)];
}

- (void)addPresentableObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removePresentableObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

- (NSDictionary)notificationUsageTrackingState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = [WeakRetained notificationRequestPresenterNotificationUsageTrackingState:self];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSSet)activeTransitionBlockingAssertions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v2->_reasonsToTransitionBlockingAssertions;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = -[NSMapTable objectForKey:](v2->_reasonsToTransitionBlockingAssertions, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        if ([v8 isValid]) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (id)requestTransitionBlockingAssertionWithReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(NCFullScreenPresentableViewController *)v5 activeTransitionBlockingAssertionForReason:v4];
    if (!v6)
    {
      id v7 = (id)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(NCNotificationRequest *)v5->_notificationRequest notificationIdentifier];
        id v9 = objc_msgSend(v8, "un_logDigest");
        *(_DWORD *)buf = 138543618;
        v17 = v9;
        __int16 v18 = 2114;
        id v19 = v4;
        _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "New transition blocking assertion requested for full screen presentable view controller for request '%{public}@' with reason '%{public}@' – invalidating detail stage transition timer", buf, 0x16u);
      }
      [(NCFullScreenPresentableViewController *)v5 _invalidateDetailStageTransitionTimerIfNecessary];
      if (!v5->_reasonsToTransitionBlockingAssertions)
      {
        uint64_t v10 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
        reasonsToTransitionBlockingAssertions = v5->_reasonsToTransitionBlockingAssertions;
        v5->_reasonsToTransitionBlockingAssertions = (NSMapTable *)v10;
      }
      uint64_t v6 = [[NCAssertion alloc] initWithInstantiationReason:v4];
      objc_initWeak((id *)buf, v5);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __86__NCFullScreenPresentableViewController_requestTransitionBlockingAssertionWithReason___block_invoke;
      v14[3] = &unk_1E6A91958;
      objc_copyWeak(&v15, (id *)buf);
      [(NCAssertion *)v6 addInvalidationBlock:v14];
      [(NSMapTable *)v5->_reasonsToTransitionBlockingAssertions setObject:v6 forKey:v4];
      id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained notificationRequestPresenter:v5 didVendTransitionBlockingAssertion:v6];
      }

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __86__NCFullScreenPresentableViewController_requestTransitionBlockingAssertionWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [WeakRetained notificationRequest];
    id v9 = [v8 notificationIdentifier];
    uint64_t v10 = objc_msgSend(v9, "un_logDigest");
    int v11 = 138543618;
    long long v12 = v10;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "Transition blocking assertion for full screen presentable view controller for request '%{public}@' invalidated with reason '%{public}@' – starting detail stage transition timer", (uint8_t *)&v11, 0x16u);
  }
  [WeakRetained _startDetailStageTransitionTimerIfNecessary];
}

- (id)activeTransitionBlockingAssertionForReason:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(NSMapTable *)v5->_reasonsToTransitionBlockingAssertions objectForKey:v4];
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)contentProvider:(id)a3 performAction:(id)a4 animated:(BOOL)a5
{
}

- (double)transitionDuration:(id)a3
{
  return 1.0;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  if ([(NCFullScreenPresentableViewController *)self bs_isDisappearingOrDisappeared])
  {
    objc_initWeak(&location, self);
    uint64_t v5 = [(NCFullScreenPresentableViewController *)self _backgroundAnimationSettingsForStage:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__NCFullScreenPresentableViewController_animateTransition___block_invoke;
    v12[3] = &unk_1E6A92FE0;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_2;
    v10[3] = &unk_1E6A91EF8;
    id v11 = v13;
    NCPerformActionsAnimatingIfNecessary(v5, v12, v10);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_3;
    v8[3] = &unk_1E6A91BB0;
    id v9 = v4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_4;
    v6[3] = &unk_1E6A91EF8;
    id v7 = v9;
    [(NCFullScreenPresentableViewController *)self _animateDismissalWithAdditionalAnimations:v8 completion:v6];
  }
}

void __59__NCFullScreenPresentableViewController_animateTransition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _backgroundMaterialView];
  [v2 setWeighting:1.0];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
  }
}

uint64_t __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

uint64_t __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_3(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "__runAlongsideAnimations");
  }
  return result;
}

uint64_t __59__NCFullScreenPresentableViewController_animateTransition___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

- (id)_backgroundAnimationSettingsForStage:(int64_t)a3
{
  id v4 = +[NCUNUIKitPrototypeDomain rootSettings];
  uint64_t v5 = v4;
  switch(a3)
  {
    case 3:
      uint64_t v6 = [v4 dismissBackgroundSettings];
      goto LABEL_7;
    case 2:
      uint64_t v6 = [v4 detailBackgroundSettings];
      goto LABEL_7;
    case 1:
      uint64_t v6 = [v4 briefBackgroundSettings];
LABEL_7:
      id v7 = (void *)v6;
      goto LABEL_9;
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (void)_animateTransitionToDetailStateForTrigger:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NCFullScreenStagingBannerView *)self->_bannerView stage] > 1)
  {
    id v11 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      notificationRequest = self->_notificationRequest;
      id v13 = v11;
      id v14 = [(NCNotificationRequest *)notificationRequest notificationIdentifier];
      uint64_t v15 = objc_msgSend(v14, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      double v24 = v15;
      _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "Notification request '%{public}@' is already at least at detail stage – aborting transition attempt", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__NCFullScreenPresentableViewController__animateTransitionToDetailStateForTrigger___block_invoke;
    aBlock[3] = &unk_1E6A93870;
    objc_copyWeak(&v21, &location);
    aBlock[4] = self;
    uint64_t v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    uint64_t v6 = [(NCNotificationRequest *)self->_notificationRequest options];
    int v7 = [v6 revealsAdditionalContentOnPresentation];

    if (v7)
    {
      id v8 = (id)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(NCNotificationRequest *)self->_notificationRequest notificationIdentifier];
        uint64_t v10 = objc_msgSend(v9, "un_logDigest");
        *(_DWORD *)buf = 138543362;
        double v24 = v10;
        _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "Notification request '%{public}@' specifies revealing additional content on presentation – transitioning to detail stage", buf, 0xCu);
      }
      v5[2](v5, 1);
    }
    else
    {
      uint64_t v16 = [(NCFullScreenPresentableViewController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        [v16 notificationRequestPresenter:self shouldTransitionToStage:@"fullScreenPresentable.presentingStage.detail" forTrigger:a3 completionBlock:v5];
      }
      else
      {
        v17 = (id)*MEMORY[0x1E4FB3750];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = [(NCNotificationRequest *)self->_notificationRequest notificationIdentifier];
          id v19 = objc_msgSend(v18, "un_logDigest");
          *(_DWORD *)buf = 138543362;
          double v24 = v19;
          _os_log_impl(&dword_1D7C04000, v17, OS_LOG_TYPE_DEFAULT, "Delegate for full screen presentable view controller for request '%{public}@' doesn't respond to selector – denying transition to detail stage", buf, 0xCu);
        }
        v5[2](v5, 0);
      }
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __83__NCFullScreenPresentableViewController__animateTransitionToDetailStateForTrigger___block_invoke(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (void *)*MEMORY[0x1E4FB3750];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      int v7 = v5;
      id v8 = [WeakRetained notificationRequest];
      id v9 = [v8 notificationIdentifier];
      uint64_t v10 = objc_msgSend(v9, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      id v19 = v10;
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "Transitioning notification request '%{public}@' to detail stage", buf, 0xCu);
    }
    id v11 = [*(id *)(a1 + 32) _backgroundAnimationSettingsForStage:2];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__NCFullScreenPresentableViewController__animateTransitionToDetailStateForTrigger___block_invoke_61;
    v17[3] = &unk_1E6A91BB0;
    v17[4] = WeakRetained;
    NCPerformActionsAnimatingIfNecessary(v11, v17, 0);

    long long v12 = [WeakRetained _bannerView];
    [v12 transitionToStage:2 completion:0];

    [WeakRetained _invalidateDetailStageTransitionTimerIfNecessary];
  }
  else if (v6)
  {
    id v13 = v5;
    id v14 = [WeakRetained notificationRequest];
    uint64_t v15 = [v14 notificationIdentifier];
    uint64_t v16 = objc_msgSend(v15, "un_logDigest");
    *(_DWORD *)buf = 138543362;
    id v19 = v16;
    _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "Delegate for full screen presentable view controller for request '%{public}@' returned 'NO' – denying transition to detail stage", buf, 0xCu);
  }
}

void __83__NCFullScreenPresentableViewController__animateTransitionToDetailStateForTrigger___block_invoke_61(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _backgroundOpaqueView];
  [v1 setAlpha:1.0];
}

- (void)_animateDismissalWithAdditionalAnimations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  int v8 = BSEqualStrings();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke;
  aBlock[3] = &unk_1E6A93898;
  objc_copyWeak(&v24, &location);
  char v25 = v8;
  id v9 = v6;
  id v23 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke_2;
  v20[3] = &unk_1E6A919A0;
  objc_copyWeak(&v21, &location);
  id v11 = _Block_copy(v20);
  if (v8)
  {
    long long v12 = +[NCUNUIKitPrototypeDomain rootSettings];
    id v13 = [v12 interactiveDismissalAutomaticSettings];
    NCPerformActionsAnimatingIfNecessary(v13, v10, 0);

    id v14 = +[NCUNUIKitPrototypeDomain rootSettings];
    uint64_t v15 = [v14 interactiveDismissalBackgoundSettings];
    NCPerformActionsAnimatingIfNecessary(v15, v11, v7);
  }
  else
  {
    uint64_t v16 = [(NCFullScreenPresentableViewController *)self _backgroundAnimationSettingsForStage:3];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke_3;
    v17[3] = &unk_1E6A938C0;
    id v18 = v10;
    id v19 = v11;
    NCPerformActionsAnimatingIfNecessary(v16, v17, 0);

    [(NCFullScreenStagingBannerView *)self->_bannerView transitionToStage:3 completion:v7];
    id v14 = v18;
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = [WeakRetained _bannerView];
    uint64_t v5 = +[NCUNUIKitPrototypeDomain rootSettings];
    [v5 interactiveDismissalFinalContentScale];
    CGFloat v7 = v6;

    CGAffineTransformMakeScale(&v9, v7, v7);
    [v4 setTransform:&v9];
    [v4 setAlpha:0.0];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

void __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _backgroundMaterialView];
  [v1 setWeighting:0.0];

  id v2 = [WeakRetained _backgroundOpaqueView];
  [v2 setAlpha:0.0];
}

uint64_t __94__NCFullScreenPresentableViewController__animateDismissalWithAdditionalAnimations_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_startDetailStageTransitionTimerIfNecessary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_detailStageTransitionTimer
    && [(NCFullScreenStagingBannerView *)self->_bannerView stage] <= 1
    && !self->_panning)
  {
    id v3 = [(NCFullScreenPresentableViewController *)self activeTransitionBlockingAssertions];
    uint64_t v4 = [v3 count];

    if (!v4)
    {
      uint64_t v5 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        notificationRequest = self->_notificationRequest;
        CGFloat v7 = v5;
        uint64_t v8 = [(NCNotificationRequest *)notificationRequest notificationIdentifier];
        CGAffineTransform v9 = objc_msgSend(v8, "un_logDigest");
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v9;
        _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "Starting transition timer for full screen presentable view controller for request '%{public}@'", buf, 0xCu);
      }
      uint64_t v10 = +[NCUNUIKitPrototypeDomain rootSettings];
      self->_detailStageTransitionRemainingAttempts = [v10 detailStageTransitionMaxAttempts];

      objc_initWeak((id *)buf, self);
      id v11 = (void *)MEMORY[0x1E4F1CB00];
      long long v12 = +[NCUNUIKitPrototypeDomain rootSettings];
      [v12 detailStageTransitionDelay];
      double v14 = v13;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __84__NCFullScreenPresentableViewController__startDetailStageTransitionTimerIfNecessary__block_invoke;
      v17[3] = &unk_1E6A938E8;
      objc_copyWeak(&v18, (id *)buf);
      uint64_t v15 = [v11 scheduledTimerWithTimeInterval:1 repeats:v17 block:v14];
      detailStageTransitionTimer = self->_detailStageTransitionTimer;
      self->_detailStageTransitionTimer = v15;

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __84__NCFullScreenPresentableViewController__startDetailStageTransitionTimerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[125];
    BOOL v4 = v3 < 1;
    uint64_t v5 = v3 - 1;
    if (v4)
    {
      long long v12 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        double v13 = v12;
        double v14 = [v2 notificationRequest];
        uint64_t v15 = [v14 notificationIdentifier];
        uint64_t v16 = objc_msgSend(v15, "un_logDigest");
        int v17 = 138543362;
        id v18 = v16;
        _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "Ceasing attempts to animate transition of notification request '%{public}@' to detail stage – no attempts remaining", (uint8_t *)&v17, 0xCu);
      }
      [v2 _invalidateDetailStageTransitionTimerIfNecessary];
    }
    else
    {
      WeakRetained[125] = v5;
      double v6 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v7 = v6;
        uint64_t v8 = [v2 notificationRequest];
        CGAffineTransform v9 = [v8 notificationIdentifier];
        uint64_t v10 = objc_msgSend(v9, "un_logDigest");
        uint64_t v11 = v2[125];
        int v17 = 138543618;
        id v18 = v10;
        __int16 v19 = 2050;
        uint64_t v20 = v11;
        _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to animate transition of notification request '%{public}@' to detail stage – %{public}ld attempts remaining", (uint8_t *)&v17, 0x16u);
      }
      [v2 _animateTransitionToDetailStateForTrigger:7];
    }
  }
}

- (void)_invalidateDetailStageTransitionTimerIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    notificationRequest = self->_notificationRequest;
    uint64_t v5 = v3;
    double v6 = [(NCNotificationRequest *)notificationRequest notificationIdentifier];
    CGFloat v7 = objc_msgSend(v6, "un_logDigest");
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating transition timer for full screen presentable view controller for request '%{public}@'", (uint8_t *)&v9, 0xCu);
  }
  [(NSTimer *)self->_detailStageTransitionTimer invalidate];
  detailStageTransitionTimer = self->_detailStageTransitionTimer;
  self->_detailStageTransitionTimer = 0;
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void))a4;
  if (v5 && [(NSHashTable *)self->_observers count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  if (!self->_backgroundMaterialView)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F743C8];
    BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v3 materialViewWithRecipeNamed:@"fullScreenBannerBackground" inBundle:v4 options:0 initialWeighting:0 scaleAdjustment:0.0];
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v5;

    [(MTMaterialView *)self->_backgroundMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:1];
    id v8 = [(NCFullScreenPresentableViewController *)self view];
    uint64_t v7 = self->_backgroundMaterialView;
    [v8 bounds];
    -[MTMaterialView setFrame:](v7, "setFrame:");
    [v8 insertSubview:self->_backgroundMaterialView atIndex:0];
    [(MTMaterialView *)self->_backgroundMaterialView setAutoresizingMask:18];
  }
}

- (void)_configureBackgroundOpaqueViewIfNecessary
{
  if (!self->_backgroundOpaqueView)
  {
    id v9 = [(NCFullScreenPresentableViewController *)self view];
    uint64_t v3 = [_NCFullScreenPresentableViewControllerOpaqueBackgroundView alloc];
    [v9 bounds];
    BOOL v4 = -[_NCFullScreenPresentableViewControllerOpaqueBackgroundView initWithFrame:](v3, "initWithFrame:");
    backgroundOpaqueView = self->_backgroundOpaqueView;
    self->_backgroundOpaqueView = v4;

    double v6 = self->_backgroundOpaqueView;
    uint64_t v7 = [MEMORY[0x1E4FB1618] systemBlackColor];
    [(UIView *)v6 setBackgroundColor:v7];

    [(UIView *)self->_backgroundOpaqueView setAlpha:0.0];
    id v8 = self->_backgroundOpaqueView;
    if (self->_backgroundMaterialView) {
      objc_msgSend(v9, "insertSubview:aboveSubview:", v8);
    }
    else {
      objc_msgSend(v9, "insertSubview:atIndex:", v8);
    }
    [(UIView *)self->_backgroundOpaqueView setAutoresizingMask:18];
  }
}

- (void)_configureBannerViewIfNecessary
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!self->_bannerView)
  {
    uint64_t v3 = [NCFullScreenStagingBannerView alloc];
    BOOL v4 = +[NCUNUIKitPrototypeDomain rootSettings];
    uint64_t v5 = [(NCFullScreenStagingBannerView *)v3 initWithSettings:v4];
    bannerView = self->_bannerView;
    self->_bannerView = v5;

    objc_initWeak(&location, self);
    uint64_t v7 = self->_bannerView;
    id v8 = (void *)MEMORY[0x1E4FB13F0];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __72__NCFullScreenPresentableViewController__configureBannerViewIfNecessary__block_invoke;
    v30[3] = &unk_1E6A91930;
    double v22 = &v31;
    objc_copyWeak(&v31, &location);
    id v9 = [v8 actionWithHandler:v30];
    [(NCFullScreenStagingBannerView *)v7 setContentTapAction:v9];

    uint64_t v10 = self->_bannerView;
    uint64_t v11 = (void *)MEMORY[0x1E4FB13F0];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __72__NCFullScreenPresentableViewController__configureBannerViewIfNecessary__block_invoke_2;
    v28[3] = &unk_1E6A91930;
    id v23 = &v29;
    objc_copyWeak(&v29, &location);
    long long v12 = [v11 actionWithHandler:v28];
    [(NCFullScreenStagingBannerView *)v10 setDefaultTapAction:v12];

    [(NCFullScreenPresentableViewController *)self _configureBackgroundMaterialViewIfNecessary];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v13 = [(NCFullScreenStagingBannerView *)self->_bannerView requiredVisualStyleCategories];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v25;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v16), "integerValue", v22, v23);
          id v18 = self->_bannerView;
          __int16 v19 = [(MTMaterialView *)self->_backgroundMaterialView visualStylingProviderForCategory:v17];
          [(NCFullScreenStagingBannerView *)v18 setVisualStylingProvider:v19 forCategory:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v14);
    }

    uint64_t v20 = [(NCFullScreenPresentableViewController *)self view];
    uint64_t v21 = self->_bannerView;
    [v20 bounds];
    -[NCFullScreenStagingBannerView setFrame:](v21, "setFrame:");
    [v20 addSubview:self->_bannerView];
    [(NCFullScreenStagingBannerView *)self->_bannerView setAutoresizingMask:18];
    [(NCFullScreenPresentableViewController *)self invalidateStaticContent];

    objc_destroyWeak(v23);
    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

void __72__NCFullScreenPresentableViewController__configureBannerViewIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleBannerContentTap];
}

void __72__NCFullScreenPresentableViewController__configureBannerViewIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleBannerDefaultTap];
}

- (void)_askDelegateToExecuteAction:(id)a3 withParameters:(id)a4 animated:(BOOL)a5
{
  id v17 = a3;
  id v7 = a4;
  if (v17)
  {
    id v8 = [(NCNotificationRequest *)self->_notificationRequest userNotification];
    if (v8)
    {
      id v9 = (void *)[v7 mutableCopy];
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      long long v12 = v11;

      long long v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
      [v12 setValue:v13 forKey:*MEMORY[0x1E4F44768]];
      uint64_t v14 = [v12 copy];

      id v7 = (id)v14;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = [(NCFullScreenPresentableViewController *)self delegate];
      [v16 notificationRequestPresenter:self executeAction:v17 withParameters:v7 completion:0];
    }
  }
}

- (void)_executeDefaultAction:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(NCFullScreenStagingBannerView *)self->_bannerView staticContentProvider];
  uint64_t v6 = [v4 defaultAction];

  uint64_t v5 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3);
    uint64_t v5 = (void *)v6;
  }
}

- (void)_handleBannerContentTap
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[NCNotificationEventTracker sharedInstance];
  notificationRequest = self->_notificationRequest;
  uint64_t v5 = [(NCFullScreenPresentableViewController *)self notificationUsageTrackingState];
  [v3 shortLookDefaultActionInvokedWithTrigger:0 forNotificationRequest:notificationRequest withState:v5];

  uint64_t v6 = [(NCFullScreenPresentableViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v6 fullScreenPresentableViewControllerShouldTransitionToDetailStageOnTap:self]
    && [(NCFullScreenStagingBannerView *)self->_bannerView stage] != 2)
  {
    id v7 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = self->_notificationRequest;
      id v9 = v7;
      uint64_t v10 = [(NCNotificationRequest *)v8 notificationIdentifier];
      id v11 = objc_msgSend(v10, "un_logDigest");
      int v19 = 138543362;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "Notification request presenter tap performing transition to detail stage for request '%{public}@'", (uint8_t *)&v19, 0xCu);
    }
    [(NCFullScreenPresentableViewController *)self _invalidateDetailStageTransitionTimerIfNecessary];
    [(NCFullScreenPresentableViewController *)self _animateTransitionToDetailStateForTrigger:4];
  }
  else
  {
    long long v12 = [(NCFullScreenStagingBannerView *)self->_bannerView staticContentProvider];
    long long v13 = [v12 defaultAction];

    if (v13)
    {
      uint64_t v14 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = self->_notificationRequest;
        uint64_t v16 = v14;
        id v17 = [(NCNotificationRequest *)v15 notificationIdentifier];
        id v18 = objc_msgSend(v17, "un_logDigest");
        int v19 = 138543362;
        uint64_t v20 = v18;
        _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "Notification request presenter tap performing default action for request '%{public}@'", (uint8_t *)&v19, 0xCu);
      }
      [(NCFullScreenPresentableViewController *)self _executeDefaultAction:1];
    }
  }
}

- (void)_requestDismissalWithReason:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_dismissalRequestReason, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained fullScreenPresentableViewController:self requestsDismissalWithReason:v6];
  }
}

- (void)_handleBannerDefaultTap
{
}

- (double)_rubberbandedTranslationForTranslation:(double)a3
{
  uint64_t v5 = [(NCFullScreenPresentableViewController *)self view];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(NCFullScreenStagingBannerView *)self->_bannerView contentFrame];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t rect = v20;
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  CGRectGetHeight(v31);
  uint64_t v21 = v15;
  uint64_t v22 = v17;
  uint64_t v23 = v19;
  uint64_t v24 = rect;
  if (a3 <= 0.0) {
    CGRectGetMinY(*(CGRect *)&v21);
  }
  else {
    CGRectGetMaxY(*(CGRect *)&v21);
  }
  long long v25 = +[NCUNUIKitPrototypeDomain rootSettings];
  [v25 interactiveDismissalRubberbandingInset];

  long long v26 = +[NCUNUIKitPrototypeDomain rootSettings];
  [v26 interactiveDismissalRubberbandingRange];

  BSUIConstrainValueToIntervalWithRubberBand();
  if (a3 < 0.0) {
    double v28 = -v27;
  }
  else {
    double v28 = v27;
  }

  return v28;
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (void)setNotificationRequest:(id)a3
{
}

- (NCFullScreenPresentableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCFullScreenPresentableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTMaterialView)_backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (UIView)_backgroundOpaqueView
{
  return self->_backgroundOpaqueView;
}

- (NCFullScreenStagingBannerView)_bannerView
{
  return self->_bannerView;
}

- (BOOL)_isPanning
{
  return self->_panning;
}

- (void)_setPanning:(BOOL)a3
{
  self->_panning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_backgroundOpaqueView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_storeStrong((id *)&self->_reasonsToTransitionBlockingAssertions, 0);
  objc_storeStrong((id *)&self->_dismissalRequestReason, 0);
  objc_storeStrong((id *)&self->_detailStageTransitionTimer, 0);
  objc_storeStrong((id *)&self->_transitioningDelegate, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end