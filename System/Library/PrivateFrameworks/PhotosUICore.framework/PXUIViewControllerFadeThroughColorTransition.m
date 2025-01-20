@interface PXUIViewControllerFadeThroughColorTransition
- (PXUIViewControllerFadeThroughColorTransition)init;
- (PXUIViewControllerFadeThroughColorTransition)initWithDuration:(double)a3 midpointColor:(id)a4;
- (UIColor)midpointColor;
- (double)duration;
- (void)animateTransition:(id)a3;
@end

@implementation PXUIViewControllerFadeThroughColorTransition

- (void).cxx_destruct
{
}

- (UIColor)midpointColor
{
  return self->_midpointColor;
}

- (double)duration
{
  return self->_duration;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  [(PXUIViewControllerFadeThroughColorTransition *)self transitionDuration:v4];
  double v6 = v5 * 0.5;
  v7 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v8 = [v7 view];
  v9 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v10 = [v9 view];
  v11 = [v4 containerView];
  id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v11 bounds];
  v13 = objc_msgSend(v12, "initWithFrame:");
  v14 = [(PXUIViewControllerFadeThroughColorTransition *)self midpointColor];
  [v13 setBackgroundColor:v14];

  [v13 setAlpha:0.0];
  [v11 addSubview:v13];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke;
  aBlock[3] = &unk_1E5DD0058;
  id v15 = v13;
  id v34 = v15;
  id v35 = v4;
  id v16 = v4;
  v17 = _Block_copy(aBlock);
  v18 = (void *)MEMORY[0x1E4FB1EB0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_2;
  v31[3] = &unk_1E5DD36F8;
  id v32 = v15;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_3;
  v24[3] = &unk_1E5DC0990;
  id v25 = v8;
  id v26 = v11;
  id v27 = v10;
  id v28 = v32;
  double v30 = v6;
  id v29 = v17;
  id v19 = v17;
  id v20 = v32;
  id v21 = v10;
  id v22 = v11;
  id v23 = v8;
  [v18 animateWithDuration:v31 animations:v24 completion:v6];
}

uint64_t __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v4 = *(void **)(a1 + 40);
  return [v4 completeTransition:a2];
}

uint64_t __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_3(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) insertSubview:*(void *)(a1 + 48) belowSubview:*(void *)(a1 + 56)];
  if (a2)
  {
    id v4 = (void *)MEMORY[0x1E4FB1EB0];
    double v5 = *(double *)(a1 + 72);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_4;
    v9[3] = &unk_1E5DD36F8;
    id v10 = *(id *)(a1 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_5;
    v7[3] = &unk_1E5DCCA98;
    id v8 = *(id *)(a1 + 64);
    [v4 animateWithDuration:v9 animations:v7 completion:v5];
  }
  else
  {
    double v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v6();
  }
}

uint64_t __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __66__PXUIViewControllerFadeThroughColorTransition_animateTransition___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PXUIViewControllerFadeThroughColorTransition)initWithDuration:(double)a3 midpointColor:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXUIViewControllerFadeThroughColorTransition;
  v7 = [(PXUIViewControllerFadeThroughColorTransition *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    v7->_duration = a3;
    if (v6)
    {
      v9 = (UIColor *)v6;
    }
    else
    {
      v9 = [MEMORY[0x1E4FB1618] blackColor];
    }
    midpointColor = v8->_midpointColor;
    v8->_midpointColor = v9;
  }
  return v8;
}

- (PXUIViewControllerFadeThroughColorTransition)init
{
  return [(PXUIViewControllerFadeThroughColorTransition *)self initWithDuration:0 midpointColor:1.0];
}

@end