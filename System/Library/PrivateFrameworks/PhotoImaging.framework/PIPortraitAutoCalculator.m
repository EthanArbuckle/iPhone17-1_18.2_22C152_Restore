@interface PIPortraitAutoCalculator
+ (BOOL)canApplyPortraitEffectsWithMetadata:(id)a3;
+ (BOOL)isStillImageDisparity:(id)a3;
+ (BOOL)isTapToFocusEnabled:(id)a3;
+ (id)depthEffectInfoDictionaryFromFaceObservations:(id)a3 metadata:(id)a4 orientation:(int64_t)a5 valuesAtCapture:(id)a6;
+ (id)depthEffectInfoDictionaryFromFaceObservations:(id)a3 valuesAtCapture:(id)a4 lumaNoiseScale:(float)a5 orientation:(int64_t)a6;
+ (id)focusRectDictionaryFromMetadata:(id)a3;
+ (id)focusRectDictionaryFromRect:(CGRect)a3;
+ (id)portraitEffectInfoDictionaryFromFaceObservations:(id)a3 orientation:(int64_t)a4 valuesAtCapture:(id)a5;
+ (id)portraitInfoDictionaryFromCameraMetadata:(id)a3;
+ (id)portraitInfoDictionaryFromFaceObservations:(id)a3 metadata:(id)a4 orientation:(int64_t)a5 valuesAtCapture:(id)a6;
- (PIFaceObservationCache)faceObservationCache;
- (void)_calculateWithImageProperties:(id)a3 valuesAtCapture:(id)a4 completion:(id)a5;
- (void)setFaceObservationCache:(id)a3;
- (void)submit:(id)a3;
@end

@implementation PIPortraitAutoCalculator

- (void).cxx_destruct
{
}

- (void)setFaceObservationCache:(id)a3
{
}

- (PIFaceObservationCache)faceObservationCache
{
  return self->_faceObservationCache;
}

- (void)_calculateWithImageProperties:(id)a3 valuesAtCapture:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(NURenderRequest *)self composition];
  v12 = [v11 objectForKeyedSubscript:@"orientation"];

  v13 = [v12 objectForKeyedSubscript:@"value"];
  unsigned int v14 = [v13 intValue];
  if (v14 <= 1) {
    int v15 = 1;
  }
  else {
    int v15 = v14;
  }
  uint64_t v16 = v15;

  v17 = +[PIFaceObservationCache faceRequestWithRequest:self];
  v18 = [(NURenderRequest *)self responseQueue];
  [v17 setResponseQueue:v18];

  [v17 setName:@"PIPortraitAutoCalculator-faceDetect"];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __85__PIPortraitAutoCalculator__calculateWithImageProperties_valuesAtCapture_completion___block_invoke;
  v28 = &unk_1E5D81648;
  id v29 = v8;
  id v30 = v9;
  id v31 = v10;
  uint64_t v32 = v16;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  v22 = (void *)MEMORY[0x1AD0F8FE0](&v25);
  v23 = [(PIPortraitAutoCalculator *)self faceObservationCache];

  if (v23)
  {
    v24 = [(PIPortraitAutoCalculator *)self faceObservationCache];
    [v24 submit:v17 response:v22];
  }
  else
  {
    [v17 submit:v22];
  }
}

void __85__PIPortraitAutoCalculator__calculateWithImageProperties_valuesAtCapture_completion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = 0;
  v3 = [a2 result:&v10];
  id v4 = v10;
  if (v3)
  {
    v5 = [v3 faces];
    v6 = [*(id *)(a1 + 32) metadata];
    v7 = +[PIPortraitAutoCalculator portraitInfoDictionaryFromFaceObservations:v5 metadata:v6 orientation:*(void *)(a1 + 56) valuesAtCapture:*(void *)(a1 + 40)];

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v7];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    id v4 = (id)v8;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
  }
}

- (void)submit:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v13 = NUAssertLogger_25708();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unsigned int v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      id v30 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v17 = NUAssertLogger_25708();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        id v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v30 = v21;
        __int16 v31 = 2114;
        uint64_t v32 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v30 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4F7A520]);
  v7 = [(NURenderRequest *)self composition];
  uint64_t v8 = (void *)[v6 initWithComposition:v7];

  uint64_t v9 = [(NURenderRequest *)self responseQueue];
  [v8 setResponseQueue:v9];

  [v8 setName:@"PIPortraitAutoCalculator-getValuesAtCapture-imageProperties"];
  id v10 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"pre-Adjustments"];
  v28 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  [v8 setPipelineFilters:v11];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __35__PIPortraitAutoCalculator_submit___block_invoke;
  v26[3] = &unk_1E5D81798;
  v26[4] = self;
  id v27 = v5;
  id v12 = v5;
  [v8 submit:v26];
}

void __35__PIPortraitAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  v50[13] = *MEMORY[0x1E4F143B8];
  id v48 = 0;
  v3 = [a2 result:&v48];
  id v4 = v48;
  if (v3)
  {
    v5 = [v3 properties];
    id v47 = 0;
    id v6 = +[PIValuesAtCapture valuesAtCaptureFromImageProperties:v5 error:&v47];
    id v7 = v47;

    if (v6)
    {
      uint64_t v8 = [*(id *)(a1 + 32) composition];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"depthEffect"];

      id v10 = [*(id *)(a1 + 32) composition];
      v11 = [v10 objectForKeyedSubscript:@"portraitEffect"];

      id v12 = [v9 objectForKeyedSubscript:@"depthInfo"];
      v46 = [v11 objectForKeyedSubscript:@"portraitInfo"];
      if (v12
        && ([v12 objectForKeyedSubscript:@"focusRect"],
            v13 = objc_claimAutoreleasedReturnValue(),
            v13,
            v13)
        && v46)
      {
        v42 = v11;
        uint64_t v14 = [v12 objectForKeyedSubscript:@"capturedAperture"];
        if (v14)
        {
          v45 = (void *)v14;
        }
        else
        {
          BOOL v18 = NSNumber;
          [v6 aperture];
          uint64_t v19 = objc_msgSend(v18, "numberWithFloat:");
          id v20 = (void *)[v12 mutableCopy];
          v45 = (void *)v19;
          [v20 setObject:v19 forKeyedSubscript:@"capturedAperture"];

          id v12 = v20;
        }
        uint64_t v21 = [v46 objectForKeyedSubscript:@"capturedPortraitStrength"];
        id v44 = v7;
        if (v21)
        {
          v22 = (void *)v21;
        }
        else
        {
          id v23 = NSNumber;
          [v6 portraitStrength];
          uint64_t v24 = objc_msgSend(v23, "numberWithFloat:");
          uint64_t v25 = (void *)[v46 mutableCopy];
          v22 = (void *)v24;
          [v25 setObject:v24 forKeyedSubscript:@"capturedPortraitStrength"];

          v46 = v25;
        }
        uint64_t v26 = [v12 objectForKeyedSubscript:@"focusRect"];
        BOOL v38 = +[PIPortraitAutoCalculator isStillImageDisparity:v6];
        BOOL v39 = +[PIPortraitAutoCalculator isTapToFocusEnabled:v6];
        v43 = v9;
        BOOL v27 = (unint64_t)[v6 portraitMajorVersion] >= 2
           && [v6 portraitMinorVersion] != 0;
        v49[0] = @"depthInfo";
        v49[1] = @"aperture";
        v50[0] = v12;
        v50[1] = v45;
        v49[2] = @"focusRect";
        v49[3] = @"portraitInfo";
        v50[2] = v26;
        v50[3] = v46;
        v35 = v22;
        v50[4] = v22;
        v49[4] = @"portraitStrength";
        v49[5] = @"spillMatteAllowed";
        v41 = (void *)v26;
        v40 = [NSNumber numberWithBool:v27];
        v50[5] = v40;
        v49[6] = @"glassesMatteAllowed";
        v37 = [NSNumber numberWithBool:v27];
        v50[6] = v37;
        v49[7] = @"capturedPortraitMajorVersion";
        v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "portraitMajorVersion"));
        v50[7] = v36;
        v49[8] = @"capturedPortraitMinorVersion";
        v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "portraitMinorVersion"));
        v50[8] = v34;
        v49[9] = @"depthInfoMajorVersion";
        v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "depthVersionInfo"));
        v50[9] = v28;
        v49[10] = @"depthInfoMinorVersion";
        id v29 = objc_msgSend(NSNumber, "numberWithInt:", (unint64_t)objc_msgSend(v6, "depthVersionInfo") >> 32);
        v50[10] = v29;
        v49[11] = @"portraitDisableStage";
        id v30 = [NSNumber numberWithBool:v38];
        v50[11] = v30;
        v49[12] = @"tapToFocusEnabled";
        __int16 v31 = [NSNumber numberWithBool:v39];
        v50[12] = v31;
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:13];

        uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v32];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        uint64_t v9 = v43;
        id v7 = v44;
        v11 = v42;
      }
      else
      {
        [*(id *)(a1 + 32) _calculateWithImageProperties:v5 valuesAtCapture:v6 completion:*(void *)(a1 + 40)];
      }
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 40);
      id v17 = objc_alloc(MEMORY[0x1E4F7A660]);
      uint64_t v9 = (void *)[v17 initWithResult:MEMORY[0x1E4F1CC08]];
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v9);
    }

    id v4 = v7;
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 40);
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v5);
  }
}

+ (id)portraitInfoDictionaryFromCameraMetadata:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  if (!v3)
  {
    v43 = NUAssertLogger_25708();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      id v44 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "metadata != nil");
      *(_DWORD *)buf = 138543362;
      v62 = v44;
      _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v45 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v4 = NUAssertLogger_25708();
    BOOL v47 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        v50 = dispatch_get_specific(*v45);
        v51 = (void *)MEMORY[0x1E4F29060];
        v52 = v50;
        v53 = [v51 callStackSymbols];
        v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v50;
        __int16 v63 = 2114;
        id v64 = v54;
        _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v47)
    {
      id v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      v49 = [v48 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v49;
      _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v55 = "metadata != nil";
    _NUAssertFailHandler();
    __break(1u);
    goto LABEL_40;
  }
  id v4 = v3;
  if (portraitInfoDictionaryFromCameraMetadata__onceToken != -1) {
    dispatch_once(&portraitInfoDictionaryFromCameraMetadata__onceToken, &__block_literal_global_25881);
  }
  v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = portraitInfoDictionaryFromCameraMetadata__s_expectedClasses;
  id v7 = [v4 faceObservationsData];
  id v60 = 0;
  uint64_t v8 = [v5 unarchivedObjectOfClasses:v6 fromData:v7 error:&v60];
  id v56 = v60;

  if (!v8)
  {
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_6:
      uint64_t v9 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v62 = v4;
        __int16 v63 = 2112;
        id v64 = v56;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Couldn't deserialize face observations from metadata: %@, assuming empty, error: %@.", buf, 0x16u);
      }
      uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_9;
    }
LABEL_40:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_394);
    goto LABEL_6;
  }
LABEL_9:
  id v10 = v8;
  v59 = [v4 indexesOfShallowDepthOfFieldObservations];
  v11 = v10;
  if (v59)
  {
    v11 = [v10 objectsAtIndexes:v59];
  }
  uint64_t v12 = (int)[v4 faceOrientation];
  if (NUOrientationIsValid()) {
    goto LABEL_19;
  }
  if (![v10 count])
  {
    uint64_t v12 = 1;
LABEL_19:
    [v4 focusRectangle];
    v57 = objc_msgSend(a1, "focusRectDictionaryFromRect:");
    [v4 minimumApertureFocalRatio];
    if (v15 <= 0.0)
    {
      int v17 = 2143289344;
    }
    else
    {
      [v4 minimumApertureFocalRatio];
      int v17 = v16;
    }
    [v4 maximumApertureFocalRatio];
    if (v18 <= 0.0)
    {
      int v20 = 2143289344;
    }
    else
    {
      [v4 maximumApertureFocalRatio];
      int v20 = v19;
    }
    unsigned int v21 = [v4 SDOFRenderingVersion];
    v22 = [PIValuesAtCapture alloc];
    [v4 apertureFocalRatio];
    int v24 = v23;
    [v4 portraitLightingEffectStrength];
    LODWORD(v26) = v25;
    LODWORD(v27) = v17;
    LODWORD(v28) = v20;
    LODWORD(v29) = v24;
    id v30 = [(PIValuesAtCapture *)v22 initFromMinAperture:v57 maxAperture:v21 - (unint64_t)(v21 > 3) aperture:0 focusRect:v27 portraitStrength:v28 SDOFRenderingVersion:v29 depthVersionInfo:v26];
    BOOL v31 = (unint64_t)[v30 portraitMajorVersion] >= 2
       && [v30 portraitMinorVersion] != 0;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 luminanceNoiseAmplitude];
    uint64_t v32 = objc_msgSend(a1, "depthEffectInfoDictionaryFromFaceObservations:valuesAtCapture:lumaNoiseScale:orientation:", v11, v30, v12);
    [v14 setObject:v32 forKeyedSubscript:@"depthInfo"];

    uint64_t v33 = NSNumber;
    [v4 apertureFocalRatio];
    v34 = objc_msgSend(v33, "numberWithFloat:");
    [v14 setObject:v34 forKeyedSubscript:@"aperture"];

    v35 = [v30 focusRect];
    v36 = (void *)[v35 copy];
    [v14 setObject:v36 forKeyedSubscript:@"focusRect"];

    v37 = [a1 portraitEffectInfoDictionaryFromFaceObservations:v10 orientation:v12 valuesAtCapture:v30];
    [v14 setObject:v37 forKeyedSubscript:@"portraitInfo"];

    BOOL v38 = NSNumber;
    [v30 portraitStrength];
    BOOL v39 = objc_msgSend(v38, "numberWithFloat:");
    [v14 setObject:v39 forKeyedSubscript:@"portraitStrength"];

    v40 = [NSNumber numberWithBool:v31];
    [v14 setObject:v40 forKeyedSubscript:@"spillMatteAllowed"];

    v41 = [NSNumber numberWithBool:v31];
    [v14 setObject:v41 forKeyedSubscript:@"glassesMatteAllowed"];

    goto LABEL_29;
  }
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_394);
  }
  v13 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v4;
    _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Couldn't deserialize face observations from metadata: %@", buf, 0xCu);
  }
  id v14 = (id)MEMORY[0x1E4F1CC08];
LABEL_29:

  return v14;
}

void __69__PIPortraitAutoCalculator_portraitInfoDictionaryFromCameraMetadata___block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)portraitInfoDictionaryFromCameraMetadata__s_expectedClasses;
  portraitInfoDictionaryFromCameraMetadata__s_expectedClasses = v2;
}

+ (id)portraitEffectInfoDictionaryFromFaceObservations:(id)a3 orientation:(int64_t)a4 valuesAtCapture:(id)a5
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v70 = a5;
  if (!v7)
  {
    BOOL v47 = NUAssertLogger_25708();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      id v48 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "faceObservations != nil");
      *(_DWORD *)buf = 138543362;
      v99 = v48;
      _os_log_error_impl(&dword_1A9680000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v49 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v51 = NUAssertLogger_25708();
    BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v52)
      {
        id v60 = dispatch_get_specific(*v49);
        v61 = (void *)MEMORY[0x1E4F29060];
        id v62 = v60;
        __int16 v63 = [v61 callStackSymbols];
        id v64 = [v63 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v99 = v60;
        __int16 v100 = 2114;
        v101 = v64;
        _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v52)
    {
LABEL_37:
      v58 = [MEMORY[0x1E4F29060] callStackSymbols];
      v59 = [v58 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v99 = v59;
      _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_43:

    _NUAssertFailHandler();
    __break(1u);
  }
  if ((NUOrientationIsValid() & 1) == 0)
  {
    v53 = NUAssertLogger_25708();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(orientation)");
      *(_DWORD *)buf = 138543362;
      v99 = v54;
      _os_log_error_impl(&dword_1A9680000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v55 = (const void **)MEMORY[0x1E4F7A308];
    id v56 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v51 = NUAssertLogger_25708();
    BOOL v57 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (!v56)
    {
      if (!v57) {
        goto LABEL_43;
      }
      goto LABEL_37;
    }
    if (v57)
    {
      uint64_t v65 = dispatch_get_specific(*v55);
      v66 = (void *)MEMORY[0x1E4F29060];
      id v67 = v65;
      v68 = [v66 callStackSymbols];
      v69 = [v68 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v99 = v65;
      __int16 v100 = 2114;
      v101 = v69;
      _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_43;
  }
  int64_t v73 = a4;
  v74 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  obuint64_t j = v7;
  uint64_t v75 = [obj countByEnumeratingWithState:&v86 objects:v97 count:16];
  if (v75)
  {
    uint64_t v72 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v87 != v72) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v86 + 1) + 8 * i);
        objc_sync_enter(v8);
        id v77 = v8;
        [v8 boundingBox];
        CGFloat v10 = v9;
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        v78 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:15];
        v95[0] = @"x";
        v104.origin.x = v10;
        v104.origin.y = v12;
        v104.size.width = v14;
        v104.size.height = v16;
        int v17 = [NSNumber numberWithDouble:CGRectGetMinX(v104)];
        v96[0] = v17;
        v95[1] = @"y";
        v105.origin.x = v10;
        v105.origin.y = v12;
        v105.size.width = v14;
        v105.size.height = v16;
        float v18 = [NSNumber numberWithDouble:CGRectGetMinY(v105)];
        v96[1] = v18;
        v95[2] = @"w";
        v106.origin.x = v10;
        v106.origin.y = v12;
        v106.size.width = v14;
        v106.size.height = v16;
        int v19 = [NSNumber numberWithDouble:CGRectGetWidth(v106)];
        v96[2] = v19;
        v95[3] = @"h";
        v107.origin.x = v10;
        v107.origin.y = v12;
        v107.size.width = v14;
        v107.size.height = v16;
        int v20 = [NSNumber numberWithDouble:CGRectGetHeight(v107)];
        v96[3] = v20;
        unsigned int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:4];
        [v78 setObject:v21 forKeyedSubscript:@"faceBoundingBox"];

        v22 = [NSNumber numberWithInteger:v73];
        [v78 setObject:v22 forKeyedSubscript:@"orientation"];

        int v23 = NSNumber;
        [v77 faceJunkinessIndex];
        int v24 = objc_msgSend(v23, "numberWithFloat:");
        [v78 setObject:v24 forKeyedSubscript:@"faceJunkinessIndex"];

        int v25 = NSNumber;
        [v77 faceOrientationIndex];
        double v26 = objc_msgSend(v25, "numberWithFloat:");
        [v78 setObject:v26 forKeyedSubscript:@"faceOrientationIndex"];

        double v27 = [v77 roll];
        [v78 setObject:v27 forKeyedSubscript:@"roll"];

        double v28 = [v77 yaw];
        [v78 setObject:v28 forKeyedSubscript:@"yaw"];

        v80 = [v77 landmarks];
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        uint64_t v29 = [&unk_1F000AC58 countByEnumeratingWithState:&v82 objects:v94 count:16];
        if (v29)
        {
          uint64_t v79 = *(void *)v83;
          do
          {
            uint64_t v81 = v29;
            for (uint64_t j = 0; j != v81; ++j)
            {
              if (*(void *)v83 != v79) {
                objc_enumerationMutation(&unk_1F000AC58);
              }
              uint64_t v31 = *(void *)(*((void *)&v82 + 1) + 8 * j);
              uint64_t v32 = [v80 valueForKey:v31];
              uint64_t v33 = v32;
              if (v32)
              {
                uint64_t v34 = [v32 pointCount];
                uint64_t v35 = [v33 normalizedPoints];
                uint64_t v36 = v35;
                if (v34 && v35 != 0)
                {
                  BOOL v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v34];
                  BOOL v39 = (double *)(v36 + 8);
                  do
                  {
                    v92[0] = @"x";
                    v40 = [NSNumber numberWithDouble:*(v39 - 1)];
                    v92[1] = @"y";
                    v93[0] = v40;
                    v41 = [NSNumber numberWithDouble:*v39];
                    v93[1] = v41;
                    v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];
                    [v38 addObject:v42];

                    v39 += 2;
                    --v34;
                  }
                  while (v34);
                  [v78 setObject:v38 forKeyedSubscript:v31];
                }
              }
            }
            uint64_t v29 = [&unk_1F000AC58 countByEnumeratingWithState:&v82 objects:v94 count:16];
          }
          while (v29);
        }
        [v74 addObject:v78];

        objc_sync_exit(v77);
      }
      uint64_t v75 = [obj countByEnumeratingWithState:&v86 objects:v97 count:16];
    }
    while (v75);
  }

  v90[0] = @"faceLandmarks";
  v90[1] = @"capturedPortraitStrength";
  v91[0] = v74;
  v43 = NSNumber;
  [v70 portraitStrength];
  id v44 = objc_msgSend(v43, "numberWithFloat:");
  v91[1] = v44;
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];

  return v45;
}

+ (id)depthEffectInfoDictionaryFromFaceObservations:(id)a3 valuesAtCapture:(id)a4 lumaNoiseScale:(float)a5 orientation:(int64_t)a6
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v77 = a4;
  uint64_t v9 = NUOrientationInverse();
  id v10 = v8;
  double v11 = v10;
  if ((unint64_t)[v10 count] >= 5)
  {
    double v11 = objc_msgSend(v10, "subarrayWithRange:", 0, 4);
  }
  long long v82 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count", v10));
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v11;
  uint64_t v83 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v83)
  {
    uint64_t v81 = *(void *)v85;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v85 != v81) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v84 + 1) + 8 * v12);
        CGFloat v14 = [MEMORY[0x1E4F1CA60] dictionary];
        double v15 = [v13 landmarks];
        [v13 boundingBox];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        id v24 = [v15 leftEye];
        +[PIAutoCalculatorUtils averagePoints:pointCount:](PIAutoCalculatorUtils, "averagePoints:pointCount:", [v24 normalizedPoints], objc_msgSend(v24, "pointCount"));
        +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v9);
        double v26 = v25;
        double v27 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v14 setObject:v27 forKeyedSubscript:@"leftEyeX"];

        double v28 = [NSNumber numberWithDouble:v26];
        [v14 setObject:v28 forKeyedSubscript:@"leftEyeY"];

        uint64_t v29 = [v15 rightEye];

        id v30 = v29;
        +[PIAutoCalculatorUtils averagePoints:pointCount:](PIAutoCalculatorUtils, "averagePoints:pointCount:", [v30 normalizedPoints], objc_msgSend(v30, "pointCount"));
        +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v9);
        double v32 = v31;
        uint64_t v33 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v14 setObject:v33 forKeyedSubscript:@"rightEyeX"];

        uint64_t v34 = [NSNumber numberWithDouble:v32];
        [v14 setObject:v34 forKeyedSubscript:@"rightEyeY"];

        uint64_t v35 = [v15 nose];

        id v36 = v35;
        +[PIAutoCalculatorUtils averagePoints:pointCount:](PIAutoCalculatorUtils, "averagePoints:pointCount:", [v36 normalizedPoints], objc_msgSend(v36, "pointCount"));
        +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v9);
        double v38 = v37;
        BOOL v39 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v14 setObject:v39 forKeyedSubscript:@"noseX"];

        v40 = [NSNumber numberWithDouble:v38];
        [v14 setObject:v40 forKeyedSubscript:@"noseY"];

        v41 = [v15 allPoints];

        if ((unint64_t)[v41 pointCount] > 0x2E)
        {
          uint64_t v42 = [v41 normalizedPoints];
          +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v9, *(double *)(v42 + 736), *(double *)(v42 + 744), v17, v19, v21, v23);
          double v44 = v43;
          v45 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v14 setObject:v45 forKeyedSubscript:@"chinX"];

          v46 = [NSNumber numberWithDouble:v44];
          [v14 setObject:v46 forKeyedSubscript:@"chinY"];

          goto LABEL_24;
        }
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_389);
        }
        BOOL v47 = (void *)*MEMORY[0x1E4F7A748];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
        {
          id v48 = NSString;
          v49 = v47;
          v50 = [v48 stringWithFormat:@"Insufficient number of landmark points"];
          *(_DWORD *)buf = 138543362;
          long long v89 = v50;
          _os_log_impl(&dword_1A9680000, v49, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v51 = *MEMORY[0x1E4F7A750];
        }
        else
        {
          uint64_t v51 = -1;
        }
        if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
        {
          if (v51 != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_389);
          }
          BOOL v52 = (void *)*MEMORY[0x1E4F7A748];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
          v54 = (void *)MEMORY[0x1E4F29060];
          id v79 = specific;
          log = v52;
          v55 = [v54 callStackSymbols];
          id v56 = [v55 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          long long v89 = specific;
          __int16 v90 = 2114;
          v91 = v56;
          BOOL v57 = log;
          _os_log_error_impl(&dword_1A9680000, log, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
        else
        {
          if (v51 != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_389);
          }
          v58 = (void *)*MEMORY[0x1E4F7A748];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          v59 = (void *)MEMORY[0x1E4F29060];
          BOOL v57 = v58;
          id v60 = [v59 callStackSymbols];
          v61 = [v60 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          long long v89 = v61;
          _os_log_error_impl(&dword_1A9680000, v57, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
LABEL_23:
        _NUAssertContinueHandler();
LABEL_24:
        [v82 addObject:v14];

        ++v12;
      }
      while (v83 != v12);
      uint64_t v62 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
      uint64_t v83 = v62;
    }
    while (v62);
  }

  id v63 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v64 = [v77 minimumAperture];
  [v63 setObject:v64 forKeyedSubscript:@"minimumAperture"];

  uint64_t v65 = [v77 maximumAperture];
  [v63 setObject:v65 forKeyedSubscript:@"maximumAperture"];

  v66 = NSNumber;
  [v77 aperture];
  id v67 = objc_msgSend(v66, "numberWithFloat:");
  [v63 setObject:v67 forKeyedSubscript:@"capturedAperture"];

  *(float *)&double v68 = a5;
  v69 = [NSNumber numberWithFloat:v68];
  [v63 setObject:v69 forKeyedSubscript:@"lumaNoiseScale"];

  id v70 = [v77 focusRect];

  if (v70)
  {
    v71 = [v77 focusRect];
    uint64_t v72 = (void *)[v71 copy];
    [v63 setObject:v72 forKeyedSubscript:@"focusRect"];
  }
  [v63 setObject:v82 forKeyedSubscript:@"faces"];
  int64_t v73 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v77, "SDOFRenderingVersion"));
  [v63 setObject:v73 forKeyedSubscript:@"SDOFRenderingVersion"];

  v74 = (void *)[v63 copy];
  return v74;
}

+ (id)depthEffectInfoDictionaryFromFaceObservations:(id)a3 metadata:(id)a4 orientation:(int64_t)a5 valuesAtCapture:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
  double v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F15558]];
  double v15 = v13;
  if (v13) {
    [v13 floatValue];
  }
  else {
    LODWORD(v14) = 1008981770;
  }
  double v16 = [a1 depthEffectInfoDictionaryFromFaceObservations:v10 valuesAtCapture:v11 lumaNoiseScale:a5 orientation:v14];

  return v16;
}

+ (id)portraitInfoDictionaryFromFaceObservations:(id)a3 metadata:(id)a4 orientation:(int64_t)a5 valuesAtCapture:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10)
  {
    uint64_t v34 = NUAssertLogger_25708();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "faceObservations != nil");
      uint64_t v35 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v67 = v35;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v36 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v38 = NUAssertLogger_25708();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        BOOL v52 = dispatch_get_specific(*v36);
        v53 = (void *)MEMORY[0x1E4F29060];
        id v54 = v52;
        id v36 = [v53 callStackSymbols];
        v55 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v67 = (const void **)v52;
        __int16 v68 = 2114;
        v69 = v55;
        _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v36 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v67 = v36;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v44 = _NUAssertFailHandler();
    goto LABEL_31;
  }
  if (!v11)
  {
    v41 = NUAssertLogger_25708();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "metadata != nil");
      uint64_t v42 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v67 = v42;
      _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v36 = (const void **)MEMORY[0x1E4F7A308];
    double v43 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v38 = NUAssertLogger_25708();
    int v44 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (!v43)
    {
      if (v44)
      {
        v45 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v36 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v67 = v36;
        _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_33:

      int v49 = _NUAssertFailHandler();
      goto LABEL_34;
    }
LABEL_31:
    if (v44)
    {
      id v56 = dispatch_get_specific(*v36);
      BOOL v57 = (void *)MEMORY[0x1E4F29060];
      id v58 = v56;
      id v36 = [v57 callStackSymbols];
      v59 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v67 = (const void **)v56;
      __int16 v68 = 2114;
      v69 = v59;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_33;
  }
  double v13 = v12;
  if ((NUOrientationIsValid() & 1) == 0)
  {
    v46 = NUAssertLogger_25708();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(orientation)");
      BOOL v47 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v67 = v47;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v36 = (const void **)MEMORY[0x1E4F7A308];
    id v48 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v38 = NUAssertLogger_25708();
    int v49 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (!v48)
    {
      if (v49)
      {
        v50 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v67 = v51;
        _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_36;
    }
LABEL_34:
    if (v49)
    {
      id v60 = dispatch_get_specific(*v36);
      v61 = (void *)MEMORY[0x1E4F29060];
      id v62 = v60;
      id v63 = [v61 callStackSymbols];
      id v64 = [v63 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v67 = (const void **)v60;
      __int16 v68 = 2114;
      v69 = v64;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_36:

    _NUAssertFailHandler();
  }
  if ([a1 canApplyPortraitEffectsWithMetadata:v11])
  {
    double v14 = [a1 portraitEffectInfoDictionaryFromFaceObservations:v10 orientation:a5 valuesAtCapture:v13];
  }
  else
  {
    double v14 = (void *)MEMORY[0x1E4F1CC08];
  }
  BOOL v15 = +[PIPortraitAutoCalculator isStillImageDisparity:v13];
  BOOL v65 = +[PIPortraitAutoCalculator isTapToFocusEnabled:v13];
  BOOL v16 = (unint64_t)[v13 portraitMajorVersion] >= 2
     && [v13 portraitMinorVersion] != 0;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v18 = [a1 depthEffectInfoDictionaryFromFaceObservations:v10 metadata:v11 orientation:a5 valuesAtCapture:v13];
  [v17 setObject:v18 forKeyedSubscript:@"depthInfo"];

  double v19 = NSNumber;
  [v13 aperture];
  double v20 = objc_msgSend(v19, "numberWithFloat:");
  [v17 setObject:v20 forKeyedSubscript:@"aperture"];

  double v21 = [v13 focusRect];
  double v22 = (void *)[v21 copy];
  [v17 setObject:v22 forKeyedSubscript:@"focusRect"];

  [v17 setObject:v14 forKeyedSubscript:@"portraitInfo"];
  double v23 = NSNumber;
  [v13 portraitStrength];
  id v24 = objc_msgSend(v23, "numberWithFloat:");
  [v17 setObject:v24 forKeyedSubscript:@"portraitStrength"];

  double v25 = [NSNumber numberWithBool:v16];
  [v17 setObject:v25 forKeyedSubscript:@"spillMatteAllowed"];

  double v26 = [NSNumber numberWithBool:v16];
  [v17 setObject:v26 forKeyedSubscript:@"glassesMatteAllowed"];

  double v27 = [NSNumber numberWithBool:v15];
  [v17 setObject:v27 forKeyedSubscript:@"portraitDisableStage"];

  double v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "portraitMajorVersion"));
  [v17 setObject:v28 forKeyedSubscript:@"capturedPortraitMajorVersion"];

  uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "portraitMinorVersion"));
  [v17 setObject:v29 forKeyedSubscript:@"capturedPortraitMinorVersion"];

  id v30 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "depthVersionInfo"));
  [v17 setObject:v30 forKeyedSubscript:@"depthInfoMajorVersion"];

  double v31 = objc_msgSend(NSNumber, "numberWithInt:", (unint64_t)objc_msgSend(v13, "depthVersionInfo") >> 32);
  [v17 setObject:v31 forKeyedSubscript:@"depthInfoMinorVersion"];

  double v32 = [NSNumber numberWithBool:v65];
  [v17 setObject:v32 forKeyedSubscript:@"tapToFocusEnabled"];

  return v17;
}

+ (BOOL)canApplyPortraitEffectsWithMetadata:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F15580]];
  char v5 = [v4 unsignedIntegerValue];

  return v5 & 1;
}

+ (BOOL)isTapToFocusEnabled:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 portraitMajorVersion];
  unint64_t v5 = [v3 SDOFRenderingVersion];

  return v4 > 1 && v5 > 5;
}

+ (BOOL)isStillImageDisparity:(id)a3
{
  return (((unint64_t)[a3 depthVersionInfo] >> 32) - 30000) >> 4 < 0x271;
}

+ (id)focusRectDictionaryFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v25[4] = *MEMORY[0x1E4F143B8];
  BOOL v7 = a3.origin.x < 0.0 || a3.origin.x > 1.0;
  if (v7
    || (a3.origin.y >= 0.0 ? (BOOL v8 = a3.origin.y > 1.0) : (BOOL v8 = 1),
        v8
     || a3.size.width <= 0.0
     || !NUIsRoughlyLessThan()
     || height <= 0.0
     || !NUIsRoughlyLessThan()))
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_394);
    }
    double v14 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      int v16 = 134218752;
      double v17 = x;
      __int16 v18 = 2048;
      double v19 = y;
      __int16 v20 = 2048;
      double v21 = width;
      __int16 v22 = 2048;
      double v23 = height;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Invalid focus rect: {%g,%g,%g,%g}", (uint8_t *)&v16, 0x2Au);
    }
    double v13 = 0;
  }
  else
  {
    v24[0] = @"x";
    uint64_t v9 = [NSNumber numberWithDouble:x];
    v25[0] = v9;
    v24[1] = @"y";
    id v10 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(1.0 - y - height, 0.0));
    v25[1] = v10;
    v24[2] = @"w";
    id v11 = [NSNumber numberWithDouble:width];
    v25[2] = v11;
    v24[3] = @"h";
    id v12 = [NSNumber numberWithDouble:height];
    v25[3] = v12;
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  }
  return v13;
}

+ (id)focusRectDictionaryFromMetadata:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
  uint64_t v6 = [v5 integerValue];

  BOOL v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
  uint64_t v8 = [v7 integerValue];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_394);
    }
    id v10 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v4;
      _os_log_impl(&dword_1A9680000, v10, OS_LOG_TYPE_DEFAULT, "Cant get focusRect - Metadata dictionary missing fullSizeWith or fullSizeHeight:\n%@", buf, 0xCu);
    }
    id v11 = 0;
  }
  else
  {
    id v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2F6D8]];
    double v13 = v12;
    if (v12)
    {
      double v14 = [v12 objectForKeyedSubscript:@"Regions"];
      BOOL v15 = v14;
      if (v14)
      {
        int v16 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F2F778]];
        double v17 = v16;
        if (v16)
        {
          id v53 = a1;
          id v54 = v13;
          v55 = v16;
          id v56 = v15;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v18 = v16;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:v61 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v58;
            uint64_t v22 = *MEMORY[0x1E4F2F780];
            uint64_t v23 = *MEMORY[0x1E4F2F768];
LABEL_16:
            uint64_t v24 = 0;
            while (1)
            {
              if (*(void *)v58 != v21) {
                objc_enumerationMutation(v18);
              }
              double v25 = *(void **)(*((void *)&v57 + 1) + 8 * v24);
              double v26 = objc_msgSend(v25, "objectForKeyedSubscript:", v22, v53);
              char v27 = [v26 isEqualToString:v23];

              if (v27) {
                break;
              }
              if (v20 == ++v24)
              {
                uint64_t v20 = [v18 countByEnumeratingWithState:&v57 objects:v61 count:16];
                if (v20) {
                  goto LABEL_16;
                }
                goto LABEL_22;
              }
            }
            id v30 = v25;

            if (!v30) {
              goto LABEL_50;
            }
            double v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F2F790]];
            double v32 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F2F798]];
            uint64_t v33 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F2F788]];
            uint64_t v34 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F2F770]];
            uint64_t v35 = (void *)v34;
            if (v31) {
              BOOL v36 = v32 == 0;
            }
            else {
              BOOL v36 = 1;
            }
            if (v36 || v33 == 0 || v34 == 0)
            {
              if (*MEMORY[0x1E4F7A750] != -1) {
                dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_394);
              }
              double v13 = v54;
              BOOL v39 = *MEMORY[0x1E4F7A758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v63 = v30;
                _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Cant get focusRect - Malformed focus rect dictionary:\n%@", buf, 0xCu);
              }
              id v11 = 0;
            }
            else
            {
              [v31 floatValue];
              float v43 = v42;
              [v32 floatValue];
              float v45 = v44;
              [v33 floatValue];
              float v47 = v46;
              [v35 floatValue];
              float v49 = v48;
              float v50 = v43 - (float)(v47 * 0.5);
              float v51 = v45 - (float)(v48 * 0.5);
              if (v50 < 0.0 && NUIsRoughlyEqual()) {
                float v50 = 0.0;
              }
              double v13 = v54;
              if (v51 < 0.0 && NUIsRoughlyEqual()) {
                float v51 = 0.0;
              }
              id v11 = objc_msgSend(v53, "focusRectDictionaryFromRect:", v50, v51, v47, v49);
            }

            BOOL v15 = v56;
          }
          else
          {
LABEL_22:

LABEL_50:
            if (*MEMORY[0x1E4F7A750] != -1) {
              dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_394);
            }
            double v13 = v54;
            BOOL v15 = v56;
            v40 = *MEMORY[0x1E4F7A758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v63 = v18;
              _os_log_impl(&dword_1A9680000, v40, OS_LOG_TYPE_DEFAULT, "Cant get focusRect - Region list does not contain a focus rect:\n%@", buf, 0xCu);
            }
            id v11 = 0;
          }
          double v17 = v55;
        }
        else
        {
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_394);
          }
          v41 = *MEMORY[0x1E4F7A758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v63 = v15;
            _os_log_impl(&dword_1A9680000, v41, OS_LOG_TYPE_DEFAULT, "Cant get focusRect - MWG region dictionary missing region list:\n%@", buf, 0xCu);
          }
          id v11 = 0;
        }
      }
      else
      {
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_394);
        }
        uint64_t v29 = *MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v63 = v13;
          _os_log_impl(&dword_1A9680000, v29, OS_LOG_TYPE_DEFAULT, "Cant get focusRect - Exif aux dictionary missing MWG region dictionary:\n%@", buf, 0xCu);
        }
        id v11 = 0;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_394);
      }
      double v28 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v4;
        _os_log_impl(&dword_1A9680000, v28, OS_LOG_TYPE_DEFAULT, "Cant get focusRect - Metadata dictionary missing exif aux dictionary:\n%@", buf, 0xCu);
      }
      id v11 = 0;
    }
  }
  return v11;
}

@end