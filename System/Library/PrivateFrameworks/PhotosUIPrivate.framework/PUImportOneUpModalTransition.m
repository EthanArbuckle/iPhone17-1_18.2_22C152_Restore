@interface PUImportOneUpModalTransition
+ (CGSize)scaledSizeForTargetSize:(CGSize)a3 aspectFillingIntoSize:(CGSize)a4;
+ (double)defaultAnimationDurationForOperation:(int64_t)a3;
+ (id)propertyAnimatorWithInitialVelocity:(CGVector)a3 forOperation:(int64_t)a4 inDirection:(int64_t)a5;
+ (id)transitioningObjectInViewController:(id)a3;
- (BOOL)continuousGestureRecognizerIsActive:(id)a3;
- (CGVector)unitVelocityForDisplayVelocity:(PXDisplayVelocity)a3;
- (NSArray)floatingItems;
- (PUImportOneUpModalTransition)initWithOperation:(int64_t)a3 transitionContext:(id)a4 pinchGestureRecognizer:(id)a5 panGestureRecognizer:(id)a6 startsInteractive:(BOOL)a7;
- (PUImportOneUpTransitionItem)manipulatedFloatingItem;
- (PUPhotoPinchGestureRecognizer)pinchGestureRecognizer;
- (PXPinchTracker)pinchTracker;
- (PXSwipeDownTracker)swipeDownTracker;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIViewControllerContextTransitioning)context;
- (UIViewPropertyAnimator)floatingItemsAnimator;
- (UIViewPropertyAnimator)transitionAnimator;
- (double)currentProgressForFloatingItem:(id)a3 atSize:(CGSize)a4 inDirection:(int64_t)a5;
- (double)startingAnimationProgress;
- (int64_t)activeGesture;
- (int64_t)animatingPositionForPinchTracker:(id)a3;
- (int64_t)animatingPositionForSwipeDownTracker:(id)a3;
- (int64_t)operation;
- (void)animateToPosition:(int64_t)a3;
- (void)configureFloatingItemForInteractiveTracking;
- (void)endInteraction;
- (void)handleTapHoldGesture:(id)a3;
- (void)handleTransitionComplete:(int64_t)a3;
- (void)pauseAnimation;
- (void)prepareFloatingItemsForAnimation;
- (void)setActiveGesture:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setFloatingItems:(id)a3;
- (void)setFloatingItemsAnimator:(id)a3;
- (void)setManipulatedFloatingItem:(id)a3;
- (void)setStartingAnimationProgress:(double)a3;
- (void)setTransitionAnimator:(id)a3;
- (void)startTransition;
- (void)updateTransitionWithPanGestureRecognizer:(id)a3;
- (void)updateTransitionWithPinchGestureRecognizer:(id)a3;
@end

@implementation PUImportOneUpModalTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manipulatedFloatingItem, 0);
  objc_storeStrong((id *)&self->_floatingItems, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_floatingItemsAnimator, 0);
  objc_storeStrong((id *)&self->_swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchTracker, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
}

- (void)setStartingAnimationProgress:(double)a3
{
  self->_startingAnimationProgress = a3;
}

- (double)startingAnimationProgress
{
  return self->_startingAnimationProgress;
}

- (void)setManipulatedFloatingItem:(id)a3
{
}

- (PUImportOneUpTransitionItem)manipulatedFloatingItem
{
  return self->_manipulatedFloatingItem;
}

- (void)setFloatingItems:(id)a3
{
}

- (NSArray)floatingItems
{
  return self->_floatingItems;
}

- (void)setContext:(id)a3
{
}

- (UIViewControllerContextTransitioning)context
{
  return self->_context;
}

- (void)setFloatingItemsAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)floatingItemsAnimator
{
  return self->_floatingItemsAnimator;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setActiveGesture:(int64_t)a3
{
  self->_activeGesture = a3;
}

- (int64_t)activeGesture
{
  return self->_activeGesture;
}

- (PXSwipeDownTracker)swipeDownTracker
{
  return self->_swipeDownTracker;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (PXPinchTracker)pinchTracker
{
  return self->_pinchTracker;
}

- (PUPhotoPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setTransitionAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)transitionAnimator
{
  return self->_transitionAnimator;
}

- (BOOL)continuousGestureRecognizerIsActive:(id)a3
{
  id v3 = a3;
  v4 = v3;
  BOOL v5 = v3 && ([v3 state] == 1 || objc_msgSend(v4, "state") == 2);

  return v5;
}

- (void)pauseAnimation
{
  id v3 = [(PUImportOneUpModalTransition *)self floatingItemsAnimator];
  [v3 stopAnimation:1];

  v4 = [(PUImportOneUpModalTransition *)self transitionAnimator];
  [v4 pauseAnimation];

  id v5 = [(PUImportOneUpModalTransition *)self context];
  [v5 pauseInteractiveTransition];
}

- (int64_t)animatingPositionForSwipeDownTracker:(id)a3
{
  int v4 = [a3 shouldFinishDismissal];
  return v4 ^ ([(PUImportOneUpModalTransition *)self operation] != 0);
}

- (int64_t)animatingPositionForPinchTracker:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];
  [v4 size];
  -[PUImportOneUpModalTransition currentProgressForFloatingItem:atSize:inDirection:](self, "currentProgressForFloatingItem:atSize:inDirection:", v5, 0);
  double v7 = v6;

  if (v7 >= 0.0)
  {
    if (v7 >= 1.0)
    {
      int64_t v8 = 0;
    }
    else
    {
      uint64_t v9 = [v4 scaleDirection];
      if (v9)
      {
        uint64_t v10 = v9;
        int64_t v11 = [(PUImportOneUpModalTransition *)self operation];
        BOOL v12 = v10 != -1;
        if (!v11) {
          BOOL v12 = v10 != 1;
        }
      }
      else
      {
        v13 = [(PUImportOneUpModalTransition *)self transitionAnimator];
        [v13 fractionComplete];
        double v15 = v14;

        BOOL v12 = v15 <= 0.33;
      }
      int64_t v8 = v12;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (void)endInteraction
{
  id v3 = [(PUImportOneUpModalTransition *)self context];
  int v4 = [v3 isInteractive];

  if (!v4) {
    return;
  }
  if ([(PUImportOneUpModalTransition *)self activeGesture] == 1)
  {
    id v5 = [(PUImportOneUpModalTransition *)self pinchTracker];
    int64_t v6 = [(PUImportOneUpModalTransition *)self animatingPositionForPinchTracker:v5];
  }
  else
  {
    if ([(PUImportOneUpModalTransition *)self activeGesture] != 2)
    {
LABEL_9:
      int64_t v8 = [(PUImportOneUpModalTransition *)self context];
      [v8 finishInteractiveTransition];
      int64_t v7 = 0;
      goto LABEL_10;
    }
    id v5 = [(PUImportOneUpModalTransition *)self swipeDownTracker];
    int64_t v6 = [(PUImportOneUpModalTransition *)self animatingPositionForSwipeDownTracker:v5];
  }
  int64_t v7 = v6;

  if (!v7) {
    goto LABEL_9;
  }
  int64_t v8 = [(PUImportOneUpModalTransition *)self context];
  [v8 cancelInteractiveTransition];
LABEL_10:

  [(PUImportOneUpModalTransition *)self animateToPosition:v7];
}

- (CGVector)unitVelocityForDisplayVelocity:(PXDisplayVelocity)a3
{
  int v4 = [(PUImportOneUpModalTransition *)self pinchTracker];

  if (v4)
  {
    id v5 = [(PUImportOneUpModalTransition *)self pinchTracker];
    [v5 velocity];
    double v7 = v6;
    double v9 = v8;

    uint64_t v10 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];
    [v10 targetFrame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v30.origin.x = v12;
    v30.origin.y = v14;
    v30.size.width = v16;
    v30.size.height = v18;
    double MidX = CGRectGetMidX(v30);
    v31.origin.x = v12;
    v31.origin.y = v14;
    v31.size.width = v16;
    v31.size.height = v18;
    double MidY = CGRectGetMidY(v31);
    v21 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];
    v22 = [v21 transitionView];
    [v22 center];
    double v24 = v23;
    double v26 = v25;

    double v27 = v7 / (MidX - v24);
    double v28 = v9 / (MidY - v26);
  }
  else
  {
    double v28 = 0.0;
    double v27 = 0.0;
  }
  result.dy = v28;
  result.dx = v27;
  return result;
}

- (double)currentProgressForFloatingItem:(id)a3 atSize:(CGSize)a4 inDirection:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  double v9 = v8;
  if (a5)
  {
    [v8 initialFrame];
    double v11 = v10;
    double v13 = v12;
    [v9 targetFrame];
  }
  else
  {
    [v8 targetFrame];
    double v11 = v16;
    double v13 = v17;
    [v9 initialFrame];
  }
  double v18 = v14;
  double v19 = v15;
  if (PXFloatApproximatelyEqualToFloat())
  {
    if (PXFloatApproximatelyEqualToFloat()) {
      double v20 = 0.0;
    }
    else {
      double v20 = (height - v19) / (v13 - v19);
    }
  }
  else
  {
    double v20 = (width - v18) / (v11 - v18);
  }

  return v20;
}

- (void)handleTapHoldGesture:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if ((unint64_t)(v4 - 1) <= 1)
    {
      [(PUImportOneUpModalTransition *)self pauseAnimation];
    }
  }
  else
  {
    [(PUImportOneUpModalTransition *)self endInteraction];
  }
}

- (void)updateTransitionWithPanGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 != 2)
    {
      if (v5 != 1) {
        goto LABEL_15;
      }
      double v6 = [(PUImportOneUpModalTransition *)self transitionAnimator];
      [v6 fractionComplete];
      -[PUImportOneUpModalTransition setStartingAnimationProgress:](self, "setStartingAnimationProgress:");

      [(PUImportOneUpModalTransition *)self setActiveGesture:2];
      [(PUImportOneUpModalTransition *)self configureFloatingItemForInteractiveTracking];
    }
    double v7 = [(PUImportOneUpModalTransition *)self context];
    id v8 = [v7 containerView];

    [v4 translationInView:v8];
    double v10 = v9;
    double v12 = v11;
    [v4 velocityInView:v8];
    double v14 = v13;
    double v16 = v15;
    double v17 = [(PUImportOneUpModalTransition *)self swipeDownTracker];
    objc_msgSend(v17, "trackGestureTranslation:velocity:", v10, v12, v14, v16);

    if ([(PUImportOneUpModalTransition *)self activeGesture] == 2)
    {
      double v18 = [(PUImportOneUpModalTransition *)self swipeDownTracker];
      [v18 dismissalProgress];
      double v20 = v19;

      [(PUImportOneUpModalTransition *)self startingAnimationProgress];
      double v22 = v21;
      if ([(PUImportOneUpModalTransition *)self operation] == 1) {
        double v23 = v22 + (1.0 - v22) * v20;
      }
      else {
        double v23 = v22 - v22 * v20;
      }
      double v24 = [(PUImportOneUpModalTransition *)self transitionAnimator];
      [v24 setFractionComplete:v23];

      double v25 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];
      double v26 = [v25 transitionView];

      double v27 = [(PUImportOneUpModalTransition *)self swipeDownTracker];
      [v27 trackedCenter];
      objc_msgSend(v26, "setCenter:");

      double v28 = [(PUImportOneUpModalTransition *)self swipeDownTracker];
      [v28 trackedBounds];
      double v30 = v29;
      CGRect v31 = [(PUImportOneUpModalTransition *)self swipeDownTracker];
      [v31 trackedBounds];
      objc_msgSend(v26, "setBounds:", 0.0, 0.0, v30);

      v32 = [(PUImportOneUpModalTransition *)self swipeDownTracker];
      v33 = v32;
      if (v32)
      {
        [v32 trackedTransform];
      }
      else
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v36 = 0u;
      }
      v35[0] = v36;
      v35[1] = v37;
      v35[2] = v38;
      [v26 setTransform:v35];

      v34 = [(PUImportOneUpModalTransition *)self context];
      [v34 updateInteractiveTransition:v23];
    }
  }
  else
  {
    [(PUImportOneUpModalTransition *)self endInteraction];
  }
LABEL_15:
}

- (void)updateTransitionWithPinchGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if ((unint64_t)(v5 - 1) <= 1)
    {
      if ((unint64_t)[v4 numberOfTouches] > 1)
      {
        double v6 = [(PUImportOneUpModalTransition *)self context];
        double v7 = [v6 containerView];

        [v4 locationOfTouch:0 inView:v7];
        uint64_t v9 = v8;
        uint64_t v11 = v10;
        [v4 locationOfTouch:1 inView:v7];
        uint64_t v13 = v12;
        uint64_t v15 = v14;
        double v16 = [(PUImportOneUpModalTransition *)self pinchTracker];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __75__PUImportOneUpModalTransition_updateTransitionWithPinchGestureRecognizer___block_invoke;
        v37[3] = &__block_descriptor_64_e33_v16__0___PXMutablePinchTracker__8l;
        v37[4] = v9;
        v37[5] = v11;
        v37[6] = v13;
        v37[7] = v15;
        [v16 performChanges:v37];

        if ([(PUImportOneUpModalTransition *)self activeGesture] == 1)
        {
          double v17 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];
          double v18 = [(PUImportOneUpModalTransition *)self pinchTracker];
          [v18 size];
          -[PUImportOneUpModalTransition currentProgressForFloatingItem:atSize:inDirection:](self, "currentProgressForFloatingItem:atSize:inDirection:", v17, 0);
          double v20 = v19;

          double v21 = [(PUImportOneUpModalTransition *)self transitionAnimator];
          [v21 setFractionComplete:v20];

          double v22 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];
          double v23 = [v22 transitionView];

          double v24 = [(PUImportOneUpModalTransition *)self pinchTracker];
          [v24 center];
          objc_msgSend(v23, "setCenter:");

          double v25 = [(PUImportOneUpModalTransition *)self pinchTracker];
          [v25 size];
          double v27 = v26;
          double v28 = [(PUImportOneUpModalTransition *)self pinchTracker];
          [v28 size];
          objc_msgSend(v23, "setBounds:", 0.0, 0.0, v27, v29);

          double v30 = [(PUImportOneUpModalTransition *)self pinchTracker];
          CGRect v31 = v30;
          if (v30)
          {
            [v30 transform];
          }
          else
          {
            long long v35 = 0u;
            long long v36 = 0u;
            long long v34 = 0u;
          }
          v33[0] = v34;
          v33[1] = v35;
          v33[2] = v36;
          [v23 setTransform:v33];

          v32 = [(PUImportOneUpModalTransition *)self context];
          [v32 updateInteractiveTransition:v20];
        }
      }
      else
      {
        objc_msgSend(v4, "px_cancel");
      }
    }
  }
  else
  {
    [(PUImportOneUpModalTransition *)self endInteraction];
  }
}

void __75__PUImportOneUpModalTransition_updateTransitionWithPinchGestureRecognizer___block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "setPinchLocation1:", v3, v4);
  objc_msgSend(v5, "setPinchLocation2:", a1[6], a1[7]);
}

- (void)configureFloatingItemForInteractiveTracking
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  double v3 = [(PUImportOneUpModalTransition *)self context];
  double v4 = [v3 containerView];

  if ([(PUImportOneUpModalTransition *)self activeGesture] == 1)
  {
    uint64_t v5 = [(PUImportOneUpModalTransition *)self pinchGestureRecognizer];
LABEL_5:
    double v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([(PUImportOneUpModalTransition *)self activeGesture] == 2)
  {
    uint64_t v5 = [(PUImportOneUpModalTransition *)self panGestureRecognizer];
    goto LABEL_5;
  }
  double v6 = 0;
LABEL_7:
  [v6 locationInView:v4];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = objc_msgSend(v4, "hitTest:withEvent:", 0);
  if (v11)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v12 = [(PUImportOneUpModalTransition *)self floatingItems];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v65;
LABEL_10:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v65 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v64 + 1) + 8 * v16);
        double v18 = [v17 transitionView];

        if (v18 == v11) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v64 objects:v68 count:16];
          if (v14) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }
      id v19 = v17;

      if (v19) {
        goto LABEL_19;
      }
    }
    else
    {
LABEL_16:
    }
  }
  double v20 = [(PUImportOneUpModalTransition *)self floatingItems];
  id v19 = [v20 firstObject];

LABEL_19:
  [(PUImportOneUpModalTransition *)self setManipulatedFloatingItem:v19];
  pinchTracker = self->_pinchTracker;
  self->_pinchTracker = 0;

  swipeDownTracker = self->_swipeDownTracker;
  self->_swipeDownTracker = 0;

  double v23 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];

  if (v23)
  {
    double v24 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];
    double v25 = [v24 transitionView];

    [v25 center];
    double v27 = v26;
    double v29 = v28;
    [v25 bounds];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    if ([(PUImportOneUpModalTransition *)self activeGesture] == 1)
    {
      if (![(PUImportOneUpModalTransition *)self operation])
      {
        long long v38 = objc_opt_class();
        v39 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];
        [v39 targetFrame];
        objc_msgSend(v38, "scaledSizeForTargetSize:aspectFillingIntoSize:", v40, v41, v35, v37);
        double v35 = v42;
        double v37 = v43;

        [v25 bounds];
        double MidX = CGRectGetMidX(v70);
        [v25 bounds];
        CGFloat v45 = CGRectGetMidY(v71) - v37 * 0.5;
        id v46 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __75__PUImportOneUpModalTransition_configureFloatingItemForInteractiveTracking__block_invoke;
        v56[3] = &unk_1E5F2B218;
        id v57 = v25;
        double v58 = MidX - v35 * 0.5;
        CGFloat v59 = v45;
        double v60 = v35;
        double v61 = v37;
        double v62 = v27;
        double v63 = v29;
        v47 = (void *)[v46 initWithDuration:2 curve:v56 animations:0.2];
        [v47 startAnimation];
      }
      id v48 = objc_alloc(MEMORY[0x1E4F905B0]);
      if (v25) {
        [v25 transform];
      }
      else {
        memset(v55, 0, sizeof(v55));
      }
      v52 = (PXPinchTracker *)objc_msgSend(v48, "initWithCenter:size:transform:", v55, v27, v29, v35, v37);
      v53 = self->_pinchTracker;
      self->_pinchTracker = v52;
    }
    else if ([(PUImportOneUpModalTransition *)self activeGesture] == 2)
    {
      v49 = (PXSwipeDownTracker *)[objc_alloc(MEMORY[0x1E4F907C8]) initWithOptions:0];
      v50 = self->_swipeDownTracker;
      self->_swipeDownTracker = v49;

      v51 = self->_swipeDownTracker;
      if (v25) {
        [v25 transform];
      }
      else {
        memset(v54, 0, sizeof(v54));
      }
      -[PXSwipeDownTracker startTrackingCenter:bounds:transform:withInitialGestureLocation:velocity:](v51, "startTrackingCenter:bounds:transform:withInitialGestureLocation:velocity:", v54, v27, v29, v31, v33, v35, v37, v8, v10, *MEMORY[0x1E4F91338], *(void *)(MEMORY[0x1E4F91338] + 8));
    }
  }
}

uint64_t __75__PUImportOneUpModalTransition_configureFloatingItemForInteractiveTracking__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 transform];
    v2 = *(void **)(a1 + 32);
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
  }
  v4[0] = v5;
  v4[1] = v6;
  v4[2] = v7;
  return [v2 setTransform:v4];
}

- (void)animateToPosition:(int64_t)a3
{
  BOOL v5 = a3 == 0;
  if ([(PUImportOneUpModalTransition *)self activeGesture] == 1)
  {
    long long v6 = [(PUImportOneUpModalTransition *)self pinchTracker];
    [v6 velocity];
LABEL_5:
    double v11 = v7;
    double v12 = v8;
    double v13 = v9;
    double v14 = v10;

    goto LABEL_7;
  }
  if ([(PUImportOneUpModalTransition *)self activeGesture] == 2)
  {
    long long v6 = [(PUImportOneUpModalTransition *)self swipeDownTracker];
    [v6 trackedVelocity];
    goto LABEL_5;
  }
  double v11 = *MEMORY[0x1E4F90E88];
  double v12 = *(double *)(MEMORY[0x1E4F90E88] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F90E88] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F90E88] + 24);
LABEL_7:
  -[PUImportOneUpModalTransition unitVelocityForDisplayVelocity:](self, "unitVelocityForDisplayVelocity:", v11, v12, v13, v14);
  double v17 = objc_msgSend((id)objc_opt_class(), "propertyAnimatorWithInitialVelocity:forOperation:inDirection:", -[PUImportOneUpModalTransition operation](self, "operation"), a3, v15, v16);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __50__PUImportOneUpModalTransition_animateToPosition___block_invoke;
  v40[3] = &unk_1E5F2E120;
  v40[4] = self;
  BOOL v41 = v5;
  [v17 addAnimations:v40];
  [(PUImportOneUpModalTransition *)self setFloatingItemsAnimator:v17];
  double v18 = [(PUImportOneUpModalTransition *)self floatingItemsAnimator];
  [v18 startAnimation];

  id v19 = [(PUImportOneUpModalTransition *)self transitionAnimator];
  [v19 setReversed:a3 != 0];

  double v20 = [(PUImportOneUpModalTransition *)self transitionAnimator];
  uint64_t v21 = [v20 state];

  if (v21)
  {
    if ([(PUImportOneUpModalTransition *)self activeGesture] == 1)
    {
      double v22 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];
      double v23 = [(PUImportOneUpModalTransition *)self pinchTracker];
      [v23 size];
      -[PUImportOneUpModalTransition currentProgressForFloatingItem:atSize:inDirection:](self, "currentProgressForFloatingItem:atSize:inDirection:", v22, 0);
      double v25 = v24;

      double v26 = 1.0;
      if (v25 < 0.0 || v25 > 1.0) {
        goto LABEL_16;
      }
      double v27 = [(PUImportOneUpModalTransition *)self transitionAnimator];
      [v27 fractionComplete];
      double v29 = v28;

      double v30 = 1.0 - v29;
    }
    else
    {
      double v26 = 0.0;
      if ([(PUImportOneUpModalTransition *)self activeGesture] != 2)
      {
LABEL_16:
        double v31 = [(PUImportOneUpModalTransition *)self transitionAnimator];
        long long v38 = [(PUImportOneUpModalTransition *)self floatingItemsAnimator];
        v39 = [v38 timingParameters];
        [v31 continueAnimationWithTimingParameters:v39 durationFactor:v26];

        goto LABEL_17;
      }
      double v32 = [(PUImportOneUpModalTransition *)self manipulatedFloatingItem];
      double v33 = [(PUImportOneUpModalTransition *)self swipeDownTracker];
      [v33 trackedBounds];
      -[PUImportOneUpModalTransition currentProgressForFloatingItem:atSize:inDirection:](self, "currentProgressForFloatingItem:atSize:inDirection:", v32, a3, v34, v35);
      double v37 = v36;

      double v30 = 1.0 - v37;
    }
    double v26 = fmax(v30, 0.0);
    goto LABEL_16;
  }
  double v31 = [(PUImportOneUpModalTransition *)self transitionAnimator];
  [v31 startAnimation];
LABEL_17:

  [(PUImportOneUpModalTransition *)self setActiveGesture:0];
}

void __50__PUImportOneUpModalTransition_animateToPosition___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = [*(id *)(a1 + 32) floatingItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v23 = *MEMORY[0x1E4F1DAB8];
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 40)) {
          [*(id *)(*((void *)&v25 + 1) + 8 * i) targetFrame];
        }
        else {
          [*(id *)(*((void *)&v25 + 1) + 8 * i) initialFrame];
        }
        CGFloat v12 = v8;
        CGFloat v13 = v9;
        double v14 = v10;
        double v15 = v11;
        double MidX = CGRectGetMidX(*(CGRect *)&v8);
        v31.origin.x = v12;
        v31.origin.y = v13;
        v31.size.double width = v14;
        v31.size.double height = v15;
        double MidY = CGRectGetMidY(v31);
        double v18 = [v7 transitionView];
        objc_msgSend(v18, "setCenter:", MidX, MidY);
        objc_msgSend(v18, "setBounds:", 0.0, 0.0, v14, v15);
        v24[0] = v23;
        v24[1] = v22;
        v24[2] = v21;
        [v18 setTransform:v24];
        id v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:*(void *)(a1 + 32) action:sel_handleTapHoldGesture_];
        [v19 setMinimumPressDuration:0.0];
        double v20 = [v7 transitionView];
        [v20 addGestureRecognizer:v19];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }
}

- (void)prepareFloatingItemsForAnimation
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUImportOneUpModalTransition *)self context];
  uint64_t v4 = [v3 containerView];

  uint64_t v5 = [(PUImportOneUpModalTransition *)self context];
  uint64_t v6 = [v5 viewControllerForKey:*MEMORY[0x1E4FB30B8]];

  double v7 = [(PUImportOneUpModalTransition *)self context];
  CGFloat v8 = [v7 viewControllerForKey:*MEMORY[0x1E4FB30C8]];

  id v9 = v8;
  objc_opt_class();
  uint64_t v10 = (uint64_t)v9;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v9 topViewController];
  }
  double v42 = (void *)v6;
  double v11 = [(id)objc_opt_class() transitioningObjectInViewController:v6];
  v39 = (void *)v10;
  CGFloat v12 = [(id)objc_opt_class() transitioningObjectInViewController:v10];
  double v40 = v9;
  CGFloat v13 = [v9 view];
  BOOL v41 = self;
  double v14 = [(PUImportOneUpModalTransition *)self context];
  long long v38 = v11;
  double v15 = [v11 transitionItemsForContext:v14];

  double v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        [v12 targetFrameForTransitionItem:v22];
        double x = v49.origin.x;
        double y = v49.origin.y;
        double width = v49.size.width;
        double height = v49.size.height;
        if (!CGRectIsNull(v49))
        {
          v50.origin.double x = x;
          v50.origin.double y = y;
          v50.size.double width = width;
          v50.size.double height = height;
          if (!CGRectIsEmpty(v50))
          {
            v51.origin.double x = x;
            v51.origin.double y = y;
            v51.size.double width = width;
            v51.size.double height = height;
            if (!CGRectIsInfinite(v51))
            {
              objc_msgSend(v13, "convertRect:fromView:", 0, x, y, width, height);
              objc_msgSend(v22, "setTargetFrame:");
              [v22 initialFrame];
              objc_msgSend(v4, "convertRect:fromView:", 0);
              double v28 = v27;
              double v30 = v29;
              double v32 = v31;
              double v34 = v33;
              double v35 = [v22 transitionView];
              objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

              double v36 = [v22 transitionView];
              [v36 layoutIfNeeded];

              [v16 addObject:v22];
              double v37 = [v22 transitionView];
              [v4 addSubview:v37];

              [v12 prepareTransitionItemViewForDestination:v22];
            }
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v19);
  }

  [(PUImportOneUpModalTransition *)v41 setFloatingItems:v16];
}

- (void)handleTransitionComplete:(int64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PUImportOneUpModalTransition *)self context];
  uint64_t v5 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];

  uint64_t v6 = [(PUImportOneUpModalTransition *)self context];
  double v7 = [v6 viewControllerForKey:*MEMORY[0x1E4FB30C8]];

  id v8 = v7;
  objc_opt_class();
  uint64_t v9 = (uint64_t)v8;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 topViewController];
  }
  uint64_t v10 = [(id)objc_opt_class() transitioningObjectInViewController:v5];
  long long v26 = (void *)v9;
  double v11 = [(id)objc_opt_class() transitioningObjectInViewController:v9];
  CGFloat v12 = [v5 view];
  CGFloat v13 = [v8 view];
  double v14 = [(PUImportOneUpModalTransition *)self floatingItems];
  long long v25 = v10;
  [v10 didTransitionFromViewController:v5 toViewController:v8 withTransitionItems:v14];

  double v15 = [(PUImportOneUpModalTransition *)self floatingItems];
  double v24 = v11;
  [v11 didTransitionFromViewController:v5 toViewController:v8 withTransitionItems:v15];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v16 = [(PUImportOneUpModalTransition *)self floatingItems];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = [*(id *)(*((void *)&v28 + 1) + 8 * i) transitionView];
        [v21 removeFromSuperview];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  [(PUImportOneUpModalTransition *)self setFloatingItems:0];
  if (a3) {
    long long v22 = v13;
  }
  else {
    long long v22 = v12;
  }
  [v22 removeFromSuperview];
  long long v23 = [(PUImportOneUpModalTransition *)self context];
  [v23 completeTransition:a3 == 0];
}

- (void)startTransition
{
  uint64_t v3 = [(PUImportOneUpModalTransition *)self context];
  uint64_t v4 = [v3 containerView];

  uint64_t v5 = [(PUImportOneUpModalTransition *)self context];
  uint64_t v6 = [v5 viewControllerForKey:*MEMORY[0x1E4FB30B8]];

  double v7 = [(PUImportOneUpModalTransition *)self context];
  id v8 = [v7 viewControllerForKey:*MEMORY[0x1E4FB30C8]];

  id v9 = v8;
  objc_opt_class();
  uint64_t v10 = (uint64_t)v9;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v9 topViewController];
  }
  double v11 = [(id)objc_opt_class() transitioningObjectInViewController:v6];
  long long v31 = (void *)v10;
  CGFloat v12 = [(id)objc_opt_class() transitioningObjectInViewController:v10];
  CGFloat v13 = [v6 view];
  double v14 = [v9 view];
  double v15 = [(PUImportOneUpModalTransition *)self context];
  [v15 finalFrameForViewController:v9];
  objc_msgSend(v14, "setFrame:");

  [v4 addSubview:v13];
  [v4 addSubview:v14];
  long long v29 = v13;
  if ([(PUImportOneUpModalTransition *)self operation])
  {
    id v16 = v13;
    [v16 setAlpha:1.0];
    double v17 = 0.0;
  }
  else
  {
    id v16 = v14;
    [v16 setAlpha:0.0];
    double v17 = 1.0;
  }
  [v4 bringSubviewToFront:v16];
  [v16 layoutIfNeeded];
  [(PUImportOneUpModalTransition *)self prepareFloatingItemsForAnimation];
  uint64_t v18 = [(PUImportOneUpModalTransition *)self floatingItems];
  [v11 willTransitionFromViewController:v6 toViewController:v9 withTransitionItems:v18];

  uint64_t v19 = [(PUImportOneUpModalTransition *)self floatingItems];
  long long v30 = v12;
  [v12 willTransitionFromViewController:v6 toViewController:v9 withTransitionItems:v19];

  objc_msgSend((id)objc_opt_class(), "defaultAnimationDurationForOperation:", -[PUImportOneUpModalTransition operation](self, "operation"));
  double v21 = v20;
  double v22 = dbl_1AEFF7B10[[(PUImportOneUpModalTransition *)self operation] == 0] / v20;
  id v23 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __47__PUImportOneUpModalTransition_startTransition__block_invoke;
  _OWORD v35[3] = &unk_1E5F2D670;
  double v37 = v21;
  double v38 = v22;
  id v24 = v16;
  id v36 = v24;
  double v39 = v17;
  long long v25 = (void *)[v23 initWithDuration:2 curve:v35 animations:v21];
  objc_initWeak(&location, self);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __47__PUImportOneUpModalTransition_startTransition__block_invoke_4;
  v32[3] = &unk_1E5F2E558;
  objc_copyWeak(&v33, &location);
  [v25 addCompletion:v32];
  objc_storeStrong((id *)&self->_transitionAnimator, v25);
  long long v26 = [(PUImportOneUpModalTransition *)self context];
  char v27 = [v26 isInteractive];

  if (v27)
  {
    [(PUImportOneUpModalTransition *)self setStartingAnimationProgress:0.0];
    [(PUImportOneUpModalTransition *)self configureFloatingItemForInteractiveTracking];
    long long v28 = [(PUImportOneUpModalTransition *)self pinchGestureRecognizer];
    [(PUImportOneUpModalTransition *)self updateTransitionWithPinchGestureRecognizer:v28];
  }
  else
  {
    [(PUImportOneUpModalTransition *)self animateToPosition:0];
  }
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __47__PUImportOneUpModalTransition_startTransition__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PUImportOneUpModalTransition_startTransition__block_invoke_2;
  _OWORD v4[3] = &unk_1E5F2A1D0;
  double v3 = *(double *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  [v2 animateKeyframesWithDuration:3072 delay:v4 options:0 animations:v3 completion:0.0];
}

void __47__PUImportOneUpModalTransition_startTransition__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleTransitionComplete:a2];
}

void __47__PUImportOneUpModalTransition_startTransition__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  double v3 = *(double *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PUImportOneUpModalTransition_startTransition__block_invoke_3;
  _OWORD v4[3] = &unk_1E5F2E0A8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  [v2 addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:v3];
}

uint64_t __47__PUImportOneUpModalTransition_startTransition__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (PUImportOneUpModalTransition)initWithOperation:(int64_t)a3 transitionContext:(id)a4 pinchGestureRecognizer:(id)a5 panGestureRecognizer:(id)a6 startsInteractive:(BOOL)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PUImportOneUpModalTransition;
  double v15 = [(PUImportOneUpModalTransition *)&v19 init];
  id v16 = v15;
  if (v15)
  {
    v15->_operation = a3;
    objc_storeStrong((id *)&v15->_context, a4);
    objc_storeStrong((id *)&v16->_pinchGestureRecognizer, a5);
    [(PUPhotoPinchGestureRecognizer *)v16->_pinchGestureRecognizer addTarget:v16 action:sel_updateTransitionWithPinchGestureRecognizer_];
    objc_storeStrong((id *)&v16->_panGestureRecognizer, a6);
    [(UIPanGestureRecognizer *)v16->_panGestureRecognizer addTarget:v16 action:sel_updateTransitionWithPanGestureRecognizer_];
    if ([(PUImportOneUpModalTransition *)v16 continuousGestureRecognizerIsActive:v16->_pinchGestureRecognizer])
    {
      uint64_t v17 = 1;
    }
    else
    {
      if (![(PUImportOneUpModalTransition *)v16 continuousGestureRecognizerIsActive:v16->_panGestureRecognizer])
      {
        v16->_activeGesture = 0;
        goto LABEL_8;
      }
      uint64_t v17 = 2;
    }
    v16->_activeGesture = v17;
  }
LABEL_8:

  return v16;
}

+ (CGSize)scaledSizeForTargetSize:(CGSize)a3 aspectFillingIntoSize:(CGSize)a4
{
  CGFloat v4 = a3.width / a3.height;
  BOOL v5 = v4 <= 1.0;
  double height = a4.width / v4;
  double width = a4.height * v4;
  if (v5) {
    double width = a4.width;
  }
  else {
    double height = a4.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

+ (id)transitioningObjectInViewController:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1F0836E28])
  {
    id v4 = v3;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = objc_opt_class();
    uint64_t v6 = [v3 viewControllers];
    uint64_t v7 = [v6 lastObject];
    id v4 = [v5 transitioningObjectInViewController:v7];

LABEL_10:
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_opt_class();
    uint64_t v9 = [v3 selectedViewController];
LABEL_9:
    uint64_t v6 = (void *)v9;
    id v4 = [v8 transitioningObjectInViewController:v9];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_opt_class();
    uint64_t v9 = [v3 topViewController];
    goto LABEL_9;
  }
  id v4 = 0;
LABEL_11:

  return v4;
}

+ (id)propertyAnimatorWithInitialVelocity:(CGVector)a3 forOperation:(int64_t)a4 inDirection:(int64_t)a5
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  int64_t v7 = a5 | a4;
  id v8 = objc_alloc(MEMORY[0x1E4FB1C58]);
  if (v7)
  {
    uint64_t v9 = objc_msgSend(v8, "initWithDampingRatio:initialVelocity:", 1.0, dx, dy);
    id v10 = objc_alloc(MEMORY[0x1E4FB1ED8]);
    double v11 = 0.3;
  }
  else
  {
    uint64_t v9 = objc_msgSend(v8, "initWithMass:stiffness:damping:initialVelocity:", 4.5, 1300.0, 95.0, dx, dy);
    id v10 = objc_alloc(MEMORY[0x1E4FB1ED8]);
    double v11 = 0.0;
  }
  id v12 = (void *)[v10 initWithDuration:v9 timingParameters:v11];

  return v12;
}

+ (double)defaultAnimationDurationForOperation:(int64_t)a3
{
  id v3 = objc_msgSend((id)objc_opt_class(), "propertyAnimatorWithInitialVelocity:forOperation:inDirection:", a3, 0, 0.0, 0.0);
  [v3 duration];
  double v5 = v4;

  return v5;
}

@end