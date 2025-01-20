@interface _TUIInteractiveBasePressAnimationDelegate
- (_TUIInteractiveBasePressAnimationDelegate)initWithCompletion:(id)a3;
- (void)_decrementCount;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation _TUIInteractiveBasePressAnimationDelegate

- (_TUIInteractiveBasePressAnimationDelegate)initWithCompletion:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIInteractiveBasePressAnimationDelegate;
  v5 = [(_TUIInteractiveBasePressAnimationDelegate *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id completion = v5->_completion;
    v5->_id completion = v6;
  }
  return v5;
}

- (void)_decrementCount
{
  unint64_t animationCount = self->_animationCount;
  if (animationCount)
  {
    unint64_t v4 = animationCount - 1;
    self->_unint64_t animationCount = v4;
    if (!v4)
    {
      id completion = (void (**)(id, SEL))self->_completion;
      if (completion)
      {
        completion[2](completion, a2);
        id v6 = self->_completion;
        self->_id completion = 0;
      }
    }
  }
}

- (void)animationDidStart:(id)a3
{
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
}

- (void).cxx_destruct
{
}

@end