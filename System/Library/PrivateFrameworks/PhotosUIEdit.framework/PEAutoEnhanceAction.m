@interface PEAutoEnhanceAction
- (int64_t)actionType;
- (void)applyToLoadResult:(id)a3 completion:(id)a4;
@end

@implementation PEAutoEnhanceAction

- (int64_t)actionType
{
  return 5;
}

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = [a3 compositionController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__PEAutoEnhanceAction_applyToLoadResult_completion___block_invoke;
  v8[3] = &unk_2642BF340;
  id v9 = v5;
  id v7 = v5;
  +[PEAutoEnhanceActionHelper applyAutoEnhance:v6 replacesAffectedAdjustments:1 useCompositionIntensity:0 completion:v8];
}

uint64_t __52__PEAutoEnhanceAction_applyToLoadResult_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end