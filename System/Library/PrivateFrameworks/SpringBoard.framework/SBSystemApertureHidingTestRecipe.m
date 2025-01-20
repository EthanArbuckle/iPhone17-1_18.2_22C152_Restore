@interface SBSystemApertureHidingTestRecipe
- (SBSystemApertureHidingTestRecipe)init;
- (id)title;
- (void)_applyAlpha;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBSystemApertureHidingTestRecipe

- (SBSystemApertureHidingTestRecipe)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSystemApertureHidingTestRecipe;
  v2 = [(SBSystemApertureHidingTestRecipe *)&v6 init];
  v3 = v2;
  if (v2)
  {
    alphaValues = v2->_alphaValues;
    v2->_alphaValues = (NSArray *)&unk_1F3348558;

    v3->_currentAlphaIndex = [(NSArray *)v3->_alphaValues count] - 1;
  }
  return v3;
}

- (id)title
{
  return @"Jindo Hiding";
}

- (void)_applyAlpha
{
  v3 = [(id)SBApp systemApertureControllerForMainDisplay];
  v4 = [v3 valueForKey:@"_systemApertureViewController"];

  v5 = (void *)MEMORY[0x1E4F42FF0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SBSystemApertureHidingTestRecipe__applyAlpha__block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 animateWithDuration:v7 animations:0.2];
}

void __47__SBSystemApertureHidingTestRecipe__applyAlpha__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:*(void *)(*(void *)(a1 + 32) + 16)];
  [v2 floatValue];
  double v4 = v3;

  id v5 = [*(id *)(a1 + 40) view];
  [v5 setAlpha:v4];
}

- (void)handleVolumeIncrease
{
  unint64_t v3 = [(NSArray *)self->_alphaValues count] - 1;
  int64_t currentAlphaIndex = self->_currentAlphaIndex;
  if (v3 >= currentAlphaIndex + 1) {
    unint64_t v3 = currentAlphaIndex + 1;
  }
  self->_int64_t currentAlphaIndex = v3;
  [(SBSystemApertureHidingTestRecipe *)self _applyAlpha];
}

- (void)handleVolumeDecrease
{
  int64_t currentAlphaIndex = self->_currentAlphaIndex;
  if (currentAlphaIndex <= 1) {
    int64_t currentAlphaIndex = 1;
  }
  self->_int64_t currentAlphaIndex = currentAlphaIndex - 1;
  [(SBSystemApertureHidingTestRecipe *)self _applyAlpha];
}

- (void).cxx_destruct
{
}

@end