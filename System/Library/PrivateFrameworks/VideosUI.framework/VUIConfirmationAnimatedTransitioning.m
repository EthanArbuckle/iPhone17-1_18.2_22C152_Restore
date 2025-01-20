@interface VUIConfirmationAnimatedTransitioning
- (BOOL)isPresenting;
- (VUIConfirmationAnimatedTransitioning)init;
- (VUIConfirmationAnimatedTransitioning)initWithPresenting:(BOOL)a3;
- (VUIConfirmationAnimatedTransitioningDelegate)delegate;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation VUIConfirmationAnimatedTransitioning

- (VUIConfirmationAnimatedTransitioning)init
{
  return [(VUIConfirmationAnimatedTransitioning *)self initWithPresenting:1];
}

- (VUIConfirmationAnimatedTransitioning)initWithPresenting:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIConfirmationAnimatedTransitioning;
  result = [(VUIConfirmationAnimatedTransitioning *)&v5 init];
  if (result) {
    result->_presenting = a3;
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  return 0.2;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  [(VUIConfirmationAnimatedTransitioning *)self transitionDuration:v4];
  double v6 = v5;
  v7 = [v4 containerView];
  v8 = [v4 viewForKey:*MEMORY[0x1E4FB30C0]];
  v9 = [v4 viewForKey:*MEMORY[0x1E4FB30D0]];
  objc_initWeak(&location, v4);
  if ([(VUIConfirmationAnimatedTransitioning *)self isPresenting])
  {
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [v7 setBackgroundColor:v10];

    v11 = [v9 subviews];
    id v12 = [v11 lastObject];

    v13 = [MEMORY[0x1E4FB1618] clearColor];
    [v12 setBackgroundColor:v13];

    v14 = [v9 layer];
    CGAffineTransformMakeScale(&v26, 0.88, 0.88);
    [v14 setAffineTransform:&v26];

    [v7 addSubview:v9];
    [v9 setAlpha:0.0];
    v15 = (void *)MEMORY[0x1E4FB1EB0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke;
    v24[3] = &unk_1E6DF3D58;
    id v25 = v9;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_2;
    v22[3] = &unk_1E6DF59E8;
    objc_copyWeak(&v23, &location);
    [v15 animateWithDuration:v24 animations:v22 completion:v6];
    objc_destroyWeak(&v23);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4FB1EB0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_3;
    v20[3] = &unk_1E6DF3D58;
    id v21 = v8;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_4;
    v17[3] = &unk_1E6DF5C48;
    id v18 = v21;
    objc_copyWeak(&v19, &location);
    [v16 animateWithDuration:v20 animations:v17 completion:v6];
    objc_destroyWeak(&v19);

    id v12 = v21;
  }

  objc_destroyWeak(&location);
}

void __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = [*(id *)(a1 + 32) layer];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setAffineTransform:v4];
}

void __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeTransition:a2];
}

void __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = [*(id *)(a1 + 32) layer];
  CGAffineTransformMakeScale(&v3, 0.88, 0.88);
  [v2 setAffineTransform:&v3];
}

void __58__VUIConfirmationAnimatedTransitioning_animateTransition___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) layer];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v7[0] = *MEMORY[0x1E4F1DAB8];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 setAffineTransform:v7];

  [*(id *)(a1 + 32) removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained completeTransition:a2];
}

- (void)animationEnded:(BOOL)a3
{
  id v4 = [(VUIConfirmationAnimatedTransitioning *)self delegate];
  [v4 confirmationAnimatedTransitioningAnimationDidEnd:self];
}

- (VUIConfirmationAnimatedTransitioningDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIConfirmationAnimatedTransitioningDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void).cxx_destruct
{
}

@end