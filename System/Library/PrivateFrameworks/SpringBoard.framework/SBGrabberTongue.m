@interface SBGrabberTongue
- (BOOL)_shouldAllowSecondSwipeWithRecognizer:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3;
- (BOOL)_shouldSecondSwipeDismissTongueWithRecognizer:(id)a3;
- (BOOL)_shouldShowTongueOnFirstSwipeWithRecognizer:(id)a3;
- (BOOL)_tongueOrPullEnabledForGestureRecognizer:(id)a3;
- (BOOL)dismissWithStyle:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEdgeLocationInGrabberRegion:(double)a3;
- (BOOL)isVisible;
- (CGAffineTransform)_transformForTongueContainer;
- (CGRect)_chevronFrameForTongueBounds:(CGRect)a3;
- (CGRect)_frameForTongueWhenVisible:(BOOL)a3;
- (NSString)name;
- (SBGrabberTongue)init;
- (SBGrabberTongue)initWithDelegate:(id)a3 edge:(unint64_t)a4 type:(unint64_t)a5 windowScene:(id)a6;
- (SBGrabberTongueDelegate)delegate;
- (UIEdgeInsets)_grabberTongueScreenInsets;
- (double)_ambiguousActivationMargin;
- (double)_ambiguousActivationMarginIfHonored;
- (double)_centerOnScreenEdge;
- (double)_distanceFromEdgeForRecognizer:(id)a3;
- (double)_edgeOrientedVelocityForRecognizer:(id)a3;
- (double)distanceFromEdge;
- (double)edgeLocationForTouch:(id)a3;
- (double)edgeOrientedVelocity;
- (id)_createEdgePullGestureRecognizerWithAction:(SEL)a3;
- (id)_createTapGestureRecognizerWithAction:(SEL)a3;
- (id)_newBackdropViewWithColorStyle:(int64_t)a3;
- (id)_newChevronView;
- (id)edgePullGestureRecognizer;
- (id)indirectEdgePullGestureRecognizer;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (unint64_t)screenEdge;
- (void)_cancelPendingTongueDismissRequests;
- (void)_createTongueAndGestureRecognizersIfNecessaryWithColorStyle:(int64_t)a3;
- (void)_didDismiss;
- (void)_didPresentInteractively:(id)a3;
- (void)_dismissTongue:(id)a3;
- (void)_dismissTongueWithStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)_handlePullGesture:(id)a3;
- (void)_handleTapped:(id)a3;
- (void)_presentTongueAnimated:(BOOL)a3 autoDismiss:(BOOL)a4;
- (void)_pullGestureBegan:(id)a3;
- (void)_pullGestureCanceled:(id)a3;
- (void)_pullGestureEnded:(id)a3;
- (void)_pullGestureUpdated:(id)a3;
- (void)_updateCancelsTouchesWithRecognizerIfNeeded:(id)a3;
- (void)_willDismiss;
- (void)_willPresent;
- (void)_willPresentInteractively:(id)a3;
- (void)dealloc;
- (void)installInView:(id)a3 withColorStyle:(int64_t)a4;
- (void)invalidate;
- (void)presentAnimated:(BOOL)a3;
- (void)setName:(id)a3;
- (void)uninstall;
@end

@implementation SBGrabberTongue

- (id)edgePullGestureRecognizer
{
  return self->_edgePullGestureRecognizer;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  v6 = (UIPanGestureRecognizer *)a3;
  id v7 = a4;
  v8 = [(UIPanGestureRecognizer *)v6 view];
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  v13 = [(UIView *)self->_containingView _sbWindowScene];
  v14 = [v13 pictureInPictureManager];
  char v15 = objc_msgSend(v14, "isPointWithinAnyPictureInPictureContent:", v10, v12);

  if ((v15 & 1) != 0
    || (UIPanGestureRecognizer *)self->_tapGestureRecognizer == v6
    && (self->_inPullGesture || self->_inShowTongueGesture || self->_inDismissTongueGesture)
    || ![(SBGrabberTongue *)self _shouldReceiveTouch:v7])
  {
    LOBYTE(v16) = 0;
  }
  else if (self->_edgePullGestureRecognizer == v6 || (UIPanGestureRecognizer *)self->_tapGestureRecognizer == v6)
  {
    int v16 = [v7 _isPointerTouch] ^ 1;
  }
  else
  {
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (BOOL)_shouldReceiveTouch:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    char v6 = [WeakRetained grabberTongue:self shouldReceiveTouch:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isVisible
{
  return self->_tongueVisible;
}

- (unint64_t)screenEdge
{
  return self->_screenEdge;
}

- (double)edgeLocationForTouch:(id)a3
{
  _UISystemGestureLocationForTouchInView();
  double v6 = v5;
  double result = 0.0;
  switch(self->_screenEdge)
  {
    case 1uLL:
    case 4uLL:
      double result = v6;
      break;
    case 2uLL:
    case 8uLL:
      double result = v4;
      break;
    default:
      return result;
  }
  return result;
}

- (SBGrabberTongue)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBGrabberTongue.m" lineNumber:91 description:@"use initWithDelegate:..."];

  return 0;
}

- (SBGrabberTongue)initWithDelegate:(id)a3 edge:(unint64_t)a4 type:(unint64_t)a5 windowScene:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  if (!v11)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBGrabberTongue.m", 96, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)SBGrabberTongue;
  v13 = [(SBGrabberTongue *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14->_screenEdge = a4;
    v14->_systemGestureType = a5;
    objc_storeWeak((id *)&v14->_windowScene, v12);
    v14->_gestureStartTime = -1.79769313e308;
  }

  return v14;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"SBGrabberTongue.m", 108, @"Invalid parameter not satisfying: %@", @"_invalidated" object file lineNumber description];
  }
  [(UIPanGestureRecognizer *)self->_edgePullGestureRecognizer setDelegate:0];
  [(SBIndirectPanGestureRecognizer *)self->_indirectEdgePullGestureRecognizer setDelegate:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)SBGrabberTongue;
  [(SBGrabberTongue *)&v5 dealloc];
}

- (void)invalidate
{
  self->_invalidated = 1;
}

- (void)installInView:(id)a3 withColorStyle:(int64_t)a4
{
  id v7 = (UIView *)a3;
  if (self->_containingView)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBGrabberTongue.m" lineNumber:122 description:@"Can't install more than once"];
  }
  containingView = self->_containingView;
  self->_containingView = v7;
  double v10 = v7;

  [(SBGrabberTongue *)self _createTongueAndGestureRecognizersIfNecessaryWithColorStyle:a4];
  [(UIView *)self->_tongueContainer setAccessibilityIdentifier:@"sb-grabber-tongue"];
  [(UIView *)self->_containingView addSubview:self->_tongueContainer];
}

- (void)uninstall
{
  if (self->_tongueContainer)
  {
    tongueBackdropView = self->_tongueBackdropView;
    self->_tongueBackdropView = 0;

    tongueChevron = self->_tongueChevron;
    self->_tongueChevron = 0;

    [(UIView *)self->_tongueContainer removeFromSuperview];
    tongueContainer = self->_tongueContainer;
    self->_tongueContainer = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v11 = [WeakRetained systemGestureManager];

  [v11 removeGestureRecognizer:self->_edgePullGestureRecognizer];
  [(UIPanGestureRecognizer *)self->_edgePullGestureRecognizer setDelegate:0];
  edgePullGestureRecognizer = self->_edgePullGestureRecognizer;
  self->_edgePullGestureRecognizer = 0;

  [v11 removeGestureRecognizer:self->_indirectEdgePullGestureRecognizer];
  [(SBIndirectPanGestureRecognizer *)self->_indirectEdgePullGestureRecognizer setDelegate:0];
  indirectEdgePullGestureRecognizer = self->_indirectEdgePullGestureRecognizer;
  self->_indirectEdgePullGestureRecognizer = 0;

  [v11 removeGestureRecognizer:self->_tapGestureRecognizer];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:0];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = 0;

  containingView = self->_containingView;
  self->_containingView = 0;
}

- (void)presentAnimated:(BOOL)a3
{
}

- (BOOL)dismissWithStyle:(int64_t)a3 animated:(BOOL)a4
{
  BOOL tongueVisible = self->_tongueVisible;
  if (self->_tongueVisible) {
    [(SBGrabberTongue *)self _dismissTongueWithStyle:a3 animated:a4];
  }
  return tongueVisible;
}

- (id)indirectEdgePullGestureRecognizer
{
  return self->_indirectEdgePullGestureRecognizer;
}

- (double)distanceFromEdge
{
  [(SBGrabberTongue *)self _distanceFromEdgeForRecognizer:self->_edgePullGestureRecognizer];
  return result;
}

- (double)edgeOrientedVelocity
{
  [(SBGrabberTongue *)self _edgeOrientedVelocityForRecognizer:self->_edgePullGestureRecognizer];
  return result;
}

- (BOOL)isEdgeLocationInGrabberRegion:(double)a3
{
  [(SBGrabberTongue *)self _centerOnScreenEdge];
  return v4 + 48.0 >= a3 && v4 + -48.0 <= a3;
}

- (BOOL)_tongueOrPullEnabledForGestureRecognizer:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = WeakRetained;
  if (WeakRetained) {
    char v7 = [WeakRetained grabberTongueOrPullEnabled:self forGestureRecognizer:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldShowTongueOnFirstSwipeWithRecognizer:(id)a3
{
  id v4 = (SBIndirectPanGestureRecognizer *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = WeakRetained;
  if (self->_indirectEdgePullGestureRecognizer == v4 || WeakRetained == 0)
  {
    char v8 = 0;
  }
  else
  {
    _UISystemGestureLocationInView();
    double v11 = v10;
    double v12 = 0.0;
    switch(self->_screenEdge)
    {
      case 1uLL:
      case 4uLL:
        double v12 = v11;
        break;
      case 2uLL:
      case 8uLL:
        double v12 = v9;
        break;
      default:
        break;
    }
    char v8 = [v6 grabberTongue:self shouldShowTongueOnFirstSwipeWithEdgeLocation:v12];
  }

  return v8;
}

- (BOOL)_shouldAllowSecondSwipeWithRecognizer:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained) {
    char v6 = objc_opt_respondsToSelector();
  }
  else {
    char v6 = 0;
  }
  _UISystemGestureLocationInView();
  double v9 = v8;
  double v10 = 0.0;
  switch(self->_screenEdge)
  {
    case 1uLL:
    case 4uLL:
      double v10 = v9;
      goto LABEL_6;
    case 2uLL:
    case 8uLL:
      double v10 = v7;
      if ((v6 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_7;
    default:
LABEL_6:
      if (v6) {
LABEL_7:
      }
        char v11 = [WeakRetained grabberTongue:self shouldAllowSecondSwipeWithEdgeLocation:v10];
      else {
LABEL_9:
      }
        char v11 = [(SBGrabberTongue *)self isEdgeLocationInGrabberRegion:v10];
      BOOL v12 = v11;

      return v12;
  }
}

- (BOOL)_shouldSecondSwipeDismissTongueWithRecognizer:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained) {
    char v6 = objc_opt_respondsToSelector();
  }
  else {
    char v6 = 0;
  }
  _UISystemGestureLocationInView();
  double v9 = v8;
  double v10 = 0.0;
  switch(self->_screenEdge)
  {
    case 1uLL:
    case 4uLL:
      double v10 = v9;
      goto LABEL_6;
    case 2uLL:
    case 8uLL:
      double v10 = v7;
      if ((v6 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_7;
    default:
LABEL_6:
      if (v6) {
LABEL_7:
      }
        char v11 = [WeakRetained grabberTongue:self shouldDismissTongueOnSecondSwipeWithEdgeLocation:v10];
      else {
LABEL_9:
      }
        char v11 = 1;

      return v11;
  }
}

- (double)_ambiguousActivationMargin
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutState())
  {
LABEL_6:
    objc_super v5 = (void *)SBApp;
    [v5 bottomEdgeAmbiguousActivationMargin];
    return result;
  }
  v2 = +[SBWorkspace mainWorkspace];
  v3 = [v2 transientOverlayPresentationManager];
  if ([v3 hasActivePresentation])
  {
LABEL_5:

    goto LABEL_6;
  }
  id v4 = +[SBCoverSheetPresentationManager sharedInstance];
  if ([v4 isVisible])
  {

    goto LABEL_5;
  }
  double v7 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  char v8 = [v7 isAnySwitcherVisible];

  if (v8) {
    goto LABEL_6;
  }
  double v9 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        char v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) sceneIfExists];
        int v16 = v15;
        if (v15)
        {
          objc_super v17 = [v15 uiClientSettings];
          [v17 controlCenterAmbiguousActivationMargin];
          double v19 = v18;

          if (v19 >= v13) {
            double v13 = v19;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (double)_ambiguousActivationMarginIfHonored
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v4 = 0.0;
  if (WeakRetained
    && (objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained grabberTongueHonorsAmbiguousActivationMargin:self])
  {
    [(SBGrabberTongue *)self _ambiguousActivationMargin];
    double v4 = v5;
  }

  return v4;
}

- (double)_centerOnScreenEdge
{
  unint64_t v2 = self->_screenEdge & 5;
  [(UIView *)self->_containingView bounds];
  if (v2)
  {
    return CGRectGetMidX(*(CGRect *)&v3);
  }
  else
  {
    return CGRectGetMidY(*(CGRect *)&v3);
  }
}

- (void)_pullGestureBegan:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(SBGrabberTongue *)self _distanceFromEdgeForRecognizer:v8];
    double v6 = v5;
    [(SBGrabberTongue *)self _edgeOrientedVelocityForRecognizer:v8];
    [WeakRetained grabberTongueBeganPulling:self withDistance:v8 andVelocity:v6 andGesture:v7];
  }
}

- (void)_pullGestureUpdated:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(SBGrabberTongue *)self _distanceFromEdgeForRecognizer:v8];
    double v6 = v5;
    [(SBGrabberTongue *)self _edgeOrientedVelocityForRecognizer:v8];
    [WeakRetained grabberTongueUpdatedPulling:self withDistance:v8 andVelocity:v6 andGesture:v7];
  }
}

- (void)_pullGestureEnded:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(SBGrabberTongue *)self _distanceFromEdgeForRecognizer:v8];
    double v6 = v5;
    [(SBGrabberTongue *)self _edgeOrientedVelocityForRecognizer:v8];
    [WeakRetained grabberTongueEndedPulling:self withDistance:v8 andVelocity:v6 andGesture:v7];
  }
}

- (void)_pullGestureCanceled:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(SBGrabberTongue *)self _distanceFromEdgeForRecognizer:v8];
    double v6 = v5;
    [(SBGrabberTongue *)self _edgeOrientedVelocityForRecognizer:v8];
    [WeakRetained grabberTongueCanceledPulling:self withDistance:v8 andVelocity:v6 andGesture:v7];
  }
}

- (void)_willPresent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained grabberTongueWillPresent:self];
  }
}

- (void)_willDismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained grabberTongueWillDismiss:self];
  }
}

- (void)_didDismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained grabberTongueDidDismiss:self];
  }
}

- (void)_willPresentInteractively:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(SBGrabberTongue *)self _distanceFromEdgeForRecognizer:v8];
    double v6 = v5;
    [(SBGrabberTongue *)self _edgeOrientedVelocityForRecognizer:v8];
    [WeakRetained grabberTongueWillPresentInteractively:self withDistance:v6 andVelocity:v7];
  }
}

- (void)_didPresentInteractively:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(SBGrabberTongue *)self _distanceFromEdgeForRecognizer:v8];
    double v6 = v5;
    [(SBGrabberTongue *)self _edgeOrientedVelocityForRecognizer:v8];
    [WeakRetained grabberTongueDidPresentInteractively:self withDistance:v6 andVelocity:v7];
  }
}

- (void)_createTongueAndGestureRecognizersIfNecessaryWithColorStyle:(int64_t)a3
{
  if (self->_tongueContainer) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v33 = [WeakRetained systemGestureManager];

  double v6 = [(SBGrabberTongue *)self name];
  double v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    double v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v8;

  uint64_t v11 = [(SBGrabberTongue *)self _createEdgePullGestureRecognizerWithAction:sel__handlePullGesture_];
  edgePullGestureRecognizer = self->_edgePullGestureRecognizer;
  self->_edgePullGestureRecognizer = v11;

  double v13 = self->_edgePullGestureRecognizer;
  v14 = [NSString stringWithFormat:@"%@-edgePullGestureRecognizer-%X", v10, self->_screenEdge];
  [(UIPanGestureRecognizer *)v13 setName:v14];

  [(UIPanGestureRecognizer *)self->_edgePullGestureRecognizer setDelegate:self];
  [(UIPanGestureRecognizer *)self->_edgePullGestureRecognizer setCancelsTouchesInView:0];
  [v33 addGestureRecognizer:self->_edgePullGestureRecognizer withType:self->_systemGestureType];
  char v15 = [(SBGrabberTongue *)self _createTapGestureRecognizerWithAction:sel__handleTapped_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v15;

  objc_super v17 = self->_tapGestureRecognizer;
  double v18 = [NSString stringWithFormat:@"%@-tapGestureRecognizer-%X", v10, self->_screenEdge];
  [(UITapGestureRecognizer *)v17 setName:v18];

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setCancelsTouchesInView:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setAllowedTouchTypes:&unk_1F3348408];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
  unint64_t systemGestureType = self->_systemGestureType;
  if (systemGestureType == 25)
  {
    uint64_t v20 = 27;
    goto LABEL_9;
  }
  if (systemGestureType == 26)
  {
    uint64_t v20 = 28;
LABEL_9:
    [v33 addGestureRecognizer:self->_tapGestureRecognizer withType:v20];
  }
  id v21 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    long long v22 = [v21 indirectPanGestureRecognizerForGrabberTongue:self];
    indirectEdgePullGestureRecognizer = self->_indirectEdgePullGestureRecognizer;
    self->_indirectEdgePullGestureRecognizer = v22;
  }
  v24 = self->_indirectEdgePullGestureRecognizer;
  if (v24)
  {
    [(SBIndirectPanGestureRecognizer *)v24 setDelegate:self];
    [(SBIndirectPanGestureRecognizer *)self->_indirectEdgePullGestureRecognizer addTarget:self action:sel__handlePullGesture_];
    objc_msgSend(v33, "addGestureRecognizer:withType:", self->_indirectEdgePullGestureRecognizer, objc_msgSend(v21, "indirectPanSystemGestureTypeForGrabberTongue:", self));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v21 shouldSuppressTongueViewForGrabberTongue:self])
  {
    tongueContainer = self->_tongueContainer;
    self->_tongueContainer = 0;
  }
  else
  {
    v26 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, 96.0, 30.0);
    v27 = self->_tongueContainer;
    self->_tongueContainer = v26;

    [(UIView *)self->_tongueContainer setClipsToBounds:1];
    [(UIView *)self->_tongueContainer setOpaque:0];
    [(UIView *)self->_tongueContainer setUserInteractionEnabled:1];
    [(UIView *)self->_tongueContainer _setContinuousCornerRadius:13.0];
    v28 = [(UIView *)self->_tongueContainer layer];
    [v28 setMaskedCorners:12];

    v29 = [(SBGrabberTongue *)self _newBackdropViewWithColorStyle:a3];
    tongueBackdropView = self->_tongueBackdropView;
    self->_tongueBackdropView = v29;

    v31 = [(SBGrabberTongue *)self _newChevronView];
    tongueChevron = self->_tongueChevron;
    self->_tongueChevron = v31;

    [(UIView *)self->_tongueContainer addSubview:self->_tongueBackdropView];
    [(UIView *)self->_tongueContainer addSubview:self->_tongueChevron];
    [(_UIBackdropView *)self->_tongueBackdropView setComputesColorSettings:1];
    [(_UIBackdropView *)self->_tongueBackdropView setAppliesOutputSettingsAutomatically:1];
    [(_UIBackdropView *)self->_tongueBackdropView setAppliesOutputSettingsAnimationDuration:1.0];
  }
  [(UIView *)self->_tongueContainer setAlpha:0.0];
}

- (id)_createEdgePullGestureRecognizerWithAction:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    double v6 = [WeakRetained customGestureRecognizerForGrabberTongue:self];
  }
  else
  {
    double v6 = [[SBScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:a3];
    [(UIScreenEdgePanGestureRecognizer *)v6 setEdges:self->_screenEdge];
  }
  [(SBScreenEdgePanGestureRecognizer *)v6 addTarget:self action:a3];

  return v6;
}

- (id)_createTapGestureRecognizerWithAction:(SEL)a3
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:a3];
  return v3;
}

- (id)_newBackdropViewWithColorStyle:(int64_t)a3
{
  if (a3) {
    uint64_t v4 = 11050;
  }
  else {
    uint64_t v4 = 2020;
  }
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:v4];
  [v5 setGroupName:@"GrabberTongue"];
  [(UIView *)self->_tongueContainer bounds];
  objc_msgSend(v5, "setFrame:");
  return v5;
}

- (id)_newChevronView
{
  unint64_t v2 = [MEMORY[0x1E4F42A80] imageNamed:@"grabber-chevron"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v2];
  CGAffineTransformMakeRotation(&v5, 3.14159265);
  [v3 setTransform:&v5];

  return v3;
}

- (void)_dismissTongue:(id)a3
{
}

- (void)_cancelPendingTongueDismissRequests
{
  uint64_t v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__dismissTongue_ object:0];
}

- (void)_dismissTongueWithStyle:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(SBGrabberTongue *)self _cancelPendingTongueDismissRequests];
  self->_BOOL tongueVisible = 0;
  [(SBGrabberTongue *)self _willDismiss];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke;
  v13[3] = &unk_1E6AF4A70;
  v13[4] = self;
  v13[5] = a3;
  double v7 = (void (**)(void))MEMORY[0x1D948C7A0](v13);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke_2;
  v12[3] = &unk_1E6AFF1A8;
  v12[4] = self;
  v12[5] = a3;
  id v8 = (void (**)(void, void))MEMORY[0x1D948C7A0](v12);
  if (v4)
  {
    double v9 = (void *)MEMORY[0x1E4F42FF0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke_3;
    v10[3] = &unk_1E6AF5300;
    uint64_t v11 = v7;
    [v9 animateWithDuration:v10 animations:v8 completion:0.2];
  }
  else
  {
    v7[2](v7);
    v8[2](v8, 1);
  }
}

uint64_t __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v1[5];
  if (*(void *)(v2 + 8))
  {
    BOOL v4 = (void *)v1[5];
    return [v4 setAlpha:0.0];
  }
  else
  {
    [v1 _frameForTongueWhenVisible:0];
    return objc_msgSend(v3, "setFrame:");
  }
}

uint64_t __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;

  if (!*(void *)(a1 + 40)) {
    [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:0.0];
  }
  BOOL v4 = *(void **)(a1 + 32);
  return [v4 _didDismiss];
}

uint64_t __52__SBGrabberTongue__dismissTongueWithStyle_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentTongueAnimated:(BOOL)a3 autoDismiss:(BOOL)a4
{
  BOOL v4 = a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!self->_tongueVisible)
  {
    BOOL v6 = a3;
    self->_BOOL tongueVisible = 1;
    [(SBGrabberTongue *)self _willPresent];
    if (!self->_deferOrientationUpdatesAssertion)
    {
      double v7 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:@"SBOrientationLockForGrabber"];
      deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
      self->_deferOrientationUpdatesAssertion = v7;
    }
    [(UIView *)self->_tongueContainer setAlpha:1.0];
    tongueContainer = self->_tongueContainer;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v17 = *MEMORY[0x1E4F1DAB8];
    long long v18 = v10;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIView *)tongueContainer setTransform:&v17];
    [(SBGrabberTongue *)self _frameForTongueWhenVisible:0];
    -[UIView setFrame:](self->_tongueContainer, "setFrame:");
    tongueChevron = self->_tongueChevron;
    SBRectWithSize();
    -[SBGrabberTongue _chevronFrameForTongueBounds:](self, "_chevronFrameForTongueBounds:");
    -[UIImageView setFrame:](tongueChevron, "setFrame:");
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
    [(SBGrabberTongue *)self _transformForTongueContainer];
    uint64_t v12 = self->_tongueContainer;
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    [(UIView *)v12 setTransform:v16];
    double v13 = 0.2;
    if (!v6) {
      double v13 = 0.0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__SBGrabberTongue__presentTongueAnimated_autoDismiss___block_invoke;
    v15[3] = &unk_1E6AF4AC0;
    v15[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v15 animations:v13];
  }
  [(SBGrabberTongue *)self _cancelPendingTongueDismissRequests];
  if (v4)
  {
    v20[0] = *MEMORY[0x1E4F1C4B0];
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [(SBGrabberTongue *)self performSelector:sel__dismissTongue_ withObject:0 afterDelay:v14 inModes:2.0];
  }
}

uint64_t __54__SBGrabberTongue__presentTongueAnimated_autoDismiss___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)v1[5];
  [v1 _frameForTongueWhenVisible:1];
  return objc_msgSend(v2, "setFrame:");
}

- (CGRect)_frameForTongueWhenVisible:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->_tongueContainer frame];
  double MinX = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  unint64_t screenEdge = self->_screenEdge;
  [(UIView *)self->_containingView bounds];
  [(SBGrabberTongue *)self _grabberTongueScreenInsets];
  UIRectInset();
  CGFloat v19 = v15;
  CGFloat v20 = v16;
  CGFloat v21 = v17;
  CGFloat v22 = v18;
  switch(screenEdge)
  {
    case 1uLL:
      [(SBGrabberTongue *)self _centerOnScreenEdge];
      SBScreenScale();
      SBFloatFloorForScale();
      double MinX = v23;
      if (v3)
      {
        v35.origin.x = v19;
        v35.origin.y = v20;
        v35.size.width = v21;
        v35.size.height = v22;
        double MinY = CGRectGetMinY(v35);
        goto LABEL_16;
      }
      double v9 = -v13;
      break;
    case 2uLL:
      if (v3) {
        double MinX = CGRectGetMinX(*(CGRect *)&v15);
      }
      else {
        double MinX = -v11;
      }
      goto LABEL_15;
    case 4uLL:
      [(SBGrabberTongue *)self _centerOnScreenEdge];
      SBScreenScale();
      SBFloatFloorForScale();
      double MinX = v25;
      v36.origin.x = v19;
      v36.origin.y = v20;
      v36.size.width = v21;
      v36.size.height = v22;
      double MaxY = CGRectGetMaxY(v36);
      double v27 = -0.0;
      if (v3) {
        double v27 = v13;
      }
      double v9 = MaxY - v27;
      break;
    case 8uLL:
      double MaxX = CGRectGetMaxX(*(CGRect *)&v15);
      double v30 = -0.0;
      if (v3) {
        double v30 = v11;
      }
      double MinX = MaxX - v30;
LABEL_15:
      [(SBGrabberTongue *)self _centerOnScreenEdge];
      SBScreenScale();
      SBFloatFloorForScale();
LABEL_16:
      double v9 = MinY;
      break;
    default:
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:self file:@"SBGrabberTongue.m" lineNumber:546 description:@"Grabbers can only be installed on one edge"];

      break;
  }
  double v31 = MinX;
  double v32 = v9;
  double v33 = v11;
  double v34 = v13;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (UIEdgeInsets)_grabberTongueScreenInsets
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB33E8], "sb_thisDeviceDisplayShape");
  BOOL v4 = v3;
  if (v3)
  {
    [v3 rect];
    double MaxY = CGRectGetMaxY(v19);
  }
  else
  {
    double MaxY = 0.0;
  }
  uint64_t v6 = SBFEffectiveArtworkSubtype();
  if (v6 > 2795)
  {
    if (v6 != 2868 && v6 != 2796) {
      goto LABEL_13;
    }
  }
  else if (v6 != 2556 && v6 != 2622)
  {
    goto LABEL_13;
  }
  double v7 = [(id)SBApp systemApertureControllerForMainDisplay];
  double v8 = v7;
  if (v7)
  {
    [v7 defaultIslandFrameInCoordinateSpace:self->_containingView];
    double MaxY = CGRectGetMaxY(v20);
  }

LABEL_13:
  double v10 = *MEMORY[0x1E4F437F8];
  double v9 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  if (MaxY > 0.0)
  {
    uint64_t v13 = objc_opt_class();
    v14 = SBSafeCast(v13, self->_containingView);
    if (!v14)
    {
      v14 = [(UIView *)self->_containingView window];
    }
    switch([v14 interfaceOrientation])
    {
      case 1:
        goto LABEL_21;
      case 2:
        double v12 = MaxY;
        goto LABEL_20;
      case 3:
        double v9 = MaxY;
        goto LABEL_20;
      case 4:
        double v11 = MaxY;
        goto LABEL_20;
      default:
LABEL_20:
        double MaxY = v10;
LABEL_21:

        double v10 = MaxY;
        break;
    }
  }

  double v15 = v10;
  double v16 = v9;
  double v17 = v12;
  double v18 = v11;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGRect)_chevronFrameForTongueBounds:(CGRect)a3
{
  SBRectWithSize();
  UIRectCenteredIntegralRectScale();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGAffineTransform)_transformForTongueContainer
{
  unint64_t screenEdge = self->_screenEdge;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  switch(screenEdge)
  {
    case 1uLL:
      double v5 = 0.0;
      break;
    case 2uLL:
      double v5 = -1.57079633;
      break;
    case 8uLL:
      double v5 = 1.57079633;
      break;
    default:
      double v5 = 3.14159265;
      if (screenEdge != 4) {
        double v5 = 0.0;
      }
      break;
  }
  CGAffineTransformMakeRotation(&v7, v5);
  return (CGAffineTransform *)UIIntegralTransform();
}

- (double)_distanceFromEdgeForRecognizer:(id)a3
{
  [a3 locationInView:self->_containingView];
  double v5 = v4;
  double v7 = v6;
  [(UIView *)self->_containingView bounds];
  uint64_t v12 = v11;
  double result = 0.0;
  switch(self->_screenEdge)
  {
    case 1uLL:
      double result = v7;
      break;
    case 2uLL:
      double result = v5;
      break;
    case 4uLL:
      uint64_t v14 = v12;
      double result = CGRectGetMaxY(*(CGRect *)(&v8 - 1)) - v7;
      break;
    case 8uLL:
      uint64_t v15 = v12;
      double result = CGRectGetMaxX(*(CGRect *)(&v8 - 1)) - v5;
      break;
    default:
      return result;
  }
  return result;
}

- (double)_edgeOrientedVelocityForRecognizer:(id)a3
{
  [a3 velocityInView:self->_containingView];
  double v6 = v5;
  double result = 0.0;
  switch(self->_screenEdge)
  {
    case 1uLL:
      double result = v4;
      break;
    case 2uLL:
      double result = v6;
      break;
    case 4uLL:
      double result = -v4;
      break;
    case 8uLL:
      double result = -v6;
      break;
    default:
      return result;
  }
  return result;
}

- (void)_updateCancelsTouchesWithRecognizerIfNeeded:(id)a3
{
  double v4 = (UITapGestureRecognizer *)a3;
  double v5 = v4;
  if (self->_tapGestureRecognizer != v4)
  {
    uint64_t v8 = v4;
    if (self->_tongueVisible) {
      int v6 = 1;
    }
    else {
      int v6 = ![(SBGrabberTongue *)self _shouldShowTongueOnFirstSwipeWithRecognizer:v4];
    }
    [(SBGrabberTongue *)self _ambiguousActivationMarginIfHonored];
    uint64_t v7 = v6 & BSFloatIsZero();
    [(UIPanGestureRecognizer *)self->_edgePullGestureRecognizer setCancelsTouchesInView:v7];
    [(SBIndirectPanGestureRecognizer *)self->_indirectEdgePullGestureRecognizer setCancelsTouchesInView:v7];
    double v5 = v8;
  }
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return self->_containingView;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v5 = (SBIndirectPanGestureRecognizer *)a3;
  int v6 = v5;
  if (*(_WORD *)&self->_inPullGesture) {
    BOOL inDismissTongueGesture = 1;
  }
  else {
    BOOL inDismissTongueGesture = self->_inDismissTongueGesture;
  }
  if ((SBIndirectPanGestureRecognizer *)self->_tapGestureRecognizer != v5
    && (SBIndirectPanGestureRecognizer *)self->_edgePullGestureRecognizer != v5)
  {
    if (self->_indirectEdgePullGestureRecognizer != v5) {
      BOOL inDismissTongueGesture = 0;
    }
    if (!inDismissTongueGesture) {
      goto LABEL_9;
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  if (inDismissTongueGesture) {
    goto LABEL_16;
  }
LABEL_9:
  uint64_t v7 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    double v10 = [(SBIndirectPanGestureRecognizer *)v6 name];
    uint64_t v11 = NSStringFromBOOL();
    uint64_t v12 = NSStringFromBOOL();
    uint64_t v13 = NSStringFromBOOL();
    *(_DWORD *)buf = 138544642;
    CGFloat v22 = v9;
    __int16 v23 = 2050;
    v24 = v6;
    __int16 v25 = 2114;
    v26 = v10;
    __int16 v27 = 2112;
    v28 = v11;
    __int16 v29 = 2112;
    double v30 = v12;
    __int16 v31 = 2112;
    double v32 = v13;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "-[SBGrabberTongue gestureRecognizerShouldBegin:] gesture <%{public}@:%{public}p> (%{public}@) with State _inPullGesture:%@ _inShowTongueGesture:%@ _inDismissTongueGesture:%@", buf, 0x3Eu);
  }
  if (self->_inPullGesture || self->_inShowTongueGesture || self->_inDismissTongueGesture)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    double v18 = NSStringFromBOOL();
    CGRect v19 = NSStringFromBOOL();
    CGRect v20 = NSStringFromBOOL();
    [v17 handleFailureInMethod:a2, self, @"SBGrabberTongue.m", 736, @"Unexpected State Transition for Gesture:%@ with State _inPullGesture:%@ _inShowTongueGesture:%@ _inDismissTongueGesture:%@", v6, v18, v19, v20 object file lineNumber description];
  }
  BOOL v14 = [(SBGrabberTongue *)self _tongueOrPullEnabledForGestureRecognizer:v6];
  [(SBGrabberTongue *)self _updateCancelsTouchesWithRecognizerIfNeeded:v6];
LABEL_17:

  return v14;
}

- (void)_handlePullGesture:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBGrabberTongue *)self _ambiguousActivationMarginIfHonored];
  char IsZero = BSFloatIsZero();
  if ([v4 state] == 1)
  {
    BSContinuousMachTimeNow();
    self->_double gestureStartTime = v6;
  }
  if (!self->_inAmbiguousGesture
    && (self->_inPullGesture
     || self->_inDismissTongueGesture
     || (self->_inShowTongueGesture ? (char v7 = 1) : (char v7 = IsZero), (v7 & 1) != 0)))
  {
    BOOL tongueVisible = self->_tongueVisible;
    BOOL v9 = [(SBGrabberTongue *)self _shouldShowTongueOnFirstSwipeWithRecognizer:v4];
    BOOL v10 = [(SBGrabberTongue *)self _shouldAllowSecondSwipeWithRecognizer:v4];
    BOOL v11 = [(SBGrabberTongue *)self _shouldSecondSwipeDismissTongueWithRecognizer:v4];
    int v12 = !v9;
    if (tongueVisible) {
      int v12 = v10;
    }
    if (self->_inShowTongueGesture) {
      goto LABEL_15;
    }
    if (self->_inPullGesture)
    {
      if (!self->_inDismissTongueGesture)
      {
LABEL_19:
        switch([v4 state])
        {
          case 1:
            self->_inPullGesture = 1;
            [(SBGrabberTongue *)self _pullGestureBegan:v4];
            goto LABEL_37;
          case 2:
            goto LABEL_26;
          case 3:
            [(SBGrabberTongue *)self _pullGestureEnded:v4];
            goto LABEL_67;
          case 4:
            [(SBGrabberTongue *)self _pullGestureCanceled:v4];
LABEL_67:
            self->_inPullGesture = 0;
            break;
          default:
            goto LABEL_37;
        }
        goto LABEL_37;
      }
      goto LABEL_44;
    }
    if (self->_inDismissTongueGesture) {
      goto LABEL_44;
    }
    BOOL inAmbiguousGesture = self->_inAmbiguousGesture;
    if (!inAmbiguousGesture && !tongueVisible && v9)
    {
LABEL_15:
      if ([v4 state] == 1)
      {
        [(SBGrabberTongue *)self _presentTongueAnimated:1 autoDismiss:1];
        [(SBGrabberTongue *)self _willPresentInteractively:v4];
        self->_inShowTongueGesture = 1;
      }
      else if ([v4 state] == 2)
      {
        [(SBGrabberTongue *)self _willPresentInteractively:v4];
      }
      else if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4)
      {
        self->_inShowTongueGesture = 0;
        [(SBGrabberTongue *)self _didPresentInteractively:v4];
      }
      goto LABEL_37;
    }
    BOOL v28 = tongueVisible && !inAmbiguousGesture;
    BOOL v29 = !v28 || v10;
    if (!v29 && v11)
    {
LABEL_44:
      if ([v4 state] == 1)
      {
        [(SBGrabberTongue *)self _dismissTongue:0];
        self->_BOOL inDismissTongueGesture = 1;
      }
      else if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4)
      {
        self->_BOOL inDismissTongueGesture = 0;
      }
      goto LABEL_37;
    }
    if (self->_inAmbiguousGesture) {
      int v12 = 0;
    }
    if (v12 == 1) {
      goto LABEL_19;
    }
  }
  else
  {
    switch([v4 state])
    {
      case 1:
        *(_WORD *)&self->_BOOL inAmbiguousGesture = 1;
        break;
      case 2:
        BSContinuousMachTimeNow();
        double gestureStartTime = self->_gestureStartTime;
        if (v13 - gestureStartTime > 0.2
          || (double v15 = vabdd_f64(v13, gestureStartTime), v15 >= INFINITY) && v15 <= INFINITY)
        {
          if (!self->_beganAmbiguousPullGesture)
          {
            [(SBGrabberTongue *)self _pullGestureBegan:v4];
            self->_beganAmbiguousPullGesture = 1;
          }
LABEL_26:
          [(SBGrabberTongue *)self _pullGestureUpdated:v4];
        }
        break;
      case 3:
        [(SBGrabberTongue *)self _ambiguousActivationMarginIfHonored];
        double v17 = fmax(v16, 64.0);
        [(SBGrabberTongue *)self _distanceFromEdgeForRecognizer:v4];
        if (v18 >= v17)
        {
          if (!self->_beganAmbiguousPullGesture)
          {
            [(SBGrabberTongue *)self _pullGestureBegan:v4];
            self->_beganAmbiguousPullGesture = 1;
          }
        }
        else if (!self->_beganAmbiguousPullGesture)
        {
          goto LABEL_36;
        }
        [(SBGrabberTongue *)self _pullGestureEnded:v4];
        goto LABEL_36;
      case 4:
        [(SBGrabberTongue *)self _pullGestureCanceled:v4];
LABEL_36:
        *(_WORD *)&self->_BOOL inAmbiguousGesture = 0;
        break;
      default:
        break;
    }
  }
LABEL_37:
  CGRect v19 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    CGRect v20 = NSStringFromBOOL();
    CGFloat v21 = NSStringFromBOOL();
    CGFloat v22 = NSStringFromBOOL();
    __int16 v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    __int16 v25 = [v4 name];
    int v30 = 138413570;
    __int16 v31 = v20;
    __int16 v32 = 2112;
    uint64_t v33 = v21;
    __int16 v34 = 2112;
    CGRect v35 = v22;
    __int16 v36 = 2114;
    v37 = v24;
    __int16 v38 = 2050;
    id v39 = v4;
    __int16 v40 = 2114;
    v41 = v25;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "-[SBGrabberTongue _handlePullGesture:] with state: _inPullGesture:%@ _inShowTongueGesture:%@ _inDismissTongueGesture:%@ from gesture <%{public}@:%{public}p> (%{public}@)", (uint8_t *)&v30, 0x3Eu);
  }
}

- (void)_handleTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [v5 locationInView:self->_tongueBackdropView];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  [(_UIBackdropView *)self->_tongueBackdropView bounds];
  v12.x = v7;
  v12.y = v9;
  if (CGRectContainsPoint(v13, v12) && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained grabberTongueTapped:self];
  }
}

- (SBGrabberTongueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBGrabberTongueDelegate *)WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_containingView, 0);
  objc_storeStrong((id *)&self->_tongueChevron, 0);
  objc_storeStrong((id *)&self->_tongueBackdropView, 0);
  objc_storeStrong((id *)&self->_tongueContainer, 0);
  objc_storeStrong((id *)&self->_indirectEdgePullGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_edgePullGestureRecognizer, 0);
}

@end