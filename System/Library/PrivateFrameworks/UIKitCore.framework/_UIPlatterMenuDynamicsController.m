@interface _UIPlatterMenuDynamicsController
- (BOOL)_isPlatterInYLockedPosition;
- (BOOL)hasBeenPresented;
- (BOOL)isCurrentlyUnderDirectManipulation;
- (BOOL)isDefaultAnimatorBehavior:(id)a3;
- (BOOL)isMenuPresented;
- (BOOL)isMenuPresenting;
- (BOOL)isSelectingSwipeAction;
- (BOOL)leadingSwipeActionViewSelected;
- (BOOL)platterPanned;
- (BOOL)trailingSwipeActionViewSelected;
- (CGPoint)centerForCurrentPlatterPosition;
- (CGPoint)centerForMenuPresentedRelativeToCurrentPlatter;
- (CGPoint)initialTouchPoint;
- (CGPoint)menuCenter;
- (CGPoint)platterCenter;
- (CGVector)currentTranslation;
- (CGVector)currentVelocity;
- (CGVector)modifiedOffsetForPosition:(CGPoint)a3 offset:(CGVector)a4 touchPosition:(CGPoint)a5 axisLock:(unint64_t)a6;
- (UIAttachmentBehavior)gestureAttachmentBehavior;
- (UIAttachmentBehavior)menuVerticalLockAttachment;
- (UIAttachmentBehavior)platterMenuAttachmentBehavior;
- (UIAttachmentBehavior)platterMenuSlidingAttachmentBehavior;
- (UICollisionBehavior)platterMenuCollisionBounds;
- (UIDynamicAnimator)animator;
- (UIDynamicItem)platterItem;
- (UIDynamicItemBehavior)menuItemBehavior;
- (UIDynamicItemBehavior)noRotationBehavior;
- (UIDynamicItemBehavior)platterItemBehavior;
- (UIView)containerView;
- (UIView)menuView;
- (UIView)platterView;
- (_UIDynamicItemObservingBehavior)observingBehavior;
- (_UIPlatterMenuDynamicsController)initWithContainerView:(id)a3 platterView:(id)a4 menuView:(id)a5 delegate:(id)a6;
- (_UIPlatterMenuDynamicsControllerDelegate)delegate;
- (_UIPlatterMenuPanningTransformer)panningLockTransformer;
- (_UIPlatterMenuSnapBehavior)menuDismissedSnapBehavior;
- (_UIPlatterMenuSnapBehavior)menuPresentedSnapBehavior;
- (_UIPlatterMenuSnapBehavior)platterSnapBehavior;
- (_UIStatesFeedbackGenerator)swipeFeedbackGenerator;
- (double)leadingSwipeEdgeMultiplier;
- (double)trailingSwipeEdgeMultiplier;
- (int64_t)_stateForPosition:(CGPoint)a3 offset:(CGVector)a4 velocity:(CGVector)a5;
- (int64_t)didPresentCount;
- (int64_t)state;
- (void)_activateFeedbackIfNeeded;
- (void)_animateToPlatterDismissedWithDuration:(double)a3 completion:(id)a4;
- (void)_animateToPlatterPresentedWithVelocity:(CGVector)a3;
- (void)_beginInYLockedStatePresented;
- (void)_configureAnimator;
- (void)_configureFeedbackGenerator;
- (void)_deactivateFeedbackIfNeeded;
- (void)_fireConfirmFeedbackIfNeededForInitialSelectionState:(BOOL)a3 finalSelectionState:(BOOL)a4;
- (void)_positionSwipeActionViewsForCurrentPlatterViewPosition;
- (void)_updateSwipeEdgeMultipliersIfNeededForTouchPosition:(CGPoint)a3;
- (void)addBehaviorIfNotPresent:(id)a3;
- (void)beginTransitionWithAnimatorUsingBehaviors:(id)a3 observedItems:(id)a4 stateIfCompleted:(int64_t)a5;
- (void)dealloc;
- (void)didBeginPanningWithPoint:(CGPoint)a3;
- (void)didEndPanningWithPoint:(CGPoint)a3;
- (void)didPanWithPoint:(CGPoint)a3;
- (void)lockIntoYAxis;
- (void)panningTransformer:(id)a3 didBeginPanToTransformedPosition:(CGPoint)a4;
- (void)panningTransformer:(id)a3 didEndPanToTransformedPosition:(CGPoint)a4 offsetFromPrevious:(CGVector)a5 velocity:(CGVector)a6;
- (void)panningTransformer:(id)a3 didPanToTransformedPosition:(CGPoint)a4 offsetFromPrevious:(CGVector)a5 touchPosition:(CGPoint)a6 velocity:(CGVector)a7 didChangeAxis:(BOOL)a8 axisLock:(unint64_t)a9;
- (void)performActionsAndEnterState:(int64_t)a3;
- (void)performActionsAndEnterState:(int64_t)a3 velocity:(CGVector)a4 underDirectManipulation:(BOOL)a5;
- (void)resetAnimator;
- (void)resetAnimatorToDefaultBehaviors;
- (void)setAnimator:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidPresentCount:(int64_t)a3;
- (void)setGestureAttachmentBehavior:(id)a3;
- (void)setInitialTouchPoint:(CGPoint)a3;
- (void)setIsCurrentlyUnderDirectManipulation:(BOOL)a3;
- (void)setLeadingSwipeActionViewSelected:(BOOL)a3;
- (void)setLeadingSwipeEdgeMultiplier:(double)a3;
- (void)setMenuDismissedSnapBehavior:(id)a3;
- (void)setMenuItemBehavior:(id)a3;
- (void)setMenuPresentedSnapBehavior:(id)a3;
- (void)setMenuVerticalLockAttachment:(id)a3;
- (void)setMenuView:(id)a3;
- (void)setNoRotationBehavior:(id)a3;
- (void)setObservingBehavior:(id)a3;
- (void)setPanningLockTransformer:(id)a3;
- (void)setPlatterItem:(id)a3;
- (void)setPlatterItemBehavior:(id)a3;
- (void)setPlatterMenuAttachmentBehavior:(id)a3;
- (void)setPlatterMenuCollisionBounds:(id)a3;
- (void)setPlatterMenuSlidingAttachmentBehavior:(id)a3;
- (void)setPlatterSnapBehavior:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSwipeFeedbackGenerator:(id)a3;
- (void)setTrailingSwipeActionViewSelected:(BOOL)a3;
- (void)setTrailingSwipeEdgeMultiplier:(double)a3;
- (void)stopObservingBehavior;
- (void)toggleAnimatorDebugState;
@end

@implementation _UIPlatterMenuDynamicsController

- (_UIPlatterMenuDynamicsController)initWithContainerView:(id)a3 platterView:(id)a4 menuView:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_UIPlatterMenuDynamicsController;
  v14 = [(_UIPlatterMenuDynamicsController *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v13);
    objc_storeWeak((id *)&v15->_containerView, v10);
    objc_storeWeak((id *)&v15->_platterView, v11);
    objc_storeWeak((id *)&v15->_menuView, v12);
    v15->_state = 0;
    [(_UIPlatterMenuDynamicsController *)v15 _configureAnimator];
    [(_UIPlatterMenuDynamicsController *)v15 _configureFeedbackGenerator];
  }

  return v15;
}

- (CGVector)currentTranslation
{
  v2 = [(_UIPlatterMenuDynamicsController *)self panningLockTransformer];
  [v2 offset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.dy = v8;
  result.dx = v7;
  return result;
}

- (CGVector)currentVelocity
{
  v2 = [(_UIPlatterMenuDynamicsController *)self panningLockTransformer];
  [v2 velocity];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.dy = v8;
  result.dx = v7;
  return result;
}

- (void)didBeginPanningWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(_UIPlatterMenuDynamicsController *)self _activateFeedbackIfNeeded];
  -[_UIPlatterMenuDynamicsController setInitialTouchPoint:](self, "setInitialTouchPoint:", x, y);
  [(_UIPlatterMenuDynamicsController *)self setIsCurrentlyUnderDirectManipulation:1];
  -[_UIPlatterMenuDynamicsController _updateSwipeEdgeMultipliersIfNeededForTouchPosition:](self, "_updateSwipeEdgeMultipliersIfNeededForTouchPosition:", x, y);
  id v9 = [(_UIPlatterMenuDynamicsController *)self panningLockTransformer];
  double v6 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v6 center];
  objc_msgSend(v9, "didBeginPanningWithTouchPosition:currentTransformedPosition:", x, y, v7, v8);
}

- (void)didPanWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v9 = [(_UIPlatterMenuDynamicsController *)self panningLockTransformer];
  double v6 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v6 center];
  objc_msgSend(v9, "didPanWithTouchPosition:currentTransformedPosition:", x, y, v7, v8);
}

- (void)didEndPanningWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(_UIPlatterMenuDynamicsController *)self _deactivateFeedbackIfNeeded];
  [(_UIPlatterMenuDynamicsController *)self setIsCurrentlyUnderDirectManipulation:0];
  id v9 = [(_UIPlatterMenuDynamicsController *)self panningLockTransformer];
  double v6 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v6 center];
  objc_msgSend(v9, "didEndPanningWithTouchPosition:currentTransformedPosition:", x, y, v7, v8);
}

- (void)toggleAnimatorDebugState
{
  id v5 = [(_UIPlatterMenuDynamicsController *)self animator];
  uint64_t v3 = [v5 isDebugEnabled] ^ 1;
  double v4 = [(_UIPlatterMenuDynamicsController *)self animator];
  [v4 setDebugEnabled:v3];
}

- (void)dealloc
{
  uint64_t v3 = [(_UIPlatterMenuDynamicsController *)self animator];
  [v3 removeAllBehaviors];

  [(_UIPlatterMenuDynamicsController *)self _deactivateFeedbackIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)_UIPlatterMenuDynamicsController;
  [(_UIPlatterMenuDynamicsController *)&v4 dealloc];
}

- (void)resetAnimator
{
  id v2 = [(_UIPlatterMenuDynamicsController *)self animator];
  [v2 removeAllBehaviors];
}

- (BOOL)isMenuPresented
{
  return [(_UIPlatterMenuDynamicsController *)self state] == 2;
}

- (BOOL)isMenuPresenting
{
  return [(_UIPlatterMenuDynamicsController *)self state] == 1;
}

- (BOOL)isSelectingSwipeAction
{
  uint64_t v3 = [(_UIPlatterMenuDynamicsController *)self platterView];
  objc_super v4 = [(_UIPlatterMenuDynamicsController *)self animator];
  id v5 = [(_UIPlatterMenuDynamicsController *)self platterItem];
  [v4 updateItemFromCurrentState:v5];

  [v3 center];
  double v7 = v6;
  double v8 = [(_UIPlatterMenuDynamicsController *)self delegate];
  [v8 centerForPlatterWithMenuViewDismissed];
  double v10 = v9;

  return vabdd_f64(v7, v10) > 2.0;
}

- (BOOL)platterPanned
{
  uint64_t v3 = [(_UIPlatterMenuDynamicsController *)self delegate];
  [v3 centerForPlatterWithMenuViewDismissed];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v8 center];
  double v10 = v9;
  double v12 = v11;

  BOOL v13 = vabdd_f64(v5, v10) >= 3.0;
  return vabdd_f64(v7, v12) > 3.0 || v13;
}

- (void)lockIntoYAxis
{
  id v2 = [(_UIPlatterMenuDynamicsController *)self panningLockTransformer];
  [v2 lockIntoYAxis];
}

- (void)_beginInYLockedStatePresented
{
  [(_UIPlatterMenuDynamicsController *)self setState:2];
  id v3 = [(_UIPlatterMenuDynamicsController *)self panningLockTransformer];
  [v3 _enterYLockedState];
}

- (void)_animateToPlatterPresentedWithVelocity:(CGVector)a3
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  double v6 = [(_UIPlatterMenuDynamicsController *)self panningLockTransformer];
  [v6 lockIntoYAxis];

  -[_UIPlatterMenuDynamicsController performActionsAndEnterState:velocity:underDirectManipulation:](self, "performActionsAndEnterState:velocity:underDirectManipulation:", 1, 0, dx, dy);
}

- (void)_animateToPlatterDismissedWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [(_UIPlatterMenuDynamicsController *)self resetAnimator];
  double v7 = [(_UIPlatterMenuDynamicsController *)self delegate];
  [v7 centerForPlatterWithMenuViewDismissed];
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  double v12 = [(_UIPlatterMenuDynamicsController *)self delegate];
  [v12 centerForMenuDismissed];
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86___UIPlatterMenuDynamicsController__animateToPlatterDismissedWithDuration_completion___block_invoke;
  v20[3] = &unk_1E52DA520;
  v20[4] = self;
  v20[5] = v9;
  v20[6] = v11;
  v20[7] = v14;
  v20[8] = v16;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86___UIPlatterMenuDynamicsController__animateToPlatterDismissedWithDuration_completion___block_invoke_2;
  v18[3] = &unk_1E52D9FE8;
  id v19 = v6;
  id v17 = v6;
  +[UIView animateWithDuration:v20 animations:v18 completion:a3];
}

- (BOOL)hasBeenPresented
{
  return [(_UIPlatterMenuDynamicsController *)self didPresentCount] > 0;
}

- (void)panningTransformer:(id)a3 didBeginPanToTransformedPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(_UIPlatterMenuDynamicsController *)self resetAnimatorToDefaultBehaviors];
  double v7 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
  objc_msgSend(v7, "setAnchorPoint:", x, y);

  uint64_t v8 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
  [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v8];

  uint64_t v9 = [(_UIPlatterMenuDynamicsController *)self animator];
  uint64_t v10 = [(_UIPlatterMenuDynamicsController *)self platterItem];
  [v9 updateItemFromCurrentState:v10];

  int64_t v11 = [(_UIPlatterMenuDynamicsController *)self state];
  [(_UIPlatterMenuDynamicsController *)self performActionsAndEnterState:v11];
}

- (void)panningTransformer:(id)a3 didPanToTransformedPosition:(CGPoint)a4 offsetFromPrevious:(CGVector)a5 touchPosition:(CGPoint)a6 velocity:(CGVector)a7 didChangeAxis:(BOOL)a8 axisLock:(unint64_t)a9
{
  BOOL v10 = a8;
  ddouble y = a7.dy;
  ddouble x = a7.dx;
  double y = a6.y;
  double x = a6.x;
  double v14 = a5.dy;
  double v15 = a5.dx;
  double v16 = a4.y;
  double v17 = a4.x;
  id v19 = [(_UIPlatterMenuDynamicsController *)self animator];
  v20 = [(_UIPlatterMenuDynamicsController *)self platterItem];
  [v19 updateItemFromCurrentState:v20];

  v21 = [(_UIPlatterMenuDynamicsController *)self animator];
  v22 = [(_UIPlatterMenuDynamicsController *)self menuView];
  [v21 updateItemFromCurrentState:v22];

  if (a9)
  {
    double v49 = dy;
    -[_UIPlatterMenuDynamicsController modifiedOffsetForPosition:offset:touchPosition:axisLock:](self, "modifiedOffsetForPosition:offset:touchPosition:axisLock:", a9, v17, v16, v15, v14, x, y);
    double v24 = v23;
    double v26 = v25;
    v27 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
    [v27 anchorPoint];
    double v29 = v28;
    double v31 = v30;

    double v32 = v24 + v29;
    double v33 = v26 + v31;
    v34 = [(_UIPlatterMenuDynamicsController *)self delegate];
    id v51 = v34;
    if (v10)
    {
      if (a9 == 1)
      {
        [v34 centerForPlatterWithMenuViewDismissed];
        double v33 = v36;
      }
      else if (a9 == 2)
      {
        [v34 centerForPlatterWithMenuViewDismissed];
        double v32 = v35;
      }
    }
    v37 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
    objc_msgSend(v37, "setAnchorPoint:", v32, v33);

    if ([(_UIPlatterMenuDynamicsController *)self state] == 2
      || [(_UIPlatterMenuDynamicsController *)self state] == 1)
    {
      [(_UIPlatterMenuDynamicsController *)self centerForMenuPresentedRelativeToCurrentPlatter];
      double v39 = v38;
      double v41 = v26 + v40;
      v42 = [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
      objc_msgSend(v42, "setAnchorPoint:", v39, v41);
    }
    [v51 centerForPlatterWithMenuViewPresented];
    double v44 = v43;
    [v51 minimumSpacingBetweenPlatterAndMenu];
    if (v16 + v45 * 0.5 < v44)
    {
      v46 = [(_UIPlatterMenuDynamicsController *)self animator];
      v47 = [(_UIPlatterMenuDynamicsController *)self platterMenuSlidingAttachmentBehavior];
      [v46 removeBehavior:v47];
    }
    [(_UIPlatterMenuDynamicsController *)self _positionSwipeActionViewsForCurrentPlatterViewPosition];
    int64_t v48 = -[_UIPlatterMenuDynamicsController _stateForPosition:offset:velocity:](self, "_stateForPosition:offset:velocity:", v17, v16, v15, v14, dx, v49);
    if (v48 != [(_UIPlatterMenuDynamicsController *)self state]) {
      -[_UIPlatterMenuDynamicsController performActionsAndEnterState:velocity:underDirectManipulation:](self, "performActionsAndEnterState:velocity:underDirectManipulation:", v48, 1, dx, v49);
    }
    if (objc_opt_respondsToSelector()) {
      [v51 translationDidUpdateForPlatterMenuDynamicsController:self];
    }
  }
}

- (void)panningTransformer:(id)a3 didEndPanToTransformedPosition:(CGPoint)a4 offsetFromPrevious:(CGVector)a5 velocity:(CGVector)a6
{
  ddouble y = a6.dy;
  ddouble x = a6.dx;
  double v8 = a5.dy;
  double v9 = a5.dx;
  double y = a4.y;
  double x = a4.x;
  uint64_t v13 = [(_UIPlatterMenuDynamicsController *)self animator];
  double v14 = [(_UIPlatterMenuDynamicsController *)self menuView];
  [v13 updateItemFromCurrentState:v14];

  double v15 = [(_UIPlatterMenuDynamicsController *)self animator];
  double v16 = [(_UIPlatterMenuDynamicsController *)self platterItem];
  [v15 updateItemFromCurrentState:v16];

  int64_t v17 = -[_UIPlatterMenuDynamicsController _stateForPosition:offset:velocity:](self, "_stateForPosition:offset:velocity:", x, y, v9, v8, dx, dy);
  uint64_t v18 = 3;
  if (v17) {
    uint64_t v18 = v17;
  }
  if (v17 == 2) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v18;
  }
  -[_UIPlatterMenuDynamicsController performActionsAndEnterState:velocity:underDirectManipulation:](self, "performActionsAndEnterState:velocity:underDirectManipulation:", v19, 0, dx, dy);
}

- (void)_configureAnimator
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v3 = [_UIPlatterItem alloc];
  double v4 = [(_UIPlatterMenuDynamicsController *)self platterView];
  double v5 = [(_UIPlatterItem *)v3 initWithView:v4];

  id v6 = [UIDynamicAnimator alloc];
  double v7 = [(_UIPlatterMenuDynamicsController *)self containerView];
  double v8 = [(UIDynamicAnimator *)v6 initWithReferenceView:v7];
  [(_UIPlatterMenuDynamicsController *)self setAnimator:v8];

  double v9 = [UIDynamicItemBehavior alloc];
  v69[0] = v5;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
  int64_t v11 = [(UIDynamicItemBehavior *)v9 initWithItems:v10];
  [(_UIPlatterMenuDynamicsController *)self setPlatterItemBehavior:v11];

  double v12 = [(_UIPlatterMenuDynamicsController *)self platterItemBehavior];
  [v12 setDensity:0.0001];

  uint64_t v13 = [(_UIPlatterMenuDynamicsController *)self platterItemBehavior];
  [v13 setResistance:0.2];

  double v14 = [(_UIPlatterMenuDynamicsController *)self platterItemBehavior];
  [v14 setElasticity:0.1];

  double v15 = [UIDynamicItemBehavior alloc];
  double v16 = [(_UIPlatterMenuDynamicsController *)self menuView];
  v68 = v16;
  int64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  uint64_t v18 = [(UIDynamicItemBehavior *)v15 initWithItems:v17];
  [(_UIPlatterMenuDynamicsController *)self setMenuItemBehavior:v18];

  uint64_t v19 = [(_UIPlatterMenuDynamicsController *)self menuItemBehavior];
  [v19 setDensity:0.01];

  v20 = [(_UIPlatterMenuDynamicsController *)self menuItemBehavior];
  [v20 setResistance:0.2];

  v21 = [(_UIPlatterMenuDynamicsController *)self menuItemBehavior];
  [v21 setElasticity:0.1];

  v22 = [UIAttachmentBehavior alloc];
  double v23 = [(_UIPlatterMenuDynamicsController *)self menuView];
  double v24 = [(UIAttachmentBehavior *)v22 initWithItem:v23 attachedToItem:v5];
  [(_UIPlatterMenuDynamicsController *)self setPlatterMenuAttachmentBehavior:v24];

  double v25 = [(_UIPlatterMenuDynamicsController *)self platterMenuAttachmentBehavior];
  [v25 setDamping:0.6];

  double v26 = [(_UIPlatterMenuDynamicsController *)self platterMenuAttachmentBehavior];
  [v26 setFrequency:2.0];

  v27 = [UIAttachmentBehavior alloc];
  double v28 = *MEMORY[0x1E4F1DAD8];
  double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v30 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:](v27, "initWithItem:attachedToAnchor:", v5, *MEMORY[0x1E4F1DAD8], v29);
  [(_UIPlatterMenuDynamicsController *)self setGestureAttachmentBehavior:v30];

  double v31 = -[_UIPlatterMenuSnapBehavior initWithItem:attachedToAnchor:]([_UIPlatterMenuSnapBehavior alloc], "initWithItem:attachedToAnchor:", v5, v28, v29);
  [(_UIPlatterMenuDynamicsController *)self setPlatterSnapBehavior:v31];

  double v32 = [_UIPlatterMenuSnapBehavior alloc];
  double v33 = [(_UIPlatterMenuDynamicsController *)self menuView];
  v34 = -[_UIPlatterMenuSnapBehavior initWithItem:attachedToAnchor:](v32, "initWithItem:attachedToAnchor:", v33, v28, v29);
  [(_UIPlatterMenuDynamicsController *)self setMenuPresentedSnapBehavior:v34];

  double v35 = [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
  [v35 setDamping:0.55];

  double v36 = [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
  [v36 setFrequency:2.0];

  v37 = [_UIPlatterMenuSnapBehavior alloc];
  double v38 = [(_UIPlatterMenuDynamicsController *)self menuView];
  double v39 = -[_UIPlatterMenuSnapBehavior initWithItem:attachedToAnchor:](v37, "initWithItem:attachedToAnchor:", v38, v28, v29);
  [(_UIPlatterMenuDynamicsController *)self setMenuDismissedSnapBehavior:v39];

  double v40 = [(_UIPlatterMenuDynamicsController *)self menuDismissedSnapBehavior];
  [v40 setDamping:0.3];

  double v41 = [(_UIPlatterMenuDynamicsController *)self menuDismissedSnapBehavior];
  [v41 setFrequency:1.0];

  v42 = [UIDynamicItemBehavior alloc];
  double v43 = [(_UIPlatterMenuDynamicsController *)self menuView];
  v67[0] = v43;
  v67[1] = v5;
  double v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
  double v45 = [(UIDynamicItemBehavior *)v42 initWithItems:v44];
  [(_UIPlatterMenuDynamicsController *)self setNoRotationBehavior:v45];

  v46 = [(_UIPlatterMenuDynamicsController *)self noRotationBehavior];
  [v46 setDensity:0.0];

  v47 = [(_UIPlatterMenuDynamicsController *)self noRotationBehavior];
  [v47 setResistance:0.0];

  int64_t v48 = [(_UIPlatterMenuDynamicsController *)self noRotationBehavior];
  [v48 setFriction:0.0];

  double v49 = [(_UIPlatterMenuDynamicsController *)self noRotationBehavior];
  [v49 setAllowsRotation:0];

  v50 = [(_UIPlatterMenuDynamicsController *)self menuView];
  id v51 = [(_UIPlatterMenuDynamicsController *)self menuView];
  [v51 center];
  v52 = +[UIAttachmentBehavior slidingAttachmentWithItem:attachmentAnchor:axisOfTranslation:](UIAttachmentBehavior, "slidingAttachmentWithItem:attachmentAnchor:axisOfTranslation:", v50);
  [(_UIPlatterMenuDynamicsController *)self setMenuVerticalLockAttachment:v52];

  v53 = [UICollisionBehavior alloc];
  v66[0] = v5;
  v54 = [(_UIPlatterMenuDynamicsController *)self menuView];
  v66[1] = v54;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  v56 = [(UICollisionBehavior *)v53 initWithItems:v55];
  [(_UIPlatterMenuDynamicsController *)self setPlatterMenuCollisionBounds:v56];

  v57 = [(_UIPlatterMenuDynamicsController *)self menuView];
  v58 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v58 center];
  v59 = +[UIAttachmentBehavior pinAttachmentWithItem:attachedToItem:attachmentAnchor:](UIAttachmentBehavior, "pinAttachmentWithItem:attachedToItem:attachmentAnchor:", v5, v57);
  [(_UIPlatterMenuDynamicsController *)self setPlatterMenuSlidingAttachmentBehavior:v59];

  v60 = [(_UIPlatterMenuDynamicsController *)self animator];
  v61 = [(_UIPlatterMenuDynamicsController *)self noRotationBehavior];
  [v60 addBehavior:v61];

  v62 = [(_UIPlatterMenuDynamicsController *)self animator];
  v63 = [(_UIPlatterMenuDynamicsController *)self menuVerticalLockAttachment];
  [v62 addBehavior:v63];

  v64 = [(_UIPlatterMenuDynamicsController *)self animator];
  v65 = [(_UIPlatterMenuDynamicsController *)self platterMenuCollisionBounds];
  [v64 addBehavior:v65];

  [(_UIPlatterMenuDynamicsController *)self setPlatterItem:v5];
}

- (void)stopObservingBehavior
{
  id v3 = [(_UIPlatterMenuDynamicsController *)self observingBehavior];
  [v3 cancel];

  [(_UIPlatterMenuDynamicsController *)self setObservingBehavior:0];
}

- (int64_t)_stateForPosition:(CGPoint)a3 offset:(CGVector)a4 velocity:(CGVector)a5
{
  ddouble y = a5.dy;
  double y = a3.y;
  BOOL v8 = [(_UIPlatterMenuDynamicsController *)self _isPlatterInYLockedPosition];
  int64_t v9 = [(_UIPlatterMenuDynamicsController *)self state];
  if (v8)
  {
    BOOL v10 = [(_UIPlatterMenuDynamicsController *)self delegate];
    if ([(_UIPlatterMenuDynamicsController *)self state])
    {
      if ([(_UIPlatterMenuDynamicsController *)self state] == 2)
      {
        [v10 centerForMenuPresented];
        double v12 = v11;
        [(_UIPlatterMenuDynamicsController *)self menuCenter];
        goto LABEL_5;
      }
      if ([(_UIPlatterMenuDynamicsController *)self state] == 1)
      {
        [v10 centerForMenuPresented];
        double v12 = v16;
        [(_UIPlatterMenuDynamicsController *)self menuCenter];
        if (dy >= 0.0 || v13 >= v12 + -40.0)
        {
LABEL_5:
          if (v13 > v12 + 40.0 && dy > 0.0) {
            int64_t v9 = 3;
          }
          goto LABEL_23;
        }
        int64_t v9 = 2;
LABEL_23:

        return v9;
      }
      if ([(_UIPlatterMenuDynamicsController *)self state] != 3) {
        goto LABEL_23;
      }
      if (dy >= 0.0) {
        goto LABEL_23;
      }
      [v10 centerForPlatterWithMenuViewDismissed];
      if (y >= v17 + -70.0) {
        goto LABEL_23;
      }
    }
    else
    {
      [v10 centerForPlatterWithMenuViewDismissed];
      if (y >= v15 + -60.0 && (dy >= 0.0 || fabs(dy) <= 500.0)) {
        goto LABEL_23;
      }
    }
    int64_t v9 = 1;
    goto LABEL_23;
  }
  return v9;
}

- (void)performActionsAndEnterState:(int64_t)a3
{
}

- (void)performActionsAndEnterState:(int64_t)a3 velocity:(CGVector)a4 underDirectManipulation:(BOOL)a5
{
  BOOL v5 = a5;
  ddouble y = a4.dy;
  v117[4] = *MEMORY[0x1E4F143B8];
  [(_UIPlatterMenuDynamicsController *)self setState:a4.dx];
  int64_t v9 = [(_UIPlatterMenuDynamicsController *)self delegate];
  BOOL v10 = v9;
  switch(a3)
  {
    case 0:
      if ([(_UIPlatterMenuDynamicsController *)self didPresentCount] >= 1) {
        [v10 platterMenuDynamicsControllerDidDismissWithController:self];
      }
      [(_UIPlatterMenuDynamicsController *)self resetAnimatorToDefaultBehaviors];
      if (v5)
      {
        [v10 centerForMenuDismissed];
        double v12 = v11;
        double v14 = v13;
        double v15 = [(_UIPlatterMenuDynamicsController *)self menuDismissedSnapBehavior];
        objc_msgSend(v15, "setAnchorPoint:", v12, v14);

        uint64_t v16 = [(_UIPlatterMenuDynamicsController *)self menuDismissedSnapBehavior];
        goto LABEL_8;
      }
      v42 = [(_UIPlatterMenuDynamicsController *)self animator];
      double v43 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
      [v42 removeBehavior:v43];

      [v10 centerForPlatterWithMenuViewDismissed];
      double v45 = v44;
      double v47 = v46;
      int64_t v48 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
      objc_msgSend(v48, "setAnchorPoint:", v45, v47);

      double v49 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
      [v49 setDamping:0.3];

      v50 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
      [v50 setFrequency:3.0];

      [v10 centerForMenuDismissed];
      double v52 = v51;
      double v54 = v53;
      v55 = [(_UIPlatterMenuDynamicsController *)self menuDismissedSnapBehavior];
      objc_msgSend(v55, "setAnchorPoint:", v52, v54);

      v56 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
      [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v56];

      v57 = [(_UIPlatterMenuDynamicsController *)self menuDismissedSnapBehavior];
      [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v57];

      uint64_t v41 = [(_UIPlatterMenuDynamicsController *)self platterItemBehavior];
      goto LABEL_15;
    case 1:
      [v9 centerForMenuPresented];
      if (!v5)
      {
        double v59 = v17;
        double v60 = v18;
        [(_UIPlatterMenuDynamicsController *)self resetAnimatorToDefaultBehaviors];
        v61 = [(_UIPlatterMenuDynamicsController *)self animator];
        v62 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
        [v61 removeBehavior:v62];

        [v10 centerForPlatterWithMenuViewPresented];
        double v64 = v63;
        double v66 = v65;
        v67 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        objc_msgSend(v67, "setAnchorPoint:", v64, v66);

        v68 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        [v68 setDamping:0.4];

        v69 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        [v69 setFrequency:1.4];

        v70 = [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
        objc_msgSend(v70, "setAnchorPoint:", v59, v60);

        v71 = [(_UIPlatterMenuDynamicsController *)self platterItemBehavior];
        v72 = [(_UIPlatterMenuDynamicsController *)self platterItem];
        objc_msgSend(v71, "addLinearVelocity:forItem:", v72, 0.0, dy);

        v73 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        v115[0] = v73;
        v74 = [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
        v115[1] = v74;
        v75 = [(_UIPlatterMenuDynamicsController *)self platterItemBehavior];
        v115[2] = v75;
        v76 = [(_UIPlatterMenuDynamicsController *)self menuItemBehavior];
        v115[3] = v76;
        v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:4];
        v78 = [(_UIPlatterMenuDynamicsController *)self platterItem];
        v79 = [(_UIPlatterMenuDynamicsController *)self menuView];
        v114[1] = v79;
        v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:2];
        v81 = self;
        v82 = v77;
        v83 = v80;
        uint64_t v84 = 2;
        goto LABEL_20;
      }
      [(_UIPlatterMenuDynamicsController *)self resetAnimatorToDefaultBehaviors];
      [(_UIPlatterMenuDynamicsController *)self centerForMenuPresentedRelativeToCurrentPlatter];
      double v20 = v19;
      double v22 = v21;
      double v23 = [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
      objc_msgSend(v23, "setAnchorPoint:", v20, v22);

      uint64_t v16 = [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
LABEL_8:
      double v24 = (void *)v16;
      [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v16];

      uint64_t v25 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
      goto LABEL_18;
    case 2:
      [(_UIPlatterMenuDynamicsController *)self setDidPresentCount:[(_UIPlatterMenuDynamicsController *)self didPresentCount] + 1];
      [(_UIPlatterMenuDynamicsController *)self resetAnimatorToDefaultBehaviors];
      if (v5)
      {
        double v26 = [(_UIPlatterMenuDynamicsController *)self platterMenuSlidingAttachmentBehavior];
        [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v26];

        v27 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
        [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v27];

        [v10 centerForMenuPresented];
        double v29 = v28;
        double v31 = v30;
        double v32 = [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
        objc_msgSend(v32, "setAnchorPoint:", v29, v31);

        [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
      }
      else
      {
        v85 = [(_UIPlatterMenuDynamicsController *)self animator];
        v86 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
        [v85 removeBehavior:v86];

        [v10 centerForMenuPresented];
        double v88 = v87;
        double v90 = v89;
        v91 = [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
        objc_msgSend(v91, "setAnchorPoint:", v88, v90);

        v92 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        [v92 setDamping:0.4];

        v93 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        [v93 setFrequency:1.4];

        [v10 centerForPlatterWithMenuViewPresented];
        double v95 = v94;
        double v97 = v96;
        v98 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        objc_msgSend(v98, "setAnchorPoint:", v95, v97);

        v99 = [(_UIPlatterMenuDynamicsController *)self menuPresentedSnapBehavior];
        [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v99];

        [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
      uint64_t v25 = };
      goto LABEL_18;
    case 3:
      [(_UIPlatterMenuDynamicsController *)self resetAnimatorToDefaultBehaviors];
      if (v5)
      {
        [v10 centerForMenuDismissed];
        double v34 = v33;
        double v36 = v35;
        v37 = [(_UIPlatterMenuDynamicsController *)self menuDismissedSnapBehavior];
        objc_msgSend(v37, "setAnchorPoint:", v34, v36);

        double v38 = [(_UIPlatterMenuDynamicsController *)self animator];
        double v39 = [(_UIPlatterMenuDynamicsController *)self platterMenuSlidingAttachmentBehavior];
        [v38 removeBehavior:v39];

        double v40 = [(_UIPlatterMenuDynamicsController *)self menuDismissedSnapBehavior];
        [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v40];

        uint64_t v41 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
LABEL_15:
        v58 = (void *)v41;
        [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v41];

        uint64_t v25 = [(_UIPlatterMenuDynamicsController *)self menuItemBehavior];
LABEL_18:
        v73 = (void *)v25;
        [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v25];
      }
      else
      {
        v100 = [(_UIPlatterMenuDynamicsController *)self animator];
        v101 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
        [v100 removeBehavior:v101];

        [v10 centerForPlatterWithMenuViewDismissed];
        double v103 = v102;
        double v105 = v104;
        v106 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        objc_msgSend(v106, "setAnchorPoint:", v103, v105);

        v107 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        [v107 setDamping:0.3];

        v108 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        [v108 setFrequency:3.0];

        [v10 centerForMenuDismissed];
        double v110 = v109;
        double v112 = v111;
        v113 = [(_UIPlatterMenuDynamicsController *)self menuDismissedSnapBehavior];
        objc_msgSend(v113, "setAnchorPoint:", v110, v112);

        v73 = [(_UIPlatterMenuDynamicsController *)self platterSnapBehavior];
        v117[0] = v73;
        v74 = [(_UIPlatterMenuDynamicsController *)self platterItemBehavior];
        v117[1] = v74;
        v75 = [(_UIPlatterMenuDynamicsController *)self menuDismissedSnapBehavior];
        v117[2] = v75;
        v76 = [(_UIPlatterMenuDynamicsController *)self menuItemBehavior];
        v117[3] = v76;
        v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:4];
        v78 = [(_UIPlatterMenuDynamicsController *)self platterItem];
        v116[0] = v78;
        v79 = [(_UIPlatterMenuDynamicsController *)self menuView];
        v116[1] = v79;
        v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
        v81 = self;
        v82 = v77;
        v83 = v80;
        uint64_t v84 = 0;
LABEL_20:
        [(_UIPlatterMenuDynamicsController *)v81 beginTransitionWithAnimatorUsingBehaviors:v82 observedItems:v83 stateIfCompleted:v84];
      }
LABEL_22:

      return;
    default:
      goto LABEL_22;
  }
}

- (void)beginTransitionWithAnimatorUsingBehaviors:(id)a3 observedItems:(id)a4 stateIfCompleted:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [(_UIPlatterMenuDynamicsController *)self stopObservingBehavior];
  [(_UIPlatterMenuDynamicsController *)self resetAnimatorToDefaultBehaviors];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109___UIPlatterMenuDynamicsController_beginTransitionWithAnimatorUsingBehaviors_observedItems_stateIfCompleted___block_invoke;
  v18[3] = &unk_1E5300098;
  void v18[4] = self;
  [v8 enumerateObjectsUsingBlock:v18];
  objc_initWeak(&location, self);
  BOOL v10 = [(UIDynamicItemBehavior *)[_UIDynamicItemObservingBehavior alloc] initWithItems:v9];
  [(_UIPlatterMenuDynamicsController *)self setObservingBehavior:v10];

  double v11 = [(_UIPlatterMenuDynamicsController *)self observingBehavior];
  objc_msgSend(v11, "setTargetVelocity:", 50.0, 50.0);

  double v12 = [(_UIPlatterMenuDynamicsController *)self observingBehavior];
  [v12 setCompletionHandlerInvocationDelay:0.1];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  objc_copyWeak(v16, &location);
  v16[1] = (id)a5;
  double v13 = [(_UIPlatterMenuDynamicsController *)self observingBehavior];
  [v13 setCompletionHandler:&v15];

  double v14 = [(_UIPlatterMenuDynamicsController *)self observingBehavior];
  [(_UIPlatterMenuDynamicsController *)self addBehaviorIfNotPresent:v14];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (CGVector)modifiedOffsetForPosition:(CGPoint)a3 offset:(CGVector)a4 touchPosition:(CGPoint)a5 axisLock:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  ddouble y = a4.dy;
  ddouble x = a4.dx;
  double v11 = a3.y;
  double v12 = a3.x;
  double v14 = [(_UIPlatterMenuDynamicsController *)self delegate];
  uint64_t v15 = v14;
  if (!a6) {
    goto LABEL_25;
  }
  double v16 = 1.0;
  if (a6 == 1)
  {
    [v14 centerForPlatterWithMenuViewDismissed];
    double v22 = v21;
    -[_UIPlatterMenuDynamicsController _updateSwipeEdgeMultipliersIfNeededForTouchPosition:](self, "_updateSwipeEdgeMultipliersIfNeededForTouchPosition:", x, y);
    if (v12 <= v22)
    {
      if (v12 >= v22) {
        goto LABEL_20;
      }
      double v26 = [v15 trailingSwipeActionView];

      if (!v26)
      {
        double v18 = 1.0;
        if (dx < 0.0) {
          double v16 = 4.0;
        }
        else {
          double v16 = 1.0;
        }
        goto LABEL_21;
      }
      [(_UIPlatterMenuDynamicsController *)self trailingSwipeEdgeMultiplier];
      double v18 = 1.0;
      if (v27 <= 2.22044605e-16) {
        goto LABEL_21;
      }
      [(_UIPlatterMenuDynamicsController *)self trailingSwipeEdgeMultiplier];
    }
    else
    {
      double v23 = [v15 leadingSwipeActionView];

      if (!v23)
      {
        double v18 = 1.0;
        if (dx > 0.0) {
          double v16 = 4.0;
        }
        else {
          double v16 = 1.0;
        }
        goto LABEL_21;
      }
      [(_UIPlatterMenuDynamicsController *)self leadingSwipeEdgeMultiplier];
      double v18 = 1.0;
      if (v24 <= 2.22044605e-16) {
        goto LABEL_21;
      }
      [(_UIPlatterMenuDynamicsController *)self leadingSwipeEdgeMultiplier];
    }
    double v18 = 1.0;
    double v16 = 1.0 / v25;
    goto LABEL_21;
  }
  if (a6 != 2)
  {
LABEL_20:
    double v18 = 1.0;
    goto LABEL_21;
  }
  [v14 centerForPlatterWithMenuViewPresented];
  if (v11 >= v17 || (double v18 = 2.25, dy >= 0.0))
  {
    [v15 centerForPlatterWithMenuViewDismissed];
    if (v11 > v19 && dy > 0.0)
    {
      int64_t v20 = [(_UIPlatterMenuDynamicsController *)self state];
      double v18 = 2.25;
      if (v20 != 2) {
        double v18 = 15.0;
      }
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_21:
  if (fabs(v18 + -1.0) <= 2.22044605e-16)
  {
    if (fabs(v16 + -1.0) > 2.22044605e-16) {
      ddouble x = dx / v16;
    }
  }
  else
  {
    ddouble y = dy / v18;
  }
LABEL_25:

  double v28 = dx;
  double v29 = dy;
  result.ddouble y = v29;
  result.ddouble x = v28;
  return result;
}

- (CGPoint)centerForMenuPresentedRelativeToCurrentPlatter
{
  id v3 = [(_UIPlatterMenuDynamicsController *)self delegate];
  double v4 = [(_UIPlatterMenuDynamicsController *)self animator];
  BOOL v5 = [(_UIPlatterMenuDynamicsController *)self platterItem];
  [v4 updateItemFromCurrentState:v5];

  [(_UIPlatterMenuDynamicsController *)self centerForCurrentPlatterPosition];
  double v7 = v6;
  double v9 = v8;
  [v3 centerForMenuPresented];
  double v11 = v10;
  double v12 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v12 bounds];
  double v13 = v9 + CGRectGetHeight(v21) * 0.5;
  [v3 minimumSpacingBetweenPlatterAndMenu];
  double v15 = v14 + v13;
  double v16 = [(_UIPlatterMenuDynamicsController *)self menuView];
  [v16 bounds];
  double v17 = v15 + CGRectGetHeight(v22) * 0.5;

  if (v17 < v11) {
    double v17 = v11;
  }

  double v18 = v7;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (CGPoint)centerForCurrentPlatterPosition
{
  id v3 = [(_UIPlatterMenuDynamicsController *)self animator];
  double v4 = [v3 referenceView];

  BOOL v5 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(_UIPlatterMenuDynamicsController *)self platterView];
  double v11 = [v10 superview];
  objc_msgSend(v4, "convertPoint:fromView:", v11, v7, v9);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)platterCenter
{
  id v3 = [(_UIPlatterMenuDynamicsController *)self animator];
  double v4 = [v3 referenceView];
  BOOL v5 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(_UIPlatterMenuDynamicsController *)self platterView];
  double v11 = [v10 superview];
  objc_msgSend(v4, "convertPoint:fromView:", v11, v7, v9);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)menuCenter
{
  id v3 = [(_UIPlatterMenuDynamicsController *)self animator];
  double v4 = [v3 referenceView];
  BOOL v5 = [(_UIPlatterMenuDynamicsController *)self menuView];
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(_UIPlatterMenuDynamicsController *)self menuView];
  double v11 = [v10 superview];
  objc_msgSend(v4, "convertPoint:fromView:", v11, v7, v9);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (void)resetAnimatorToDefaultBehaviors
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  double v4 = [(_UIPlatterMenuDynamicsController *)self animator];
  BOOL v5 = [v4 behaviors];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___UIPlatterMenuDynamicsController_resetAnimatorToDefaultBehaviors__block_invoke;
  v8[3] = &unk_1E53000C0;
  v8[4] = self;
  id v9 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v8];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67___UIPlatterMenuDynamicsController_resetAnimatorToDefaultBehaviors__block_invoke_2;
  v7[3] = &unk_1E5300098;
  v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)addBehaviorIfNotPresent:(id)a3
{
  id v8 = a3;
  double v4 = [(_UIPlatterMenuDynamicsController *)self animator];
  BOOL v5 = [v4 behaviors];
  char v6 = [v5 containsObject:v8];

  if ((v6 & 1) == 0)
  {
    double v7 = [(_UIPlatterMenuDynamicsController *)self animator];
    [v7 addBehavior:v8];
  }
}

- (BOOL)isDefaultAnimatorBehavior:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIPlatterMenuDynamicsController *)self platterMenuCollisionBounds];
  if (v5 == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    id v6 = [(_UIPlatterMenuDynamicsController *)self menuVerticalLockAttachment];
    if (v6 == v4)
    {
      BOOL v9 = 1;
    }
    else
    {
      id v7 = [(_UIPlatterMenuDynamicsController *)self noRotationBehavior];
      if (v7 == v4)
      {
        BOOL v9 = 1;
      }
      else
      {
        id v8 = [(_UIPlatterMenuDynamicsController *)self gestureAttachmentBehavior];
        BOOL v9 = v8 == v4;
      }
    }
  }
  return v9;
}

- (_UIPlatterMenuPanningTransformer)panningLockTransformer
{
  panningLockTransformer = self->_panningLockTransformer;
  if (!panningLockTransformer)
  {
    id v4 = [(_UIPlatterMenuDynamicsController *)self delegate];
    [v4 centerForPlatterWithMenuViewDismissed];
    double v6 = v5;
    double v8 = v7;

    +[_UIPlatterMenuPanningTransformer transformerWithAxisTransitionZonePosition:axisTransitionZoneSize:](_UIPlatterMenuPanningTransformer, "transformerWithAxisTransitionZonePosition:axisTransitionZoneSize:", v6, v8, 20.0, 20.0);
    BOOL v9 = (_UIPlatterMenuPanningTransformer *)objc_claimAutoreleasedReturnValue();
    double v10 = self->_panningLockTransformer;
    self->_panningLockTransformer = v9;

    [(_UIPlatterMenuPanningTransformer *)self->_panningLockTransformer setDelegate:self];
    [(_UIPlatterMenuPanningTransformer *)self->_panningLockTransformer setMinimumXVelocityForAxisLock:70.0];
    panningLockTransformer = self->_panningLockTransformer;
  }
  return panningLockTransformer;
}

- (void)_positionSwipeActionViewsForCurrentPlatterViewPosition
{
  id v29 = [(_UIPlatterMenuDynamicsController *)self delegate];
  id v3 = [v29 leadingSwipeActionView];
  [v29 initialCenterForLeadingSwipeActionView];
  double v5 = v4;
  double v7 = v6;
  double v8 = [v29 trailingSwipeActionView];
  [v29 initialCenterForTrailingSwipeActionView];
  double v10 = v9;
  double v12 = v11;
  double v13 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v13 frame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  if (v3)
  {
    v31.origin.double x = v15;
    v31.origin.double y = v17;
    v31.size.width = v19;
    v31.size.height = v21;
    double v22 = CGRectGetMinX(v31) * 0.5;
    if (v22 < v5) {
      double v22 = v5;
    }
    objc_msgSend(v29, "platterMenuDynamicsController:didMoveSwipeView:toPosition:", self, v3, v22, v7);
  }
  if (v8)
  {
    double v23 = [(_UIPlatterMenuDynamicsController *)self containerView];
    [v23 bounds];
    double Width = CGRectGetWidth(v32);
    v33.origin.double x = v15;
    v33.origin.double y = v17;
    v33.size.width = v19;
    v33.size.height = v21;
    double v25 = Width - CGRectGetMaxX(v33);

    double v26 = [(_UIPlatterMenuDynamicsController *)self containerView];
    [v26 bounds];
    double v27 = CGRectGetWidth(v34) + v25 * -0.5;

    if (v27 <= v10) {
      double v28 = v27;
    }
    else {
      double v28 = v10;
    }
    objc_msgSend(v29, "platterMenuDynamicsController:didMoveSwipeView:toPosition:", self, v8, v28, v12);
  }
}

- (void)_updateSwipeEdgeMultipliersIfNeededForTouchPosition:(CGPoint)a3
{
  double x = a3.x;
  -[_UIPlatterMenuDynamicsController setLeadingSwipeEdgeMultiplier:](self, "setLeadingSwipeEdgeMultiplier:", 1.0, a3.y);
  [(_UIPlatterMenuDynamicsController *)self setTrailingSwipeEdgeMultiplier:1.0];
  double v5 = [(_UIPlatterMenuDynamicsController *)self delegate];
  [v5 centerForPlatterWithMenuViewDismissed];
  double v7 = v6;

  double v8 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v8 center];
  double v10 = v9;

  if (v10 >= v7)
  {
    if (v10 > v7)
    {
      double v14 = [(_UIPlatterMenuDynamicsController *)self containerView];
      [v14 bounds];
      double Width = CGRectGetWidth(v24);

      double v16 = [(_UIPlatterMenuDynamicsController *)self platterView];
      [v16 bounds];
      double v17 = CGRectGetWidth(v25);
      double v18 = [(_UIPlatterMenuDynamicsController *)self platterView];
      [v18 center];
      double v20 = v17 - v19 + 88.0;

      double v21 = Width - x;
      if (Width - x < 10.0) {
        double v21 = 10.0;
      }
      if (v20 > v21)
      {
        double v22 = v20 / v21;
        [(_UIPlatterMenuDynamicsController *)self setLeadingSwipeEdgeMultiplier:v22];
      }
    }
  }
  else
  {
    double v11 = v10 + 88.0;
    double v12 = 10.0;
    if (x >= 10.0) {
      double v12 = x;
    }
    if (v11 > v12)
    {
      double v13 = v11 / v12;
      [(_UIPlatterMenuDynamicsController *)self setTrailingSwipeEdgeMultiplier:v13];
    }
  }
}

- (BOOL)_isPlatterInYLockedPosition
{
  id v3 = [(_UIPlatterMenuDynamicsController *)self animator];
  double v4 = [(_UIPlatterMenuDynamicsController *)self platterItem];
  [v3 updateItemFromCurrentState:v4];

  double v5 = [(_UIPlatterMenuDynamicsController *)self platterView];
  [v5 center];
  double v7 = v6;
  double v8 = [(_UIPlatterMenuDynamicsController *)self delegate];
  [v8 centerForPlatterWithMenuViewDismissed];
  LOBYTE(v4) = vabdd_f64(v7, v9) < 2.0;

  return (char)v4;
}

- (void)_configureFeedbackGenerator
{
  id v3 = +[_UIStatesFeedbackGeneratorSwipeActionConfiguration defaultConfiguration];
  id v7 = [v3 tweakedConfigurationForClass:objc_opt_class() usage:@"swipeAction"];

  double v4 = [_UIStatesFeedbackGenerator alloc];
  double v5 = [(_UIPlatterMenuDynamicsController *)self containerView];
  double v6 = [(_UIStatesFeedbackGenerator *)v4 initWithConfiguration:v7 view:v5];
  [(_UIPlatterMenuDynamicsController *)self setSwipeFeedbackGenerator:v6];
}

- (void)_activateFeedbackIfNeeded
{
  id v3 = [(_UIPlatterMenuDynamicsController *)self swipeFeedbackGenerator];
  char v4 = [v3 isActive];

  if ((v4 & 1) == 0)
  {
    id v5 = [(_UIPlatterMenuDynamicsController *)self swipeFeedbackGenerator];
    [v5 activateWithCompletionBlock:0];
  }
}

- (void)_deactivateFeedbackIfNeeded
{
  id v3 = [(_UIPlatterMenuDynamicsController *)self swipeFeedbackGenerator];
  int v4 = [v3 isActive];

  if (v4)
  {
    id v5 = [(_UIPlatterMenuDynamicsController *)self swipeFeedbackGenerator];
    [v5 deactivate];
  }
}

- (void)_fireConfirmFeedbackIfNeededForInitialSelectionState:(BOOL)a3 finalSelectionState:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(_UIPlatterMenuDynamicsController *)self swipeFeedbackGenerator];
  int v8 = [v7 isActive];

  if (v8)
  {
    if (!v4 || v5)
    {
      if (!v5 || v4) {
        return;
      }
      id v11 = [(_UIPlatterMenuDynamicsController *)self swipeFeedbackGenerator];
      uint64_t v9 = +[_UIStatesFeedbackGeneratorSwipeActionConfiguration openState];
    }
    else
    {
      id v11 = [(_UIPlatterMenuDynamicsController *)self swipeFeedbackGenerator];
      uint64_t v9 = +[_UIStatesFeedbackGeneratorSwipeActionConfiguration confirmState];
    }
    double v10 = (void *)v9;
    [v11 transitionToState:v9 ended:1];
  }
}

- (void)setLeadingSwipeActionViewSelected:(BOOL)a3
{
  BOOL leadingSwipeActionViewSelected = self->_leadingSwipeActionViewSelected;
  self->_BOOL leadingSwipeActionViewSelected = a3;
  -[_UIPlatterMenuDynamicsController _fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:](self, "_fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:", leadingSwipeActionViewSelected);
}

- (void)setTrailingSwipeActionViewSelected:(BOOL)a3
{
  BOOL trailingSwipeActionViewSelected = self->_trailingSwipeActionViewSelected;
  self->_BOOL trailingSwipeActionViewSelected = a3;
  -[_UIPlatterMenuDynamicsController _fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:](self, "_fireConfirmFeedbackIfNeededForInitialSelectionState:finalSelectionState:", trailingSwipeActionViewSelected);
}

- (BOOL)leadingSwipeActionViewSelected
{
  return self->_leadingSwipeActionViewSelected;
}

- (BOOL)trailingSwipeActionViewSelected
{
  return self->_trailingSwipeActionViewSelected;
}

- (_UIPlatterMenuDynamicsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIPlatterMenuDynamicsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)platterView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
  return (UIView *)WeakRetained;
}

- (void)setPlatterView:(id)a3
{
}

- (UIView)menuView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuView);
  return (UIView *)WeakRetained;
}

- (void)setMenuView:(id)a3
{
}

- (UIDynamicItem)platterItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterItem);
  return (UIDynamicItem *)WeakRetained;
}

- (void)setPlatterItem:(id)a3
{
}

- (void)setPanningLockTransformer:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CGPoint)initialTouchPoint
{
  double x = self->_initialTouchPoint.x;
  double y = self->_initialTouchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialTouchPoint:(CGPoint)a3
{
  self->_initialTouchPoint = a3;
}

- (double)leadingSwipeEdgeMultiplier
{
  return self->_leadingSwipeEdgeMultiplier;
}

- (void)setLeadingSwipeEdgeMultiplier:(double)a3
{
  self->_leadingSwipeEdgeMultiplier = a3;
}

- (double)trailingSwipeEdgeMultiplier
{
  return self->_trailingSwipeEdgeMultiplier;
}

- (void)setTrailingSwipeEdgeMultiplier:(double)a3
{
  self->_trailingSwipeEdgeMultiplier = a3;
}

- (BOOL)isCurrentlyUnderDirectManipulation
{
  return self->_isCurrentlyUnderDirectManipulation;
}

- (void)setIsCurrentlyUnderDirectManipulation:(BOOL)a3
{
  self->_isCurrentlyUnderDirectManipulation = a3;
}

- (UIDynamicAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
}

- (UIDynamicItemBehavior)menuItemBehavior
{
  return self->_menuItemBehavior;
}

- (void)setMenuItemBehavior:(id)a3
{
}

- (UIDynamicItemBehavior)platterItemBehavior
{
  return self->_platterItemBehavior;
}

- (void)setPlatterItemBehavior:(id)a3
{
}

- (UIAttachmentBehavior)platterMenuSlidingAttachmentBehavior
{
  return self->_platterMenuSlidingAttachmentBehavior;
}

- (void)setPlatterMenuSlidingAttachmentBehavior:(id)a3
{
}

- (UIAttachmentBehavior)platterMenuAttachmentBehavior
{
  return self->_platterMenuAttachmentBehavior;
}

- (void)setPlatterMenuAttachmentBehavior:(id)a3
{
}

- (UIAttachmentBehavior)gestureAttachmentBehavior
{
  return self->_gestureAttachmentBehavior;
}

- (void)setGestureAttachmentBehavior:(id)a3
{
}

- (_UIPlatterMenuSnapBehavior)platterSnapBehavior
{
  return self->_platterSnapBehavior;
}

- (void)setPlatterSnapBehavior:(id)a3
{
}

- (_UIPlatterMenuSnapBehavior)menuPresentedSnapBehavior
{
  return self->_menuPresentedSnapBehavior;
}

- (void)setMenuPresentedSnapBehavior:(id)a3
{
}

- (_UIPlatterMenuSnapBehavior)menuDismissedSnapBehavior
{
  return self->_menuDismissedSnapBehavior;
}

- (void)setMenuDismissedSnapBehavior:(id)a3
{
}

- (UIDynamicItemBehavior)noRotationBehavior
{
  return self->_noRotationBehavior;
}

- (void)setNoRotationBehavior:(id)a3
{
}

- (UIAttachmentBehavior)menuVerticalLockAttachment
{
  return self->_menuVerticalLockAttachment;
}

- (void)setMenuVerticalLockAttachment:(id)a3
{
}

- (UICollisionBehavior)platterMenuCollisionBounds
{
  return self->_platterMenuCollisionBounds;
}

- (void)setPlatterMenuCollisionBounds:(id)a3
{
}

- (_UIDynamicItemObservingBehavior)observingBehavior
{
  return self->_observingBehavior;
}

- (void)setObservingBehavior:(id)a3
{
}

- (int64_t)didPresentCount
{
  return self->_didPresentCount;
}

- (void)setDidPresentCount:(int64_t)a3
{
  self->_didPresentCount = a3;
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
  objc_storeStrong((id *)&self->_observingBehavior, 0);
  objc_storeStrong((id *)&self->_platterMenuCollisionBounds, 0);
  objc_storeStrong((id *)&self->_menuVerticalLockAttachment, 0);
  objc_storeStrong((id *)&self->_noRotationBehavior, 0);
  objc_storeStrong((id *)&self->_menuDismissedSnapBehavior, 0);
  objc_storeStrong((id *)&self->_menuPresentedSnapBehavior, 0);
  objc_storeStrong((id *)&self->_platterSnapBehavior, 0);
  objc_storeStrong((id *)&self->_gestureAttachmentBehavior, 0);
  objc_storeStrong((id *)&self->_platterMenuAttachmentBehavior, 0);
  objc_storeStrong((id *)&self->_platterMenuSlidingAttachmentBehavior, 0);
  objc_storeStrong((id *)&self->_platterItemBehavior, 0);
  objc_storeStrong((id *)&self->_menuItemBehavior, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_panningLockTransformer, 0);
  objc_destroyWeak((id *)&self->_platterItem);
  objc_destroyWeak((id *)&self->_menuView);
  objc_destroyWeak((id *)&self->_platterView);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end