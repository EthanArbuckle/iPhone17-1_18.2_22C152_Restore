@interface SXComponentAnimationHandler
- (BOOL)animationShouldRepeat;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldFinishAtEndOfScrollView;
- (SXComponentAnimation)animation;
- (SXComponentAnimationHandler)initWithComponent:(id)a3 withAnimation:(id)a4;
- (SXComponentView)component;
- (double)factor;
- (double)factorForVisibileBounds:(CGRect)a3 andAbsoluteComponentRect:(CGRect)a4;
- (double)screenHeightStartOffset;
- (int64_t)state;
- (void)finishAnimation;
- (void)prepareAnimation;
- (void)setState:(int64_t)a3;
- (void)startAnimation;
- (void)updateAnimationWithFactor:(double)a3;
@end

@implementation SXComponentAnimationHandler

- (SXComponentAnimationHandler)initWithComponent:(id)a3 withAnimation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXComponentAnimationHandler;
  v9 = [(SXComponentAnimationHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_component, a3);
    objc_storeStrong((id *)&v10->_animation, a4);
    v10->_state = 1;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [v4 component];
  v6 = [(SXComponentAnimationHandler *)self component];
  if (v5 == v6)
  {
    id v8 = [v4 animation];
    v9 = [(SXComponentAnimationHandler *)self animation];
    BOOL v7 = v8 == v9;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)prepareAnimation
{
  id v4 = [(SXComponentAnimationHandler *)self component];
  v3 = [(SXComponentAnimationHandler *)self animation];
  [v4 animationDidStart:v3];
}

- (void)startAnimation
{
}

- (double)factorForVisibileBounds:(CGRect)a3 andAbsoluteComponentRect:(CGRect)a4
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v6 = a3.size.height;
  CGFloat v7 = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  double MinY = CGRectGetMinY(a3);
  v17.origin.CGFloat x = v9;
  v17.origin.CGFloat y = v8;
  v17.size.CGFloat width = v7;
  v17.size.CGFloat height = v6;
  double v11 = MinY + CGRectGetHeight(v17) * 0.75;
  v18.origin.CGFloat x = v9;
  v18.origin.CGFloat y = v8;
  v18.size.CGFloat width = v7;
  v18.size.CGFloat height = v6;
  double v12 = CGRectGetMinY(v18);
  v19.origin.CGFloat x = v9;
  v19.origin.CGFloat y = v8;
  v19.size.CGFloat width = v7;
  v19.size.CGFloat height = v6;
  double v13 = v12 + CGRectGetHeight(v19) * 0.25;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  return fmin(fmax(1.0 - (CGRectGetMinY(v20) - v13) / (v11 - v13), 0.0), 1.0);
}

- (double)screenHeightStartOffset
{
  return 0.25;
}

- (void)updateAnimationWithFactor:(double)a3
{
  self->_factor = a3;
  if ([(SXComponentAnimationHandler *)self state] != 2)
  {
    [(SXComponentAnimationHandler *)self setState:2];
  }
}

- (void)finishAnimation
{
  [(SXComponentAnimationHandler *)self setState:4];
  id v4 = [(SXComponentAnimationHandler *)self component];
  v3 = [(SXComponentAnimationHandler *)self animation];
  [v4 animationDidFinish:v3];
}

- (BOOL)animationShouldRepeat
{
  return 0;
}

- (BOOL)shouldFinishAtEndOfScrollView
{
  return 1;
}

- (void)setState:(int64_t)a3
{
  if (a3 == 2)
  {
    v5 = [(SXComponentAnimationHandler *)self component];
    CGFloat v6 = [(SXComponentAnimationHandler *)self animation];
    [v5 animationDidStart:v6];
  }
  self->_state = a3;
}

- (SXComponentView)component
{
  return self->_component;
}

- (SXComponentAnimation)animation
{
  return self->_animation;
}

- (int64_t)state
{
  return self->_state;
}

- (double)factor
{
  return self->_factor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end