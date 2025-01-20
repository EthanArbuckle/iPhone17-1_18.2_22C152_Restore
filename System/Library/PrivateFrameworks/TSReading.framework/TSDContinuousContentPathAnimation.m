@interface TSDContinuousContentPathAnimation
- (id)isFinished;
- (id)tick;
- (void)dealloc;
- (void)i_applyToLayer:(id)a3 withTransformBlock:(id)a4 completionBlock:(id)a5;
- (void)setIsFinished:(id)a3;
- (void)setTick:(id)a3;
@end

@implementation TSDContinuousContentPathAnimation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDContinuousContentPathAnimation;
  [(TSDContinuousContentPathAnimation *)&v3 dealloc];
}

- (void)i_applyToLayer:(id)a3 withTransformBlock:(id)a4 completionBlock:(id)a5
{
  tick = (uint64_t (**)(id, SEL, double, double))self->_tick;
  if (tick)
  {
    if (self->_isFinished)
    {
      uint64_t v10 = tick[2](tick, a2, 0.0, 0.0);
      (*((void (**)(_OWORD *__return_ptr, id, uint64_t))a4 + 2))(v16, a4, v10);
      v15[4] = v16[4];
      v15[5] = v16[5];
      v15[6] = v16[6];
      v15[7] = v16[7];
      v15[0] = v16[0];
      v15[1] = v16[1];
      v15[2] = v16[2];
      v15[3] = v16[3];
      [a3 setTransform:v15];
      v11 = objc_alloc_init(TSDDisplayLink);
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x3052000000;
      v14[3] = __Block_byref_object_copy__16;
      v14[4] = __Block_byref_object_dispose__16;
      v14[5] = 0;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __87__TSDContinuousContentPathAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke;
      v13[3] = &unk_2646B22C0;
      v13[4] = self;
      v13[5] = a3;
      v13[6] = a4;
      v13[7] = v14;
      [(TSDDisplayLink *)v11 setTickBlock:v13];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __87__TSDContinuousContentPathAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke_2;
      v12[3] = &unk_2646B1438;
      v12[4] = a3;
      v12[5] = a5;
      v12[6] = v14;
      [(TSDDisplayLink *)v11 setCompletionBlock:v12];
      [(TSDDisplayLink *)v11 start];
      _Block_object_dispose(v14, 8);
    }
  }
}

uint64_t __87__TSDContinuousContentPathAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke(void *a1, double a2)
{
  v4 = (void *)(*(uint64_t (**)(void))(*(void *)(a1[4] + 8) + 16))();
  (*(void (**)(_OWORD *__return_ptr))(a1[6] + 16))(v9);
  v5 = (void *)a1[5];
  v8[4] = v9[4];
  v8[5] = v9[5];
  v8[6] = v9[6];
  v8[7] = v9[7];
  v8[0] = v9[0];
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  [v5 setTransform:v8];
  uint64_t v6 = (*(uint64_t (**)(double))(*(void *)(a1[4] + 16) + 16))(a2);
  if (v6) {
    *(void *)(*(void *)(a1[7] + 8) + 40) = v4;
  }
  return v6;
}

void __87__TSDContinuousContentPathAnimation_i_applyToLayer_withTransformBlock_completionBlock___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  long long v3 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v7[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v7[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v7[0] = *MEMORY[0x263F15740];
  v7[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v7[3] = v6;
  [v2 setTransform:v7];
  (*(void (**)(void))(a1[5] + 16))();
}

- (id)tick
{
  return self->_tick;
}

- (void)setTick:(id)a3
{
}

- (id)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(id)a3
{
}

@end