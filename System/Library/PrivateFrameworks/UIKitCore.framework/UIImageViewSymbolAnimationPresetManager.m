@interface UIImageViewSymbolAnimationPresetManager
@end

@implementation UIImageViewSymbolAnimationPresetManager

uint64_t __74___UIImageViewSymbolAnimationPresetManager_activeSymbolEffectDidComplete___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 symbolEffect];
  v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqual:v6];
    }
  }

  return v8;
}

uint64_t __118___UIImageViewSymbolAnimationPresetManager__removeSymbolEffectsOfType_options_animated_completion_forAddingNewEffect___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [a2 symbolEffect];
  uint64_t v5 = [v3 _symbolEffect:v4 collidesWithSymbolEffect:*(void *)(a1 + 40) forAddingEffect:*(unsigned __int8 *)(a1 + 48)];

  return v5;
}

uint64_t __118___UIImageViewSymbolAnimationPresetManager__removeSymbolEffectsOfType_options_animated_completion_forAddingNewEffect___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [a2 symbolEffect];
  uint64_t v5 = [v3 _symbolEffect:v4 collidesWithSymbolEffect:*(void *)(a1 + 40) forAddingEffect:*(unsigned __int8 *)(a1 + 48)];

  return v5;
}

@end