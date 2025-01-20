@interface PLCompositionHelper
+ (BOOL)compositionController:(id)a3 isCropConstraintEqualToCompositionController:(id)a4;
+ (BOOL)compositionController:(id)a3 isDepthIntensityEqualToCompositionController:(id)a4;
+ (BOOL)compositionController:(id)a3 isEffectFilterEqualToCompositionController:(id)a4;
+ (BOOL)compositionController:(id)a3 isEffectFilterIntensityEqualToCompositionController:(id)a4;
+ (BOOL)compositionController:(id)a3 isGeometryEqualToCompositionController:(id)a4;
+ (BOOL)compositionController:(id)a3 isPortraitEqualToCompositionController:(id)a4;
+ (BOOL)compositionController:(id)a3 isPortraitIntensityEqualToCompositionController:(id)a4;
+ (BOOL)compositionControllerHasAnyAutoEnhancement:(id)a3;
+ (BOOL)isIdentityCompositionController:(id)a3;
+ (BOOL)isIdentityCompositionController:(id)a3 forKeys:(id)a4;
+ (BOOL)isKeyOnlyAdjustmentForCompositionController:(id)a3 key:(id)a4;
+ (BOOL)wantsSemanticEnhanceForCameraMetadata:(id)a3;
+ (CGSize)synchronousInputSizeForCompositionController:(id)a3;
+ (PIAdjustmentConstants)adjustmentConstants;
+ (id)activeEffectAdjustmentForCompositionController:(id)a3;
+ (id)defaultValueForAdjustmentKey:(id)a3 settingKey:(id)a4;
+ (id)identityValueForAdjustmentKey:(id)a3 settingKey:(id)a4;
+ (id)maxValueForAdjustmentKey:(id)a3 settingKey:(id)a4;
+ (id)minMaxValueForAdjustmentKey:(id)a3 settingKey:(id)a4;
+ (id)minValueForAdjustmentKey:(id)a3 settingKey:(id)a4;
+ (id)newIdentityCompositionController;
+ (id)photosSchema;
+ (id)validatedCompositionCopyFor:(id)a3;
+ (id)validatedCompositionCopyFor:(id)a3 mediaType:(int64_t)a4;
+ (id)valueForCompositionController:(id)a3 adjustmentKey:(id)a4 settingKey:(id)a5;
+ (id)valueForType:(int64_t)a3 adjustmentKey:(id)a4 settingKey:(id)a5;
+ (void)compositionController:(id)a3 applyAssetVariation:(unsigned __int16)a4 withRecipe:(id)a5;
+ (void)compositionController:(id)a3 setEffectFilterName:(id)a4 version:(int64_t)a5;
+ (void)compositionController:(id)a3 setInputOrientation:(int64_t)a4;
+ (void)compositionController:(id)a3 updateSemanticEnhanceFromCameraMetadata:(id)a4 exportProperties:(id)a5;
@end

@implementation PLCompositionHelper

+ (void)compositionController:(id)a3 updateSemanticEnhanceFromCameraMetadata:(id)a4 exportProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 wantsSemanticEnhanceForCameraMetadata:v9])
  {
    v11 = [v8 adjustmentConstants];
    v12 = [v11 PISemanticEnhanceAdjustmentKey];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __102__PLCompositionHelper_compositionController_updateSemanticEnhanceFromCameraMetadata_exportProperties___block_invoke;
    v13[3] = &unk_1E5867320;
    id v14 = v10;
    id v15 = v9;
    [v8 modifyAdjustmentWithKey:v12 modificationBlock:v13];
  }
}

void __102__PLCompositionHelper_compositionController_updateSemanticEnhanceFromCameraMetadata_exportProperties___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 baseEXIFOrientation];
  [v4 setEnabled:1];
  uint64_t v6 = [*(id *)(a1 + 40) semanticEnhanceScene];
  [*(id *)(a1 + 40) semanticEnhanceSceneConfidence];
  objc_msgSend(v4, "setScene:confidence:", v6);
  v7 = [*(id *)(a1 + 40) foodAndDrinkObservations];
  [v4 setBoundingBoxesFromObservations:v7 orientation:v5];

  id v8 = [*(id *)(a1 + 40) faceObservations];
  [v4 setFaceBoundingBoxesFromObservations:v8 orientation:v5];
}

+ (BOOL)wantsSemanticEnhanceForCameraMetadata:(id)a3
{
  return a3 && (unint64_t)([a3 semanticEnhanceScene] - 1) < 0xFFFFFFFFFFFFFFFELL;
}

+ (BOOL)isKeyOnlyAdjustmentForCompositionController:(id)a3 key:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 adjustmentControllerForKey:v6];

  if (v7)
  {
    id v8 = [v5 adjustmentKeys];
    if ([v8 count] == 1)
    {
      id v9 = [v8 objectAtIndexedSubscript:0];
      char v10 = [v9 isEqualToString:v6];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (void)compositionController:(id)a3 applyAssetVariation:(unsigned __int16)a4 withRecipe:(id)a5
{
  unsigned int v6 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  char v10 = (void *)[v8 copy];
  if (v6)
  {
    v11 = [a1 adjustmentConstants];
    v12 = [v11 PIAutoLoopAdjustmentKey];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __76__PLCompositionHelper_compositionController_applyAssetVariation_withRecipe___block_invoke;
    v36[3] = &unk_1E58672B8;
    v37 = v9;
    uint64_t v38 = v6;
    [v8 modifyAdjustmentWithKey:v12 modificationBlock:v36];

    if (v6 <= 2)
    {
      v13 = [a1 adjustmentConstants];
      id v14 = [v13 PIMuteAdjustmentKey];
      [v8 removeAdjustmentWithKey:v14];
    }
    id v35 = 0;
    [getPIPhotoEditHelperClass() updateCropAdjustmentControllerFor:v8 beforeCompositionController:v10 error:&v35];
    id v15 = v35;
    if (v15)
    {
      v16 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v15;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to update crop while applying asset variation: %@", buf, 0xCu);
      }
    }
    v17 = [a1 adjustmentConstants];
    v18 = [v17 PITrimAdjustmentKey];
    [v8 removeAdjustmentWithKey:v18];

    v19 = [a1 adjustmentConstants];
    v20 = [v19 PILivePhotoKeyFrameAdjustmentKey];
    [v8 removeAdjustmentWithKey:v20];

    v21 = [v8 depthAdjustmentController];

    if (v21)
    {
      v22 = [a1 adjustmentConstants];
      v23 = [v22 PIDepthAdjustmentKey];
      [v8 modifyAdjustmentWithKey:v23 modificationBlock:&__block_literal_global_25];
    }
    v24 = [v8 portraitAdjustmentController];

    if (v24)
    {
      v25 = [a1 adjustmentConstants];
      v26 = [v25 PIPortraitAdjustmentKey];
      [v8 modifyAdjustmentWithKey:v26 modificationBlock:&__block_literal_global_28_23857];
    }
    v27 = v37;
  }
  else
  {
    v32 = [a1 adjustmentConstants];
    v33 = [v32 PIAutoLoopAdjustmentKey];
    [v8 removeAdjustmentWithKey:v33];

    id v39 = 0;
    [getPIPhotoEditHelperClass() updateCropAdjustmentControllerFor:v8 beforeCompositionController:v10 error:&v39];
    id v34 = v39;
    if (!v34) {
      goto LABEL_14;
    }
    id v15 = v34;
    v27 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v15;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to update crop while applying asset variation: %@", buf, 0xCu);
    }
  }

LABEL_14:
  v28 = [a1 adjustmentConstants];
  v29 = [v28 PIInpaintAdjustmentKey];
  [v8 removeAdjustmentWithKey:v29];

  v30 = [a1 adjustmentConstants];
  v31 = [v30 PIRetouchAdjustmentKey];
  [v8 removeAdjustmentWithKey:v31];
}

void __76__PLCompositionHelper_compositionController_applyAssetVariation_withRecipe___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setRecipe:v3];
  [v4 setEnabled:1];
  id v5 = [getPIPhotoEditHelperClass() stringForAutoLoopFlavor:*(void *)(a1 + 40)];
  [v4 setFlavor:v5];
}

uint64_t __76__PLCompositionHelper_compositionController_applyAssetVariation_withRecipe___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setEnabled:0];
}

uint64_t __76__PLCompositionHelper_compositionController_applyAssetVariation_withRecipe___block_invoke_22(uint64_t a1, void *a2)
{
  return [a2 setEnabled:0];
}

+ (void)compositionController:(id)a3 setInputOrientation:(int64_t)a4
{
  id v6 = a3;
  [v6 setImageOrientation:a4];
  uint64_t v7 = [v6 userOrientation];
  id v8 = [v6 orientationAdjustmentController];

  if (a4 != 1 || v8)
  {
    id v9 = [a1 adjustmentConstants];
    char v10 = [v9 PIOrientationAdjustmentKey];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PLCompositionHelper_compositionController_setInputOrientation___block_invoke;
    v11[3] = &unk_1E5867290;
    id v12 = v6;
    uint64_t v13 = v7;
    [v12 modifyAdjustmentWithKey:v10 modificationBlock:v11];
  }
}

void __65__PLCompositionHelper_compositionController_setInputOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) imageOrientation];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  id v6 = (uint64_t (*)(uint64_t, uint64_t))getNUOrientationConcatSymbolLoc_ptr;
  uint64_t v13 = getNUOrientationConcatSymbolLoc_ptr;
  if (!getNUOrientationConcatSymbolLoc_ptr)
  {
    uint64_t v7 = NeutrinoCoreLibrary();
    v11[3] = (uint64_t)dlsym(v7, "NUOrientationConcat");
    getNUOrientationConcatSymbolLoc_ptr = (_UNKNOWN *)v11[3];
    id v6 = (uint64_t (*)(uint64_t, uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v6)
  {
    objc_msgSend(v3, "setOrientation:", v6(v4, v5));
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = objc_msgSend(NSString, "stringWithUTF8String:", "NUOrientation SOFT_LINKED_NUOrientationConcat(NUOrientation, NUOrientation)");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PLCompositionHelper.m", 60, @"%s", dlerror());

    __break(1u);
  }
}

+ (void)compositionController:(id)a3 setEffectFilterName:(id)a4 version:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 adjustmentConstants];
  uint64_t v10 = (void *)[v7 copy];
  int v11 = [getPIPhotoEditHelperClass() is3DEffect:v8];
  uint64_t v12 = [v9 PIEffectAdjustmentKey];
  uint64_t v13 = [v9 PIEffect3DAdjustmentKey];
  if (v11)
  {
    uint64_t v14 = [v9 PIEffect3DAdjustmentKey];

    uint64_t v15 = [v9 PIEffectAdjustmentKey];

    uint64_t v12 = (void *)v14;
    uint64_t v13 = (void *)v15;
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __73__PLCompositionHelper_compositionController_setEffectFilterName_version___block_invoke;
  v20 = &unk_1E5867268;
  id v21 = v8;
  int64_t v22 = a5;
  id v16 = v8;
  [v10 modifyAdjustmentWithKey:v12 modificationBlock:&v17];
  objc_msgSend(v10, "removeAdjustmentWithKey:", v13, v17, v18, v19, v20);
  [v7 applyChangesFromCompositionController:v10];
}

void __73__PLCompositionHelper_compositionController_setEffectFilterName_version___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [getPIPhotoEditHelperClass() effectNameForFilterName:*(void *)(a1 + 32)];
  [v3 setKind:v4];
  [v3 setVersion:*(void *)(a1 + 40)];
  [v3 setEnabled:1];
}

+ (CGSize)synchronousInputSizeForCompositionController:(id)a3
{
  id v3 = +[PLCompositionHelper validatedCompositionCopyFor:a3];
  id v4 = [getPIPhotoEditHelperClass() geometryRequestWithComposition:v3];
  uint64_t v5 = [getPIPhotoEditHelperClass() pipelineFiltersForOriginalGeometry];
  [v4 setPipelineFilters:v5];

  uint64_t v16 = 0;
  id v6 = [v4 submitSynchronous:&v16];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 geometry];
    uint64_t v9 = [v8 size];
    uint64_t v11 = v10;

    double v12 = (double)v9;
    double v13 = (double)v11;
  }
  else
  {
    _PFAssertContinueHandler();
    double v12 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v14 = v12;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (BOOL)compositionController:(id)a3 isGeometryEqualToCompositionController:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a4 composition];
  id v8 = [a1 adjustmentConstants];
  uint64_t v9 = [v8 PICropAdjustmentKey];
  v12[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  LOBYTE(a4) = [v6 isEqual:v7 forKeys:v10 visualChangesOnly:1];

  return (char)a4;
}

+ (BOOL)compositionController:(id)a3 isDepthIntensityEqualToCompositionController:(id)a4
{
  id v5 = a4;
  id v6 = [a3 depthAdjustmentController];
  id v7 = [v5 depthAdjustmentController];

  [v6 aperture];
  double v9 = v8;
  [v7 aperture];
  LOBYTE(v5) = v9 == v10;

  return (char)v5;
}

+ (BOOL)compositionController:(id)a3 isPortraitIntensityEqualToCompositionController:(id)a4
{
  id v5 = a4;
  id v6 = [a3 portraitAdjustmentController];
  id v7 = [v5 portraitAdjustmentController];

  double v8 = 0.5;
  double v9 = 0.5;
  if (v6)
  {
    [v6 strength];
    double v9 = v10;
  }
  if (v7)
  {
    [v7 strength];
    double v8 = v11;
  }

  return v9 == v8;
}

+ (BOOL)compositionController:(id)a3 isPortraitEqualToCompositionController:(id)a4
{
  id v5 = a4;
  id v6 = [a3 portraitAdjustmentController];
  id v7 = [v5 portraitAdjustmentController];

  double v8 = [v6 kind];
  double v9 = [v7 kind];
  if ([v8 isEqualToString:v9])
  {
    int v10 = [v6 enabled];
    int v11 = v10 ^ [v7 enabled] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

+ (BOOL)compositionController:(id)a3 isEffectFilterIntensityEqualToCompositionController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 effectAdjustmentController];
  double v8 = [v6 effect3DAdjustmentController];

  double v9 = 1.0;
  if ([v7 enabled])
  {
    [v7 intensity];
    double v9 = v10;
  }
  if ([v8 enabled])
  {
    [v8 intensity];
    double v9 = v11;
  }
  double v12 = [v5 effectAdjustmentController];
  double v13 = [v5 effect3DAdjustmentController];

  double v14 = 1.0;
  if ([v12 enabled])
  {
    [v12 intensity];
    double v14 = v15;
  }
  if ([v13 enabled])
  {
    [v13 intensity];
    double v14 = v16;
  }

  return v9 == v14;
}

+ (BOOL)compositionController:(id)a3 isEffectFilterEqualToCompositionController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 effectAdjustmentController];
  uint64_t v8 = [v6 effectAdjustmentController];
  if (v7 | v8)
  {
    double v9 = [(id)v7 kind];
    double v10 = [(id)v8 kind];
    char v11 = [v9 isEqualToString:v10];
  }
  else
  {
    char v11 = 1;
  }
  uint64_t v12 = [v5 effect3DAdjustmentController];
  uint64_t v13 = [v6 effect3DAdjustmentController];
  if (v12 | v13)
  {
    double v14 = [(id)v12 kind];
    double v15 = [(id)v13 kind];
    char v16 = [v14 isEqualToString:v15];
  }
  else
  {
    char v16 = 1;
  }

  return v11 & v16;
}

+ (BOOL)compositionController:(id)a3 isCropConstraintEqualToCompositionController:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a4 composition];
  uint64_t v8 = [a1 adjustmentConstants];
  double v9 = [v8 PICropAdjustmentKey];
  v13[0] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __90__PLCompositionHelper_compositionController_isCropConstraintEqualToCompositionController___block_invoke;
  v12[3] = &__block_descriptor_40_e69_B32__0__NSString_8__PIAdjustmentController_16__NUGenericAdjustment_24l;
  v12[4] = a1;
  LOBYTE(a1) = [v6 isEqual:v7 forKeys:v10 comparisonBlock:v12];

  return (char)a1;
}

uint64_t __90__PLCompositionHelper_compositionController_isCropConstraintEqualToCompositionController___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  double v9 = *(void **)(a1 + 32);
  id v10 = a2;
  char v11 = [v9 adjustmentConstants];
  uint64_t v12 = [v11 PICropAdjustmentKey];
  int v13 = [v10 isEqualToString:v12];

  if (v13) {
    uint64_t v14 = [v7 isEqual:v8 forKeys:&unk_1EEBF1BC8];
  }
  else {
    uint64_t v14 = 1;
  }

  return v14;
}

+ (id)activeEffectAdjustmentForCompositionController:(id)a3
{
  id v3 = a3;
  id v4 = [v3 effect3DAdjustmentController];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 effectAdjustmentController];
  }
  id v7 = v6;

  return v7;
}

+ (BOOL)compositionControllerHasAnyAutoEnhancement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 smartToneAdjustmentController];
  if ([v4 isAuto])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 smartColorAdjustmentController];
    if ([v6 isAuto])
    {
      char v5 = 1;
    }
    else
    {
      id v7 = [v3 rawNoiseReductionAdjustmentController];
      if ([v7 isAuto])
      {
        char v5 = 1;
      }
      else
      {
        id v8 = [v3 smartBWAdjustmentController];
        if ([v8 isAuto])
        {
          char v5 = 1;
        }
        else
        {
          double v9 = [v3 sharpenAdjustmentController];
          if ([v9 isAuto])
          {
            char v5 = 1;
          }
          else
          {
            id v10 = [v3 whiteBalanceAdjustmentController];
            if ([v10 isAuto])
            {
              char v5 = 1;
            }
            else
            {
              char v11 = [v3 noiseReductionAdjustmentController];
              if ([v11 isAuto])
              {
                char v5 = 1;
              }
              else
              {
                uint64_t v12 = [v3 definitionAdjustmentController];
                char v5 = [v12 isAuto];
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

+ (id)valueForCompositionController:(id)a3 adjustmentKey:(id)a4 settingKey:(id)a5
{
  id v7 = a5;
  id v8 = [a3 adjustmentControllerForKey:a4];
  double v9 = [v8 objectForKeyedSubscript:v7];

  return v9;
}

+ (id)valueForType:(int64_t)a3 adjustmentKey:(id)a4 settingKey:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  switch(a3)
  {
    case 0:
      uint64_t v9 = [(id)objc_opt_class() defaultValueForAdjustmentKey:v7 settingKey:v8];
      goto LABEL_7;
    case 1:
      uint64_t v9 = [(id)objc_opt_class() identityValueForAdjustmentKey:v7 settingKey:v8];
      goto LABEL_7;
    case 2:
      uint64_t v9 = [(id)objc_opt_class() minValueForAdjustmentKey:v7 settingKey:v8];
      goto LABEL_7;
    case 3:
      uint64_t v9 = [(id)objc_opt_class() maxValueForAdjustmentKey:v7 settingKey:v8];
LABEL_7:
      id v10 = (void *)v9;
      break;
    default:
      id v10 = 0;
      break;
  }

  return v10;
}

+ (id)maxValueForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() minMaxValueForAdjustmentKey:v6 settingKey:v5];

  id v8 = [v7 max];

  return v8;
}

+ (id)minValueForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() minMaxValueForAdjustmentKey:v6 settingKey:v5];

  id v8 = [v7 min];

  return v8;
}

+ (id)minMaxValueForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [getPICompositionControllerClass() settingForAdjustmentKey:v6 settingKey:v5];

  getNUNumberSettingClass();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v9 = objc_alloc_init(PLMinMaxSettings);
    id v10 = objc_msgSend(v8, "ui_minimumValue");
    if (v10)
    {
      [(PLMinMaxSettings *)v9 setMin:v10];
    }
    else
    {
      char v11 = [v8 minimumValue];
      [(PLMinMaxSettings *)v9 setMin:v11];
    }
    uint64_t v12 = objc_msgSend(v8, "ui_maximumValue");
    if (v12)
    {
      [(PLMinMaxSettings *)v9 setMax:v12];
    }
    else
    {
      int v13 = [v8 maximumValue];
      [(PLMinMaxSettings *)v9 setMax:v13];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)identityValueForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [getPICompositionControllerClass() settingForAdjustmentKey:v6 settingKey:v5];

  getNUBoolSettingClass();
  getNUEnumSettingClass();
  getNUNumberSettingClass();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
  {
    id v8 = [v7 identityValue];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)defaultValueForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [getPICompositionControllerClass() settingForAdjustmentKey:v6 settingKey:v5];

  getNUBoolSettingClass();
  getNUEnumSettingClass();
  getNUNumberSettingClass();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
  {
    id v8 = [v7 defaultValue];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)newIdentityCompositionController
{
  id PIPhotoEditHelperClass = getPIPhotoEditHelperClass();
  id v3 = (void *)[getPIPhotoEditHelperClass() newComposition];
  id v4 = (void *)[PIPhotoEditHelperClass newCompositionControllerWithComposition:v3];

  return v4;
}

+ (BOOL)isIdentityCompositionController:(id)a3 forKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id PIPhotoEditHelperClass = getPIPhotoEditHelperClass();
  uint64_t v9 = (void *)[getPIPhotoEditHelperClass() newComposition];
  id v10 = (void *)[PIPhotoEditHelperClass newCompositionControllerWithComposition:v9];

  char v11 = [a1 adjustmentConstants];
  uint64_t v12 = [v11 PIOrientationAdjustmentKey];
  int v13 = [v7 containsObject:v12];

  if (v13)
  {
    uint64_t v14 = [v6 orientationAdjustmentController];
    double v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 orientation];
      if (v16 != [v6 imageOrientation])
      {

        char v35 = 0;
        goto LABEL_13;
      }
    }
  }
  uint64_t v17 = (void *)[v7 mutableCopy];
  uint64_t v18 = [a1 adjustmentConstants];
  v19 = [v18 PIOrientationAdjustmentKey];
  [v17 removeObject:v19];

  v20 = [a1 adjustmentConstants];
  id v21 = [v20 PISlomoAdjustmentKey];
  [v17 removeObject:v21];

  int64_t v22 = [v6 semanticStyleAdjustmentController];
  LODWORD(v21) = [v22 enabled];

  if (v21)
  {
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2050000000;
    v24 = (void *)getPISemanticStyleAutoCalculatorClass_softClass;
    uint64_t v50 = getPISemanticStyleAutoCalculatorClass_softClass;
    if (!getPISemanticStyleAutoCalculatorClass_softClass)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __getPISemanticStyleAutoCalculatorClass_block_invoke;
      v46[3] = &unk_1E5875840;
      v46[4] = &v47;
      __getPISemanticStyleAutoCalculatorClass_block_invoke((uint64_t)v46);
      v24 = (void *)v48[3];
    }
    v25 = v24;
    _Block_object_dispose(&v47, 8);
    id v26 = [v25 alloc];
    v27 = [v6 composition];
    v28 = (void *)[v26 initWithComposition:v27];

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __63__PLCompositionHelper_isIdentityCompositionController_forKeys___block_invoke;
    v37[3] = &unk_1E5867220;
    id v41 = a1;
    id v29 = v6;
    id v38 = v29;
    v40 = &v42;
    v30 = v23;
    id v39 = v30;
    [v28 submit:v37];
    dispatch_group_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v43 + 24))
    {
      id v31 = objc_alloc((Class)getPICompositionControllerClass());
      v32 = [v29 composition];
      id v6 = (id)[v31 initWithComposition:v32];

      v33 = getPISemanticStyleAdjustmentKey();
      [v6 removeAdjustmentWithKey:v33];
    }
    else
    {
      id v6 = v29;
    }

    _Block_object_dispose(&v42, 8);
  }
  id v34 = [v10 composition];
  char v35 = [v6 isEqual:v34 forKeys:v17 visualChangesOnly:1];

LABEL_13:
  return v35;
}

void __63__PLCompositionHelper_isIdentityCompositionController_forKeys___block_invoke(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  id v3 = [a2 result:&v19];
  id v4 = v19;
  if (v4)
  {
    id v5 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [v4 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "isIdentityCompositionController error while running semantic style autocalc: %@", buf, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (v3)
  {
    id v7 = [v3 allKeys];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v5 = [*(id *)(a1 + 56) newIdentityCompositionController];
      uint64_t v9 = getPISemanticStyleAdjustmentKey();
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __63__PLCompositionHelper_isIdentityCompositionController_forKeys___block_invoke_2;
      uint64_t v17 = &unk_1E58671F8;
      id v18 = v3;
      [v5 modifyAdjustmentWithKey:v9 modificationBlock:&v14];

      id v10 = objc_msgSend(*(id *)(a1 + 32), "composition", v14, v15, v16, v17);
      char v11 = getPISemanticStyleAdjustmentKey();
      v22[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      int v13 = [v5 isEqual:v10 forKeys:v12 visualChangesOnly:1];

      if (v13) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }

      goto LABEL_9;
    }
  }
LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __63__PLCompositionHelper_isIdentityCompositionController_forKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateWithSemStyleInfo:*(void *)(a1 + 32)];
}

+ (BOOL)isIdentityCompositionController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 availableKeys];
  LOBYTE(a1) = [a1 isIdentityCompositionController:v4 forKeys:v5];

  return (char)a1;
}

+ (PIAdjustmentConstants)adjustmentConstants
{
  if (adjustmentConstants_onceToken != -1) {
    dispatch_once(&adjustmentConstants_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)adjustmentConstants_constants;
  return (PIAdjustmentConstants *)v2;
}

void __42__PLCompositionHelper_adjustmentConstants__block_invoke()
{
  uint64_t v0 = [getPIPhotoEditHelperClass() adjustmentConstants];
  v1 = (void *)adjustmentConstants_constants;
  adjustmentConstants_constants = v0;
}

+ (id)photosSchema
{
  if (photosSchema_onceToken != -1) {
    dispatch_once(&photosSchema_onceToken, &__block_literal_global_23904);
  }
  v2 = (void *)photosSchema_schema;
  return v2;
}

void __35__PLCompositionHelper_photosSchema__block_invoke()
{
  uint64_t v0 = [getPIPhotoEditHelperClass() photosSchema];
  v1 = (void *)photosSchema_schema;
  photosSchema_schema = v0;
}

+ (id)validatedCompositionCopyFor:(id)a3 mediaType:(int64_t)a4
{
  id v5 = a3;
  id PIPhotoEditHelperClass = getPIPhotoEditHelperClass();
  id v7 = [v5 composition];

  uint64_t v8 = [PIPhotoEditHelperClass validatedCompositionCopyForComposition:v7 mediaType:a4];

  return v8;
}

+ (id)validatedCompositionCopyFor:(id)a3
{
  return (id)[a1 validatedCompositionCopyFor:a3 mediaType:0];
}

@end