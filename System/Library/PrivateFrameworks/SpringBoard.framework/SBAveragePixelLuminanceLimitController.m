@interface SBAveragePixelLuminanceLimitController
- (BOOL)areAplLimitsEnabled;
- (BOOL)isGlobalFilter;
- (UIView)targetView;
- (id)_targetLayer;
- (void)_addFilter;
- (void)_removeFilter;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setAplLimitsEnabled:(BOOL)a3;
- (void)setGlobalFilter:(BOOL)a3;
- (void)setTargetView:(id)a3;
@end

@implementation SBAveragePixelLuminanceLimitController

- (void)setAplLimitsEnabled:(BOOL)a3
{
  if (self->_aplLimitsEnabled != a3)
  {
    self->_aplLimitsEnabled = a3;
    v4 = [(SBAveragePixelLuminanceLimitController *)self _targetLayer];
    if (v4)
    {
      double v5 = CACurrentMediaTime();
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F42FF0] inheritedAnimationDuration];
      double v7 = v6;
      v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.averagePixelLuminanceLimit.inputScale"];
      v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v8 setTimingFunction:v9];

      [v4 convertTime:0 fromLayer:v5];
      objc_msgSend(v8, "setBeginTime:");
      [v8 setDuration:v7];
      [v8 setFillMode:*MEMORY[0x1E4F39F98]];
      if (self->_aplLimitsEnabled)
      {
        [(SBAveragePixelLuminanceLimitController *)self _addFilter];
        [v4 setValue:&unk_1F3348CC8 forKeyPath:@"filters.averagePixelLuminanceLimit.inputScale"];
        [v8 setFromValue:&unk_1F3348CD8];
        [v8 setToValue:&unk_1F3348CC8];
      }
      else
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __62__SBAveragePixelLuminanceLimitController_setAplLimitsEnabled___block_invoke;
        v12[3] = &unk_1E6AF4AC0;
        v12[4] = self;
        v10 = (void *)MEMORY[0x1D948C7A0](v12);
        [v4 setValue:&unk_1F3348CD8 forKeyPath:@"filters.averagePixelLuminanceLimit.inputScale"];
        [v8 setFromValue:&unk_1F3348CC8];
        [v8 setToValue:&unk_1F3348CD8];
        v11 = (void *)[v10 copy];
        [v8 setValue:v11 forKey:@"SBAPLFilterAnimationCompletionKey"];

        [v8 setDelegate:self];
      }
      [v4 removeAnimationForKey:@"aplFilter"];
      [v4 addAnimation:v8 forKey:@"aplFilter"];
      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

uint64_t __62__SBAveragePixelLuminanceLimitController_setAplLimitsEnabled___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) areAplLimitsEnabled];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 _removeFilter];
  }
  return result;
}

- (id)_targetLayer
{
  v3 = [(SBAveragePixelLuminanceLimitController *)self targetView];
  v4 = [v3 layer];

  if ([(SBAveragePixelLuminanceLimitController *)self isGlobalFilter])
  {
    double v5 = [v4 context];
    uint64_t v6 = [v5 layer];

    v4 = (void *)v6;
  }
  return v4;
}

- (void)_addFilter
{
  id v14 = [(SBAveragePixelLuminanceLimitController *)self _targetLayer];
  v3 = [v14 valueForKeyPath:@"filters.averagePixelLuminanceLimit"];
  if (!v3
    || ([MEMORY[0x1E4F1CA98] null],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqual:v3],
        v4,
        v5))
  {
    uint64_t v6 = +[SBAlwaysOnDomain rootSettings];
    double v7 = [v6 aplSettings];

    v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A230]];
    [v8 setName:@"averagePixelLuminanceLimit"];
    v9 = NSNumber;
    [v7 overallAPLLimit];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    [v8 setValue:v10 forKeyPath:*MEMORY[0x1E4F3A100]];

    objc_msgSend(v8, "setAccessibility:", -[SBAveragePixelLuminanceLimitController isGlobalFilter](self, "isGlobalFilter"));
    v11 = [v14 filters];
    v12 = v11;
    if (!v11) {
      v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v13 = [v11 arrayByAddingObject:v8];
    [v14 setFilters:v13];
  }
}

- (void)_removeFilter
{
  id v6 = [(SBAveragePixelLuminanceLimitController *)self _targetLayer];
  v2 = [v6 valueForKeyPath:@"filters.averagePixelLuminanceLimit"];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
    char v4 = [v3 isEqual:v2];

    if ((v4 & 1) == 0)
    {
      int v5 = [v6 mutableArrayValueForKeyPath:@"filters"];
      [v5 removeObject:v2];
    }
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  objc_msgSend(a3, "valueForKey:", @"SBAPLFilterAnimationCompletionKey", a4);
  char v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    int v5 = v4;
    v4[2]();
    char v4 = v5;
  }
}

- (BOOL)isGlobalFilter
{
  return self->_globalFilter;
}

- (void)setGlobalFilter:(BOOL)a3
{
  self->_globalFilter = a3;
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  return (UIView *)WeakRetained;
}

- (void)setTargetView:(id)a3
{
}

- (BOOL)areAplLimitsEnabled
{
  return self->_aplLimitsEnabled;
}

- (void).cxx_destruct
{
}

@end