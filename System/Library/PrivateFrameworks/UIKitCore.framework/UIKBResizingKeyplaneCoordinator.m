@interface UIKBResizingKeyplaneCoordinator
+ (double)savedResizingOffset;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isResizing;
- (BOOL)shouldStartResizeForTranslationY:(double)a3;
- (UIKBResizingKeyplaneCoordinator)init;
- (UIKBResizingKeyplaneCoordinatorCoordinatorDelegate)delegate;
- (UIKBResizingKeyplanePanGestureRecognizer)gestureRecognizer;
- (double)resizingOffset;
- (void)dimKeys:(id)a3;
- (void)handleResizeGesture:(id)a3;
- (void)reloadResizingOffset;
- (void)resizeKeyplaneWithOffset:(double)a3 andRedraw:(BOOL)a4;
- (void)saveResizingStopIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setRenderConfig:(id)a3;
- (void)stopResizing;
- (void)uninstallGestureRecognizers;
- (void)updateGestureRecognizers;
- (void)updateGrabber;
@end

@implementation UIKBResizingKeyplaneCoordinator

- (UIKBResizingKeyplaneCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIKBResizingKeyplaneCoordinator;
  result = [(UIKBResizingKeyplaneCoordinator *)&v3 init];
  if (result) {
    result->_foregroundOpacity = 1.0;
  }
  return result;
}

- (void)updateGrabber
{
  objc_super v3 = +[UIScreen mainScreen];
  [v3 scale];
  double v5 = v4;

  v6 = [(UIKBResizingKeyplaneCoordinator *)self delegate];
  int v7 = [v6 keyplaneSupportsResizingGesture];

  grabber = self->_grabber;
  if (!grabber && v7)
  {
    v9 = objc_alloc_init(_UIGrabber);
    v10 = self->_grabber;
    self->_grabber = &v9->super.super;

    [(UIView *)self->_grabber sizeToFit];
    [(UIView *)self->_grabber setUserInteractionEnabled:0];
    v11 = +[UIScreen mainScreen];
    [v11 scale];
    double v13 = v12;
    v14 = [(UIView *)self->_grabber layer];
    [v14 setRasterizationScale:v13];

    v15 = [(UIView *)self->_grabber layer];
    [v15 setShouldRasterize:1];

    grabber = self->_grabber;
  }
  [(UIView *)grabber setBackgroundColor:self->_grabberColor];
  if (v7)
  {
    [(UIView *)self->_grabber setAlpha:self->_foregroundOpacity];
    v16 = [(UIKBResizingKeyplaneCoordinator *)self delegate];
    id v22 = [v16 hostViewForResizingKeyplane:self];

    [(UIView *)self->_grabber center];
    [v22 size];
    double v18 = v17 * 0.5;
    if (v5 <= 1.0) {
      double v19 = 6.0;
    }
    else {
      double v19 = 1.0 / v5 + 5.0;
    }
    [(UIView *)self->_grabber frame];
    -[UIView setCenter:](self->_grabber, "setCenter:", v18, v19 + v20 * 0.5);
    [v22 addSubview:self->_grabber];
  }
  else
  {
    v21 = self->_grabber;
    [(UIView *)v21 removeFromSuperview];
  }
}

- (void)reloadResizingOffset
{
  [(id)objc_opt_class() savedResizingOffset];
  self->_prevResizingOffset = v3;
  self->_resizingOffset = v3;
}

- (void)saveResizingStopIndex:(unint64_t)a3
{
  _resizingStopIndex = a3;
}

+ (double)savedResizingOffset
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v4;
  }
  else {
    double v7 = v6;
  }
  return kSnapStops[_resizingStopIndex != 0] * v7;
}

- (BOOL)isResizing
{
  return self->_isResizing;
}

- (void)setRenderConfig:(id)a3
{
  int v4 = [a3 lightKeyboard];
  double v5 = 1.0;
  if (v4) {
    double v5 = 0.0;
  }
  double v6 = +[UIColor colorWithWhite:v5 alpha:0.25];
  grabberColor = self->_grabberColor;
  self->_grabberColor = v6;

  [(UIKBResizingKeyplaneCoordinator *)self updateGrabber];
}

- (void)dimKeys:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v4 objectForKeyedSubscript:v10];
        if (([v10 integerValue] & 4) != 0)
        {
          [v11 doubleValue];
          self->_foregroundOpacity = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(UIKBResizingKeyplaneCoordinator *)self updateGrabber];
}

- (void)updateGestureRecognizers
{
  double v3 = [(UIKBResizingKeyplaneCoordinator *)self delegate];
  int v4 = [v3 keyplaneSupportsResizingGesture];

  gestureRecognizer = self->_gestureRecognizer;
  if (v4)
  {
    if (!gestureRecognizer)
    {
      uint64_t v6 = objc_alloc_init(UIKBResizingKeyplanePanGestureRecognizer);
      uint64_t v7 = self->_gestureRecognizer;
      self->_gestureRecognizer = v6;

      [(UIPanGestureRecognizer *)self->_gestureRecognizer setMaximumNumberOfTouches:1];
      [(UIPanGestureRecognizer *)self->_gestureRecognizer _setCanPanHorizontally:0];
      [(UIKBResizingKeyplanePanGestureRecognizer *)self->_gestureRecognizer setResizingDelegate:self];
      [(UIGestureRecognizer *)self->_gestureRecognizer addTarget:self action:sel_handleResizeGesture_];
    }
    uint64_t v8 = [(UIKBResizingKeyplaneCoordinator *)self delegate];
    id v11 = [v8 hostViewForResizingKeyplane:self];

    [v11 addGestureRecognizer:self->_gestureRecognizer];
    [(UIPanGestureRecognizer *)self->_gestureRecognizer setDelegate:self];
  }
  else
  {
    v9 = [(UIGestureRecognizer *)gestureRecognizer view];
    [v9 removeGestureRecognizer:self->_gestureRecognizer];

    v10 = self->_gestureRecognizer;
    [(UIPanGestureRecognizer *)v10 setDelegate:0];
  }
}

- (void)uninstallGestureRecognizers
{
  gestureRecognizer = self->_gestureRecognizer;
  if (gestureRecognizer)
  {
    int v4 = [(UIGestureRecognizer *)gestureRecognizer view];
    [v4 removeGestureRecognizer:self->_gestureRecognizer];

    double v5 = self->_gestureRecognizer;
    self->_gestureRecognizer = 0;
  }
}

- (void)stopResizing
{
  if (self->_isResizing)
  {
    resizingAnimationGroup = self->_resizingAnimationGroup;
    if (resizingAnimationGroup) {
      [(_UIDynamicAnimation *)resizingAnimationGroup stop];
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  int v4 = (UIKBResizingKeyplanePanGestureRecognizer *)a3;
  if (self->_gestureRecognizer == v4)
  {
    uint64_t v6 = [(UIKBResizingKeyplaneCoordinator *)self delegate];
    uint64_t v7 = [v6 hostViewForResizingKeyplane:self];

    [v7 frame];
    if (v8 >= 1.0)
    {
      double v9 = v8;
      [(UIPanGestureRecognizer *)v4 locationInView:v7];
      BOOL v5 = (v10 - v9 * 0.5) / (v9 * 0.5) * ((v10 - v9 * 0.5) / (v9 * 0.5)) + (v11 + 47.0) / 94.0 * ((v11 + 47.0) / 94.0) <= 1.0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)handleResizeGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  if (v7 >= v9) {
    double v10 = v7;
  }
  else {
    double v10 = v9;
  }
  double v11 = [(UIKBResizingKeyplaneCoordinator *)self delegate];
  double v12 = [v11 hostViewForResizingKeyplane:self];

  if (v12)
  {
    double v13 = v10 * 0.0;
    double v14 = v10 * 0.242610837 - v10 * 0.0;
    long long v15 = [v12 window];
    [v4 translationInView:v15];
    double v17 = v16;

    uint64_t v18 = [v12 window];
    [v4 velocityInView:v18];
    double v20 = v19;

    double v21 = self->_prevResizingOffset - v17;
    if (v21 <= v10 * 0.242610837)
    {
      if (v21 < v13) {
        double v21 = v13 - v14 * (1.0 - 1.0 / ((v13 - v21) / v14 * 0.55 + 1.0));
      }
    }
    else
    {
      double v21 = v10 * 0.242610837 + v14 * (1.0 - 1.0 / ((v21 - v10 * 0.242610837) / v14 * 0.55 + 1.0));
    }
    if ([v4 state] == 1)
    {
      resizingAnimationGroup = self->_resizingAnimationGroup;
      if (resizingAnimationGroup) {
        [(_UIDynamicAnimation *)resizingAnimationGroup stop];
      }
      self->_isResizing = 1;
    }
    else
    {
      double v23 = round(v21);
      if ([v4 state] == 2)
      {
        [(UIKBResizingKeyplaneCoordinator *)self resizeKeyplaneWithOffset:0 andRedraw:v23];
      }
      else if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4)
      {
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        double v26 = -v20;
        double v27 = v23 + v20 * -0.25;
        double v28 = 0.0;
        char v29 = 1;
        double v30 = 1.79769313e308;
        do
        {
          char v31 = v29;
          double v32 = v10 * kSnapStops[v24];
          double v33 = v32 - v27;
          if (v32 - v27 < 0.0) {
            double v33 = -(v32 - v27);
          }
          if (v33 < v30)
          {
            double v28 = v10 * kSnapStops[v24];
            double v30 = v33;
            uint64_t v25 = v24;
          }
          uint64_t v24 = 1;
          char v29 = 0;
        }
        while ((v31 & 1) != 0);
        [(UIKBResizingKeyplaneCoordinator *)self saveResizingStopIndex:v25];
        v34 = [[_UIDynamicValueAnimation alloc] initWithValue:v23 velocity:v26 unitSize:1.0];
        [(_UIDynamicValueAnimation *)v34 setFriction:0.5];
        v35 = +[_UIDynamicAnimationActiveValue upperBoundary:1 ofType:v28];
        v36 = +[_UIDynamicAnimationActiveValue lowerBoundary:1 ofType:v28];
        [(_UIDynamicValueAnimation *)v34 addActiveValue:v35];
        [(_UIDynamicValueAnimation *)v34 addActiveValue:v36];
        v37 = objc_alloc_init(_UIDynamicAnimationGroup);
        v38 = self->_resizingAnimationGroup;
        self->_resizingAnimationGroup = v37;

        [(_UIDynamicAnimationGroup *)self->_resizingAnimationGroup addAnimation:v34];
        v39 = self->_resizingAnimationGroup;
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __55__UIKBResizingKeyplaneCoordinator_handleResizeGesture___block_invoke;
        v41[3] = &unk_1E530B4F8;
        v41[4] = self;
        *(double *)&v41[5] = v28;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __55__UIKBResizingKeyplaneCoordinator_handleResizeGesture___block_invoke_2;
        v40[3] = &unk_1E52E0000;
        v40[4] = self;
        *(double *)&v40[5] = v28;
        [(_UIDynamicAnimationGroup *)v39 runWithGroupApplier:v41 completion:v40];
      }
    }
  }
}

uint64_t __55__UIKBResizingKeyplaneCoordinator_handleResizeGesture___block_invoke(uint64_t result, unsigned int a2)
{
  if (a2 <= 4)
  {
    uint64_t v2 = result;
    if (((1 << a2) & 0x19) != 0)
    {
      *(unsigned char *)(*(void *)(result + 32) + 56) = 0;
      result = [*(id *)(result + 32) resizeKeyplaneWithOffset:1 andRedraw:*(double *)(result + 40)];
      double v3 = *(double *)(v2 + 40);
      double v4 = *(double *)(*(void *)(v2 + 32) + 8);
      if (v3 != v4)
      {
        if (v3 <= v4) {
          BOOL v5 = UIKBAnalyticsCandidateUIDirectionClose;
        }
        else {
          BOOL v5 = UIKBAnalyticsCandidateUIDirectionOpen;
        }
        double v6 = *v5;
        return +[UIKBAnalyticsDispatcher handwritingResized:v6];
      }
    }
    else
    {
      double v7 = [*(id *)(*(void *)(result + 32) + 32) animations];
      double v8 = [v7 firstObject];
      [v8 value];
      double v10 = v9;

      double v11 = *(void **)(v2 + 32);
      return [v11 resizeKeyplaneWithOffset:0 andRedraw:v10];
    }
  }
  return result;
}

void __55__UIKBResizingKeyplaneCoordinator_handleResizeGesture___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
}

- (void)resizeKeyplaneWithOffset:(double)a3 andRedraw:(BOOL)a4
{
  double v4 = round(a3);
  if (v4 != self->_resizingOffset)
  {
    BOOL v5 = a4;
    self->_resizingOffset = v4;
    id v6 = [(UIKBResizingKeyplaneCoordinator *)self delegate];
    [v6 resizeKeyplaneAndRedraw:v5];
  }
}

- (BOOL)shouldStartResizeForTranslationY:(double)a3
{
  return self->_resizingOffset > 0.0 || a3 < 0.0;
}

- (UIKBResizingKeyplaneCoordinatorCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKBResizingKeyplaneCoordinatorCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)resizingOffset
{
  return self->_resizingOffset;
}

- (UIKBResizingKeyplanePanGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_grabberColor, 0);
  objc_storeStrong((id *)&self->_grabber, 0);
  objc_storeStrong((id *)&self->_resizingAnimationGroup, 0);
}

@end