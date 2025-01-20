@interface UIKeyboardFloatingTransitionController
+ (BOOL)isPointWithinDockingRegion:(CGPoint)a3;
+ (CGRect)dockingRegion;
+ (double)magneticEdgeMargin;
+ (id)snapshotOfKeyplaneView:(id)a3;
- (BOOL)expandedForDocking;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isTransitioning;
- (BOOL)startedFromFloating;
- (BOOL)withinDockingRegion;
- (CGPoint)lastGestureCenter;
- (NSArray)commonVisibleKeys;
- (NSMapTable)activeKeyboardLayoutGuideTransitionAssertions;
- (UIInputWindowController)inputWindowController;
- (UIKBVisualEffectView)platterVisualEffectView;
- (UIKeyboardFloatingPinchGestureRecognizer)pinchGestureRecognizer;
- (UIKeyboardFloatingTransitionControllerDelegate)delegate;
- (UIKeyboardFloatingTransitionState)endState;
- (UIKeyboardFloatingTransitionState)startState;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIView)pillView;
- (UIView)platterCornerRadiusView;
- (UIView)platterView;
- (UIViewSpringAnimationBehavior)animationBehavior;
- (_UIKBLightEffectsBackground)lightEffectsTransitionBackdrop;
- (_UIPopoverStandardChromeView)platterPopoverBackgroundView;
- (double)gestureBeginTime;
- (double)progress;
- (void)addGestureRecognizersToView:(id)a3;
- (void)beginPanGesture:(id)a3;
- (void)beginPinchGesture:(id)a3;
- (void)beginTransitionAtPoint:(CGPoint)a3 withScale:(double)a4 recognizer:(id)a5;
- (void)beginTransitionFromPanGestureRecognizer:(id)a3;
- (void)captureStateForStart:(BOOL)a3;
- (void)constrainAccessoryViewToBottom;
- (void)endPanGesture:(id)a3;
- (void)endPinchGesture:(id)a3;
- (void)endTransitionAtPoint:(CGPoint)a3 withScale:(double)a4;
- (void)finalizeTransition;
- (void)handlePanGestureRecognizerAction:(id)a3;
- (void)handlePinchGestureRecognizerAction:(id)a3;
- (void)initializeContextAtPoint:(CGPoint)a3 recognizer:(id)a4;
- (void)inputViewSnapshot:(id *)a3 withPlatterInsets:(UIEdgeInsets *)a4;
- (void)removeGestureRecognizers;
- (void)restoreAccessoryViewConstraints;
- (void)setActiveKeyboardLayoutGuideTransitionAssertions:(id)a3;
- (void)setAnimationBehavior:(id)a3;
- (void)setCommonVisibleKeys:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndState:(id)a3;
- (void)setExpandedForDocking:(BOOL)a3;
- (void)setGestureBeginTime:(double)a3;
- (void)setInputWindowController:(id)a3;
- (void)setIsTransitioning:(BOOL)a3;
- (void)setKeyboardLayoutGuideInTransition:(BOOL)a3 forWindow:(id)a4;
- (void)setLastGestureCenter:(CGPoint)a3;
- (void)setLightEffectsTransitionBackdrop:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPillView:(id)a3;
- (void)setPinchGestureRecognizer:(id)a3;
- (void)setPlatterCornerRadiusView:(id)a3;
- (void)setPlatterPopoverBackgroundView:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setPlatterVisualEffectView:(id)a3;
- (void)setProgress:(double)a3;
- (void)setStartState:(id)a3;
- (void)setStartedFromFloating:(BOOL)a3;
- (void)setWithinDockingRegion:(BOOL)a3;
- (void)updateAnimationAtScale:(double)a3;
- (void)updateHysteresisForCurrentFloatingState;
- (void)updateLayoutGuideForTransitionStart:(BOOL)a3;
- (void)updateLayoutGuideFromFrame:(CGRect)a3;
- (void)updatePanGesture:(id)a3;
- (void)updatePinchGesture:(id)a3;
- (void)updateTransitionAtPoint:(CGPoint)a3 withScale:(double)a4 interactive:(BOOL)a5;
@end

@implementation UIKeyboardFloatingTransitionController

+ (double)magneticEdgeMargin
{
  return 15.0;
}

+ (CGRect)dockingRegion
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4 / 3.0;
  double v8 = v6 + -30.0;
  double v9 = 30.0;
  double v10 = v4 / 3.0;
  result.size.height = v9;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (BOOL)isPointWithinDockingRegion:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (+[UIKeyboardImpl isFloatingForced]) {
    return 0;
  }
  double v6 = +[UIScreen mainScreen];
  [v6 bounds];

  [a1 dockingRegion];
  CGFloat v7 = v12.origin.x;
  CGFloat v8 = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  if (x < CGRectGetMinX(v12)) {
    return 0;
  }
  v13.origin.double x = v7;
  v13.origin.double y = v8;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  if (x > CGRectGetMaxX(v13)) {
    return 0;
  }
  v14.origin.double x = v7;
  v14.origin.double y = v8;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  return y >= CGRectGetMinY(v14);
}

+ (id)snapshotOfKeyplaneView:(id)a3
{
  id v3 = a3;
  double v4 = [[UIKeyboardKeyplaneSnapshotView alloc] initWithKeyplaneView:v3];
  [(UIView *)v4 setUserInteractionEnabled:0];
  double v5 = [v3 window];

  double v6 = [v5 screen];
  [v6 scale];
  -[UIView setContentScaleFactor:](v4, "setContentScaleFactor:");

  return v4;
}

- (void)beginTransitionFromPanGestureRecognizer:(id)a3
{
  double v4 = (id *)a3;
  double v5 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel_handlePanGestureRecognizerAction_];
  [(UIKeyboardFloatingTransitionController *)self setPanGestureRecognizer:v5];

  double v6 = [(UIKeyboardFloatingTransitionController *)self pinchGestureRecognizer];
  CGFloat v7 = [v6 view];
  CGFloat v8 = [(UIKeyboardFloatingTransitionController *)self panGestureRecognizer];
  [v7 addGestureRecognizer:v8];

  id v9 = [(UIKeyboardFloatingTransitionController *)self panGestureRecognizer];
  -[UIGestureRecognizer transferTouchesFromGestureRecognizer:](v9, v4);
}

- (void)updateHysteresisForCurrentFloatingState
{
  if (+[UIKeyboardImpl isFloating]) {
    double v3 = 8.0;
  }
  else {
    double v3 = 68.0;
  }
  id v4 = [(UIKeyboardFloatingTransitionController *)self pinchGestureRecognizer];
  [v4 _setHysteresis:v3];
}

- (void)addGestureRecognizersToView:(id)a3
{
  id v10 = a3;
  id v4 = [(UIKeyboardFloatingTransitionController *)self pinchGestureRecognizer];
  id v5 = [v4 view];

  if (v5 != v10)
  {
    [(UIKeyboardFloatingTransitionController *)self removeGestureRecognizers];
    double v6 = [[UIKeyboardFloatingPinchGestureRecognizer alloc] initWithTarget:self action:sel_handlePinchGestureRecognizerAction_];
    [(UIKeyboardFloatingTransitionController *)self setPinchGestureRecognizer:v6];

    CGFloat v7 = [(UIKeyboardFloatingTransitionController *)self pinchGestureRecognizer];
    [v7 _setEndsOnSingleTouch:1];

    CGFloat v8 = [(UIKeyboardFloatingTransitionController *)self pinchGestureRecognizer];
    [v8 setDelegate:self];

    id v9 = [(UIKeyboardFloatingTransitionController *)self pinchGestureRecognizer];
    [v10 addGestureRecognizer:v9];
  }
  [(UIKeyboardFloatingTransitionController *)self updateHysteresisForCurrentFloatingState];
}

- (void)removeGestureRecognizers
{
  double v3 = [(UIKeyboardFloatingTransitionController *)self pinchGestureRecognizer];
  id v4 = [v3 view];
  id v5 = [(UIKeyboardFloatingTransitionController *)self pinchGestureRecognizer];
  [v4 removeGestureRecognizer:v5];

  [(UIKeyboardFloatingTransitionController *)self setPinchGestureRecognizer:0];
}

- (void)handlePanGestureRecognizerAction:(id)a3
{
  id v4 = a3;
  switch([v4 state])
  {
    case 1:
      [(UIKeyboardFloatingTransitionController *)self beginPanGesture:v4];
      break;
    case 2:
      [(UIKeyboardFloatingTransitionController *)self updatePanGesture:v4];
      break;
    case 3:
    case 4:
      [(UIKeyboardFloatingTransitionController *)self endPanGesture:v4];
      break;
    default:
      break;
  }
}

- (void)beginPanGesture:(id)a3
{
  id v4 = a3;
  [v4 locationOfTouch:0 inView:0];
  -[UIKeyboardFloatingTransitionController beginTransitionAtPoint:withScale:recognizer:](self, "beginTransitionAtPoint:withScale:recognizer:", v4);

  [(UIKeyboardFloatingTransitionController *)self setWithinDockingRegion:0];
}

- (void)updatePanGesture:(id)a3
{
  [a3 locationOfTouch:0 inView:0];
  -[UIKeyboardFloatingTransitionController updateTransitionAtPoint:withScale:interactive:](self, "updateTransitionAtPoint:withScale:interactive:", 1);
}

- (void)endPanGesture:(id)a3
{
  id v14 = a3;
  id v4 = [(UIKeyboardFloatingTransitionController *)self platterView];
  [v4 center];
  double v6 = v5;
  double v8 = v7;

  if ([v14 numberOfTouches] == 1)
  {
    [v14 locationOfTouch:0 inView:0];
    double v6 = v9;
    double v8 = v10;
  }
  -[UIKeyboardFloatingTransitionController endTransitionAtPoint:withScale:](self, "endTransitionAtPoint:withScale:", v6, v8, 1.0);
  v11 = [(UIKeyboardFloatingTransitionController *)self panGestureRecognizer];
  CGRect v12 = [v11 view];
  CGRect v13 = [(UIKeyboardFloatingTransitionController *)self panGestureRecognizer];
  [v12 removeGestureRecognizer:v13];

  [(UIKeyboardFloatingTransitionController *)self setPanGestureRecognizer:0];
}

- (void)handlePinchGestureRecognizerAction:(id)a3
{
  id v4 = a3;
  switch([v4 state])
  {
    case 1:
      [(UIKeyboardFloatingTransitionController *)self beginPinchGesture:v4];
      break;
    case 2:
      [(UIKeyboardFloatingTransitionController *)self updatePinchGesture:v4];
      break;
    case 3:
    case 4:
      [(UIKeyboardFloatingTransitionController *)self endPinchGesture:v4];
      break;
    default:
      break;
  }
}

- (void)beginPinchGesture:(id)a3
{
  id v12 = a3;
  if ([v12 numberOfTouches])
  {
    [v12 locationInView:0];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v8 = [(UIKeyboardFloatingTransitionController *)self platterView];
    [v8 center];
    double v5 = v9;
    double v7 = v10;
  }
  [v12 scale];
  -[UIKeyboardFloatingTransitionController beginTransitionAtPoint:withScale:recognizer:](self, "beginTransitionAtPoint:withScale:recognizer:", v12, v5, v7, v11);
}

- (void)updatePinchGesture:(id)a3
{
  id v4 = a3;
  if ([v4 numberOfTouches])
  {
    [v4 locationInView:0];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v9 = [(UIKeyboardFloatingTransitionController *)self platterView];
    [v9 center];
    double v6 = v10;
    double v8 = v11;
  }
  [v4 scale];
  double v13 = v12;

  -[UIKeyboardFloatingTransitionController updateTransitionAtPoint:withScale:interactive:](self, "updateTransitionAtPoint:withScale:interactive:", 1, v6, v8, v13);
}

- (void)endPinchGesture:(id)a3
{
  id v4 = a3;
  if ([v4 numberOfTouches])
  {
    [v4 locationInView:0];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v9 = [(UIKeyboardFloatingTransitionController *)self platterView];
    [v9 center];
    double v6 = v10;
    double v8 = v11;
  }
  [v4 scale];
  double v13 = v12;

  -[UIKeyboardFloatingTransitionController endTransitionAtPoint:withScale:](self, "endTransitionAtPoint:withScale:", v6, v8, v13);
}

- (void)beginTransitionAtPoint:(CGPoint)a3 withScale:(double)a4 recognizer:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  [(UIKeyboardFloatingTransitionController *)self setIsTransitioning:1];
  [(UIKeyboardFloatingTransitionController *)self updateLayoutGuideForTransitionStart:1];
  double v10 = [(UIKeyboardFloatingTransitionController *)self delegate];
  [v10 willBeginTransitionWithController:self];

  -[UIKeyboardFloatingTransitionController initializeContextAtPoint:recognizer:](self, "initializeContextAtPoint:recognizer:", v9, x, y);
  -[UIKeyboardFloatingTransitionController updateTransitionAtPoint:withScale:interactive:](self, "updateTransitionAtPoint:withScale:interactive:", 0, x, y, a4);
}

- (void)updateTransitionAtPoint:(CGPoint)a3 withScale:(double)a4 interactive:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  double v10 = [(UIKeyboardFloatingTransitionController *)self endState];
  double v11 = [v10 inputView];

  if (v11)
  {
    double v12 = [(UIKeyboardFloatingTransitionController *)self platterView];
    [v12 center];
    double v14 = v13;
    double v16 = v15;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__UIKeyboardFloatingTransitionController_updateTransitionAtPoint_withScale_interactive___block_invoke;
    aBlock[3] = &unk_1E5305878;
    aBlock[4] = self;
    *(double *)&aBlock[5] = x;
    *(double *)&aBlock[6] = y;
    *(double *)&aBlock[7] = x - v14;
    *(double *)&aBlock[8] = y - v16;
    BOOL v24 = v5;
    *(double *)&aBlock[9] = a4;
    v17 = _Block_copy(aBlock);
    v18 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];

    if (v18)
    {
      if (v5) {
        [(UIKeyboardFloatingTransitionController *)self updateAnimationAtScale:a4];
      }
    }
    v19 = [(UIKeyboardFloatingTransitionController *)self animationBehavior];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __88__UIKeyboardFloatingTransitionController_updateTransitionAtPoint_withScale_interactive___block_invoke_2;
    v21[3] = &unk_1E52DA040;
    id v22 = v17;
    id v20 = v17;
    +[UIView _animateUsingSpringBehavior:v19 tracking:v5 animations:v21 completion:0];
  }
}

void __88__UIKeyboardFloatingTransitionController_updateTransitionAtPoint_withScale_interactive___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) platterView];
  objc_msgSend(v4, "setCenter:", v2, v3);

  BOOL v5 = [*(id *)(a1 + 32) startState];
  double v6 = [v5 inputView];
  [v6 center];
  double v8 = v7 + *(double *)(a1 + 56);
  double v10 = v9 + *(double *)(a1 + 64);
  double v11 = [*(id *)(a1 + 32) startState];
  double v12 = [v11 inputView];
  objc_msgSend(v12, "setCenter:", v8, v10);

  double v13 = [*(id *)(a1 + 32) endState];
  double v14 = [v13 inputView];
  [v14 center];
  double v16 = v15 + *(double *)(a1 + 56);
  double v18 = v17 + *(double *)(a1 + 64);
  v19 = [*(id *)(a1 + 32) endState];
  id v20 = [v19 inputView];
  objc_msgSend(v20, "setCenter:", v16, v18);

  v21 = [*(id *)(a1 + 32) lightEffectsTransitionBackdrop];
  if (!v21 || (int v22 = *(unsigned __int8 *)(a1 + 80), v21, !v22))
  {
    v23 = *(void **)(a1 + 32);
    double v24 = *(double *)(a1 + 72);
    [v23 updateAnimationAtScale:v24];
  }
}

uint64_t __88__UIKeyboardFloatingTransitionController_updateTransitionAtPoint_withScale_interactive___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endTransitionAtPoint:(CGPoint)a3 withScale:(double)a4
{
  double y = a3.y;
  CGFloat x = a3.x;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  double v8 = CACurrentMediaTime();
  [(UIKeyboardFloatingTransitionController *)self gestureBeginTime];
  double v10 = v8 - v9;
  double v11 = 1.0;
  if (v10 > 0.25)
  {
    if ([(UIKeyboardFloatingTransitionController *)self expandedForDocking])
    {
      [(UIKeyboardFloatingTransitionController *)self progress];
      double v11 = v12;
    }
    else
    {
      double v13 = [(UIKeyboardFloatingTransitionController *)self platterView];
      double v14 = [v13 _projectedTargetForKey:@"transform" decelerationFactor:0.995];

      memset(&v138, 0, sizeof(v138));
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v14) {
          [v14 CATransform3DValue];
        }
        else {
          memset(&v138, 0, sizeof(v138));
        }
      }
      else
      {
        CATransform3DMakeScale(&v138, a4, a4, 1.0);
      }
      CATransform3DGetDecomposition_();
      double v15 = round(v139 + -1.0);
      double v16 = [(UIKeyboardFloatingTransitionController *)self endState];
      [v16 scale];
      double v11 = v15 / (v17 + -1.0);
    }
  }
  double v18 = [(UIKeyboardFloatingTransitionController *)self platterView];
  v19 = [v18 _projectedTargetForKey:@"position" decelerationFactor:0.995];

  objc_opt_class();
  double v129 = y;
  CGFloat v20 = x;
  if (objc_opt_isKindOfClass())
  {
    [v19 CGPointValue];
    CGFloat v20 = v21;
    double y = v22;
  }
  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating]
    && (double v23 = 0.5, v11 < 0.5))
  {
    int v24 = 1;
  }
  else
  {
    int v25 = [(UIKeyboardFloatingTransitionController *)self startedFromFloating];
    double v23 = 0.5;
    int v24 = (v11 >= 0.5) & ~v25;
  }
  if (v11 >= v23)
  {
    v26 = [(UIKeyboardFloatingTransitionController *)self endState];
    [(UIKeyboardFloatingTransitionController *)self endState];
  }
  else
  {
    v26 = [(UIKeyboardFloatingTransitionController *)self startState];
    [(UIKeyboardFloatingTransitionController *)self startState];
  v27 = };
  CGFloat v128 = x;
  [v27 scale];
  uint64_t v127 = v28;

  v29 = @"NotOnEdge";
  v30 = [(UIKeyboardFloatingTransitionController *)self platterView];
  v31 = [v30 superview];

  [v31 bounds];
  double v35 = v32;
  double v36 = v33;
  double v37 = v34;
  double rect = v38;
  if (v24)
  {
    double v119 = v32;
    double v120 = v33;
    double v39 = v20;
    double v121 = v34;
    v40 = [(UIKeyboardFloatingTransitionController *)self platterView];
    v41 = [v40 layer];
    [v41 anchorPoint];
    double v43 = v42;
    double v44 = v10;
    double v46 = v45;

    if (v44 <= 0.25)
    {
      +[UIKeyboardImpl floatingPersistentOffset];
      double v48 = v47;
      double v50 = v49;
      [v26 platterViewFrame];
      double v52 = v51;
      double v54 = v53;
      +[UIKeyboardPopoverContainer contentInsets];
      double v57 = v54 - (v55 + v56);
      double v59 = v48 - v58;
      [v31 frame];
      double v61 = v50 + v60 - v57;
      double v39 = v43 * v52 + v59;
      double y = v46 * v54 + v61;
    }
    [v26 platterViewFrame];
    CGFloat v63 = v62;
    CGFloat v65 = v64;
    double v123 = v43;
    double v124 = v46;
    double v66 = v39 - v43 * v62;
    CGFloat v67 = y - v46 * v64;
    +[UIPeripheralHost floatingChromeBuffer];
    double v69 = v119 + v68;
    double v71 = v120 + v70;
    double v73 = v121 - (v68 + v72);
    double v75 = rect - (v70 + v74);
    v141.origin.CGFloat x = UIRectContainInRect(v66, v67, v63, v65, v119 + v68, v120 + v70, v73, v75);
    double v76 = v141.origin.x;
    CGFloat v77 = v141.origin.y;
    CGFloat height = v141.size.height;
    double recta = v141.size.width;
    double MinX = CGRectGetMinX(v141);
    v142.origin.CGFloat x = v69;
    v142.origin.double y = v71;
    v142.size.CGFloat width = v73;
    v142.size.CGFloat height = v75;
    double v80 = MinX - CGRectGetMinX(v142);
    +[UIKeyboardFloatingTransitionController magneticEdgeMargin];
    CGFloat v122 = v77;
    if (v80 <= v81)
    {
      v109 = UIKBAnalyticsFloatingKeyboardEdgeLeft;
      double v76 = v69;
      double v86 = v129;
      double v88 = v123;
      double v84 = height;
      double v90 = recta;
    }
    else
    {
      v143.origin.CGFloat x = v69;
      v143.origin.double y = v71;
      v143.size.CGFloat width = v73;
      v143.size.CGFloat height = v75;
      double MaxX = CGRectGetMaxX(v143);
      v144.origin.CGFloat x = v76;
      v144.origin.double y = v77;
      v144.size.CGFloat width = recta;
      v144.size.CGFloat height = height;
      double v83 = MaxX - CGRectGetMaxX(v144);
      +[UIKeyboardFloatingTransitionController magneticEdgeMargin];
      double v84 = height;
      if (v83 > v85)
      {
        double v86 = v129;
        double v88 = v123;
        double v87 = v124;
        double v89 = v122;
        double v90 = recta;
LABEL_31:
        double v106 = v88 * v90 + v76;
        double MaxY = v89 + v87 * v84;
        v108 = v29;
        goto LABEL_32;
      }
      v147.origin.CGFloat x = v69;
      v147.origin.double y = v71;
      v147.size.CGFloat width = v73;
      v147.size.CGFloat height = v75;
      double v90 = recta;
      double v76 = CGRectGetMaxX(v147) - recta;
      v109 = UIKBAnalyticsFloatingKeyboardEdgeRight;
      double v86 = v129;
      double v88 = v123;
    }
    v110 = *v109;

    v29 = v110;
    double v87 = v124;
    double v89 = v122;
    goto LABEL_31;
  }
  [v26 platterViewFrame];
  double v92 = v91;
  double v94 = v93;
  v95 = [(UIKeyboardFloatingTransitionController *)self platterView];
  v96 = [v95 layer];
  [v96 anchorPoint];
  double v98 = v92 * v97;
  double v99 = v92 * (1.0 - v97);
  double v101 = v94 * v100;
  double v102 = v94 * (1.0 - v100);

  CGFloat v103 = v35 + v98;
  CGFloat v104 = v36 + v101;
  CGFloat v105 = v37 - (v98 + v99);
  v145.origin.CGFloat x = v103;
  v145.origin.double y = v104;
  v145.size.CGFloat width = v105;
  v145.size.CGFloat height = rect - (v101 + v102);
  double v106 = CGRectGetMinX(v145);
  v146.origin.CGFloat x = v103;
  v146.origin.double y = v104;
  v146.size.CGFloat width = v105;
  v146.size.CGFloat height = rect - (v101 + v102);
  double MaxY = CGRectGetMaxY(v146);
  v108 = @"BottomEdge";

  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating]) {
    +[UIKBAnalyticsDispatcher floatingKeyboardSummonedEvent:@"Tether", @"Interactive", v106, MaxY trigger finalPosition];
  }
  double v86 = v129;
LABEL_32:
  v111 = [(UIKeyboardFloatingTransitionController *)self platterView];
  [v111 center];
  double v113 = v106 - v112;

  v114 = [(UIKeyboardFloatingTransitionController *)self platterView];
  [v114 center];
  double v116 = MaxY - v115;

  v117 = [(UIKeyboardFloatingTransitionController *)self animationBehavior];
  v137[0] = MEMORY[0x1E4F143A8];
  v137[1] = 3221225472;
  v137[2] = __73__UIKeyboardFloatingTransitionController_endTransitionAtPoint_withScale___block_invoke;
  v137[3] = &unk_1E53058A0;
  v137[4] = self;
  *(double *)&v137[5] = v106;
  *(double *)&v137[6] = MaxY;
  *(double *)&v137[7] = v113;
  *(double *)&v137[8] = v116;
  v137[9] = v127;
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __73__UIKeyboardFloatingTransitionController_endTransitionAtPoint_withScale___block_invoke_2;
  v130[3] = &unk_1E53058C8;
  char v136 = v24;
  double v132 = v106;
  double v133 = MaxY;
  v130[4] = self;
  v131 = v108;
  CGFloat v134 = v128;
  double v135 = v86;
  v118 = v108;
  +[UIView _animateUsingSpringBehavior:v117 tracking:0 animations:v137 completion:v130];
}

uint64_t __73__UIKeyboardFloatingTransitionController_endTransitionAtPoint_withScale___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) platterView];
  objc_msgSend(v4, "setCenter:", v2, v3);

  BOOL v5 = [*(id *)(a1 + 32) startState];
  double v6 = [v5 inputView];
  [v6 center];
  double v8 = v7 + *(double *)(a1 + 56);
  double v10 = v9 + *(double *)(a1 + 64);
  double v11 = [*(id *)(a1 + 32) startState];
  double v12 = [v11 inputView];
  objc_msgSend(v12, "setCenter:", v8, v10);

  double v13 = [*(id *)(a1 + 32) endState];
  double v14 = [v13 inputView];
  [v14 center];
  double v16 = v15 + *(double *)(a1 + 56);
  double v18 = v17 + *(double *)(a1 + 64);
  v19 = [*(id *)(a1 + 32) endState];
  CGFloat v20 = [v19 inputView];
  objc_msgSend(v20, "setCenter:", v16, v18);

  double v21 = *(void **)(a1 + 32);
  double v22 = *(double *)(a1 + 72);
  return [v21 updateAnimationAtScale:v22];
}

uint64_t __73__UIKeyboardFloatingTransitionController_endTransitionAtPoint_withScale___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finalizeTransition];
  if (([*(id *)(a1 + 32) startedFromFloating] & 1) != 0 || !*(unsigned char *)(a1 + 80))
  {
    uint64_t result = [*(id *)(a1 + 40) isEqualToString:@"BottomEdge"];
    if ((result & 1) == 0)
    {
      BOOL v5 = [*(id *)(a1 + 32) platterView];
      [v5 frame];
      double MinY = CGRectGetMinY(v13);

      double v7 = *(double *)(a1 + 48);
      double v8 = *(double *)(a1 + 56);
      double v9 = *(double *)(a1 + 64);
      double v10 = *(double *)(a1 + 72);
      if (MinY <= 0.0) {
        double v11 = @"TopEdge";
      }
      else {
        double v11 = *(__CFString **)(a1 + 40);
      }
      return +[UIKBAnalyticsDispatcher floatingKeyboardMoved:toPosition:touchPosition:](UIKBAnalyticsDispatcher, "floatingKeyboardMoved:toPosition:touchPosition:", v11, v7, v8, v9, v10);
    }
  }
  else
  {
    double v2 = *(double *)(a1 + 48);
    double v3 = *(double *)(a1 + 56);
    return +[UIKBAnalyticsDispatcher floatingKeyboardSummonedEvent:@"Untether", @"Interactive", v2, v3 trigger finalPosition];
  }
  return result;
}

- (void)initializeContextAtPoint:(CGPoint)a3 recognizer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v323[10] = *MEMORY[0x1E4F143B8];
  id v308 = a4;
  [(UIKeyboardFloatingTransitionController *)self setProgress:0.0];
  [(UIKeyboardFloatingTransitionController *)self setStartedFromFloating:+[UIKeyboardImpl isFloating]];
  double v7 = [(UIKeyboardFloatingTransitionController *)self delegate];
  double v8 = [v7 inputWindowControllerForController:self];
  [(UIKeyboardFloatingTransitionController *)self setInputWindowController:v8];

  double v9 = objc_alloc_init(UIKeyboardFloatingTransitionState);
  [(UIKeyboardFloatingTransitionController *)self setStartState:v9];

  double v10 = objc_alloc_init(UIKeyboardFloatingTransitionState);
  [(UIKeyboardFloatingTransitionController *)self setEndState:v10];

  [(UIKeyboardFloatingTransitionController *)self captureStateForStart:1];
  double v11 = [(UIKeyboardFloatingTransitionController *)self startState];
  double v12 = [v11 inputView];
  _UIViewSetAnchorPointToTouchPoint(v12, x, y);

  CGRect v13 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  double v14 = [v13 view];

  double v15 = [v14 window];
  double v16 = [UIView alloc];
  double v17 = *MEMORY[0x1E4F1DB28];
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v21 = -[UIView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], v18, v19, v20);
  [(UIKeyboardFloatingTransitionController *)self setPlatterView:v21];

  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating])
  {
    +[UIKeyboardPopoverContainer shadowOffset];
    double v23 = v22;
    double v25 = v24;
    v26 = [(UIKeyboardFloatingTransitionController *)self platterView];
    v27 = [v26 layer];
    objc_msgSend(v27, "setShadowOffset:", v23, v25);

    id v28 = +[UIKeyboardPopoverContainer shadowColor];
    uint64_t v29 = [v28 CGColor];
    v30 = [(UIKeyboardFloatingTransitionController *)self platterView];
    v31 = [v30 layer];
    [v31 setShadowColor:v29];

    +[UIKeyboardPopoverContainer shadowOpacity];
    *(float *)&double v23 = v32;
    double v33 = [(UIKeyboardFloatingTransitionController *)self platterView];
    double v34 = [v33 layer];
    LODWORD(v35) = LODWORD(v23);
    [v34 setShadowOpacity:v35];

    +[UIKeyboardPopoverContainer shadowRadius];
    double v37 = v36;
    double v38 = [(UIKeyboardFloatingTransitionController *)self platterView];
    double v39 = [v38 layer];
    [v39 setShadowRadius:v37];
  }
  v40 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v17, v18, v19, v20);
  [(UIKeyboardFloatingTransitionController *)self setPlatterCornerRadiusView:v40];

  v41 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  [v41 setAutoresizingMask:18];

  double v42 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  double v43 = [v42 layer];
  [v43 setMasksToBounds:1];

  double v44 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v44 cornerRadius];
  double v46 = v45;
  double v47 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  double v48 = [v47 layer];
  [v48 setCornerRadius:v46];

  double v49 = [(UIKeyboardFloatingTransitionController *)self startState];
  id v50 = [v49 borderColor];
  uint64_t v51 = [v50 CGColor];
  double v52 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  double v53 = [v52 layer];
  [v53 setBorderColor:v51];

  double v54 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v54 borderWidth];
  double v56 = v55;
  double v57 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  double v58 = [v57 layer];
  [v58 setBorderWidth:v56];

  double v59 = [(UIKeyboardFloatingTransitionController *)self platterView];
  double v60 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  [v59 addSubview:v60];

  double v61 = objc_msgSend(objc_alloc(+[_UIPopoverStandardChromeView standardChromeViewClass](_UIPopoverStandardChromeView, "standardChromeViewClass")), "initWithFrame:", v17, v18, v19, v20);
  [(UIKeyboardFloatingTransitionController *)self setPlatterPopoverBackgroundView:v61];

  double v62 = [(UIKeyboardFloatingTransitionController *)self platterPopoverBackgroundView];
  [v62 setAutoresizingMask:18];

  CGFloat v63 = [(UIKeyboardFloatingTransitionController *)self platterPopoverBackgroundView];
  [v63 setBackgroundStyle:6];

  double v64 = [(UIKeyboardFloatingTransitionController *)self platterPopoverBackgroundView];
  [v64 setArrowDirection:0];

  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating]) {
    double v65 = 1.0;
  }
  else {
    double v65 = 0.0;
  }
  double v66 = [(UIKeyboardFloatingTransitionController *)self platterPopoverBackgroundView];
  [v66 setAlpha:v65];

  CGFloat v67 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  double v68 = [(UIKeyboardFloatingTransitionController *)self platterPopoverBackgroundView];
  [v67 addSubview:v68];

  double v69 = +[UIKBRenderConfig defaultConfig];
  uint64_t v70 = [v69 backdropStyle];

  double v71 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  double v72 = [v71 hosting];
  double v73 = [v72 itemForPurpose:0];

  if ([v73 conformsToProtocol:&unk_1ED5DE448]) {
    uint64_t v70 = [v73 inputViewBackdropStyle];
  }
  if (v70 == 3904)
  {
    double v74 = -[_UIKBLightEffectsBackground initWithFrame:]([_UIKBLightEffectsBackground alloc], "initWithFrame:", v17, v18, v19, v20);
    [(UIKeyboardFloatingTransitionController *)self setLightEffectsTransitionBackdrop:v74];

    double v75 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    [v75 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v76 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    CGFloat v77 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    [v76 addSubview:v77];

    v78 = [(UIKeyboardFloatingTransitionController *)self platterPopoverBackgroundView];
    [v78 setAlpha:0.0];

    v79 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    double v80 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    double v81 = [(UIKeyboardFloatingTransitionController *)self platterView];
    v82 = [v81 _inheritedRenderConfig];
    [v80 _setRenderConfig:v82];
  }
  else
  {
    [(UIKeyboardFloatingTransitionController *)self setLightEffectsTransitionBackdrop:0];
    double v83 = -[UIKBBackdropView initWithFrame:style:]([UIKBVisualEffectView alloc], "initWithFrame:style:", v70, v17, v18, v19, v20);
    [(UIKeyboardFloatingTransitionController *)self setPlatterVisualEffectView:v83];

    double v84 = [(UIKeyboardFloatingTransitionController *)self platterVisualEffectView];
    [v84 setAutoresizingMask:18];

    double v85 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    double v86 = [(UIKeyboardFloatingTransitionController *)self platterVisualEffectView];
    [v85 addSubview:v86];

    double v80 = [(UIKeyboardFloatingTransitionController *)self platterVisualEffectView];
    v79 = [v80 contentView];
  }

  double v87 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v17, v18, v19, v20);
  [(UIKeyboardFloatingTransitionController *)self setPillView:v87];

  double v88 = [(UIKeyboardFloatingTransitionController *)self pillView];
  [v88 setAutoresizingMask:13];

  double v89 = +[UIKeyboardPopoverContainer pillColor];
  double v90 = [(UIKeyboardFloatingTransitionController *)self pillView];
  [v90 setBackgroundColor:v89];

  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating]) {
    double v91 = 1.0;
  }
  else {
    double v91 = 0.0;
  }
  double v92 = [(UIKeyboardFloatingTransitionController *)self pillView];
  [v92 setAlpha:v91];

  +[UIKeyboardPopoverContainer pillCornerRadius];
  double v94 = v93;
  v95 = [(UIKeyboardFloatingTransitionController *)self pillView];
  v96 = [v95 layer];
  [v96 setCornerRadius:v94];

  double v97 = [(UIKeyboardFloatingTransitionController *)self pillView];
  [v79 addSubview:v97];

  double v98 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v98 platterViewFrame];
  double v100 = v99;
  double v102 = v101;
  double v104 = v103;
  double v106 = v105;
  v107 = [(UIKeyboardFloatingTransitionController *)self platterView];
  objc_msgSend(v107, "setFrame:", v100, v102, v104, v106);

  v108 = [(UIKeyboardFloatingTransitionController *)self platterView];
  _UIViewSetAnchorPointToTouchPoint(v108, x, y);

  +[UIKeyboardPopoverContainer pillSize];
  double v110 = v109;
  double v112 = v111;
  +[UIKeyboardPopoverContainer dragAreaHeight];
  double v113 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v113 platterViewFrame];
  CGFloat v114 = CGRectGetWidth(v324) * 0.5 - v110 * 0.5;
  double v115 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v115 platterViewFrame];
  CGFloat v116 = CGRectGetHeight(v325) - v112;
  +[UIKeyboardPopoverContainer pillDistanceToEdge];
  CGFloat v118 = v116 - v117;
  double v119 = [(UIKeyboardFloatingTransitionController *)self pillView];
  objc_msgSend(v119, "setFrame:", v114, v118, v110, v112);

  double v120 = [(UIKeyboardFloatingTransitionController *)self platterView];
  [v120 frame];
  double MidX = CGRectGetMidX(v326);
  CGFloat v122 = [(UIKeyboardFloatingTransitionController *)self platterView];
  [v122 frame];
  [(UIKeyboardFloatingTransitionController *)self setWithinDockingRegion:+[UIKeyboardFloatingTransitionController isPointWithinDockingRegion:](UIKeyboardFloatingTransitionController, "isPointWithinDockingRegion:", MidX, CGRectGetMaxY(v327))];

  [(UIKeyboardFloatingTransitionController *)self setExpandedForDocking:0];
  double v123 = [(UIKeyboardFloatingTransitionController *)self platterView];
  double v124 = [v123 layer];
  [v124 setAllowsGroupBlending:0];

  v125 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  v126 = [v125 layer];
  [v126 setAllowsGroupBlending:0];

  uint64_t v127 = [(UIKeyboardFloatingTransitionController *)self platterVisualEffectView];
  CGFloat v128 = [v127 layer];
  [v128 setAllowsGroupBlending:0];

  double v129 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
  v130 = [v129 layer];
  [v130 setAllowsGroupBlending:0];

  v131 = [(UIKeyboardFloatingTransitionController *)self platterView];
  [v15 addSubview:v131];

  double v132 = [(UIKeyboardFloatingTransitionController *)self startState];
  double v133 = [v132 inputView];
  [v15 addSubview:v133];

  CGFloat v134 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];

  if (v134)
  {
    double v135 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
    char v136 = [v135 inputViewSet];

    v137 = [v136 assistantViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v296 = v15;
    v297 = v14;
    v306 = v73;
    v301 = v136;
    v304 = v79;
    if (isKindOfClass)
    {
      double v139 = [v136 assistantViewController];
      uint64_t v140 = +[UITraitCollection traitCollectionWithUserInterfaceIdiom:1];
      [v139 preferredHeightForTraitCollection:v140];
      double v142 = v141;
    }
    else
    {
      double v142 = 55.0;
    }
    v274 = (void *)MEMORY[0x1E4F5B268];
    v298 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    v294 = [v298 topAnchor];
    v295 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    v293 = [v295 topAnchor];
    v292 = [v294 constraintEqualToAnchor:v293];
    v323[0] = v292;
    v291 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    v289 = [v291 leadingAnchor];
    v290 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    v288 = [v290 leadingAnchor];
    v287 = [v289 constraintEqualToAnchor:v288];
    v323[1] = v287;
    v286 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    v284 = [v286 bottomAnchor];
    v285 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    v283 = [v285 bottomAnchor];
    v282 = [v284 constraintEqualToAnchor:v283];
    v323[2] = v282;
    v281 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    v279 = [v281 trailingAnchor];
    v280 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    v278 = [v280 trailingAnchor];
    v277 = [v279 constraintEqualToAnchor:v278];
    v323[3] = v277;
    v276 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    v275 = [v276 fullBackdropLayoutGuide];
    v272 = [v275 topAnchor];
    v273 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    v271 = [v273 topAnchor];
    v270 = [v272 constraintEqualToAnchor:v271];
    v323[4] = v270;
    v269 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    v268 = [v269 fullBackdropLayoutGuide];
    v266 = [v268 leadingAnchor];
    v267 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    v265 = [v267 leadingAnchor];
    v264 = [v266 constraintEqualToAnchor:v265];
    v323[5] = v264;
    v263 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    v261 = [v263 bottomAnchor];
    v262 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    v260 = [v262 fullBackdropLayoutGuide];
    v259 = [v260 bottomAnchor];
    v258 = [v261 constraintEqualToAnchor:v259];
    v323[6] = v258;
    v257 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    v255 = [v257 trailingAnchor];
    v256 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    v254 = [v256 fullBackdropLayoutGuide];
    v253 = [v254 trailingAnchor];
    v252 = [v255 constraintEqualToAnchor:v253];
    v323[7] = v252;
    v251 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    v250 = [v251 assistantLayoutGuide];
    CGRect v143 = [v250 topAnchor];
    CGRect v144 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
    CGRect v145 = [v144 topAnchor];
    CGRect v146 = [v143 constraintEqualToAnchor:v145];
    v323[8] = v146;
    CGRect v147 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
    v148 = [v147 assistantLayoutGuide];
    v149 = [v148 heightAnchor];
    v150 = [v149 constraintEqualToConstant:v142];
    v323[9] = v150;
    v151 = [MEMORY[0x1E4F1C978] arrayWithObjects:v323 count:10];
    [v274 activateConstraints:v151];

    double v15 = v296;
    double v14 = v297;
    double v73 = v306;
    v79 = v304;
  }

  v152 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  [v152 setInputViewsHidden:1];

  [(UIKeyboardFloatingTransitionController *)self constrainAccessoryViewToBottom];
  +[UIKeyboardImpl setFloating:[(UIKeyboardFloatingTransitionController *)self startedFromFloating] ^ 1 positionedAtDefaultOffsetAnimated:0];
  v153 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  v154 = [v153 inputViewSet];
  uint64_t v155 = [v154 keyboard];
  if (!v155)
  {

    goto LABEL_23;
  }
  v156 = (void *)v155;
  v157 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  v158 = [v157 inputViewSet];
  int v159 = [v158 isCustomInputView];

  if (v159)
  {
LABEL_23:
    v160 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
    v161 = [v160 inputViewSet];
    v162 = [v161 inputView];
    [v162 setAlpha:0.0];

    v163 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
    [v163 updateViewSizingConstraints];
  }
  [MEMORY[0x1E4F39CF8] flush];
  [(UIKeyboardFloatingTransitionController *)self captureStateForStart:0];
  v164 = [(UIKeyboardFloatingTransitionController *)self endState];
  v165 = [v164 inputView];
  _UIViewSetAnchorPointToTouchPoint(v165, x, y);

  uint64_t v166 = [v308 state];
  if (v166 != 4) {
    [v14 setAlpha:0.0];
  }
  v167 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  [v167 setInputViewsHidden:0];

  v168 = [(UIKeyboardFloatingTransitionController *)self startState];
  objc_msgSend(v168, "setScale:", 1.0, 1.0);

  v169 = [(UIKeyboardFloatingTransitionController *)self endState];
  [v169 platterViewFrame];
  double v171 = v170;
  v172 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v172 platterViewFrame];
  double v174 = v171 / v173;
  v175 = [(UIKeyboardFloatingTransitionController *)self endState];
  [v175 platterViewFrame];
  double v177 = v176;
  v178 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v178 platterViewFrame];
  double v180 = v177 / v179;
  v181 = [(UIKeyboardFloatingTransitionController *)self endState];
  objc_msgSend(v181, "setScale:", v174, v180);

  v182 = [(UIKeyboardFloatingTransitionController *)self startState];
  long long v307 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v319[0] = *MEMORY[0x1E4F1DAB8];
  long long v309 = v319[0];
  v319[1] = v307;
  long long v320 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v305 = v320;
  [v182 setInitialInputViewTransform:v319];

  v183 = [(UIKeyboardFloatingTransitionController *)self startState];
  v184 = [v183 inputView];
  v185 = [(UIKeyboardFloatingTransitionController *)self endState];
  [v185 inputViewFrame];
  double v187 = v186;
  double v189 = v188;
  double v191 = v190;
  double v193 = v192;
  id v194 = v184;
  [v194 frame];
  double v196 = v195;
  double v198 = v197;
  double v200 = v199;
  double v202 = v201;
  CGFloat v299 = v193 / v201;
  CGFloat v302 = v191 / v199;
  v203 = [v194 layer];
  [v203 anchorPoint];
  double v205 = v196 + (v200 - v191) * v204;

  v206 = [v194 layer];

  [v206 anchorPoint];
  double v208 = v198 + (v202 - v193) * v207;

  *(_OWORD *)&v318.a = v309;
  *(_OWORD *)&v318.c = v307;
  *(_OWORD *)&v318.tdouble x = v305;
  *(_OWORD *)&v322.a = v309;
  *(_OWORD *)&v322.c = v307;
  *(_OWORD *)&v322.tdouble x = v305;
  CGAffineTransformTranslate(&v318, &v322, v187 - v205, v189 - v208);
  CGAffineTransform v321 = v318;
  CGAffineTransformScale(&v322, &v321, v302, v299);
  CGAffineTransform v318 = v322;
  v209 = [(UIKeyboardFloatingTransitionController *)self startState];
  CGAffineTransform v317 = v318;
  [v209 setFinalInputViewTransform:&v317];

  v210 = [(UIKeyboardFloatingTransitionController *)self endState];
  v211 = [v210 inputView];
  v212 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v212 inputViewFrame];
  double v214 = v213;
  double v216 = v215;
  double v218 = v217;
  double v220 = v219;
  id v221 = v211;
  [v221 frame];
  double v223 = v222;
  double v225 = v224;
  double v227 = v226;
  double v229 = v228;
  CGFloat v300 = v220 / v228;
  CGFloat v303 = v218 / v226;
  v230 = [v221 layer];
  [v230 anchorPoint];
  double v232 = v223 + (v227 - v218) * v231;

  v233 = [v221 layer];

  [v233 anchorPoint];
  double v235 = v225 + (v229 - v220) * v234;

  *(_OWORD *)&v316.a = v309;
  *(_OWORD *)&v316.c = v307;
  *(_OWORD *)&v316.tdouble x = v305;
  *(_OWORD *)&v322.a = v309;
  *(_OWORD *)&v322.c = v307;
  *(_OWORD *)&v322.tdouble x = v305;
  CGAffineTransformTranslate(&v316, &v322, v214 - v232, v216 - v235);
  CGAffineTransform v321 = v316;
  CGAffineTransformScale(&v322, &v321, v303, v300);
  CGAffineTransform v316 = v322;
  v236 = [(UIKeyboardFloatingTransitionController *)self endState];
  CGAffineTransform v315 = v316;
  [v236 setInitialInputViewTransform:&v315];

  v237 = [(UIKeyboardFloatingTransitionController *)self endState];
  v314[0] = v309;
  v314[1] = v307;
  v314[2] = v305;
  [v237 setFinalInputViewTransform:v314];

  v238 = [(UIKeyboardFloatingTransitionController *)self endState];
  v239 = [v238 inputView];
  [v239 setAlpha:0.0];

  v240 = [(UIKeyboardFloatingTransitionController *)self endState];
  v241 = v240;
  if (v240)
  {
    [v240 initialInputViewTransform];
  }
  else
  {
    long long v312 = 0u;
    long long v313 = 0u;
    long long v311 = 0u;
  }
  v242 = [(UIKeyboardFloatingTransitionController *)self endState];
  v243 = [v242 inputView];
  v310[0] = v311;
  v310[1] = v312;
  v310[2] = v313;
  [v243 setTransform:v310];

  v244 = [(UIKeyboardFloatingTransitionController *)self endState];
  v245 = [v244 inputView];
  [v15 addSubview:v245];

  v246 = objc_alloc_init(UIViewSpringAnimationBehavior);
  [(UIKeyboardFloatingTransitionController *)self setAnimationBehavior:v246];

  v247 = [(UIKeyboardFloatingTransitionController *)self animationBehavior];
  [v247 setDampingRatio:0.9 response:0.2];

  v248 = [(UIKeyboardFloatingTransitionController *)self animationBehavior];
  [v248 setTrackingDampingRatio:1.0 response:0.12 dampingRatioSmoothing:0.08 responseSmoothing:0.08];

  v249 = [(UIKeyboardFloatingTransitionController *)self platterView];
  [v249 center];
  -[UIKeyboardFloatingTransitionController setLastGestureCenter:](self, "setLastGestureCenter:");

  [(UIKeyboardFloatingTransitionController *)self setGestureBeginTime:CACurrentMediaTime()];
}

- (void)constrainAccessoryViewToBottom
{
}

void __72__UIKeyboardFloatingTransitionController_constrainAccessoryViewToBottom__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 containerRootController];
  double v2 = [v6 inputViewSet];
  uint64_t v3 = [v2 inputAccessoryView];
  if (v3)
  {
    id v4 = (void *)v3;
    char v5 = [v2 isInputAccessoryViewPlaceholder];

    if ((v5 & 1) == 0) {
      [v6 setForceAccessoryViewToBottomOfHostView:1];
    }
  }
}

- (void)restoreAccessoryViewConstraints
{
}

void __73__UIKeyboardFloatingTransitionController_restoreAccessoryViewConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 containerRootController];
  if ([v2 forceAccessoryViewToBottomOfHostView])
  {
    [v2 setForceAccessoryViewToBottomOfHostView:0];
    [v2 updateViewConstraints];
  }
}

- (void)finalizeTransition
{
  uint64_t v3 = [(UIKeyboardFloatingTransitionController *)self platterView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(UIKeyboardFloatingTransitionController *)self progress];
  if (v12 >= 0.5) {
    [(UIKeyboardFloatingTransitionController *)self endState];
  }
  else {
  CGRect v13 = [(UIKeyboardFloatingTransitionController *)self startState];
  }
  [v13 platterInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  double v21 = [v20 view];
  double v22 = [v21 superview];

  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating]
    && ([(UIKeyboardFloatingTransitionController *)self progress], v23 < 0.5)
    || ![(UIKeyboardFloatingTransitionController *)self startedFromFloating]
    && ([(UIKeyboardFloatingTransitionController *)self progress], v24 >= 0.5))
  {
    double v25 = v5 + v17;
    double v28 = v7 + v15;
    double v29 = v11 - (v15 + v19);
    v30 = +[UIScreen mainScreen];
    [v30 bounds];
    double v32 = v31;

    double v26 = -(v32 - (v28 + v29));
    if (+[UIKeyboardImpl isFloating]) {
      goto LABEL_23;
    }
    uint64_t v27 = 1;
LABEL_12:
    +[UIKeyboardImpl setFloating:v27];
    double v33 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
    double v34 = [v33 inputViewSet];
    uint64_t v35 = [v34 keyboard];
    if (v35)
    {
      double v36 = (void *)v35;
      double v37 = v22;
      double v38 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
      double v39 = [v38 inputViewSet];
      int v40 = [v39 isCustomInputView];

      if (!v40)
      {
LABEL_17:
        double v22 = v37;
        if (v27) {
          goto LABEL_23;
        }
        goto LABEL_18;
      }
    }
    else
    {
      double v37 = v22;
    }
    v41 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
    [v41 updateViewSizingConstraints];

    goto LABEL_17;
  }
  double v25 = *MEMORY[0x1E4F1DAD8];
  double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (+[UIKeyboardImpl isFloating])
  {
    uint64_t v27 = 0;
    goto LABEL_12;
  }
LABEL_18:
  double v42 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  double v43 = [v42 inputViewSet];

  double v44 = [v43 assistantViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v46 = [v43 assistantViewController];
    if ([v46 shouldBeShownForInputDelegate:0 inputViews:v43])
    {
      double v47 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      double v48 = [v47 responder];

      [v46 setInputAssistantButtonItemsForResponder:v48];
    }
  }
LABEL_23:
  double v49 = +[UIPeripheralHost sharedInstance];
  objc_msgSend(v49, "setUndockedWithOffset:animated:", 0, v25, v26);

  id v50 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  uint64_t v51 = [v50 view];
  [v51 setAlpha:1.0];

  double v52 = [(UIKeyboardFloatingTransitionController *)self platterView];
  [v52 removeFromSuperview];

  double v53 = [(UIKeyboardFloatingTransitionController *)self startState];
  double v54 = [v53 inputView];
  [v54 removeFromSuperview];

  double v55 = [(UIKeyboardFloatingTransitionController *)self endState];
  double v56 = [v55 inputView];
  [v56 removeFromSuperview];

  [(UIKeyboardFloatingTransitionController *)self setPlatterView:0];
  [(UIKeyboardFloatingTransitionController *)self setStartState:0];
  [(UIKeyboardFloatingTransitionController *)self setEndState:0];
  [(UIKeyboardFloatingTransitionController *)self setIsTransitioning:0];
  [(UIKeyboardFloatingTransitionController *)self updateLayoutGuideForTransitionStart:0];
  -[UIKeyboardFloatingTransitionController updateLayoutGuideFromFrame:](self, "updateLayoutGuideFromFrame:", v5, v7, v9, v11);
  [(UIKeyboardFloatingTransitionController *)self restoreAccessoryViewConstraints];
  double v57 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  double v58 = [v57 inputViewSet];
  uint64_t v59 = [v58 keyboard];
  if (!v59)
  {

    goto LABEL_28;
  }
  double v60 = (void *)v59;
  double v61 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  double v62 = [v61 inputViewSet];
  char v63 = [v62 isCustomInputView];

  if (v63)
  {
LABEL_28:
    double v65 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
    double v68 = [v65 inputViewSet];
    double v69 = [v68 inputView];
    [v69 setAlpha:1.0];

    goto LABEL_29;
  }
  double v64 = +[UIKeyboardImpl activeInstance];
  double v65 = [v64 keyplaneView];

  double v66 = [v65 keyplane];
  uint64_t v67 = [v66 visualStyling] & 0xFF0000;

  if (v67 != 2490368)
  {
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __60__UIKeyboardFloatingTransitionController_finalizeTransition__block_invoke;
    v80[3] = &unk_1E52D9F70;
    id v81 = v65;
    +[UIView performWithoutAnimation:v80];
  }
LABEL_29:

  uint64_t v70 = [(UIKeyboardFloatingTransitionController *)self delegate];
  [v70 didEndTransitionWithController:self];

  double v71 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v72 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  double v73 = [v72 inputViewSet];
  double v74 = +[UIInputViewAnimationStyle animationStyleDefault];
  [v71 prepareToMoveKeyboardForInputViewSet:v73 animationStyle:v74];

  double v75 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v76 = [v75 containerRootController];

  CGFloat v77 = [v76 inputViewSet];
  LODWORD(v73) = [v77 isInputViewPlaceholder];

  if (v73)
  {
    v78 = [v76 inputViewSet];
    v79 = [v78 inputView];
    [v79 refreshPlaceholder];
  }
}

void __60__UIKeyboardFloatingTransitionController_finalizeTransition__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) hideKeyCaps:0];
  id v2 = *(void **)(a1 + 32);
  double v4 = &unk_1ED3F6708;
  v5[0] = &unk_1ED3F2418;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 dimKeys:v3];
}

- (void)updateAnimationAtScale:(double)a3
{
  double v4 = a3 + -1.0;
  double v5 = [(UIKeyboardFloatingTransitionController *)self endState];
  [v5 scale];
  double v7 = v4 / (v6 + -1.0);

  LODWORD(v5) = [(UIKeyboardFloatingTransitionController *)self startedFromFloating];
  BOOL v8 = [(UIKeyboardFloatingTransitionController *)self startedFromFloating];
  double v9 = -0.1;
  if (v5) {
    double v9 = 0.0;
  }
  double v10 = 1.1;
  if (!v8) {
    double v10 = 1.0;
  }
  double v11 = fmax(v9, fmin(v7, v10));
  [(UIKeyboardFloatingTransitionController *)self progress];
  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating])
  {
    double v12 = [(UIKeyboardFloatingTransitionController *)self platterView];
    [v12 center];
    double v14 = v13;
    double v16 = v15;

    double v17 = [(UIKeyboardFloatingTransitionController *)self platterView];
    [v17 bounds];
    double v18 = v16 + CGRectGetHeight(v173) * 0.5;

    LODWORD(v17) = [(UIKeyboardFloatingTransitionController *)self withinDockingRegion];
    [(UIKeyboardFloatingTransitionController *)self setWithinDockingRegion:+[UIKeyboardFloatingTransitionController isPointWithinDockingRegion:](UIKeyboardFloatingTransitionController, "isPointWithinDockingRegion:", v14, v18)];
    if (v17 == [(UIKeyboardFloatingTransitionController *)self withinDockingRegion])
    {
      if ([(UIKeyboardFloatingTransitionController *)self expandedForDocking]) {
        return;
      }
    }
    else
    {
      BOOL v19 = [(UIKeyboardFloatingTransitionController *)self withinDockingRegion];
      if (v19)
      {
        if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating]) {
          double v20 = 0.66;
        }
        else {
          double v20 = 0.34;
        }
        BOOL v21 = [(UIKeyboardFloatingTransitionController *)self startedFromFloating];
        double v22 = fmax(v20, v11);
        double v23 = fmin(v20, v11);
        if (v21) {
          double v11 = v22;
        }
        else {
          double v11 = v23;
        }
      }
      [(UIKeyboardFloatingTransitionController *)self setExpandedForDocking:v19];
    }
  }
  [(UIKeyboardFloatingTransitionController *)self setProgress:v11];
  double v24 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v24 scale];
  double v26 = v25;
  uint64_t v27 = [(UIKeyboardFloatingTransitionController *)self endState];
  [v27 scale];
  double v29 = v28;
  [(UIKeyboardFloatingTransitionController *)self progress];
  double v31 = v29 * v30 + v26 * (1.0 - v30);

  double v32 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v32 scale];
  double v34 = v33;
  uint64_t v35 = [(UIKeyboardFloatingTransitionController *)self endState];
  [v35 scale];
  double v37 = v36;
  [(UIKeyboardFloatingTransitionController *)self progress];
  double v39 = v37 * v38 + v34 * (1.0 - v38);

  int v40 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v40 platterViewFrame];
  double v42 = v31 * v41;

  double v43 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v43 platterViewFrame];
  double v45 = v39 * v44;

  double v46 = [(UIKeyboardFloatingTransitionController *)self platterView];
  objc_msgSend(v46, "setBounds:", 0.0, 0.0, v42, v45);

  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating]) {
    double v47 = 1.0;
  }
  else {
    double v47 = 0.0;
  }
  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating]) {
    double v48 = 0.0;
  }
  else {
    double v48 = 1.0;
  }
  [(UIKeyboardFloatingTransitionController *)self progress];
  double v50 = v48 * v49 + v47 * (1.0 - v49);
  uint64_t v51 = [(UIKeyboardFloatingTransitionController *)self platterPopoverBackgroundView];
  [v51 setAlpha:v50];

  BOOL v52 = [(UIKeyboardFloatingTransitionController *)self startedFromFloating];
  double v53 = (double *)MEMORY[0x1E4F1DB30];
  if (v52)
  {
    +[UIKeyboardPopoverContainer shadowOffset];
    double v55 = v54;
    double v57 = v56;
  }
  else
  {
    double v55 = *MEMORY[0x1E4F1DB30];
    double v57 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating])
  {
    double v59 = *v53;
    double v58 = v53[1];
  }
  else
  {
    +[UIKeyboardPopoverContainer shadowOffset];
    double v59 = v60;
    double v58 = v61;
  }
  [(UIKeyboardFloatingTransitionController *)self progress];
  double v63 = v59 * v62 + v55 * (1.0 - v62);
  double v64 = v58 * v62 + v57 * (1.0 - v62);
  double v65 = [(UIKeyboardFloatingTransitionController *)self platterView];
  double v66 = [v65 layer];
  objc_msgSend(v66, "setShadowOffset:", v63, v64);

  double v67 = 0.0;
  double v68 = 0.0;
  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating])
  {
    +[UIKeyboardPopoverContainer shadowOpacity];
    double v68 = v69;
  }
  if (![(UIKeyboardFloatingTransitionController *)self startedFromFloating])
  {
    +[UIKeyboardPopoverContainer shadowOpacity];
    double v67 = v70;
  }
  [(UIKeyboardFloatingTransitionController *)self progress];
  float v72 = v67 * v71 + v68 * (1.0 - v71);
  double v73 = [(UIKeyboardFloatingTransitionController *)self platterView];
  double v74 = [v73 layer];
  *(float *)&double v75 = v72;
  [v74 setShadowOpacity:v75];

  double v76 = 0.0;
  double v77 = 0.0;
  if ([(UIKeyboardFloatingTransitionController *)self startedFromFloating])
  {
    +[UIKeyboardPopoverContainer shadowRadius];
    double v77 = v78;
  }
  if (![(UIKeyboardFloatingTransitionController *)self startedFromFloating])
  {
    +[UIKeyboardPopoverContainer shadowRadius];
    double v76 = v79;
  }
  [(UIKeyboardFloatingTransitionController *)self progress];
  double v81 = v76 * v80 + v77 * (1.0 - v80);
  v82 = [(UIKeyboardFloatingTransitionController *)self platterView];
  double v83 = [v82 layer];
  [v83 setShadowRadius:v81];

  double v84 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v84 cornerRadius];
  double v86 = v85;
  double v87 = [(UIKeyboardFloatingTransitionController *)self endState];
  [v87 cornerRadius];
  double v89 = v88;
  [(UIKeyboardFloatingTransitionController *)self progress];
  double v91 = v89 * v90 + v86 * (1.0 - v90);
  double v92 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  double v93 = [v92 layer];
  [v93 setCornerRadius:v91];

  double v94 = [(UIKeyboardFloatingTransitionController *)self startState];
  v95 = [v94 borderColor];
  v96 = [(UIKeyboardFloatingTransitionController *)self endState];
  double v97 = [v96 borderColor];
  [(UIKeyboardFloatingTransitionController *)self progress];
  double v99 = v98;
  double v171 = 0.0;
  double v172 = 0.0;
  double v169 = 0.0;
  double v170 = 0.0;
  id v100 = v97;
  [v95 getRed:&v172 green:&v171 blue:&v170 alpha:&v169];
  double v167 = 0.0;
  double v168 = 0.0;
  double v165 = 0.0;
  double v166 = 0.0;
  [v100 getRed:&v168 green:&v167 blue:&v166 alpha:&v165];

  double v101 = +[UIColor colorWithRed:(1.0 - v99) * v172 + v99 * v168 green:(1.0 - v99) * v171 + v99 * v167 blue:(1.0 - v99) * v170 + v99 * v166 alpha:(1.0 - v99) * v169 + v99 * v165];

  id v102 = v101;
  uint64_t v103 = [v102 CGColor];
  double v104 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  double v105 = [v104 layer];
  [v105 setBorderColor:v103];

  double v106 = [(UIKeyboardFloatingTransitionController *)self startState];
  [v106 borderWidth];
  v107 = [(UIKeyboardFloatingTransitionController *)self endState];
  [v107 borderWidth];
  [(UIKeyboardFloatingTransitionController *)self progress];
  v108 = [(UIKeyboardFloatingTransitionController *)self platterVisualEffectView];
  double v109 = v108;
  if (!v108)
  {
    double v109 = [(UIKeyboardFloatingTransitionController *)self lightEffectsTransitionBackdrop];
  }
  UIRoundToViewScale(v109);
  double v111 = v110;
  double v112 = [(UIKeyboardFloatingTransitionController *)self platterCornerRadiusView];
  double v113 = [v112 layer];
  [v113 setBorderWidth:v111];

  if (!v108) {
  CGFloat v114 = [(UIKeyboardFloatingTransitionController *)self startState];
  }
  double v115 = v114;
  if (v114)
  {
    [v114 initialInputViewTransform];
  }
  else
  {
    float64x2_t v163 = 0u;
    float64x2_t v164 = 0u;
    float64x2_t v162 = 0u;
  }
  CGFloat v116 = [(UIKeyboardFloatingTransitionController *)self startState];
  double v117 = v116;
  if (v116)
  {
    [v116 finalInputViewTransform];
  }
  else
  {
    float64x2_t v160 = 0u;
    float64x2_t v161 = 0u;
    float64x2_t v159 = 0u;
  }
  [(UIKeyboardFloatingTransitionController *)self progress];
  float64x2_t v144 = vaddq_f64(vmulq_n_f64(v163, 1.0 - v118), vmulq_n_f64(v160, v118));
  float64x2_t v146 = vaddq_f64(vmulq_n_f64(v162, 1.0 - v118), vmulq_n_f64(v159, v118));
  float64x2_t v142 = vaddq_f64(vmulq_n_f64(v164, 1.0 - v118), vmulq_n_f64(v161, v118));
  double v119 = [(UIKeyboardFloatingTransitionController *)self startState];
  double v120 = [v119 inputView];
  v158[0] = v146;
  v158[1] = v144;
  v158[2] = v142;
  [v120 setTransform:v158];

  double v121 = [(UIKeyboardFloatingTransitionController *)self endState];
  CGFloat v122 = v121;
  if (v121)
  {
    [v121 initialInputViewTransform];
  }
  else
  {
    float64x2_t v156 = 0u;
    float64x2_t v157 = 0u;
    float64x2_t v155 = 0u;
  }
  double v123 = [(UIKeyboardFloatingTransitionController *)self endState];
  double v124 = v123;
  if (v123)
  {
    [v123 finalInputViewTransform];
  }
  else
  {
    float64x2_t v153 = 0u;
    float64x2_t v154 = 0u;
    float64x2_t v152 = 0u;
  }
  [(UIKeyboardFloatingTransitionController *)self progress];
  float64x2_t v145 = vaddq_f64(vmulq_n_f64(v156, 1.0 - v125), vmulq_n_f64(v153, v125));
  float64x2_t v147 = vaddq_f64(vmulq_n_f64(v155, 1.0 - v125), vmulq_n_f64(v152, v125));
  float64x2_t v143 = vaddq_f64(vmulq_n_f64(v157, 1.0 - v125), vmulq_n_f64(v154, v125));
  v126 = [(UIKeyboardFloatingTransitionController *)self endState];
  uint64_t v127 = [v126 inputView];
  v151[0] = v147;
  v151[1] = v145;
  v151[2] = v143;
  [v127 setTransform:v151];

  uint64_t v128 = [(UIKeyboardFloatingTransitionController *)self startState];
  if (!v128) {
    goto LABEL_63;
  }
  double v129 = (void *)v128;
  v130 = [(UIKeyboardFloatingTransitionController *)self endState];

  if (!v130) {
    goto LABEL_63;
  }
  v131 = [(UIKeyboardFloatingTransitionController *)self pinchGestureRecognizer];
  if ([v131 state] != 1)
  {
    double v132 = [(UIKeyboardFloatingTransitionController *)self pinchGestureRecognizer];
    if ([v132 state] != 2)
    {
      double v133 = [(UIKeyboardFloatingTransitionController *)self panGestureRecognizer];
      if ([v133 state] != 1)
      {
        CATransform3D v138 = [(UIKeyboardFloatingTransitionController *)self panGestureRecognizer];
        uint64_t v139 = [v138 state];

        if (v139 != 2)
        {
          [(UIKeyboardFloatingTransitionController *)self progress];
          if (v140 >= 0.2)
          {
            [(UIKeyboardFloatingTransitionController *)self progress];
            if (v141 <= 0.8) {
              goto LABEL_63;
            }
            v148[0] = MEMORY[0x1E4F143A8];
            v148[1] = 3221225472;
            v148[2] = __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke_3;
            v148[3] = &unk_1E52D9F70;
            v148[4] = self;
            double v135 = 0.25;
            char v136 = v148;
          }
          else
          {
            v149[0] = MEMORY[0x1E4F143A8];
            v149[1] = 3221225472;
            v149[2] = __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke_2;
            v149[3] = &unk_1E52D9F70;
            v149[4] = self;
            double v135 = 0.25;
            char v136 = v149;
          }
          goto LABEL_62;
        }
        goto LABEL_60;
      }
    }
  }

LABEL_60:
  [(UIKeyboardFloatingTransitionController *)self progress];
  if (v134 > 0.1)
  {
    v150[0] = MEMORY[0x1E4F143A8];
    v150[1] = 3221225472;
    v150[2] = __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke;
    v150[3] = &unk_1E52D9F70;
    v150[4] = self;
    double v135 = 0.25;
    char v136 = v150;
LABEL_62:
    +[UIView animateWithDuration:v136 animations:v135];
  }
LABEL_63:
  v137 = [(UIKeyboardFloatingTransitionController *)self platterView];
  [v137 frame];
  [(UIKeyboardFloatingTransitionController *)self updateLayoutGuideFromFrame:"updateLayoutGuideFromFrame:"];
}

void __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startState];
  uint64_t v3 = [v2 inputView];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) pillView];
  [v4 setAlpha:0.0];
}

void __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startState];
  uint64_t v3 = [v2 inputView];
  double v4 = 1.0;
  [v3 setAlpha:1.0];

  if (![*(id *)(a1 + 32) startedFromFloating]) {
    double v4 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) pillView];
  [v5 setAlpha:v4];
}

void __65__UIKeyboardFloatingTransitionController_updateAnimationAtScale___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) endState];
  uint64_t v3 = [v2 inputView];
  double v4 = 1.0;
  [v3 setAlpha:1.0];

  if ([*(id *)(a1 + 32) startedFromFloating]) {
    double v4 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) pillView];
  [v5 setAlpha:v4];
}

- (void)updateLayoutGuideForTransitionStart:(BOOL)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__UIKeyboardFloatingTransitionController_updateLayoutGuideForTransitionStart___block_invoke;
  v6[3] = &unk_1E52FD420;
  BOOL v7 = a3;
  v6[4] = self;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v6];
  if (!a3)
  {
    id v5 = [(UIKeyboardFloatingTransitionController *)self activeKeyboardLayoutGuideTransitionAssertions];
    [v5 removeAllObjects];
  }
}

void __78__UIKeyboardFloatingTransitionController_updateLayoutGuideForTransitionStart___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 isTrackingKeyboard])
  {
    BOOL v3 = +[UIKeyboardImpl isFloating];
    double v4 = off_1E52D3B50;
    if (*(unsigned char *)(a1 + 40)) {
      int v5 = 1;
    }
    else {
      int v5 = v3;
    }
    if (!v5) {
      double v4 = off_1E52D3B80;
    }
    double v6 = [(__objc2_class *)*v4 placement];
    [v8 updateGuideForKeyboardPlacement:v6];

    [*(id *)(a1 + 32) setKeyboardLayoutGuideInTransition:*(unsigned __int8 *)(a1 + 40) forWindow:v8];
    BOOL v7 = [v8 _primaryKeyboardTrackingGuide];
    [v7 enableAnimations:*(unsigned char *)(a1 + 40) == 0];
  }
}

- (void)updateLayoutGuideFromFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(*MEMORY[0x1E4F1DB28], a3))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__UIKeyboardFloatingTransitionController_updateLayoutGuideFromFrame___block_invoke;
    v8[3] = &unk_1E53058F0;
    *(CGFloat *)&v8[5] = x;
    *(CGFloat *)&v8[6] = y;
    *(CGFloat *)&v8[7] = width;
    *(CGFloat *)&v8[8] = height;
    v8[4] = self;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v8];
  }
}

void __69__UIKeyboardFloatingTransitionController_updateLayoutGuideFromFrame___block_invoke(uint64_t a1, void *a2)
{
  id v30 = a2;
  if ([v30 isTrackingKeyboard])
  {
    [v30 frame];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v11 = [*(id *)(a1 + 32) inputWindowController];
    double v12 = [v11 _window];
    objc_msgSend(v30, "convertRect:fromWindow:", v12, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v32.origin.CGFloat x = v4;
    v32.origin.CGFloat y = v6;
    v32.size.double width = v8;
    v32.size.double height = v10;
    v38.origin.CGFloat x = v14;
    v38.origin.CGFloat y = v16;
    v38.size.double width = v18;
    v38.size.double height = v20;
    CGRect v33 = CGRectIntersection(v32, v38);
    CGFloat x = v33.origin.x;
    CGFloat y = v33.origin.y;
    double width = v33.size.width;
    double height = v33.size.height;
    if (CGRectIsNull(v33))
    {
      v34.origin.CGFloat x = v4;
      v34.origin.CGFloat y = v6;
      v34.size.double width = v8;
      v34.size.double height = v10;
      CGFloat y = CGRectGetMaxY(v34);
      [v30 insetForDismissedKeyboardGuide];
      double height = v25;
      CGFloat x = 0.0;
      double width = v8;
    }
    v35.origin.CGFloat x = v4;
    v35.origin.CGFloat y = v6;
    v35.size.double width = v8;
    v35.size.double height = v10;
    double MaxY = CGRectGetMaxY(v35);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.double width = width;
    v36.size.double height = height;
    double v27 = MaxY - CGRectGetMaxY(v36);
    double v28 = [v30 _primaryKeyboardTrackingGuide];
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.double width = width;
    v37.size.double height = height;
    objc_msgSend(v28, "changeOffsetConstants:", CGRectGetMinX(v37), v27);

    double v29 = [v30 _primaryKeyboardTrackingGuide];
    objc_msgSend(v29, "changeSizingConstants:", width, height);
  }
}

- (NSMapTable)activeKeyboardLayoutGuideTransitionAssertions
{
  activeKeyboardLayoutGuideTransitionAssertions = self->_activeKeyboardLayoutGuideTransitionAssertions;
  if (!activeKeyboardLayoutGuideTransitionAssertions)
  {
    CGFloat v4 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    double v5 = self->_activeKeyboardLayoutGuideTransitionAssertions;
    self->_activeKeyboardLayoutGuideTransitionAssertions = v4;

    activeKeyboardLayoutGuideTransitionAssertions = self->_activeKeyboardLayoutGuideTransitionAssertions;
  }
  return activeKeyboardLayoutGuideTransitionAssertions;
}

- (void)setKeyboardLayoutGuideInTransition:(BOOL)a3 forWindow:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  CGFloat v6 = [(UIKeyboardFloatingTransitionController *)self activeKeyboardLayoutGuideTransitionAssertions];
  double v7 = [v6 objectForKey:v10];

  if (v4)
  {
    if (v7) {
      goto LABEL_8;
    }
    CGFloat v8 = [v10 _obtainKeyboardLayoutGuideTransitionAssertionForReason:@"Floating keyboard transition"];
    if (v8)
    {
      double v9 = [(UIKeyboardFloatingTransitionController *)self activeKeyboardLayoutGuideTransitionAssertions];
      [v9 setObject:v8 forKey:v10];
    }
  }
  else
  {
    if (!v7) {
      goto LABEL_8;
    }
    [v7 _invalidate];
    CGFloat v8 = [(UIKeyboardFloatingTransitionController *)self activeKeyboardLayoutGuideTransitionAssertions];
    [v8 removeObjectForKey:v10];
  }

LABEL_8:
}

- (void)inputViewSnapshot:(id *)a3 withPlatterInsets:(UIEdgeInsets *)a4
{
  double v7 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  CGFloat v8 = [v7 inputViewSet];
  uint64_t v9 = [v8 keyboard];
  if (!v9) {
    goto LABEL_4;
  }
  id v10 = (void *)v9;
  double v11 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  double v12 = [v11 inputViewSet];
  if ([v12 isCustomInputView])
  {

LABEL_4:
LABEL_5:
    double v13 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
    CGFloat v14 = [v13 inputViewSet];
    double v15 = [v14 inputView];

    *a3 = [v15 snapshotViewAfterScreenUpdates:0];
    goto LABEL_6;
  }
  double v55 = +[UIKeyboardImpl activeInstance];
  char v56 = [v55 isUsingDictationLayout];

  if (v56) {
    goto LABEL_5;
  }
  double v57 = +[UIKeyboardImpl activeInstance];
  double v15 = [v57 keyplaneView];

  double v58 = [v15 keyplane];
  uint64_t v59 = [v58 visualStyling] & 0xFF0000;

  if (v59 != 2490368)
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __78__UIKeyboardFloatingTransitionController_inputViewSnapshot_withPlatterInsets___block_invoke;
    v66[3] = &unk_1E52D9F70;
    id v67 = v15;
    +[UIView performWithoutAnimation:v66];
  }
  *a3 = +[UIKeyboardFloatingTransitionController snapshotOfKeyplaneView:v15];
  if (!v15)
  {
    double v60 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
    double v61 = [v60 inputViewSet];
    double v15 = [v61 inputView];
  }
LABEL_6:
  CGFloat v16 = [v15 window];
  double v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    double v19 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
    id v18 = [v19 _window];
  }
  [v15 bounds];
  objc_msgSend(v18, "convertRect:fromView:", v15);
  objc_msgSend(*a3, "setFrame:");
  [*a3 setUserInteractionEnabled:0];
  id v20 = *a3;
  BOOL v21 = [v18 screen];
  [v21 scale];
  objc_msgSend(v20, "setContentScaleFactor:");

  double v22 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
  double v23 = [v22 hosting];
  double v24 = [v23 itemForPurpose:0];
  double v25 = [v24 hostView];

  [v25 frame];
  CGFloat v27 = v26;
  CGFloat rect = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  [v15 bounds];
  objc_msgSend(v25, "convertRect:fromView:", v15);
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  v68.origin.CGFloat x = v27;
  v68.origin.CGFloat y = v29;
  v68.size.double width = v31;
  v68.size.double height = v33;
  double Height = CGRectGetHeight(v68);
  v69.origin.CGFloat x = v35;
  v69.origin.CGFloat y = v37;
  v69.size.double width = v39;
  v69.size.double height = v41;
  double rect_24 = Height - CGRectGetMaxY(v69);
  v70.origin.CGFloat x = v35;
  v70.origin.CGFloat y = v37;
  v70.size.double width = v39;
  v70.size.double height = v41;
  double rect_8 = CGRectGetMinY(v70);
  v71.origin.CGFloat x = v35;
  v71.origin.CGFloat y = v37;
  v71.size.double width = v39;
  v71.size.double height = v41;
  double rect_16 = CGRectGetMinX(v71);
  v72.origin.CGFloat x = rect;
  v72.origin.CGFloat y = v29;
  v72.size.double width = v31;
  v72.size.double height = v33;
  double Width = CGRectGetWidth(v72);
  v73.origin.CGFloat x = v35;
  v73.origin.CGFloat y = v37;
  v73.size.double width = v39;
  v73.size.double height = v41;
  double v44 = Width - CGRectGetMaxX(v73);
  if (+[UIKeyboardImpl isFloating])
  {
    +[UIKeyboardPopoverContainer contentInsets];
    double v46 = rect_8 + v45;
    double v48 = rect_16 + v47;
    double v50 = rect_24 + v49;
    double v44 = v44 + v51;
  }
  else
  {
    BOOL v52 = [(UIKeyboardFloatingTransitionController *)self inputWindowController];
    double v53 = [v52 inputViewSet];
    double v54 = [v53 inputAccessoryView];

    [v54 frame];
    double v46 = rect_8 - CGRectGetHeight(v74);

    double v48 = rect_16;
    double v50 = rect_24;
  }
  a4->top = v46;
  a4->left = v48;
  a4->bottom = v50;
  a4->right = v44;
}

void __78__UIKeyboardFloatingTransitionController_inputViewSnapshot_withPlatterInsets___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) hideKeyCaps:1];
  id v2 = *(void **)(a1 + 32);
  BOOL v4 = &unk_1ED3F6708;
  v5[0] = &unk_1ED3F2428;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 dimKeys:v3];
}

- (void)captureStateForStart:(BOOL)a3
{
  long long v51 = 0u;
  long long v52 = 0u;
  id v50 = 0;
  [(UIKeyboardFloatingTransitionController *)self inputViewSnapshot:&v50 withPlatterInsets:&v51];
  id v5 = v50;
  CGFloat v6 = +[UIColor clearColor];
  if (+[UIKeyboardImpl isFloating])
  {
    +[UIKeyboardPopoverContainer cornerRadius];
    double v48 = v7;
    +[UIKeyboardPopoverContainer borderWidth];
    double v49 = v8;
    uint64_t v9 = +[UIKeyboardPopoverContainer borderColor];

    CGFloat v6 = (void *)v9;
  }
  else
  {
    double v48 = 0.0;
    double v49 = 0.0;
  }
  [v5 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v5 frame];
  double v21 = v20 - (-*((double *)&v52 + 1) - *((double *)&v51 + 1));
  double v23 = v22 - (-*(double *)&v52 - *(double *)&v51);
  if (a3)
  {
    double v24 = v18 - *((double *)&v51 + 1);
    double v25 = v19 - *(double *)&v51;
    [(UIKeyboardFloatingTransitionController *)self startState];
  }
  else
  {
    double v26 = [(UIKeyboardFloatingTransitionController *)self startState];
    [v26 platterViewFrame];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;

    double v35 = v21 - v32;
    double v36 = v23 - v34;
    CGFloat v37 = [(UIKeyboardFloatingTransitionController *)self platterView];
    double v38 = [v37 layer];
    [v38 anchorPoint];
    double v40 = v39;
    double v42 = v41;

    double v43 = v36 * v42;
    double v44 = v35 * v40;
    double v45 = -(v36 * (1.0 - v42));
    double v46 = -(v35 * (1.0 - v40));
    double v24 = v28 - v35 * v40;
    double v25 = v30 - v36 * v42;
    double v21 = v32 - (v46 - v44);
    double v23 = v34 - (v45 - v43);
    double v11 = v24 + *((double *)&v51 + 1);
    double v13 = v25 + *(double *)&v51;
    double v15 = v21 - (*((double *)&v51 + 1) + *((double *)&v52 + 1));
    double v17 = v23 - (*(double *)&v51 + *(double *)&v52);
    objc_msgSend(v5, "setFrame:", v24 + *((double *)&v51 + 1), v25 + *(double *)&v51, v15, v17);
    [(UIKeyboardFloatingTransitionController *)self endState];
  double v47 = };
  [v47 setInputView:v5];
  objc_msgSend(v47, "setInputViewFrame:", v11, v13, v15, v17);
  objc_msgSend(v47, "setPlatterViewFrame:", v24, v25, v21, v23);
  objc_msgSend(v47, "setPlatterInsets:", v51, v52);
  [v47 setCornerRadius:v48];
  [v47 setBorderWidth:v49];
  [v47 setBorderColor:v6];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if (+[UIKeyboardImpl isSplit]) {
    goto LABEL_10;
  }
  if (+[UIKeyboardImpl isFloating]
    && !+[UIKeyboardImpl isFloatingForced])
  {
    [v4 scale];
    BOOL v5 = v7 >= 1.0;
  }
  else if (+[UIKeyboardImpl isFloating])
  {
    BOOL v5 = 0;
  }
  else
  {
    [v4 scale];
    BOOL v5 = v6 < 1.0;
  }
  double v8 = +[UIKeyboardImpl activeInstance];
  int v9 = [v8 usesCandidateSelection];

  if (!v9)
  {
    if (!v5) {
      goto LABEL_10;
    }
LABEL_12:
    double v14 = [(UIKeyboardFloatingTransitionController *)self delegate];
    char v13 = [v14 shouldBeginTransitionForController:self];

    goto LABEL_13;
  }
  double v10 = +[UIKeyboardImpl activeInstance];
  double v11 = [v10 candidateList];
  char v12 = v5 & ([v11 isExtendedList] ^ 1);

  if (v12) {
    goto LABEL_12;
  }
LABEL_10:
  char v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (UIKeyboardFloatingTransitionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardFloatingTransitionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIKeyboardFloatingPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (UIInputWindowController)inputWindowController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputWindowController);
  return (UIInputWindowController *)WeakRetained;
}

- (void)setInputWindowController:(id)a3
{
}

- (UIKeyboardFloatingTransitionState)startState
{
  return self->_startState;
}

- (void)setStartState:(id)a3
{
}

- (UIKeyboardFloatingTransitionState)endState
{
  return self->_endState;
}

- (void)setEndState:(id)a3
{
}

- (BOOL)startedFromFloating
{
  return self->_startedFromFloating;
}

- (void)setStartedFromFloating:(BOOL)a3
{
  self->_startedFromFloating = a3;
}

- (NSArray)commonVisibleKeys
{
  return self->_commonVisibleKeys;
}

- (void)setCommonVisibleKeys:(id)a3
{
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIView)platterCornerRadiusView
{
  return self->_platterCornerRadiusView;
}

- (void)setPlatterCornerRadiusView:(id)a3
{
}

- (_UIPopoverStandardChromeView)platterPopoverBackgroundView
{
  return self->_platterPopoverBackgroundView;
}

- (void)setPlatterPopoverBackgroundView:(id)a3
{
}

- (UIKBVisualEffectView)platterVisualEffectView
{
  return self->_platterVisualEffectView;
}

- (void)setPlatterVisualEffectView:(id)a3
{
}

- (_UIKBLightEffectsBackground)lightEffectsTransitionBackdrop
{
  return self->_lightEffectsTransitionBackdrop;
}

- (void)setLightEffectsTransitionBackdrop:(id)a3
{
}

- (UIView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)gestureBeginTime
{
  return self->_gestureBeginTime;
}

- (void)setGestureBeginTime:(double)a3
{
  self->_gestureBeginTime = a3;
}

- (CGPoint)lastGestureCenter
{
  double x = self->_lastGestureCenter.x;
  double y = self->_lastGestureCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastGestureCenter:(CGPoint)a3
{
  self->_lastGestureCenter = a3;
}

- (BOOL)withinDockingRegion
{
  return self->_withinDockingRegion;
}

- (void)setWithinDockingRegion:(BOOL)a3
{
  self->_withinDockingRegion = a3;
}

- (BOOL)expandedForDocking
{
  return self->_expandedForDocking;
}

- (void)setExpandedForDocking:(BOOL)a3
{
  self->_expandedForDocking = a3;
}

- (UIViewSpringAnimationBehavior)animationBehavior
{
  return (UIViewSpringAnimationBehavior *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAnimationBehavior:(id)a3
{
}

- (void)setActiveKeyboardLayoutGuideTransitionAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeKeyboardLayoutGuideTransitionAssertions, 0);
  objc_storeStrong((id *)&self->_animationBehavior, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_lightEffectsTransitionBackdrop, 0);
  objc_storeStrong((id *)&self->_platterVisualEffectView, 0);
  objc_storeStrong((id *)&self->_platterPopoverBackgroundView, 0);
  objc_storeStrong((id *)&self->_platterCornerRadiusView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_commonVisibleKeys, 0);
  objc_storeStrong((id *)&self->_endState, 0);
  objc_storeStrong((id *)&self->_startState, 0);
  objc_destroyWeak((id *)&self->_inputWindowController);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end