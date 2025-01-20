@interface _UIKeyboardAnimatorAnimationStyleController
- (_UIKeyboardAnimatorAnimationStyleController)initWithAnimator:(id)a3;
- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5;
- (void)completeAnimationWithHost:(id)a3 context:(id)a4;
- (void)performAnimationWithHost:(id)a3 context:(id)a4;
@end

@implementation _UIKeyboardAnimatorAnimationStyleController

- (_UIKeyboardAnimatorAnimationStyleController)initWithAnimator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardAnimatorAnimationStyleController;
  v6 = [(_UIKeyboardAnimatorAnimationStyleController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_animator, a3);
  }

  return v7;
}

- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_UIKeyboardAnimatorAnimationStyleControllerContext alloc] initWithHost:v10 startPlacement:v9 endPlacement:v8];

  [(_UIKeyboardAnimator *)self->_animator prepareForAnimationWithState:v11];
  return v11;
}

- (void)performAnimationWithHost:(id)a3 context:(id)a4
{
}

- (void)completeAnimationWithHost:(id)a3 context:(id)a4
{
  animator = self->_animator;
  id v5 = a4;
  [(_UIKeyboardAnimator *)animator completeAnimationWithState:v5];
  [v5 complete];
}

- (void).cxx_destruct
{
}

@end