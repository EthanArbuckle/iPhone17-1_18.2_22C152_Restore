@interface UIPopoverController
+ (BOOL)_forceAttemptsToAvoidKeyboard;
+ (BOOL)_popoversDisabled;
+ (BOOL)_showTargetRectPref;
+ (BOOL)_useLegacyPopoverControllers;
+ (Class)_popoverViewClass;
+ (UIEdgeInsets)_defaultPopoverLayoutMarginsForPopoverControllerStyle:(int64_t)a3 andContentViewController:(id)a4;
+ (void)_setForceModernPopoverUse:(BOOL)a3;
- (BOOL)_allowsFocusBehindDimmingView;
- (BOOL)_allowsPopoverPresentationToAdapt;
- (BOOL)_attemptsToAvoidKeyboard;
- (BOOL)_canRepresentAutomatically;
- (BOOL)_embedsInView;
- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)_ignoresKeyboardNotifications;
- (BOOL)_isDismissing;
- (BOOL)_isPresenting;
- (BOOL)_manuallyHandlesContentViewControllerAppearanceCalls;
- (BOOL)_retainsSelfWhilePresented;
- (BOOL)_shimPopoverPresentationController;
- (BOOL)_shimPresentSlidingPopoverAnimated:(BOOL)a3;
- (BOOL)dismissesOnRotation;
- (BOOL)isPopoverVisible;
- (BOOL)isPresentingOrDismissing;
- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3;
- (BOOL)showsOrientationMarker;
- (BOOL)showsPresentationArea;
- (BOOL)showsTargetRect;
- (CGPoint)_centerPointForScale:(double)a3 frame:(CGRect)a4 anchor:(CGPoint)a5;
- (CGSize)_currentPopoverContentSize;
- (CGSize)popoverContentSize;
- (Class)_defaultChromeViewClass;
- (Class)_popoverLayoutInfoForChromeClass:(Class)a3;
- (Class)popoverBackgroundViewClass;
- (NSArray)passthroughViews;
- (UIColor)backgroundColor;
- (UIDimmingView)dimmingView;
- (UIEdgeInsets)popoverLayoutMargins;
- (UIPopoverArrowDirection)popoverArrowDirection;
- (UIPopoverController)init;
- (UIPopoverController)initWithContentViewController:(UIViewController *)viewController;
- (UIPopoverPresentationController)_presentationController;
- (UIView)_presentingView;
- (UIViewController)contentViewController;
- (_UIPopoverLayoutInfo)preferredLayoutInfo;
- (double)_presentationAnimationDuration;
- (id)_completionBlockForDismissalWhenNotifyingDelegate:(BOOL)a3;
- (id)_dimmingView;
- (id)_gestureRecognizerForPresentationFromEdge:(unint64_t)a3;
- (id)_initWithContentViewController:(id)a3 popoverControllerStyle:(int64_t)a4;
- (id)_layoutInfoForCurrentKeyboardState;
- (id)_layoutInfoForCurrentKeyboardStateAndHostingWindow:(id)a3;
- (id)_layoutInfoFromLayoutInfo:(id)a3 forCurrentKeyboardStateAndHostingWindow:(id)a4;
- (id)_managingSplitViewController;
- (id)_splitParentController;
- (id)delegate;
- (id)popoverView;
- (int)_presentationState;
- (int64_t)_popoverBackgroundStyle;
- (int64_t)_popoverControllerStyle;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (unint64_t)_presentationEdge;
- (unint64_t)_slideTransitionCount;
- (void)_adjustPopoverForNewContentSizeFromViewController:(id)a3 allowShrink:(BOOL)a4;
- (void)_beginMapsTransitionToNewViewController:(id)a3 arrowDirections:(unint64_t)a4 slideDuration:(double)a5 expandDuration:(double)a6;
- (void)_beginMapsTransitionToNewViewController:(id)a3 newTargetRect:(CGRect)a4 inView:(id)a5 arrowDirections:(unint64_t)a6 slideDuration:(double)a7 expandDuration:(double)a8;
- (void)_commonPresentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6;
- (void)_containedViewControllerModalStateChanged;
- (void)_dismissPopoverAnimated:(BOOL)a3 stateOnly:(BOOL)a4 notifyDelegate:(BOOL)a5;
- (void)_hostingWindowDidRotate:(id)a3;
- (void)_hostingWindowWillRotate:(id)a3;
- (void)_incrementSlideTransitionCount:(BOOL)a3;
- (void)_invalidateLayoutInfo;
- (void)_keyboardStateChanged:(id)a3;
- (void)_layoutDimmingViewForInterfaceOrientationOfHostingWindow:(id)a3;
- (void)_modalAnimationFinishedEndIgnoringInteractiveEvents:(BOOL)a3;
- (void)_modalTransition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5 target:(id)a6 didFinish:(int64_t)a7;
- (void)_moveAwayFromTheKeyboard:(id)a3;
- (void)_newViewControllerWasPushed:(id)a3;
- (void)_performHierarchyCheckOnViewController:(id)a3;
- (void)_postludeForDismissal;
- (void)_presentPopoverBySlidingIn:(BOOL)a3 fromEdge:(unint64_t)a4 ofView:(id)a5 animated:(BOOL)a6 stateOnly:(BOOL)a7 notifyDelegate:(BOOL)a8;
- (void)_presentPopoverFromEdge:(unint64_t)a3 ofView:(id)a4 animated:(BOOL)a5;
- (void)_presentPopoverFromRect:(CGRect)a3 embeddedInView:(id)a4 usingViewForLayoutConstraints:(id)a5 permittedArrowDirections:(unint64_t)a6;
- (void)_presentPopoverFromRect:(CGRect)a3 embeddedInView:(id)a4 usingViewForLayoutConstraints:(id)a5 permittedArrowDirections:(unint64_t)a6 animate:(BOOL)a7;
- (void)_presentShimmedPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6;
- (void)_resetSlideTransitionCount;
- (void)_scrollViewDidEndDragging:(id)a3;
- (void)_scrollViewWillBeginDragging:(id)a3;
- (void)_setAllowsPopoverPresentationToAdapt:(BOOL)a3;
- (void)_setContentViewController:(id)a3 backgroundStyle:(int64_t)a4 animated:(BOOL)a5;
- (void)_setGesturesEnabled:(BOOL)a3;
- (void)_setIgnoresKeyboardNotifications:(BOOL)a3;
- (void)_setPopoverBackgroundStyle:(int64_t)a3;
- (void)_setPopoverView:(id)a3;
- (void)_setPresentationController:(id)a3;
- (void)_setPresentationEdge:(unint64_t)a3;
- (void)_setPresentationState:(int)a3;
- (void)_setPresentingView:(id)a3;
- (void)_setRetainsSelfWhilePresented:(BOOL)a3;
- (void)_setSplitParentController:(id)a3;
- (void)_setupPresentationController;
- (void)_startWatchingForKeyboardNotificationsIfNecessary;
- (void)_startWatchingForNavigationControllerNotifications:(id)a3;
- (void)_startWatchingForScrollViewNotifications;
- (void)_startWatchingForWindowRotations;
- (void)_stopWatchingForKeyboardNotifications;
- (void)_stopWatchingForNavigationControllerNotifications:(id)a3;
- (void)_stopWatchingForNotifications;
- (void)_stopWatchingForScrollViewNotifications;
- (void)_stopWatchingForWindowRotations;
- (void)_swipe:(id)a3;
- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5;
- (void)_updateDimmingViewTransformForInterfaceOrientationOfHostingWindow:(id)a3;
- (void)dealloc;
- (void)dimmingViewWasTapped:(id)a3;
- (void)dismissPopoverAnimated:(BOOL)animated;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated;
- (void)presentPopoverFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setContentViewController:(UIViewController *)contentViewController;
- (void)setContentViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)setDelegate:(id)delegate;
- (void)setDimmingView:(id)a3;
- (void)setDismissesOnRotation:(BOOL)a3;
- (void)setPassthroughViews:(NSArray *)passthroughViews;
- (void)setPopoverArrowDirection:(unint64_t)a3;
- (void)setPopoverBackgroundViewClass:(Class)popoverBackgroundViewClass;
- (void)setPopoverContentSize:(CGSize)popoverContentSize;
- (void)setPopoverContentSize:(CGSize)size animated:(BOOL)animated;
- (void)setPopoverFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setPopoverLayoutMargins:(UIEdgeInsets)popoverLayoutMargins;
- (void)setPreferredLayoutInfo:(id)a3;
- (void)setShowsOrientationMarker:(BOOL)a3;
- (void)setShowsPresentationArea:(BOOL)a3;
- (void)setShowsTargetRect:(BOOL)a3;
@end

@implementation UIPopoverController

+ (BOOL)_popoversDisabled
{
  v2 = _UIMainBundleIdentifier();
  BOOL v3 = ([v2 isEqualToString:@"com.apple.mobilesafari"] & 1) == 0
    && ([v2 isEqualToString:@"com.apple.iBooks"] & 1) == 0
    && ([v2 isEqualToString:@"com.apple.itunesu"] & 1) == 0
    && ([v2 isEqualToString:@"com.apple.Maps"] & 1) == 0
    && ![v2 isEqualToString:@"com.apple.accessibility.AccessibilityUIServer"];

  return v3;
}

+ (void)_setForceModernPopoverUse:(BOOL)a3
{
  _forceModernPopoverUse = a3;
}

+ (BOOL)_useLegacyPopoverControllers
{
  return _forceModernPopoverUse == 0;
}

+ (BOOL)_showTargetRectPref
{
  if (qword_1EB260030 != -1) {
    dispatch_once(&qword_1EB260030, &__block_literal_global_134);
  }
  return _MergedGlobals_1007;
}

void __42__UIPopoverController__showTargetRectPref__block_invoke()
{
  _UIKitPreferencesOnce();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v1 objectForKey:@"UIPopoverControllerPaintsTargetRect"];
  _MergedGlobals_1007 = [v0 BOOLValue];
}

+ (Class)_popoverViewClass
{
  return (Class)objc_opt_class();
}

+ (UIEdgeInsets)_defaultPopoverLayoutMarginsForPopoverControllerStyle:(int64_t)a3 andContentViewController:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3)
  {
    if (a3 == 1)
    {
      v7 = [v5 view];
      [v7 bounds];
      double v8 = -CGRectGetWidth(v18);

      v9 = [v6 view];
      int v10 = [v9 _shouldReverseLayoutDirection];

      if (v10) {
        double v11 = -1.0;
      }
      else {
        double v11 = v8;
      }
      if (!v10) {
        double v8 = -1.0;
      }
      double v12 = 0.0;
    }
    else
    {
      double v8 = 0.0;
      double v12 = 0.0;
      double v11 = 0.0;
    }
    double v13 = 0.0;
  }
  else
  {
    double v13 = 30.0;
    double v8 = 10.0;
    double v12 = 10.0;
    double v11 = 10.0;
  }

  double v14 = v13;
  double v15 = v11;
  double v16 = v12;
  double v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIPopoverController)init
{
  return 0;
}

- (id)_initWithContentViewController:(id)a3 popoverControllerStyle:(int64_t)a4
{
  id v8 = a3;
  if (dyld_program_sdk_at_least() && !dyld_program_sdk_at_least()) {
    goto LABEL_10;
  }
  v9 = +[UIDevice currentDevice];
  if (objc_opt_respondsToSelector())
  {
    int v10 = +[UIDevice currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if (v11) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  int v12 = [(id)objc_opt_class() _popoversDisabled];
  if (a4 || !v12)
  {
LABEL_10:
    if (a4 == 1) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"-[UIPopoverController initWithContentViewController:] called when not running under UIUserInterfaceIdiomPad."];
LABEL_11:
  if (_UIAppUseModernRotationAndPresentationBehaviors()
    && ([(id)objc_opt_class() _useLegacyPopoverControllers] & 1) == 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)UIPopoverController;
    double v13 = [(UIPopoverController *)&v25 init];
    self = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_contentViewController, a3);
      goto LABEL_21;
    }
  }
LABEL_15:
  if (!v8) {
  if ((unint64_t)a4 >= 2)
  }
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIPopoverController.m", 372, @"Invalid popover controller type (%ld)", a4);
  }
  [(UIPopoverController *)self _performHierarchyCheckOnViewController:v8];
  v24.receiver = self;
  v24.super_class = (Class)UIPopoverController;
  double v14 = [(UIPopoverController *)&v24 init];
  self = v14;
  if (v14)
  {
    v14->_popoverControllerStyle = a4;
    objc_storeStrong((id *)&v14->_contentViewController, a3);
    [(UIViewController *)self->_contentViewController _setPopoverController:self];
    [(UIPopoverController *)self _transitionFromViewController:0 toViewController:self->_contentViewController animated:0];
    double v15 = objc_alloc_init(UIDimmingView);
    dimmingView = self->_dimmingView;
    self->_dimmingView = v15;

    [(UIView *)self->_dimmingView setTintAdjustmentMode:1];
    [(UIDimmingView *)self->_dimmingView setDelegate:self];
    self->_currentArrowDirection = -1;
    self->_presentationState = 4;
    [(id)objc_opt_class() _defaultPopoverLayoutMarginsForPopoverControllerStyle:self->_popoverControllerStyle andContentViewController:self->_contentViewController];
    self->_popoverLayoutMargins.top = v17;
    self->_popoverLayoutMargins.left = v18;
    self->_popoverLayoutMargins.bottom = v19;
    self->_popoverLayoutMargins.right = v20;
    *(_WORD *)&self->_retainsSelfWhilePresented = 256;
    self->_showsTargetRect = [(id)objc_opt_class() _showTargetRectPref];
  }
LABEL_21:
  v21 = self;

  return v21;
}

- (UIPopoverController)initWithContentViewController:(UIViewController *)viewController
{
  return (UIPopoverController *)[(UIPopoverController *)self _initWithContentViewController:viewController popoverControllerStyle:0];
}

- (void)dealloc
{
  v12[7] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIPopoverController *)self _presentationController];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 delegate];

    if (v5 == self) {
      [v4 setDelegate:0];
    }
  }
  else if ([(UIPopoverController *)self isPopoverVisible])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"-[UIPopoverController dealloc] reached while popover is still visible."];
  }
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v12[0] = 0x1ED10DD60;
  v12[1] = @"UIKeyboardWillShowNotification";
  v12[2] = @"UIKeyboardDidHideNotification";
  v12[3] = @"UIWindowWillRotateNotification";
  v12[4] = @"UIWindowDidRotateNotification";
  v12[5] = @"_UIScrollViewWillBeginDraggingNotification";
  v12[6] = @"_UIScrollViewDidEndDraggingNotification";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:7];
  -[NSNotificationCenter _uiRemoveObserver:names:](v6, self, v7);

  [(_UIPopoverView *)self->_popoverView setPopoverController:0];
  id v8 = [(UIViewController *)self->_contentViewController _popoverController];

  if (v8 == self) {
    [(UIViewController *)self->_contentViewController _setPopoverController:0];
  }
  [(UIDimmingView *)self->_dimmingView setDelegate:0];
  v9 = [(UIGestureRecognizer *)self->_vendedGestureRecognizer view];
  [v9 removeGestureRecognizer:self->_vendedGestureRecognizer];

  [(UIGestureRecognizer *)self->_vendedGestureRecognizer removeTarget:self action:sel__swipe_];
  int v10 = [(UIGestureRecognizer *)self->_dimmingViewGestureRecognizer view];
  [v10 removeGestureRecognizer:self->_dimmingViewGestureRecognizer];

  [(UIGestureRecognizer *)self->_dimmingViewGestureRecognizer removeTarget:self action:sel__swipe_];
  [(UIPopoverController *)self _setPresentationController:0];

  v11.receiver = self;
  v11.super_class = (Class)UIPopoverController;
  [(UIPopoverController *)&v11 dealloc];
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(UIViewController *)contentViewController
{
}

- (void)setContentViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  BOOL v4 = animated;
  int v10 = viewController;
  if (!v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"-[UIPopoverController setContentViewController:animated:] called with a nil viewController."];
  }
  if ([(UIPopoverController *)self _shimPopoverPresentationController])
  {
    v6 = [(UIPopoverController *)self _presentationController];
    [v6 _setContentViewController:v10 animated:v4];
  }
  else
  {
    [(UIPopoverController *)self _performHierarchyCheckOnViewController:v10];
    v7 = v10;
    contentViewController = self->_contentViewController;
    if (contentViewController == v10) {
      goto LABEL_8;
    }
    [(UIPopoverController *)self _transitionFromViewController:contentViewController toViewController:v10 animated:v4];
    v9 = v10;
    v6 = self->_contentViewController;
    self->_contentViewController = v9;
  }

  v7 = v10;
LABEL_8:
}

- (void)setPopoverFrame:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v10 = self->_popoverView;
  objc_super v11 = [(UIPopoverController *)self _layoutInfoForCurrentKeyboardState];
  [v11 offset];
  uint64_t v13 = v12;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIPopoverController_setPopoverFrame_animated___block_invoke;
  aBlock[3] = &unk_1E52E7998;
  CGFloat v23 = x;
  CGFloat v24 = y;
  CGFloat v25 = width;
  CGFloat v26 = height;
  aBlock[4] = self;
  double v14 = v10;
  v22 = v14;
  uint64_t v27 = v13;
  double v15 = _Block_copy(aBlock);
  double v16 = v15;
  if (v4)
  {
    CGFloat v17 = [(UIPopoverController *)self contentViewController];
    CGFloat v18 = [v17 transitionCoordinator];

    if (v18)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __48__UIPopoverController_setPopoverFrame_animated___block_invoke_2;
      v19[3] = &unk_1E52E79C0;
      v19[4] = self;
      id v20 = v16;
      [v18 animateAlongsideTransition:0 completion:v19];
    }
    else
    {
      [(UIPopoverController *)self _presentationAnimationDuration];
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 133, v16, 0);
    }
  }
  else
  {
    (*((void (**)(void *))v15 + 2))(v15);
  }
}

uint64_t __48__UIPopoverController_setPopoverFrame_animated___block_invoke(double *a1)
{
  double v3 = a1[6];
  double v2 = a1[7];
  double v5 = a1[8];
  double v4 = a1[9];
  uint64_t v6 = *((void *)a1 + 4);
  if ((*(unsigned char *)(v6 + 416) & 0x10) != 0)
  {
    v7 = *(void **)(v6 + 48);
    if (v7)
    {
      id v8 = [*(id *)(v6 + 32) superview];
      objc_msgSend(v7, "convertRect:toView:", v8, v3, v2, v5, v4);
      double v3 = v9;
      double v2 = v10;
      double v5 = v11;
      double v4 = v12;
    }
  }
  uint64_t v13 = (void *)*((void *)a1 + 5);
  double v14 = a1[10];
  return objc_msgSend(v13, "_setFrame:arrowOffset:", v3, v2, v5, v4, v14);
}

uint64_t __48__UIPopoverController_setPopoverFrame_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _presentationAnimationDuration];
  uint64_t v2 = *(void *)(a1 + 40);
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 133, v2, 0);
}

- (CGSize)popoverContentSize
{
  double width = self->_popoverContentSize.width;
  double height = self->_popoverContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPopoverContentSize:(CGSize)popoverContentSize
{
}

- (void)setPopoverContentSize:(CGSize)size animated:(BOOL)animated
{
  BOOL v4 = animated;
  double height = size.height;
  double width = size.width;
  if ([(UIPopoverController *)self _shimPopoverPresentationController]
    && ([(UIPopoverController *)self _presentationController],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v38 = [(UIPopoverController *)self _presentationController];
    objc_msgSend(v38, "setPopoverContentSize:animated:", v4, width, height);
  }
  else if (!self->_popoverControllerStyle)
  {
    self->_popoverContentSize.double width = width;
    self->_popoverContentSize.double height = height;
    double v9 = (void *)[(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo copy];
    objc_msgSend(v9, "setPreferredContentSize:", width, height);
    if ((*(unsigned char *)&self->_popoverControllerFlags & 0x10) != 0 && self->_layoutConstraintView)
    {
      double v10 = [(UIView *)self->_popoverView superview];
      objc_msgSend(v10, "convertRect:toView:", self->_layoutConstraintView, self->_targetRectInEmbeddingView.origin.x, self->_targetRectInEmbeddingView.origin.y, self->_targetRectInEmbeddingView.size.width, self->_targetRectInEmbeddingView.size.height);
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;

      objc_msgSend(v9, "setSourceViewRect:", v12, v14, v16, v18);
    }
    CGFloat v19 = [(_UIPopoverView *)self->_popoverView backgroundView];
    id v20 = v19;
    if (v19)
    {
      [v19 _contentViewInsets];
      objc_msgSend(v9, "setContentInset:");
    }
    [(UIPopoverController *)self setPreferredLayoutInfo:v9];
    if ([(UIPopoverController *)self isPopoverVisible]
      || [(UIPopoverController *)self _isPresenting])
    {
      v21 = [(UIPopoverController *)self _layoutInfoForCurrentKeyboardState];
      [v21 frame];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;

      [(UIView *)self->_popoverView frame];
      v45.origin.CGFloat x = v30;
      v45.origin.CGFloat y = v31;
      v45.size.double width = v32;
      v45.size.double height = v33;
      v44.origin.CGFloat x = v23;
      v44.origin.CGFloat y = v25;
      v44.size.double width = v27;
      v44.size.double height = v29;
      if (!CGRectEqualToRect(v44, v45))
      {
        if (v4) {
          int v34 = ![(UIPopoverController *)self _isPresenting];
        }
        else {
          int v34 = 0;
        }
        v41[0] = 0;
        v41[1] = v41;
        v41[2] = 0x3032000000;
        v41[3] = __Block_byref_object_copy__55;
        v41[4] = __Block_byref_object_dispose__55;
        v35 = self;
        v42 = v35;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __54__UIPopoverController_setPopoverContentSize_animated___block_invoke;
        aBlock[3] = &unk_1E52E79E8;
        aBlock[4] = v41;
        *(CGFloat *)&void aBlock[5] = v23;
        *(CGFloat *)&aBlock[6] = v25;
        *(CGFloat *)&aBlock[7] = v27;
        *(CGFloat *)&aBlock[8] = v29;
        char v40 = v34;
        v36 = _Block_copy(aBlock);
        v37 = v36;
        if (v34)
        {
          [(UIView *)self->_popoverView layoutBelowIfNeeded];
          [(UIPopoverController *)v35 _presentationAnimationDuration];
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v37, 0);
        }
        else
        {
          (*((void (**)(void *))v36 + 2))(v36);
        }

        _Block_object_dispose(v41, 8);
      }
    }
  }
}

uint64_t __54__UIPopoverController_setPopoverContentSize_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setPopoverFrame:animated:", *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)isPopoverVisible
{
  if ([(UIPopoverController *)self _shimPopoverPresentationController])
  {
    double v3 = [(UIPopoverController *)self _presentationController];
    char v4 = [v3 isPopoverVisible];
  }
  else
  {
    popoverView = self->_popoverView;
    if (!popoverView) {
      return 0;
    }
    double v3 = [(UIView *)popoverView window];
    if (v3) {
      char v4 = self->_popoverControllerStyle != 1 || (self->_presentationState - 1) < 3;
    }
    else {
      char v4 = 0;
    }
  }

  return v4;
}

- (UIPopoverArrowDirection)popoverArrowDirection
{
  popoverView = self->_popoverView;
  if (popoverView) {
    return [(_UIPopoverView *)popoverView arrowDirection];
  }
  else {
    return -1;
  }
}

- (UIEdgeInsets)popoverLayoutMargins
{
  if ([(UIPopoverController *)self _shimPopoverPresentationController]
    && !self->_presentationController)
  {
    [0 popoverLayoutMargins];
  }
  else
  {
    double top = self->_popoverLayoutMargins.top;
    double left = self->_popoverLayoutMargins.left;
    double bottom = self->_popoverLayoutMargins.bottom;
    double right = self->_popoverLayoutMargins.right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPopoverLayoutMargins:(UIEdgeInsets)popoverLayoutMargins
{
  double right = popoverLayoutMargins.right;
  double bottom = popoverLayoutMargins.bottom;
  double left = popoverLayoutMargins.left;
  double top = popoverLayoutMargins.top;
  if ([(UIPopoverController *)self _shimPopoverPresentationController]
    && (presentationController = self->_presentationController) != 0)
  {
    -[UIPopoverPresentationController setPopoverLayoutMargins:](presentationController, "setPopoverLayoutMargins:", top, left, bottom, right);
  }
  else
  {
    self->_popoverLayoutMargins.double top = top;
    self->_popoverLayoutMargins.double left = left;
    self->_popoverLayoutMargins.double bottom = bottom;
    self->_popoverLayoutMargins.double right = right;
  }
}

- (UIColor)backgroundColor
{
  if ([(UIPopoverController *)self _shimPopoverPresentationController]
    && (presentationController = self->_presentationController) != 0)
  {
    char v4 = [(UIPopoverPresentationController *)presentationController backgroundColor];
  }
  else
  {
    char v4 = self->_backgroundColor;
  }
  return v4;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  double v10 = backgroundColor;
  if ([(UIPopoverController *)self _shimPopoverPresentationController])
  {
    presentationController = self->_presentationController;
    if (presentationController)
    {
      [(UIPopoverPresentationController *)presentationController setBackgroundColor:v10];
    }
    else
    {
      double v5 = v10;
      if (self->_backgroundColor == v10) {
        goto LABEL_9;
      }
      id v8 = (UIColor *)[(UIColor *)v10 copy];
      double v9 = self->_backgroundColor;
      self->_backgroundColor = v8;
    }
  }
  else
  {
    double v5 = v10;
    if (self->_backgroundColor == v10) {
      goto LABEL_9;
    }
    uint64_t v6 = (UIColor *)[(UIColor *)v10 copy];
    v7 = self->_backgroundColor;
    self->_backgroundColor = v6;

    [(_UIPopoverView *)self->_popoverView setPopoverBackgroundColor:v10];
  }
  double v5 = v10;
LABEL_9:
}

- (NSArray)passthroughViews
{
  return [(UIDimmingView *)self->_dimmingView passthroughViews];
}

- (void)setPassthroughViews:(NSArray *)passthroughViews
{
  double v9 = passthroughViews;
  if ([(UIPopoverController *)self _shimPopoverPresentationController])
  {
    presentationController = self->_presentationController;
    if (presentationController)
    {
      [(UIPopoverPresentationController *)presentationController setPassthroughViews:v9];
    }
    else
    {
      v7 = (NSArray *)[(NSArray *)v9 copy];
      id v8 = self->_passthroughViews;
      self->_passthroughViews = v7;
    }
    uint64_t v6 = v9;
  }
  else
  {
    uint64_t v5 = [(NSArray *)v9 copy];

    [(UIDimmingView *)self->_dimmingView setPassthroughViews:v5];
    uint64_t v6 = (void *)v5;
  }
}

- (Class)_popoverLayoutInfoForChromeClass:(Class)a3
{
  objc_opt_class();
  double v3 = objc_opt_class();
  return (Class)v3;
}

- (Class)_defaultChromeViewClass
{
  int64_t popoverControllerStyle = self->_popoverControllerStyle;
  if (popoverControllerStyle == 1)
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    if (v5) {
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  if (popoverControllerStyle
    || (uint64_t v5 = +[_UIPopoverStandardChromeView legacyChromeViewClass]) == 0)
  {
LABEL_8:
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIPopoverController.m" lineNumber:662 description:@"Failed to determine chrome view class"];

    uint64_t v5 = 0;
  }
LABEL_4:
  return v5;
}

- (int)_presentationState
{
  return self->_presentationState;
}

- (void)_setPresentationState:(int)a3
{
  uint64_t v5 = [(UIPopoverController *)self _managingSplitViewController];
  popoverView = self->_popoverView;
  double v12 = v5;
  if (popoverView)
  {
    v7 = [(UIView *)popoverView window];
    if (v7) {
      BOOL v9 = self->_popoverControllerStyle == 1 && v12 != 0;
    }
    else {
      BOOL v9 = 0;
    }

    uint64_t v5 = v12;
  }
  else
  {
    BOOL v9 = 0;
  }
  unsigned int v10 = self->_presentationState - 1;
  if (v9 && (a3 - 1) < 2 != v10 < 2)
  {
    BOOL v11 = v10 < 2;
    [v5 _popoverController:self willChangeToVisible:(a3 - 1) < 2];
    self->_presentationState = a3;
    [v12 _popoverController:self didChangeFromVisible:v11];
    uint64_t v5 = v12;
  }
  else
  {
    self->_presentationState = a3;
  }
}

- (unint64_t)_slideTransitionCount
{
  return self->_slideTransitionCount;
}

- (void)_incrementSlideTransitionCount:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    if (!self->_slideTransitionCount)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"UIPopoverController.m" lineNumber:692 description:@"About to overflow slide transition count"];
    }
    uint64_t v4 = -1;
  }
  self->_slideTransitionCount += v4;
}

- (void)_resetSlideTransitionCount
{
  self->_slideTransitionCount = 0;
}

- (void)_invalidateLayoutInfo
{
  preferredLayoutInfo = self->_preferredLayoutInfo;
  self->_preferredLayoutInfo = 0;
}

- (void)_presentPopoverBySlidingIn:(BOOL)a3 fromEdge:(unint64_t)a4 ofView:(id)a5 animated:(BOOL)a6 stateOnly:(BOOL)a7 notifyDelegate:(BOOL)a8
{
  BOOL v106 = a8;
  BOOL v105 = a6;
  BOOL v108 = a3;
  v125[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  BOOL v11 = [v10 window];
  if (v11) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v12 = (void *)MEMORY[0x1E4F1CA00];
    BOOL v11 = _NSFullMethodName();
    [v12 raise:*MEMORY[0x1E4F1C3C8], @"%@: Popovers cannot be presented from a view which does not have a window.", v11 format];
LABEL_4:
  }
  if (a4 != 2 && a4 != 8)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"UIPopoverController.m" lineNumber:706 description:@"Only 'UIMinXEdge' and 'UIMaxXEdge' are currently supported"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v10;
  }
  else
  {
    id v14 = [v10 window];
  }
  double v15 = v14;
  int presentationState = self->_presentationState;
  BOOL v17 = presentationState == 4 && v108;
  char v18 = presentationState != 2 || v108;
  if ([v14 _isTextEffectsWindow]) {
    *(unsigned char *)&self->_popoverControllerFlags |= 8u;
  }
  [(UIPopoverController *)self _layoutDimmingViewForInterfaceOrientationOfHostingWindow:v15];
  CGFloat v19 = [(UIView *)self->_dimmingView superview];

  if (v19 != v15) {
    [v15 addSubview:self->_dimmingView];
  }
  id v20 = [(UIPopoverController *)self _managingSplitViewController];
  if (v20)
  {
    v21 = [(UIPopoverController *)self _managingSplitViewController];
    [v21 _contentSizeForChildViewController:self->_contentViewController inPopoverController:self];
    double v23 = v22;
  }
  else
  {
    [(UIViewController *)self->_contentViewController _resolvedPreferredContentSize];
    double v23 = v24;
  }

  [v10 bounds];
  double Height = CGRectGetHeight(v126);
  double v26 = 0.0;
  if (a4 != 2)
  {
    [v10 bounds];
    double v26 = CGRectGetWidth(v127) - v23;
  }
  if (!self->_preferredLayoutInfo)
  {
    dimmingView = self->_dimmingView;
    objc_msgSend(v10, "convertRect:toView:", v15, v26, 0.0, v23, Height);
    -[UIView convertRect:fromView:](dimmingView, "convertRect:fromView:", v15);
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    self->_targetRectInDimmingView.origin.CGFloat x = v28;
    self->_targetRectInDimmingView.origin.CGFloat y = v30;
    self->_targetRectInDimmingView.size.double width = v32;
    self->_targetRectInDimmingView.size.double height = v34;
    v36 = (_UIPopoverLayoutInfo *)objc_alloc_init([(UIPopoverController *)self _popoverLayoutInfoForChromeClass:objc_opt_class()]);
    preferredLayoutInfo = self->_preferredLayoutInfo;
    self->_preferredLayoutInfo = v36;

    id v38 = self->_preferredLayoutInfo;
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke;
    v122[3] = &unk_1E52E90D0;
    v122[4] = self;
    *(CGFloat *)&v122[5] = v29;
    *(CGFloat *)&v122[6] = v31;
    *(CGFloat *)&v122[7] = v33;
    *(CGFloat *)&v122[8] = v35;
    BOOL v123 = a4 == 2;
    [(_UIPopoverLayoutInfo *)v38 updateProperties:v122];
  }
  v128.origin.CGFloat x = v26;
  v128.origin.CGFloat y = 0.0;
  v128.size.double width = v23;
  v128.size.double height = Height;
  double Width = CGRectGetWidth(v128);
  if (!a7)
  {
    v129.origin.CGFloat x = v26;
    v129.origin.CGFloat y = 0.0;
    v129.size.double width = v23;
    v129.size.double height = Height;
    CGFloat v44 = CGRectGetWidth(v129);
    double v45 = -v44;
    double v46 = v26 + v44;
    if (a4 == 2) {
      double v46 = v45;
    }
    v47 = self->_dimmingView;
    objc_msgSend(v10, "convertRect:toView:", v15, v46, 0.0, v23, Height);
    -[UIView convertRect:fromView:](v47, "convertRect:fromView:", v15);
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    if (v17)
    {
      v56 = (void *)[(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo copy];
      objc_msgSend(v56, "setSourceViewRect:", v49, v51, v53, v55);
      v57 = [(UIPopoverController *)self _layoutInfoFromLayoutInfo:v56 forCurrentKeyboardStateAndHostingWindow:v15];

      [(UIPopoverController *)self _startWatchingForKeyboardNotificationsIfNecessary];
    }
    else if (v18)
    {
      v58 = [(UIView *)self->_popoverView layer];
      v59 = [v58 presentationLayer];
      popoverView = self->_popoverView;
      if (v59)
      {
        v61 = [(UIView *)popoverView layer];
        v62 = [v61 presentationLayer];
        [v62 frame];
        double v102 = v64;
        double v103 = v63;
        double v66 = v65;
        double v68 = v67;
      }
      else
      {
        [(UIView *)popoverView frame];
        double v102 = v70;
        double v103 = v69;
        double v66 = v71;
        double v68 = v72;
      }

      v73 = (void *)[(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo copy];
      objc_msgSend(v73, "setPreferredContentSize:", v66, v68);
      [(UIView *)self->_dimmingView bounds];
      double v74 = CGRectGetWidth(v130);
      [(UIView *)self->_dimmingView bounds];
      double v75 = CGRectGetHeight(v131);
      if (v74 < v75) {
        double v74 = v75;
      }
      double v76 = 0.0;
      if (a4 != 2)
      {
        objc_msgSend(v10, "bounds", 0.0);
        double v76 = CGRectGetWidth(v132) - v23;
      }
      objc_msgSend(v73, "setContainingFrame:", v76, 0.0, v74, v74);
      objc_msgSend(v73, "setSourceViewRect:", v103, v102, v66, v68);
      v57 = [(UIPopoverController *)self _layoutInfoFromLayoutInfo:v73 forCurrentKeyboardStateAndHostingWindow:v15];
    }
    else
    {
      v57 = [(UIPopoverController *)self _layoutInfoForCurrentKeyboardStateAndHostingWindow:v15];
    }
    if (v108)
    {
      v77 = [(UIPopoverController *)self _layoutInfoForCurrentKeyboardStateAndHostingWindow:v15];
    }
    else
    {
      v78 = (void *)[(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo copy];
      objc_msgSend(v78, "setPreferredContentSize:", v53, v55);
      objc_msgSend(v78, "setSourceViewRect:", v49, v51, v53, v55);
      v77 = [(UIPopoverController *)self _layoutInfoFromLayoutInfo:v78 forCurrentKeyboardStateAndHostingWindow:v15];
    }
    objc_initWeak(&location, self);
    [(UIPopoverController *)self _incrementSlideTransitionCount:1];
    if (!self->_popoverView)
    {
      uint64_t popoverBackgroundViewClass = (uint64_t)self->_popoverBackgroundViewClass;
      if (!popoverBackgroundViewClass) {
        uint64_t popoverBackgroundViewClass = objc_opt_class();
      }
      id v80 = objc_alloc((Class)[(id)objc_opt_class() _popoverViewClass]);
      [v57 frame];
      v81 = (_UIPopoverView *)objc_msgSend(v80, "initWithFrame:backgroundViewClass:", popoverBackgroundViewClass);
      v82 = self->_popoverView;
      self->_popoverView = v81;

      [(_UIPopoverView *)self->_popoverView setPopoverController:self];
      v83 = self->_popoverView;
      +[_UIPopoverSlidingChromeView cornerRadius];
      -[_UIPopoverView _setCornerRadius:](v83, "_setCornerRadius:");
      [(UIPopoverController *)self _setPopoverBackgroundStyle:self->_popoverBackgroundStyle];
      [(_UIPopoverView *)self->_popoverView setPopoverBackgroundColor:self->_backgroundColor];
    }
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_2;
    v118[3] = &unk_1E52DC3D0;
    BOOL v120 = v17;
    v118[4] = self;
    id v39 = v57;
    id v119 = v39;
    +[UIView performWithoutAnimation:v118];

    if (v108) {
      uint64_t v43 = 1;
    }
    else {
      uint64_t v43 = 3;
    }
    if (v108) {
      int v84 = 2;
    }
    else {
      int v84 = 4;
    }
    if (self->_presentationState == v84) {
      goto LABEL_60;
    }
    contentViewController = self->_contentViewController;
    if (v108)
    {
      [(UIViewController *)contentViewController beginAppearanceTransition:1 animated:0];
      if (presentationState == 4)
      {
        v86 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v86 postNotificationName:@"_UIAlertWillAppearNotification" object:self userInfo:0];
        v124 = @"UIPopoverControllerPresentingWindowKey";
        v87 = [(UIView *)self->_popoverView window];
        v125[0] = v87;
        v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:&v124 count:1];
        [v86 postNotificationName:@"UIPopoverControllerWillPresentPopoverNotification" object:self userInfo:v88];

        [(UIPopoverController *)self _startWatchingForWindowRotations];
      }
    }
    else
    {
      if ([(UIViewController *)contentViewController _appearState] != 2)
      {
LABEL_60:
        char v42 = 0;
LABEL_67:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_3;
        aBlock[3] = &unk_1E52D9F98;
        aBlock[4] = self;
        id v40 = v77;
        id v117 = v40;
        v41 = (void (**)(void))_Block_copy(aBlock);

        goto LABEL_68;
      }
      [(UIViewController *)self->_contentViewController beginAppearanceTransition:0 animated:0];
    }
    char v42 = 1;
    goto LABEL_67;
  }
  objc_initWeak(&location, self);
  id v39 = 0;
  id v40 = 0;
  v41 = 0;
  char v42 = 0;
  if (v108) {
    uint64_t v43 = 1;
  }
  else {
    uint64_t v43 = 3;
  }
LABEL_68:
  [(UIPopoverController *)self _setPresentationState:v43];
  v89 = [(UIPopoverController *)self _completionBlockForDismissalWhenNotifyingDelegate:v106];
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_4;
  v110[3] = &unk_1E52E90F8;
  objc_copyWeak(&v112, &location);
  BOOL v113 = a7;
  BOOL v114 = v108;
  v110[4] = self;
  id v90 = v89;
  id v111 = v90;
  char v115 = v42;
  v91 = (void (**)(void *, uint64_t))_Block_copy(v110);
  if (!v105 || a7)
  {
    if (v41) {
      v41[2](v41);
    }
    v91[2](v91, 1);
  }
  else
  {
    v92 = self->_dimmingView;
    [v39 frame];
    -[UIView convertRect:toView:](v92, "convertRect:toView:", v15);
    objc_msgSend(v10, "convertRect:fromView:", v15);
    if (v108)
    {
      if (a4 == 2)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v93);
      }
      else
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v93);
        [v10 bounds];
        double MaxX = MinX - CGRectGetMaxX(v133);
      }
      double v98 = Width - MaxX;
    }
    else if (a4 == 2)
    {
      double v98 = CGRectGetMaxX(*(CGRect *)&v93);
    }
    else
    {
      double v100 = CGRectGetMinX(*(CGRect *)&v93);
      [v10 bounds];
      double v98 = v100 - CGRectGetMaxX(v134);
    }
    [(UIPopoverController *)self _presentationAnimationDuration];
    +[UIView animateWithDuration:v41 animations:v91 completion:v101 * (v98 / Width)];
  }

  objc_destroyWeak(&v112);
  objc_destroyWeak(&location);
}

uint64_t __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setPreferredContentSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  +[_UIPopoverSlidingChromeView contentViewInsets];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setContentInset:");
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 128);
  [*(id *)(v2 + 40) bounds];
  objc_msgSend(v3, "setContainingFrame:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setContainingFrameInsets:", *(double *)(*(void *)(a1 + 32) + 448), *(double *)(*(void *)(a1 + 32) + 456), *(double *)(*(void *)(a1 + 32) + 464), *(double *)(*(void *)(a1 + 32) + 472));
  uint64_t v4 = *(double **)(a1 + 32);
  uint64_t v5 = (void *)*((void *)v4 + 16);
  double v6 = v4[20];
  double v7 = v4[21];
  double v8 = v4[22];
  double v9 = v4[23];
  return objc_msgSend(v5, "setSourceViewRect:", v6, v7, v8, v9);
}

uint64_t __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _transitionFromViewController:0 toViewController:*(void *)(*(void *)(a1 + 32) + 16) animated:0];
  }
  [*(id *)(*(void *)(a1 + 32) + 40) addSubview:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v2, "setFrame:");
  double v3 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v3 layoutBelowIfNeeded];
}

void __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) popoverView];
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v2, "setFrame:");
}

void __100__UIPopoverController__presentPopoverBySlidingIn_fromEdge_ofView_animated_stateOnly_notifyDelegate___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (*(unsigned char *)(a1 + 56) || (BOOL v3 = [WeakRetained _slideTransitionCount] == 1, WeakRetained = v6, v3))
  {
    if ([WeakRetained _presentationState] == 3
      || *(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57))
    {
      [v6 _setPresentationState:4];
      [v6 _setPresentingView:0];
      if (!*(void *)(*(void *)(a1 + 32) + 384)) {
        [v6 _setPresentationEdge:0];
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      if (!*(unsigned char *)(a1 + 56) && *(unsigned char *)(a1 + 58))
      {
        uint64_t v4 = [v6 contentViewController];
        [v4 endAppearanceTransition];
      }
      [v6 _postludeForDismissal];
    }
    else if ([v6 _presentationState] == 1)
    {
      [v6 _setPresentationState:2];
      if (!*(unsigned char *)(a1 + 56))
      {
        if (*(unsigned char *)(a1 + 58))
        {
          uint64_t v5 = [v6 contentViewController];
          [v5 endAppearanceTransition];
        }
      }
    }
    [v6 _resetSlideTransitionCount];
  }
  else if ([v6 _slideTransitionCount] && !*(unsigned char *)(a1 + 56))
  {
    [v6 _incrementSlideTransitionCount:0];
  }
}

- (void)_presentPopoverFromEdge:(unint64_t)a3 ofView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id obj = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
  if (WeakRetained || self->_presentationEdge && !self->_vendedGestureRecognizer)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_presentingView);
    if (v10 == obj)
    {
      unint64_t presentationEdge = self->_presentationEdge;

      if (presentationEdge == a3) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIPopoverController.m" lineNumber:890 description:@"Unexpected presenting view or presentation edge"];
  }
LABEL_9:
  id v13 = objc_storeWeak((id *)&self->_presentingView, obj);
  self->_unint64_t presentationEdge = a3;
  id v14 = v13;
  [(UIPopoverController *)self _presentPopoverBySlidingIn:1 fromEdge:a3 ofView:obj animated:v5 stateOnly:0 notifyDelegate:0];
}

- (void)_presentPopoverFromRect:(CGRect)a3 embeddedInView:(id)a4 usingViewForLayoutConstraints:(id)a5 permittedArrowDirections:(unint64_t)a6 animate:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v72[1] = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  if (a6 == -1)
  {
    BOOL v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    CGFloat v19 = _NSFullMethodName();
    [v17 raise:v18, @"%@: Popovers cannot be presented with UIPopoverArrowDirectionUnknown.", v19 format];
  }
  id v20 = [v15 window];
  if (!v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    id v20 = _NSFullMethodName();
    [v21 raise:v22, @"%@: Popovers cannot be presented from a view which does not have a window.", v20 format];
  }

LABEL_7:
  double v23 = [v16 subviews];
  char v24 = [v23 containsObject:v15];

  if ((v24 & 1) == 0)
  {
    CGFloat v25 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v26 = *MEMORY[0x1E4F1C3C8];
    CGFloat v27 = _NSFullMethodName();
    [v25 raise:v26, @"%@: The view for embedding must be a subview of the layoutConstraintView.", v27 format];
  }
  *(unsigned char *)&self->_popoverControllerFlags |= 0x30u;
  self->_embeddedTargetRect.origin.double x = x;
  self->_embeddedTargetRect.origin.double y = y;
  self->_embeddedTargetRect.size.double width = width;
  self->_embeddedTargetRect.size.double height = height;
  objc_storeStrong((id *)&self->_layoutConstraintView, a5);
  uint64_t popoverBackgroundViewClass = self->_popoverBackgroundViewClass;
  if (!popoverBackgroundViewClass) {
    uint64_t popoverBackgroundViewClass = [(UIPopoverController *)self _defaultChromeViewClass];
  }
  [(UIPopoverController *)self _setPresentationState:1];
  self->_targetRectInEmbeddingView.origin.double x = x;
  self->_targetRectInEmbeddingView.origin.double y = y;
  self->_targetRectInEmbeddingView.size.double width = width;
  self->_targetRectInEmbeddingView.size.double height = height;
  objc_msgSend(v15, "convertRect:toView:", v16, x, y, width, height);
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  v37 = (_UIPopoverLayoutInfo *)objc_alloc_init([(UIPopoverController *)self _popoverLayoutInfoForChromeClass:popoverBackgroundViewClass]);
  preferredLayoutInfo = self->_preferredLayoutInfo;
  self->_preferredLayoutInfo = v37;

  id v39 = self->_preferredLayoutInfo;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke;
  v63[3] = &unk_1E52E9120;
  v63[4] = self;
  double v65 = popoverBackgroundViewClass;
  unint64_t v66 = a6;
  id v40 = v16;
  id v64 = v40;
  uint64_t v67 = v30;
  uint64_t v68 = v32;
  uint64_t v69 = v34;
  uint64_t v70 = v36;
  [(_UIPopoverLayoutInfo *)v39 updateProperties:v63];
  [(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo setPreferredArrowDirections:[(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo arrowDirection]];
  [(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo frame];
  objc_msgSend(v40, "convertRect:toView:", v15);
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_2;
  v62[3] = &unk_1E52E9148;
  v62[4] = self;
  *(double *)&v62[5] = v41;
  *(double *)&v62[6] = v43;
  *(double *)&v62[7] = v45;
  *(double *)&v62[8] = v47;
  v62[9] = popoverBackgroundViewClass;
  +[UIView performWithoutAnimation:v62];
  double v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v71 = @"UIPopoverControllerPresentingWindowKey";
  double v50 = [v15 window];
  v72[0] = v50;
  double v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
  [v49 postNotificationName:@"UIPopoverControllerWillPresentPopoverNotification" object:self userInfo:v51];

  [(UIPopoverController *)self _transitionFromViewController:0 toViewController:self->_contentViewController animated:0];
  v73.origin.double x = v42;
  v73.origin.double y = v44;
  v73.size.double width = v46;
  v73.size.double height = v48;
  double v52 = CGRectGetWidth(v73) * 0.5;
  v74.origin.double x = v42;
  v74.origin.double y = v44;
  v74.size.double width = v46;
  v74.size.double height = v48;
  double v53 = CGRectGetHeight(v74);
  unint64_t v54 = [(_UIPopoverView *)self->_popoverView arrowDirection];
  if (v54 - 1 < 2)
  {
    [(_UIPopoverView *)self->_popoverView arrowOffset];
    double v52 = v52 + v56;
  }
  else if (v54 == 4 || v54 == 8)
  {
    [(_UIPopoverView *)self->_popoverView arrowOffset];
    double v53 = v53 + v55;
  }
  if ((*(unsigned char *)&self->_popoverControllerFlags & 0x20) != 0)
  {
    [(UIView *)self->_popoverView setAlpha:0.0];
    [v15 addSubview:self->_popoverView];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_3;
    aBlock[3] = &unk_1E52E7900;
    aBlock[4] = self;
    BOOL v61 = v7;
    *(CGFloat *)&void aBlock[5] = v42;
    *(CGFloat *)&aBlock[6] = v44;
    *(CGFloat *)&aBlock[7] = v46;
    *(CGFloat *)&aBlock[8] = v48;
    *(double *)&void aBlock[9] = v52;
    *(double *)&aBlock[10] = v53;
    v57 = (void (**)(void))_Block_copy(aBlock);
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_105;
    v59[3] = &unk_1E52DC3A0;
    v59[4] = self;
    v58 = (void (**)(void *, uint64_t))_Block_copy(v59);
    if (v7)
    {
      +[UIView animateWithDuration:v57 animations:v58 completion:0.23];
    }
    else
    {
      v57[2](v57);
      v58[2](v58, 1);
    }
  }
  else
  {
    [v15 addSubview:self->_popoverView];
    [(UIPopoverController *)self _setPresentationState:2];
  }
  [(UIView *)self->_popoverView layoutBelowIfNeeded];
}

uint64_t __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 128);
  [*(id *)(a1 + 48) contentViewInsets];
  objc_msgSend(v2, "setContentInset:");
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 128);
  [*(id *)(a1 + 48) arrowHeight];
  objc_msgSend(v3, "setArrowHeight:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setPreferredContentSize:", *(double *)(*(void *)(a1 + 32) + 144), *(double *)(*(void *)(a1 + 32) + 152));
  [*(id *)(*(void *)(a1 + 32) + 128) setPreferredArrowDirections:*(void *)(a1 + 56)];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 128);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v4, "setContainingFrame:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setContainingFrameInsets:", *(double *)(*(void *)(a1 + 32) + 448), *(double *)(*(void *)(a1 + 32) + 456), *(double *)(*(void *)(a1 + 32) + 464), *(double *)(*(void *)(a1 + 32) + 472));
  BOOL v5 = *(void **)(*(void *)(a1 + 32) + 128);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);
  double v9 = *(double *)(a1 + 88);
  return objc_msgSend(v5, "setSourceViewRect:", v6, v7, v8, v9);
}

uint64_t __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_popoverViewClass")), "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:", *(void *)(a1 + 72), 1, 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setPopoverController:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setArrowDirection:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "arrowDirection"));
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(v5 + 32);
  objc_msgSend(*(id *)(a1 + 72), "_contentViewCornerRadiusForArrowDirection:", objc_msgSend(*(id *)(v5 + 128), "arrowDirection"));
  objc_msgSend(v6, "_setCornerRadius:");
  uint64_t v7 = *(void *)(a1 + 32);
  double v8 = *(void **)(v7 + 32);
  [*(id *)(v7 + 128) offset];
  objc_msgSend(v8, "setArrowOffset:");
  [*(id *)(a1 + 32) _setPopoverBackgroundStyle:*(void *)(*(void *)(a1 + 32) + 112)];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 32);
  uint64_t v11 = *(void *)(v9 + 120);
  return [v10 setPopoverBackgroundColor:v11];
}

void __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:1.0];
  if (*(unsigned char *)(a1 + 88))
  {
    LODWORD(v2) = 1058536130;
    LODWORD(v3) = 1039604887;
    LODWORD(v4) = 1044467595;
    LODWORD(v5) = 1070230353;
    id v14 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v2 :v3 :v4 :v5];
    double v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale"];
    [v6 setTimingFunction:v14];
    [v6 setFromValue:&unk_1ED3F1B98];
    [v6 setToValue:&unk_1ED3F3990];
    [v6 setRemovedOnCompletion:1];
    [v6 setDuration:UIAnimationDragCoefficient() * 0.23];
    uint64_t v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position"];
    [v7 setTimingFunction:v14];
    objc_msgSend(*(id *)(a1 + 32), "_centerPointForScale:frame:anchor:", 0.699999988, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    double v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:");
    [v7 setFromValue:v8];

    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    id v10 = [*(id *)(*(void *)(a1 + 32) + 32) layer];
    [v10 position];
    uint64_t v11 = objc_msgSend(v9, "valueWithCGPoint:");
    [v7 setToValue:v11];

    [v7 setRemovedOnCompletion:1];
    [v7 setDuration:UIAnimationDragCoefficient() * 0.23];
    double v12 = [*(id *)(*(void *)(a1 + 32) + 32) layer];
    [v12 addAnimation:v6 forKey:@"bounce"];

    id v13 = [*(id *)(*(void *)(a1 + 32) + 32) layer];
    [v13 addAnimation:v7 forKey:@"center"];
  }
}

void __125__UIPopoverController__presentPopoverFromRect_embeddedInView_usingViewForLayoutConstraints_permittedArrowDirections_animate___block_invoke_105(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPresentationState:2];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained popoverController:*(void *)(a1 + 32) animationCompleted:0];
  }
}

- (void)_presentPopoverFromRect:(CGRect)a3 embeddedInView:(id)a4 usingViewForLayoutConstraints:(id)a5 permittedArrowDirections:(unint64_t)a6
{
}

- (CGPoint)_centerPointForScale:(double)a3 frame:(CGRect)a4 anchor:(CGPoint)a5
{
  double v5 = round(a4.origin.x + a4.size.width * 0.5 * a3 - (a3 + -1.0) * a5.x);
  double v6 = a4.size.height * 0.5 * a3 + round(a4.origin.y - (a3 + -1.0) * a5.y);
  double v7 = v5;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (BOOL)_shimPresentSlidingPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  vendedGestureRecognizer = [(UIPopoverController *)self _managingSplitViewController];
  double v6 = vendedGestureRecognizer;
  if (vendedGestureRecognizer && self->_popoverControllerStyle == 1)
  {
    if (self->_vendedGestureRecognizer) {
      vendedGestureRecognizer = self->_vendedGestureRecognizer;
    }
    double v7 = [vendedGestureRecognizer view];
    if (self->_vendedGestureRecognizer) {
      unint64_t presentationEdge = self->_presentationEdge;
    }
    else {
      unint64_t presentationEdge = 2;
    }
    [(UIPopoverController *)self _presentPopoverFromEdge:presentationEdge ofView:v7 animated:v3];

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_commonPresentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v78[1] = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  if ([(UIPopoverController *)self _shimPresentSlidingPopoverAnimated:v6]) {
    goto LABEL_34;
  }
  if (self->_popoverControllerStyle)
  {
    double v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2 object:self file:@"UIPopoverController.m" lineNumber:1039 description:@"This method is only supported for fading popovers"];
  }
  if (a5 == -1)
  {
    id v16 = (void *)MEMORY[0x1E4F1CA00];
    BOOL v17 = _NSFullMethodName();
    [v16 raise:*MEMORY[0x1E4F1C3C8], @"%@: Popovers cannot be presented with UIPopoverArrowDirectionUnknown.", v17 format];
  }
  uint64_t v18 = [v15 window];
  if (!v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    CGFloat v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = _NSFullMethodName();
    [v19 raise:*MEMORY[0x1E4F1C3C8], @"%@: Popovers cannot be presented from a view which does not have a window.", v18 format];
  }

LABEL_10:
  if (![(UIPopoverController *)self isPresentingOrDismissing])
  {
    if (width < 1.0 || height < 1.0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke;
      block[3] = &unk_1E52D9CD0;
      block[4] = self;
      block[5] = a2;
      if (_commonPresentPopoverFromRect_inView_permittedArrowDirections_animated__onceToken != -1) {
        dispatch_once(&_commonPresentPopoverFromRect_inView_permittedArrowDirections_animated__onceToken, block);
      }
      if (width < 2.0) {
        double width = 2.0;
      }
      if (height < 2.0) {
        double height = 2.0;
      }
    }
    objc_storeStrong((id *)&self->_currentPresentationView, a4);
    self->_currentPresentationRectInView.origin.double x = x;
    self->_currentPresentationRectInView.origin.double y = y;
    self->_currentPresentationRectInView.size.double width = width;
    self->_currentPresentationRectInView.size.double height = height;
    self->_originalArrowDirections = a5;
    [(UIPopoverController *)self _setPresentationState:1];
    self->_requestedArrowDirections = a5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v15;
    }
    else
    {
      id v20 = [v15 window];
    }
    double v53 = v20;
    if ([v20 _isTextEffectsWindow]) {
      *(unsigned char *)&self->_popoverControllerFlags |= 8u;
    }
    double v52 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v52 postNotificationName:@"_UIAlertWillAppearNotification" object:self userInfo:0];
    v77 = @"UIPopoverControllerPresentingWindowKey";
    v78[0] = v53;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
    [v52 postNotificationName:@"UIPopoverControllerWillPresentPopoverNotification" object:self userInfo:v21];

    if (self->_popoverView)
    {
      [(UIPopoverController *)self _layoutDimmingViewForInterfaceOrientationOfHostingWindow:v53];
      objc_msgSend(v15, "convertRect:toView:", self->_dimmingView, x, y, width, height);
      self->_targetRectInDimmingView.origin.double x = v22;
      self->_targetRectInDimmingView.size.double height = v23;
      self->_targetRectInDimmingView.origin.double y = v24;
      self->_targetRectInDimmingView.size.double width = v25;
      preferredLayoutInfo = self->_preferredLayoutInfo;
      [(UIView *)self->_dimmingView bounds];
      -[_UIPopoverLayoutInfo setContainingFrame:](preferredLayoutInfo, "setContainingFrame:");
      -[_UIPopoverLayoutInfo setSourceViewRect:](self->_preferredLayoutInfo, "setSourceViewRect:", self->_targetRectInDimmingView.origin.x, self->_targetRectInDimmingView.origin.y, self->_targetRectInDimmingView.size.width, self->_targetRectInDimmingView.size.height);
      [(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo setPreferredArrowDirections:a5];
      CGFloat v27 = [(UIPopoverController *)self _layoutInfoForCurrentKeyboardState];
      -[_UIPopoverLayoutInfo setPreferredArrowDirections:](self->_preferredLayoutInfo, "setPreferredArrowDirections:", [v27 arrowDirection]);
      unint64_t v28 = [(_UIPopoverView *)self->_popoverView arrowDirection];
      BOOL v29 = v28 != [v27 arrowDirection];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_2;
      v73[3] = &unk_1E52DC3D0;
      BOOL v75 = v29;
      v73[4] = self;
      id v74 = v27;
      id v30 = v27;
      +[UIView performWithoutAnimation:v73];
      [(UIPopoverController *)self _setPresentationState:2];
    }
    else
    {
      if (self->_retainsSelfWhilePresented) {
        objc_storeStrong((id *)&self->_retainedSelf, self);
      }
      [(UIPopoverController *)self _layoutDimmingViewForInterfaceOrientationOfHostingWindow:v53];
      [v53 addSubview:self->_dimmingView];
      objc_msgSend(v15, "convertRect:toView:", self->_dimmingView, x, y, width, height);
      self->_targetRectInDimmingView.origin.double x = v31;
      self->_targetRectInDimmingView.origin.double y = v32;
      self->_targetRectInDimmingView.size.double width = v33;
      self->_targetRectInDimmingView.size.double height = v34;
      uint64_t popoverBackgroundViewClass = self->_popoverBackgroundViewClass;
      if (!popoverBackgroundViewClass) {
        uint64_t popoverBackgroundViewClass = [(UIPopoverController *)self _defaultChromeViewClass];
      }
      uint64_t v36 = (_UIPopoverLayoutInfo *)objc_alloc_init([(UIPopoverController *)self _popoverLayoutInfoForChromeClass:popoverBackgroundViewClass]);
      v37 = self->_preferredLayoutInfo;
      self->_preferredLayoutInfo = v36;

      id v38 = self->_preferredLayoutInfo;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_3;
      v69[3] = &unk_1E52E9170;
      v69[4] = self;
      double v71 = popoverBackgroundViewClass;
      unint64_t v72 = a5;
      id v39 = v53;
      id v70 = v39;
      [(_UIPopoverLayoutInfo *)v38 updateProperties:v69];
      id v40 = [(UIPopoverController *)self _layoutInfoForCurrentKeyboardStateAndHostingWindow:v39];
      -[_UIPopoverLayoutInfo setPreferredArrowDirections:](self->_preferredLayoutInfo, "setPreferredArrowDirections:", [v40 arrowDirection]);
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_4;
      v66[3] = &unk_1E52E7AB0;
      v66[4] = self;
      id v41 = v40;
      id v67 = v41;
      uint64_t v68 = popoverBackgroundViewClass;
      +[UIView performWithoutAnimation:v66];
      [(UIPopoverController *)self _transitionFromViewController:0 toViewController:self->_contentViewController animated:0];
      [(UIPopoverController *)self _startWatchingForKeyboardNotificationsIfNecessary];
      v64[0] = 0;
      v64[1] = v64;
      v64[2] = 0x3032000000;
      v64[3] = __Block_byref_object_copy__55;
      v64[4] = __Block_byref_object_dispose__55;
      double v65 = self->_popoverView;
      v62[0] = 0;
      v62[1] = v62;
      v62[2] = 0x3032000000;
      v62[3] = __Block_byref_object_copy__55;
      v62[4] = __Block_byref_object_dispose__55;
      CGFloat v42 = self;
      double v63 = v42;
      [(UIView *)self->_popoverView setAlpha:0.0];
      [(UIView *)self->_dimmingView addSubview:self->_popoverView];
      double v43 = [(UIView *)self->_popoverView layer];
      [v43 setShouldRasterize:0];

      CGFloat v44 = [(UIView *)self->_popoverView layer];
      [v44 setAllowsGroupOpacity:0];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_5;
      aBlock[3] = &unk_1E52E1B98;
      BOOL v61 = v64;
      id v59 = v39;
      v60 = v42;
      double v45 = _Block_copy(aBlock);
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_6;
      v57[3] = &unk_1E52E9198;
      v57[4] = v42;
      v57[5] = v64;
      v57[6] = v62;
      CGFloat v46 = _Block_copy(v57);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_7;
      v54[3] = &unk_1E52DE9A0;
      id v47 = v45;
      id v55 = v47;
      id v48 = v46;
      id v56 = v48;
      +[UIView performWithoutAnimation:v54];

      if (v42->_showsTargetRect)
      {
        double v49 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", self->_targetRectInDimmingView.origin.x, self->_targetRectInDimmingView.origin.y, self->_targetRectInDimmingView.size.width, self->_targetRectInDimmingView.size.height);
        double v50 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.5 alpha:0.5];
        [(UIView *)v49 setBackgroundColor:v50];

        [(UIView *)v49 setTag:4277268721];
        [(UIView *)self->_dimmingView insertSubview:v49 below:self->_popoverView];
      }
      [(UIPopoverController *)v42 _startWatchingForWindowRotations];
      [(UIPopoverController *)v42 _startWatchingForScrollViewNotifications];

      _Block_object_dispose(v62, 8);
      _Block_object_dispose(v64, 8);
    }
  }
LABEL_34:
}

void __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke()
{
  _NSFullMethodName();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_TheRectPassedI.isa, v0);
}

uint64_t __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setArrowDirection:", objc_msgSend(*(id *)(a1 + 40), "arrowDirection"));
    double v2 = *(void **)(*(void *)(a1 + 32) + 32);
    BOOL v3 = [v2 backgroundView];
    objc_msgSend((id)objc_opt_class(), "_contentViewCornerRadiusForArrowDirection:", objc_msgSend(*(id *)(a1 + 40), "arrowDirection"));
    objc_msgSend(v2, "_setCornerRadius:");

    double v4 = *(void **)(*(void *)(a1 + 32) + 32);
    [*(id *)(a1 + 40) offset];
    objc_msgSend(v4, "setArrowOffset:");
  }
  double v5 = *(void **)(*(void *)(a1 + 32) + 32);
  [*(id *)(a1 + 40) frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [*(id *)(a1 + 40) offset];
  return objc_msgSend(v5, "_setFrame:arrowOffset:", v7, v9, v11, v13, v14);
}

void __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_3(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 128);
  [*(id *)(a1 + 48) contentViewInsets];
  objc_msgSend(v2, "setContentInset:");
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 128);
  [*(id *)(a1 + 48) arrowHeight];
  objc_msgSend(v3, "setArrowHeight:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setPreferredContentSize:", *(double *)(*(void *)(a1 + 32) + 144), *(double *)(*(void *)(a1 + 32) + 152));
  [*(id *)(*(void *)(a1 + 32) + 128) setPreferredArrowDirections:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 128);
  [*(id *)(v4 + 40) bounds];
  objc_msgSend(v5, "setContainingFrame:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setContainingFrameInsets:", *(double *)(*(void *)(a1 + 32) + 448), *(double *)(*(void *)(a1 + 32) + 456), *(double *)(*(void *)(a1 + 32) + 464), *(double *)(*(void *)(a1 + 32) + 472));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setSourceViewRect:", *(double *)(*(void *)(a1 + 32) + 160), *(double *)(*(void *)(a1 + 32) + 168), *(double *)(*(void *)(a1 + 32) + 176), *(double *)(*(void *)(a1 + 32) + 184));
  double v6 = *(void **)(a1 + 40);
  double v7 = *(void **)(*(void *)(a1 + 32) + 128);
  id v8 = [v6 windowScene];
  objc_msgSend(v7, "setPreferLandscapeOrientations:", (unint64_t)(objc_msgSend(v8, "interfaceOrientation") - 3) < 0xFFFFFFFFFFFFFFFELL);
}

uint64_t __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_4(id *a1)
{
  id v2 = objc_alloc((Class)[(id)objc_opt_class() _popoverViewClass]);
  [a1[5] frame];
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:backgroundViewClass:", a1[6]);
  uint64_t v4 = a1[4];
  double v5 = (void *)v4[4];
  v4[4] = v3;

  objc_msgSend(*((id *)a1[4] + 4), "setPopoverController:");
  objc_msgSend(*((id *)a1[4] + 4), "setArrowDirection:", objc_msgSend(a1[5], "arrowDirection"));
  double v6 = (void *)*((void *)a1[4] + 4);
  [a1[5] offset];
  objc_msgSend(v6, "setArrowOffset:");
  objc_msgSend(*((id *)a1[4] + 4), "setArrowDirection:", objc_msgSend(a1[5], "arrowDirection"));
  double v7 = (void *)*((void *)a1[4] + 4);
  objc_msgSend(a1[6], "_contentViewCornerRadiusForArrowDirection:", objc_msgSend(a1[5], "arrowDirection"));
  objc_msgSend(v7, "_setCornerRadius:");
  [a1[4] _setPopoverBackgroundStyle:*((void *)a1[4] + 14)];
  id v8 = a1[4];
  double v9 = (void *)v8[4];
  uint64_t v10 = v8[15];
  return [v9 setPopoverBackgroundColor:v10];
}

uint64_t __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_5(void *a1)
{
  [*(id *)(*(void *)(a1[6] + 8) + 40) setAlpha:1.0];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 _beginOcclusion:v3];
}

void __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) layer];
  [v2 setShouldRasterize:0];

  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) layer];
  [v3 setAllowsGroupOpacity:1];

  [*(id *)(a1 + 32) _setPresentationState:2];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained popoverController:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) animationCompleted:0];
  }
}

uint64_t __94__UIPopoverController__commonPresentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (BOOL)_shimPopoverPresentationController
{
  if ((*(unsigned char *)&self->_popoverControllerFlags & 0x10) != 0 || self->_popoverControllerStyle == 1)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    int v2 = _UIAppUseModernRotationAndPresentationBehaviors();
    if (v2) {
      LOBYTE(v2) = [(id)objc_opt_class() _useLegacyPopoverControllers] ^ 1;
    }
  }
  return v2;
}

- (void)_setupPresentationController
{
  if (self->_passthroughViews) {
    -[UIPopoverPresentationController setPassthroughViews:](self->_presentationController, "setPassthroughViews:");
  }
  if (self->_backgroundColor) {
    -[UIPopoverPresentationController setBackgroundColor:](self->_presentationController, "setBackgroundColor:");
  }
  [(UIPresentationController *)self->_presentationController setDelegate:self];
  [(UIPopoverPresentationController *)self->_presentationController setPopoverBackgroundViewClass:[(UIPopoverController *)self popoverBackgroundViewClass]];
  presentationController = self->_presentationController;
  [(UIPopoverController *)self popoverContentSize];
  -[UIPopoverPresentationController setPopoverContentSize:animated:](presentationController, "setPopoverContentSize:animated:", 0);
  uint64_t v4 = self->_presentationController;
  double top = self->_popoverLayoutMargins.top;
  double left = self->_popoverLayoutMargins.left;
  double bottom = self->_popoverLayoutMargins.bottom;
  double right = self->_popoverLayoutMargins.right;
  -[UIPopoverPresentationController setPopoverLayoutMargins:](v4, "setPopoverLayoutMargins:", top, left, bottom, right);
}

- (void)_presentShimmedPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  double v14 = [v13 _viewControllerForAncestor];
  [(UIViewController *)self->_contentViewController setModalPresentationStyle:7];
  id v15 = [(UIViewController *)self->_contentViewController popoverPresentationController];
  if ([v15 dismissed])
  {
    if (!self->_allowsPopoverPresentationToAdapt) {
      [v15 setDelegate:self];
    }
    [(UIPopoverController *)self _setPresentationController:v15];
    -[UIPresentationController setSourceRect:](self->_presentationController, "setSourceRect:", x, y, width, height);
    [(UIPresentationController *)self->_presentationController setSourceView:v13];
    [(UIPopoverPresentationController *)self->_presentationController setPermittedArrowDirections:a5];
    [(UIPopoverController *)self _setupPresentationController];
    [v14 presentViewController:self->_contentViewController animated:v6 completion:0];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__UIPopoverController__presentShimmedPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke;
    block[3] = &unk_1E52D9F70;
    id v17 = v15;
    if (_presentShimmedPopoverFromRect_inView_permittedArrowDirections_animated__once != -1) {
      dispatch_once(&_presentShimmedPopoverFromRect_inView_permittedArrowDirections_animated__once, block);
    }
  }
}

void __95__UIPopoverController__presentShimmedPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIPopoverControllerPresentingWindowKey_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Application tried to represent an active popover presentation: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)presentPopoverFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
  BOOL v6 = animated;
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  id v13 = view;
  if ([(UIPopoverController *)self _shimPopoverPresentationController])
  {
    double v14 = [(UIView *)v13 _viewControllerForAncestor];
    id v15 = [v14 transitionCoordinator];

    if (v15)
    {
      *(unsigned char *)&self->_popoverControllerFlags |= 0x40u;
      id v16 = [v14 transitionCoordinator];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __87__UIPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke;
      v17[3] = &unk_1E52E91E8;
      v17[4] = self;
      double v19 = x;
      double v20 = y;
      double v21 = width;
      double v22 = height;
      uint64_t v18 = v13;
      UIPopoverArrowDirection v23 = arrowDirections;
      BOOL v24 = v6;
      [v16 animateAlongsideTransition:0 completion:v17];
    }
    else
    {
      -[UIPopoverController _presentShimmedPopoverFromRect:inView:permittedArrowDirections:animated:](self, "_presentShimmedPopoverFromRect:inView:permittedArrowDirections:animated:", v13, arrowDirections, v6, x, y, width, height);
    }
  }
  else
  {
    -[UIPopoverController _commonPresentPopoverFromRect:inView:permittedArrowDirections:animated:](self, "_commonPresentPopoverFromRect:inView:permittedArrowDirections:animated:", v13, arrowDirections, v6, x, y, width, height);
  }
}

void __87__UIPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 350000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__UIPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_2;
  v7[3] = &unk_1E52E91C0;
  uint64_t v3 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 64);
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v10 = v4;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 80);
  id v8 = v5;
  uint64_t v11 = v6;
  char v12 = *(unsigned char *)(a1 + 88);
  dispatch_after(v2, MEMORY[0x1E4F14428], v7);
}

unsigned char *__87__UIPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke_2(uint64_t a1)
{
  CGPoint result = *(unsigned char **)(a1 + 32);
  if ((result[416] & 0x40) != 0)
  {
    CGPoint result = (unsigned char *)objc_msgSend(result, "_presentShimmedPopoverFromRect:inView:permittedArrowDirections:animated:", *(void *)(a1 + 40), *(void *)(a1 + 80), *(unsigned __int8 *)(a1 + 88), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    *(unsigned char *)(*(void *)(a1 + 32) + 416) &= ~0x40u;
  }
  return result;
}

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
  BOOL v5 = animated;
  v67[1] = *MEMORY[0x1E4F143B8];
  long long v9 = item;
  if (![(UIPopoverController *)self _shimPresentSlidingPopoverAnimated:v5])
  {
    if ([(UIPopoverController *)self _shimPopoverPresentationController])
    {
      long long v10 = [(UIBarButtonItem *)v9 view];
      uint64_t v11 = [v10 _viewControllerForAncestor];

      [(UIViewController *)self->_contentViewController setModalPresentationStyle:7];
      char v12 = [(UIViewController *)self->_contentViewController popoverPresentationController];
      [(UIPopoverController *)self _setPresentationController:v12];

      [(UIPresentationController *)self->_presentationController setBarButtonItem:v9];
      [(UIPopoverPresentationController *)self->_presentationController setPermittedArrowDirections:arrowDirections];
      [(UIPopoverController *)self _setupPresentationController];
      [v11 presentViewController:self->_contentViewController animated:v5 completion:0];
    }
    else
    {
      BOOL v61 = v5;
      if (arrowDirections == -1)
      {
        id v13 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v14 = *MEMORY[0x1E4F1C3C8];
        id v15 = _NSFullMethodName();
        [v13 raise:v14, @"%@: Popovers cannot be presented with UIPopoverArrowDirectionUnknown.", v15 format];
      }
      uint64_t v16 = [(UIBarButtonItem *)v9 view];
      if (!v16) {
        goto LABEL_8;
      }
      id v17 = (void *)v16;
      uint64_t v18 = [(UIBarButtonItem *)v9 view];
      double v19 = [v18 superview];

      if (!v19)
      {
LABEL_8:
        double v20 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v21 = *MEMORY[0x1E4F1C3C8];
        double v22 = _NSFullMethodName();
        [v20 raise:v21, @"%@: Popovers cannot be presented from a view which does not have a window.", v22 format];
      }
      UIPopoverArrowDirection v23 = [(UIBarButtonItem *)v9 view];
      [v23 bounds];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;

      double v32 = (v31 + -1.0) / 3.0;
      if (v32 > 5.0) {
        double v32 = 5.0;
      }
      double v33 = floor(v32);
      double v34 = (v29 + -1.0) / 3.0;
      if (v34 > 5.0) {
        double v34 = 5.0;
      }
      double v35 = floor(v34);
      double v36 = v33 + v33;
      double v37 = v35 + v35;
      double v38 = v35 + v35 + v35;
      double v39 = v33 + v33 + v33;
      id v40 = [(UIBarButtonItem *)v9 view];
      id v41 = [v40 superview];
      CGFloat v42 = [v41 subviews];
      double v43 = [(UIBarButtonItem *)v9 view];
      v67[0] = v43;
      CGFloat v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
      double v45 = [v42 arrayByExcludingObjectsInArray:v44];

      if ([v45 count])
      {
        CGFloat v46 = [(UIPopoverController *)self passthroughViews];
        uint64_t v47 = [v46 count];

        if (v47)
        {
          char v60 = arrowDirections;
          id v48 = [(UIPopoverController *)self passthroughViews];
          double v49 = (void *)[v48 mutableCopy];

          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          double v50 = v45;
          id v51 = v45;
          uint64_t v52 = [v51 countByEnumeratingWithState:&v62 objects:v66 count:16];
          if (v52)
          {
            uint64_t v53 = v52;
            uint64_t v54 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v53; ++i)
              {
                if (*(void *)v63 != v54) {
                  objc_enumerationMutation(v51);
                }
                uint64_t v56 = *(void *)(*((void *)&v62 + 1) + 8 * i);
                if (([v49 containsObject:v56] & 1) == 0) {
                  [v49 addObject:v56];
                }
              }
              uint64_t v53 = [v51 countByEnumeratingWithState:&v62 objects:v66 count:16];
            }
            while (v53);
          }

          [(UIPopoverController *)self setPassthroughViews:v49];
          LOBYTE(arrowDirections) = v60;
          double v45 = v50;
        }
        else
        {
          [(UIPopoverController *)self setPassthroughViews:v45];
        }
      }
      double v57 = v25 + v37;
      UIPopoverArrowDirection v58 = arrowDirections & 3;
      if (self->_targetBarButtonItem != v9) {
        objc_storeStrong((id *)&self->_targetBarButtonItem, item);
      }
      id v59 = [(UIBarButtonItem *)v9 view];
      -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v59, v58, v61, v57, v27 + v36, v29 - v38, v31 - v39);
    }
  }
}

- (void)dismissPopoverAnimated:(BOOL)animated
{
  BOOL v3 = animated;
  *(unsigned char *)&self->_popoverControllerFlags &= ~0x40u;
  if ([(UIPopoverController *)self isPopoverVisible])
  {
    if (![(UIPopoverController *)self _shimPopoverPresentationController]
      || ([(UIPopoverController *)self _presentationController],
          BOOL v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v5 dismissing],
          v5,
          (v6 & 1) == 0))
    {
      double v7 = [(UIPopoverController *)self _managingSplitViewController];
      if (![(UIPopoverController *)self _shimPopoverPresentationController] || v7)
      {
        if (!v7 || ([v7 _isRotating] & 1) == 0) {
          [(UIPopoverController *)self _dismissPopoverAnimated:v3 stateOnly:0 notifyDelegate:0];
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_retainedSelf, self);
        id v8 = [(UIPopoverController *)self _presentationController];
        long long v9 = [v8 presentingViewController];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __46__UIPopoverController_dismissPopoverAnimated___block_invoke;
        v10[3] = &unk_1E52D9F70;
        v10[4] = self;
        [v9 dismissViewControllerAnimated:v3 completion:v10];
      }
    }
  }
}

void __46__UIPopoverController_dismissPopoverAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_time_t v2 = *(void **)(v1 + 400);
  *(void *)(v1 + 400) = 0;
}

- (id)popoverView
{
  return self->_popoverView;
}

- (void)_setPopoverView:(id)a3
{
  BOOL v5 = (_UIPopoverView *)a3;
  popoverView = self->_popoverView;
  if (popoverView != v5)
  {
    double v7 = v5;
    [(_UIPopoverView *)popoverView setPopoverController:0];
    objc_storeStrong((id *)&self->_popoverView, a3);
    [(_UIPopoverView *)self->_popoverView setPopoverController:self];
    BOOL v5 = v7;
  }
}

- (void)_setSplitParentController:(id)a3
{
}

- (id)_splitParentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_splitParentController);
  return WeakRetained;
}

- (CGSize)_currentPopoverContentSize
{
  popoverView = self->_popoverView;
  if (popoverView)
  {
    BOOL v3 = [(_UIPopoverView *)popoverView contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (double)_presentationAnimationDuration
{
  return dbl_186B94100[self->_popoverControllerStyle == 1];
}

- (void)_updateDimmingViewTransformForInterfaceOrientationOfHostingWindow:(id)a3
{
  id v4 = a3;
  if (([v4 _isHostedInAnotherProcess] & 1) == 0
    && !+[UIWindow _transformLayerRotationsAreEnabled])
  {
    uint64_t v5 = [v4 interfaceOrientation];
    dimmingView = self->_dimmingView;
    switch(v5)
    {
      case 1:
        double v7 = 0.0;
        break;
      case 3:
        double v7 = 1.57079633;
        break;
      case 4:
        double v7 = -1.57079633;
        break;
      default:
        double v7 = 3.14159265;
        if (v5 != 2) {
          double v7 = 0.0;
        }
        break;
    }
    CGAffineTransformMakeRotation(&v8, v7);
    *(float64x2_t *)&v8.a = vrndaq_f64(*(float64x2_t *)&v8.a);
    *(float64x2_t *)&v8.c = vrndaq_f64(*(float64x2_t *)&v8.c);
    *(float64x2_t *)&v8.tdouble x = vrndaq_f64(*(float64x2_t *)&v8.tx);
    CGAffineTransform v9 = v8;
    -[UIView setTransform:](dimmingView, "setTransform:", &v9, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
  }
}

- (void)_layoutDimmingViewForInterfaceOrientationOfHostingWindow:(id)a3
{
  id v4 = a3;
  [(UIPopoverController *)self _updateDimmingViewTransformForInterfaceOrientationOfHostingWindow:v4];
  dimmingView = self->_dimmingView;
  [v4 bounds];
  double v7 = v6;
  [v4 bounds];
  double v9 = v8;

  -[UIView setFrame:](dimmingView, "setFrame:", 0.0, 0.0, v7, v9);
}

- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  long long v10 = a4;
  id v11 = (id)[v10 view];
  if (self->_popoverContentSize.width == *MEMORY[0x1E4F1DB30]
    && self->_popoverContentSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [v10 _resolvedPreferredContentSize];
    self->_popoverContentSize.double width = v13;
    self->_popoverContentSize.double height = v14;
  }
  popoverView = self->_popoverView;
  if (popoverView)
  {
    BOOL v43 = v5;
    uint64_t v16 = [(_UIPopoverView *)popoverView contentView];
    id v17 = [v10 _viewForContentInPopover];
    uint64_t v18 = [v9 _viewForContentInPopover];
    [v16 bounds];
    CGFloat v44 = v17;
    objc_msgSend(v17, "setFrame:");
    double v19 = -[UIViewController _parentViewController]((id *)v10);

    if (!v19)
    {
LABEL_15:
      [v10 _willBecomeContentViewControllerOfPopover:self];
      [v9 _willResignContentViewControllerOfPopover:self];
      double height = self->_popoverContentSize.height;
      BOOL v28 = height == 1137.0 || height == 1100.0;
      if (self->_popoverContentSize.width == 320.0 && v28)
      {
        [(UIViewController *)self->_contentViewController _resolvedPreferredContentSize];
        self->_popoverContentSize.double width = v29;
        self->_popoverContentSize.double height = v30;
      }
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke;
      v54[3] = &unk_1E52D9F98;
      double v31 = v10;
      id v55 = v31;
      id v32 = v16;
      id v56 = v32;
      +[UIView performWithoutAnimation:v54];
      double v33 = [v9 _popoverController];
      BOOL v34 = v33 == self;

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke_2;
      aBlock[3] = &unk_1E52D9F98;
      double v35 = v31;
      id v52 = v35;
      id v36 = v18;
      id v53 = v36;
      double v37 = (void (**)(void))_Block_copy(aBlock);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke_3;
      v45[3] = &unk_1E52E7A38;
      BOOL v50 = v34;
      id v38 = v36;
      id v46 = v38;
      uint64_t v47 = v35;
      id v48 = self;
      id v49 = v9;
      double v39 = (void (**)(void *, uint64_t))_Block_copy(v45);
      if (v43)
      {
        [(UIPopoverController *)self _presentationAnimationDuration];
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v37, v39);
      }
      else
      {
        v37[2](v37);
        v39[2](v39, 1);
      }

      goto LABEL_25;
    }
    double v20 = [v10 _existingView];
    uint64_t v21 = [v20 window];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_splitParentController);
    if (WeakRetained)
    {
      id v23 = objc_loadWeakRetained((id *)&self->_splitParentController);
      -[UIViewController _parentViewController]((id *)v10);
      id v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v23 == v24)
      {
        if (!v10) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      id v41 = [MEMORY[0x1E4F28B00] currentHandler];
      SEL v42 = a2;
      id v40 = v41;
      [v41 handleFailureInMethod:v42 object:self file:@"UIPopoverController.m" lineNumber:1429 description:@"Preexisting parent controller doesn't match parent of incoming view controller"];
    }
    else
    {
      id v40 = -[UIViewController _parentViewController]((id *)v10);
      objc_storeWeak((id *)&self->_splitParentController, v40);
    }

    if (!v10)
    {
LABEL_13:
      if (v21)
      {
        [v10 setPerformingModalTransition:1];
        double v26 = [v10 _existingView];
        [v26 removeFromSuperview];

        [v10 setPerformingModalTransition:0];
      }
      goto LABEL_15;
    }
LABEL_12:
    __int16 v25 = v10[192];
    v10[192] = v25 | 0x100;
    [v10 setParentViewController:0];
    v10[192] = v10[192] & 0xFEFF | v25 & 0x100;
    goto LABEL_13;
  }
LABEL_25:
  [(UIPopoverController *)self _containedViewControllerModalStateChanged];
}

void __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) _viewForContentInPopover];
  [v2 setAlpha:0.0];

  BOOL v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) _viewForContentInPopover];
  [v3 addSubview:v4];
}

uint64_t __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) _viewForContentInPopover];
  [v2 setAlpha:1.0];

  BOOL v3 = *(void **)(a1 + 40);
  return [v3 setAlpha:0.0];
}

uint64_t __79__UIPopoverController__transitionFromViewController_toViewController_animated___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) removeFromSuperview];
  }
  [*(id *)(a1 + 40) _didBecomeContentViewControllerOfPopover:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 48);
  dispatch_time_t v2 = *(void **)(a1 + 56);
  return [v2 _didResignContentViewControllerOfPopover:v3];
}

- (void)_performHierarchyCheckOnViewController:(id)a3
{
  double v6 = (id *)a3;
  id v4 = -[UIViewController _parentViewController](v6);
  if (v4)
  {
    uint64_t v3 = -[UIViewController _parentViewController](v6);
    if (([v3 _optsOutOfPopoverControllerHierarchyCheck] & 1) == 0)
    {

LABEL_7:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"The content view controller argument must be the root of its associated view controller hierarchy."];
      goto LABEL_8;
    }
  }
  BOOL v5 = [v6 _parentModalViewController];

  if (v4)
  {
  }
  if (v5) {
    goto LABEL_7;
  }
LABEL_8:
}

- (int64_t)_popoverControllerStyle
{
  return self->_popoverControllerStyle;
}

- (BOOL)_manuallyHandlesContentViewControllerAppearanceCalls
{
  return self->_popoverControllerStyle == 1;
}

- (void)_setPopoverBackgroundStyle:(int64_t)a3
{
  self->_popoverBackgroundStyle = a3;
  popoverView = self->_popoverView;
  if (popoverView) {
    -[_UIPopoverView setBackgroundStyle:](popoverView, "setBackgroundStyle:");
  }
}

- (int64_t)_popoverBackgroundStyle
{
  return self->_popoverBackgroundStyle;
}

- (void)_setContentViewController:(id)a3 backgroundStyle:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  self->_popoverBackgroundStyle = a4;
  uint64_t v12 = 0;
  CGFloat v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__55;
  uint64_t v16 = __Block_byref_object_dispose__55;
  id v9 = self;
  id v17 = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__UIPopoverController__setContentViewController_backgroundStyle_animated___block_invoke;
  v11[3] = &unk_1E52E7A10;
  v11[4] = &v12;
  v11[5] = a4;
  long long v10 = (void (**)(void))_Block_copy(v11);
  [(id)v13[5] setContentViewController:v8 animated:v5];
  if (v5)
  {
    [(UIPopoverController *)v9 _presentationAnimationDuration];
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v10, 0);
  }
  else
  {
    v10[2](v10);
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __74__UIPopoverController__setContentViewController_backgroundStyle_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _setPopoverBackgroundStyle:*(void *)(a1 + 40)];
}

- (void)_beginMapsTransitionToNewViewController:(id)a3 newTargetRect:(CGRect)a4 inView:(id)a5 arrowDirections:(unint64_t)a6 slideDuration:(double)a7 expandDuration:(double)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v16 = a3;
  id v17 = a5;
  [v16 _resolvedPreferredContentSize];
  double v19 = v18;
  double v21 = v20;
  self->_targetRectInEmbeddingView.origin.double x = x;
  self->_targetRectInEmbeddingView.origin.double y = y;
  self->_targetRectInEmbeddingView.size.double width = width;
  self->_targetRectInEmbeddingView.size.double height = height;
  objc_msgSend(v17, "convertRect:toView:", self->_layoutConstraintView, x, y, width, height);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  CGFloat v30 = [(_UIPopoverView *)self->_popoverView backgroundView];
  [(id)objc_opt_class() _contentViewCornerRadiusForArrowDirection:a6];
  uint64_t v32 = v31;

  double v33 = (void *)[(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo copy];
  objc_msgSend(v33, "setPreferredContentSize:", v19, v21);
  [v33 setPreferredArrowDirections:a6];
  objc_msgSend(v33, "setSourceViewRect:", v23, v25, v27, v29);
  BOOL v34 = [(_UIPopoverView *)self->_popoverView backgroundView];
  objc_msgSend(v34, "_contentViewInsetsForArrowDirection:", objc_msgSend(v33, "arrowDirection"));
  objc_msgSend(v33, "setContentInset:");

  objc_msgSend(v33, "setPreferredArrowDirections:", objc_msgSend(v33, "arrowDirection"));
  [(UIPopoverController *)self setPreferredLayoutInfo:v33];
  layoutConstraintView = self->_layoutConstraintView;
  [v33 frame];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  CGFloat v44 = [(UIView *)self->_popoverView superview];
  -[UIView convertRect:toView:](layoutConstraintView, "convertRect:toView:", v44, v37, v39, v41, v43);
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;

  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke;
  v65[3] = &unk_1E52E69B8;
  v65[4] = self;
  uint64_t v67 = v46;
  uint64_t v68 = v48;
  uint64_t v69 = v50;
  uint64_t v70 = v52;
  id v66 = v33;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_2;
  v56[3] = &unk_1E52E9238;
  v56[4] = self;
  id v57 = v66;
  id v58 = v16;
  uint64_t v59 = v32;
  uint64_t v60 = v46;
  uint64_t v61 = v48;
  uint64_t v62 = v50;
  uint64_t v63 = v52;
  double v64 = a8;
  id v53 = v16;
  id v54 = v66;
  +[UIView animateWithDuration:133 delay:v65 options:v56 animations:a7 completion:0.0];
}

void __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained _popoverControllerWillBeginMapsTransitionMovingSideways:*(void *)(a1 + 32)];
  }
  [*(id *)(*(void *)(a1 + 32) + 32) frame];
  double v3 = v2;
  double v5 = v4;
  double v6 = *(double *)(a1 + 48);
  double v7 = *(double *)(a1 + 64);
  id v8 = [*(id *)(*(void *)(a1 + 32) + 32) backgroundView];
  [(id)objc_opt_class() arrowHeight];
  double v10 = v9;

  uint64_t v11 = [*(id *)(a1 + 40) arrowDirection];
  double v12 = v7 - v10;
  double v13 = v6 + v10;
  if (v11 == 8)
  {
    double v14 = v7 - v10;
  }
  else
  {
    double v13 = v6;
    double v14 = v7;
  }
  if (v11 == 4) {
    double v15 = v6;
  }
  else {
    double v15 = v13;
  }
  if (v11 == 4) {
    double v16 = v12;
  }
  else {
    double v16 = v14;
  }
  [*(id *)(*(void *)(a1 + 32) + 32) _hideArrow];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setFrame:", v15, v3, v16, v5);
}

void __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained _popoverControllerDidFinishMapsTransitionMovingSideways:*(void *)(a1 + 32)];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_3;
  v14[3] = &unk_1E52E9210;
  double v3 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v3;
  uint64_t v17 = *(void *)(a1 + 56);
  id v16 = *(id *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 80);
  long long v18 = *(_OWORD *)(a1 + 64);
  long long v19 = v4;
  +[UIView performWithoutAnimation:v14];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  uint64_t v11 = *(void *)(a1 + 96);
  long long v5 = *(_OWORD *)(a1 + 80);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = v5;
  block[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_4;
  block[3] = &unk_1E52E7998;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = WeakRetained;
  uint64_t v10 = v6;
  id v7 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) arrowDirection];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setArrowDirection:", objc_msgSend(*(id *)(a1 + 40), "arrowDirection"));
  double v3 = *(void **)(*(void *)(a1 + 32) + 32);
  [*(id *)(a1 + 40) offset];
  objc_msgSend(v3, "setArrowOffset:");
  [*(id *)(*(void *)(a1 + 32) + 32) _setCornerRadius:*(double *)(a1 + 56)];
  [*(id *)(a1 + 32) setContentViewController:*(void *)(a1 + 48) animated:0];
  [*(id *)(*(void *)(a1 + 32) + 32) frame];
  double v5 = v4;
  double v7 = v6;
  double v8 = *(double *)(a1 + 64);
  double v9 = *(double *)(a1 + 80);
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 32) backgroundView];
  [(id)objc_opt_class() arrowHeight];
  double v12 = v11;

  if (v2 == 1)
  {
    double v5 = v5 + v12;
    goto LABEL_5;
  }
  if (v2 == 2) {
LABEL_5:
  }
    double v7 = v7 - v12;
  long long v13 = *(void **)(*(void *)(a1 + 32) + 32);
  return objc_msgSend(v13, "setFrame:", v8, v5, v9, v7);
}

void __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_4(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_5;
  v11[3] = &unk_1E52E69B8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v4;
  long long v5 = *(_OWORD *)(a1 + 72);
  long long v14 = *(_OWORD *)(a1 + 56);
  long long v15 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_6;
  v8[3] = &unk_1E52DA660;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  uint64_t v10 = v7;
  +[UIView animateWithDuration:133 delay:v11 options:v8 animations:v2 completion:0.0];
}

uint64_t __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_5(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 32) _popoverControllerWillBeginMapsTransitionExpanding:*(void *)(a1 + 40)];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = *(void **)(*(void *)(a1 + 40) + 32);
  return [v2 _showArrow];
}

uint64_t __129__UIPopoverController__beginMapsTransitionToNewViewController_newTargetRect_inView_arrowDirections_slideDuration_expandDuration___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = [*(id *)(v3 + 16) view];
      [v4 bounds];
      *(void *)(v3 + 144) = v5;
      *(void *)(v3 + 152) = v6;

      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      return [v7 _popoverControllerDidFinishMapsTransitionExpanding:v8];
    }
  }
  return result;
}

- (void)_beginMapsTransitionToNewViewController:(id)a3 arrowDirections:(unint64_t)a4 slideDuration:(double)a5 expandDuration:(double)a6
{
  popoverView = self->_popoverView;
  id v11 = a3;
  id v12 = [(UIView *)popoverView superview];
  -[UIPopoverController _beginMapsTransitionToNewViewController:newTargetRect:inView:arrowDirections:slideDuration:expandDuration:](self, "_beginMapsTransitionToNewViewController:newTargetRect:inView:arrowDirections:slideDuration:expandDuration:", v11, v12, a4, self->_embeddedTargetRect.origin.x, self->_embeddedTargetRect.origin.y, self->_embeddedTargetRect.size.width, self->_embeddedTargetRect.size.height, a5, a6);
}

- (id)_completionBlockForDismissalWhenNotifyingDelegate:(BOOL)a3
{
  int v3 = a3;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (v3) {
    LOBYTE(v3) = objc_opt_respondsToSelector();
  }
  char v6 = objc_opt_respondsToSelector() & 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__UIPopoverController__completionBlockForDismissalWhenNotifyingDelegate___block_invoke;
  aBlock[3] = &unk_1E52E9260;
  objc_copyWeak(&v11, &location);
  char v12 = v3 & 1;
  char v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = _Block_copy(v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v8;
}

void __73__UIPopoverController__completionBlockForDismissalWhenNotifyingDelegate___block_invoke(uint64_t a1)
{
  double v2 = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained(v2 + 1);
  int v3 = v2[2];
  uint64_t v4 = [v2 _splitParentController];
  id v5 = v2[49];
  if (!v5 || [v5 state] != 1 && objc_msgSend(v2[49], "state") != 2) {
    [v2[5] removeFromSuperview];
  }
  if (v4)
  {
    char v6 = [v3 _popoverController];

    if (v2 == v6)
    {
      if (v3)
      {
        __int16 v8 = v3[192];
        v3[192] = v8 | 0x100;
        [v3 setParentViewController:v4];
        v3[192] = v3[192] & 0xFEFF | v8 & 0x100;
      }
    }
    else
    {
      uint64_t v7 = [v3 _popoverController];
      [v7 _setSplitParentController:v4];
    }
    id v9 = [v2 _managingSplitViewController];

    if (!v9) {
      [v2 _setSplitParentController:0];
    }
  }
  [v2[4] removeFromSuperview];
  [v3 _didResignContentViewControllerOfPopover:v2];
  if (*(unsigned char *)(a1 + 40)) {
    [WeakRetained popoverControllerDidDismissPopover:v2];
  }
  if (*(unsigned char *)(a1 + 41)) {
    [WeakRetained popoverController:v2 animationCompleted:1];
  }
  [v2 _setPresentationState:4];
  [v2 _setPopoverView:0];
  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"_UIAlertDidDisappearNotification" object:v2 userInfo:0];
  [v10 postNotificationName:@"UIPopoverControllerDidDismissPopoverNotification" object:v2 userInfo:0];
}

- (void)_postludeForDismissal
{
  [(UIPopoverController *)self setPreferredLayoutInfo:0];
  [(UIPopoverController *)self _stopWatchingForNotifications];
  if (self->_showsTargetRect)
  {
    int v3 = [(UIView *)self->_dimmingView viewWithTag:4277268721];
    [v3 removeFromSuperview];
  }
  if (self->_showsOrientationMarker)
  {
    uint64_t v4 = [(UIView *)self->_dimmingView viewWithTag:4277268722];
    [v4 removeFromSuperview];
  }
  if (self->_showsPresentationArea)
  {
    id v5 = [(UIView *)self->_dimmingView viewWithTag:4277268723];
    [v5 removeFromSuperview];
  }
  *(unsigned char *)&self->_popoverControllerFlags &= ~8u;
  if (self->_retainsSelfWhilePresented)
  {
    retainedSelf = self->_retainedSelf;
    self->_retainedSelf = 0;
  }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained popoverControllerShouldDismissPopover:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained popoverControllerDidDismissPopover:self];
  }
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained popoverController:self willRepositionPopoverToRect:a4 inView:a5];
  }
}

- (void)_dismissPopoverAnimated:(BOOL)a3 stateOnly:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  BOOL v6 = a5;
  BOOL v7 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = [(UIViewController *)self->_contentViewController childModalViewController];

  if (v9) {
    [(UIViewController *)self->_contentViewController dismissViewControllerAnimated:0 completion:0];
  }
  targetBarButtonItem = self->_targetBarButtonItem;
  if (targetBarButtonItem)
  {
    self->_targetBarButtonItem = 0;
  }
  layoutConstraintView = self->_layoutConstraintView;
  if (layoutConstraintView)
  {
    self->_layoutConstraintView = 0;
  }
  if ((![(UIPopoverController *)self isPresentingOrDismissing]
     || self->_popoverControllerStyle)
    && self->_popoverView)
  {
    if (self->_popoverControllerStyle)
    {
      unint64_t presentationEdge = self->_presentationEdge;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
      -[UIPopoverController _presentPopoverBySlidingIn:fromEdge:ofView:animated:stateOnly:notifyDelegate:](self, "_presentPopoverBySlidingIn:fromEdge:ofView:animated:stateOnly:notifyDelegate:", 0, presentationEdge);
    }
    else
    {
      [(UIPopoverController *)self _setPresentationState:3];
      char v13 = [(_UIPopoverView *)self->_popoverView presentedActionSheet];
      long long v14 = v13;
      if (v13) {
        objc_msgSend(v13, "dismissWithClickedButtonIndex:animated:", objc_msgSend(v13, "cancelButtonIndex"), 1);
      }
      uint64_t v34 = 0;
      double v35 = &v34;
      uint64_t v36 = 0x3032000000;
      double v37 = __Block_byref_object_copy__55;
      double v38 = __Block_byref_object_dispose__55;
      double v39 = self->_popoverView;
      long long v15 = [(UIView *)self->_popoverView layer];
      [v15 setShouldRasterize:0];

      id v16 = [(UIView *)self->_popoverView layer];
      [v16 setFrozen:0];

      uint64_t v17 = [(UIView *)self->_popoverView layer];
      [v17 setAllowsGroupOpacity:0];

      long long v18 = [(id)v35[5] window];
      if (os_variant_has_internal_diagnostics())
      {
        if (!v18)
        {
          double v25 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            uint64_t v28 = v35[5];
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v28;
            _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "Expected window when dismissing popover view in order to set rasterization scale. Using mainScreen scale instead. popoverView = %@", buf, 0xCu);
          }
        }
      }
      else if (!v18)
      {
        double v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_dismissPopoverAnimated_stateOnly_notifyDelegate____s_category)+ 8);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = v35[5];
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = v27;
          _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "Expected window when dismissing popover view in order to set rasterization scale. Using mainScreen scale instead. popoverView = %@", buf, 0xCu);
        }
      }
      long long v19 = [(UIView *)self->_popoverView layer];
      if (v18)
      {
        double v20 = [v18 screen];
        [v20 scale];
      }
      else
      {
        double v20 = [(UIPopoverController *)self contentViewController];
        char v5 = [v20 _screen];
        [v5 scale];
      }
      objc_msgSend(v19, "setRasterizationScale:");
      if (!v18) {

      }
      [(UIViewController *)self->_contentViewController _willResignContentViewControllerOfPopover:self];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__UIPopoverController__dismissPopoverAnimated_stateOnly_notifyDelegate___block_invoke;
      aBlock[3] = &unk_1E52E3210;
      void aBlock[4] = self;
      void aBlock[5] = &v34;
      double v21 = (void (**)(void))_Block_copy(aBlock);
      objc_storeStrong((id *)&self->_retainedSelf, self);
      double v22 = [(UIPopoverController *)self _completionBlockForDismissalWhenNotifyingDelegate:v6];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __72__UIPopoverController__dismissPopoverAnimated_stateOnly_notifyDelegate___block_invoke_2;
      v30[3] = &unk_1E52E9288;
      uint64_t v32 = &v34;
      id v23 = v22;
      v30[4] = self;
      id v31 = v23;
      double v24 = (void (**)(void *, uint64_t))_Block_copy(v30);
      if (v7)
      {
        [(UIPopoverController *)self _dismissalAnimationDuration];
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 133, v21, v24);
      }
      else
      {
        v21[2](v21);
        v24[2](v24, 1);
      }
      [(UIPopoverController *)self _postludeForDismissal];

      _Block_object_dispose(&v34, 8);
    }
  }
}

void __72__UIPopoverController__dismissPopoverAnimated_stateOnly_notifyDelegate___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAlpha:0.0];
  double v2 = [*(id *)(*(void *)(a1 + 32) + 40) superview];
  [v2 _endOcclusion:*(void *)(a1 + 32)];

  int v3 = *(void **)(*(void *)(a1 + 32) + 40);
  id v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];
}

void __72__UIPopoverController__dismissPopoverAnimated_stateOnly_notifyDelegate___block_invoke_2(void *a1)
{
  double v2 = [*(id *)(*(void *)(a1[6] + 8) + 40) layer];
  [v2 setShouldRasterize:0];

  int v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) layer];
  [v3 setFrozen:0];

  id v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) layer];
  [v4 setAllowsGroupOpacity:1];

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v5 = a1[4];
  BOOL v6 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = 0;
}

- (void)dimmingViewWasTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [WeakRetained popoverControllerShouldDismissPopover:self])
  {
    [(UIPopoverController *)self _dismissPopoverAnimated:1 stateOnly:0 notifyDelegate:1];
  }
}

- (BOOL)_allowsFocusBehindDimmingView
{
  return 0;
}

- (id)_gestureRecognizerForPresentationFromEdge:(unint64_t)a3
{
  if (a3 != 2 && a3 != 8)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIPopoverController.m" lineNumber:1841 description:@"Only 'UIMinXEdge' and 'UIMaxXEdge' are currently supported"];
  }
  vendedGestureRecognizer = self->_vendedGestureRecognizer;
  if (!vendedGestureRecognizer)
  {
    self->_unint64_t presentationEdge = a3;
    __int16 v8 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel__swipe_];
    id v9 = self->_vendedGestureRecognizer;
    self->_vendedGestureRecognizer = v8;

    [(UIPanGestureRecognizer *)self->_vendedGestureRecognizer setMinimumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)self->_vendedGestureRecognizer setMaximumNumberOfTouches:2];
    [(UIPanGestureRecognizer *)self->_vendedGestureRecognizer setDelegate:self];
    uint64_t v10 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel__swipe_];
    dimmingViewGestureRecognizer = self->_dimmingViewGestureRecognizer;
    self->_dimmingViewGestureRecognizer = v10;

    [(UIPanGestureRecognizer *)self->_dimmingViewGestureRecognizer setMinimumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)self->_dimmingViewGestureRecognizer setMaximumNumberOfTouches:2];
    [(UIPanGestureRecognizer *)self->_dimmingViewGestureRecognizer setDelegate:self];
    [(UIView *)self->_dimmingView addGestureRecognizer:self->_dimmingViewGestureRecognizer];
    vendedGestureRecognizer = self->_vendedGestureRecognizer;
  }
  return vendedGestureRecognizer;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UIPanGestureRecognizer *)a3;
  uint64_t v5 = v4;
  vendedGestureRecognizer = self->_vendedGestureRecognizer;
  if (vendedGestureRecognizer == v4 || self->_dimmingViewGestureRecognizer == v4)
  {
    __int16 v8 = [(UIGestureRecognizer *)v4 view];
    [(UIPanGestureRecognizer *)v5 locationInView:v8];
    if (vendedGestureRecognizer == v5)
    {
      double v15 = v9;
      double v16 = v10;
      if ([(UIPopoverController *)self isPopoverVisible]) {
        goto LABEL_8;
      }
      [(UIPanGestureRecognizer *)self->_vendedGestureRecognizer translationInView:v8];
      double v19 = v18;
      if (([v8 _shouldReverseLayoutDirection] & 1) == 0 && v19 <= 0.0
        || [v8 _shouldReverseLayoutDirection] && v19 >= 0.0)
      {
        char v14 = 0;
        goto LABEL_11;
      }
      uint64_t v20 = objc_msgSend(v8, "hitTest:withEvent:", 0, v15, v16);
      if (!v20)
      {
LABEL_8:
        char v14 = 1;
LABEL_11:

        BOOL v7 = v14 & 1;
        goto LABEL_12;
      }
      double v21 = (void *)v20;
      char v14 = 1;
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (([v21 isDecelerating] & 1) != 0
           || (self->_presentationEdge & [v21 _currentlyAbuttedContentEdges]) == 0))
        {
          char v14 = 0;
        }
        id v11 = [v21 superview];

        if (!v11) {
          break;
        }
        double v21 = v11;
      }
      while ((v14 & 1) != 0);
    }
    else
    {
      [(UIPanGestureRecognizer *)v5 locationInView:v8];
      id v11 = objc_msgSend(v8, "hitTest:withEvent:", 0);
      if (v11)
      {
        char v12 = [(UIPopoverController *)self contentViewController];
        char v13 = [v12 view];
        char v14 = [v11 isDescendantOfView:v13] ^ 1;
      }
      else
      {
        char v14 = 0;
      }
    }

    goto LABEL_11;
  }
  BOOL v7 = 1;
LABEL_12:

  return v7;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  BOOL v6 = (UIPanGestureRecognizer *)a3;
  id v7 = a4;
  __int16 v8 = v7;
  if ((self->_vendedGestureRecognizer == v6 || self->_dimmingViewGestureRecognizer == v6)
    && [v7 _isGestureType:8])
  {
    id v9 = v8;
    if ([v9 _failsPastHysteresisWithoutMinTouches])
    {
      BOOL v10 = (unint64_t)[v9 minimumNumberOfTouches] < 2;
    }
    else
    {
      id v11 = v6;
      id v12 = v9;
      NSUInteger v13 = [(UIPanGestureRecognizer *)v11 minimumNumberOfTouches];
      uint64_t v14 = [(UIPanGestureRecognizer *)v11 maximumNumberOfTouches];
      uint64_t v15 = [(UIPanGestureRecognizer *)v11 minimumNumberOfTouches];

      NSUInteger v16 = v14 - v15 + 1;
      NSUInteger v17 = [v12 minimumNumberOfTouches];
      uint64_t v18 = [v12 maximumNumberOfTouches];
      uint64_t v19 = [v12 minimumNumberOfTouches];

      v22.length = v18 - v19 + 1;
      v21.id location = v13;
      v21.length = v16;
      v22.id location = v17;
      BOOL v10 = NSIntersectionRange(v21, v22).length != 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  BOOL v6 = (UIPanGestureRecognizer *)a3;
  id v7 = a4;
  __int16 v8 = v7;
  vendedGestureRecognizer = self->_vendedGestureRecognizer;
  if (vendedGestureRecognizer == v6 || self->_dimmingViewGestureRecognizer == v6)
  {
    if ([v7 _isGestureType:10])
    {
      BOOL v10 = [(UIGestureRecognizer *)v6 view];
      id v11 = [v8 view];
      objc_msgSend(v10, "convertPoint:toView:", v11, 10.0, 10.0);
      double v13 = v12;

      uint64_t v14 = [(UIGestureRecognizer *)v6 view];
      uint64_t v15 = [v8 view];
      objc_msgSend(v14, "convertPoint:toView:", v15, 20.0, 10.0);
      double v17 = v16;

      char v18 = [v8 direction];
      BOOL v19 = v13 - v17 < 0.0;
      if (v13 - v17 > 0.0) {
        BOOL v19 = 1;
      }
      BOOL v20 = v18 & v19;
      goto LABEL_16;
    }
    vendedGestureRecognizer = self->_vendedGestureRecognizer;
  }
  if ((vendedGestureRecognizer == v6 || self->_dimmingViewGestureRecognizer == v6)
    && [v8 _isGestureType:8])
  {
    id v21 = v8;
    if ([v21 _failsPastHysteresisWithoutMinTouches]) {
      BOOL v20 = (unint64_t)[v21 minimumNumberOfTouches] > 1;
    }
    else {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_16:

  return v20;
}

- (void)_swipe:(id)a3
{
  id v4 = (UIPanGestureRecognizer *)a3;
  uint64_t v5 = v4;
  if (self->_vendedGestureRecognizer == v4 || self->_dimmingViewGestureRecognizer == v4)
  {
    id v21 = v4;
    if ([(UIGestureRecognizer *)v4 state] != UIGestureRecognizerStateBegan
      && [(UIGestureRecognizer *)v21 state] != UIGestureRecognizerStateChanged)
    {
      if ([(UIGestureRecognizer *)v21 state] != UIGestureRecognizerStateEnded)
      {
        uint64_t v16 = [(UIGestureRecognizer *)v21 state];
        uint64_t v5 = v21;
        if (v16 != 4) {
          goto LABEL_44;
        }
      }
      self->_int64_t presentationDirection = 0;
      self->_didPresentInActiveSequence = 0;
      BOOL v17 = [(UIPopoverController *)self isPopoverVisible];
      uint64_t v5 = v21;
      if (v17) {
        goto LABEL_44;
      }
      [(UIView *)self->_dimmingView removeFromSuperview];
      goto LABEL_43;
    }
    BOOL v6 = [(UIGestureRecognizer *)v21 view];
    id v7 = v21;
    [(UIPanGestureRecognizer *)v7 velocityInView:v6];
    double v9 = v8;
    if (v8 >= 0.0) {
      int64_t presentationDirection = 0;
    }
    else {
      int64_t presentationDirection = -1;
    }
    if (v8 > 0.0) {
      int64_t presentationDirection = 1;
    }
    if (presentationDirection != self->_presentationDirection)
    {
      self->_int64_t presentationDirection = presentationDirection;
      if (!presentationDirection)
      {
LABEL_42:

LABEL_43:
        uint64_t v5 = v21;
        goto LABEL_44;
      }
      -[UIPanGestureRecognizer setTranslation:inView:](v7, "setTranslation:inView:", v6, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      int64_t presentationDirection = self->_presentationDirection;
    }
    if (presentationDirection)
    {
      id v11 = [(UIPopoverController *)self _dimmingView];
      uint64_t v12 = [v11 _shouldReverseLayoutDirection] ? -1 : 1;

      int64_t v13 = self->_presentationDirection;
      BOOL v14 = [(UIPopoverController *)self isPopoverVisible];
      if (v13 == v12) {
        int v15 = !v14 || [(UIPopoverController *)self _isDismissing];
      }
      else {
        int v15 = v14 && ![(UIPopoverController *)self _isDismissing];
      }
      if (v9 != 0.0)
      {
        [(UIPanGestureRecognizer *)v7 translationInView:v6];
        if (v9 <= 0.0) {
          double v18 = -v18;
        }
        if (v18 >= 40.0)
        {
          if (v15)
          {
            if ([(UIPopoverController *)self isPopoverVisible]
              && ![(UIPopoverController *)self _isDismissing])
            {
              [(UIPopoverController *)self dismissPopoverAnimated:1];
            }
            else
            {
              unint64_t presentationEdge = self->_presentationEdge;
              BOOL v20 = [(UIGestureRecognizer *)self->_vendedGestureRecognizer view];
              [(UIPopoverController *)self _presentPopoverFromEdge:presentationEdge ofView:v20 animated:1];

              self->_didPresentInActiveSequence = 1;
            }
          }
          else if (self->_dimmingViewGestureRecognizer == v7 {
                 && !self->_didPresentInActiveSequence
          }
                 && [(UIPopoverController *)self isPopoverVisible]
                 && ![(UIPopoverController *)self isPresentingOrDismissing])
          {
            self->_didPresentInActiveSequence = 1;
          }
        }
      }
    }
    goto LABEL_42;
  }
LABEL_44:
}

- (void)_setGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIGestureRecognizer setEnabled:](self->_vendedGestureRecognizer, "setEnabled:");
  dimmingViewGestureRecognizer = self->_dimmingViewGestureRecognizer;
  [(UIGestureRecognizer *)dimmingViewGestureRecognizer setEnabled:v3];
}

- (void)_adjustPopoverForNewContentSizeFromViewController:(id)a3 allowShrink:(BOOL)a4
{
  [(UIViewController *)self->_contentViewController _resolvedPreferredContentSize];
  -[UIPopoverController setPopoverContentSize:animated:](self, "setPopoverContentSize:animated:", 1);
  [(UIPopoverController *)self _containedViewControllerModalStateChanged];
}

- (void)_newViewControllerWasPushed:(id)a3
{
  id v6 = a3;
  if ([(UIPopoverController *)self isPopoverVisible])
  {
    id v4 = [v6 userInfo];
    uint64_t v5 = [v4 objectForKey:0x1ED10DDC0];

    [(UIPopoverController *)self _adjustPopoverForNewContentSizeFromViewController:v5 allowShrink:0];
  }
}

- (void)_startWatchingForNavigationControllerNotifications:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 addObserver:self selector:sel__newViewControllerWasPushed_ name:0x1ED10DD60 object:v5];
}

- (void)_stopWatchingForNavigationControllerNotifications:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:0x1ED10DD60 object:v5];
}

+ (BOOL)_forceAttemptsToAvoidKeyboard
{
  if (qword_1EB260038 != -1) {
    dispatch_once(&qword_1EB260038, &__block_literal_global_145);
  }
  return byte_1EB260029;
}

void __52__UIPopoverController__forceAttemptsToAvoidKeyboard__block_invoke()
{
  _UIKitPreferencesOnce();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [v1 objectForKey:@"UIPopoverControllerForceAttemptsToAvoidKeyboard"];
  byte_1EB260029 = [v0 BOOLValue];
}

- (BOOL)_attemptsToAvoidKeyboard
{
  if (self->_ignoresKeyboardNotifications) {
    return 0;
  }
  if (!self->_popoverControllerStyle || (*(unsigned char *)&self->_popoverControllerFlags & 0x10) == 0) {
    return 1;
  }
  BOOL v3 = objc_opt_class();
  return [v3 _forceAttemptsToAvoidKeyboard];
}

- (id)_layoutInfoFromLayoutInfo:(id)a3 forCurrentKeyboardStateAndHostingWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIPopoverController *)self _attemptsToAvoidKeyboard]) {
    goto LABEL_12;
  }
  double v8 = [v7 windowScene];
  double v9 = [v8 keyboardSceneDelegate];
  [v9 visibleFrameInView:0];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v71.origin.double x = v11;
  v71.origin.double y = v13;
  v71.size.double width = v15;
  v71.size.double height = v17;
  if (CGRectIsEmpty(v71)) {
    goto LABEL_12;
  }
  double v18 = +[UIKeyboard activeKeyboard];
  int v19 = [v18 isDescendantOfView:self->_popoverView];

  if (v19
    || (*(unsigned char *)&self->_popoverControllerFlags & 8) != 0
    || [(id)UIApp _isSpringBoard]
    && (+[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), BOOL v20 = objc_claimAutoreleasedReturnValue(), v21 = [v20 keyboardActive], v20, (v21 & 1) == 0))
  {
LABEL_12:
    id v40 = v6;
  }
  else
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v67 = 0u;
    dimmingView = self->_dimmingView;
    if (dimmingView) {
      [(UIView *)dimmingView transform];
    }
    [(UIPopoverController *)self _updateDimmingViewTransformForInterfaceOrientationOfHostingWindow:v7];
    objc_msgSend(v7, "convertRect:fromWindow:", 0, v11, v13, v15, v17);
    objc_msgSend(v7, "convertRect:toView:", self->_dimmingView);
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    [(UIView *)self->_dimmingView frame];
    v78.origin.double x = v31;
    v78.origin.double y = v32;
    v78.size.double width = v33;
    v78.size.double height = v34;
    v72.origin.double x = v24;
    v72.origin.double y = v26;
    v72.size.double width = v28;
    v72.size.double height = v30;
    CGRect v73 = CGRectIntersection(v72, v78);
    double top = self->_popoverLayoutMargins.top;
    double left = self->_popoverLayoutMargins.left;
    double right = self->_popoverLayoutMargins.right;
    CGFloat v38 = v73.size.height + self->_popoverLayoutMargins.bottom;
    double v39 = self->_dimmingView;
    v66[0] = v67;
    v66[1] = v68;
    v66[2] = v69;
    [(UIView *)v39 setTransform:v66];
    id v40 = (id)[v6 copy];
    objc_msgSend(v40, "setContainingFrameInsets:", top, left, v38, right);
    [v40 sourceViewRect];
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    CGFloat v48 = v47;
    [v40 containingFrame];
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    [v40 containingFrameInsets];
    double v58 = v50 + v57;
    double v60 = v52 + v59;
    double v62 = v54 - (v57 + v61);
    double v64 = v56 - (v59 + v63);
    v74.origin.double x = v58;
    v74.origin.double y = v60;
    v74.size.double width = v62;
    v74.size.double height = v64;
    v79.origin.double x = v42;
    v79.origin.double y = v44;
    v79.size.double width = v46;
    v79.size.double height = v48;
    CGRect v75 = CGRectIntersection(v74, v79);
    if (CGRectIsEmpty(v75))
    {
      v76.origin.double x = v58;
      v76.origin.double y = v60;
      v76.size.double width = v62;
      v76.size.double height = v64;
      if (CGRectGetMaxY(v76) < v44)
      {
        v77.origin.double x = v58;
        v77.origin.double y = v60;
        v77.size.double width = v62;
        v77.size.double height = v64;
        objc_msgSend(v40, "setSourceViewRect:", v42, CGRectGetMaxY(v77), v46, 1.0);
      }
    }
  }

  return v40;
}

- (id)_layoutInfoForCurrentKeyboardStateAndHostingWindow:(id)a3
{
  return [(UIPopoverController *)self _layoutInfoFromLayoutInfo:self->_preferredLayoutInfo forCurrentKeyboardStateAndHostingWindow:a3];
}

- (id)_layoutInfoForCurrentKeyboardState
{
  BOOL v3 = [(UIView *)self->_popoverView window];
  id v4 = [(UIPopoverController *)self _layoutInfoForCurrentKeyboardStateAndHostingWindow:v3];

  return v4;
}

- (void)_moveAwayFromTheKeyboard:(id)a3
{
  popoverView = self->_popoverView;
  id v5 = a3;
  [(UIView *)popoverView layoutIfNeeded];
  id v6 = [(UIPopoverController *)self _layoutInfoForCurrentKeyboardState];
  id v7 = [v5 objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"];

  if (v7) {
    [v7 doubleValue];
  }
  else {
    uint64_t v8 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIPopoverController__moveAwayFromTheKeyboard___block_invoke;
  aBlock[3] = &unk_1E52E7A60;
  uint64_t v15 = v8;
  void aBlock[4] = self;
  id v14 = v6;
  id v9 = v6;
  double v10 = (void (**)(void *, void))_Block_copy(aBlock);
  double v11 = [(UIPopoverController *)self contentViewController];
  double v12 = [v11 transitionCoordinator];

  if (v12)
  {
    if ([v12 isInteractive]) {
      [v12 notifyWhenInteractionEndsUsingBlock:v10];
    }
    else {
      [v12 animateAlongsideTransition:0 completion:v10];
    }
  }
  else
  {
    v10[2](v10, 0);
  }
}

void __48__UIPopoverController__moveAwayFromTheKeyboard___block_invoke(double *a1)
{
  double v1 = a1[6];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__UIPopoverController__moveAwayFromTheKeyboard___block_invoke_2;
  v3[3] = &unk_1E52D9F98;
  double v2 = (void *)*((void *)a1 + 5);
  *(double *)&v3[4] = a1[4];
  id v4 = v2;
  +[UIView animateWithDuration:133 delay:v3 options:0 animations:v1 completion:0.0];
}

uint64_t __48__UIPopoverController__moveAwayFromTheKeyboard___block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 32);
  [*(id *)(a1 + 40) frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [*(id *)(a1 + 40) offset];
  return objc_msgSend(v2, "_setFrame:arrowOffset:", v4, v6, v8, v10, v11);
}

- (void)_keyboardStateChanged:(id)a3
{
  id v4 = [a3 userInfo];
  [(UIPopoverController *)self performSelector:sel__moveAwayFromTheKeyboard_ withObject:v4 afterDelay:0.0];
}

- (void)_startWatchingForKeyboardNotificationsIfNecessary
{
  if ([(UIPopoverController *)self _attemptsToAvoidKeyboard])
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__keyboardStateChanged_ name:@"UIKeyboardWillShowNotification" object:0];
    [v3 addObserver:self selector:sel__keyboardStateChanged_ name:@"UIKeyboardDidHideNotification" object:0];
  }
}

- (void)_stopWatchingForKeyboardNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardWillShowNotification" object:0];
  [v3 removeObserver:self name:@"UIKeyboardDidHideNotification" object:0];
}

- (BOOL)_canRepresentAutomatically
{
  targetBarButtonItem = self->_targetBarButtonItem;
  if (!targetBarButtonItem) {
    return self->_currentArrowDirection == 0;
  }
  uint64_t v4 = [(UIBarButtonItem *)targetBarButtonItem view];
  if (!v4) {
    return self->_currentArrowDirection == 0;
  }
  double v5 = (void *)v4;
  double v6 = [(UIBarButtonItem *)self->_targetBarButtonItem view];
  double v7 = [v6 superview];

  return v7 || self->_currentArrowDirection == 0;
}

- (void)_hostingWindowWillRotate:(id)a3
{
  id v4 = a3;
  int64_t popoverControllerStyle = self->_popoverControllerStyle;
  if (popoverControllerStyle == 1)
  {
    id v6 = v4;
    [(UIPopoverController *)self _invalidateLayoutInfo];
  }
  else
  {
    if (popoverControllerStyle) {
      goto LABEL_8;
    }
    id v6 = v4;
    if (self->_dismissesOnRotation) {
      [(UIPopoverController *)self _dismissPopoverAnimated:0 stateOnly:0 notifyDelegate:1];
    }
    else {
      [(UIView *)self->_popoverView setAlpha:0.0];
    }
  }
  id v4 = v6;
LABEL_8:
}

- (void)_hostingWindowDidRotate:(id)a3
{
  id v4 = [a3 object];
  [(UIPopoverController *)self _layoutDimmingViewForInterfaceOrientationOfHostingWindow:v4];
  if ([(UIPopoverController *)self _canRepresentAutomatically]
    && (targetBarButtonItem = self->_targetBarButtonItem) != 0)
  {
    [(UIPopoverController *)self presentPopoverFromBarButtonItem:targetBarButtonItem permittedArrowDirections:self->_requestedArrowDirections animated:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    char v7 = objc_opt_respondsToSelector();
    currentPresentationView = self->_currentPresentationView;
    if (v7)
    {
      CGSize size = self->_currentPresentationRectInView.size;
      CGPoint origin = self->_currentPresentationRectInView.origin;
      CGSize v29 = size;
      double v27 = currentPresentationView;
      double v10 = currentPresentationView;
      [WeakRetained popoverController:self willRepositionPopoverToRect:&origin inView:&v27];
      double v11 = v27;
      double v12 = v27;

      if (v12 != self->_currentPresentationView) {
        objc_storeStrong((id *)&self->_currentPresentationView, v11);
      }
      -[UIView convertRect:toView:](v12, "convertRect:toView:", self->_dimmingView, origin, v29);
      self->_targetRectInDimmingView.origin.double x = v13;
      self->_targetRectInDimmingView.origin.double y = v14;
      self->_targetRectInDimmingView.size.double width = v15;
      self->_targetRectInDimmingView.size.double height = v16;
    }
    else
    {
      double v17 = [(UIView *)currentPresentationView window];

      if (v17)
      {
        -[UIView convertRect:toView:](self->_currentPresentationView, "convertRect:toView:", self->_dimmingView, self->_currentPresentationRectInView.origin.x, self->_currentPresentationRectInView.origin.y, self->_currentPresentationRectInView.size.width, self->_currentPresentationRectInView.size.height);
        self->_targetRectInDimmingView.origin.double x = v18;
        self->_targetRectInDimmingView.origin.double y = v19;
        self->_targetRectInDimmingView.size.double width = v20;
        self->_targetRectInDimmingView.size.double height = v21;
      }
    }
    -[_UIPopoverLayoutInfo setSourceViewRect:](self->_preferredLayoutInfo, "setSourceViewRect:", self->_targetRectInDimmingView.origin.x, self->_targetRectInDimmingView.origin.y, self->_targetRectInDimmingView.size.width, self->_targetRectInDimmingView.size.height);
    if ([(UIPopoverController *)self _attemptsToAvoidKeyboard])
    {
      preferredLayoutInfo = self->_preferredLayoutInfo;
      [(UIView *)self->_dimmingView bounds];
      -[_UIPopoverLayoutInfo setContainingFrame:](preferredLayoutInfo, "setContainingFrame:");
      double v23 = [(UIPopoverController *)self _layoutInfoForCurrentKeyboardState];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __47__UIPopoverController__hostingWindowDidRotate___block_invoke;
      v25[3] = &unk_1E52D9F98;
      v25[4] = self;
      id v26 = v23;
      id v24 = v23;
      +[UIView performWithoutAnimation:v25];
    }
  }
  if (!self->_popoverControllerStyle) {
    [(UIView *)self->_popoverView setAlpha:1.0];
  }
}

uint64_t __47__UIPopoverController__hostingWindowDidRotate___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 32);
  [*(id *)(a1 + 40) frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [*(id *)(a1 + 40) offset];
  return objc_msgSend(v2, "_setFrame:arrowOffset:", v4, v6, v8, v10, v11);
}

- (void)_startWatchingForWindowRotations
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v3 = [(UIView *)self->_popoverView window];
  [v5 addObserver:self selector:sel__hostingWindowWillRotate_ name:@"UIWindowWillRotateNotification" object:v3];

  double v4 = [(UIView *)self->_popoverView window];
  [v5 addObserver:self selector:sel__hostingWindowDidRotate_ name:@"UIWindowDidRotateNotification" object:v4];
}

- (void)_stopWatchingForWindowRotations
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIWindowWillRotateNotification" object:0];
  [v3 removeObserver:self name:@"UIWindowDidRotateNotification" object:0];
}

- (void)_scrollViewWillBeginDragging:(id)a3
{
  popoverView = self->_popoverView;
  id v5 = [a3 object];
  if (popoverView)
  {
    id v9 = v5;
    int v6 = [v5 isDescendantOfView:popoverView];

    if (v6)
    {
      unsigned int draggingChildScrollViewCount = self->draggingChildScrollViewCount;
      if (!draggingChildScrollViewCount)
      {
        if ([(UIDimmingView *)self->_dimmingView ignoresTouches]) {
          char v8 = 4;
        }
        else {
          char v8 = 0;
        }
        *(unsigned char *)&self->_popoverControllerFlags = *(unsigned char *)&self->_popoverControllerFlags & 0xFB | v8;
        [(UIDimmingView *)self->_dimmingView setIgnoresTouches:1];
        unsigned int draggingChildScrollViewCount = self->draggingChildScrollViewCount;
      }
      self->unsigned int draggingChildScrollViewCount = draggingChildScrollViewCount + 1;
    }
  }
  else
  {
  }
}

- (void)_scrollViewDidEndDragging:(id)a3
{
  double v4 = [a3 object];
  id v5 = v4;
  if (self->_popoverView)
  {
    char v8 = v4;
    int v6 = objc_msgSend(v4, "isDescendantOfView:");
    id v5 = v8;
    if (v6)
    {
      unsigned int v7 = self->draggingChildScrollViewCount - 1;
      self->unsigned int draggingChildScrollViewCount = v7;
      if (!v7)
      {
        [(UIDimmingView *)self->_dimmingView setIgnoresTouches:(*(unsigned char *)&self->_popoverControllerFlags >> 2) & 1];
        id v5 = v8;
      }
    }
  }
}

- (void)_startWatchingForScrollViewNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__scrollViewWillBeginDragging_ name:@"_UIScrollViewWillBeginDraggingNotification" object:0];
  [v3 addObserver:self selector:sel__scrollViewDidEndDragging_ name:@"_UIScrollViewDidEndDraggingNotification" object:0];
}

- (void)_stopWatchingForScrollViewNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIScrollViewWillBeginDraggingNotification" object:0];
  [v3 removeObserver:self name:@"_UIScrollViewDidEndDraggingNotification" object:0];
}

- (BOOL)_ignoresKeyboardNotifications
{
  return self->_ignoresKeyboardNotifications;
}

- (void)_setIgnoresKeyboardNotifications:(BOOL)a3
{
  if (self->_ignoresKeyboardNotifications != a3)
  {
    self->_ignoresKeyboardNotifications = a3;
    if (a3)
    {
      [(UIPopoverController *)self _stopWatchingForKeyboardNotifications];
      if (UIKeyboardAutomaticIsOnScreen())
      {
        popoverView = self->_popoverView;
        [(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo frame];
        double v6 = v5;
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        [(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo offset];
        -[_UIPopoverView _setFrame:arrowOffset:](popoverView, "_setFrame:arrowOffset:", v6, v8, v10, v12, v13);
      }
    }
    else if ([(UIPopoverController *)self _attemptsToAvoidKeyboard])
    {
      [(UIPopoverController *)self _startWatchingForKeyboardNotificationsIfNecessary];
      if (UIKeyboardAutomaticIsOnScreen())
      {
        [(UIPopoverController *)self _moveAwayFromTheKeyboard:0];
      }
    }
  }
}

- (void)_stopWatchingForNotifications
{
  [(UIPopoverController *)self _stopWatchingForKeyboardNotifications];
  [(UIPopoverController *)self _stopWatchingForScrollViewNotifications];
  [(UIPopoverController *)self _stopWatchingForWindowRotations];
}

- (void)_containedViewControllerModalStateChanged
{
  id v3 = [(UIPopoverController *)self contentViewController];
  uint64_t v4 = [v3 isModalInPresentation];

  dimmingView = self->_dimmingView;
  [(UIDimmingView *)dimmingView setIgnoresTouches:v4];
}

- (BOOL)_isPresenting
{
  return self->_presentationState == 1;
}

- (BOOL)_isDismissing
{
  return self->_presentationState == 3;
}

- (BOOL)isPresentingOrDismissing
{
  if ([(UIPopoverController *)self _isPresenting]) {
    return 1;
  }
  return [(UIPopoverController *)self _isDismissing];
}

- (id)_managingSplitViewController
{
  double v2 = [(UIPopoverController *)self _splitParentController];
  id v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v2 = v3;
    }
    else {
      double v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (BOOL)_embedsInView
{
  return (*(unsigned char *)&self->_popoverControllerFlags >> 4) & 1;
}

- (id)_dimmingView
{
  return self->_dimmingView;
}

- (void)_modalTransition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5 target:(id)a6 didFinish:(int64_t)a7
{
  double v11 = (UIViewController *)a4;
  id v65 = a5;
  double v12 = (UIViewController *)a5;
  id obj = a6;
  id v57 = a6;
  unsigned int v13 = a3 & 0xFFFFFFFE;
  contentViewController = self->_contentViewController;
  BOOL v60 = contentViewController == v11;
  BOOL v61 = (a3 & 0xFFFFFFFE) == 8;
  if (a3 == 8) {
    CGFloat v15 = v12;
  }
  else {
    CGFloat v15 = v11;
  }
  long long v68 = v11;
  if (a3 == 8) {
    CGFloat v16 = v11;
  }
  else {
    CGFloat v16 = v12;
  }
  double v17 = v15;
  CGFloat v18 = v16;
  objc_storeStrong((id *)&self->_slidingViewController, v15);
  uint64_t v19 = [(UIViewController *)v18 view];
  id v66 = [(UIViewController *)v17 view];
  CGFloat v20 = [(UIPopoverController *)self _managingSplitViewController];
  long long v67 = (void *)v19;
  if (v20)
  {
    CGFloat v21 = [(UIPopoverController *)self _managingSplitViewController];
    [v21 _contentSizeForChildViewController:self->_contentViewController inPopoverController:self];
    double width = v22;
    double height = v24;
  }
  else
  {
    [(UIViewController *)v12 _resolvedPreferredContentSize];
    double width = v26;
    double height = v27;
  }
  CGFloat v28 = v17;

  if ((*(unsigned char *)&self->_popoverControllerFlags & 0x10) != 0)
  {
    double width = self->_popoverContentSize.width;
    double height = self->_popoverContentSize.height;
  }
  CGSize v29 = [(UIViewController *)self->_contentViewController view];
  CGFloat v30 = [(UIViewController *)v18 view];
  if (v29 == v30)
  {
    CGFloat v32 = [(UIViewController *)v18 view];
    CGFloat v31 = [v32 superview];
  }
  else
  {
    CGFloat v31 = [(UIViewController *)self->_contentViewController view];
  }

  uint64_t v59 = [v31 autoresizingMask];
  [(UIViewController *)v68 setPerformingModalTransition:1];
  if (a3 == 8)
  {
    [v31 setAutoresizingMask:0];
    -[UIPopoverController setPopoverContentSize:animated:](self, "setPopoverContentSize:animated:", v13 == 8, width, height);
    [(UIPopoverController *)self _currentPopoverContentSize];
    double width = v33;
    double height = v34;
  }
  double v35 = [(UIViewController *)self->_contentViewController view];
  uint64_t v36 = [v35 superview];
  [v36 frame];
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  double v44 = v43;

  double v45 = [(UIViewController *)v28 view];
  self->_toViewAutoResizingMask = [v45 autoresizingMask];

  double v46 = [(UIViewController *)v28 view];
  [v46 setAutoresizingMask:0];

  uint64_t v87 = 0;
  v88 = (double *)&v87;
  uint64_t v89 = 0x4010000000;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  id v90 = &unk_186D7DBA7;
  double v93 = width;
  double v94 = height;
  if (a3 == 8)
  {
    [(UIViewController *)v12 view];
    CGFloat v48 = v47 = v66;
    objc_msgSend(v48, "setFrame:", 0.0, v44, width, height);

    double v49 = [(UIViewController *)v12 view];
    [v31 addSubview:v49];
  }
  else
  {
    [v31 bounds];
    double v47 = v66;
    objc_msgSend(v67, "setFrame:");
    [v66 frame];
    double v50 = v88;
    *((void *)v88 + 6) = v51;
    *((void *)v50 + 7) = v52;
    *((void *)v50 + 4) = v53;
    v50[5] = height;
    [v31 insertSubview:v67 belowSubview:v66];
  }
  objc_storeStrong(&self->_target, obj);
  self->_didFinish = a7;
  objc_storeStrong((id *)&self->_modalPresentationFromViewController, a4);
  objc_storeStrong((id *)&self->_modalPresentationToViewController, v65);
  if (contentViewController != v68) {
    -[UIViewController __viewWillDisappear:]((uint64_t)self->_modalPresentationFromViewController, v13 == 8);
  }
  if (contentViewController != v12) {
    [(UIViewController *)self->_modalPresentationToViewController __viewWillAppear:v13 == 8];
  }
  if (v13 == 8) {
    [(id)UIApp beginIgnoringInteractionEvents];
  }
  else {
    [(UIPopoverController *)self _modalAnimationFinishedEndIgnoringInteractiveEvents:0];
  }
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke;
  v86[3] = &unk_1E52E92B0;
  v86[4] = self;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke_2;
  v71[3] = &unk_1E52E92D8;
  id v54 = v31;
  uint64_t v76 = v38;
  uint64_t v77 = v40;
  uint64_t v78 = v42;
  double v79 = v44;
  BOOL v83 = v60;
  id v72 = v54;
  CGRect v73 = self;
  double v80 = width;
  double v81 = height;
  BOOL v84 = v61;
  BOOL v85 = contentViewController == v12;
  CGRect v75 = &v87;
  id v55 = v47;
  id v74 = v55;
  uint64_t v82 = v59;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke_3;
  v69[3] = &unk_1E52E0478;
  BOOL v70 = v61;
  v69[4] = self;
  +[UIView conditionallyAnimate:v13 == 8 withAnimation:v86 layout:v71 completion:v69];

  _Block_object_dispose(&v87, 8);
}

void __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  [v4 _presentationAnimationDuration];
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, v5);
}

void __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  if (!*(unsigned char *)(a1 + 120))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPopoverContentSize:animated:", *(unsigned __int8 *)(a1 + 121), *(double *)(a1 + 96), *(double *)(a1 + 104));
    if (!*(unsigned char *)(a1 + 122))
    {
      [*(id *)(a1 + 40) popoverContentSize];
      uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
      *(void *)(v2 + 48) = v3;
      *(void *)(v2 + 56) = v4;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56));
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 328);
  double v7 = [*(id *)(v5 + 336) view];
  [v7 setAutoresizingMask:v6];

  if (*(unsigned char *)(a1 + 120))
  {
    uint64_t v8 = *(void *)(a1 + 112);
    double v9 = *(void **)(a1 + 32);
    [v9 setAutoresizingMask:v8];
  }
}

uint64_t __93__UIPopoverController__modalTransition_fromViewController_toViewController_target_didFinish___block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _modalAnimationFinishedEndIgnoringInteractiveEvents:1];
  }
  return result;
}

- (void)_modalAnimationFinishedEndIgnoringInteractiveEvents:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [self->_target _completionBlock];
    CGFloat v16 = (void (**)(id, uint64_t))_Block_copy(v5);
  }
  else
  {
    CGFloat v16 = 0;
  }
  if (self->_target)
  {
    int64_t didFinish = self->_didFinish;
    if (didFinish == 2)
    {
      if (objc_opt_respondsToSelector()) {
        [self->_target _didFinishDismissTransition];
      }
    }
    else if (didFinish == 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [self->_target _didFinishPresentTransition];
    }
  }
  modalPresentationFromViewController = self->_modalPresentationFromViewController;
  if (modalPresentationFromViewController != self->_contentViewController)
  {
    UIModalPresentationStyle v8 = [(UIViewController *)self->_modalPresentationToViewController modalPresentationStyle];
    modalPresentationFromViewController = self->_modalPresentationFromViewController;
    if (v8 != 18)
    {
      double v9 = [(UIViewController *)modalPresentationFromViewController view];
      [v9 removeFromSuperview];

      -[UIViewController __viewDidDisappear:]((uint64_t)self->_modalPresentationFromViewController, 1);
      modalPresentationFromViewController = self->_modalPresentationFromViewController;
    }
  }
  [(UIViewController *)modalPresentationFromViewController setPerformingModalTransition:0];
  id target = self->_target;
  self->_id target = 0;

  self->_int64_t didFinish = 0;
  modalPresentationToViewController = self->_modalPresentationToViewController;
  if (modalPresentationToViewController != self->_contentViewController) {
    [(UIViewController *)modalPresentationToViewController __viewDidAppear:1];
  }
  double v12 = self->_modalPresentationFromViewController;
  unsigned int v13 = self->_modalPresentationToViewController;
  CGFloat v14 = self->_modalPresentationFromViewController;
  self->_modalPresentationFromViewController = 0;

  CGFloat v15 = self->_modalPresentationToViewController;
  self->_modalPresentationToViewController = 0;

  if (v3) {
    [(id)UIApp endIgnoringInteractionEvents];
  }
  if (v16) {
    v16[2](v16, 1);
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (UIDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (BOOL)dismissesOnRotation
{
  return self->_dismissesOnRotation;
}

- (void)setDismissesOnRotation:(BOOL)a3
{
  self->_dismissesOnRotation = a3;
}

- (Class)popoverBackgroundViewClass
{
  return self->_popoverBackgroundViewClass;
}

- (void)setPopoverBackgroundViewClass:(Class)popoverBackgroundViewClass
{
}

- (BOOL)showsTargetRect
{
  return self->_showsTargetRect;
}

- (void)setShowsTargetRect:(BOOL)a3
{
  self->_showsTargetRect = a3;
}

- (BOOL)showsOrientationMarker
{
  return self->_showsOrientationMarker;
}

- (void)setShowsOrientationMarker:(BOOL)a3
{
  self->_showsOrientationMarker = a3;
}

- (BOOL)showsPresentationArea
{
  return self->_showsPresentationArea;
}

- (void)setShowsPresentationArea:(BOOL)a3
{
  self->_showsPresentationArea = a3;
}

- (BOOL)_retainsSelfWhilePresented
{
  return self->_retainsSelfWhilePresented;
}

- (void)_setRetainsSelfWhilePresented:(BOOL)a3
{
  self->_retainsSelfWhilePresented = a3;
}

- (_UIPopoverLayoutInfo)preferredLayoutInfo
{
  return self->_preferredLayoutInfo;
}

- (void)setPreferredLayoutInfo:(id)a3
{
}

- (UIView)_presentingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
  return (UIView *)WeakRetained;
}

- (void)_setPresentingView:(id)a3
{
}

- (unint64_t)_presentationEdge
{
  return self->_presentationEdge;
}

- (void)_setPresentationEdge:(unint64_t)a3
{
  self->_unint64_t presentationEdge = a3;
}

- (void)setPopoverArrowDirection:(unint64_t)a3
{
  self->_popoverArrowDirection = a3;
}

- (UIPopoverPresentationController)_presentationController
{
  return self->_presentationController;
}

- (void)_setPresentationController:(id)a3
{
}

- (BOOL)_allowsPopoverPresentationToAdapt
{
  return self->_allowsPopoverPresentationToAdapt;
}

- (void)_setAllowsPopoverPresentationToAdapt:(BOOL)a3
{
  self->_allowsPopoverPresentationToAdapt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_dimmingViewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_vendedGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_presentingView);
  objc_storeStrong((id *)&self->_slidingViewController, 0);
  objc_storeStrong((id *)&self->_modalPresentationToViewController, 0);
  objc_storeStrong((id *)&self->_modalPresentationFromViewController, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_currentPresentationView, 0);
  objc_storeStrong((id *)&self->_popoverBackgroundViewClass, 0);
  objc_storeStrong((id *)&self->_preferredLayoutInfo, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_targetBarButtonItem, 0);
  objc_storeStrong((id *)&self->_layoutConstraintView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_popoverView, 0);
  objc_destroyWeak((id *)&self->_splitParentController);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak(&self->_delegate);
}

@end