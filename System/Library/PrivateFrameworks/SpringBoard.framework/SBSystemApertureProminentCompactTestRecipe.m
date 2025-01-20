@interface SBSystemApertureProminentCompactTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBSystemApertureProminentCompactTestRecipe

- (id)title
{
  return @"Jindo Compact Prominent";
}

- (void)handleVolumeIncrease
{
  if (!self->_elementAssertion)
  {
    v3 = objc_alloc_init(SBPrototypeProminentPresentingActivityElementViewProvider);
    v4 = [(id)SBApp systemApertureControllerForMainDisplay];
    v5 = [v4 registerElement:v3];
    elementAssertion = self->_elementAssertion;
    self->_elementAssertion = v5;

    objc_initWeak(&location, v3);
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__SBSystemApertureProminentCompactTestRecipe_handleVolumeIncrease__block_invoke;
    block[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v14, &location);
    v8 = MEMORY[0x1E4F14428];
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
    objc_initWeak(&from, self);
    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__SBSystemApertureProminentCompactTestRecipe_handleVolumeIncrease__block_invoke_2;
    v10[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v11, &from);
    dispatch_after(v9, v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __66__SBSystemApertureProminentCompactTestRecipe_handleVolumeIncrease__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setProminent:0];
  [WeakRetained setShowsTrailing:1];
}

void __66__SBSystemApertureProminentCompactTestRecipe_handleVolumeIncrease__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[1] invalidateWithReason:@"timeout"];
  id v1 = WeakRetained[1];
  WeakRetained[1] = 0;
}

- (void)handleVolumeDecrease
{
  elementAssertion = self->_elementAssertion;
  if (elementAssertion)
  {
    [(SAInvalidatable *)elementAssertion invalidateWithReason:@"volume decrease"];
    v4 = self->_elementAssertion;
    self->_elementAssertion = 0;
  }
}

- (void).cxx_destruct
{
}

@end