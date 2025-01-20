@interface PICompositionController
+ (Class)adjustmentControllerClassForKey:(id)a3;
+ (id)_keyToIdentifierMap;
+ (id)photosSchema;
+ (id)schemaForKey:(id)a3;
+ (id)settingForAdjustmentKey:(id)a3 settingKey:(id)a4;
- (BOOL)dumpComposition;
- (BOOL)isEqual:(id)a3 forKeys:(id)a4 comparisonBlock:(id)a5;
- (BOOL)isEqual:(id)a3 forKeys:(id)a4 visualChangesOnly:(BOOL)a5;
- (BOOL)isEqual:(id)a3 visualChangesOnly:(BOOL)a4;
- (Class)_adjustmentControllerClassForKey:(id)a3;
- (NUComposition)composition;
- (PIAdjustmentConstants)adjustmentConstants;
- (PIBrushStrokeHistory)brushStrokeHistory;
- (PICompositionController)initWithComposition:(id)a3;
- (PICompositionControllerDelegate)changeDelegate;
- (id)_adjustmentControllerForKey:(id)a3 creatingIfNecessary:(BOOL)a4 expectedClass:(Class)a5;
- (id)_internalComposition;
- (id)adjustmentControllerForKey:(id)a3;
- (id)adjustmentKeys;
- (id)autoLoopAdjustmentController;
- (id)autoLoopAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)availableKeys;
- (id)cinematicAudioAdjustmentController;
- (id)cinematicAudioAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)compositionKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cropAdjustmentController;
- (id)cropAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)debugDescription;
- (id)definitionAdjustmentController;
- (id)definitionAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)depthAdjustmentController;
- (id)depthAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)differingAdjustmentsWithComposition:(id)a3;
- (id)effect3DAdjustmentController;
- (id)effect3DAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)effectAdjustmentController;
- (id)effectAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)highResFusionAdjustmentController;
- (id)highResFusionAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)inpaintAdjustmentController;
- (id)inpaintAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)livePhotoKeyFrameAdjustmentController;
- (id)livePhotoKeyFrameAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)noiseReductionAdjustmentController;
- (id)noiseReductionAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)orientationAdjustmentController;
- (id)orientationAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)portraitAdjustmentController;
- (id)portraitAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)portraitVideoAdjustmentController;
- (id)portraitVideoAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)rawAdjustmentController;
- (id)rawAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)rawNoiseReductionAdjustmentController;
- (id)rawNoiseReductionAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)redEyeAdjustmentController;
- (id)redEyeAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)retouchAdjustmentController;
- (id)retouchAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)semanticEnhanceAdjustmentController;
- (id)semanticEnhanceAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)semanticStyleAdjustmentController;
- (id)semanticStyleAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)sharpenAdjustmentController;
- (id)sharpenAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)slomoAdjustmentController;
- (id)slomoAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)smartBWAdjustmentController;
- (id)smartBWAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)smartColorAdjustmentController;
- (id)smartColorAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)smartToneAdjustmentController;
- (id)smartToneAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)source;
- (id)trimAdjustmentController;
- (id)trimAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)videoCrossfadeLoopAdjustmentController;
- (id)videoCrossfadeLoopAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)videoPosterFrameAdjustmentController;
- (id)videoPosterFrameAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)videoStabilizeAdjustmentController;
- (id)videoStabilizeAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)vignetteAdjustmentController;
- (id)vignetteAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (id)whiteBalanceAdjustmentController;
- (id)whiteBalanceAdjustmentControllerCreatingIfNecessary:(BOOL)a3;
- (int64_t)imageOrientation;
- (int64_t)mediaType;
- (int64_t)userOrientation;
- (void)_didAddAdjustment:(id)a3;
- (void)_didRemoveAdjustment:(id)a3;
- (void)_didUpdateAdjustment:(id)a3;
- (void)_didUpdateAdjustments:(id)a3;
- (void)addAdjustmentWithKey:(id)a3;
- (void)applyChangesFromCompositionController:(id)a3;
- (void)modifyAdjustmentWithKey:(id)a3 modificationBlock:(id)a4;
- (void)performChanges:(id)a3;
- (void)removeAdjustmentWithKey:(id)a3;
- (void)replaceAdjustment:(id)a3 withKey:(id)a4;
- (void)setBrushStrokeHistory:(id)a3;
- (void)setChangeDelegate:(id)a3;
- (void)setImageOrientation:(int64_t)a3;
- (void)setInpaintMasks:(id)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setSource:(id)a3 mediaType:(int64_t)a4;
@end

@implementation PICompositionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brushStrokeHistory, 0);
  objc_destroyWeak((id *)&self->_changeDelegate);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setBrushStrokeHistory:(id)a3
{
}

- (PIBrushStrokeHistory)brushStrokeHistory
{
  return self->_brushStrokeHistory;
}

- (PICompositionControllerDelegate)changeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
  return (PICompositionControllerDelegate *)WeakRetained;
}

- (BOOL)dumpComposition
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = NSTemporaryDirectory();
  v5 = [v3 fileURLWithPath:v4 isDirectory:1];

  v6 = [v5 URLByAppendingPathComponent:@"PhotosComposition.plist"];
  v7 = (void *)MEMORY[0x1E4F7A408];
  v8 = [(PICompositionController *)self composition];
  id v30 = 0;
  char v9 = [v7 dumpComposition:v8 toURL:v6 error:&v30];
  id v10 = v30;

  v11 = (void *)MEMORY[0x1E4F7A750];
  if (v9)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_353);
    }
    v12 = (os_log_t *)MEMORY[0x1E4F7A758];
    v13 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      v15 = [v6 path];
      *(_DWORD *)buf = 138412290;
      id v32 = v15;
      _os_log_impl(&dword_1A9680000, v14, OS_LOG_TYPE_INFO, "Successfully dumped composition to %@", buf, 0xCu);
    }
    v16 = [PICompositionSidecarData alloc];
    v17 = [(PICompositionController *)self composition];
    v18 = [(PICompositionSidecarData *)v16 initWithComposition:v17];

    if ([(PICompositionSidecarData *)v18 isEmpty])
    {
      BOOL v19 = 0;
    }
    else
    {
      v21 = [(PICompositionController *)self brushStrokeHistory];
      [(PICompositionSidecarData *)v18 setBrushStrokeHistory:v21];

      v22 = [v5 URLByAppendingPathComponent:@"PhotosCompositionSidecar.aar"];
      id v29 = 0;
      BOOL v19 = [(PICompositionSidecarData *)v18 saveToURL:v22 error:&v29];
      id v23 = v29;

      if (v19)
      {
        if (*v11 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_353);
        }
        os_log_t v24 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
        {
          v25 = v24;
          v26 = [v22 path];
          *(_DWORD *)buf = 138412290;
          id v32 = v26;
          _os_log_impl(&dword_1A9680000, v25, OS_LOG_TYPE_INFO, "Successfully dumped composition sidecar data to %@", buf, 0xCu);
        }
      }
      else
      {
        if (*v11 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_353);
        }
        v27 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v23;
          _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Failed to dump composition sidecar data, error: %@", buf, 0xCu);
        }
      }

      id v10 = v23;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_353);
    }
    v20 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v10;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Failed to dump composition, error: %@", buf, 0xCu);
    }
    BOOL v19 = 0;
  }

  return v19;
}

- (int64_t)mediaType
{
  return [(NUComposition *)self->_composition mediaType];
}

- (void)setMediaType:(int64_t)a3
{
}

- (id)source
{
  return (id)[(NUComposition *)self->_composition objectForKeyedSubscript:@"source"];
}

- (void)setSource:(id)a3 mediaType:(int64_t)a4
{
  [(NUComposition *)self->_composition setObject:a3 forKeyedSubscript:@"source"];
  composition = self->_composition;
  [(NUComposition *)composition setMediaType:a4];
}

- (Class)_adjustmentControllerClassForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (objc_class *)[(id)objc_opt_class() adjustmentControllerClassForKey:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
  v7 = WeakRetained;
  if (WeakRetained && self->_delegateFlags.hasClassForController)
  {
    v8 = (objc_class *)[WeakRetained compositionController:self adjustmentControllerClassForKey:v4];
    if ([(objc_class *)v8 isSubclassOfClass:v5])
    {
      v5 = v8;
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_353);
      }
      char v9 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        v11 = NSStringFromClass(v8);
        v12 = NSStringFromClass(v5);
        int v15 = 138412546;
        v16 = v11;
        __int16 v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_1A9680000, v10, OS_LOG_TYPE_DEFAULT, "class %@ is not the correct type, its superclass should be %@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  v13 = v5;

  return v13;
}

- (void)setInpaintMasks:(id)a3
{
}

- (int64_t)userOrientation
{
  v3 = [(PICompositionController *)self orientationAdjustmentControllerCreatingIfNecessary:0];
  if (v3)
  {
    int64_t v4 = [(PICompositionController *)self imageOrientation];
    int64_t v5 = 1;
    if ([v3 orientation] && v4)
    {
      NUOrientationInverse();
      [v3 orientation];
      int64_t v5 = NUOrientationConcat();
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (id)differingAdjustmentsWithComposition:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(PICompositionController *)self availableKeys];
  id v15 = (id)objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v20 = v11;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
        BOOL v13 = [(PICompositionController *)self isEqual:v4 forKeys:v12 visualChangesOnly:1];

        if (!v13) {
          [v15 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  return v15;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = [(NUComposition *)self->_composition debugDescription];
  int64_t v5 = [v3 stringWithFormat:@"PICompositionController(%p): %@", self, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3 forKeys:(id)a4 comparisonBlock:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v8 = a4;
  uint64_t v9 = (uint64_t (**)(id, void, void *, void *))a5;
  id v30 = self->_composition;
  id v29 = [(id)objc_opt_class() _keyToIdentifierMap];
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(PICompositionController *)self availableKeys];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    id v27 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v16 = -[NUComposition objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v15, v27);
        long long v17 = [v31 objectForKeyedSubscript:v15];
        if (v16)
        {
          long long v18 = [v16 objectForKeyedSubscript:@"enabled"];
          char v19 = [v18 BOOLValue];

          if ((v19 & 1) == 0)
          {

            long long v16 = 0;
          }
        }
        if (!v17) {
          goto LABEL_22;
        }
        uint64_t v20 = [v17 objectForKeyedSubscript:@"enabled"];
        char v21 = [v20 BOOLValue];

        if ((v21 & 1) == 0)
        {

LABEL_22:
          long long v17 = 0;
          BOOL v25 = v16 == 0;
LABEL_23:

          id v8 = v27;
          goto LABEL_24;
        }
        if (!v16
          || (v22 = objc_msgSend(objc_alloc(-[PICompositionController _adjustmentControllerClassForKey:](self, "_adjustmentControllerClassForKey:", v15)), "initWithAdjustment:", v16), objc_msgSend(v29, "objectForKeyedSubscript:", v15), id v23 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v22, "setIdentifier:", v23), v23, v24 = v9[2](v9, v15, v22, v17), v22, (v24 & 1) == 0))
        {
          BOOL v25 = 0;
          goto LABEL_23;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      BOOL v25 = 1;
      id v8 = v27;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v25 = 1;
  }
LABEL_24:

  return v25;
}

- (BOOL)isEqual:(id)a3 forKeys:(id)a4 visualChangesOnly:(BOOL)a5
{
  BOOL v50 = a5;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self->_composition;
  v51 = [(id)objc_opt_class() _keyToIdentifierMap];
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(PICompositionController *)self availableKeys];
  }
  v49 = v8;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (!v12)
  {
    char v53 = 1;
    goto LABEL_61;
  }
  uint64_t v13 = v12;
  v52 = self;
  char v53 = 1;
  uint64_t v58 = *(void *)v60;
  v55 = v9;
  id v56 = v7;
  id v54 = v11;
  do
  {
    uint64_t v14 = 0;
    uint64_t v57 = v13;
    do
    {
      if (*(void *)v60 != v58) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = *(void **)(*((void *)&v59 + 1) + 8 * v14);
      long long v16 = -[NUComposition objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v15, v49);
      long long v17 = [v7 objectForKeyedSubscript:v15];
      if (([v15 isEqualToString:@"source"] & 1) != 0
        || ([v15 isEqualToString:@"raw"] & 1) != 0)
      {
        goto LABEL_11;
      }
      if (![v15 isEqualToString:@"inpaintMasks"])
      {
        int v22 = [v15 isEqualToString:@"mute"];
        int v23 = [v15 isEqualToString:@"autoLoop"];
        int v24 = [v15 isEqualToString:@"portraitVideo"];
        BOOL v25 = [v16 schema];
        v26 = [v25 settings];
        id v27 = [v26 allKeys];
        int v28 = [v27 containsObject:@"enabled"] & ~v22 & ((v23 | v24) ^ 1);

        BOOL v29 = v28 != 1 || v16 == 0;
        if (!v29)
        {
          id v30 = [v16 objectForKeyedSubscript:@"enabled"];
          char v31 = [v30 BOOLValue];

          if ((v31 & 1) == 0)
          {

            long long v16 = 0;
          }
        }
        uint64_t v9 = v55;
        id v7 = v56;
        id v11 = v54;
        if (v17) {
          int v32 = v28;
        }
        else {
          int v32 = 0;
        }
        if (v32 == 1)
        {
          long long v33 = [v17 objectForKeyedSubscript:@"enabled"];
          int v34 = [v33 BOOLValue];

          uint64_t v13 = v57;
          if (v34)
          {
            if (!v16)
            {
              if (([v15 isEqualToString:@"orientation"] & 1) == 0)
              {
                long long v16 = 0;
LABEL_60:

                char v53 = 0;
                goto LABEL_61;
              }
LABEL_41:
              v36 = [v17 objectForKeyedSubscript:@"value"];
              uint64_t v37 = [v36 integerValue];
              uint64_t v38 = [(PICompositionController *)v52 imageOrientation];

              if (v37 != v38) {
                goto LABEL_60;
              }
LABEL_11:

              goto LABEL_12;
            }
LABEL_50:
            v42 = objc_msgSend(objc_alloc(-[PICompositionController _adjustmentControllerClassForKey:](v52, "_adjustmentControllerClassForKey:", v15)), "initWithAdjustment:", v16);
            uint64_t v43 = [v51 objectForKeyedSubscript:v15];
            [v42 setIdentifier:v43];

            LOBYTE(v43) = [v42 isEqual:v17 visualChangesOnly:v50];
            if ((v43 & 1) == 0) {
              goto LABEL_60;
            }
            goto LABEL_11;
          }

          if (!v16)
          {
            long long v17 = 0;
            goto LABEL_11;
          }
          long long v17 = 0;
          if (([v15 isEqualToString:@"orientation"] & 1) == 0) {
            goto LABEL_60;
          }
          BOOL v35 = 1;
LABEL_46:
          v39 = [v16 objectForKeyedSubscript:@"value"];
          uint64_t v40 = [v39 integerValue];
          uint64_t v41 = [(PICompositionController *)v52 imageOrientation];

          if (!v35) {
            goto LABEL_60;
          }
          BOOL v29 = v40 == v41;
          uint64_t v13 = v57;
          if (!v29) {
            goto LABEL_60;
          }
          goto LABEL_11;
        }
        BOOL v35 = v17 == 0;
        uint64_t v13 = v57;
        if (v35 == (v16 == 0))
        {
          if (v16) {
            goto LABEL_50;
          }
          if (v17)
          {
            v44 = objc_msgSend(objc_alloc(-[PICompositionController _adjustmentControllerClassForKey:](v52, "_adjustmentControllerClassForKey:", v15)), "initWithAdjustment:", v17);
            v45 = [v51 objectForKeyedSubscript:v15];
            [v44 setIdentifier:v45];

            int v46 = [v44 isEqual:0 visualChangesOnly:v50];
            long long v16 = 0;
            if (!v46) {
              goto LABEL_60;
            }
            goto LABEL_11;
          }
        }
        else
        {
          if (([v15 isEqualToString:@"orientation"] & 1) == 0) {
            goto LABEL_60;
          }
          if (v16) {
            goto LABEL_46;
          }
          if (v17) {
            goto LABEL_41;
          }
        }
        long long v16 = 0;
        goto LABEL_11;
      }
      long long v18 = [(NUComposition *)v9 objectForKeyedSubscript:v15];
      uint64_t v19 = [(NUComposition *)v9 objectForKeyedSubscript:v15];
      uint64_t v20 = (void *)v19;
      if ((v18 != 0) != (v19 != 0) || v18 && v19 && ![v18 isEqualToArray:v19])
      {
        int v21 = 0;
        char v53 = 0;
      }
      else
      {
        int v21 = 1;
      }

      uint64_t v13 = v57;
      if (!v21) {
        goto LABEL_61;
      }
LABEL_12:
      ++v14;
    }
    while (v13 != v14);
    uint64_t v47 = [v11 countByEnumeratingWithState:&v59 objects:v63 count:16];
    uint64_t v13 = v47;
  }
  while (v47);
LABEL_61:

  return v53 & 1;
}

- (BOOL)isEqual:(id)a3 visualChangesOnly:(BOOL)a4
{
  return [(PICompositionController *)self isEqual:a3 forKeys:0 visualChangesOnly:a4];
}

- (void)performChanges:(id)a3
{
  id v10 = (void (**)(void))a3;
  transaction = self->_transaction;
  if (!transaction)
  {
    int64_t v5 = objc_alloc_init(_PICompositionControllerTransaction);
    id v6 = self->_transaction;
    self->_transaction = v5;

    transaction = self->_transaction;
  }
  [(_PICompositionControllerTransaction *)transaction begin];
  v10[2]();
  if ([(_PICompositionControllerTransaction *)self->_transaction commit])
  {
    id v7 = [(_PICompositionControllerTransaction *)self->_transaction changes];
    if ([v7 count] && self->_delegateFlags.hasDidUpdateMultiple)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
      [WeakRetained compositionController:self didUpdateAdjustments:v7];
    }
    uint64_t v9 = self->_transaction;
    self->_transaction = 0;
  }
}

- (void)_didUpdateAdjustments:(id)a3
{
  id v4 = a3;
  transaction = self->_transaction;
  if (transaction)
  {
    [(_PICompositionControllerTransaction *)transaction didUpdateAdjustments:v4];
  }
  else if (self->_delegateFlags.hasDidUpdateMultiple)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
    [WeakRetained compositionController:self didUpdateAdjustments:v7];
  }
  MEMORY[0x1F41817F8]();
}

- (void)applyChangesFromCompositionController:(id)a3
{
  id v11 = a3;
  id v4 = [v11 composition];
  int64_t v5 = [(PICompositionController *)self differingAdjustmentsWithComposition:v4];
  id v6 = [v11 source];
  id v7 = [(PICompositionController *)self source];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [v5 arrayByAddingObject:@"source"];

    int64_t v5 = (void *)v9;
  }
  composition = self->_composition;
  self->_composition = v4;

  -[PICompositionController setImageOrientation:](self, "setImageOrientation:", [v11 imageOrientation]);
  if ([v5 count]) {
    [(PICompositionController *)self _didUpdateAdjustments:v5];
  }
}

- (void)modifyAdjustmentWithKey:(id)a3 modificationBlock:(id)a4
{
  id v16 = a3;
  if (a4)
  {
    id v6 = (void (**)(id, void *))a4;
    id v7 = [(id)objc_opt_class() _keyToIdentifierMap];
    char v8 = [(NUComposition *)self->_composition objectForKeyedSubscript:v16];
    uint64_t v9 = (void *)[v8 copy];

    if (!v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F7A488]);
      id v11 = [v7 objectForKeyedSubscript:v16];
      uint64_t v9 = (void *)[v10 initWithIdentifier:v11];

      [v9 reset];
    }
    uint64_t v12 = objc_msgSend(objc_alloc(-[PICompositionController _adjustmentControllerClassForKey:](self, "_adjustmentControllerClassForKey:", v16)), "initWithAdjustment:", v9);
    uint64_t v13 = [v7 objectForKeyedSubscript:v16];
    [v12 setIdentifier:v13];

    [v12 setContainingComposition:self->_composition];
    v6[2](v6, v12);

    uint64_t v14 = [v12 adjustment];
    uint64_t v15 = (void *)[v14 copy];
    [(NUComposition *)self->_composition setObject:v15 forKeyedSubscript:v16];

    [(PICompositionController *)self _didUpdateAdjustment:v16];
  }
}

- (id)adjustmentControllerForKey:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(id)objc_opt_class() _keyToIdentifierMap];
  id v6 = [(NUComposition *)self->_composition objectForKeyedSubscript:v4];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [(NUComposition *)self->_composition objectForKeyedSubscript:v4];
    char v8 = (void *)[v7 copy];

    uint64_t v9 = objc_msgSend(objc_alloc(-[PICompositionController _adjustmentControllerClassForKey:](self, "_adjustmentControllerClassForKey:", v4)), "initWithAdjustment:", v8);
    id v10 = [v5 objectForKeyedSubscript:v4];
    [v9 setIdentifier:v10];

    id v11 = v9;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_didRemoveAdjustment:(id)a3
{
  id v4 = a3;
  transaction = self->_transaction;
  if (transaction)
  {
    [(_PICompositionControllerTransaction *)transaction didRemoveAdjustment:v4];
  }
  else if (self->_delegateFlags.hasDidRemove)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
    [WeakRetained compositionController:self didRemoveAdjustment:v7];
  }
  MEMORY[0x1F41817F8]();
}

- (void)removeAdjustmentWithKey:(id)a3
{
  id v6 = a3;
  id v4 = -[NUComposition objectForKeyedSubscript:](self->_composition, "objectForKeyedSubscript:");
  if (v4)
  {
    [(NUComposition *)self->_composition setObject:0 forKeyedSubscript:v6];
    if (self->_delegateFlags.hasDidRemove)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
      [WeakRetained compositionController:self didRemoveAdjustment:v6];
    }
  }
}

- (void)_didUpdateAdjustment:(id)a3
{
  id v4 = a3;
  transaction = self->_transaction;
  if (transaction)
  {
    [(_PICompositionControllerTransaction *)transaction didUpdateAdjustment:v4];
  }
  else if (self->_delegateFlags.hasDidUpdate)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
    [WeakRetained compositionController:self didUpdateAdjustment:v7];
  }
  MEMORY[0x1F41817F8]();
}

- (void)replaceAdjustment:(id)a3 withKey:(id)a4
{
  id v9 = a4;
  composition = self->_composition;
  id v7 = a3;
  char v8 = [(NUComposition *)composition objectForKeyedSubscript:v9];

  [(NUComposition *)self->_composition setObject:v7 forKeyedSubscript:v9];
  if (!v8) {
    [(PICompositionController *)self _didAddAdjustment:v9];
  }
  [(PICompositionController *)self _didUpdateAdjustment:v9];
}

- (void)_didAddAdjustment:(id)a3
{
  id v4 = a3;
  transaction = self->_transaction;
  if (transaction)
  {
    [(_PICompositionControllerTransaction *)transaction didAddAdjustment:v4];
  }
  else if (self->_delegateFlags.hasDidAdd)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);
    [WeakRetained compositionController:self didAddAdjustment:v7];
  }
  MEMORY[0x1F41817F8]();
}

- (void)addAdjustmentWithKey:(id)a3
{
  id v4 = a3;
  id v10 = [(id)objc_opt_class() _keyToIdentifierMap];
  int64_t v5 = (objc_class *)MEMORY[0x1E4F7A488];
  id v6 = self->_composition;
  id v7 = [v5 alloc];
  char v8 = [v10 objectForKeyedSubscript:v4];
  id v9 = (void *)[v7 initWithIdentifier:v8];

  [v9 reset];
  [(NUComposition *)v6 setObject:v9 forKeyedSubscript:v4];

  [(PICompositionController *)self _didAddAdjustment:v4];
}

- (id)availableKeys
{
  v3 = objc_opt_new();
  id v4 = [(NUComposition *)self->_composition schema];
  int64_t v5 = [v4 contents];
  id v6 = [v5 allKeys];

  [v3 addObjectsFromArray:v6];
  return v3;
}

- (id)adjustmentKeys
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(PICompositionController *)self compositionKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 isEqualToString:@"source"] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)compositionKeys
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(NUComposition *)self->_composition schema];
  uint64_t v5 = [v4 contents];
  uint64_t v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = [(NUComposition *)self->_composition objectForKeyedSubscript:v11];
        if (v12) {
          [v3 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v3;
}

- (void)setChangeDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeDelegate);

  if (WeakRetained != obj)
  {
    self->_delegateFlags.hasDidAdd = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.hasDidRemove = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.hasDidUpdate = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.hasDidUpdateMultiple = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.hasClassForController = objc_opt_respondsToSelector() & 1;
    objc_storeWeak((id *)&self->_changeDelegate, obj);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithComposition:self->_composition];
  objc_msgSend(v4, "setImageOrientation:", -[PICompositionController imageOrientation](self, "imageOrientation"));
  uint64_t v5 = [(PICompositionController *)self brushStrokeHistory];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setBrushStrokeHistory:v6];

  return v4;
}

- (id)_internalComposition
{
  return self->_composition;
}

- (NUComposition)composition
{
  v2 = (void *)[(NUComposition *)self->_composition copy];
  return (NUComposition *)v2;
}

- (PICompositionController)initWithComposition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PICompositionController;
  id v3 = a3;
  id v4 = [(PICompositionController *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  composition = v4->_composition;
  v4->_composition = (NUComposition *)v5;

  return v4;
}

+ (Class)adjustmentControllerClassForKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  if (([v3 isEqualToString:@"smartTone"] & 1) != 0
    || ([v3 isEqualToString:@"smartColor"] & 1) != 0
    || ([v3 isEqualToString:@"smartBlackAndWhite"] & 1) != 0
    || ([v3 isEqualToString:@"cropStraighten"] & 1) != 0
    || ([v3 isEqualToString:@"redEye"] & 1) != 0
    || ([v3 isEqualToString:@"depthEffect"] & 1) != 0
    || ([v3 isEqualToString:@"livePhotoKeyFrame"] & 1) != 0
    || ([v3 isEqualToString:@"videoPosterFrame"] & 1) != 0
    || ([v3 isEqualToString:@"trim"] & 1) != 0
    || ([v3 isEqualToString:@"slomo"] & 1) != 0
    || ([v3 isEqualToString:@"effect"] & 1) != 0
    || ([v3 isEqualToString:@"effect3D"] & 1) != 0
    || ([v3 isEqualToString:@"portraitEffect"] & 1) != 0
    || ([v3 isEqualToString:@"orientation"] & 1) != 0
    || ([v3 isEqualToString:@"autoLoop"] & 1) != 0
    || ([v3 isEqualToString:@"highResFusion"] & 1) != 0
    || ([v3 isEqualToString:@"rawNoiseReduction"] & 1) != 0
    || ([v3 isEqualToString:@"sharpen"] & 1) != 0
    || ([v3 isEqualToString:@"whiteBalance"] & 1) != 0
    || ([v3 isEqualToString:@"noiseReduction"] & 1) != 0
    || ([v3 isEqualToString:@"definition"] & 1) != 0
    || ([v3 isEqualToString:@"raw"] & 1) != 0
    || ([v3 isEqualToString:@"vignette"] & 1) != 0
    || ([v3 isEqualToString:@"videoStabilize"] & 1) != 0
    || ([v3 isEqualToString:@"videoCrossfadeLoop"] & 1) != 0
    || ([v3 isEqualToString:@"semanticEnhance"] & 1) != 0
    || ([v3 isEqualToString:@"semanticStyle"] & 1) != 0
    || ([v3 isEqualToString:@"portraitVideo"] & 1) != 0
    || ([v3 isEqualToString:@"cinematicAudio"] & 1) != 0
    || ([v3 isEqualToString:@"retouch"] & 1) != 0
    || [v3 isEqualToString:@"inpaint"])
  {
    id v4 = objc_opt_class();
  }
  uint64_t v5 = v4;

  return v5;
}

+ (id)_keyToIdentifierMap
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PICompositionController__keyToIdentifierMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_keyToIdentifierMap_onceToken != -1) {
    dispatch_once(&_keyToIdentifierMap_onceToken, block);
  }
  v2 = (void *)_keyToIdentifierMap_identifierMap;
  return v2;
}

void __46__PICompositionController__keyToIdentifierMap__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) photosSchema];
  v2 = objc_opt_new();
  id v3 = [v1 contents];
  id v4 = [v3 allKeys];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v1, "contents", (void)v14);
        long long v12 = [v11 objectForKeyedSubscript:v10];
        [v2 setObject:v12 forKeyedSubscript:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  long long v13 = (void *)_keyToIdentifierMap_identifierMap;
  _keyToIdentifierMap_identifierMap = (uint64_t)v2;
}

+ (id)photosSchema
{
  if (photosSchema_onceToken != -1) {
    dispatch_once(&photosSchema_onceToken, &__block_literal_global_1533);
  }
  v2 = (void *)photosSchema_photosSchema;
  return v2;
}

void __39__PICompositionController_photosSchema__block_invoke()
{
  id v3 = +[PISchema registeredPhotosSchemaIdentifier];
  v0 = [MEMORY[0x1E4F7A690] sharedRegistry];
  uint64_t v1 = [v0 schemaWithIdentifier:v3];
  v2 = (void *)photosSchema_photosSchema;
  photosSchema_photosSchema = v1;
}

+ (id)settingForAdjustmentKey:(id)a3 settingKey:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 schemaForKey:a3];
  uint64_t v8 = [v7 settings];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  return v9;
}

+ (id)schemaForKey:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _keyToIdentifierMap];
  id v5 = [v4 objectForKeyedSubscript:v3];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F7A690] sharedRegistry];
    uint64_t v7 = [v6 schemaWithIdentifier:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)semanticStyleAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"semanticStyle" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)semanticStyleAdjustmentController
{
  return [(PICompositionController *)self semanticStyleAdjustmentControllerCreatingIfNecessary:0];
}

- (id)inpaintAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  id v4 = [(PICompositionController *)self _adjustmentControllerForKey:@"inpaint" creatingIfNecessary:a3 expectedClass:objc_opt_class()];
  uint64_t v5 = [(PICompositionController *)self _internalComposition];
  [v4 setContainingComposition:v5];

  return v4;
}

- (id)inpaintAdjustmentController
{
  return [(PICompositionController *)self inpaintAdjustmentControllerCreatingIfNecessary:0];
}

- (id)retouchAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"retouch" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)retouchAdjustmentController
{
  return [(PICompositionController *)self retouchAdjustmentControllerCreatingIfNecessary:0];
}

- (id)cinematicAudioAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"cinematicAudio" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)cinematicAudioAdjustmentController
{
  return [(PICompositionController *)self cinematicAudioAdjustmentControllerCreatingIfNecessary:0];
}

- (id)portraitVideoAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"portraitVideo" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)portraitVideoAdjustmentController
{
  return [(PICompositionController *)self portraitVideoAdjustmentControllerCreatingIfNecessary:0];
}

- (id)semanticEnhanceAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"semanticEnhance" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)semanticEnhanceAdjustmentController
{
  return [(PICompositionController *)self semanticEnhanceAdjustmentControllerCreatingIfNecessary:0];
}

- (id)videoCrossfadeLoopAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"videoCrossfadeLoop" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)videoCrossfadeLoopAdjustmentController
{
  return [(PICompositionController *)self videoCrossfadeLoopAdjustmentControllerCreatingIfNecessary:0];
}

- (id)videoStabilizeAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"videoStabilize" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)videoStabilizeAdjustmentController
{
  return [(PICompositionController *)self videoStabilizeAdjustmentControllerCreatingIfNecessary:0];
}

- (id)vignetteAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"vignette" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)vignetteAdjustmentController
{
  return [(PICompositionController *)self vignetteAdjustmentControllerCreatingIfNecessary:0];
}

- (id)definitionAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"definition" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)definitionAdjustmentController
{
  return [(PICompositionController *)self definitionAdjustmentControllerCreatingIfNecessary:0];
}

- (id)noiseReductionAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"noiseReduction" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)noiseReductionAdjustmentController
{
  return [(PICompositionController *)self noiseReductionAdjustmentControllerCreatingIfNecessary:0];
}

- (id)whiteBalanceAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"whiteBalance" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)whiteBalanceAdjustmentController
{
  return [(PICompositionController *)self whiteBalanceAdjustmentControllerCreatingIfNecessary:0];
}

- (id)sharpenAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"sharpen" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)sharpenAdjustmentController
{
  return [(PICompositionController *)self sharpenAdjustmentControllerCreatingIfNecessary:0];
}

- (id)rawNoiseReductionAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"rawNoiseReduction" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)rawNoiseReductionAdjustmentController
{
  return [(PICompositionController *)self rawNoiseReductionAdjustmentControllerCreatingIfNecessary:0];
}

- (id)rawAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"raw" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)rawAdjustmentController
{
  return [(PICompositionController *)self rawAdjustmentControllerCreatingIfNecessary:0];
}

- (id)highResFusionAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"highResFusion" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)highResFusionAdjustmentController
{
  return [(PICompositionController *)self highResFusionAdjustmentControllerCreatingIfNecessary:0];
}

- (id)autoLoopAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"autoLoop" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)autoLoopAdjustmentController
{
  return [(PICompositionController *)self autoLoopAdjustmentControllerCreatingIfNecessary:0];
}

- (id)orientationAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"orientation" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)orientationAdjustmentController
{
  return [(PICompositionController *)self orientationAdjustmentControllerCreatingIfNecessary:0];
}

- (id)portraitAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"portraitEffect" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)portraitAdjustmentController
{
  return [(PICompositionController *)self portraitAdjustmentControllerCreatingIfNecessary:0];
}

- (id)effect3DAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"effect3D" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)effect3DAdjustmentController
{
  return [(PICompositionController *)self effect3DAdjustmentControllerCreatingIfNecessary:0];
}

- (id)effectAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"effect" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)effectAdjustmentController
{
  return [(PICompositionController *)self effectAdjustmentControllerCreatingIfNecessary:0];
}

- (id)slomoAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"slomo" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)slomoAdjustmentController
{
  return [(PICompositionController *)self slomoAdjustmentControllerCreatingIfNecessary:0];
}

- (id)trimAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"trim" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)trimAdjustmentController
{
  return [(PICompositionController *)self trimAdjustmentControllerCreatingIfNecessary:0];
}

- (id)depthAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"depthEffect" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)depthAdjustmentController
{
  return [(PICompositionController *)self depthAdjustmentControllerCreatingIfNecessary:0];
}

- (id)videoPosterFrameAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"videoPosterFrame" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)videoPosterFrameAdjustmentController
{
  return [(PICompositionController *)self videoPosterFrameAdjustmentControllerCreatingIfNecessary:0];
}

- (id)livePhotoKeyFrameAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"livePhotoKeyFrame" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)livePhotoKeyFrameAdjustmentController
{
  return [(PICompositionController *)self livePhotoKeyFrameAdjustmentControllerCreatingIfNecessary:0];
}

- (id)redEyeAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"redEye" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)redEyeAdjustmentController
{
  return [(PICompositionController *)self redEyeAdjustmentControllerCreatingIfNecessary:0];
}

- (id)cropAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"cropStraighten" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)cropAdjustmentController
{
  return [(PICompositionController *)self cropAdjustmentControllerCreatingIfNecessary:0];
}

- (id)smartBWAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"smartBlackAndWhite" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)smartBWAdjustmentController
{
  return [(PICompositionController *)self smartBWAdjustmentControllerCreatingIfNecessary:0];
}

- (id)smartColorAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"smartColor" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)smartColorAdjustmentController
{
  return [(PICompositionController *)self smartColorAdjustmentControllerCreatingIfNecessary:0];
}

- (id)smartToneAdjustmentControllerCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  return [(PICompositionController *)self _adjustmentControllerForKey:@"smartTone" creatingIfNecessary:v3 expectedClass:v5];
}

- (id)smartToneAdjustmentController
{
  return [(PICompositionController *)self smartToneAdjustmentControllerCreatingIfNecessary:0];
}

- (id)_adjustmentControllerForKey:(id)a3 creatingIfNecessary:(BOOL)a4 expectedClass:(Class)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(PICompositionController *)self adjustmentControllerForKey:v8];
  if (!v9 && v6)
  {
    [(PICompositionController *)self addAdjustmentWithKey:v8];
    uint64_t v9 = [(PICompositionController *)self adjustmentControllerForKey:v8];
  }
  if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = NUAssertLogger_20221();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v12 = [NSString stringWithFormat:@"Adjustment controller for key %@ is of class: %@, but was expected to be %@", v8, objc_opt_class(), a5];
      *(_DWORD *)buf = 138543362;
      BOOL v25 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v15 = NUAssertLogger_20221();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v19 = dispatch_get_specific(*v13);
        uint64_t v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        int v22 = [v20 callStackSymbols];
        int v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v25 = v19;
        __int16 v26 = 2114;
        id v27 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      long long v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v25 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    objc_opt_class();
    _NUAssertFailHandler();
  }

  return v9;
}

- (PIAdjustmentConstants)adjustmentConstants
{
  if (adjustmentConstants_onceToken != -1) {
    dispatch_once(&adjustmentConstants_onceToken, &__block_literal_global_20234);
  }
  v2 = (void *)adjustmentConstants_constants;
  return (PIAdjustmentConstants *)v2;
}

uint64_t __68__PICompositionController_AdjustmentExtensions__adjustmentConstants__block_invoke()
{
  adjustmentConstants_constants = +[PIPhotoEditHelper adjustmentConstants];
  return MEMORY[0x1F41817F8]();
}

@end