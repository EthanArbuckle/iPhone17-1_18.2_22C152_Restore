@interface PIApertureRedEyeAutoCalculator
- (id)apertureRedEyeResultFromFaceObservations:(id)a3 imageSize:(id)a4;
- (void)cancel;
- (void)submit:(id)a3;
@end

@implementation PIApertureRedEyeAutoCalculator

- (void).cxx_destruct
{
}

- (id)apertureRedEyeResultFromFaceObservations:(id)a3 imageSize:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [(NURenderRequest *)self composition];
  v7 = [v6 objectForKeyedSubscript:@"orientation"];

  v62 = v7;
  v8 = [v7 objectForKeyedSubscript:@"value"];
  [v8 intValue];

  uint64_t v64 = NUOrientationInverse();
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v69 objects:v83 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v70;
    uint64_t v63 = *(void *)v70;
    do
    {
      uint64_t v12 = 0;
      uint64_t v66 = v10;
      do
      {
        if (*(void *)v70 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v69 + 1) + 8 * v12);
        [v13 boundingBox];
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        v22 = [v13 landmarks];
        v23 = [v22 leftEye];

        v24 = [v13 landmarks];
        v25 = [v24 rightEye];

        if ([v23 pointCount] && objc_msgSend(v25, "pointCount"))
        {
          id v26 = v23;
          +[PIAutoCalculatorUtils averageCGPoints:pointCount:](PIAutoCalculatorUtils, "averageCGPoints:pointCount:", [v26 normalizedPoints], objc_msgSend(v26, "pointCount"));
          double v28 = v27;
          double v30 = v29;
          id v31 = v25;
          +[PIAutoCalculatorUtils averageCGPoints:pointCount:](PIAutoCalculatorUtils, "averageCGPoints:pointCount:", [v31 normalizedPoints], objc_msgSend(v31, "pointCount"));
          double v33 = v32;
          double v35 = v34;
          +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v64, v28, v30, v15, v17, v19, v21);
          double v37 = v36;
          double v39 = v38;
          +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v64, v33, v35, v15, v17, v19, v21);
          double v41 = v40;
          double v43 = v42;
          double v44 = sqrt((v37 - v40) * (v37 - v40) + (v39 - v42) * (v39 - v42)) * 0.11;
          uint64_t v68 = NUOrientationTransformImageSize();
          double v46 = v39 * (double)v45;
          double v47 = v41 * (double)v68;
          double v48 = v43 * (double)v45;
          double v49 = v44 * (double)v68;
          v81[0] = @"center";
          v79[0] = @"x";
          v50 = [NSNumber numberWithDouble:v37 * (double)v68];
          v79[1] = @"y";
          v80[0] = v50;
          v51 = [NSNumber numberWithDouble:v46];
          v80[1] = v51;
          v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
          v82[0] = v52;
          v81[1] = @"radius";
          v53 = [NSNumber numberWithDouble:v49];
          v81[2] = @"sensitivity";
          v82[1] = v53;
          v82[2] = &unk_1F000A608;
          v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
          [v65 addObject:v54];

          v77[0] = @"center";
          v75[0] = @"x";
          v55 = [NSNumber numberWithDouble:v47];
          v75[1] = @"y";
          v76[0] = v55;
          v56 = [NSNumber numberWithDouble:v48];
          v76[1] = v56;
          v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
          v78[0] = v57;
          v77[1] = @"radius";
          v58 = [NSNumber numberWithDouble:v49];
          v77[2] = @"sensitivity";
          v78[1] = v58;
          v78[2] = &unk_1F000A608;
          v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:3];
          [v65 addObject:v59];

          uint64_t v11 = v63;
          uint64_t v10 = v66;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v69 objects:v83 count:16];
    }
    while (v10);
  }

  v73 = @"redEyeSpots";
  id v74 = v65;
  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];

  return v60;
}

- (void)submit:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v13 = NUAssertLogger_18295();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      double v30 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v17 = NUAssertLogger_18295();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        double v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v30 = v21;
        __int16 v31 = 2114;
        double v32 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      double v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v30 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = v4;
  v6 = (NUFaceDetectionRequest *)[objc_alloc(MEMORY[0x1E4F7A440]) initWithRequest:self];
  faceRequest = self->_faceRequest;
  self->_faceRequest = v6;

  [(NUFaceDetectionRequest *)self->_faceRequest setName:@"PIApertureRedEyeAutoCalculator-faceDetection"];
  v8 = +[PIPipelineFilters stopAtTagIncludeOrientationFilter:@"pre-Adjustments"];
  double v28 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  [(NUFaceDetectionRequest *)self->_faceRequest setPipelineFilters:v9];

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:1741824];
  [(NUFaceDetectionRequest *)self->_faceRequest setScalePolicy:v10];

  [(NUFaceDetectionRequest *)self->_faceRequest setSampleMode:3];
  uint64_t v11 = self->_faceRequest;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __41__PIApertureRedEyeAutoCalculator_submit___block_invoke;
  v26[3] = &unk_1E5D81798;
  v26[4] = self;
  id v27 = v5;
  id v12 = v5;
  [(NUFaceDetectionRequest *)v11 submit:v26];
}

void __41__PIApertureRedEyeAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id v12 = 0;
  v3 = [a2 result:&v12];
  id v4 = v12;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    v6 = [v3 faces];
    uint64_t v7 = [v3 imageSize];
    uint64_t v9 = objc_msgSend(v5, "apertureRedEyeResultFromFaceObservations:imageSize:", v6, v7, v8);

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v9];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id v4 = (id)v10;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);
  }
}

- (void)cancel
{
  id v2 = [(NUFaceDetectionRequest *)self->_faceRequest renderContext];
  [v2 cancelAllRequests];
}

@end