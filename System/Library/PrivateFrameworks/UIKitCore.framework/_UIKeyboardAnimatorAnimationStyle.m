@interface _UIKeyboardAnimatorAnimationStyle
+ (_UIKeyboardAnimatorAnimationStyle)animationStyleWithAnimator:(id)a3;
- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4;
- (void)defaultLaunchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5;
- (void)launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7;
@end

@implementation _UIKeyboardAnimatorAnimationStyle

+ (_UIKeyboardAnimatorAnimationStyle)animationStyleWithAnimator:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 animationStyleDefault];
  v6 = (void *)v5;
  if (v5) {
    objc_storeWeak((id *)(v5 + 48), v4);
  }

  return (_UIKeyboardAnimatorAnimationStyle *)v6;
}

- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4
{
  uint64_t v5 = [_UIKeyboardAnimatorAnimationStyleController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animator);
  v7 = [(_UIKeyboardAnimatorAnimationStyleController *)v5 initWithAnimator:WeakRetained];

  return v7;
}

- (void)launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7
{
  p_currentHost = &self->_currentHost;
  objc_storeStrong((id *)&self->_currentHost, a6);
  id v19 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  self->_currentFromPosition = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animator);
  [WeakRetained performAnimation:v16 afterStarted:v15 onCompletion:v14];

  v18 = *p_currentHost;
  *p_currentHost = 0;
}

- (void)defaultLaunchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5
{
  currentHost = self->_currentHost;
  BOOL currentFromPosition = self->_currentFromPosition;
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyboardAnimatorAnimationStyle;
  [(UIInputViewAnimationStyle *)&v7 launchAnimation:a3 afterStarted:a4 completion:a5 forHost:currentHost fromCurrentPosition:currentFromPosition];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHost, 0);
  objc_destroyWeak((id *)&self->_animator);
}

@end