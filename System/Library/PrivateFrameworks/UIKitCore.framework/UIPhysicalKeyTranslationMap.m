@interface UIPhysicalKeyTranslationMap
@end

@implementation UIPhysicalKeyTranslationMap

void __78___UIPhysicalKeyTranslationMap_populateAllCombinationsOfModifiers_translator___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) translationMap];
  v5 = NSMapGet(v4, (const void *)(a2 + 1));

  if (!v5)
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "translationForHIDUsageCode:modifiers:", (unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "keyCode"), a2);
    if (v6)
    {
      v7 = v6;
      [*(id *)(a1 + 32) setKeyTranslation:v6 modifiers:a2];
      v6 = v7;
    }
  }
}

void __124___UIPhysicalKeyTranslationMap_areModifiers_minimalExcessOfMask_matching_translator_matchedModifierSubset_betterMatchFound___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v6 = [*(id *)(a1 + 32) keyTranslationWithModifiers:a2 translator:*(void *)(a1 + 40)];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 48)];

  if (v7)
  {
    v8.i32[0] = *(_DWORD *)(a1 + 72) | a2;
    uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.i32[0] >= *(_DWORD *)(a1 + 88))
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a3 = 1;
      v10 = *(unsigned char **)(a1 + 80);
      if (v10) {
        unsigned char *v10 = 1;
      }
    }
  }
}

@end