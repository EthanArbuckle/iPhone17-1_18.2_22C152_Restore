@interface _UISelectionGrabberAnimationDelegate
+ (id)delegateWithCompletionBlock:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation _UISelectionGrabberAnimationDelegate

+ (id)delegateWithCompletionBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UISelectionGrabberAnimationDelegate);
  v5 = _Block_copy(v3);

  id block = v4->block;
  v4->id block = v5;

  return v4;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id block = (void (**)(id, BOOL))self->block;
  if (block) {
    block[2](block, a4);
  }
}

- (void).cxx_destruct
{
}

@end