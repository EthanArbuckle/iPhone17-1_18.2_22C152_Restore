@interface _UIViewControllerOneToOneTransitionContext
- (BOOL)_isDeferred;
- (CGRect)finalFrameForViewController:(id)a3;
- (CGRect)fromEndFrame;
- (CGRect)fromStartFrame;
- (CGRect)initialFrameForViewController:(id)a3;
- (CGRect)toEndFrame;
- (CGRect)toStartFrame;
- (UIView)_fromView;
- (UIView)_toView;
- (UIViewController)fromViewController;
- (UIViewController)toViewController;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (void)_setFromEndFrame:(CGRect)a3;
- (void)_setFromStartFrame:(CGRect)a3;
- (void)_setFromView:(id)a3;
- (void)_setFromViewController:(id)a3;
- (void)_setIsDeferred:(BOOL)a3;
- (void)_setToEndFrame:(CGRect)a3;
- (void)_setToStartFrame:(CGRect)a3;
- (void)_setToView:(id)a3;
- (void)_setToViewController:(id)a3;
- (void)dealloc;
@end

@implementation _UIViewControllerOneToOneTransitionContext

- (void)dealloc
{
  [(_UIViewControllerTransitionContext *)self _setAnimator:0];
  [(_UIViewControllerTransitionContext *)self _setInteractor:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIViewControllerOneToOneTransitionContext;
  [(_UIViewControllerTransitionContext *)&v3 dealloc];
}

- (void)_setToViewController:(id)a3
{
}

- (void)_setToStartFrame:(CGRect)a3
{
  self->_toStartFrame = a3;
}

- (void)_setToEndFrame:(CGRect)a3
{
  self->_toEndFrame = a3;
}

- (void)_setFromViewController:(id)a3
{
}

- (void)_setFromStartFrame:(CGRect)a3
{
  self->_fromStartFrame = a3;
}

- (void)_setFromEndFrame:(CGRect)a3
{
  self->_fromEndFrame = a3;
}

- (id)viewControllerForKey:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == @"UITransitionContextToViewController")
  {
    uint64_t v7 = [(_UIViewControllerOneToOneTransitionContext *)self toViewController];
  }
  else
  {
    if (v4 != @"UITransitionContextFromViewController")
    {
      v6 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [(_UIViewControllerOneToOneTransitionContext *)self fromViewController];
  }
  v6 = (void *)v7;
LABEL_7:

  return v6;
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (void)_setToView:(id)a3
{
  self->_isToViewSet = 1;
}

- (void)_setFromView:(id)a3
{
  self->_isFromViewSet = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
  objc_storeStrong((id *)&self->_toView, 0);
}

- (CGRect)finalFrameForViewController:(id)a3
{
  v4 = (UIViewController *)a3;
  v5 = v4;
  if (self->_toViewController == v4)
  {
    [(_UIViewControllerOneToOneTransitionContext *)self toEndFrame];
LABEL_6:
    double v6 = v10;
    double v7 = v11;
    double v8 = v12;
    double v9 = v13;
    goto LABEL_7;
  }
  if (self->_fromViewController == v4)
  {
    [(_UIViewControllerOneToOneTransitionContext *)self fromEndFrame];
    goto LABEL_6;
  }
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_7:

  double v14 = v6;
  double v15 = v7;
  double v16 = v8;
  double v17 = v9;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)toEndFrame
{
  double x = self->_toEndFrame.origin.x;
  double y = self->_toEndFrame.origin.y;
  double width = self->_toEndFrame.size.width;
  double height = self->_toEndFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)_toView
{
  if (self->_isToViewSet)
  {
    v2 = self->_toView;
  }
  else
  {
    objc_super v3 = [(_UIViewControllerOneToOneTransitionContext *)self toViewController];
    v2 = [v3 view];
  }
  return v2;
}

- (UIView)_fromView
{
  if (self->_isFromViewSet)
  {
    v2 = self->_fromView;
  }
  else
  {
    objc_super v3 = [(_UIViewControllerOneToOneTransitionContext *)self fromViewController];
    v2 = [v3 view];
  }
  return v2;
}

- (BOOL)_isDeferred
{
  return self->__isDeferred;
}

- (void)_setIsDeferred:(BOOL)a3
{
  self->__isDeferred = a3;
}

- (id)viewForKey:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == @"UITransitionContextToView")
  {
    uint64_t v7 = [(_UIViewControllerOneToOneTransitionContext *)self _toView];
  }
  else
  {
    if (v4 != @"UITransitionContextFromView")
    {
      double v6 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [(_UIViewControllerOneToOneTransitionContext *)self _fromView];
  }
  double v6 = (void *)v7;
LABEL_7:

  return v6;
}

- (CGRect)initialFrameForViewController:(id)a3
{
  v4 = (UIViewController *)a3;
  v5 = v4;
  if (self->_toViewController == v4)
  {
    [(_UIViewControllerOneToOneTransitionContext *)self toStartFrame];
LABEL_6:
    double v6 = v10;
    double v7 = v11;
    double v8 = v12;
    double v9 = v13;
    goto LABEL_7;
  }
  if (self->_fromViewController == v4)
  {
    [(_UIViewControllerOneToOneTransitionContext *)self fromStartFrame];
    goto LABEL_6;
  }
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_7:

  double v14 = v6;
  double v15 = v7;
  double v16 = v8;
  double v17 = v9;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)fromStartFrame
{
  double x = self->_fromStartFrame.origin.x;
  double y = self->_fromStartFrame.origin.y;
  double width = self->_fromStartFrame.size.width;
  double height = self->_fromStartFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)fromEndFrame
{
  double x = self->_fromEndFrame.origin.x;
  double y = self->_fromEndFrame.origin.y;
  double width = self->_fromEndFrame.size.width;
  double height = self->_fromEndFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)toStartFrame
{
  double x = self->_toStartFrame.origin.x;
  double y = self->_toStartFrame.origin.y;
  double width = self->_toStartFrame.size.width;
  double height = self->_toStartFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end