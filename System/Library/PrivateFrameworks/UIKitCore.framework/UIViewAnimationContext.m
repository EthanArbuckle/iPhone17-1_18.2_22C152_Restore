@interface UIViewAnimationContext
- (void)initWithCompletionHandler:(void *)a1;
- (void)setViewAnimations:(uint64_t)a1;
@end

@implementation UIViewAnimationContext

- (void)setViewAnimations:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)initWithCompletionHandler:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)UIViewAnimationContext;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[3];
      a1[3] = v4;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeToDeleteCell, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_viewAnimations, 0);
}

@end