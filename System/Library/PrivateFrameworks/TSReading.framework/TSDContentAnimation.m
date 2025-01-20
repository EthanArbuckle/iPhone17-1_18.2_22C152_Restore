@interface TSDContentAnimation
+ (id)animation;
- (BOOL)i_canProduceAnimation;
- (id)i_animationWithTransformBlock:(id)a3;
- (id)i_endLocation;
- (void)i_applyToLayer:(id)a3 withTransformBlock:(id)a4 completionBlock:(id)a5;
@end

@implementation TSDContentAnimation

+ (id)animation
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (void)i_applyToLayer:(id)a3 withTransformBlock:(id)a4 completionBlock:(id)a5
{
  if ([(TSDContentAnimation *)self i_canProduceAnimation])
  {
    [MEMORY[0x263F158F8] begin];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __73__TSDContentAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke;
    v10[3] = &unk_2646B2298;
    v10[5] = self;
    v10[6] = a5;
    v10[4] = a3;
    [MEMORY[0x263F158F8] setCompletionBlock:v10];
    id v9 = [(TSDContentAnimation *)self i_animationWithTransformBlock:a4];
    [v9 setRemovedOnCompletion:0];
    [v9 setFillMode:*MEMORY[0x263F15AB0]];
    [a3 addAnimation:v9 forKey:@"contentAnimation"];
    [MEMORY[0x263F158F8] commit];
  }
}

uint64_t __73__TSDContentAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeAnimationForKey:@"contentAnimation"];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "i_endLocation");
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (BOOL)i_canProduceAnimation
{
  return 0;
}

- (id)i_animationWithTransformBlock:(id)a3
{
  return 0;
}

- (id)i_endLocation
{
  return 0;
}

@end