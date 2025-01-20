@interface NCNotificationPresentableViewController
- (BNPanGestureProxy)_panGestureProxy;
- (BOOL)_canPan;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAppearingOrAppeared;
- (BOOL)_isPanPresentation;
- (BOOL)_isReadyForPanGestureProxy;
- (BOOL)becomeFirstResponder;
- (BOOL)bn_shouldAnimateViewTransitionToSize:(CGSize)a3;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)isDragging;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)resignFirstResponder;
- (BOOL)shouldAutorotate;
- (CGRect)_initialBannerFrame;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NCNotificationPresentableViewController)initWithNotificationViewController:(id)a3;
- (NCNotificationPresentableViewControllerDelegate)delegate;
- (NCNotificationViewController)notificationViewController;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (id)customBackgroundContainerViewForExpandedPlatterPresentationController:(id)a3;
- (id)presentableDescription;
- (int)bannerAppearState;
- (int64_t)_presentationState;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setCanPan:(BOOL)a3;
- (void)_setInitialBannerFrame:(CGRect)a3;
- (void)_setPanGestureProxy:(id)a3;
- (void)_setPanPresentation:(BOOL)a3;
- (void)_setPresentationState:(int64_t)a3;
- (void)_setReadyForPanGestureProxy:(BOOL)a3;
- (void)draggingDidBeginWithGestureProxy:(id)a3;
- (void)longLookDidPresentForNotificationViewController:(id)a3;
- (void)longLookWillPresentForNotificationViewController:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)setDelegate:(id)a3;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NCNotificationPresentableViewController

- (NCNotificationPresentableViewController)initWithNotificationViewController:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationPresentableViewController;
  v6 = [(NCNotificationPresentableViewController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_readyForPanGestureProxy = 1;
    p_notificationViewController = (id *)&v6->_notificationViewController;
    objc_storeStrong((id *)&v6->_notificationViewController, a3);
    [*p_notificationViewController addObserver:v7];
    [*p_notificationViewController setDefinesPresentationContext:1];
    [(NCNotificationPresentableViewController *)v7 addChildViewController:*p_notificationViewController];
    v9 = [*p_notificationViewController notificationRequest];
    v10 = [v9 options];
    int v11 = [v10 revealsAdditionalContentOnPresentation];

    id v12 = *p_notificationViewController;
    if (v11)
    {
      v13 = [v12 view];
      [v13 setHidden:1];
    }
    else
    {
      [v12 preferredContentSize];
      -[NCNotificationPresentableViewController setPreferredContentSize:](v7, "setPreferredContentSize:");
    }
  }

  return v7;
}

- (BOOL)isDragging
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_panGestureProxy);
  v3 = WeakRetained;
  if (WeakRetained) {
    BOOL v4 = [WeakRetained state] < 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  if (self->_notificationViewController)
  {
    notificationViewController = self->_notificationViewController;
    return [(NCNotificationViewController *)notificationViewController canBecomeFirstResponder];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NCNotificationPresentableViewController;
    return [(NCNotificationPresentableViewController *)&v4 canBecomeFirstResponder];
  }
}

- (BOOL)becomeFirstResponder
{
  if (self->_notificationViewController)
  {
    notificationViewController = self->_notificationViewController;
    return [(NCNotificationViewController *)notificationViewController becomeFirstResponder];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NCNotificationPresentableViewController;
    return [(NCNotificationPresentableViewController *)&v4 becomeFirstResponder];
  }
}

- (BOOL)canResignFirstResponder
{
  if (self->_notificationViewController)
  {
    notificationViewController = self->_notificationViewController;
    return [(NCNotificationViewController *)notificationViewController canResignFirstResponder];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NCNotificationPresentableViewController;
    return [(NCNotificationPresentableViewController *)&v4 canResignFirstResponder];
  }
}

- (BOOL)resignFirstResponder
{
  if (self->_notificationViewController)
  {
    notificationViewController = self->_notificationViewController;
    return [(NCNotificationViewController *)notificationViewController resignFirstResponder];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NCNotificationPresentableViewController;
    return [(NCNotificationPresentableViewController *)&v4 resignFirstResponder];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationPresentableViewController;
  [(NCNotificationPresentableViewController *)&v5 viewDidLoad];
  v3 = [(NCNotificationPresentableViewController *)self view];
  objc_super v4 = [(NCNotificationViewController *)self->_notificationViewController view];
  [v3 addSubview:v4];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationPresentableViewController;
  [(NCNotificationPresentableViewController *)&v5 viewWillLayoutSubviews];
  if (!self->_presentationState)
  {
    v3 = [(NCNotificationViewController *)self->_notificationViewController view];
    objc_super v4 = [(NCNotificationPresentableViewController *)self view];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");
  }
}

- (BOOL)shouldAutorotate
{
  return [(NCNotificationViewController *)self->_notificationViewController shouldAutorotate];
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(NCNotificationViewController *)self->_notificationViewController supportedInterfaceOrientations];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationPresentableViewController;
  [(NCNotificationPresentableViewController *)&v5 preferredContentSizeDidChangeForChildContentContainer:v4];
  if (!self->_presentationState)
  {
    [v4 preferredContentSize];
    -[NCNotificationPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationPresentableViewController;
  -[NCNotificationPresentableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (self->_presentationState == 1)
  {
    self->_presentationState = 2;
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v10[3] = &unk_1E6A93750;
    objc_copyWeak(&v11, &location);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v8[3] = &unk_1E6A93750;
    objc_copyWeak(&v9, &location);
    [v7 animateAlongsideTransition:v10 completion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v2[3] = &unk_1E6A91BB0;
  v2[4] = WeakRetained;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _initialBannerFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = [*(id *)(a1 + 32) _panGestureProxy];
  id v11 = [*(id *)(a1 + 32) view];
  [v10 visualTranslationInCoordinateSpace:v11];
  double v13 = v5 + v12;

  id v15 = [*(id *)(a1 + 32) notificationViewController];
  v14 = [v15 view];
  objc_msgSend(v14, "setFrame:", v3, v13, v7, v9);
}

void __94__NCNotificationPresentableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _isPanPresentation])
  {
    v1 = [WeakRetained notificationViewController];
    [v1 presentLongLookAnimated:1 trigger:6 completion:0];
  }
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  if (self->_presentationState < 1)
  {
    -[NCNotificationViewController preferredContentSizeWithPresentationSize:containerSize:](self->_notificationViewController, "preferredContentSizeWithPresentationSize:containerSize:", a3.width, a3.height, a4.width, a4.height);
    a4.double width = v4;
    a4.double height = v5;
  }
  double width = a4.width;
  double height = a4.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)bn_shouldAnimateViewTransitionToSize:(CGSize)a3
{
  return 0;
}

- (NSString)requesterIdentifier
{
  return (NSString *)[MEMORY[0x1E4FB37F0] requesterIdentifier];
}

- (NSString)requestIdentifier
{
  double v2 = [(NCNotificationPresentableViewController *)self notificationViewController];
  double v3 = [v2 notificationRequest];
  CGFloat v4 = [v3 notificationIdentifier];

  return (NSString *)v4;
}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (BOOL)isDraggingInteractionEnabled
{
  return 1;
}

- (void)draggingDidBeginWithGestureProxy:(id)a3
{
  id v4 = a3;
  if (self->_readyForPanGestureProxy)
  {
    objc_storeWeak((id *)&self->_panGestureProxy, v4);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __76__NCNotificationPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke;
    v5[3] = &unk_1E6A93778;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    [v4 setActionHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __76__NCNotificationPresentableViewController_draggingDidBeginWithGestureProxy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  switch([v3 state])
  {
    case 1:
      if (![WeakRetained _presentationState]
        || ([WeakRetained _isPanPresentation] & 1) == 0)
      {
        id v6 = [WeakRetained view];
        double v7 = [WeakRetained notificationViewController];
        double v9 = [v7 view];
        [v9 frame];
        objc_msgSend(v6, "convertRect:toView:", 0);
        objc_msgSend(WeakRetained, "_setInitialBannerFrame:");
        uint64_t v11 = 1;
LABEL_24:

        goto LABEL_25;
      }
      if ([WeakRetained _presentationState] == 3)
      {
        id v6 = [WeakRetained view];
        [v3 locationInCoordinateSpace:v6];
        double v7 = objc_msgSend(v6, "hitTest:withEvent:", 0);
        double v8 = [WeakRetained notificationViewController];
        double v9 = [v8 presentedViewController];

        if (v9)
        {
          v10 = [v9 view];
          uint64_t v11 = [v7 isDescendantOfView:v10];
        }
        else
        {
          uint64_t v11 = 0;
        }
        goto LABEL_24;
      }
      uint64_t v11 = 0;
LABEL_25:
      [WeakRetained _setCanPan:v11];
LABEL_37:

      return;
    case 2:
      if ([WeakRetained _canPan]
        && (([v3 didCrossDefaultThreshold] & 1) != 0
         || [WeakRetained _presentationState] >= 1))
      {
        double v12 = [WeakRetained delegate];
        if ([WeakRetained _presentationState] <= 0
          && [*(id *)(a1 + 32) _isAppearingOrAppeared]
          && ((objc_opt_respondsToSelector() & 1) == 0
           || [v12 notificationPresentableViewControllerShouldPresentLongLook:WeakRetained]))
        {
          double v13 = [WeakRetained notificationViewController];
          int v14 = [v13 shouldCommitToExpandedPlatterPresentationWithFeedback];

          if (v14)
          {
            [WeakRetained _setPanPresentation:1];
            [WeakRetained _setPresentationState:1];
            if (objc_opt_respondsToSelector())
            {
              long long v32 = *MEMORY[0x1E4F1DB30];
              [v12 notificationPresentableViewController:WeakRetained presentationSize:0 containerSize:&v32];
              [WeakRetained setPreferredContentSize:v32];
            }
          }
          else
          {
            [WeakRetained _setPresentationState:4];
          }
        }
      }
      goto LABEL_37;
    case 3:
      if (![WeakRetained _canPan]
        || [WeakRetained _isPanPresentation]
        && [WeakRetained _presentationState] != 3)
      {
        goto LABEL_28;
      }
      id v15 = [*(id *)(a1 + 32) view];
      [v3 velocityInCoordinateSpace:v15];
      double v17 = v16;

      v18 = [*(id *)(a1 + 32) view];
      [v18 contentScaleFactor];
      double v20 = NCTranslationWithVelocityAndDefaultScrollViewAcceleration(v17, v19);

      v21 = [*(id *)(a1 + 32) view];
      [v3 visualTranslationInCoordinateSpace:v21];
      double v23 = v20 + v22;

      double v5 = v23 / 60.0;
      if (v23 / 60.0 <= 1.0) {
        goto LABEL_28;
      }
      v24 = objc_msgSend(WeakRetained, "notificationViewController", v5);
      v25 = [v24 presentedViewController];

      v26 = [v25 expandedPlatterPresentationController];
      v27 = [v26 containerView];
      [v27 _removeAllRetargetableAnimations:1];

      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        goto LABEL_28;
      }
      id v28 = v25;
      v29 = [v28 dismisser];
      [v29 expandedPlatterPresentable:v28 requestsDismissalWithTrigger:1];

      goto LABEL_37;
    case 4:
    case 5:
LABEL_28:
      if (objc_msgSend(WeakRetained, "_canPan", v5)
        && [WeakRetained _presentationState] >= 1)
      {
        if ([WeakRetained _presentationState] > 3)
        {
          v30 = WeakRetained;
          uint64_t v31 = 0;
        }
        else
        {
          v30 = WeakRetained;
          uint64_t v31 = 3;
        }
        [v30 _setPresentationState:v31];
      }
      goto LABEL_37;
    default:
      goto LABEL_37;
  }
}

- (id)presentableDescription
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"logDigest";
  id v3 = [(NCNotificationPresentableViewController *)self requestIdentifier];
  id v4 = objc_msgSend(v3, "un_logDigest");
  v9[1] = @"bannerAppearState";
  v10[0] = v4;
  double v5 = NCStringForAppearState(self->_bannerAppearState);
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  double v7 = BNPresentableDescription();

  return v7;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4 = a3;
  self->_bannerAppearState = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presentableWillAppearAsBanner:v4];
  }
  id v6 = [(NCNotificationPresentableViewController *)self notificationViewController];
  double v7 = [v6 notificationRequest];
  double v8 = [v7 options];
  if (![v8 revealsAdditionalContentOnPresentation]
    || ![(NCNotificationPresentableViewController *)self _isAppearingOrAppeared])
  {

    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    char v9 = [WeakRetained notificationPresentableViewControllerShouldPresentLongLook:self];

    if ((v9 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  self->_presentationState = 1;
  if (objc_opt_respondsToSelector())
  {
    long long v10 = *MEMORY[0x1E4F1DB30];
    [WeakRetained notificationPresentableViewController:self presentationSize:0 containerSize:&v10];
    [(NCNotificationPresentableViewController *)self setPreferredContentSize:v10];
  }
LABEL_9:
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v9 = a3;
  self->_bannerAppearState = 2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presentableDidAppearAsBanner:v9];
  }
  double v5 = [(NCNotificationPresentableViewController *)self notificationViewController];
  id v6 = [v5 notificationRequest];
  double v7 = [v6 options];
  int v8 = [v7 revealsAdditionalContentOnPresentation];

  if (v8) {
    [v5 presentLongLookAnimated:1 trigger:7 completion:0];
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  self->_bannerAppearState = 3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presentableWillDisappearAsBanner:v8 withReason:v6];
  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  self->_bannerAppearState = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presentableDidDisappearAsBanner:v8 withReason:v6];
  }
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presentableWillNotAppearAsBanner:v8 withReason:v6];
  }
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained userInteractionWillBeginForBannerForPresentable:v5];
  }
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained userInteractionDidEndForBannerForPresentable:v5];
  }
  if ((unint64_t)(self->_presentationState - 1) <= 2)
  {
    objc_storeWeak((id *)&self->_panGestureProxy, 0);
    self->_readyForPanGestureProxy = 0;
  }
}

- (void)longLookWillPresentForNotificationViewController:(id)a3
{
  id v4 = a3;
  if (!self->_panPresentation && self->_presentationState <= 0)
  {
    self->_presentationState = 1;
    id v5 = [(NCNotificationPresentableViewController *)self view];
    id v6 = [(NCNotificationViewController *)self->_notificationViewController view];
    [v6 frame];
    objc_msgSend(v5, "convertRect:toView:", 0);
    self->_initialBannerFrame.origin.x = v7;
    self->_initialBannerFrame.origin.y = v8;
    self->_initialBannerFrame.size.double width = v9;
    self->_initialBannerFrame.size.double height = v10;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      long long v12 = *MEMORY[0x1E4F1DB30];
      [WeakRetained notificationPresentableViewController:self presentationSize:0 containerSize:&v12];
      [(NCNotificationPresentableViewController *)self setPreferredContentSize:v12];
    }
  }
}

- (void)longLookDidPresentForNotificationViewController:(id)a3
{
  if (!self->_panPresentation) {
    self->_presentationState = 3;
  }
}

- (id)customBackgroundContainerViewForExpandedPlatterPresentationController:(id)a3
{
  id v4 = [a3 presentingViewController];
  if (v4 == self->_notificationViewController)
  {
    id v5 = [(NCNotificationPresentableViewController *)self view];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_isAppearingOrAppeared
{
  int v3 = [(NCNotificationPresentableViewController *)self bs_isAppearingOrAppeared];
  if (v3) {
    LOBYTE(v3) = (self->_bannerAppearState - 1) < 2;
  }
  return v3;
}

- (NCNotificationPresentableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationPresentableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NCNotificationViewController)notificationViewController
{
  return self->_notificationViewController;
}

- (int)bannerAppearState
{
  return self->_bannerAppearState;
}

- (BNPanGestureProxy)_panGestureProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_panGestureProxy);

  return (BNPanGestureProxy *)WeakRetained;
}

- (void)_setPanGestureProxy:(id)a3
{
}

- (BOOL)_isReadyForPanGestureProxy
{
  return self->_readyForPanGestureProxy;
}

- (void)_setReadyForPanGestureProxy:(BOOL)a3
{
  self->_readyForPanGestureProxy = a3;
}

- (CGRect)_initialBannerFrame
{
  double x = self->_initialBannerFrame.origin.x;
  double y = self->_initialBannerFrame.origin.y;
  double width = self->_initialBannerFrame.size.width;
  double height = self->_initialBannerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setInitialBannerFrame:(CGRect)a3
{
  self->_initialBannerFrame = a3;
}

- (BOOL)_canPan
{
  return self->_canPan;
}

- (void)_setCanPan:(BOOL)a3
{
  self->_canPan = a3;
}

- (BOOL)_isPanPresentation
{
  return self->_panPresentation;
}

- (void)_setPanPresentation:(BOOL)a3
{
  self->_panPresentation = a3;
}

- (int64_t)_presentationState
{
  return self->_presentationState;
}

- (void)_setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_panGestureProxy);
  objc_storeStrong((id *)&self->_notificationViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end