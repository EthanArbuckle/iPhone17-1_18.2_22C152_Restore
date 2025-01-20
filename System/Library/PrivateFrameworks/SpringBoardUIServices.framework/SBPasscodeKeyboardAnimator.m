@interface SBPasscodeKeyboardAnimator
- (BSAnimationSettings)animationSettings;
- (SBPasscodeKeyboardAnimatorDelegate)delegate;
- (void)completeAnimationWithState:(id)a3;
- (void)performAnimation:(id)a3 afterStarted:(id)a4 onCompletion:(id)a5;
- (void)prepareForAnimationWithState:(id)a3;
- (void)runAnimationWithState:(id)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBPasscodeKeyboardAnimator

- (void)performAnimation:(id)a3 afterStarted:(id)a4 onCompletion:(id)a5
{
  id v12 = a4;
  v8 = (void *)MEMORY[0x1E4F42FF0];
  id v9 = a5;
  id v10 = a3;
  if ([v8 _isInAnimationBlock]) {
    [MEMORY[0x1E4F4F898] addAlongsideAnimations:v10 completion:v9];
  }
  else {
    [MEMORY[0x1E4F4F898] animateWithSettings:self->_animationSettings actions:v10 completion:v9];
  }

  v11 = v12;
  if (v12)
  {
    (*((void (**)(id))v12 + 2))(v12);
    v11 = v12;
  }
}

- (void)prepareForAnimationWithState:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SBPasscodeKeyboardAnimator;
  [(_UIKeyboardAnimator *)&v26 prepareForAnimationWithState:v4];
  v5 = [v4 animatingView];
  v6 = [v5 window];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v4 startFrame];
  v28.origin.x = v15;
  v28.origin.y = v16;
  v28.size.width = v17;
  v28.size.height = v18;
  v27.origin.x = v8;
  v27.origin.y = v10;
  v27.size.width = v12;
  v27.size.height = v14;
  BOOL v19 = CGRectContainsRect(v27, v28);

  if (v19)
  {
    v20 = [v4 animatingView];
    [v20 setAlpha:1.0];
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F42FF0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__SBPasscodeKeyboardAnimator_prepareForAnimationWithState___block_invoke;
    v24[3] = &unk_1E5CCC580;
    id v22 = v4;
    id v25 = v22;
    [v21 performWithoutAnimation:v24];
    v23 = [v22 animatingView];
    [v23 setAlpha:0.0];

    v20 = v25;
  }
}

void __59__SBPasscodeKeyboardAnimator_prepareForAnimationWithState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) endFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) animatingView];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);
}

- (void)runAnimationWithState:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBPasscodeKeyboardAnimator;
  [(_UIKeyboardAnimator *)&v25 runAnimationWithState:v4];
  double v5 = [v4 animatingView];
  double v6 = [v5 window];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v4 endFrame];
  v27.origin.x = v15;
  v27.origin.y = v16;
  v27.size.width = v17;
  v27.size.height = v18;
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  BOOL v19 = CGRectContainsRect(v26, v27);

  v20 = [v4 animatingView];
  v21 = v20;
  if (v19)
  {
    [v20 setAlpha:1.0];
  }
  else
  {
    [v20 setAlpha:0.0];

    id v22 = (void *)MEMORY[0x1E4F42FF0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __52__SBPasscodeKeyboardAnimator_runAnimationWithState___block_invoke;
    v23[3] = &unk_1E5CCC580;
    id v24 = v4;
    [v22 performWithoutAnimation:v23];
    v21 = v24;
  }
}

void __52__SBPasscodeKeyboardAnimator_runAnimationWithState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) animatingView];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);
}

- (void)completeAnimationWithState:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBPasscodeKeyboardAnimator;
  [(_UIKeyboardAnimator *)&v7 completeAnimationWithState:v4];
  double v5 = [(SBPasscodeKeyboardAnimator *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 passcodeKeyboardAnimatorAnimationDidComplete:self];
  }
  double v6 = [v4 animatingView];
  [v6 setAlpha:1.0];
}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
}

- (SBPasscodeKeyboardAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPasscodeKeyboardAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end