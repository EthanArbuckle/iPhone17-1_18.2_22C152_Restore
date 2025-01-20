@interface PNPPlatterAnimator
- (BOOL)isPresenting;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setIsPresenting:(BOOL)a3;
@end

@implementation PNPPlatterAnimator

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PNPPlatterAnimator *)self isPresenting];
  v6 = [v4 containerView];
  v7 = (void *)MEMORY[0x263F1D7B8];
  if (!v5) {
    v7 = (void *)MEMORY[0x263F1D7A8];
  }
  v8 = [v4 viewForKey:*v7];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __40__PNPPlatterAnimator_animateTransition___block_invoke;
  v25[3] = &unk_264DA57B8;
  BOOL v28 = v5;
  id v9 = v8;
  id v26 = v9;
  id v10 = v6;
  id v27 = v10;
  v11 = (void (**)(void))MEMORY[0x23ECA63E0](v25);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __40__PNPPlatterAnimator_animateTransition___block_invoke_3;
  v21[3] = &unk_264DA57B8;
  BOOL v24 = v5;
  id v12 = v9;
  id v22 = v12;
  id v13 = v4;
  id v23 = v13;
  v14 = (void (**)(void))MEMORY[0x23ECA63E0](v21);
  int v15 = [v13 isAnimated];
  v11[2](v11);
  if (v15)
  {
    v16 = (void *)MEMORY[0x263F1CB60];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __40__PNPPlatterAnimator_animateTransition___block_invoke_4;
    v19[3] = &unk_264DA5768;
    id v20 = &__block_literal_global_0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __40__PNPPlatterAnimator_animateTransition___block_invoke_5;
    v17[3] = &unk_264DA5800;
    v18 = v14;
    [v16 _animateUsingDefaultTimingWithOptions:6 animations:v19 completion:v17];
  }
  else
  {
    v14[2](v14);
  }
}

uint64_t __40__PNPPlatterAnimator_animateTransition___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 48))
  {
    uint64_t v1 = result;
    v2 = *(void **)(result + 32);
    [*(id *)(result + 40) bounds];
    objc_msgSend(v2, "setFrame:");
    uint64_t v4 = *(void *)(v1 + 32);
    v3 = *(void **)(v1 + 40);
    return [v3 addSubview:v4];
  }
  return result;
}

uint64_t __40__PNPPlatterAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) removeFromSuperview];
  }
  v2 = *(void **)(a1 + 40);
  return [v2 completeTransition:1];
}

uint64_t __40__PNPPlatterAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__PNPPlatterAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

@end