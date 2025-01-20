@interface _UIPageCurlState
- (BOOL)hasPendingAnimations;
- (BOOL)isCompatibleWithCurlOfType:(int64_t)a3 inDirection:(int64_t)a4;
- (CGPoint)initialLocation;
- (CGPoint)referenceLocation;
- (CGRect)_pageViewFrame;
- (UIView)backPageView;
- (UIView)backView;
- (UIView)frontPageView;
- (UIView)frontView;
- (_UIPageCurl)pageCurl;
- (_UIPageCurlState)initWithPageCurl:(id)a3 andCurlType:(int64_t)a4 fromLocation:(CGPoint)a5 withReferenceLocation:(CGPoint)a6 inDirection:(int64_t)a7 withView:(id)a8 revealingView:(id)a9 completion:(id)a10 finally:(id)a11;
- (int64_t)_effectiveTransitionDirection;
- (int64_t)curlState;
- (int64_t)curlType;
- (void)addBackPageContent;
- (void)addFrontPageContent;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)cleanup;
- (void)cleanupWithFinishedState:(BOOL)a3 completedState:(BOOL)a4;
- (void)dealloc;
- (void)finally;
- (void)incrementCompletionCount;
- (void)invalidatePageCurl;
- (void)setCurlState:(int64_t)a3 willComplete:(BOOL)a4;
@end

@implementation _UIPageCurlState

- (_UIPageCurlState)initWithPageCurl:(id)a3 andCurlType:(int64_t)a4 fromLocation:(CGPoint)a5 withReferenceLocation:(CGPoint)a6 inDirection:(int64_t)a7 withView:(id)a8 revealingView:(id)a9 completion:(id)a10 finally:(id)a11
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v17 = a5.y;
  CGFloat v18 = a5.x;
  id v33 = a3;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  v34.receiver = self;
  v34.super_class = (Class)_UIPageCurlState;
  v25 = [(_UITransitionState *)&v34 initWithTransitionDirection:a7 completion:a10];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_pageCurl, a3);
    v26->_int64_t curlType = a4;
    v26->_initialLocation.CGFloat x = v18;
    v26->_initialLocation.CGFloat y = v17;
    v26->_referenceLocation.CGFloat x = x;
    v26->_referenceLocation.CGFloat y = y;
    objc_storeStrong((id *)&v26->_frontView, a8);
    objc_storeStrong((id *)&v26->_backView, a9);
    int64_t curlType = v26->_curlType;
    if (curlType == 4 || curlType == 1) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = 2;
    }
    v26->_curlState = v29;
    v26->_willComplete = 1;
    uint64_t v30 = [v24 copy];
    finallCGFloat y = v26->_finally;
    v26->_finallCGFloat y = (id)v30;
  }
  return v26;
}

- (void)dealloc
{
  [(_UIPageCurlState *)self finally];
  v3.receiver = self;
  v3.super_class = (Class)_UIPageCurlState;
  [(_UIPageCurlState *)&v3 dealloc];
}

- (void)invalidatePageCurl
{
  pageCurl = self->_pageCurl;
  self->_pageCurl = 0;
}

- (CGRect)_pageViewFrame
{
  objc_super v3 = [(_UIPageCurlState *)self pageCurl];
  objc_msgSend(v3, "_pageViewFrame:", -[_UITransitionState transitionDirection](self, "transitionDirection") == 1);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (UIView)frontPageView
{
  if (self->_frontView)
  {
    frontPageView = self->_frontPageView;
    if (frontPageView)
    {
      [(_UIPageCurlState *)self _pageViewFrame];
      -[UIView setFrame:](frontPageView, "setFrame:");
    }
    else
    {
      double v4 = [UIView alloc];
      [(_UIPageCurlState *)self _pageViewFrame];
      double v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
      double v6 = self->_frontPageView;
      self->_frontPageView = v5;

      pageCurl = self->_pageCurl;
      double v8 = [(UIView *)self->_frontPageView layer];
      [(_UIPageCurl *)pageCurl _ensureCurlFilterOnLayer:v8];

      if (self->_backView)
      {
        double v9 = [(UIView *)self->_frontPageView layer];
        double v10 = [v9 valueForKeyPath:@"filters.curl"];
        double v11 = [NSNumber numberWithBool:0];
        [v10 setValue:v11 forKey:@"inputBackEnabled"];
      }
    }
  }
  double v12 = self->_frontPageView;
  return v12;
}

- (UIView)backPageView
{
  if (self->_backView)
  {
    backPageView = self->_backPageView;
    if (backPageView)
    {
      [(_UIPageCurlState *)self _pageViewFrame];
      -[UIView setFrame:](backPageView, "setFrame:");
    }
    else
    {
      double v4 = [UIView alloc];
      [(_UIPageCurlState *)self _pageViewFrame];
      double v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
      double v6 = self->_backPageView;
      self->_backPageView = v5;

      pageCurl = self->_pageCurl;
      double v8 = [(UIView *)self->_backPageView layer];
      [(_UIPageCurl *)pageCurl _ensureCurlFilterOnLayer:v8];

      double v9 = [(UIView *)self->_backPageView layer];
      double v10 = [(UIView *)self->_backPageView layer];
      unint64_t v11 = [(_UIPageCurl *)self->_pageCurl _spineLocation];
      memset(&v19, 0, sizeof(v19));
      CATransform3DMakeScale(&v19, -1.0, 1.0, 1.0);
      if (v11 <= 0x20 && ((1 << v11) & 0x100000104) != 0)
      {
        CATransform3D v20 = v19;
        CATransform3DRotate(&v21, &v20, 3.14159265, 0.0, 0.0, 1.0);
        CATransform3D v19 = v21;
      }
      [v9 setSublayerTransform:&v19];

      double v13 = [(UIView *)self->_backPageView layer];
      double v14 = [v13 valueForKeyPath:@"filters.curl"];

      double v15 = [NSNumber numberWithBool:0];
      [v14 setValue:v15 forKey:@"inputFrontEnabled"];

      id v16 = +[UIColor colorWithWhite:1.0 alpha:0.0];
      objc_msgSend(v14, "setValue:forKey:", objc_msgSend(v16, "CGColor"), @"inputBackColor0");
    }
  }
  CGFloat v17 = self->_backPageView;
  return v17;
}

- (void)addFrontPageContent
{
  [(UIView *)self->_frontPageView addSubview:self->_frontView];
  frontView = self->_frontView;
  frontPageView = self->_frontPageView;
  [(UIView *)frontPageView center];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(UIView *)self->_frontPageView superview];
  -[UIView convertPoint:fromView:](frontPageView, "convertPoint:fromView:", v9, v6, v8);
  -[UIView setCenter:](frontView, "setCenter:");
}

- (void)addBackPageContent
{
  [(UIView *)self->_backPageView addSubview:self->_backView];
  backView = self->_backView;
  backPageView = self->_backPageView;
  [(UIView *)backPageView center];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(UIView *)self->_backPageView superview];
  -[UIView convertPoint:fromView:](backPageView, "convertPoint:fromView:", v9, v6, v8);
  -[UIView setCenter:](backView, "setCenter:");
}

- (void)setCurlState:(int64_t)a3 willComplete:(BOOL)a4
{
  int64_t curlType = self->_curlType;
  if (curlType == 4 || curlType == 1)
  {
    if (self->_curlState != 1)
    {
LABEL_9:
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"_UIPageCurl.m", 420, @"Inconsistent curl state: current=%ld, updated=%ld", self->_curlState, a3 object file lineNumber description];
    }
  }
  else if (self->_curlState > a3)
  {
    goto LABEL_9;
  }
  self->_curlState = a3;
  self->_willComplete = a4;
}

- (BOOL)hasPendingAnimations
{
  return self->_completionCount != 0;
}

- (void)incrementCompletionCount
{
}

- (void)finally
{
  finallCGFloat y = (void (**)(id, SEL))self->_finally;
  if (finally)
  {
    finally[2](finally, a2);
    finallCGFloat y = (void (**)(id, SEL))self->_finally;
  }
  self->_finallCGFloat y = 0;
}

- (void)cleanupWithFinishedState:(BOOL)a3 completedState:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPageCurlState;
  [(_UITransitionState *)&v5 cleanupWithFinishedState:a3 completedState:a4];
  [(UIView *)self->_frontPageView removeFromSuperview];
  [(UIView *)self->_backPageView removeFromSuperview];
  [(_UIPageCurlState *)self finally];
}

- (void)cleanup
{
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6 = a3;
  int64_t v7 = self->_completionCount - 1;
  self->_completionCount = v7;
  if (!v7)
  {
    int64_t curlState = self->_curlState;
    if ((curlState | 4) == 5)
    {
      self->_finished = a4;
      id v9 = v6;
      [(_UIPageCurl *)self->_pageCurl _pageCurlAnimationDidStop:v6 withState:self];
      id v6 = v9;
    }
    else if (curlState >= 3)
    {
      self->_int64_t curlState = 4;
    }
  }
}

- (int64_t)_effectiveTransitionDirection
{
  BOOL willComplete = self->_willComplete;
  int64_t result = [(_UITransitionState *)self transitionDirection];
  if (!willComplete) {
    return result == 0;
  }
  return result;
}

- (BOOL)isCompatibleWithCurlOfType:(int64_t)a3 inDirection:(int64_t)a4
{
  if ([(_UIPageCurlState *)self curlType] != 1
    && [(_UIPageCurlState *)self curlType] != 4
    && [(_UIPageCurlState *)self curlState] != 5)
  {
    return 0;
  }
  uint64_t v7 = [(_UIPageCurlState *)self curlType];
  uint64_t v8 = v7;
  if (a3 <= 2 && v7 < 3 || (BOOL result = 0, a3 >= 3) && v8 >= 3)
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIPageCurlState;
    return [(_UITransitionState *)&v10 isCompatibleWithTransitionInDirection:a4];
  }
  return result;
}

- (_UIPageCurl)pageCurl
{
  return self->_pageCurl;
}

- (int64_t)curlType
{
  return self->_curlType;
}

- (CGPoint)initialLocation
{
  double x = self->_initialLocation.x;
  double y = self->_initialLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)referenceLocation
{
  double x = self->_referenceLocation.x;
  double y = self->_referenceLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIView)frontView
{
  return self->_frontView;
}

- (UIView)backView
{
  return self->_backView;
}

- (int64_t)curlState
{
  return self->_curlState;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finally, 0);
  objc_storeStrong((id *)&self->_backView, 0);
  objc_storeStrong((id *)&self->_frontView, 0);
  objc_storeStrong((id *)&self->_backPageView, 0);
  objc_storeStrong((id *)&self->_frontPageView, 0);
  objc_storeStrong((id *)&self->_pageCurl, 0);
}

@end