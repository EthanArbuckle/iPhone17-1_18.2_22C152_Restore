@interface SBHomeScreenOverlayController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleEvent:(id)a3;
- (BOOL)interceptDismissalGestureForOverlayController:(id)a3;
- (BOOL)isAnimatingPresentationProgress;
- (BOOL)isDismissing;
- (BOOL)isEditingForHomeScreenOverlayViewController:(id)a3;
- (BOOL)isOverlayAppearing;
- (BOOL)isPresented;
- (BOOL)shouldUseReducedMotionAnimation;
- (BOOL)showsAddWidgetButtonWhileEditingForHomeScreenOverlayViewController:(id)a3;
- (BOOL)showsDoneButtonWhileEditingForHomeScreenOverlayViewController:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (BSInvalidatable)displayLayoutAssertion;
- (NSString)coverSheetIdentifier;
- (NSString)description;
- (SBBarSwipeAffordanceViewController)homeAffordanceViewController;
- (SBFOverlayDismissalDelegate)dismissalDelegate;
- (SBFWindow)window;
- (SBHLibraryViewControllerPresenter)viewController;
- (SBHVisibleContentPresenter)leadingSidebarViewController;
- (SBHVisibleContentPresenter)trailingSidebarViewController;
- (SBHomeScreenOverlayController)initWithListLayoutProvider:(id)a3;
- (SBHomeScreenOverlayController)initWithListLayoutProvider:(id)a3 windowLevel:(double)a4 windowScene:(id)a5 traitsRole:(id)a6 zStackParticipantIdentifier:(int64_t)a7 screenEdgeSystemGestureType:(unint64_t)a8 indirectScreenEdgeSystemGestureType:(unint64_t)a9 scrunchSystemGestureType:(unint64_t)a10 secure:(BOOL)a11;
- (SBHomeScreenOverlayControllerDelegate)delegate;
- (SBHomeScreenOverlayViewController)overlayViewController;
- (UIPanGestureRecognizer)dismissPanGestureRecognizer;
- (UITapGestureRecognizer)dismissTapGestureRecognizer;
- (UIViewController)activeSidebarViewController;
- (UIViewController)existingAvocadoVC;
- (double)_directionCoefficient;
- (double)contentWidth;
- (double)finalPresentationProgressForTranslation:(double)a3 velocity:(double)a4 initialPresentationProgress:(double)a5 fromLeading:(BOOL)a6;
- (double)initialPresentationProgress;
- (double)layerPresentationProgress;
- (double)presentationProgress;
- (double)presentationProgressForTranslation:(double)a3 initialPresentationProgress:(double)a4 fromLeading:(BOOL)a5;
- (id)_rootViewController;
- (id)backgroundViewForEditingDoneButtonForHomeScreenOverlayViewController:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)testScrollView;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4;
- (unint64_t)contentVisibility;
- (unint64_t)indirectScreenEdgeSystemGestureType;
- (unint64_t)restrictedCapabilities;
- (unint64_t)screenEdgeSystemGestureType;
- (unint64_t)scrunchSystemGestureType;
- (void)_addSystemGestureRecognizer;
- (void)_configureDismissGestureRecognizer;
- (void)_dismissLevelAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)_dismissScrollGestureBegan:(id)a3;
- (void)_dismissScrollGestureChanged:(id)a3;
- (void)_dismissScrollGestureEndedOrCancelled:(id)a3;
- (void)_enumerateHomeScreenOverlayObserversUsingBlock:(id)a3;
- (void)_removeSystemGestureRecognizer;
- (void)_setDisplayLayoutElementActive:(BOOL)a3;
- (void)_setHidden:(BOOL)a3;
- (void)_setHitTestingDisabled:(BOOL)a3;
- (void)addHomeScreenOverlayObserver:(id)a3;
- (void)addReasonToDisableDismissGestureRecognizer:(id)a3;
- (void)animatePresentationProgress:(double)a3 withGestureLiftOffVelocity:(double)a4 completionHandler:(id)a5;
- (void)cleanUpAfterSettingPresentationProgress:(double)a3;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)dismissScrollGestureUpdated:(id)a3;
- (void)dismissTapGestureUpdated:(id)a3;
- (void)dismissUsingViewControllerTransitionCoordinator:(id)a3;
- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3;
- (void)homeScreenOverlayViewController:(id)a3 setSuppressesEditingStateForListView:(BOOL)a4;
- (void)homeScreenOverlayViewControllerRequestsDismissal:(id)a3;
- (void)homeScreenOverlayViewWantsToEndEditing:(id)a3;
- (void)homeScreenOverlayViewWantsWidgetEditingViewControllerPresented:(id)a3;
- (void)overlayControllerRequestsDismissal:(id)a3;
- (void)prepareToSetPresentationProgress:(double)a3 fromPresentationProgress:(double)a4;
- (void)presentAnimated:(BOOL)a3;
- (void)presentAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)presentAnimated:(BOOL)a3 fromLeading:(BOOL)a4;
- (void)presentAnimated:(BOOL)a3 fromLeading:(BOOL)a4 completionHandler:(id)a5;
- (void)removeHomeScreenOverlayObserver:(id)a3;
- (void)removeReasonToDisableDismissGestureRecognizer:(id)a3;
- (void)setAnimatingPresentationProgress:(BOOL)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissPanGestureRecognizer:(id)a3;
- (void)setDismissalDelegate:(id)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setDisplayLayoutAssertion:(id)a3;
- (void)setExistingAvocadoVC:(id)a3;
- (void)setInitialPresentationProgress:(double)a3;
- (void)setLeadingSidebarViewController:(id)a3;
- (void)setOverlayAppearing:(BOOL)a3;
- (void)setPresentationProgress:(double)a3;
- (void)setPresentationProgress:(double)a3 fromLeading:(BOOL)a4;
- (void)setPresentationProgress:(double)a3 fromLeading:(BOOL)a4 interactive:(BOOL)a5 animated:(BOOL)a6 completionHandler:(id)a7;
- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)setShouldUseReducedMotionAnimation:(BOOL)a3;
- (void)setTrailingSidebarViewController:(id)a3;
- (void)updateExtraButtonVisibilityAnimated:(BOOL)a3;
@end

@implementation SBHomeScreenOverlayController

- (SBHomeScreenOverlayController)initWithListLayoutProvider:(id)a3 windowLevel:(double)a4 windowScene:(id)a5 traitsRole:(id)a6 zStackParticipantIdentifier:(int64_t)a7 screenEdgeSystemGestureType:(unint64_t)a8 indirectScreenEdgeSystemGestureType:(unint64_t)a9 scrunchSystemGestureType:(unint64_t)a10 secure:(BOOL)a11
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  v50.receiver = self;
  v50.super_class = (Class)SBHomeScreenOverlayController;
  v21 = [(SBHomeScreenOverlayController *)&v50 init];
  if (v21)
  {
    v22 = [[SBHomeScreenOverlayViewController alloc] initWithListLayoutProvider:v18];
    overlayViewController = v21->_overlayViewController;
    v21->_overlayViewController = v22;

    [(SBHomeScreenOverlayViewController *)v21->_overlayViewController setDelegate:v21];
    v21->_screenEdgeSystemGestureType = a8;
    v21->_indirectScreenEdgeSystemGestureType = a9;
    v21->_scrunchSystemGestureType = a10;
    if (SBHomeGestureEnabled())
    {
      uint64_t v24 = objc_opt_class();
      id v25 = v19;
      if (v24)
      {
        if (objc_opt_isKindOfClass()) {
          v26 = v25;
        }
        else {
          v26 = 0;
        }
      }
      else
      {
        v26 = 0;
      }
      id v49 = v26;

      v28 = [[SBBarSwipeAffordanceViewController alloc] initWithZStackParticipantIdentifier:a7 windowScene:v49];
      homeAffordanceViewController = v21->_homeAffordanceViewController;
      v21->_homeAffordanceViewController = v28;

      [(SBBarSwipeAffordanceViewController *)v21->_homeAffordanceViewController setSuppressAffordance:1];
      [(SBBarSwipeAffordanceViewController *)v21->_homeAffordanceViewController addChildViewController:v21->_overlayViewController];
      v30 = [(SBHomeScreenOverlayViewController *)v21->_overlayViewController view];
      v31 = [(SBBarSwipeAffordanceViewController *)v21->_homeAffordanceViewController view];
      [v31 addSubview:v30];
      [(SBHomeScreenOverlayViewController *)v21->_overlayViewController didMoveToParentViewController:v21->_homeAffordanceViewController];
      [v31 setDelegate:v21];
      [v31 addObserver:v21];
      [v31 setColorBias:2];
      [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v33 = [v31 leadingAnchor];
      v34 = [v30 leadingAnchor];
      v35 = [v33 constraintEqualToAnchor:v34];
      [v32 addObject:v35];

      v36 = [v31 trailingAnchor];
      v37 = [v30 trailingAnchor];
      v38 = [v36 constraintEqualToAnchor:v37];
      [v32 addObject:v38];

      v39 = [v31 topAnchor];
      v40 = [v30 topAnchor];
      v41 = [v39 constraintEqualToAnchor:v40];
      [v32 addObject:v41];

      v42 = [v31 bottomAnchor];
      v43 = [v30 bottomAnchor];
      v44 = [v42 constraintEqualToAnchor:v43];
      [v32 addObject:v44];

      [MEMORY[0x1E4F28DC8] activateConstraints:v32];
      v27 = v21->_homeAffordanceViewController;
    }
    else
    {
      v27 = v21->_overlayViewController;
    }
    v45 = self;

    uint64_t v46 = [objc_alloc((Class)v45) initWithWindowScene:v19];
    window = v21->_window;
    v21->_window = (SBFWindow *)v46;

    [(SBFWindow *)v21->_window _setRoleHint:v20];
    [(SBFWindow *)v21->_window setWindowLevel:a4];
    [(SBFWindow *)v21->_window setRootViewController:v27];
    [(SBHomeScreenOverlayController *)v21 _configureDismissGestureRecognizer];
    [(SBHomeScreenOverlayController *)v21 _setHidden:0];
  }
  return v21;
}

- (SBHomeScreenOverlayController)initWithListLayoutProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHomeScreenOverlayController;
  v5 = [(SBHomeScreenOverlayController *)&v9 init];
  if (v5)
  {
    v6 = [[SBHomeScreenOverlayViewController alloc] initWithListLayoutProvider:v4];
    overlayViewController = v5->_overlayViewController;
    v5->_overlayViewController = v6;

    [(SBHomeScreenOverlayViewController *)v5->_overlayViewController setDelegate:v5];
    [(SBHomeScreenOverlayController *)v5 _configureDismissGestureRecognizer];
    [(SBHomeScreenOverlayController *)v5 _setHidden:1];
  }

  return v5;
}

- (void)dealloc
{
  [(SBFFrameRateAssertion *)self->_frameRateAssertion invalidate];
  [(BSInvalidatable *)self->_displayLayoutAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBHomeScreenOverlayController;
  [(SBHomeScreenOverlayController *)&v3 dealloc];
}

- (void)_configureDismissGestureRecognizer
{
  id v9 = [(SBHomeScreenOverlayController *)self _rootViewController];
  objc_super v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_dismissTapGestureUpdated_];
  dismissTapGestureRecognizer = self->_dismissTapGestureRecognizer;
  self->_dismissTapGestureRecognizer = v3;

  [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer setDelegate:self];
  v5 = [v9 view];
  [v5 addGestureRecognizer:self->_dismissTapGestureRecognizer];

  v6 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel_dismissScrollGestureUpdated_];
  dismissPanGestureRecognizer = self->_dismissPanGestureRecognizer;
  self->_dismissPanGestureRecognizer = v6;

  [(UIPanGestureRecognizer *)self->_dismissPanGestureRecognizer setAllowedScrollTypesMask:2];
  [(UIPanGestureRecognizer *)self->_dismissPanGestureRecognizer _setCanPanVertically:0];
  [(UIPanGestureRecognizer *)self->_dismissPanGestureRecognizer setDelegate:self];
  v8 = [v9 view];
  [v8 addGestureRecognizer:self->_dismissPanGestureRecognizer];
}

- (SBHLibraryViewControllerPresenter)viewController
{
  return (SBHLibraryViewControllerPresenter *)self->_overlayViewController;
}

- (SBHVisibleContentPresenter)leadingSidebarViewController
{
  return [(SBHomeScreenOverlayViewController *)self->_overlayViewController leadingSidebarViewController];
}

- (void)setLeadingSidebarViewController:(id)a3
{
}

- (SBHVisibleContentPresenter)trailingSidebarViewController
{
  return [(SBHomeScreenOverlayViewController *)self->_overlayViewController trailingSidebarViewController];
}

- (void)setTrailingSidebarViewController:(id)a3
{
}

- (UIViewController)activeSidebarViewController
{
  v2 = [(SBHomeScreenOverlayViewController *)self->_overlayViewController contentViewController];
  objc_super v3 = [v2 avocadoViewController];

  return (UIViewController *)v3;
}

- (void)animatePresentationProgress:(double)a3 withGestureLiftOffVelocity:(double)a4 completionHandler:(id)a5
{
  v8 = (void (**)(id, uint64_t))a5;
  [(SBHomeScreenOverlayController *)self presentationProgress];
  double v10 = v9;
  if (BSFloatEqualToFloat())
  {
    if (v8) {
      v8[2](v8, 1);
    }
  }
  else
  {
    [(SBHomeScreenOverlayController *)self setAnimatingPresentationProgress:1];
    [(SBFFrameRateAssertion *)self->_frameRateAssertion invalidate];
    frameRateAssertion = self->_frameRateAssertion;
    self->_frameRateAssertion = 0;

    [(SBHomeScreenOverlayController *)self prepareToSetPresentationProgress:a3 fromPresentationProgress:v10];
    v12 = [(SBHomeScreenOverlayController *)self overlayViewController];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __106__SBHomeScreenOverlayController_animatePresentationProgress_withGestureLiftOffVelocity_completionHandler___block_invoke;
    v18[3] = &unk_1E6AFF2D8;
    v18[4] = self;
    double v20 = a3;
    id v19 = v8;
    [v12 animatePresentationProgress:v18 withGestureLiftOffVelocity:a3 completionHandler:a4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __106__SBHomeScreenOverlayController_animatePresentationProgress_withGestureLiftOffVelocity_completionHandler___block_invoke_2;
    v14[3] = &unk_1E6B0DF48;
    double v16 = v10;
    double v17 = a3;
    v14[4] = self;
    id v15 = v12;
    id v13 = v12;
    [(SBHomeScreenOverlayController *)self _enumerateHomeScreenOverlayObserversUsingBlock:v14];
  }
}

uint64_t __106__SBHomeScreenOverlayController_animatePresentationProgress_withGestureLiftOffVelocity_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setAnimatingPresentationProgress:0];
    [*(id *)(a1 + 32) cleanUpAfterSettingPresentationProgress:*(double *)(a1 + 48)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __106__SBHomeScreenOverlayController_animatePresentationProgress_withGestureLiftOffVelocity_completionHandler___block_invoke_2(double *a1, void *a2)
{
  double v2 = a1[6];
  double v3 = a1[7];
  uint64_t v4 = *((void *)a1 + 4);
  v5 = (void *)*((void *)a1 + 5);
  id v6 = a2;
  objc_msgSend(v6, "overlayController:didChangePresentationProgress:newPresentationProgress:fromLeading:", v4, objc_msgSend(v5, "isFromLeading"), v2, v3);
}

- (void)setShouldUseReducedMotionAnimation:(BOOL)a3
{
}

- (BOOL)shouldUseReducedMotionAnimation
{
  return [(SBHomeScreenOverlayViewController *)self->_overlayViewController shouldUseReducedMotionAnimation];
}

- (double)contentWidth
{
  double v2 = [(SBHomeScreenOverlayController *)self overlayViewController];
  [v2 contentWidth];
  double v4 = v3;

  return v4;
}

- (BOOL)isPresented
{
  [(SBHomeScreenOverlayController *)self presentationProgress];
  return BSFloatGreaterThanFloat();
}

- (double)presentationProgress
{
  double v2 = [(SBHomeScreenOverlayController *)self overlayViewController];
  [v2 presentationProgress];
  double v4 = v3;

  return v4;
}

- (void)setPresentationProgress:(double)a3
{
}

- (void)setPresentationProgress:(double)a3 fromLeading:(BOOL)a4
{
}

- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)setPresentationProgress:(double)a3 fromLeading:(BOOL)a4 interactive:(BOOL)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  int v9 = a4;
  v12 = (void (**)(id, void))a7;
  id v13 = [(SBHomeScreenOverlayController *)self overlayViewController];
  [v13 presentationProgress];
  if ((BSFloatIsZero() & 1) == 0)
  {
    v14 = [v13 contentViewController];
    uint64_t v15 = [v14 avocadoViewController];
    if (v15)
    {
      double v16 = (void *)v15;
      int v17 = [v13 isFromLeading];

      if (v17 != v9)
      {
        if (v12) {
          v12[2](v12, 0);
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
  }
  id v18 = (void *)MEMORY[0x1E4F42FF0];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke;
  v30[3] = &unk_1E6AF5D38;
  id v19 = v13;
  id v31 = v19;
  char v32 = v9;
  [v18 _performWithoutRetargetingAnimations:v30];
  [(SBHomeScreenOverlayController *)self presentationProgress];
  double v21 = v20;
  if (BSFloatEqualToFloat())
  {
    if (v12) {
      v12[2](v12, 1);
    }
  }
  else
  {
    if (!self->_frameRateAssertion && v8)
    {
      id v22 = objc_alloc(MEMORY[0x1E4FA5F18]);
      CAFrameRateRange v33 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      v23 = (SBFFrameRateAssertion *)objc_msgSend(v22, "initWithFrameRateRange:highFrameRateReason:", 1114122, *(double *)&v33.minimum, *(double *)&v33.maximum, *(double *)&v33.preferred);
      frameRateAssertion = self->_frameRateAssertion;
      self->_frameRateAssertion = v23;
    }
    [(SBHomeScreenOverlayController *)self prepareToSetPresentationProgress:a3 fromPresentationProgress:v21];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke_2;
    v27[3] = &unk_1E6AFF2D8;
    v27[4] = self;
    double v29 = a3;
    v28 = v12;
    [v19 setPresentationProgress:v8 interactive:v7 animated:v27 completionHandler:a3];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke_3;
    v25[3] = &unk_1E6B0DF70;
    v25[4] = self;
    *(double *)&v25[5] = v21;
    *(double *)&v25[6] = a3;
    char v26 = v9;
    [(SBHomeScreenOverlayController *)self _enumerateHomeScreenOverlayObserversUsingBlock:v25];
  }
LABEL_15:
}

uint64_t __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFromLeading:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) cleanUpAfterSettingPresentationProgress:*(double *)(a1 + 48)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 overlayController:*(void *)(a1 + 32) didChangePresentationProgress:*(unsigned __int8 *)(a1 + 56) newPresentationProgress:*(double *)(a1 + 40) fromLeading:*(double *)(a1 + 48)];
}

- (void)prepareToSetPresentationProgress:(double)a3 fromPresentationProgress:(double)a4
{
  [(SBHomeScreenOverlayController *)self _setDisplayLayoutElementActive:a3 >= 0.5];
  if (a3 > 0.0)
  {
    [(SBHomeScreenOverlayController *)self _setHidden:0];
    [(SBHomeScreenOverlayController *)self _addSystemGestureRecognizer];
  }
  else
  {
    [(SBHomeScreenOverlayController *)self _removeSystemGestureRecognizer];
  }
  [(SBHomeScreenOverlayController *)self setDismissing:a3 <= 0.0];
  id v18 = [(SBHomeScreenOverlayController *)self overlayViewController];
  id v6 = [(SBHomeScreenOverlayController *)self existingAvocadoVC];
  BOOL v7 = [v18 contentViewController];
  BOOL v8 = [v7 avocadoViewController];

  BOOL v11 = [v18 _appearState] == 2 && v6 != 0 && v6 != v8;
  [(SBHomeScreenOverlayController *)self setExistingAvocadoVC:v8];
  if (![v18 _appearState] || objc_msgSend(v18, "_appearState") == 1)
  {
    if (BSFloatIsZero())
    {
      if (![(SBHomeScreenOverlayController *)self isOverlayAppearing])
      {
        v12 = [(SBHomeScreenOverlayController *)self overlayViewController];
        int v13 = [v12 _appearState];

        if (!v13)
        {
          objc_msgSend(v18, "bs_beginAppearanceTransition:animated:", 1, 1);
          [(SBHomeScreenOverlayController *)self setOverlayAppearing:1];
        }
      }
    }
    if (BSFloatGreaterThanFloat()
      && [(SBHomeScreenOverlayController *)self isOverlayAppearing])
    {
      v14 = [(SBHomeScreenOverlayController *)self overlayViewController];
      objc_msgSend(v14, "bs_endAppearanceTransition:", 1);

      [(SBHomeScreenOverlayController *)self setOverlayAppearing:0];
    }
  }
  if (v11)
  {
    uint64_t v15 = [v8 view];
    [v15 setNeedsLayout];

    double v16 = [v8 view];
    [v16 layoutIfNeeded];
  }
  int v17 = [(SBHomeScreenOverlayController *)self homeAffordanceViewController];
  [v17 setWantsToBeActiveAffordance:a3 >= 1.0];

  [(SBHomeScreenOverlayController *)self _setHitTestingDisabled:[(SBHomeScreenOverlayController *)self isDismissing]];
}

- (void)cleanUpAfterSettingPresentationProgress:(double)a3
{
  if (BSFloatIsZero() && ![(SBHomeScreenOverlayController *)self isOverlayAppearing])
  {
    double v4 = [(SBHomeScreenOverlayController *)self overlayViewController];
    objc_msgSend(v4, "bs_beginAppearanceTransition:animated:", 0, 1);

    [(SBHomeScreenOverlayController *)self _setHidden:1];
    v5 = [(SBHomeScreenOverlayController *)self overlayViewController];
    objc_msgSend(v5, "bs_endAppearanceTransition:", 0);
  }
  [(SBHomeScreenOverlayController *)self setExistingAvocadoVC:0];
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    [(SBFFrameRateAssertion *)self->_frameRateAssertion invalidate];
    frameRateAssertion = self->_frameRateAssertion;
    self->_frameRateAssertion = 0;
  }
}

- (double)presentationProgressForTranslation:(double)a3 initialPresentationProgress:(double)a4 fromLeading:(BOOL)a5
{
  [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  [(SBHomeScreenOverlayController *)self contentWidth];
  BSUIConstrainValueToIntervalWithRubberBand();
  return result;
}

- (double)finalPresentationProgressForTranslation:(double)a3 velocity:(double)a4 initialPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  int v6 = a6;
  int v11 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
  double v12 = a4 / 1000.0 * *MEMORY[0x1E4F43CE0] / (1.0 - *MEMORY[0x1E4F43CE0]) + a3;
  [(SBHomeScreenOverlayController *)self contentWidth];
  double v14 = v12 / v13;
  if (v11 == v6) {
    double v14 = -v14;
  }
  BOOL v15 = v14 + a5 <= 0.5;
  double result = 0.0;
  if (!v15) {
    return 1.0;
  }
  return result;
}

- (void)addHomeScreenOverlayObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    int v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    BOOL v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeHomeScreenOverlayObserver:(id)a3
{
}

- (void)presentAnimated:(BOOL)a3
{
}

- (void)presentAnimated:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)presentAnimated:(BOOL)a3 fromLeading:(BOOL)a4
{
}

- (void)presentAnimated:(BOOL)a3 fromLeading:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)_dismissLevelAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  int v6 = [(SBHomeScreenOverlayController *)self dismissalDelegate];
  BOOL v7 = v6;
  if (!v6 || ([v6 interceptDismissalGestureForOverlayController:self] & 1) == 0) {
    [(SBHomeScreenOverlayController *)self dismissAnimated:v4 completionHandler:v8];
  }
}

- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(SBHomeScreenOverlayController *)self overlayViewController];
  uint64_t v8 = [v7 isFromLeading];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SBHomeScreenOverlayController_dismissAnimated_completionHandler___block_invoke;
  v9[3] = &unk_1E6B0DF98;
  v9[4] = self;
  [(SBHomeScreenOverlayController *)self _enumerateHomeScreenOverlayObserversUsingBlock:v9];
  [(SBHomeScreenOverlayController *)self setPresentationProgress:v8 fromLeading:0 interactive:v4 animated:v6 completionHandler:0.0];
}

uint64_t __67__SBHomeScreenOverlayController_dismissAnimated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 overlayControllerDidBeginChangingPresentationProgress:*(void *)(a1 + 32)];
}

- (void)dismissUsingViewControllerTransitionCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(SBHomeScreenOverlayController *)self overlayViewController];
  id v6 = [(SBHomeScreenOverlayController *)self overlayViewController];
  uint64_t v7 = [v6 isFromLeading];

  [v5 setFromLeading:v7];
  [(SBHomeScreenOverlayController *)self presentationProgress];
  double v9 = v8;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    [(SBHomeScreenOverlayController *)self prepareToSetPresentationProgress:0.0 fromPresentationProgress:v9];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke;
    v14[3] = &unk_1E6AF53F8;
    id v15 = v5;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke_2;
    v10[3] = &unk_1E6B0DFE8;
    v10[4] = self;
    id v11 = v15;
    double v12 = v9;
    char v13 = v7;
    [v4 animateAlongsideTransition:v14 completion:v10];
  }
}

uint64_t __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentationProgress:0.0];
  double v2 = *(void **)(a1 + 32);
  return [v2 setSuppressesExtraEditingButtons:1];
}

uint64_t __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanUpAfterSettingPresentationProgress:0.0];
  [*(id *)(a1 + 40) setSuppressesExtraEditingButtons:0];
  double v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke_3;
  v4[3] = &unk_1E6B0DFC0;
  v4[4] = v2;
  v4[5] = *(void *)(a1 + 48);
  char v5 = *(unsigned char *)(a1 + 56);
  return [v2 _enumerateHomeScreenOverlayObserversUsingBlock:v4];
}

uint64_t __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 overlayController:*(void *)(a1 + 32) didChangePresentationProgress:*(unsigned __int8 *)(a1 + 48) newPresentationProgress:*(double *)(a1 + 40) fromLeading:0.0];
}

- (void)addReasonToDisableDismissGestureRecognizer:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBHomeScreenOverlayController.m", 480, @"Invalid parameter not satisfying: %@", @"reasonToDisablePanGestureRecognizer" object file lineNumber description];

    id v5 = 0;
  }
  reasonsToDisablePanGestureRecognizer = self->_reasonsToDisablePanGestureRecognizer;
  if (!reasonsToDisablePanGestureRecognizer)
  {
    uint64_t v7 = (NSCountedSet *)objc_opt_new();
    double v8 = self->_reasonsToDisablePanGestureRecognizer;
    self->_reasonsToDisablePanGestureRecognizer = v7;

    id v5 = v11;
    reasonsToDisablePanGestureRecognizer = self->_reasonsToDisablePanGestureRecognizer;
  }
  double v9 = (void *)[v5 copy];
  [(NSCountedSet *)reasonsToDisablePanGestureRecognizer addObject:v9];

  if ([(NSCountedSet *)self->_reasonsToDisablePanGestureRecognizer count]) {
    [(UIPanGestureRecognizer *)self->_dismissPanGestureRecognizer setEnabled:0];
  }
}

- (void)removeReasonToDisableDismissGestureRecognizer:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBHomeScreenOverlayController.m", 493, @"Invalid parameter not satisfying: %@", @"reasonToDisablePanGestureRecognizer" object file lineNumber description];

    id v5 = 0;
  }
  [(NSCountedSet *)self->_reasonsToDisablePanGestureRecognizer removeObject:v5];
  if (![(NSCountedSet *)self->_reasonsToDisablePanGestureRecognizer count])
  {
    reasonsToDisablePanGestureRecognizer = self->_reasonsToDisablePanGestureRecognizer;
    self->_reasonsToDisablePanGestureRecognizer = 0;

    [(UIPanGestureRecognizer *)self->_dismissPanGestureRecognizer setEnabled:1];
  }
}

- (void)updateExtraButtonVisibilityAnimated:(BOOL)a3
{
}

- (unint64_t)contentVisibility
{
  return [(SBHomeScreenOverlayViewController *)self->_overlayViewController contentVisibility];
}

- (void)setContentVisibility:(unint64_t)a3
{
}

- (void)_enumerateHomeScreenOverlayObserversUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (!displayLayoutAssertion)
    {
      id v5 = [(SBHomeScreenOverlayController *)self delegate];
      if (v5)
      {
        uint64_t v6 = [(SBHomeScreenOverlayController *)self activeSidebarViewController];
        if (v6)
        {
          id v7 = [v5 homeScreenOverlayController:self displayLayoutIdentifierForSidebarViewController:v6];
        }
        else
        {
          long long v10 = SBLogCommon();
          BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

          if (v11) {
            NSLog(&cfstr_ThereReallySho.isa);
          }
          long long v12 = SBLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            -[SBHomeScreenOverlayController _setDisplayLayoutElementActive:](v12);
          }

          id v7 = (id)*MEMORY[0x1E4FA6F88];
        }
        id v9 = v7;
      }
      else
      {
        id v9 = (id)*MEMORY[0x1E4FA6F88];
      }
      long long v13 = (void *)[objc_alloc(MEMORY[0x1E4FA6A68]) initWithIdentifier:v9];
      double v14 = [(SBHomeScreenOverlayController *)self window];
      [v14 level];
      [v13 setLevel:(uint64_t)v15];

      [v13 setFillsDisplayBounds:1];
      [v13 setLayoutRole:3];
      double v16 = [MEMORY[0x1E4F62438] sharedInstance];
      int v17 = [v16 addElement:v13];
      id v18 = self->_displayLayoutAssertion;
      self->_displayLayoutAssertion = v17;
    }
  }
  else if (displayLayoutAssertion)
  {
    [(BSInvalidatable *)displayLayoutAssertion invalidate];
    uint64_t v8 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;
  }
}

- (id)_rootViewController
{
  window = self->_window;
  if (window)
  {
    id v4 = [(SBFWindow *)window rootViewController];
  }
  else
  {
    id v4 = self->_overlayViewController;
  }
  return v4;
}

- (void)_setHitTestingDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  window = self->_window;
  if (window)
  {
    id v5 = window;
  }
  else
  {
    id v5 = [(SBHomeScreenOverlayViewController *)self->_overlayViewController view];
  }
  uint64_t v6 = v5;
  if (v3)
  {
    [(SBFWindow *)v5 endEditing:0];
    id v5 = v6;
  }
  [(SBFWindow *)v5 bs_setHitTestingDisabled:v3];
}

- (void)_setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  window = self->_window;
  if (window)
  {
    uint64_t v6 = window;
  }
  else
  {
    uint64_t v6 = [(SBHomeScreenOverlayViewController *)self->_overlayViewController view];
  }
  id v7 = v6;
  if ([(SBFWindow *)v6 isHidden] != v3)
  {
    [(SBFWindow *)v7 setHidden:v3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__SBHomeScreenOverlayController__setHidden___block_invoke;
    v8[3] = &unk_1E6B0E010;
    v8[4] = self;
    BOOL v9 = v3;
    [(SBHomeScreenOverlayController *)self _enumerateHomeScreenOverlayObserversUsingBlock:v8];
  }
}

uint64_t __44__SBHomeScreenOverlayController__setHidden___block_invoke(uint64_t a1, void *a2)
{
  return [a2 overlayController:*(void *)(a1 + 32) visibilityDidChange:*(unsigned char *)(a1 + 40) == 0];
}

- (void)dismissTapGestureUpdated:(id)a3
{
  id v10 = a3;
  if ([v10 state] == 3)
  {
    id v4 = [(SBHomeScreenOverlayController *)self overlayViewController];
    id v5 = [v4 view];
    [v10 locationInView:v5];
    CGFloat v7 = v6;
    CGFloat v9 = v8;

    [v4 contentRect];
    v12.x = v7;
    v12.y = v9;
    if (!CGRectContainsPoint(v13, v12)) {
      [(SBHomeScreenOverlayController *)self dismissAnimated:1 completionHandler:0];
    }
  }
}

- (double)layerPresentationProgress
{
  [(SBHomeScreenOverlayViewController *)self->_overlayViewController layerPresentationProgress];
  return result;
}

- (double)_directionCoefficient
{
  double v2 = [(SBHomeScreenOverlayController *)self overlayViewController];
  if ([v2 isFromLeading]) {
    double v3 = 1.0;
  }
  else {
    double v3 = -1.0;
  }

  return v3;
}

- (void)dismissScrollGestureUpdated:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    [(SBHomeScreenOverlayController *)self _dismissScrollGestureEndedOrCancelled:v7];
LABEL_8:
    double v6 = v7;
    goto LABEL_9;
  }
  if (v4 == 2)
  {
LABEL_7:
    [(SBHomeScreenOverlayController *)self _dismissScrollGestureChanged:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == 1;
  double v6 = v7;
  if (v5)
  {
    [(SBHomeScreenOverlayController *)self _dismissScrollGestureBegan:v7];
    goto LABEL_7;
  }
LABEL_9:
}

- (void)_dismissScrollGestureBegan:(id)a3
{
  [(SBHomeScreenOverlayController *)self setDismissing:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SBHomeScreenOverlayController__dismissScrollGestureBegan___block_invoke;
  v5[3] = &unk_1E6B0DF98;
  v5[4] = self;
  [(SBHomeScreenOverlayController *)self _enumerateHomeScreenOverlayObserversUsingBlock:v5];
  [(SBHomeScreenOverlayController *)self layerPresentationProgress];
  self->_initialPresentationProgress = v4;
}

uint64_t __60__SBHomeScreenOverlayController__dismissScrollGestureBegan___block_invoke(uint64_t a1, void *a2)
{
  return [a2 overlayControllerDidBeginChangingPresentationProgress:*(void *)(a1 + 32)];
}

- (void)_dismissScrollGestureChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHomeScreenOverlayController *)self overlayViewController];
  uint64_t v6 = [v5 isFromLeading];

  id v7 = [(SBHomeScreenOverlayController *)self overlayViewController];
  double v8 = [v7 view];
  [v4 translationInView:v8];
  double v10 = v9;

  [(SBHomeScreenOverlayController *)self presentationProgressForTranslation:v6 initialPresentationProgress:v10 fromLeading:self->_initialPresentationProgress];
  -[SBHomeScreenOverlayController setPresentationProgress:fromLeading:interactive:animated:completionHandler:](self, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", v6, 1, 1, 0);
}

- (void)_dismissScrollGestureEndedOrCancelled:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHomeScreenOverlayController *)self overlayViewController];
  uint64_t v6 = [v5 isFromLeading];

  id v7 = [(SBHomeScreenOverlayController *)self overlayViewController];
  double v8 = [v7 view];
  [v4 velocityInView:v8];
  double v10 = v9;

  BOOL v11 = [(SBHomeScreenOverlayController *)self overlayViewController];
  CGPoint v12 = [v11 view];
  [v4 translationInView:v12];
  double v14 = v13;

  [(SBHomeScreenOverlayController *)self finalPresentationProgressForTranslation:v6 velocity:v14 initialPresentationProgress:v10 fromLeading:self->_initialPresentationProgress];
  -[SBHomeScreenOverlayController animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:](self, "animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:", 0);
}

- (void)_addSystemGestureRecognizer
{
}

- (void)_removeSystemGestureRecognizer
{
}

- (id)testScrollView
{
  double v2 = [(SBHomeScreenOverlayViewController *)self->_overlayViewController contentViewController];
  double v3 = [v2 avocadoViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 _majorScrollView];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)interceptDismissalGestureForOverlayController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissalDelegate);
  uint64_t v6 = WeakRetained;
  if (WeakRetained) {
    char v7 = [WeakRetained interceptDismissalGestureForOverlayController:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)overlayControllerRequestsDismissal:(id)a3
{
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2) {
    return 0;
  }
  else {
    return *(unint64_t *)((char *)&self->super.isa + qword_1D8FD3558[a4 - 1]);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBHomeScreenOverlayController *)self dismissTapGestureRecognizer];

  if (v8 == v7)
  {
    double v10 = [(SBHomeScreenOverlayViewController *)self->_overlayViewController leadingSidebarViewController];
    BOOL v11 = [v10 viewIfLoaded];

    CGPoint v12 = [(SBHomeScreenOverlayViewController *)self->_overlayViewController trailingSidebarViewController];
    double v13 = [v12 viewIfLoaded];

    [v6 locationInView:v11];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v6 locationInView:v13];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    BOOL v9 = 0;
    if (!v11 || ([v11 frame], v23.x = v15, v23.y = v17, !CGRectContainsPoint(v25, v23)))
    {
      if (!v13 || ([v13 frame], v24.x = v19, v24.y = v21, !CGRectContainsPoint(v26, v24))) {
        BOOL v9 = 1;
      }
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return ![(SBHomeScreenOverlayController *)self isDismissing];
}

- (int64_t)idleTimerDuration
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    double v3 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 1;
  }
  if (v2) {
    return 9;
  }
  else {
    return 0;
  }
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 2;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 4096;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (NSString)coverSheetIdentifier
{
  BOOL v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (BSFloatGreaterThanFloat()) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v4 = [a3 type];
  if (v4 == 27)
  {
    BOOL v5 = 1;
    [(SBHomeScreenOverlayController *)self _dismissLevelAnimated:1 completionHandler:0];
    return v5;
  }
  if (v4 == 25)
  {
    [(SBHomeScreenOverlayController *)self dismissAnimated:0 completionHandler:0];
    return 0;
  }
  if (v4 != 12) {
    return 0;
  }
  BOOL v5 = 1;
  [(SBHomeScreenOverlayController *)self dismissAnimated:1 completionHandler:0];
  return v5;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  uint64_t v3 = [a3 type];
  return v3 == 12 || v3 == 27;
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
}

- (void)homeScreenOverlayViewControllerRequestsDismissal:(id)a3
{
}

- (id)backgroundViewForEditingDoneButtonForHomeScreenOverlayViewController:(id)a3
{
  uint64_t v4 = [(SBHomeScreenOverlayController *)self delegate];
  BOOL v5 = [v4 backgroundViewForEditingDoneButtonForHomeScreenOverlayController:self];

  return v5;
}

- (void)homeScreenOverlayViewWantsToEndEditing:(id)a3
{
  id v4 = [(SBHomeScreenOverlayController *)self delegate];
  [v4 homeScreenOverlayWantsToEndEditing:self];
}

- (void)homeScreenOverlayViewWantsWidgetEditingViewControllerPresented:(id)a3
{
  id v4 = [(SBHomeScreenOverlayController *)self delegate];
  [v4 homeScreenOverlayWantsWidgetEditingViewControllerPresented:self];
}

- (BOOL)showsAddWidgetButtonWhileEditingForHomeScreenOverlayViewController:(id)a3
{
  uint64_t v3 = self;
  id v4 = [(SBHomeScreenOverlayController *)self delegate];
  LOBYTE(v3) = [v4 showsAddWidgetButtonWhileEditingForHomeScreenOverlayController:v3];

  return (char)v3;
}

- (BOOL)showsDoneButtonWhileEditingForHomeScreenOverlayViewController:(id)a3
{
  uint64_t v3 = self;
  id v4 = [(SBHomeScreenOverlayController *)self delegate];
  LOBYTE(v3) = [v4 showsDoneButtonWhileEditingForHomeScreenOverlayController:v3];

  return (char)v3;
}

- (BOOL)isEditingForHomeScreenOverlayViewController:(id)a3
{
  uint64_t v3 = self;
  id v4 = [(SBHomeScreenOverlayController *)self delegate];
  LOBYTE(v3) = [v4 isEditingForHomeScreenOverlayController:v3];

  return (char)v3;
}

- (void)homeScreenOverlayViewController:(id)a3 setSuppressesEditingStateForListView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBHomeScreenOverlayController *)self delegate];
  [v6 homeScreenOverlayController:self setSuppressesEditingStateForListView:v4];
}

- (NSString)description
{
  return (NSString *)[(SBHomeScreenOverlayController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  BOOL v2 = [(SBHomeScreenOverlayController *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBHomeScreenOverlayController *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(SBHomeScreenOverlayController *)self succinctDescriptionBuilder];
  [(SBHomeScreenOverlayController *)self presentationProgress];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:", @"presentationProgress");
  id v6 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBHomeScreenOverlayController isDismissing](self, "isDismissing"), @"isDismissing");
  [(SBFWindow *)self->_window level];
  id v7 = (id)objc_msgSend(v4, "appendFloat:withName:", @"windowLevel");
  return v4;
}

- (SBFOverlayDismissalDelegate)dismissalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissalDelegate);
  return (SBFOverlayDismissalDelegate *)WeakRetained;
}

- (void)setDismissalDelegate:(id)a3
{
}

- (SBHomeScreenOverlayControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHomeScreenOverlayControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITapGestureRecognizer)dismissTapGestureRecognizer
{
  return self->_dismissTapGestureRecognizer;
}

- (SBFWindow)window
{
  return self->_window;
}

- (SBBarSwipeAffordanceViewController)homeAffordanceViewController
{
  return self->_homeAffordanceViewController;
}

- (SBHomeScreenOverlayViewController)overlayViewController
{
  return self->_overlayViewController;
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void)setDisplayLayoutAssertion:(id)a3
{
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (unint64_t)screenEdgeSystemGestureType
{
  return self->_screenEdgeSystemGestureType;
}

- (UIPanGestureRecognizer)dismissPanGestureRecognizer
{
  return self->_dismissPanGestureRecognizer;
}

- (void)setDismissPanGestureRecognizer:(id)a3
{
}

- (unint64_t)indirectScreenEdgeSystemGestureType
{
  return self->_indirectScreenEdgeSystemGestureType;
}

- (unint64_t)scrunchSystemGestureType
{
  return self->_scrunchSystemGestureType;
}

- (BOOL)isAnimatingPresentationProgress
{
  return self->_animatingPresentationProgress;
}

- (void)setAnimatingPresentationProgress:(BOOL)a3
{
  self->_animatingPresentationProgress = a3;
}

- (BOOL)isOverlayAppearing
{
  return self->_overlayAppearing;
}

- (void)setOverlayAppearing:(BOOL)a3
{
  self->_overlayAppearing = a3;
}

- (UIViewController)existingAvocadoVC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_existingAvocadoVC);
  return (UIViewController *)WeakRetained;
}

- (void)setExistingAvocadoVC:(id)a3
{
}

- (double)initialPresentationProgress
{
  return self->_initialPresentationProgress;
}

- (void)setInitialPresentationProgress:(double)a3
{
  self->_initialPresentationProgress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_existingAvocadoVC);
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_storeStrong((id *)&self->_homeAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dismissalDelegate);
  objc_storeStrong((id *)&self->_frameRateAssertion, 0);
  objc_storeStrong((id *)&self->_reasonsToDisablePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_setDisplayLayoutElementActive:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "Trying to set the display layout element for the home screen overlay to active but no active sidebar exists!", v1, 2u);
}

@end