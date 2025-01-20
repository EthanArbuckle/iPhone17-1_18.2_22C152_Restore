@interface TUAnimationAffineTransformFunction
- (CAMediaTimingFunction)timingFunction;
- (CGAffineTransform)endValue;
- (CGAffineTransform)solveForTime:(SEL)a3;
- (CGAffineTransform)startValue;
- (TUAnimationAffineTransformFunction)initWithTimingFunction:(id)a3 startTransform:(CGAffineTransform *)a4 endTransform:(CGAffineTransform *)a5 speed:(double)a6;
- (TUAnimationFloatFunction)aFunction;
- (TUAnimationFloatFunction)bFunction;
- (TUAnimationFloatFunction)cFunction;
- (TUAnimationFloatFunction)dFunction;
- (TUAnimationFloatFunction)txFunction;
- (TUAnimationFloatFunction)tyFunction;
- (double)speed;
- (void)_reloadFunctions;
- (void)setAFunction:(id)a3;
- (void)setBFunction:(id)a3;
- (void)setCFunction:(id)a3;
- (void)setDFunction:(id)a3;
- (void)setEndValue:(CGAffineTransform *)a3;
- (void)setSpeed:(double)a3;
- (void)setStartValue:(CGAffineTransform *)a3;
- (void)setTimingFunction:(id)a3;
- (void)setTxFunction:(id)a3;
- (void)setTyFunction:(id)a3;
@end

@implementation TUAnimationAffineTransformFunction

- (TUAnimationAffineTransformFunction)initWithTimingFunction:(id)a3 startTransform:(CGAffineTransform *)a4 endTransform:(CGAffineTransform *)a5 speed:(double)a6
{
  id v10 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUAnimationAffineTransformFunction;
  v11 = [(TUAnimationAffineTransformFunction *)&v19 init];
  if (v11)
  {
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    }
    v13 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v12;

    long long v14 = *(_OWORD *)&a4->a;
    long long v15 = *(_OWORD *)&a4->c;
    *(_OWORD *)(v11 + 104) = *(_OWORD *)&a4->tx;
    *(_OWORD *)(v11 + 88) = v15;
    *(_OWORD *)(v11 + 72) = v14;
    long long v16 = *(_OWORD *)&a5->a;
    long long v17 = *(_OWORD *)&a5->c;
    *(_OWORD *)(v11 + 152) = *(_OWORD *)&a5->tx;
    *(_OWORD *)(v11 + 136) = v17;
    *(_OWORD *)(v11 + 120) = v16;
    *((double *)v11 + 2) = a6;
    [v11 _reloadFunctions];
  }

  return (TUAnimationAffineTransformFunction *)v11;
}

- (CGAffineTransform)solveForTime:(SEL)a3
{
  id v24 = [(TUAnimationAffineTransformFunction *)self aFunction];
  [v24 solveForTime:a4];
  CGFloat v8 = v7;
  v9 = [(TUAnimationAffineTransformFunction *)self bFunction];
  [v9 solveForTime:a4];
  CGFloat v11 = v10;
  id v12 = [(TUAnimationAffineTransformFunction *)self cFunction];
  [v12 solveForTime:a4];
  CGFloat v14 = v13;
  long long v15 = [(TUAnimationAffineTransformFunction *)self dFunction];
  [v15 solveForTime:a4];
  CGFloat v17 = v16;
  v18 = [(TUAnimationAffineTransformFunction *)self txFunction];
  [v18 solveForTime:a4];
  CGFloat v20 = v19;
  v21 = [(TUAnimationAffineTransformFunction *)self tyFunction];
  [v21 solveForTime:a4];
  retstr->a = v8;
  retstr->b = v11;
  retstr->c = v14;
  retstr->d = v17;
  retstr->tx = v20;
  retstr->ty = v22;

  return result;
}

- (void)setStartValue:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_startValue.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_startValue.c = v4;
  *(_OWORD *)&self->_startValue.a = v3;
  [(TUAnimationAffineTransformFunction *)self _reloadFunctions];
}

- (void)setEndValue:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_endValue.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_endValue.c = v4;
  *(_OWORD *)&self->_endValue.a = v3;
  [(TUAnimationAffineTransformFunction *)self _reloadFunctions];
}

- (void)_reloadFunctions
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__TUAnimationAffineTransformFunction__reloadFunctions__block_invoke;
  aBlock[3] = &unk_1E6136728;
  aBlock[4] = self;
  long long v3 = (void (**)(void))_Block_copy(aBlock);
  [(TUAnimationAffineTransformFunction *)self startValue];
  [(TUAnimationAffineTransformFunction *)self endValue];
  long long v4 = v3[2](v3);
  [(TUAnimationAffineTransformFunction *)self setAFunction:v4];

  [(TUAnimationAffineTransformFunction *)self startValue];
  [(TUAnimationAffineTransformFunction *)self endValue];
  v5 = v3[2](v3);
  [(TUAnimationAffineTransformFunction *)self setBFunction:v5];

  [(TUAnimationAffineTransformFunction *)self startValue];
  [(TUAnimationAffineTransformFunction *)self endValue];
  v6 = v3[2](v3);
  [(TUAnimationAffineTransformFunction *)self setCFunction:v6];

  [(TUAnimationAffineTransformFunction *)self startValue];
  [(TUAnimationAffineTransformFunction *)self endValue];
  double v7 = v3[2](v3);
  [(TUAnimationAffineTransformFunction *)self setDFunction:v7];

  [(TUAnimationAffineTransformFunction *)self startValue];
  [(TUAnimationAffineTransformFunction *)self endValue];
  CGFloat v8 = v3[2](v3);
  [(TUAnimationAffineTransformFunction *)self setTxFunction:v8];

  [(TUAnimationAffineTransformFunction *)self startValue];
  [(TUAnimationAffineTransformFunction *)self endValue];
  v9 = v3[2](v3);
  [(TUAnimationAffineTransformFunction *)self setTyFunction:v9];
}

TUAnimationFloatFunction *__54__TUAnimationAffineTransformFunction__reloadFunctions__block_invoke(uint64_t a1, double a2, double a3)
{
  v6 = [TUAnimationFloatFunction alloc];
  double v7 = [*(id *)(a1 + 32) timingFunction];
  [*(id *)(a1 + 32) speed];
  v9 = [(TUAnimationFloatFunction *)v6 initWithTimingFunction:v7 startValue:a2 endValue:a3 speed:v8];

  return v9;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (CGAffineTransform)startValue
{
  long long v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].b;
  return self;
}

- (CGAffineTransform)endValue
{
  long long v3 = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].b;
  return self;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (TUAnimationFloatFunction)aFunction
{
  return self->_aFunction;
}

- (void)setAFunction:(id)a3
{
}

- (TUAnimationFloatFunction)bFunction
{
  return self->_bFunction;
}

- (void)setBFunction:(id)a3
{
}

- (TUAnimationFloatFunction)cFunction
{
  return self->_cFunction;
}

- (void)setCFunction:(id)a3
{
}

- (TUAnimationFloatFunction)dFunction
{
  return self->_dFunction;
}

- (void)setDFunction:(id)a3
{
}

- (TUAnimationFloatFunction)txFunction
{
  return self->_txFunction;
}

- (void)setTxFunction:(id)a3
{
}

- (TUAnimationFloatFunction)tyFunction
{
  return self->_tyFunction;
}

- (void)setTyFunction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tyFunction, 0);
  objc_storeStrong((id *)&self->_txFunction, 0);
  objc_storeStrong((id *)&self->_dFunction, 0);
  objc_storeStrong((id *)&self->_cFunction, 0);
  objc_storeStrong((id *)&self->_bFunction, 0);
  objc_storeStrong((id *)&self->_aFunction, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end