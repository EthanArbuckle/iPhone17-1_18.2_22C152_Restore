@interface PFSemanticEnhancePregateCalculator
+ ($12FC28267955EE572C1AED5C354322B1)semanticEnhanceSceneForCameraMetadata:(id)a3;
+ ($12FC28267955EE572C1AED5C354322B1)semanticEnhanceSceneForCameraMetadata:(id)a3 ignoreCameraSetting:(BOOL)a4;
+ (BOOL)isSemanticDevelopmentEnabledInCameraSettings;
+ (id)filterForSemanticEnhanceScene:(int64_t)a3;
+ (int64_t)semanticEnhanceSceneForPrivateClientMetadata:(id)a3;
@end

@implementation PFSemanticEnhancePregateCalculator

+ (id)filterForSemanticEnhanceScene:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1E040], "filterWithName:", off_1E5B2DD40[a3 - 1], v3);
  }
  return v5;
}

+ (int64_t)semanticEnhanceSceneForPrivateClientMetadata:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  uint64_t v4 = +[PFCameraMetadataSerialization deserializedMetadataFromPrivateClientMetadata:a3 error:&v8];
  id v5 = v8;
  if (v4)
  {
    int64_t v6 = [a1 semanticEnhanceSceneForCameraMetadata:v4 ignoreCameraSetting:1];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[SemDev] Error deserializing camera metadata: %@", buf, 0xCu);
    }
    int64_t v6 = -1;
  }

  return v6;
}

+ ($12FC28267955EE572C1AED5C354322B1)semanticEnhanceSceneForCameraMetadata:(id)a3 ignoreCameraSetting:(BOOL)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4 && ![(id)objc_opt_class() isSemanticDevelopmentEnabledInCameraSettings])
  {
    double v27 = 0.0;
    uint64_t v40 = -1;
    goto LABEL_49;
  }
  int64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 doubleForKey:@"semantic_enhance_food_threshold"];
  if (v7 == 0.0) {
    double v8 = 0.91;
  }
  else {
    double v8 = v7;
  }

  v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v9 doubleForKey:@"semantic_enhance_landscape_threshold"];
  if (v10 == 0.0) {
    double v11 = 0.91;
  }
  else {
    double v11 = v10;
  }

  v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v12 doubleForKey:@"semantic_enhance_face_threshold"];
  if (v13 == 0.0) {
    double v14 = 0.2;
  }
  else {
    double v14 = v13;
  }

  [v5 faceObservations];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        [v20 boundingBox];
        double v22 = v21;
        [v20 boundingBox];
        if (v22 * v23 > v14)
        {
          double v27 = 0.0;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[SemDev] Detected faces larger than threshold, skipping semantic development", buf, 2u);
          }
          uint64_t v40 = -1;
          id v25 = v15;
          goto LABEL_48;
        }
      }
      uint64_t v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v55, 16, v22 * v23);
    }
    while (v17);
  }

  v24 = [v5 semanticDevelopmentGatingObservations];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v24;
    _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[SemDev] Semantic development gating observations: %@", buf, 0xCu);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v25 = v24;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
  double v27 = 0.0;
  if (!v26)
  {
    uint64_t v40 = -1;
    goto LABEL_47;
  }
  uint64_t v28 = v26;
  uint64_t v29 = *(void *)v45;
  while (2)
  {
    for (uint64_t j = 0; j != v28; ++j)
    {
      if (*(void *)v45 != v29) {
        objc_enumerationMutation(v25);
      }
      v31 = *(void **)(*((void *)&v44 + 1) + 8 * j);
      v32 = [v31 identifier];
      if ([v32 isEqualToString:@"food"])
      {
        [v31 confidence];
        double v34 = v33;

        if (v8 < v34)
        {
          uint64_t v40 = 1;
LABEL_46:
          [v31 confidence];
          double v27 = v41;
          goto LABEL_47;
        }
      }
      else
      {
      }
      v35 = [v31 identifier];
      if ([v35 isEqualToString:@"landscape"])
      {
        [v31 confidence];
        double v37 = v36;
      }
      else
      {
        v38 = [v31 identifier];
        if (([v38 isEqualToString:@"landscape_cityscape"] & 1) == 0)
        {

          continue;
        }
        [v31 confidence];
        double v37 = v39;
      }
      if (v11 < v37)
      {
        uint64_t v40 = 3;
        goto LABEL_46;
      }
    }
    uint64_t v28 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v28) {
      continue;
    }
    break;
  }
  uint64_t v40 = -1;
LABEL_47:

LABEL_48:
LABEL_49:

  double v42 = v27;
  int64_t v43 = v40;
  result.var1 = v42;
  result.var0 = v43;
  return result;
}

+ ($12FC28267955EE572C1AED5C354322B1)semanticEnhanceSceneForCameraMetadata:(id)a3
{
  int64_t v3 = [a1 semanticEnhanceSceneForCameraMetadata:a3 ignoreCameraSetting:0];
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ (BOOL)isSemanticDevelopmentEnabledInCameraSettings
{
  CFPreferencesAppSynchronize(@"com.apple.camera");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CAMUserPreferenceEnableSemanticDevelopment", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

@end