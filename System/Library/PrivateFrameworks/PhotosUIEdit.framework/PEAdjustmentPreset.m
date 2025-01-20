@interface PEAdjustmentPreset
+ (void)sanitizeCompositionController:(id)a3;
- (BOOL)_isCinematicEditSource:(id)a3;
- (BOOL)_isSpatialAudioEditSource:(id)a3;
- (BOOL)isAutoEnhanceEnabled;
- (NSDictionary)serializedDictionary;
- (NUComposition)composition;
- (PEAdjustmentPreset)initWithCompositionController:(id)a3 asset:(id)a4;
- (PEAdjustmentPreset)initWithCompositionController:(id)a3 asset:(id)a4 additionalSerializationEntries:(id)a5 includeSidecar:(BOOL)a6;
- (PEAdjustmentPreset)initWithPropertyListDictionary:(id)a3;
- (id)_serializeCompositionController:(id)a3 includeSidecar:(BOOL)a4;
- (id)analyticsPayload;
- (int64_t)actionType;
- (int64_t)autoType;
- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 completion:(id)a6;
- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 invalidAdjustmentKeys:(id)a6 completion:(id)a7;
- (void)applyToLoadResult:(id)a3 completion:(id)a4;
- (void)setComposition:(id)a3;
@end

@implementation PEAdjustmentPreset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedDictionary, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

- (NSDictionary)serializedDictionary
{
  return self->_serializedDictionary;
}

- (void)setComposition:(id)a3
{
}

- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 invalidAdjustmentKeys:(id)a6 completion:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v12 = (void (**)(id, uint64_t))a7;
  v13 = [(PEAdjustmentPreset *)self composition];
  if (v13)
  {
    uint64_t v14 = [v10 mediaType];
    v15 = [v10 source];
    uint64_t v16 = [v10 imageOrientation];
    v17 = (void *)[objc_alloc(MEMORY[0x263F5D560]) initWithComposition:v13];
    [v17 setSource:v15 mediaType:v14];
    [v17 setImageOrientation:v16];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          [v17 removeAdjustmentWithKey:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v20);
    }

    [v10 applyChangesFromCompositionController:v17];
    v23 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24[0] = 0;
      _os_log_impl(&dword_217B65000, v23, OS_LOG_TYPE_DEFAULT, "PEAdjustmentPreset applied edits to compositionController", (uint8_t *)v24, 2u);
    }

    v12[2](v12, 1);
  }
  else
  {
    v12[2](v12, 0);
  }
}

- (void)applyToCompositionController:(id)a3 asset:(id)a4 editSource:(id)a5 completion:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v20 adjustmentConstants];
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (![(PEAdjustmentPreset *)self _isCinematicEditSource:v11])
  {
    v15 = [v13 PIPortraitVideoAdjustmentKey];
    [v14 addObject:v15];
  }
  if (([v10 mediaSubtypes] & 0x10) == 0)
  {
    uint64_t v16 = [v13 PIDepthAdjustmentKey];
    [v14 addObject:v16];
  }
  if (![(PEAdjustmentPreset *)self _isSpatialAudioEditSource:v11]) {
    [v14 addObject:*MEMORY[0x263F5D6B8]];
  }
  if (!+[PESupport assetCanRenderStyles:v10]
    || (v17 = (void *)MEMORY[0x263F5D648],
        [v20 composition],
        id v18 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v17) = [v17 canRenderStylesOnComposition:v18],
        v18,
        (v17 & 1) == 0))
  {
    uint64_t v19 = [v13 PISemanticStyleAdjustmentKey];
    [v14 addObject:v19];
  }
  [(PEAdjustmentPreset *)self applyToCompositionController:v20 asset:v10 editSource:v11 invalidAdjustmentKeys:v14 completion:v12];
}

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [v7 compositionController];
  v8 = [v7 asset];
  v9 = [v7 editSource];

  [(PEAdjustmentPreset *)self applyToCompositionController:v10 asset:v8 editSource:v9 completion:v6];
}

- (BOOL)_isSpatialAudioEditSource:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  v4 = (void *)MEMORY[0x263EFA470];
  uint64_t v5 = [v3 videoURL];
  id v6 = [v4 assetWithURL:v5];

  LOBYTE(v5) = [MEMORY[0x263F586C0] assetIsCinematicAudio:v6];
  if (v5) {
    BOOL v7 = 1;
  }
  else {
LABEL_4:
  }
    BOOL v7 = 0;

  return v7;
}

- (BOOL)_isCinematicEditSource:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (void *)MEMORY[0x263EFA470];
    uint64_t v5 = [v3 videoURL];
    id v6 = [v4 assetWithURL:v5];

    if ([MEMORY[0x263F5D558] assetIsCinematicVideo:v6]) {
      char v7 = [MEMORY[0x263F5D558] currentSystemCanRenderAsset:v6];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_serializeCompositionController:(id)a3 includeSidecar:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PEEditAction.m", 179, @"Invalid parameter not satisfying: %@", @"compositionController" object file lineNumber description];
  }
  v8 = [v7 composition];
  v9 = [v8 contents];

  if (!v9)
  {
    v15 = 0;
    goto LABEL_23;
  }
  id v10 = [v7 smartToneAdjustmentController];
  if ([v10 isAuto])
  {
    [v10 inputLight];
    double v12 = v11;
    [v10 inputLightDefault];
    if (vabdd_f64(v12, v13) > 0.001) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  [(id)objc_opt_class() sanitizeCompositionController:v7];
  uint64_t v16 = (void *)MEMORY[0x263F5D588];
  v17 = [v7 composition];
  id v35 = 0;
  id v18 = [v16 adjustmentInformationForComposition:v17 skipMetadata:1 error:&v35];
  id v19 = v35;

  if (!v18)
  {
    id v20 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v19;
      _os_log_impl(&dword_217B65000, v20, OS_LOG_TYPE_ERROR, "PEAdjustmentPreset failed to serialize preset with error: %@", buf, 0xCu);
    }
    goto LABEL_21;
  }
  id v20 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v21 = [v18 objectForKeyedSubscript:*MEMORY[0x263F5D690]];
  [v20 setObject:v21 forKey:@"PEAdjustmentPresetCompositionKey"];

  v22 = [v18 objectForKeyedSubscript:*MEMORY[0x263F5D698]];
  [v20 setObject:v22 forKey:@"PEAdjustmentPresetFormatIdentifierKey"];

  v23 = [v18 objectForKeyedSubscript:*MEMORY[0x263F5D6A0]];
  [v20 setObject:v23 forKey:@"PEAdjustmentPresetFormatVersionKey"];

  v24 = [NSNumber numberWithInteger:v14];
  [v20 setObject:v24 forKey:@"PEAdjustmentPresetAutoKey"];

  if (!v4) {
    goto LABEL_15;
  }
  long long v25 = [v7 source];

  if (!v25) {
    goto LABEL_15;
  }
  id v26 = objc_alloc(MEMORY[0x263F5D598]);
  long long v27 = [v7 composition];
  long long v28 = (void *)[v26 initWithComposition:v27];

  id v34 = 0;
  v29 = [v28 serialize:&v34];
  id v30 = v34;
  if (!v29)
  {
    v31 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v30;
      _os_log_impl(&dword_217B65000, v31, OS_LOG_TYPE_ERROR, "PEAdjustmentPreset failed to serialize sidecar data, error: %@", buf, 0xCu);
    }

LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  [v20 setObject:v29 forKeyedSubscript:@"PEAdjustmentPresetSidecarDataKey"];

LABEL_15:
  id v20 = v20;
  v15 = v20;
LABEL_22:

LABEL_23:
  return v15;
}

- (int64_t)autoType
{
  v2 = [(PEAdjustmentPreset *)self serializedDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"PEAdjustmentPresetAutoKey"];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (BOOL)isAutoEnhanceEnabled
{
  return (unint64_t)([(PEAdjustmentPreset *)self autoType] - 1) < 2;
}

- (int64_t)actionType
{
  return 1;
}

- (NUComposition)composition
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  composition = self->_composition;
  if (composition) {
    goto LABEL_2;
  }
  uint64_t v5 = [(PEAdjustmentPreset *)self serializedDictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"PEAdjustmentPresetCompositionKey"];
  if (v6)
  {
    id v7 = (void *)v6;
    v8 = [v5 objectForKeyedSubscript:@"PEAdjustmentPresetSidecarDataKey"];
    if (v8)
    {
      id v21 = 0;
      uint64_t v9 = [MEMORY[0x263F5D598] loadFromDictionary:v8 error:&v21];
      id v10 = v21;
      double v11 = v10;
      if (!v9)
      {
        uint64_t v16 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v11;
          _os_log_impl(&dword_217B65000, v16, OS_LOG_TYPE_ERROR, "PEAdjustmentPreset failed to load composition sidecar data, error: %@", buf, 0xCu);
        }
LABEL_15:

        goto LABEL_16;
      }

      double v11 = v9;
    }
    else
    {
      double v11 = 0;
    }
    double v12 = (void *)MEMORY[0x263F5D588];
    double v13 = [v5 objectForKeyedSubscript:@"PEAdjustmentPresetFormatIdentifierKey"];
    uint64_t v14 = [v5 objectForKeyedSubscript:@"PEAdjustmentPresetFormatVersionKey"];
    id v20 = 0;
    v15 = [v12 deserializeCompositionFromData:v7 formatIdentifier:v13 formatVersion:v14 sidecarData:v11 error:&v20];
    uint64_t v16 = v20;
    v17 = self->_composition;
    self->_composition = v15;

    if (self->_composition)
    {

      composition = self->_composition;
LABEL_2:
      id v3 = composition;
      goto LABEL_17;
    }
    id v18 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_217B65000, v18, OS_LOG_TYPE_ERROR, "PEAdjustmentPreset failed to find composition with error: %@", buf, 0xCu);
    }

    goto LABEL_15;
  }
LABEL_16:

  id v3 = 0;
LABEL_17:
  return v3;
}

- (PEAdjustmentPreset)initWithCompositionController:(id)a3 asset:(id)a4
{
  return [(PEAdjustmentPreset *)self initWithCompositionController:a3 asset:a4 additionalSerializationEntries:MEMORY[0x263EFFA78] includeSidecar:1];
}

- (PEAdjustmentPreset)initWithCompositionController:(id)a3 asset:(id)a4 additionalSerializationEntries:(id)a5 includeSidecar:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  double v12 = (void *)[a3 copy];
  double v13 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v14 = [(PEAdjustmentPreset *)self _serializeCompositionController:v12 includeSidecar:v6];
  v15 = [v13 dictionaryWithDictionary:v14];

  if (v10)
  {
    uint64_t v16 = [v10 uuid];
    [v15 setObject:v16 forKeyedSubscript:@"PEAdjustmentPresetSourceAssetUUIDKey"];
  }
  [v15 addEntriesFromDictionary:v11];
  v17 = (void *)[v15 copy];
  id v18 = [(PEAdjustmentPreset *)self initWithPropertyListDictionary:v17];

  if (v18) {
    id v19 = v18;
  }

  return v18;
}

- (PEAdjustmentPreset)initWithPropertyListDictionary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PEAdjustmentPreset;
  BOOL v6 = [(PEAdjustmentPreset *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serializedDictionary, a3);
    v8 = v7;
  }

  return v7;
}

+ (void)sanitizeCompositionController:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 depthAdjustmentController];
  id v5 = v4;
  if (v4)
  {
    [v4 aperture];
    if (v6 == 0.0)
    {
      id v7 = [v5 depthInfo];
      v8 = [v7 objectForKey:*MEMORY[0x263F5D700]];

      if (v8)
      {
        uint64_t v9 = *MEMORY[0x263F5D6F8];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __52__PEAdjustmentPreset_sanitizeCompositionController___block_invoke;
        v16[3] = &unk_2642BECD0;
        id v17 = v8;
        [v3 modifyAdjustmentWithKey:v9 modificationBlock:v16];
      }
    }
    objc_super v10 = [v5 focusRect];

    if (!v10)
    {
      id v11 = [v5 depthInfo];
      double v12 = [v11 objectForKey:*MEMORY[0x263F5D708]];

      if (v12)
      {
        uint64_t v13 = *MEMORY[0x263F5D6F8];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __52__PEAdjustmentPreset_sanitizeCompositionController___block_invoke_2;
        v14[3] = &unk_2642BECD0;
        id v15 = v12;
        [v3 modifyAdjustmentWithKey:v13 modificationBlock:v14];
      }
    }
  }
}

void __52__PEAdjustmentPreset_sanitizeCompositionController___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 floatValue];
  [v4 setAperture:v3];
}

void __52__PEAdjustmentPreset_sanitizeCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)[v2 copy];
  [v3 setFocusRect:v4];
}

- (id)analyticsPayload
{
  v2 = [(PEAdjustmentPreset *)self composition];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F5D560]) initWithComposition:v2];
  id v4 = +[PEAnalyticsUtility analyticPayloadForCompositionController:v3];

  return v4;
}

@end