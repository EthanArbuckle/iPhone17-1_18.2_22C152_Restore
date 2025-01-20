@interface _NCExpandedPlatterViewControllerAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation _NCExpandedPlatterViewControllerAnimator

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62___NCExpandedPlatterViewControllerAnimator_animateTransition___block_invoke;
  aBlock[3] = &unk_1E6A91BB0;
  id v4 = v3;
  id v14 = v4;
  v5 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __62___NCExpandedPlatterViewControllerAnimator_animateTransition___block_invoke_2;
  v11 = &unk_1E6A91EF8;
  id v6 = v4;
  id v12 = v6;
  v7 = (void (**)(void *, uint64_t, void))_Block_copy(&v8);
  if (objc_msgSend(MEMORY[0x1E4FB1EB0], "_isInAnimationBlockWithAnimationsEnabled", v8, v9, v10, v11))
  {
    if ([MEMORY[0x1E4FB1EB0] _isInRetargetableAnimationBlock]) {
      [MEMORY[0x1E4FB1EB0] _animateByRetargetingAnimations:v5 completion:v7];
    }
    else {
      [MEMORY[0x1E4FB1EB0] _animateUsingSpringInteractive:0 animations:v5 completion:v7];
    }
  }
  else
  {
    v5[2](v5);
    v7[2](v7, 1, 0);
  }
}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

@end