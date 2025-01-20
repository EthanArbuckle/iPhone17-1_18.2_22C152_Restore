@interface _UIKeyboardAnimator
- (_UIKeyboardAnimator)init;
- (void)applyToKeyboardOperations:(id)a3;
- (void)performAnimation:(id)a3 afterStarted:(id)a4 onCompletion:(id)a5;
- (void)prepareForAnimationWithState:(id)a3;
- (void)runAnimationWithState:(id)a3;
@end

@implementation _UIKeyboardAnimator

- (_UIKeyboardAnimator)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardAnimator;
  v2 = [(_UIKeyboardAnimator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[_UIKeyboardAnimatorAnimationStyle animationStyleWithAnimator:v2];
    style = v2->_style;
    v2->_style = (_UIKeyboardAnimatorAnimationStyle *)v3;
  }
  return v2;
}

- (void)applyToKeyboardOperations:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v5 pushAnimationStyle:self->_style];
  v4[2](v4);

  [v5 popAnimationStyle];
}

- (void)performAnimation:(id)a3 afterStarted:(id)a4 onCompletion:(id)a5
{
}

- (void)prepareForAnimationWithState:(id)a3
{
  id v3 = a3;
  [v3 startFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [v3 animatingView];

  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)runAnimationWithState:(id)a3
{
  id v3 = a3;
  [v3 endFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [v3 animatingView];

  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
}

@end