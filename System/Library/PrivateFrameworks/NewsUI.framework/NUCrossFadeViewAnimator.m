@interface NUCrossFadeViewAnimator
- (NUCrossFadeViewAnimator)init;
- (double)duration;
- (void)animateView:(id)a3 toEmptyStateWithCompletion:(id)a4;
- (void)animateView:(id)a3 toValue:(id)a4 completion:(id)a5;
- (void)crossFadeFromView:(id)a3 toView:(id)a4 value:(id)a5 completion:(id)a6;
- (void)resetView:(id)a3;
- (void)setDuration:(double)a3;
@end

@implementation NUCrossFadeViewAnimator

- (void)resetView:(id)a3
{
  id v3 = [a3 layer];
  [v3 removeAllAnimations];
}

- (NUCrossFadeViewAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)NUCrossFadeViewAnimator;
  result = [(NUCrossFadeViewAnimator *)&v3 init];
  if (result) {
    result->_duration = 0.15;
  }
  return result;
}

- (void)crossFadeFromView:(id)a3 toView:(id)a4 value:(id)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    if (v13 && v13 != v10) {
      -[NUCrossFadeViewAnimator animateView:toEmptyStateWithCompletion:](self, "animateView:toEmptyStateWithCompletion:");
    }
    [(NUCrossFadeViewAnimator *)self animateView:v10 toValue:v11 completion:v12];
  }
  else
  {
    [(NUCrossFadeViewAnimator *)self animateView:v10 toEmptyStateWithCompletion:v12];
  }
}

- (void)animateView:(id)a3 toValue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NUTransition animation];
  [v11 setType:*MEMORY[0x263F15FD8]];
  [(NUCrossFadeViewAnimator *)self duration];
  objc_msgSend(v11, "setDuration:");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__NUCrossFadeViewAnimator_animateView_toValue_completion___block_invoke;
  v15[3] = &unk_2645FECF0;
  id v16 = v8;
  id v12 = v8;
  [v11 setCompletion:v15];
  id v13 = [v10 layer];
  [v13 removeAllAnimations];

  v14 = [v10 layer];
  [v14 addAnimation:v11 forKey:@"crossfade"];

  objc_msgSend(v10, "nu_crossFadeViewSetValue:", v9);
}

uint64_t __58__NUCrossFadeViewAnimator_animateView_toValue_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)animateView:(id)a3 toEmptyStateWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NUBasicAnimation animationWithKeyPath:@"opacity"];
  [v8 setFromValue:&unk_26D4A8CB8];
  [v8 setToValue:&unk_26D4A8CC8];
  [(NUCrossFadeViewAnimator *)self duration];
  objc_msgSend(v8, "setDuration:");
  [v8 setRemovedOnCompletion:0];
  [v8 setFillMode:*MEMORY[0x263F15AB0]];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __66__NUCrossFadeViewAnimator_animateView_toEmptyStateWithCompletion___block_invoke;
  v15 = &unk_2645FED18;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 setCompletion:&v12];
  id v11 = objc_msgSend(v10, "layer", v12, v13, v14, v15);
  [v11 addAnimation:v8 forKey:@"opacity"];
}

uint64_t __66__NUCrossFadeViewAnimator_animateView_toEmptyStateWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "nu_crossFadeViewClearVisibleState");
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end