@interface _UIPreviewActionsController
+ (id)actionsControllerWithContainerView:(id)a3 platterView:(id)a4 presentedViewController:(id)a5 delegate:(id)a6;
- (BOOL)_hasPreviewSwipeActions;
- (BOOL)_hasSelectedSwipeAction;
- (BOOL)_isSwipeActionVisible;
- (BOOL)_platterIsInInitialPositionMostly;
- (BOOL)_previewActionsSheetIsVisible;
- (BOOL)_shouldDismiss;
- (BOOL)hasBegun;
- (BOOL)platterPanned;
- (CGPoint)_applyLayoutAdjustmentsForManagedViewWithPosition:(CGPoint)a3;
- (CGPoint)_centerForMenuDismissedForActionSheet:(id)a3;
- (CGPoint)_centerForMenuPresentedForActionSheet:(id)a3;
- (CGPoint)_centerForPlatterWithMenuViewPresentedForActionSheet:(id)a3;
- (CGPoint)centerForMenuDismissed;
- (CGPoint)centerForMenuPresented;
- (CGPoint)centerForPlatterWithMenuViewDismissed;
- (CGPoint)centerForPlatterWithMenuViewPresented;
- (CGPoint)initialCenterForLeadingSwipeActionView;
- (CGPoint)initialCenterForTrailingSwipeActionView;
- (CGPoint)lastPanningLocation;
- (CGRect)_initialPlatterFrame;
- (CGRect)frameForActionView;
- (CGSize)totalPanningTranslation;
- (NSArray)currentPreviewActionItems;
- (UIImageView)affordanceImageView;
- (UIPreviewAction)leadingPreviewAction;
- (UIPreviewAction)trailingPreviewAction;
- (UIView)affordanceView;
- (UIView)containerView;
- (UIView)platterView;
- (UIViewController)presentedViewController;
- (_UIPlatterMenuDynamicsController)platterDynamicsController;
- (_UIPreviewActionSheetView)previewActionsView;
- (_UIPreviewActionsController)initWithContainerView:(id)a3 platterView:(id)a4 presentedViewController:(id)a5 delegate:(id)a6;
- (_UIPreviewActionsControllerDelegate)delegate;
- (_UIPreviewQuickActionView)leadingPreviewActionView;
- (_UIPreviewQuickActionView)trailingPreviewActionView;
- (_UIStatesFeedbackGenerator)swipeFeedbackGenerator;
- (double)_platterOffsetDistance;
- (double)_quickActionSelectionOffset;
- (double)_quickActionsSelectionThresholdForPreviewMenuItemStyle:(int64_t)a3;
- (double)minimumSpacingBetweenPlatterAndMenu;
- (id)_makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:(id)a3;
- (void)_actionsControllerCommonInit;
- (void)_activateFeedbackIfNeeded;
- (void)_configureFeedbackGenerator;
- (void)_configurePlatterDynamicsController;
- (void)_deactivateFeedbackIfNeeded;
- (void)_disablePlatterController;
- (void)_dismissForSelectedSwipeAction;
- (void)_dismissWithAction:(id)a3;
- (void)_fireConfirmFeedbackIfNeededForInitialSelectionState:(BOOL)a3 finalSelectionState:(BOOL)a4;
- (void)_hideChromeAndSetAffordanceHidden:(BOOL)a3;
- (void)_memoizePreviewActionViews;
- (void)_presentSubactionsForActionGroup:(id)a3;
- (void)_setAffordanceAlpha:(double)a3 withDuration:(double)a4 hideOnCompletion:(BOOL)a5;
- (void)_updateAffordanceIfNecessary;
- (void)_updateSwipeActionsState;
- (void)beginPanningAtLocation:(CGPoint)a3;
- (void)dealloc;
- (void)dismissPreviewActionsWithCompletion:(id)a3;
- (void)endPanningAtLocation:(CGPoint)a3;
- (void)platterMenuDynamicsController:(id)a3 didMoveSwipeView:(id)a4 toPosition:(CGPoint)a5;
- (void)platterMenuDynamicsControllerDidDismissWithController:(id)a3;
- (void)setAffordanceImageView:(id)a3;
- (void)setAffordanceView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentPreviewActionItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasBegun:(BOOL)a3;
- (void)setLastPanningLocation:(CGPoint)a3;
- (void)setLeadingPreviewAction:(id)a3;
- (void)setLeadingPreviewActionView:(id)a3;
- (void)setLeadingSwipeActionViewSelected:(BOOL)a3;
- (void)setPlatterDynamicsController:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setPreviewActionsView:(id)a3;
- (void)setSwipeFeedbackGenerator:(id)a3;
- (void)setTotalPanningTranslation:(CGSize)a3;
- (void)setTrailingPreviewAction:(id)a3;
- (void)setTrailingPreviewActionView:(id)a3;
- (void)setTrailingSwipeActionViewSelected:(BOOL)a3;
- (void)translationDidUpdateForPlatterMenuDynamicsController:(id)a3;
- (void)updatePanningLocation:(CGPoint)a3;
@end

@implementation _UIPreviewActionsController

- (_UIPreviewActionsController)initWithContainerView:(id)a3 platterView:(id)a4 presentedViewController:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_UIPreviewActionsController;
  v15 = [(_UIPreviewActionsController *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_containerView, a3);
    objc_storeStrong((id *)&v16->_platterView, a4);
    objc_storeStrong((id *)&v16->_presentedViewController, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    [(_UIPreviewActionsController *)v16 _actionsControllerCommonInit];
  }

  return v16;
}

- (void)_actionsControllerCommonInit
{
  v3 = [(_UIPreviewActionsController *)self currentPreviewActionItems];
  v4 = [(_UIPreviewActionsController *)self _makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:v3];
  [(_UIPreviewActionsController *)self setPreviewActionsView:v4];

  v5 = [(_UIPreviewActionsController *)self previewActionsView];

  if (v5)
  {
    [(_UIPreviewActionsController *)self _memoizePreviewActionViews];
    [(_UIPreviewActionsController *)self _configurePlatterDynamicsController];
    v6 = objc_alloc_init(UIView);
    v7 = _UIImageWithName(@"uippc-arrow-up-gray.png");
    v8 = [v7 imageWithRenderingMode:2];

    v9 = [[UIImageView alloc] initWithImage:v8];
    v10 = +[UIColor whiteColor];
    [(UIView *)v9 setTintColor:v10];

    [(UIView *)v6 addSubview:v9];
    [(UIView *)v9 frame];
    -[UIView setFrame:](v6, "setFrame:");
    _updateAffordanceFrameOrigin(self->_platterView, v6);
    [(UIView *)v6 setAlpha:0.0];
    [(_UIPreviewActionsController *)self setAffordanceImageView:v9];
    id v11 = [(UIView *)self->_platterView superview];
    [v11 addSubview:v6];

    [(_UIPreviewActionsController *)self setAffordanceView:v6];
    if (![(_UIPreviewActionsController *)self _hasPreviewSwipeActions]) {
      [(_UIPlatterMenuDynamicsController *)self->_platterDynamicsController lockIntoYAxis];
    }
  }
  [(_UIPreviewActionsController *)self _configureFeedbackGenerator];
}

- (void)_configurePlatterDynamicsController
{
  v3 = [_UIPlatterMenuDynamicsController alloc];
  id v7 = [(_UIPreviewActionsController *)self containerView];
  v4 = [(_UIPreviewActionsController *)self platterView];
  v5 = [(_UIPreviewActionsController *)self previewActionsView];
  v6 = [(_UIPlatterMenuDynamicsController *)v3 initWithContainerView:v7 platterView:v4 menuView:v5 delegate:self];
  [(_UIPreviewActionsController *)self setPlatterDynamicsController:v6];
}

- (void)dealloc
{
  [(UIView *)self->_leadingPreviewActionView removeFromSuperview];
  [(UIView *)self->_trailingPreviewActionView removeFromSuperview];
  [(UIView *)self->_previewActionsView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewActionsController;
  [(_UIPreviewActionsController *)&v3 dealloc];
}

+ (id)actionsControllerWithContainerView:(id)a3 platterView:(id)a4 presentedViewController:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithContainerView:v13 platterView:v12 presentedViewController:v11 delegate:v10];

  return v14;
}

- (void)beginPanningAtLocation:(CGPoint)a3
{
  if (self->_platterDynamicsController)
  {
    double y = a3.y;
    double x = a3.x;
    [(_UIPreviewActionsController *)self setHasBegun:1];
    -[_UIPreviewActionsController setTotalPanningTranslation:](self, "setTotalPanningTranslation:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    -[_UIPreviewActionsController setLastPanningLocation:](self, "setLastPanningLocation:", x, y);
    -[_UIPlatterMenuDynamicsController didBeginPanningWithPoint:](self->_platterDynamicsController, "didBeginPanningWithPoint:", x, y);
  }
  [(_UIPreviewActionsController *)self _activateFeedbackIfNeeded];
}

- (void)updatePanningLocation:(CGPoint)a3
{
  if (self->_platterDynamicsController)
  {
    double y = a3.y;
    double x = a3.x;
    double width = self->_totalPanningTranslation.width;
    [(_UIPreviewActionsController *)self lastPanningLocation];
    CGFloat v8 = width + vabdd_f64(v7, x);
    double height = self->_totalPanningTranslation.height;
    [(_UIPreviewActionsController *)self lastPanningLocation];
    self->_totalPanningTranslation.double width = v8;
    self->_totalPanningTranslation.double height = height + vabdd_f64(v10, y);
    self->_lastPanningLocation.double x = x;
    self->_lastPanningLocation.double y = y;
    platterDynamicsController = self->_platterDynamicsController;
    -[_UIPlatterMenuDynamicsController didPanWithPoint:](platterDynamicsController, "didPanWithPoint:", x, y);
  }
}

- (void)endPanningAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(_UIPreviewActionsController *)self _deactivateFeedbackIfNeeded];
  if (self->_platterDynamicsController)
  {
    [(_UIPreviewActionsController *)self setHasBegun:0];
    -[_UIPlatterMenuDynamicsController didEndPanningWithPoint:](self->_platterDynamicsController, "didEndPanningWithPoint:", x, y);
    if ([(_UIPreviewActionsController *)self _hasSelectedSwipeAction])
    {
      [(_UIPreviewActionsController *)self _dismissForSelectedSwipeAction];
    }
    else if ([(_UIPreviewActionsController *)self _shouldDismiss])
    {
      [(_UIPreviewActionsController *)self _dismissWithAction:0];
    }
  }
}

- (BOOL)platterPanned
{
  platterDynamicsController = self->_platterDynamicsController;
  if (platterDynamicsController) {
    LOBYTE(platterDynamicsController) = [(_UIPlatterMenuDynamicsController *)platterDynamicsController platterPanned];
  }
  return (char)platterDynamicsController;
}

- (void)dismissPreviewActionsWithCompletion:(id)a3
{
  CGFloat v8 = (void (**)(void))a3;
  [(_UIPreviewActionsController *)self _setAffordanceAlpha:1 withDuration:0.0 hideOnCompletion:0.1];
  [(_UIPreviewActionsController *)self _hideChromeAndSetAffordanceHidden:0];
  [(_UIPreviewActionsController *)self _platterOffsetDistance];
  double v5 = v4;
  BOOL v6 = [(_UIPreviewActionsController *)self _isSwipeActionVisible];
  if (v5 <= 44.0 && !v6)
  {
    if (v8) {
      v8[2]();
    }
  }
  else
  {
    [(_UIPlatterMenuDynamicsController *)self->_platterDynamicsController _animateToPlatterDismissedWithDuration:v8 completion:0.225];
  }
}

- (CGRect)frameForActionView
{
  v2 = [(_UIPreviewActionsController *)self previewActionsView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)_hideChromeAndSetAffordanceHidden:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(_UIPreviewActionsController *)self affordanceView];
    double v5 = [v4 layer];
    double v6 = [v5 animationForKey:@"opacity"];

    if (!v6)
    {
      double v7 = [(_UIPreviewActionsController *)self affordanceView];
      [v7 setHidden:1];
    }
  }
  double v8 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
  [v8 setHidden:1];

  id v9 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
  [v9 setHidden:1];
}

- (double)_platterOffsetDistance
{
  [(_UIPlatterMenuDynamicsController *)self->_platterDynamicsController currentTranslation];
  double v4 = v3;
  [(_UIPlatterMenuDynamicsController *)self->_platterDynamicsController currentTranslation];
  return sqrt((v4 - *MEMORY[0x1E4F1DAD8]) * (v4 - *MEMORY[0x1E4F1DAD8])+ (v5 - *(double *)(MEMORY[0x1E4F1DAD8] + 8)) * (v5 - *(double *)(MEMORY[0x1E4F1DAD8] + 8)));
}

- (id)_makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = [(_UIPreviewActionsController *)self delegate];
    [v5 maximumPreviewActionsViewSizeForPreviewActionsController:self];
    double v7 = v6;
    double v9 = v8;

    double v10 = -[_UIPreviewActionSheetView initWithFrame:title:items:contentInsets:]([_UIPreviewActionSheetView alloc], "initWithFrame:title:items:contentInsets:", 0, v4, 0.0, 0.0, v7, v9, 20.0, 0.0, 20.0, 0.0);
    double v11 = [(_UIPreviewActionsController *)self containerView];
    [v11 addSubview:v10];

    [(UIView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v10 setNeedsLayout];
    [(UIView *)v10 layoutIfNeeded];
    [(UIView *)v10 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(UIView *)v10 setAutoresizingMask:0];
    [(_UIPreviewActionsController *)self _centerForMenuDismissedForActionSheet:v10];
    -[UIView setCenter:](v10, "setCenter:");
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __88___UIPreviewActionsController__makeAndAddToViewHierarchyPreviewActionSheetForMenuItems___block_invoke;
    v13[3] = &unk_1E53001F0;
    objc_copyWeak(&v14, &location);
    [(_UIPreviewActionSheetView *)v10 setCompletionHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (NSArray)currentPreviewActionItems
{
  currentPreviewActionItems = self->_currentPreviewActionItems;
  if (!currentPreviewActionItems)
  {
    id v4 = [(_UIPreviewActionsController *)self presentedViewController];
    double v5 = [v4 previewActionItems];

    if ([v5 count]) {
      double v6 = (NSArray *)[v5 copy];
    }
    else {
      double v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    double v7 = self->_currentPreviewActionItems;
    self->_currentPreviewActionItems = v6;

    currentPreviewActionItems = self->_currentPreviewActionItems;
  }
  return currentPreviewActionItems;
}

- (UIPreviewAction)leadingPreviewAction
{
  leadingPreviewAction = self->_leadingPreviewAction;
  if (!leadingPreviewAction)
  {
    id v4 = [(_UIPreviewActionsController *)self containerView];
    int v5 = v4[28];

    double v6 = [(_UIPreviewActionsController *)self presentedViewController];
    double v7 = v6;
    if ((v5 & 0x80000) != 0) {
      [v6 trailingPreviewAction];
    }
    else {
    double v8 = [v6 leadingPreviewAction];
    }
    double v9 = (UIPreviewAction *)[v8 copy];
    double v10 = self->_leadingPreviewAction;
    self->_leadingPreviewAction = v9;

    leadingPreviewAction = self->_leadingPreviewAction;
  }
  return leadingPreviewAction;
}

- (UIPreviewAction)trailingPreviewAction
{
  trailingPreviewAction = self->_trailingPreviewAction;
  if (!trailingPreviewAction)
  {
    id v4 = [(_UIPreviewActionsController *)self containerView];
    int v5 = v4[28];

    double v6 = [(_UIPreviewActionsController *)self presentedViewController];
    double v7 = v6;
    if ((v5 & 0x80000) != 0) {
      [v6 leadingPreviewAction];
    }
    else {
    double v8 = [v6 trailingPreviewAction];
    }
    double v9 = (UIPreviewAction *)[v8 copy];
    double v10 = self->_trailingPreviewAction;
    self->_trailingPreviewAction = v9;

    trailingPreviewAction = self->_trailingPreviewAction;
  }
  return trailingPreviewAction;
}

- (_UIPreviewQuickActionView)leadingPreviewActionView
{
  if (!self->_leadingPreviewActionView)
  {
    double v3 = [(_UIPreviewActionsController *)self leadingPreviewAction];

    if (v3)
    {
      id v4 = [_UIPreviewQuickActionView alloc];
      int v5 = -[_UIPreviewQuickActionView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      leadingPreviewActionView = self->_leadingPreviewActionView;
      self->_leadingPreviewActionView = v5;

      [(UIView *)self->_leadingPreviewActionView setTranslatesAutoresizingMaskIntoConstraints:0];
      double v7 = [(_UIPreviewActionsController *)self leadingPreviewAction];
      [(_UIPreviewQuickActionView *)self->_leadingPreviewActionView setQuickAction:v7];

      [(UIView *)self->_leadingPreviewActionView layoutIfNeeded];
      double v8 = [(_UIPreviewActionsController *)self platterView];
      double v9 = [v8 superview];
      double v10 = self->_leadingPreviewActionView;
      double v11 = [(_UIPreviewActionsController *)self platterView];
      [v9 insertSubview:v10 belowSubview:v11];

      [(_UIPreviewActionsController *)self initialCenterForLeadingSwipeActionView];
      -[UIView setCenter:](self->_leadingPreviewActionView, "setCenter:");
      [(UIView *)self->_leadingPreviewActionView setHidden:1];
    }
  }
  double v12 = self->_leadingPreviewActionView;
  return v12;
}

- (_UIPreviewQuickActionView)trailingPreviewActionView
{
  if (!self->_trailingPreviewActionView)
  {
    double v3 = [(_UIPreviewActionsController *)self trailingPreviewAction];

    if (v3)
    {
      id v4 = [_UIPreviewQuickActionView alloc];
      int v5 = -[_UIPreviewQuickActionView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      trailingPreviewActionView = self->_trailingPreviewActionView;
      self->_trailingPreviewActionView = v5;

      [(UIView *)self->_trailingPreviewActionView setTranslatesAutoresizingMaskIntoConstraints:0];
      double v7 = [(_UIPreviewActionsController *)self trailingPreviewAction];
      [(_UIPreviewQuickActionView *)self->_trailingPreviewActionView setQuickAction:v7];

      [(UIView *)self->_trailingPreviewActionView layoutIfNeeded];
      double v8 = [(_UIPreviewActionsController *)self platterView];
      double v9 = [v8 superview];
      double v10 = self->_trailingPreviewActionView;
      double v11 = [(_UIPreviewActionsController *)self platterView];
      [v9 insertSubview:v10 belowSubview:v11];

      [(_UIPreviewActionsController *)self initialCenterForTrailingSwipeActionView];
      -[UIView setCenter:](self->_trailingPreviewActionView, "setCenter:");
      [(UIView *)self->_trailingPreviewActionView setHidden:1];
    }
  }
  double v12 = self->_trailingPreviewActionView;
  return v12;
}

- (CGRect)_initialPlatterFrame
{
  double v3 = [(_UIPreviewActionsController *)self platterView];
  [v3 bounds];
  double Width = CGRectGetWidth(v15);
  int v5 = [(_UIPreviewActionsController *)self platterView];
  [v5 bounds];
  double Height = CGRectGetHeight(v16);
  double v7 = [(_UIPreviewActionsController *)self containerView];
  [v7 bounds];
  double MidX = CGRectGetMidX(v17);
  double v9 = [(_UIPreviewActionsController *)self containerView];
  [v9 bounds];
  double v10 = round(CGRectGetMidY(v18) - Height * 0.5);

  double v11 = round(MidX - Width * 0.5);
  double v12 = v10;
  double v13 = Width;
  double v14 = Height;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)_hasPreviewSwipeActions
{
  double v3 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    int v5 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)_hasSelectedSwipeAction
{
  double v3 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
  if ([v3 selected])
  {
    char v4 = 1;
  }
  else
  {
    int v5 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
    char v4 = [v5 selected];
  }
  return v4;
}

- (BOOL)_isSwipeActionVisible
{
  [(_UIPlatterMenuDynamicsController *)self->_platterDynamicsController currentTranslation];
  return fabs(v2) >= 2.0;
}

- (BOOL)_previewActionsSheetIsVisible
{
  double v3 = [(_UIPreviewActionsController *)self previewActionsView];
  if (v3)
  {
    char v4 = [(_UIPreviewActionsController *)self previewActionsView];
    [v4 frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    double v13 = [(_UIPreviewActionsController *)self containerView];
    [v13 bounds];
    v21.origin.double x = v14;
    v21.origin.double y = v15;
    v21.size.double width = v16;
    v21.size.double height = v17;
    v20.origin.double x = v6;
    v20.origin.double y = v8;
    v20.size.double width = v10;
    v20.size.double height = v12;
    BOOL v18 = CGRectIntersectsRect(v20, v21);
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (double)_quickActionSelectionOffset
{
  double v3 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
  [v3 bounds];
  double Width = CGRectGetWidth(v7);

  if (Width <= 2.22044605e-16)
  {
    double v5 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
    [v5 bounds];
    double Width = CGRectGetWidth(v8);
  }
  double result = 44.0;
  if (Width <= 44.0) {
    return Width;
  }
  return result;
}

- (double)_quickActionsSelectionThresholdForPreviewMenuItemStyle:(int64_t)a3
{
  [(_UIPreviewActionsController *)self _quickActionSelectionOffset];
  double v5 = 2.0;
  if (a3 == 2) {
    double v5 = 3.5;
  }
  return v5 * v4;
}

- (void)_updateSwipeActionsState
{
  if ([(_UIPreviewActionsController *)self _hasPreviewSwipeActions])
  {
    double v3 = [(_UIPreviewActionsController *)self platterDynamicsController];
    [v3 currentTranslation];
    double v5 = v4;

    CGFloat v6 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
    [v6 setHidden:v5 > 0.0];

    CGRect v7 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
    [v7 setHidden:v5 < 0.0];

    CGRect v8 = [(_UIPreviewActionsController *)self leadingPreviewActionView];

    if (v8)
    {
      double v9 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
      CGFloat v10 = [v9 quickAction];
      -[_UIPreviewActionsController _quickActionsSelectionThresholdForPreviewMenuItemStyle:](self, "_quickActionsSelectionThresholdForPreviewMenuItemStyle:", [v10 style]);
      double v12 = v11;

      if (v12 > 0.0)
      {
        [(_UIPreviewActionsController *)self setLeadingSwipeActionViewSelected:v5 < -v12];
        double v13 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
        int v14 = [v13 selected];

        if (v14)
        {
          CGFloat v15 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
          [v15 setSelected:0];
        }
      }
    }
    CGFloat v16 = [(_UIPreviewActionsController *)self trailingPreviewActionView];

    if (v16)
    {
      CGFloat v17 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
      BOOL v18 = [v17 quickAction];
      -[_UIPreviewActionsController _quickActionsSelectionThresholdForPreviewMenuItemStyle:](self, "_quickActionsSelectionThresholdForPreviewMenuItemStyle:", [v18 style]);
      double v20 = v19;

      if (v20 > 0.0)
      {
        [(_UIPreviewActionsController *)self setTrailingSwipeActionViewSelected:v5 > v20];
        CGRect v21 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
        int v22 = [v21 selected];

        if (v22)
        {
          v23 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
          [v23 setSelected:0];
        }
      }
    }
    v24 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
    int v25 = [v24 selected];

    if (v25)
    {
      v26 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
      [v26 setHidden:0];

      v27 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
      [v27 setHidden:1];
    }
    v28 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
    int v29 = [v28 selected];

    if (v29)
    {
      v30 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
      [v30 setHidden:0];

      id v31 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
      [v31 setHidden:1];
    }
  }
}

- (void)_dismissForSelectedSwipeAction
{
  [(_UIPreviewActionsController *)self _disablePlatterController];
  double v3 = [(_UIPreviewActionsController *)self containerView];
  [v3 bounds];
  CGFloat MidX = CGRectGetMidX(v33);
  double v5 = [(_UIPreviewActionsController *)self containerView];
  [v5 bounds];
  CGFloat MidY = CGRectGetMidY(v34);

  CGRect v7 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
  if ([v7 selected]) {
    [(_UIPreviewActionsController *)self leadingPreviewActionView];
  }
  else {
  CGRect v8 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
  }

  [(_UIPreviewActionsController *)self centerForPlatterWithMenuViewDismissed];
  uint64_t v10 = v9;
  double v11 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
  int v12 = [v11 selected];

  if (v12)
  {
    double v13 = [(_UIPreviewActionsController *)self containerView];
    [v13 bounds];
    double Width = CGRectGetWidth(v35);
    CGFloat v15 = [(_UIPreviewActionsController *)self platterView];
    [v15 bounds];
    double v16 = Width + CGRectGetWidth(v36) * 0.5;
  }
  else
  {
    double v13 = [(_UIPreviewActionsController *)self platterView];
    [v13 bounds];
    double v16 = CGRectGetWidth(v37) * -0.5;
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke;
  aBlock[3] = &unk_1E52E69B8;
  aBlock[4] = self;
  double v29 = v16;
  uint64_t v30 = v10;
  id v17 = v8;
  id v28 = v17;
  CGFloat v31 = MidX;
  CGFloat v32 = MidY;
  BOOL v18 = _Block_copy(aBlock);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __61___UIPreviewActionsController__dismissForSelectedSwipeAction__block_invoke_2;
  v24 = &unk_1E52DA660;
  int v25 = self;
  id v26 = v17;
  id v19 = v17;
  double v20 = _Block_copy(&v21);
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v18, v20, 0.3, v21, v22, v23, v24, v25);
}

- (void)_dismissWithAction:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [(_UIPreviewActionsController *)self _hideChromeAndSetAffordanceHidden:0];
  }
  [(_UIPreviewActionsController *)self _disablePlatterController];
  [(_UIPreviewActionsController *)self centerForPlatterWithMenuViewDismissed];
  uint64_t v7 = v6;
  if (v4)
  {
    CGRect v8 = [(_UIPreviewActionsController *)self platterView];
    [v8 bounds];
    double v9 = -CGRectGetHeight(v18);
  }
  else
  {
    double v9 = v5;
  }
  [(_UIPreviewActionsController *)self centerForMenuDismissed];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50___UIPreviewActionsController__dismissWithAction___block_invoke;
  aBlock[3] = &unk_1E52DA520;
  aBlock[4] = self;
  void aBlock[5] = v7;
  *(double *)&aBlock[6] = v9;
  aBlock[7] = v10;
  aBlock[8] = v11;
  int v12 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50___UIPreviewActionsController__dismissWithAction___block_invoke_2;
  v15[3] = &unk_1E52DA660;
  v15[4] = self;
  id v16 = v4;
  id v13 = v4;
  int v14 = _Block_copy(v15);
  +[UIView animateWithDuration:v12 animations:v14 completion:0.3];
}

- (BOOL)_shouldDismiss
{
  BOOL v3 = [(_UIPreviewActionsController *)self _previewActionsSheetIsVisible];
  BOOL v4 = [(_UIPreviewActionsController *)self _hasSelectedSwipeAction];
  double v5 = [(_UIPreviewActionsController *)self platterDynamicsController];
  [v5 currentVelocity];
  double v7 = v6;

  return v7 >= 0.1 || !v3 && !v4;
}

- (void)_disablePlatterController
{
  BOOL v3 = [(_UIPreviewActionsController *)self platterDynamicsController];
  [v3 resetAnimator];

  [(_UIPreviewActionsController *)self setPlatterDynamicsController:0];
}

- (void)_memoizePreviewActionViews
{
  id v3 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
  id v4 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
}

- (BOOL)_platterIsInInitialPositionMostly
{
  id v3 = [(_UIPreviewActionsController *)self containerView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v19.origin.double x = v5;
  v19.origin.double y = v7;
  v19.size.double width = v9;
  v19.size.double height = v11;
  double MidX = CGRectGetMidX(v19);
  v20.origin.double x = v5;
  v20.origin.double y = v7;
  v20.size.double width = v9;
  v20.size.double height = v11;
  CGFloat v13 = round(CGRectGetMidY(v20) + -22.0);
  int v14 = [(_UIPreviewActionsController *)self platterView];
  [v14 center];
  v18.double x = v15;
  v18.double y = v16;
  v21.size.double width = 44.0;
  v21.origin.double x = round(MidX + -22.0);
  v21.origin.double y = v13;
  v21.size.double height = 44.0;
  LOBYTE(v3) = CGRectContainsPoint(v21, v18);

  return (char)v3;
}

- (void)_presentSubactionsForActionGroup:(id)a3
{
  id v4 = a3;
  CGFloat v5 = v4;
  if (v4)
  {
    double v6 = [v4 _actions];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      double v8 = [(_UIPreviewActionsController *)self previewActionsView];
      CGFloat v9 = [v5 _actions];
      double v10 = [(_UIPreviewActionsController *)self _makeAndAddToViewHierarchyPreviewActionSheetForMenuItems:v9];

      objc_initWeak(&location, self);
      CGFloat v11 = [(_UIPreviewActionsController *)self previewActionsView];
      int v12 = [v11 window];
      [v12 setUserInteractionEnabled:0];

      [(_UIPreviewActionsController *)self _disablePlatterController];
      [(_UIPreviewActionsController *)self _centerForPlatterWithMenuViewPresentedForActionSheet:v10];
      uint64_t v14 = v13;
      uint64_t v16 = v15;
      [(_UIPreviewActionsController *)self _centerForMenuPresentedForActionSheet:v8];
      double v18 = v17;
      double v20 = v19;
      [(_UIPreviewActionsController *)self _centerForMenuDismissedForActionSheet:v8];
      uint64_t v22 = v21;
      uint64_t v24 = v23;
      [(_UIPreviewActionsController *)self _centerForMenuDismissedForActionSheet:v10];
      double v26 = v25;
      double v28 = v27;
      [(_UIPreviewActionsController *)self _centerForMenuPresentedForActionSheet:v10];
      uint64_t v43 = v30;
      uint64_t v44 = v29;
      objc_msgSend(v10, "setCenter:", v26, v28);
      objc_msgSend(v8, "setCenter:", v18, v20);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke;
      aBlock[3] = &unk_1E52DD178;
      aBlock[4] = self;
      void aBlock[5] = v14;
      aBlock[6] = v16;
      CGFloat v31 = _Block_copy(aBlock);
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_2;
      v58[3] = &unk_1E52DD178;
      id v32 = v8;
      id v59 = v32;
      uint64_t v60 = v22;
      uint64_t v61 = v24;
      CGRect v33 = _Block_copy(v58);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_3;
      v54[3] = &unk_1E52DD178;
      id v34 = v10;
      id v55 = v34;
      uint64_t v56 = v44;
      uint64_t v57 = v43;
      CGRect v35 = _Block_copy(v54);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_4;
      v50[3] = &unk_1E52E98E8;
      objc_copyWeak(&v53, &location);
      id v36 = v34;
      id v51 = v36;
      id v37 = v32;
      id v52 = v37;
      v38 = _Block_copy(v50);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __64___UIPreviewActionsController__presentSubactionsForActionGroup___block_invoke_6;
      v45[3] = &unk_1E5300218;
      uint64_t v49 = 0x3FD999999999999ALL;
      id v39 = v31;
      id v46 = v39;
      id v40 = v33;
      id v47 = v40;
      id v41 = v35;
      id v48 = v41;
      id v42 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:4 delay:v45 options:v38 animations:0.4 completion:0.0];

      objc_destroyWeak(&v53);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setAffordanceAlpha:(double)a3 withDuration:(double)a4 hideOnCompletion:(BOOL)a5
{
  CGFloat v9 = [(_UIPreviewActionsController *)self affordanceView];
  [v9 alpha];
  double v11 = vabdd_f64(v10, a3);

  if (v11 > 2.22044605e-16)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81___UIPreviewActionsController__setAffordanceAlpha_withDuration_hideOnCompletion___block_invoke;
    v14[3] = &unk_1E52D9CD0;
    v14[4] = self;
    *(double *)&v14[5] = a3;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81___UIPreviewActionsController__setAffordanceAlpha_withDuration_hideOnCompletion___block_invoke_2;
    v12[3] = &unk_1E52E0478;
    BOOL v13 = a5;
    v12[4] = self;
    +[UIView animateWithDuration:v14 animations:v12 completion:a4];
  }
}

- (void)_updateAffordanceIfNecessary
{
  id v3 = [(_UIPreviewActionsController *)self affordanceView];

  if (v3)
  {
    _updateAffordanceFrameOrigin(self->_platterView, self->_affordanceView);
    BOOL v4 = [(_UIPreviewActionsController *)self _platterIsInInitialPositionMostly];
    double v5 = 0.0;
    if (v4) {
      double v5 = 1.0;
    }
    [(_UIPreviewActionsController *)self _setAffordanceAlpha:0 withDuration:v5 hideOnCompletion:0.2];
  }
}

- (CGPoint)centerForPlatterWithMenuViewPresented
{
  id v3 = [(_UIPreviewActionsController *)self previewActionsView];
  [(_UIPreviewActionsController *)self _centerForPlatterWithMenuViewPresentedForActionSheet:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)_centerForPlatterWithMenuViewPresentedForActionSheet:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIPreviewActionsController *)self delegate];
  [v5 initialPlatterPositionForPreviewActionsController:self];
  double v7 = v6;
  double v9 = v8;

  if (v4)
  {
    [(_UIPreviewActionsController *)self _centerForMenuPresentedForActionSheet:v4];
    double v11 = v10;
    [v4 bounds];
    double v12 = v11 - CGRectGetHeight(v18) * 0.5;
    BOOL v13 = [(_UIPreviewActionsController *)self platterView];
    [v13 bounds];
    double v14 = v12 - CGRectGetHeight(v19) * 0.5;

    if (v14 <= v9) {
      double v9 = v14;
    }
  }

  double v15 = v7;
  double v16 = v9;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)centerForPlatterWithMenuViewDismissed
{
  id v3 = [(_UIPreviewActionsController *)self delegate];
  [v3 initialPlatterPositionForPreviewActionsController:self];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)centerForMenuPresented
{
  id v3 = [(_UIPreviewActionsController *)self previewActionsView];
  [(_UIPreviewActionsController *)self _centerForMenuPresentedForActionSheet:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)_centerForMenuPresentedForActionSheet:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(_UIPreviewActionsController *)self containerView];
    [v5 bounds];
    double Height = CGRectGetHeight(v22);

    [v4 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    v23.origin.double x = v8;
    v23.origin.double y = v10;
    v23.size.double width = v12;
    v23.size.double height = v14;
    double v15 = Height + CGRectGetHeight(v23) * -0.5;
    double v16 = [(_UIPreviewActionsController *)self containerView];
    [v16 bounds];
    double MidX = CGRectGetMidX(v24);
  }
  else
  {
    double MidX = *MEMORY[0x1E4F1DAD8];
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  -[_UIPreviewActionsController _applyLayoutAdjustmentsForManagedViewWithPosition:](self, "_applyLayoutAdjustmentsForManagedViewWithPosition:", MidX, v15);
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (CGPoint)centerForMenuDismissed
{
  id v3 = [(_UIPreviewActionsController *)self previewActionsView];
  [(_UIPreviewActionsController *)self _centerForMenuDismissedForActionSheet:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)_centerForMenuDismissedForActionSheet:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(_UIPreviewActionsController *)self containerView];
    [v5 bounds];
    double Height = CGRectGetHeight(v21);

    [v4 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    v22.origin.double x = v8;
    v22.origin.double y = v10;
    v22.size.double width = v12;
    v22.size.double height = v14;
    double v15 = Height + CGRectGetHeight(v22) * 0.5;
    double v16 = [(_UIPreviewActionsController *)self containerView];
    [v16 bounds];
    CGFloat MidX = CGRectGetMidX(v23);
  }
  else
  {
    CGFloat MidX = *MEMORY[0x1E4F1DAD8];
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v18 = MidX;
  double v19 = v15;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (double)minimumSpacingBetweenPlatterAndMenu
{
  return 0.0;
}

- (CGPoint)initialCenterForLeadingSwipeActionView
{
  [(_UIPreviewActionsController *)self _initialPlatterFrame];
  double MinX = CGRectGetMinX(v11);
  id v4 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
  [v4 bounds];
  double v5 = MinX + CGRectGetWidth(v12) * 0.5;
  double v6 = [(_UIPreviewActionsController *)self containerView];
  [v6 bounds];
  CGFloat MidY = CGRectGetMidY(v13);

  double v8 = v5;
  double v9 = MidY;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)initialCenterForTrailingSwipeActionView
{
  [(_UIPreviewActionsController *)self _initialPlatterFrame];
  double MaxX = CGRectGetMaxX(v11);
  id v4 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
  [v4 bounds];
  double v5 = MaxX + CGRectGetWidth(v12) * -0.5;
  double v6 = [(_UIPreviewActionsController *)self containerView];
  [v6 bounds];
  CGFloat MidY = CGRectGetMidY(v13);

  double v8 = v5;
  double v9 = MidY;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (void)platterMenuDynamicsControllerDidDismissWithController:(id)a3
{
  id v4 = [(_UIPreviewActionsController *)self delegate];
  [v4 didDismissPreviewActionsController:self];
}

- (void)platterMenuDynamicsController:(id)a3 didMoveSwipeView:(id)a4 toPosition:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v10 = a4;
  [a3 currentTranslation];
  if (fabs(v9) > 2.22044605e-16)
  {
    [v10 setHidden:1];
    objc_msgSend(v10, "setCenter:", x, y);
    [(_UIPreviewActionsController *)self _updateSwipeActionsState];
  }
}

- (void)translationDidUpdateForPlatterMenuDynamicsController:(id)a3
{
  id v4 = a3;
  [v4 currentTranslation];
  if (fabs(v5) > 2.22044605e-16)
  {
    double v6 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
    [v6 setHidden:1];

    double v7 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
    [v7 setHidden:1];
  }
  [(_UIPreviewActionsController *)self _updateAffordanceIfNecessary];
  id v15 = [(_UIPreviewActionsController *)self delegate];
  [v4 currentTranslation];
  double v9 = v8;
  double v11 = v10;

  CGRect v12 = [(_UIPreviewActionsController *)self platterDynamicsController];
  [v12 currentVelocity];
  objc_msgSend(v15, "previewActionsController:didUpdatePlatterTranslation:withVelocity:", self, v9, v11, v13, v14);
}

- (CGPoint)_applyLayoutAdjustmentsForManagedViewWithPosition:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(_UIPreviewActionsController *)self previewActionsView];
  double v7 = [v6 _window];
  [v7 _managedSafeAreaInsets];
  double v9 = v8;

  if (fabs(v9) >= 2.22044605e-16)
  {
    double v10 = [(_UIPreviewActionsController *)self previewActionsView];
    [v10 contentInsets];
    double v12 = v11;

    double y = y - (v9 - v12);
  }
  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.CGFloat x = v13;
  return result;
}

- (void)_configureFeedbackGenerator
{
  id v3 = +[_UIStatesFeedbackGeneratorSwipeActionConfiguration defaultConfiguration];
  id v7 = [v3 tweakedConfigurationForClass:objc_opt_class() usage:@"swipeAction"];

  id v4 = [_UIStatesFeedbackGenerator alloc];
  double v5 = [(_UIPreviewActionsController *)self containerView];
  double v6 = [(_UIStatesFeedbackGenerator *)v4 initWithConfiguration:v7 view:v5];
  [(_UIPreviewActionsController *)self setSwipeFeedbackGenerator:v6];
}

- (void)_activateFeedbackIfNeeded
{
  id v3 = [(_UIPreviewActionsController *)self swipeFeedbackGenerator];
  char v4 = [v3 isActive];

  if ((v4 & 1) == 0)
  {
    id v5 = [(_UIPreviewActionsController *)self swipeFeedbackGenerator];
    [v5 activateWithCompletionBlock:0];
  }
}

- (void)_deactivateFeedbackIfNeeded
{
  id v3 = [(_UIPreviewActionsController *)self swipeFeedbackGenerator];
  int v4 = [v3 isActive];

  if (v4)
  {
    id v5 = [(_UIPreviewActionsController *)self swipeFeedbackGenerator];
    [v5 deactivate];
  }
}

- (void)_fireConfirmFeedbackIfNeededForInitialSelectionState:(BOOL)a3 finalSelectionState:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(_UIPreviewActionsController *)self swipeFeedbackGenerator];
  int v8 = [v7 isActive];

  if (v8)
  {
    if (!v4 || v5)
    {
      if (!v5 || v4) {
        return;
      }
      id v11 = [(_UIPreviewActionsController *)self swipeFeedbackGenerator];
      uint64_t v9 = +[_UIStatesFeedbackGeneratorSwipeActionConfiguration openState];
    }
    else
    {
      id v11 = [(_UIPreviewActionsController *)self swipeFeedbackGenerator];
      uint64_t v9 = +[_UIStatesFeedbackGeneratorSwipeActionConfiguration confirmState];
    }
    double v10 = (void *)v9;
    [v11 transitionToState:v9 ended:1];
  }
}

- (void)setLeadingSwipeActionViewSelected:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
  uint64_t v6 = [v5 selected];

  id v7 = [(_UIPreviewActionsController *)self leadingPreviewActionView];
  [v7 setSelected:v3];

  [(_UIPreviewActionsController *)self _fireConfirmFeedbackIfNeededForInitialSelectionState:v6 finalSelectionState:v3];
}

- (void)setTrailingSwipeActionViewSelected:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
  uint64_t v6 = [v5 selected];

  id v7 = [(_UIPreviewActionsController *)self trailingPreviewActionView];
  [v7 setSelected:v3];

  [(_UIPreviewActionsController *)self _fireConfirmFeedbackIfNeededForInitialSelectionState:v6 finalSelectionState:v3];
}

- (CGSize)totalPanningTranslation
{
  double width = self->_totalPanningTranslation.width;
  double height = self->_totalPanningTranslation.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTotalPanningTranslation:(CGSize)a3
{
  self->_totalPanningTranslation = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIView)affordanceView
{
  return self->_affordanceView;
}

- (void)setAffordanceView:(id)a3
{
}

- (UIImageView)affordanceImageView
{
  return self->_affordanceImageView;
}

- (void)setAffordanceImageView:(id)a3
{
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
}

- (_UIPreviewActionsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIPreviewActionsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasBegun
{
  return self->_hasBegun;
}

- (void)setHasBegun:(BOOL)a3
{
  self->_hasBegun = a3;
}

- (_UIPlatterMenuDynamicsController)platterDynamicsController
{
  return self->_platterDynamicsController;
}

- (void)setPlatterDynamicsController:(id)a3
{
}

- (_UIPreviewActionSheetView)previewActionsView
{
  return self->_previewActionsView;
}

- (void)setPreviewActionsView:(id)a3
{
}

- (void)setCurrentPreviewActionItems:(id)a3
{
}

- (void)setLeadingPreviewAction:(id)a3
{
}

- (void)setTrailingPreviewAction:(id)a3
{
}

- (void)setLeadingPreviewActionView:(id)a3
{
}

- (void)setTrailingPreviewActionView:(id)a3
{
}

- (CGPoint)lastPanningLocation
{
  double x = self->_lastPanningLocation.x;
  double y = self->_lastPanningLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastPanningLocation:(CGPoint)a3
{
  self->_lastPanningLocation = a3;
}

- (_UIStatesFeedbackGenerator)swipeFeedbackGenerator
{
  return self->_swipeFeedbackGenerator;
}

- (void)setSwipeFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_trailingPreviewActionView, 0);
  objc_storeStrong((id *)&self->_leadingPreviewActionView, 0);
  objc_storeStrong((id *)&self->_trailingPreviewAction, 0);
  objc_storeStrong((id *)&self->_leadingPreviewAction, 0);
  objc_storeStrong((id *)&self->_currentPreviewActionItems, 0);
  objc_storeStrong((id *)&self->_previewActionsView, 0);
  objc_storeStrong((id *)&self->_platterDynamicsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_affordanceImageView, 0);
  objc_storeStrong((id *)&self->_affordanceView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end