@interface UIKeyboardKeyplaneTransition
- (BOOL)canDisplayTransitionFromKeyplane:(id)a3 toKeyplane:(id)a4;
- (BOOL)initiallyAtEnd;
- (UIKBKeyViewAnimator)keyViewAnimator;
- (UIKBTree)keyboard;
- (UIKeyboardKeyplaneTransitionDelegate)transitionDelegate;
- (double)endHeight;
- (double)nonInteractiveDuration;
- (double)startHeight;
- (id)completionBlock;
- (void)addTransitionView:(id)a3 startFrame:(CGRect)a4 endFrame:(CGRect)a5;
- (void)cancelNonInteractiveAnimation;
- (void)dealloc;
- (void)finalizeTransition;
- (void)finishWithProgress:(double)a3 completionBlock:(id)a4;
- (void)rebuildWithStartKeyplane:(id)a3 startView:(id)a4 endKeyplane:(id)a5 endView:(id)a6;
- (void)removeAllAnimations;
- (void)runNonInteractivelyWithCompletion:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setInitiallyAtEnd:(BOOL)a3;
- (void)setKeyViewAnimator:(id)a3;
- (void)setKeyboard:(id)a3;
- (void)setTransitionDelegate:(id)a3;
- (void)transitionToFinalState:(id)a3;
- (void)updateWithProgress:(double)a3;
@end

@implementation UIKeyboardKeyplaneTransition

- (void)dealloc
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    v4 = self->_displayLink;
    self->_displayLink = 0;
  }
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardKeyplaneTransition;
  [(UIKeyboardKeyplaneTransition *)&v6 dealloc];
}

- (double)startHeight
{
  [(UIView *)self->_startView bounds];
  return v2;
}

- (double)endHeight
{
  [(UIView *)self->_endView bounds];
  return v2;
}

- (void)rebuildWithStartKeyplane:(id)a3 startView:(id)a4 endKeyplane:(id)a5 endView:(id)a6
{
  id v14 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(UIKeyboardKeyplaneTransition *)self removeAllAnimations];
  [(NSMutableArray *)self->_transitionViews removeAllObjects];
  if (v11) {
    objc_storeStrong((id *)&self->_startView, a4);
  }
  if (v13) {
    objc_storeStrong((id *)&self->_endView, a6);
  }
  if (v14) {
    objc_storeStrong((id *)&self->_start, a3);
  }
  if (v12) {
    objc_storeStrong((id *)&self->_end, a5);
  }
}

- (void)addTransitionView:(id)a3 startFrame:(CGRect)a4 endFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  id v31 = a3;
  if (v31)
  {
    v33.origin.CGFloat x = v12;
    v33.origin.CGFloat y = v11;
    v33.size.double width = v10;
    v33.size.double height = v9;
    if (!CGRectIsNull(v33))
    {
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.double width = width;
      v34.size.double height = height;
      if (!CGRectIsNull(v34))
      {
        transitionViews = self->_transitionViews;
        if (!transitionViews)
        {
          v15 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          v16 = self->_transitionViews;
          self->_transitionViews = v15;

          transitionViews = self->_transitionViews;
        }
        [(NSMutableArray *)transitionViews addObject:v31];
        v35.origin.CGFloat x = v12;
        v35.origin.CGFloat y = v11;
        v35.size.double width = v10;
        v35.size.double height = v9;
        double MidX = CGRectGetMidX(v35);
        v36.origin.CGFloat x = v12;
        v36.origin.CGFloat y = v11;
        v36.size.double width = v10;
        v36.size.double height = v9;
        double MidY = CGRectGetMidY(v36);
        v37.origin.CGFloat x = x;
        v37.origin.CGFloat y = y;
        v37.size.double width = width;
        v37.size.double height = height;
        double v18 = CGRectGetMidX(v37);
        v38.origin.CGFloat x = x;
        v38.origin.CGFloat y = y;
        v38.size.double width = width;
        v38.size.double height = height;
        double v19 = CGRectGetMidY(v38);
        v20 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"position" fromValue:0 toValue:0];
        v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", MidX, MidY);
        [v20 setFromValue:v21];

        v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v18, v19);
        [v20 setToValue:v22];

        v23 = [v31 layer];
        [v23 addAnimation:v20 forKey:@"position interpolation"];

        double v24 = *MEMORY[0x1E4F1DAD8];
        double v25 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        v26 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"bounds" fromValue:0 toValue:0];
        v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v24, v25, v10, v9);
        [v26 setFromValue:v27];

        v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v24, v25, width, height);
        [v26 setToValue:v28];

        v29 = [v31 layer];
        [v29 addAnimation:v26 forKey:@"bounds interpolation"];
      }
    }
  }
}

- (double)nonInteractiveDuration
{
  return 0.0;
}

- (void)runNonInteractivelyWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)cancelNonInteractiveAnimation
{
  uint64_t v4 = [(UIKeyboardKeyplaneTransition *)self completionBlock];
  [(UIKeyboardKeyplaneTransition *)self setCompletionBlock:0];
  v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    v3 = (void *)v4;
  }
}

- (void)updateWithProgress:(double)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = [(UIView *)self->_startView layer];
  [v5 setSpeed:0.0];

  objc_super v6 = [(UIView *)self->_endView layer];
  [v6 setSpeed:0.0];

  self->_currentProgress = a3;
  if (a3 <= 1.0) {
    double v7 = a3;
  }
  else {
    double v7 = 1.0;
  }
  if (a3 < 0.0) {
    double v7 = 0.0;
  }
  if (self->_initiallyAtEnd) {
    double v8 = 1.0 - v7;
  }
  else {
    double v8 = v7;
  }
  double v9 = [(UIView *)self->_startView layer];
  [v9 setTimeOffset:v8];

  double v10 = [(UIView *)self->_endView layer];
  [v10 setTimeOffset:v8];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  CGFloat v11 = self->_transitionViews;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "layer", (void)v23);
        [v17 setSpeed:0.0];

        double v18 = [v16 layer];
        [v18 setTimeOffset:v8];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  double v19 = [(UIKeyboardKeyplaneTransition *)self transitionDelegate];
  [(UIKeyboardKeyplaneTransition *)self startHeight];
  double v21 = v20;
  [(UIKeyboardKeyplaneTransition *)self endHeight];
  [v19 updateProgress:v8 startHeight:v21 endHeight:v22];
}

- (void)removeAllAnimations
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(UIView *)self->_startView layer];
  LODWORD(v4) = 1.0;
  [v3 setSpeed:v4];

  v5 = [(UIView *)self->_endView layer];
  LODWORD(v6) = 1.0;
  [v5 setSpeed:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v7 = self->_transitionViews;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "layer", (void)v17);
        [v13 removeAnimationForKey:@"position interpolation"];

        uint64_t v14 = [v12 layer];
        [v14 removeAnimationForKey:@"bounds interpolation"];

        v15 = [v12 layer];
        LODWORD(v16) = 1.0;
        [v15 setSpeed:v16];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)finalizeTransition
{
  [(UIKeyboardKeyplaneTransition *)self removeAllAnimations];
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    double v4 = self->_displayLink;
    self->_displayLink = 0;
  }
  v5 = [(UIKeyboardKeyplaneTransition *)self completionBlock];

  if (v5)
  {
    double v6 = [(UIKeyboardKeyplaneTransition *)self completionBlock];
    v6[2]();

    [(UIKeyboardKeyplaneTransition *)self setCompletionBlock:0];
  }
  id v7 = [(UIKeyboardKeyplaneTransition *)self transitionDelegate];
  [v7 transitionDidFinish:1];
}

- (void)transitionToFinalState:(id)a3
{
  [a3 timestamp];
  double finishProgress = self->_finishProgress;
  if (vabdd_f64(self->_currentProgress, finishProgress) < 0.01
    || (finishDuration = self->_finishDuration, double v7 = v4 - self->_finalTransitionStartTime, v7 >= finishDuration))
  {
    [(UIKeyboardKeyplaneTransition *)self finalizeTransition];
  }
  else
  {
    double v8 = self->_liftOffProgress + v7 / finishDuration * (finishProgress - self->_liftOffProgress);
    [(UIKeyboardKeyplaneTransition *)self updateWithProgress:v8];
  }
}

- (void)finishWithProgress:(double)a3 completionBlock:(id)a4
{
  [(UIKeyboardKeyplaneTransition *)self setCompletionBlock:a4];
  double v6 = 1.0 - a3;
  if (!self->_initiallyAtEnd) {
    double v6 = a3;
  }
  double currentProgress = self->_currentProgress;
  self->_liftOffProgress = currentProgress;
  self->_double finishProgress = v6;
  BOOL v8 = currentProgress >= 0.0 && currentProgress <= 1.0;
  double v9 = 3.0;
  if (!v8) {
    double v9 = 9.0;
  }
  self->_double finishDuration = vabdd_f64(currentProgress, v6) / v9;
  self->_finalTransitionStartTime = CACurrentMediaTime();
  uint64_t v10 = [(UIView *)self->_startView window];
  CGFloat v11 = [v10 screen];
  uint64_t v12 = [v11 displayLinkWithTarget:self selector:sel_transitionToFinalState_];
  displayLink = self->_displayLink;
  self->_displayLink = v12;

  uint64_t v14 = self->_displayLink;
  id v15 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v14 addToRunLoop:v15 forMode:*MEMORY[0x1E4F1C4B0]];
}

- (BOOL)canDisplayTransitionFromKeyplane:(id)a3 toKeyplane:(id)a4
{
  return self->_start == a3 && self->_end == a4;
}

- (UIKBTree)keyboard
{
  return self->_keyboard;
}

- (void)setKeyboard:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (UIKeyboardKeyplaneTransitionDelegate)transitionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDelegate);
  return (UIKeyboardKeyplaneTransitionDelegate *)WeakRetained;
}

- (void)setTransitionDelegate:(id)a3
{
}

- (BOOL)initiallyAtEnd
{
  return self->_initiallyAtEnd;
}

- (void)setInitiallyAtEnd:(BOOL)a3
{
  self->_initiallyAtEnd = a3;
}

- (UIKBKeyViewAnimator)keyViewAnimator
{
  return self->_keyViewAnimator;
}

- (void)setKeyViewAnimator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyViewAnimator, 0);
  objc_storeStrong((id *)&self->_transitionViews, 0);
  objc_destroyWeak((id *)&self->_transitionDelegate);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_endView, 0);
  objc_storeStrong((id *)&self->_startView, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end