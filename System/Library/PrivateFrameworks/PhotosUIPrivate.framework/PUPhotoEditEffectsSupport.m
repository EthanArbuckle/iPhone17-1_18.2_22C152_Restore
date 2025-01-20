@interface PUPhotoEditEffectsSupport
+ (id)identifierForLightingType:(int64_t)a3 lightingVersion:(int64_t)a4;
+ (id)lightingEffectTypesByIdentifier;
+ (int64_t)lightingEffectTypeForIdentifier:(id)a3;
+ (void)_clearPortraitEffectsWithCompositionController:(id)a3;
+ (void)_clearStandardEffectsWithCompositionController:(id)a3;
+ (void)_clearStylesWithCompositionController:(id)a3;
+ (void)_setEffectFilterName:(id)a3 withIntensity:(double)a4 withVersion:(unint64_t)a5 forCompositionController:(id)a6;
+ (void)_setPortraitEffectEnabled:(BOOL)a3 forCompositionController:(id)a4;
+ (void)_setPortraitEffectFilterName:(id)a3 withVersion:(unint64_t)a4 forCompositionController:(id)a5 portraitInfo:(id)a6 spillMatteAllowed:(id)a7;
+ (void)_setStyleWithCast:(id)a3 tone:(double)a4 color:(double)a5 intensity:(double)a6 forCompositionController:(id)a7;
+ (void)updateCompositionController:(id)a3 withDepthEnabled:(BOOL)a4 livePortraitBehaviorController:(id)a5;
+ (void)updateCompositionController:(id)a3 withEffect:(id)a4 intensity:(double)a5 updateVersion:(BOOL)a6;
+ (void)updateCompositionController:(id)a3 withEffect:(id)a4 updateVersion:(BOOL)a5;
+ (void)updateCompositionController:(id)a3 withLightingIdentifier:(id)a4 portraitInfo:(id)a5 spillMatteAllowed:(id)a6;
+ (void)updateCompositionController:(id)a3 withStyleCast:(id)a4 tone:(double)a5 color:(double)a6 intensity:(double)a7;
@end

@implementation PUPhotoEditEffectsSupport

+ (void)_clearStylesWithCompositionController:(id)a3
{
  id v4 = a3;
  v3 = [v4 semanticStyleAdjustmentController];

  if (v3) {
    [v4 modifyAdjustmentWithKey:*MEMORY[0x1E4F8A530] modificationBlock:&__block_literal_global_50_56451];
  }
}

uint64_t __67__PUPhotoEditEffectsSupport__clearStylesWithCompositionController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resetToUnstyledOriginal];
}

+ (void)_clearPortraitEffectsWithCompositionController:(id)a3
{
  id v3 = a3;
  id v5 = [v3 adjustmentConstants];
  id v4 = [v5 PIPortraitAdjustmentKey];
  [v3 removeAdjustmentWithKey:v4];
}

+ (void)_clearStandardEffectsWithCompositionController:(id)a3
{
  id v3 = a3;
  id v6 = [v3 adjustmentConstants];
  id v4 = [v6 PIEffectAdjustmentKey];
  [v3 removeAdjustmentWithKey:v4];

  id v5 = [v6 PIEffect3DAdjustmentKey];
  [v3 removeAdjustmentWithKey:v5];
}

+ (void)_setStyleWithCast:(id)a3 tone:(double)a4 color:(double)a5 intensity:(double)a6 forCompositionController:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  [a1 _clearPortraitEffectsWithCompositionController:v13];
  [a1 _clearStandardEffectsWithCompositionController:v13];
  uint64_t v14 = *MEMORY[0x1E4F8A530];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__PUPhotoEditEffectsSupport__setStyleWithCast_tone_color_intensity_forCompositionController___block_invoke;
  v16[3] = &unk_1E5F28A78;
  id v17 = v12;
  double v18 = a4;
  double v19 = a5;
  double v20 = a6;
  id v15 = v12;
  [v13 modifyAdjustmentWithKey:v14 modificationBlock:v16];
}

void __93__PUPhotoEditEffectsSupport__setStyleWithCast_tone_color_intensity_forCompositionController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEnabled:1];
  [v3 setCast:*(void *)(a1 + 32)];
  [v3 setTone:*(double *)(a1 + 40)];
  [v3 setColor:*(double *)(a1 + 48)];
  [v3 setIntensity:*(double *)(a1 + 56)];
}

+ (void)_setPortraitEffectEnabled:(BOOL)a3 forCompositionController:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 portraitAdjustmentController];
  v7 = (void *)v6;
  if (a3 || v6)
  {
    v8 = [v5 adjustmentConstants];
    v9 = [v8 PIPortraitAdjustmentKey];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__PUPhotoEditEffectsSupport__setPortraitEffectEnabled_forCompositionController___block_invoke;
    v10[3] = &__block_descriptor_33_e32_v16__0__PIAdjustmentController_8l;
    BOOL v11 = a3;
    [v5 modifyAdjustmentWithKey:v9 modificationBlock:v10];
  }
}

uint64_t __80__PUPhotoEditEffectsSupport__setPortraitEffectEnabled_forCompositionController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnabled:*(unsigned __int8 *)(a1 + 32)];
}

+ (void)_setPortraitEffectFilterName:(id)a3 withVersion:(unint64_t)a4 forCompositionController:(id)a5 portraitInfo:(id)a6 spillMatteAllowed:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  if (v12)
  {
    [a1 _clearStandardEffectsWithCompositionController:v15];
    [a1 _clearStylesWithCompositionController:v15];
    v16 = [v15 adjustmentConstants];
    id v17 = [v16 PIPortraitAdjustmentKey];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __126__PUPhotoEditEffectsSupport__setPortraitEffectFilterName_withVersion_forCompositionController_portraitInfo_spillMatteAllowed___block_invoke;
    v18[3] = &unk_1E5F28A50;
    id v19 = v12;
    id v20 = v13;
    id v21 = v14;
    unint64_t v22 = a4;
    [v15 modifyAdjustmentWithKey:v17 modificationBlock:v18];

    id v15 = v19;
  }
  else
  {
    [a1 _clearPortraitEffectsWithCompositionController:v15];
  }
}

void __126__PUPhotoEditEffectsSupport__setPortraitEffectFilterName_withVersion_forCompositionController_portraitInfo_spillMatteAllowed___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  [v3 setKind:a1[4]];
  [v3 setPortraitInfo:a1[5]];
  [v3 setSpillMatteAllowed:a1[6]];
  if (a1[7] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v3, "setVersion:");
  }
}

+ (void)_setEffectFilterName:(id)a3 withIntensity:(double)a4 withVersion:(unint64_t)a5 forCompositionController:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (void *)[v11 copy];
  [a1 _clearPortraitEffectsWithCompositionController:v12];
  [a1 _clearStylesWithCompositionController:v11];
  int v13 = [v10 isEqualToString:*MEMORY[0x1E4F8B1E8]];
  if (!v10 || v13)
  {
    [a1 _clearStandardEffectsWithCompositionController:v12];
  }
  else
  {
    int v14 = [MEMORY[0x1E4F8A358] is3DEffect:v10];
    id v15 = [v12 adjustmentConstants];
    v16 = [v15 PIEffectAdjustmentKey];
    id v17 = [v15 PIEffect3DAdjustmentKey];
    if (v14)
    {
      uint64_t v18 = [v15 PIEffect3DAdjustmentKey];

      uint64_t v19 = [v15 PIEffectAdjustmentKey];

      v16 = (void *)v18;
      id v17 = (void *)v19;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __101__PUPhotoEditEffectsSupport__setEffectFilterName_withIntensity_withVersion_forCompositionController___block_invoke;
    v20[3] = &unk_1E5F28A28;
    id v21 = v10;
    unint64_t v22 = a5;
    double v23 = a4;
    [v12 modifyAdjustmentWithKey:v16 modificationBlock:v20];
    [v12 removeAdjustmentWithKey:v17];
  }
  [v11 applyChangesFromCompositionController:v12];
}

void __101__PUPhotoEditEffectsSupport__setEffectFilterName_withIntensity_withVersion_forCompositionController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F8A358] effectNameForFilterName:*(void *)(a1 + 32)];
  id v5 = v3;
  [v5 setKind:v4];
  if (*(void *)(a1 + 40) != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v5, "setVersion:");
  }
  [v5 setIntensity:*(double *)(a1 + 48)];
  [v5 setEnabled:1];
}

+ (void)updateCompositionController:(id)a3 withStyleCast:(id)a4 tone:(double)a5 color:(double)a6 intensity:(double)a7
{
}

+ (id)identifierForLightingType:(int64_t)a3 lightingVersion:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = +[PUPhotoEditEffectsSupport lightingEffectTypesByIdentifier];
  v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (+[PUPhotoEditEffectsSupport lightingEffectTypeForIdentifier:v13] == a3)
        {
          int v14 = [MEMORY[0x1E4F8AA70] effectWithIdentifier:v13];
          int64_t v15 = [v14 lightingVersion];
          if (v15 <= a4 && v15 >= [v10 lightingVersion])
          {
            id v16 = v14;

            id v10 = v16;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  id v17 = [v10 filterIdentifier];

  return v17;
}

+ (int64_t)lightingEffectTypeForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 lightingEffectTypesByIdentifier];
  uint64_t v6 = [v5 objectForKey:v4];

  int64_t v7 = [v6 integerValue];
  return v7;
}

+ (id)lightingEffectTypesByIdentifier
{
  pl_dispatch_once();
  v2 = (void *)lightingEffectTypesByIdentifier_typeMap;
  return v2;
}

void __60__PUPhotoEditEffectsSupport_lightingEffectTypesByIdentifier__block_invoke()
{
  v8[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F8B1F0];
  v7[0] = *MEMORY[0x1E4F8B210];
  v7[1] = v0;
  v8[0] = &unk_1F078C8A8;
  v8[1] = &unk_1F078C8C0;
  uint64_t v1 = *MEMORY[0x1E4F8B200];
  v7[2] = *MEMORY[0x1E4F8B1F8];
  v7[3] = v1;
  v8[2] = &unk_1F078C8C0;
  v8[3] = &unk_1F078C8D8;
  uint64_t v2 = *MEMORY[0x1E4F8B1D0];
  v7[4] = *MEMORY[0x1E4F8B208];
  v7[5] = v2;
  v8[4] = &unk_1F078C8D8;
  v8[5] = &unk_1F078C8F0;
  uint64_t v3 = *MEMORY[0x1E4F8B218];
  v7[6] = *MEMORY[0x1E4F8B1D8];
  v7[7] = v3;
  v8[6] = &unk_1F078C8F0;
  v8[7] = &unk_1F078C908;
  uint64_t v4 = *MEMORY[0x1E4F8B1E0];
  v7[8] = *MEMORY[0x1E4F8B220];
  v7[9] = v4;
  v8[8] = &unk_1F078C908;
  v8[9] = &unk_1F078C920;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:10];
  uint64_t v6 = (void *)lightingEffectTypesByIdentifier_typeMap;
  lightingEffectTypesByIdentifier_typeMap = v5;
}

+ (void)updateCompositionController:(id)a3 withLightingIdentifier:(id)a4 portraitInfo:(id)a5 spillMatteAllowed:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F8AA70];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v17 = [v10 effectWithIdentifier:a4];
  int v14 = [v17 filterIdentifier];
  if ([v14 isEqualToString:*MEMORY[0x1E4F8B1E0]])
  {

    uint64_t v15 = 0;
    int v14 = 0;
  }
  else
  {
    if (v14)
    {
      uint64_t v16 = [v17 latestVersion];
      uint64_t v15 = 1;
      goto LABEL_7;
    }
    uint64_t v15 = 0;
  }
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_7:
  [a1 _setPortraitEffectEnabled:v15 forCompositionController:v13];
  [a1 _setPortraitEffectFilterName:v14 withVersion:v16 forCompositionController:v13 portraitInfo:v12 spillMatteAllowed:v11];
}

+ (void)updateCompositionController:(id)a3 withEffect:(id)a4 intensity:(double)a5 updateVersion:(BOOL)a6
{
  BOOL v6 = a6;
  id v15 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v6) {
    uint64_t v12 = [v10 latestVersion];
  }
  else {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([v11 isPortrait])
  {
    id v13 = [v11 filterIdentifier];
    [a1 _setPortraitEffectFilterName:v13 withVersion:v12 forCompositionController:v15 portraitInfo:0 spillMatteAllowed:0];

    [a1 _setPortraitEffectEnabled:1 forCompositionController:v15];
  }
  else
  {
    int v14 = [v11 CIFilterName];
    [a1 _setEffectFilterName:v14 withIntensity:v12 withVersion:v15 forCompositionController:a5];
  }
}

+ (void)updateCompositionController:(id)a3 withEffect:(id)a4 updateVersion:(BOOL)a5
{
}

+ (void)updateCompositionController:(id)a3 withDepthEnabled:(BOOL)a4 livePortraitBehaviorController:(id)a5
{
  id v7 = a3;
  id v18 = a5;
  uint64_t v8 = [v7 adjustmentConstants];
  uint64_t v9 = [v7 compositionKeys];
  id v10 = [v8 PIDepthAdjustmentKey];
  if (a4 || [v9 containsObject:v10])
  {
    id v11 = (void *)[v7 copy];
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __105__PUPhotoEditEffectsSupport_updateCompositionController_withDepthEnabled_livePortraitBehaviorController___block_invoke;
    v21[3] = &unk_1E5F289E0;
    v21[4] = &v23;
    BOOL v22 = a4;
    [v11 modifyAdjustmentWithKey:v10 modificationBlock:v21];
    uint64_t v12 = [v8 PIPortraitAdjustmentKey];
    if ([v9 containsObject:v12])
    {
      id v13 = [v11 portraitAdjustmentController];
      int v14 = [v13 kind];
      int v15 = [v14 isEqualToString:@"Light"];

      if (v15)
      {
        [v11 removeAdjustmentWithKey:v12];
      }
      else
      {
        uint64_t v16 = +[PUPhotoEditProtoSettings sharedInstance];
        int v17 = [v16 apertureSliderHasOffPosition];

        if ((v17 & 1) == 0)
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __105__PUPhotoEditEffectsSupport_updateCompositionController_withDepthEnabled_livePortraitBehaviorController___block_invoke_2;
          v19[3] = &__block_descriptor_33_e32_v16__0__PIAdjustmentController_8l;
          BOOL v20 = a4;
          [v11 modifyAdjustmentWithKey:v12 modificationBlock:v19];
        }
      }
    }
    if (v18 && *((unsigned char *)v24 + 24)) {
      [v18 applySideEffectsForAction:0 compositionController:v11];
    }
    [v7 applyChangesFromCompositionController:v11];

    _Block_object_dispose(&v23, 8);
  }
}

void __105__PUPhotoEditEffectsSupport_updateCompositionController_withDepthEnabled_livePortraitBehaviorController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LOBYTE(v4) = *(unsigned char *)(a1 + 40);
  id v5 = v3;
  if ((_BYTE)v4) {
    int v4 = [v3 enabled] ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  [v5 setEnabled:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __105__PUPhotoEditEffectsSupport_updateCompositionController_withDepthEnabled_livePortraitBehaviorController___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setEnabled:*(unsigned __int8 *)(a1 + 32)];
}

@end