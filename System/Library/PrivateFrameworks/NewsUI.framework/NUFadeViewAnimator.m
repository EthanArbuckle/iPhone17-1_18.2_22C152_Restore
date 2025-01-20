@interface NUFadeViewAnimator
- (NUFadeViewAnimator)init;
- (double)fadeInDelay;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (void)fadeFromView:(id)a3 toView:(id)a4 completion:(id)a5;
- (void)setFadeInDelay:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
@end

@implementation NUFadeViewAnimator

- (NUFadeViewAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)NUFadeViewAnimator;
  result = [(NUFadeViewAnimator *)&v3 init];
  if (result)
  {
    *(int64x2_t *)&result->_fadeOutDuration = vdupq_n_s64(0x3FC70A3D70A3D70AuLL);
    result->_fadeInDelay = 0.15;
  }
  return result;
}

- (void)fadeFromView:(id)a3 toView:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [MEMORY[0x263F08B88] isMainThread];
  if (v8)
  {
    v11 = (void *)MEMORY[0x263F1CB60];
    [(NUFadeViewAnimator *)self fadeOutDuration];
    double v13 = v12;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke;
    v25[3] = &unk_2645FE4C8;
    id v26 = v8;
    [v11 animateWithDuration:0 delay:v25 options:&__block_literal_global_10 animations:v13 completion:0.0];
    [(NUFadeViewAnimator *)self fadeInDelay];
    double v15 = v14;
  }
  else
  {
    double v15 = 0.0;
  }
  v16 = (void *)MEMORY[0x263F1CB60];
  [(NUFadeViewAnimator *)self fadeInDuration];
  double v18 = v17;
  id v22 = v10;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke_3;
  v23[3] = &unk_2645FE4C8;
  id v24 = v9;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke_4;
  v21[3] = &unk_2645FECF0;
  id v19 = v10;
  id v20 = v9;
  [v16 animateWithDuration:0 delay:v23 options:v21 animations:v18 completion:v15];
}

uint64_t __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __53__NUFadeViewAnimator_fadeFromView_toView_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
}

- (double)fadeInDelay
{
  return self->_fadeInDelay;
}

- (void)setFadeInDelay:(double)a3
{
  self->_fadeInDelay = a3;
}

@end