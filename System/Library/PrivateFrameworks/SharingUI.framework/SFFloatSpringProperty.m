@interface SFFloatSpringProperty
+ (void)_withoutAnimation:(id)a3;
- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4;
- (BOOL)primed;
- (BOOL)tracking;
- (SFFloatSpringProperty)init;
- (double)projectForDeceleration:(double)a3;
- (double)projectForTime:(double)a3;
- (void)setDampingRatio:(double)a3 response:(double)a4;
- (void)setInput:(double)a3;
- (void)setOutput:(double)a3;
- (void)setPrimed:(BOOL)a3;
- (void)setTracking:(BOOL)a3;
- (void)setTrackingDampingRatio:(double)a3 response:(double)a4;
@end

@implementation SFFloatSpringProperty

- (SFFloatSpringProperty)init
{
  v3.receiver = self;
  v3.super_class = (Class)SFFloatSpringProperty;
  result = [(UIViewFloatAnimatableProperty *)&v3 init];
  if (result)
  {
    result->_dampingRatio = 0.86;
    result->_response = 0.55;
    result->_trackingDampingRatio = 0.86;
    result->_trackingResponse = 0.15;
  }
  return result;
}

- (void)setInput:(double)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x263F82E00];
  BOOL tracking = self->_tracking;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SFFloatSpringProperty_setInput___block_invoke;
  v7[3] = &unk_2644724B8;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a3;
  [v5 _animateUsingSpringBehavior:self tracking:tracking animations:v7 completion:0];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __34__SFFloatSpringProperty_setInput___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained primed] & 1) == 0)
  {
    id v4 = objc_loadWeakRetained(v2);
    [v4 presentationValue];
    double v6 = v5;
    double v7 = *(double *)(a1 + 40);
    id v8 = objc_loadWeakRetained(v2);
    [v8 presentationValue];
    if (v6 >= v7) {
      double v10 = v9 - *(double *)(a1 + 40);
    }
    else {
      double v10 = v7 - v9;
    }

    if (v10 >= 1.0) {
      goto LABEL_8;
    }
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained setPrimed:1];
  }

LABEL_8:
  double v11 = *(double *)(a1 + 40);
  id v12 = objc_loadWeakRetained(v2);
  [v12 setValue:v11];
}

- (void)setOutput:(double)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__SFFloatSpringProperty_setOutput___block_invoke;
  v3[3] = &unk_264471E70;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  +[SFFloatSpringProperty _withoutAnimation:v3];
}

uint64_t __35__SFFloatSpringProperty_setOutput___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(double *)(a1 + 40)];
}

- (void)setDampingRatio:(double)a3 response:(double)a4
{
  self->_dampingRatio = a3;
  self->_response = a4;
}

- (void)setTrackingDampingRatio:(double)a3 response:(double)a4
{
  self->_trackingDampingRatio = a3;
  self->_trackingResponse = a4;
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (a5 <= 2)
  {
    double v5 = *(double *)((char *)&self->var0 + *off_2644724F0[a5]);
    retstr->var0 = *(double *)((char *)&self->var0 + *off_2644724D8[a5]);
    retstr->var1 = v5;
  }
  return self;
}

- (double)projectForDeceleration:(double)a3
{
  [(SFFloatSpringProperty *)self output];
  double v6 = v5;
  [(UIViewFloatAnimatableProperty *)self velocity];
  return v6 + v7 / 1000.0 * a3 / (1.0 - a3);
}

- (double)projectForTime:(double)a3
{
  [(SFFloatSpringProperty *)self output];
  double v6 = v5;
  [(UIViewFloatAnimatableProperty *)self velocity];
  return v6 + v7 * a3;
}

+ (void)_withoutAnimation:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F82E00];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SFFloatSpringProperty__withoutAnimation___block_invoke;
  v6[3] = &unk_264472440;
  id v7 = v3;
  id v5 = v3;
  [v4 performWithoutAnimation:v6];
}

uint64_t __43__SFFloatSpringProperty__withoutAnimation___block_invoke(uint64_t a1)
{
  return [MEMORY[0x263F82E00] _performWithoutRetargetingAnimations:*(void *)(a1 + 32)];
}

- (BOOL)primed
{
  return self->_primed;
}

- (void)setPrimed:(BOOL)a3
{
  self->_primed = a3;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (void)setTracking:(BOOL)a3
{
  self->_BOOL tracking = a3;
}

@end