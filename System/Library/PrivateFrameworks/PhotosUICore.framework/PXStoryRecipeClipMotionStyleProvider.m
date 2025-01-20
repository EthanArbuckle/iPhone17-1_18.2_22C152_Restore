@interface PXStoryRecipeClipMotionStyleProvider
- ($BE932F7424ADCBB9629B4717D8D69A02)nextMotionInfoForDisplayAssetCount:(SEL)a3 displayAssets:(int64_t)a4;
- ($BE932F7424ADCBB9629B4717D8D69A02)nextMotionInfoForDisplayAssetCount:(SEL)a3 displayAssets:(int64_t)a4 excluding:(id)a5;
- ($BE932F7424ADCBB9629B4717D8D69A02)nextMotionInfoForModuleExcludingMomentMotion:(SEL)a3 previousModuleMotion:(int64_t)a4 displayAssets:(int64_t)a5;
- ($BE932F7424ADCBB9629B4717D8D69A02)updatedMotionForPortraitAspectAsset:(SEL)a3 motionInfo:(id)a4;
- (PFStoryAutoEditConfiguration)configuration;
- (PXStoryConfiguration)storyConfiguration;
- (PXStoryRecipeClipMotionStyleProvider)init;
- (PXStoryRecipeClipMotionStyleProvider)initWithConfiguration:(id)a3 colorGradeCategory:(id)a4 songPace:(int64_t)a5 randomNumberGenerator:(id)a6 storyConfiguration:(id)a7;
- (int64_t)_nextMotionStyleForDisplayAssetCount:(int64_t)a3 excluding:(id)a4;
- (void)provideMotionStylesForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 usingBlock:(id)a5;
@end

@implementation PXStoryRecipeClipMotionStyleProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_triptychFrequencyTable, 0);
  objc_storeStrong((id *)&self->_diptychFrequencyTable, 0);
  objc_storeStrong((id *)&self->_frequencyTable, 0);
}

- (PXStoryConfiguration)storyConfiguration
{
  return self->_storyConfiguration;
}

- (PFStoryAutoEditConfiguration)configuration
{
  return self->_configuration;
}

- (void)provideMotionStylesForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 usingBlock:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v57 = a4;
  v9 = a5;
  v10 = +[PXStorySettings sharedInstance];
  uint64_t v53 = [v10 autoEditRotateMotionMax];

  v66[0] = 0uLL;
  long long v65 = 0uLL;
  NSUInteger v49 = length;
  NSUInteger v50 = location;
  long long v64 = 0uLL;
  BOOL v11 = __CFADD__(length - 1, location);
  NSUInteger v12 = length - 1 + location;
  if (!v11)
  {
    SEL v48 = a2;
    uint64_t v13 = 0;
    uint64_t v51 = 0;
    uint64_t v55 = 0;
    NSUInteger v14 = v50;
    while (1)
    {
      v15 = [v57 clipAtIndex:v14];
      v16 = [v15 displayAssets];
      uint64_t v17 = [v16 count];

      if (v17 == 3)
      {
        if ((unint64_t)(v13 - 1) >= 3)
        {
          v20 = [v15 displayAssets];
          [(PXStoryRecipeClipMotionStyleProvider *)self nextMotionInfoForDisplayAssetCount:3 displayAssets:v20];
          uint64_t v18 = *(void *)v63;
          long long v64 = *(_OWORD *)&v63[8];
          v19 = &v64;
          uint64_t v13 = *(void *)v63;
LABEL_19:

          goto LABEL_20;
        }
        v19 = &v64;
        uint64_t v18 = v13;
      }
      else if (v17 == 2)
      {
        uint64_t v18 = v51;
        if ((unint64_t)(v51 - 1) >= 3)
        {
          v20 = [v15 displayAssets];
          [(PXStoryRecipeClipMotionStyleProvider *)self nextMotionInfoForDisplayAssetCount:2 displayAssets:v20];
          uint64_t v18 = *(void *)v63;
          long long v65 = *(_OWORD *)&v63[8];
          v19 = &v65;
          uint64_t v51 = *(void *)v63;
          goto LABEL_19;
        }
        v19 = &v65;
      }
      else
      {
        uint64_t v18 = v55;
        if (v17 != 1)
        {
          v46 = [MEMORY[0x1E4F28B00] currentHandler];
          v47 = [v15 displayAssets];
          objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v48, self, @"PXStoryRecipeClipMotionStyleProvider.m", 295, @"Invalid number of display assets (%ld) in clip", objc_msgSend(v47, "count"));

          abort();
        }
        if ((unint64_t)(v55 - 1) >= 3)
        {
          if (+[PXStoryRecipeClipUtilities canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:](PXStoryRecipeClipUtilities, "canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:", v50, v49, v57, v53))
          {
            v20 = [v15 displayAssets];
            [(PXStoryRecipeClipMotionStyleProvider *)self nextMotionInfoForDisplayAssetCount:1 displayAssets:v20];
            uint64_t v18 = *(void *)v63;
            v66[0] = *(_OWORD *)&v63[8];
          }
          else
          {
            v20 = [v15 displayAssets];
            v21 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F02D5998];
            [(PXStoryRecipeClipMotionStyleProvider *)self nextMotionInfoForDisplayAssetCount:1 displayAssets:v20 excluding:v21];
            uint64_t v18 = *(void *)v63;
            v66[0] = *(_OWORD *)&v63[8];
          }
          v19 = v66;
          uint64_t v55 = v18;
          goto LABEL_19;
        }
        v19 = v66;
      }
LABEL_20:
      long long v58 = *v19;
      v22 = (void (*)(void *, unsigned char *, NSUInteger))v9[2];
      *(void *)v63 = v18;
      *(_OWORD *)&v63[8] = v58;
      v22(v9, v63, v14);

      if (++v14 > v12)
      {
        uint64_t v23 = 0;
        NSUInteger v24 = v50;
        while (1)
        {
          NSUInteger v25 = v24 + 1;
          v26 = [v57 clipAtIndex:v24];
          v27 = [v26 displayAssets];
          uint64_t v28 = [v27 count];

          if (v28 == 1)
          {
            [v26 moduleInfo];
            if (v29) {
              break;
            }
          }
LABEL_43:

          NSUInteger v24 = v25;
          if (v25 > v12) {
            goto LABEL_3;
          }
        }
        uint64_t v52 = v23;
        v30 = [v57 clipAtIndex:v24];
        uint64_t v31 = [v30 moduleInfo];
        NSUInteger v25 = v24;
        uint64_t v32 = v55;
        while (1)
        {
          uint64_t v33 = [v30 moduleInfo];
          if (v25 > v12 || v33 != v31) {
            break;
          }
          if (++v25 <= v12)
          {
            v34 = [v57 clipAtIndex:v25];
          }
          else
          {
            v34 = 0;
          }

          [v34 moduleInfo];
          v30 = v34;
          if (v35) {
            goto LABEL_33;
          }
        }
        v34 = v30;
LABEL_33:
        if ((unint64_t)(v55 - 1) >= 3)
        {
          if (+[PXStoryRecipeClipUtilities canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:](PXStoryRecipeClipUtilities, "canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:", v24, v25 - v24, v57, v53))
          {
            v36 = [v26 displayAssets];
            [(PXStoryRecipeClipMotionStyleProvider *)self nextMotionInfoForDisplayAssetCount:1 displayAssets:v36];
            uint64_t v32 = *(void *)v63;
            v66[0] = *(_OWORD *)&v63[8];
          }
          else
          {
            v36 = [v26 displayAssets];
            v37 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F02D5998];
            [(PXStoryRecipeClipMotionStyleProvider *)self nextMotionInfoForDisplayAssetCount:1 displayAssets:v36 excluding:v37];
            uint64_t v56 = *(void *)v63;
            v66[0] = *(_OWORD *)&v63[8];

            uint64_t v32 = v56;
          }
        }
        uint64_t v55 = v32;
        if (+[PXStoryRecipeClipUtilities canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:](PXStoryRecipeClipUtilities, "canRotate1UpClipsInRange:clipCatalog:maxAdjacent1Ups:", v24, v25 - v24, v57, v53))
        {
          uint64_t v38 = v32;
          uint64_t v39 = v52;
        }
        else
        {
          uint64_t v38 = v32;
          uint64_t v39 = 3;
          if ((unint64_t)(v52 - 1) <= 2 && v24 != v50)
          {
            if (v52 == 3)
            {
              uint64_t v38 = v55;
            }
            else
            {
              uint64_t v38 = v55;
              if (v55 != 3)
              {
                v42 = [v57 clipAtIndex:v24 - 1];
                v43 = [v42 displayAssets];
                unint64_t v44 = [v43 count];

                if (v44 <= 1)
                {
                  uint64_t v38 = v55;
                  if (v42)
                  {
                    [v42 motionInfo];
                    uint64_t v45 = v60;
                  }
                  else
                  {
                    uint64_t v45 = 0;
                    uint64_t v60 = 0;
                    uint64_t v61 = 0;
                    uint64_t v62 = 0;
                  }
                  if (v45 == v55)
                  {
                    uint64_t v38 = 3;
                    uint64_t v39 = v52;
                  }
                  else
                  {
                    uint64_t v39 = 3;
                  }
                }
                else
                {
                  uint64_t v38 = v55;
                  uint64_t v39 = 3;
                }

                goto LABEL_40;
              }
            }
            uint64_t v39 = v52;
          }
        }
LABEL_40:
        memset(v63, 0, sizeof(v63));
        v40 = [v26 displayAssets];
        [(PXStoryRecipeClipMotionStyleProvider *)self nextMotionInfoForModuleExcludingMomentMotion:v38 previousModuleMotion:v39 displayAssets:v40];

        if (v25 > v24)
        {
          do
          {
            v41 = (void (*)(void *, long long *, NSUInteger))v9[2];
            long long v58 = *(_OWORD *)v63;
            uint64_t v59 = *(void *)&v63[16];
            v41(v9, &v58, v24++);
          }
          while (v25 != v24);
        }
        uint64_t v23 = *(void *)v63;

        goto LABEL_43;
      }
    }
  }
LABEL_3:
}

- ($BE932F7424ADCBB9629B4717D8D69A02)nextMotionInfoForModuleExcludingMomentMotion:(SEL)a3 previousModuleMotion:(int64_t)a4 displayAssets:(int64_t)a5
{
  id v10 = a6;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3810000000;
  uint64_t v23 = &unk_1AB5D584F;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke;
  aBlock[3] = &unk_1E5DAFBA8;
  v19 = &v20;
  aBlock[4] = self;
  id v11 = v10;
  id v18 = v11;
  NSUInteger v12 = (void (**)(void *, int64_t, int64_t))_Block_copy(aBlock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke_3;
  v16[3] = &unk_1E5DAFBD0;
  v16[4] = &v20;
  uint64_t v13 = (uint64_t (**)(void))_Block_copy(v16);
  v12[2](v12, a4, a5);
  if ((v13[2](v13) & 1) == 0) {
    v12[2](v12, a4, 0);
  }
  if ((v13[2](v13) & 1) == 0) {
    v12[2](v12, 0, 0);
  }
  NSUInteger v14 = v21;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v21 + 2);
  retstr->var1.var0.var1 = v14[6];

  _Block_object_dispose(&v20, 8);
  return result;
}

void __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke_2;
  aBlock[3] = &unk_1E5DCF720;
  id v13 = v6;
  id v7 = v6;
  v8 = (void (**)(void *, void))_Block_copy(aBlock);
  v8[2](v8, a2);
  v8[2](v8, a3);
  [*(id *)(a1 + 32) nextMotionInfoForDisplayAssetCount:1 displayAssets:*(void *)(a1 + 40) excluding:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  *(_OWORD *)(v9 + 32) = v10;
  *(void *)(v9 + 48) = v11;
}

BOOL __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke_3(uint64_t a1)
{
  return (unint64_t)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) - 1) < 3;
}

void __120__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForModuleExcludingMomentMotion_previousModuleMotion_displayAssets___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    id v3 = [NSNumber numberWithInteger:a2];
    [v2 addObject:v3];
  }
}

- ($BE932F7424ADCBB9629B4717D8D69A02)nextMotionInfoForDisplayAssetCount:(SEL)a3 displayAssets:(int64_t)a4
{
  return [(PXStoryRecipeClipMotionStyleProvider *)self nextMotionInfoForDisplayAssetCount:a4 displayAssets:a5 excluding:0];
}

- ($BE932F7424ADCBB9629B4717D8D69A02)updatedMotionForPortraitAspectAsset:(SEL)a3 motionInfo:(id)a4
{
  id v10 = a4;
  v8 = [(PXStoryRecipeClipMotionStyleProvider *)self storyConfiguration];
  if ([v8 forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset])
  {
    [v10 aspectRatio];
    PXAspectRatioIsPortrait();
  }

  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
  retstr->var1.var0.var1 = a5->var1.var0.var1;

  return result;
}

- ($BE932F7424ADCBB9629B4717D8D69A02)nextMotionInfoForDisplayAssetCount:(SEL)a3 displayAssets:(int64_t)a4 excluding:(id)a5
{
  id v11 = a5;
  id v12 = a6;
  retstr->var1.var0.var0 = 0;
  retstr->var1.var0.var1 = 0;
  retstr->var0 = 0;
  id v13 = [(PXStoryRecipeClipMotionStyleProvider *)self storyConfiguration];
  uint64_t v14 = [v13 disabledClipMotionStyles];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9861;
  uint64_t v31 = __Block_byref_object_dispose__9862;
  id v32 = (id)[v12 mutableCopy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForDisplayAssetCount_displayAssets_excluding___block_invoke;
  aBlock[3] = &unk_1E5DAFB80;
  void aBlock[4] = &v27;
  void aBlock[5] = v14;
  v15 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  v15[2](v15, 1, 1);
  v15[2](v15, 2, 2);
  v15[2](v15, 4, 3);
  int64_t v16 = [(PXStoryRecipeClipMotionStyleProvider *)self _nextMotionStyleForDisplayAssetCount:a4 excluding:v28[5]];
  retstr->var0 = v16;
  if (v16 == 3)
  {
    retstr->var1.var0.var0 = [(PFRandomNumberGenerator *)self->_randomNumberGenerator nextUnsignedIntegerLessThan:2]+ 1;
    goto LABEL_18;
  }
  if (v16 != 2)
  {
    if (v16 != 1) {
      goto LABEL_18;
    }
    if (a4 == 2)
    {
      if ((unint64_t)[(PFRandomNumberGenerator *)self->_randomNumberGenerator nextUnsignedIntegerLessThan:3] >= 3)
      {
        uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a3 object:self file:@"PXStoryRecipeClipMotionStyleProvider.m" lineNumber:133 description:@"Impossible case"];

        abort();
      }
    }
    else if (a4 != 3)
    {
      unint64_t v17 = 1;
LABEL_17:
      retstr->var1.var0.var0 = v17;
      retstr->var1.var0.var1 = 2;
      goto LABEL_18;
    }
    uint64_t v22 = [(PFRandomNumberGenerator *)self->_randomNumberGenerator nextUnsignedIntegerLessThan:2];
    unint64_t v17 = 3;
    if (v22) {
      unint64_t v17 = 4;
    }
    goto LABEL_17;
  }
  unint64_t v18 = [v13 forcedKenBurnsScaleDirection];
  if (!v18)
  {
    uint64_t v19 = [v13 keyAssetKenBurnsScaleDirection];
    if (a4 != 1) {
      goto LABEL_11;
    }
    unint64_t v18 = v19;
    if (!v19
      || ([v11 firstObject],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          [v13 keyAsset],
          v21 = objc_claimAutoreleasedReturnValue(),
          char v25 = [v20 isEqual:v21],
          v21,
          v20,
          (v25 & 1) == 0))
    {
LABEL_11:
      unint64_t v18 = [(PFRandomNumberGenerator *)self->_randomNumberGenerator nextUnsignedIntegerLessThan:2]+ 1;
    }
  }
  retstr->var1.var0.var0 = v18;
LABEL_18:
  if (a4 == 1)
  {
    [v11 firstObject];
    [(id)objc_claimAutoreleasedReturnValue() aspectRatio];
    PXAspectRatioIsPortrait();
  }

  _Block_object_dispose(&v27, 8);
  return result;
}

void __99__PXStoryRecipeClipMotionStyleProvider_nextMotionInfoForDisplayAssetCount_displayAssets_excluding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & ~*(void *)(a1 + 40)) == 0)
  {
    v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    id v9 = [NSNumber numberWithInteger:a3];
    [v5 addObject:v9];
  }
}

- (int64_t)_nextMotionStyleForDisplayAssetCount:(int64_t)a3 excluding:(id)a4
{
  id v7 = a4;
  if ((unint64_t)(a3 - 1) >= 3)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRecipeClipMotionStyleProvider.m", 71, @"Unsupported display asset count: %ld", a3);

    abort();
  }
  v8 = v7;
  id v9 = *((id *)&self->super.isa + a3);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__PXStoryRecipeClipMotionStyleProvider__nextMotionStyleForDisplayAssetCount_excluding___block_invoke;
  v15[3] = &unk_1E5DCC3E0;
  id v16 = v8;
  id v10 = v8;
  id v11 = [v9 nextValuePassingTest:v15];
  int64_t v12 = [v11 integerValue];

  return v12;
}

uint64_t __87__PXStoryRecipeClipMotionStyleProvider__nextMotionStyleForDisplayAssetCount_excluding___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (PXStoryRecipeClipMotionStyleProvider)initWithConfiguration:(id)a3 colorGradeCategory:(id)a4 songPace:(int64_t)a5 randomNumberGenerator:(id)a6 storyConfiguration:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)PXStoryRecipeClipMotionStyleProvider;
  unint64_t v17 = [(PXStoryRecipeClipMotionStyleProvider *)&v32 init];
  unint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_configuration, a3);
    objc_storeStrong((id *)&v18->_storyConfiguration, a7);
    objc_storeStrong((id *)&v18->_randomNumberGenerator, a6);
    uint64_t v19 = [(PFStoryAutoEditConfiguration *)v18->_configuration motionStyleTable];
    uint64_t v31 = [v19 motionStylesForColorGrade:v14 songPace:a5];

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F8CDB0]) initWithValueCounts:v31 randomNumberGenerator:v15 fallbackValue:&unk_1F02D5980];
    frequencyTable = v18->_frequencyTable;
    v18->_frequencyTable = (PFStoryAutoEditFrequencyTable *)v20;

    uint64_t v22 = [(PFStoryAutoEditConfiguration *)v18->_configuration diptychMotionStyleTable];
    uint64_t v23 = [v22 motionStylesForColorGrade:v14 songPace:a5];

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F8CDB0]) initWithValueCounts:v23 randomNumberGenerator:v15 fallbackValue:&unk_1F02D5980];
    diptychFrequencyTable = v18->_diptychFrequencyTable;
    v18->_diptychFrequencyTable = (PFStoryAutoEditFrequencyTable *)v24;

    uint64_t v26 = [(PFStoryAutoEditConfiguration *)v18->_configuration triptychMotionStyleTable];
    uint64_t v27 = [v26 motionStylesForColorGrade:v14 songPace:a5];

    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F8CDB0]) initWithValueCounts:v27 randomNumberGenerator:v15 fallbackValue:&unk_1F02D5980];
    triptychFrequencyTable = v18->_triptychFrequencyTable;
    v18->_triptychFrequencyTable = (PFStoryAutoEditFrequencyTable *)v28;
  }
  return v18;
}

- (PXStoryRecipeClipMotionStyleProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRecipeClipMotionStyleProvider.m", 31, @"%s is not available as initializer", "-[PXStoryRecipeClipMotionStyleProvider init]");

  abort();
}

@end