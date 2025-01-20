@interface IMViewControllerOneToOneTransitionContext
- (CGRect)finalFrameForViewController:(id)a3;
- (CGRect)fromEndFrame;
- (CGRect)fromStartFrame;
- (CGRect)initialFrameForViewController:(id)a3;
- (CGRect)toEndFrame;
- (CGRect)toStartFrame;
- (UIViewController)fromViewController;
- (UIViewController)toViewController;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (void)_setFromEndFrame:(CGRect)a3;
- (void)_setFromStartFrame:(CGRect)a3;
- (void)_setFromViewController:(id)a3;
- (void)_setToEndFrame:(CGRect)a3;
- (void)_setToStartFrame:(CGRect)a3;
- (void)_setToViewController:(id)a3;
- (void)dealloc;
@end

@implementation IMViewControllerOneToOneTransitionContext

- (void)dealloc
{
  [(IMViewControllerOneToOneTransitionContext *)self _setFromViewController:0];
  [(IMViewControllerOneToOneTransitionContext *)self _setToViewController:0];
  [(IMViewControllerTransitionContext *)self _setAnimator:0];
  [(IMViewControllerTransitionContext *)self _setInteractor:0];
  v3.receiver = self;
  v3.super_class = (Class)IMViewControllerOneToOneTransitionContext;
  [(IMViewControllerTransitionContext *)&v3 dealloc];
}

- (id)viewControllerForKey:(id)a3
{
  v4 = (NSString *)a3;
  v5 = v4;
  if (UITransitionContextToViewControllerKey == v4)
  {
    uint64_t v7 = [(IMViewControllerOneToOneTransitionContext *)self toViewController];
  }
  else
  {
    if (UITransitionContextFromViewControllerKey != v4)
    {
      v6 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [(IMViewControllerOneToOneTransitionContext *)self fromViewController];
  }
  v6 = (void *)v7;
LABEL_7:

  return v6;
}

- (id)viewForKey:(id)a3
{
  v4 = (NSString *)a3;
  v5 = v4;
  if (UITransitionContextFromViewKey == v4)
  {
    uint64_t v7 = [(IMViewControllerOneToOneTransitionContext *)self fromViewController];
  }
  else
  {
    if (UITransitionContextToViewKey != v4)
    {
      v6 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [(IMViewControllerOneToOneTransitionContext *)self toViewController];
  }
  v8 = v7;
  v6 = [v7 view];

LABEL_7:

  return v6;
}

- (CGRect)initialFrameForViewController:(id)a3
{
  v4 = (UIViewController *)a3;
  v5 = v4;
  if (self->_toViewController == v4)
  {
    [(IMViewControllerOneToOneTransitionContext *)self toStartFrame];
LABEL_6:
    CGFloat x = v10;
    CGFloat y = v11;
    CGFloat width = v12;
    CGFloat height = v13;
    goto LABEL_7;
  }
  if (self->_fromViewController == v4)
  {
    [(IMViewControllerOneToOneTransitionContext *)self fromStartFrame];
    goto LABEL_6;
  }
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
LABEL_7:

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  v4 = (UIViewController *)a3;
  v5 = v4;
  if (self->_toViewController == v4)
  {
    [(IMViewControllerOneToOneTransitionContext *)self toEndFrame];
LABEL_6:
    CGFloat x = v10;
    CGFloat y = v11;
    CGFloat width = v12;
    CGFloat height = v13;
    goto LABEL_7;
  }
  if (self->_fromViewController == v4)
  {
    [(IMViewControllerOneToOneTransitionContext *)self fromEndFrame];
    goto LABEL_6;
  }
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
LABEL_7:

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (void)_setFromViewController:(id)a3
{
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)_setToViewController:(id)a3
{
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

- (void)_setFromStartFrame:(CGRect)a3
{
  self->_fromStartFrame = a3;
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

- (void)_setFromEndFrame:(CGRect)a3
{
  self->_fromEndFrame = a3;
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

- (void)_setToEndFrame:(CGRect)a3
{
  self->_toEndFrame = a3;
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

- (void)_setToStartFrame:(CGRect)a3
{
  self->_toStartFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toViewController, 0);

  objc_storeStrong((id *)&self->_fromViewController, 0);
}

@end