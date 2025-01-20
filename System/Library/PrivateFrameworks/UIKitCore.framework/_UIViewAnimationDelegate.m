@interface _UIViewAnimationDelegate
- (_UIViewAnimationDelegate)initWithCompletionBlock:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation _UIViewAnimationDelegate

- (_UIViewAnimationDelegate)initWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewAnimationDelegate;
  v5 = [(_UIViewAnimationDelegate *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id completionBlock = v5->_completionBlock;
    v5->_id completionBlock = v6;
  }
  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
}

- (void).cxx_destruct
{
}

@end