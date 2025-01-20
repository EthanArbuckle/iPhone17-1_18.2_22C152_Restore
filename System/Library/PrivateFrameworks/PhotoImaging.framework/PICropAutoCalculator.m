@interface PICropAutoCalculator
+ (id)updateCropAdjustment:(id)a3 after:(id)a4 error:(id *)a5;
- (BOOL)debugFilesEnabled;
- (BOOL)shouldPerformAutoCrop;
- (BOOL)shouldPerformAutoStraighten;
- (BOOL)shouldUseAutoStraightenVerticalDetector;
- (BOOL)undoExifOrientation:(id *)a3 error:(id *)a4;
- (NSNumber)autoStraightenDominantAngleDiffThreshold;
- (NSNumber)autoStraightenVerticalAngleThreshold;
- (NSString)debugFilesPrefix;
- (PICropAutoCalculator)initWithComposition:(id)a3;
- (PIFaceObservationCache)faceObservationCache;
- (double)maxAutoStraighten;
- (double)minAutoStraighten;
- (id)imageProperties:(id *)a3;
- (void)setAutoStraightenDominantAngleDiffThreshold:(id)a3;
- (void)setAutoStraightenVerticalAngleThreshold:(id)a3;
- (void)setDebugFilesEnabled:(BOOL)a3;
- (void)setDebugFilesPrefix:(id)a3;
- (void)setFaceObservationCache:(id)a3;
- (void)setMaxAutoStraighten:(double)a3;
- (void)setMinAutoStraighten:(double)a3;
- (void)setShouldPerformAutoCrop:(BOOL)a3;
- (void)setShouldPerformAutoStraighten:(BOOL)a3;
- (void)setShouldUseAutoStraightenVerticalDetector:(BOOL)a3;
- (void)submit:(id)a3;
@end

@implementation PICropAutoCalculator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugFilesPrefix, 0);
  objc_storeStrong((id *)&self->_autoStraightenDominantAngleDiffThreshold, 0);
  objc_storeStrong((id *)&self->_autoStraightenVerticalAngleThreshold, 0);
  objc_storeStrong((id *)&self->_faceObservationCache, 0);
}

- (void)setDebugFilesPrefix:(id)a3
{
}

- (NSString)debugFilesPrefix
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDebugFilesEnabled:(BOOL)a3
{
  self->_debugFilesEnabled = a3;
}

- (BOOL)debugFilesEnabled
{
  return self->_debugFilesEnabled;
}

- (void)setMinAutoStraighten:(double)a3
{
  self->_minAutoStraighten = a3;
}

- (double)minAutoStraighten
{
  return self->_minAutoStraighten;
}

- (void)setMaxAutoStraighten:(double)a3
{
  self->_maxAutoStraighten = a3;
}

- (double)maxAutoStraighten
{
  return self->_maxAutoStraighten;
}

- (void)setAutoStraightenDominantAngleDiffThreshold:(id)a3
{
}

- (NSNumber)autoStraightenDominantAngleDiffThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAutoStraightenVerticalAngleThreshold:(id)a3
{
}

- (NSNumber)autoStraightenVerticalAngleThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setShouldUseAutoStraightenVerticalDetector:(BOOL)a3
{
  self->_shouldUseAutoStraightenVerticalDetector = a3;
}

- (BOOL)shouldUseAutoStraightenVerticalDetector
{
  return self->_shouldUseAutoStraightenVerticalDetector;
}

- (void)setShouldPerformAutoStraighten:(BOOL)a3
{
  self->_shouldPerformAutoStraighten = a3;
}

- (BOOL)shouldPerformAutoStraighten
{
  return self->_shouldPerformAutoStraighten;
}

- (void)setShouldPerformAutoCrop:(BOOL)a3
{
  self->_shouldPerformAutoCrop = a3;
}

- (BOOL)shouldPerformAutoCrop
{
  return self->_shouldPerformAutoCrop;
}

- (void)setFaceObservationCache:(id)a3
{
}

- (PIFaceObservationCache)faceObservationCache
{
  return self->_faceObservationCache;
}

- (void)submit:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v43 = NUAssertLogger_23751();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v44;
      _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v45 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v47 = NUAssertLogger_23751();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (!v48) {
        goto LABEL_28;
      }
      v51 = dispatch_get_specific(*v45);
      v52 = (void *)MEMORY[0x1E4F29060];
      id v50 = v51;
      v53 = [v52 callStackSymbols];
      v54 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v54;
      _os_log_error_impl(&dword_1A9680000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    else
    {
      if (!v48) {
        goto LABEL_28;
      }
      v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v50;
      _os_log_error_impl(&dword_1A9680000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_28:

    _NUAssertFailHandler();
  }
  v5 = v4;
  if ([(PICropAutoCalculator *)self debugFilesEnabled]) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  else {
    id v6 = 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PICropAutoCalculator shouldPerformAutoStraighten](self, "shouldPerformAutoStraighten"));
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F1E350]];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[PICropAutoCalculator shouldPerformAutoCrop](self, "shouldPerformAutoCrop"));
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1E338]];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PICropAutoCalculator shouldUseAutoStraightenVerticalDetector](self, "shouldUseAutoStraightenVerticalDetector"));
  [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1E360]];

  [v7 setObject:self->_autoStraightenVerticalAngleThreshold forKeyedSubscript:*MEMORY[0x1E4F1E368]];
  [v7 setObject:self->_autoStraightenDominantAngleDiffThreshold forKeyedSubscript:*MEMORY[0x1E4F1E358]];
  uint64_t v11 = [(PICropAutoCalculator *)self faceObservationCache];
  if (v11)
  {
    v12 = (void *)v11;
    BOOL v13 = [(PICropAutoCalculator *)self shouldPerformAutoCrop];

    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F7A638]);
      v15 = [(NURenderRequest *)self composition];
      v16 = (void *)[v14 initWithComposition:v15];

      v17 = +[PIFaceObservationCache faceRequestWithRequest:v16];
      [v17 setName:@"PICropAutoCalculator-faceDetection"];
      v18 = [(PICropAutoCalculator *)self faceObservationCache];
      id v70 = 0;
      v19 = [v18 submitSynchronous:v17 error:&v70];
      id v20 = v70;

      v21 = [v19 faces];

      if (v21)
      {
        id v55 = v20;
        v57 = v17;
        v58 = v16;
        id v59 = v6;
        v60 = v7;
        v22 = objc_opt_new();
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        v56 = v19;
        id obj = [v19 faces];
        uint64_t v23 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v67 != v25) {
                objc_enumerationMutation(obj);
              }
              v27 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              memset(buf, 0, 32);
              [v27 boundingBox];
              *(void *)buf = v28;
              *(void *)&buf[8] = v29;
              *(void *)&buf[16] = v30;
              *(void *)&buf[24] = v31;
              v72 = @"bounds";
              v32 = [MEMORY[0x1E4F29238] valueWithBytes:buf objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
              v73 = v32;
              v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];

              [v22 addObject:v33];
            }
            uint64_t v24 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
          }
          while (v24);
        }

        id v7 = v60;
        [v60 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F1E348]];

        id v6 = v59;
        v17 = v57;
        v16 = v58;
        id v20 = v55;
        v19 = v56;
      }
    }
  }
  if (v6)
  {
    v34 = NSNumber;
    [(PICropAutoCalculator *)self maxAutoStraighten];
    v35 = objc_msgSend(v34, "numberWithDouble:");
    [v6 setObject:v35 forKeyedSubscript:@"maxAutoStraighten"];

    v36 = (void *)[v7 copy];
    [v6 setObject:v36 forKeyedSubscript:@"filterOptions"];
  }
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F7A4D8]) initWithRequest:self dataExtractor:@"CIAutoStraighten" options:v7];
  v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A468]), "initWithTargetPixelSize:", 2048, 2048);
  [v37 setScalePolicy:v38];

  [v37 setSampleMode:2];
  v39 = +[PIPipelineFilters autoCropFilter];
  v71 = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  [v37 setPipelineFilters:v40];

  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __31__PICropAutoCalculator_submit___block_invoke;
  v62[3] = &unk_1E5D81180;
  id v63 = v6;
  v64 = self;
  id v65 = v5;
  id v41 = v5;
  id v42 = v6;
  [v37 submit:v62];
}

void __31__PICropAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  v51[0] = 0;
  v3 = [a2 result:v51];
  id v4 = v51[0];
  if (!v3)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    goto LABEL_21;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [v3 data];
  id v7 = v6;
  if (*(void *)(a1 + 32))
  {
    v8 = [v6 description];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"data"];
  }
  v9 = [v7 objectForKeyedSubscript:@"straightenAngleInDegreesCCW"];
  [v9 doubleValue];
  double v11 = fabs(v10);
  [*(id *)(a1 + 40) maxAutoStraighten];
  if (v11 <= v12)
  {
    id v14 = v5;
    BOOL v13 = v9;
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"limitExceeded"];
    BOOL v13 = &unk_1F000A058;
    id v14 = v5;
  }
  [v14 setObject:v13 forKeyedSubscript:@"angle"];
  [v9 doubleValue];
  double v17 = fabs(v16);
  [*(id *)(a1 + 40) minAutoStraighten];
  if (v17 <= v18)
  {
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"belowMinimum"];
    [v5 setObject:&unk_1F000A058 forKeyedSubscript:@"angle"];
  }
  v19 = [v3 geometry];
  id v20 = [v7 objectForKeyedSubscript:@"autoCrop"];
  v21 = v20;
  if (v20 && v19)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    [v20 CGRectValue];
    NUPixelRectFromCGRect();
    long long v47 = 0u;
    long long v48 = 0u;
    [v19 renderScale];
    NUScaleInvert();
    long long v45 = 0u;
    long long v46 = 0u;
    NUPixelRectScaleRational();
    v22 = *(void **)(a1 + 40);
    id v44 = 0;
    [v22 undoExifOrientation:&v47 error:&v44];
    id v23 = v44;

    uint64_t v24 = [NSNumber numberWithInteger:(void)v47];
    [v5 setObject:v24 forKeyedSubscript:@"xOrigin"];

    uint64_t v25 = [NSNumber numberWithInteger:*((void *)&v47 + 1)];
    [v5 setObject:v25 forKeyedSubscript:@"yOrigin"];

    v26 = [NSNumber numberWithInteger:(void)v48];
    [v5 setObject:v26 forKeyedSubscript:@"width"];

    v27 = [NSNumber numberWithInteger:*((void *)&v48 + 1)];
    [v5 setObject:v27 forKeyedSubscript:@"height"];

    id v4 = v23;
  }
  if (!*(void *)(a1 + 32))
  {
    if (v4) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v5];
    goto LABEL_20;
  }
  uint64_t v28 = (void *)[v5 copy];
  [*(id *)(a1 + 32) setObject:v28 forKeyedSubscript:@"result"];

  if (!v4)
  {
    uint64_t v31 = [v5 objectForKeyedSubscript:@"angle"];
    [*(id *)(a1 + 32) setObject:v31 forKeyedSubscript:@"angle"];

    goto LABEL_19;
  }
  uint64_t v29 = [v4 description];
  [*(id *)(a1 + 32) setObject:v29 forKeyedSubscript:@"error"];

LABEL_17:
  uint64_t v30 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
LABEL_20:
  v15 = (void *)v30;

LABEL_21:
  if (*(void *)(a1 + 32))
  {
    v32 = [*(id *)(a1 + 40) composition];
    v33 = +[PICaptureDebugUtilities captureDebugDirectoryForComposition:v32];

    if (v33)
    {
      v34 = NSString;
      v35 = [*(id *)(a1 + 40) debugFilesPrefix];
      v36 = [v34 stringWithFormat:@"%@AutoCropEvaluation-txt.DBG", v35];
      v37 = [v33 URLByAppendingPathComponent:v36];

      v38 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__PICropAutoCalculator_submit___block_invoke_88;
      block[3] = &unk_1E5D81158;
      id v41 = v33;
      id v42 = *(id *)(a1 + 32);
      id v43 = v37;
      id v39 = v37;
      dispatch_async(v38, block);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __31__PICropAutoCalculator_submit___block_invoke_88(void *a1)
{
  v9[4] = *(id *)MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = a1[4];
  v9[0] = 0;
  [v2 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:v9];
  id v4 = v9[0];

  uint64_t v5 = a1[5];
  id v8 = v4;
  id v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:3 error:&v8];
  id v7 = v8;

  [v6 writeToURL:a1[6] atomically:1];
}

- (BOOL)undoExifOrientation:(id *)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v15 = NUAssertLogger_23751();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      double v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_23751();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        id v23 = dispatch_get_specific(*v17);
        uint64_t v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v7 = [(PICropAutoCalculator *)self imageProperties:a4];
  id v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  if (![v7 size] || (objc_msgSend(v8, "size"), !v9))
  {
    double v12 = (void *)MEMORY[0x1E4F7A438];
    BOOL v13 = [(NURenderRequest *)self composition];
    *a4 = [v12 errorWithCode:2 reason:@"Source geometry has 0 size" object:v13];

LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  [v8 orientation];
  NUOrientationInverse();
  [v8 size];
  NUOrientationTransformImageSize();
  NUOrientationTransformImageRect();
  $0AC6E346AE4835514AAA8AC86D8F4844 v10 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16];
  a3->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf;
  a3->var1 = v10;
  BOOL v11 = 1;
LABEL_8:

  return v11;
}

- (id)imageProperties:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F7A520]);
  id v6 = [(NURenderRequest *)self composition];
  id v7 = (void *)[v5 initWithComposition:v6];

  [v7 setName:@"PICropAutoCalculator-imageProperties"];
  id v8 = [v7 submitSynchronous:a3];
  uint64_t v9 = [v8 properties];

  return v9;
}

- (PICropAutoCalculator)initWithComposition:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PICropAutoCalculator;
  uint64_t v3 = [(NURenderRequest *)&v9 initWithComposition:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_maxAutoStraighten = 10.0;
    v3->_shouldPerformAutoCrop = 1;
    v3->_shouldPerformAutoStraighten = 1;
    v3->_shouldUseAutoStraightenVerticalDetector = 0;
    autoStraightenVerticalAngleThreshold = v3->_autoStraightenVerticalAngleThreshold;
    v3->_autoStraightenVerticalAngleThreshold = 0;

    autoStraightenDominantAngleDiffThreshold = v4->_autoStraightenDominantAngleDiffThreshold;
    v4->_autoStraightenDominantAngleDiffThreshold = 0;

    v4->_minAutoStraighten = 1.0;
    debugFilesPrefix = v4->_debugFilesPrefix;
    v4->_debugFilesPrefix = (NSString *)&stru_1EFFD8610;
  }
  return v4;
}

+ (id)updateCropAdjustment:(id)a3 after:(id)a4 error:(id *)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a5)
  {
    v54 = NUAssertLogger_23751();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      id v55 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v78 = v55;
      _os_log_error_impl(&dword_1A9680000, v54, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v56 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v58 = NUAssertLogger_23751();
    BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v59)
      {
        v62 = dispatch_get_specific(*v56);
        id v63 = (void *)MEMORY[0x1E4F29060];
        id v64 = v62;
        id v65 = [v63 callStackSymbols];
        long long v66 = [v65 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v78 = v62;
        __int16 v79 = 2114;
        v80 = v66;
        _os_log_error_impl(&dword_1A9680000, v58, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v59)
    {
      v60 = [MEMORY[0x1E4F29060] callStackSymbols];
      v61 = [v60 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v78 = v61;
      _os_log_error_impl(&dword_1A9680000, v58, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  objc_super v9 = v8;
  $0AC6E346AE4835514AAA8AC86D8F4844 v10 = [[PICompositionController alloc] initWithComposition:v7];
  BOOL v11 = [[PICompositionController alloc] initWithComposition:v9];
  double v12 = [(PICompositionController *)v10 cropAdjustmentController];
  if (([v12 enabled] & 1) == 0)
  {

    goto LABEL_9;
  }
  BOOL v13 = [(PICompositionController *)v11 cropAdjustmentController];
  char v14 = [v13 enabled];

  if ((v14 & 1) == 0)
  {
LABEL_9:
    id v22 = v9;
    goto LABEL_27;
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F7A498]) initWithComposition:v7];
  double v16 = +[PIPipelineFilters inputToCropFilter];
  uint64_t v76 = v16;
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  [v15 setPipelineFilters:v17];

  [v15 setName:@"PICropAutoCalculator-getBeforeGeometry"];
  double v18 = [v15 submitSynchronous:a5];
  if (v18)
  {
    [v15 setComposition:v9];
    [v15 setName:@"PICropAutoCalculator-getAfterGeometry"];
    v19 = [v15 submitSynchronous:a5];
    if (v19)
    {
      BOOL v20 = [v18 geometry];
      v21 = v20;
      if (v20)
      {
        [v20 extent];
      }
      else
      {
        long long v74 = 0u;
        long long v75 = 0u;
      }
      id v23 = [v19 geometry];
      uint64_t v24 = v23;
      if (v23)
      {
        [v23 extent];
      }
      else
      {
        long long v72 = 0u;
        long long v73 = 0u;
      }
      int v25 = NUPixelRectEqualToRect();

      if (v25)
      {
        id v22 = v9;
      }
      else
      {
        v26 = [v18 geometry];
        v27 = v26;
        if (v26)
        {
          [v26 extent];
        }
        else
        {
          long long v70 = 0u;
          long long v71 = 0u;
        }
        NUPixelRectToCGRect();

        uint64_t v28 = [v19 geometry];
        uint64_t v29 = v28;
        if (v28)
        {
          [v28 extent];
        }
        else
        {
          long long v68 = 0u;
          long long v69 = 0u;
        }
        NUPixelRectToCGRect();
        uint64_t v31 = v30;
        uint64_t v33 = v32;
        double v35 = v34;
        double v37 = v36;

        v38 = [(PICompositionController *)v10 cropAdjustmentController];
        [v38 cropRect];

        NUCGRectConvertFromRectToRect();
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;
        double v46 = v45;
        long long v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A418]), "initWithMasterImageSize:", v35, v37, v31, v33, *(void *)&v35, *(void *)&v37);
        long long v48 = [(PICompositionController *)v11 cropAdjustmentController];
        [v48 yawRadians];
        objc_msgSend(v47, "setYawRadians:");
        [v48 pitchRadians];
        objc_msgSend(v47, "setPitchRadians:");
        [v48 angleRadians];
        objc_msgSend(v47, "setRollRadians:");
        objc_msgSend(v47, "setCropRect:", v40, v42, v44, v46);
        [v47 cropRect];
        objc_msgSend(v47, "integralCropRect:");
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __68__PICropAutoCalculator_Utilities__updateCropAdjustment_after_error___block_invoke;
        v67[3] = &__block_descriptor_64_e36_v16__0__PICropAdjustmentController_8l;
        v67[4] = v49;
        v67[5] = v50;
        v67[6] = v51;
        v67[7] = v52;
        [(PICompositionController *)v11 modifyAdjustmentWithKey:@"cropStraighten" modificationBlock:v67];
        id v22 = [(PICompositionController *)v11 composition];
      }
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

LABEL_27:
  return v22;
}

uint64_t __68__PICropAutoCalculator_Utilities__updateCropAdjustment_after_error___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setCropRect:", a1[4], a1[5], a1[6], a1[7]);
}

@end