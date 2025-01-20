@interface VideosTransitionFadeAnimator
- (VideosTransitionFadeAnimator)initWithTransitionType:(int64_t)a3 andDuration:(double)a4;
- (double)animationDuration;
- (int64_t)transitionType;
- (void)animateTransition:(id)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setTransitionType:(int64_t)a3;
@end

@implementation VideosTransitionFadeAnimator

- (VideosTransitionFadeAnimator)initWithTransitionType:(int64_t)a3 andDuration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VideosTransitionFadeAnimator;
  result = [(VideosTransitionFadeAnimator *)&v7 init];
  if (result)
  {
    result->_transitionType = a3;
    result->_animationDuration = a4;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewForKey:*MEMORY[0x1E4FB30C0]];
  objc_super v7 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v8 = [v4 viewForKey:*MEMORY[0x1E4FB30D0]];
  [v4 finalFrameForViewController:v7];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v5 addSubview:v8];
  objc_msgSend(v8, "setFrame:", v10, v12, v14, v16);
  [v8 setAlpha:0.0];
  [v6 setAlpha:1.0];
  int64_t v17 = [(VideosTransitionFadeAnimator *)self transitionType];
  if (v17) {
    v18 = v6;
  }
  else {
    v18 = v8;
  }
  id v19 = v18;
  if (v17)
  {
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v38.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v38.c = v20;
    *(_OWORD *)&v38.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v38, 1.4, 1.4);
  }
  [v19 setTransform:&v38];
  [(VideosTransitionFadeAnimator *)self transitionDuration:v4];
  double v22 = v21;
  v23 = (void *)MEMORY[0x1E4FB1EB0];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __50__VideosTransitionFadeAnimator_animateTransition___block_invoke;
  v33[3] = &unk_1E6DF4ED0;
  id v34 = v19;
  BOOL v37 = v17 == 0;
  id v35 = v8;
  id v36 = v6;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __50__VideosTransitionFadeAnimator_animateTransition___block_invoke_2;
  v28[3] = &unk_1E6DF8FA8;
  BOOL v32 = v17 == 0;
  id v29 = v4;
  id v30 = v35;
  id v31 = v36;
  id v24 = v36;
  id v25 = v35;
  id v26 = v4;
  id v27 = v19;
  [v23 animateWithDuration:v33 animations:v28 completion:v22];
}

uint64_t __50__VideosTransitionFadeAnimator_animateTransition___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v5.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v5.c = v3;
    *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v5, 1.4, 1.4);
  }
  [v2 setTransform:&v5];
  [*(id *)(a1 + 40) setAlpha:1.0];
  return [*(id *)(a1 + 48) setAlpha:0.0];
}

uint64_t __50__VideosTransitionFadeAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) transitionWasCancelled];
  uint64_t v3 = v2 ^ 1u;
  if (*(unsigned char *)(a1 + 56)) {
    char v4 = v2 ^ 1;
  }
  else {
    char v4 = v2;
  }
  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) removeFromSuperview];
  }
  CGAffineTransform v5 = *(void **)(a1 + 48);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v5 setTransform:v8];
  return [*(id *)(a1 + 32) completeTransition:v3];
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (void)setTransitionType:(int64_t)a3
{
  self->_transitionType = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

@end