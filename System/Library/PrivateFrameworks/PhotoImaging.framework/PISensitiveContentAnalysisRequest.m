@interface PISensitiveContentAnalysisRequest
+ (BOOL)currentSensitivityExceedsThresholds:(double)a3 initialSensitivity:(double)a4;
+ (BOOL)currentSensitivityExceedsThresholdsV1:(double)a3 initialSensitivity:(double)a4;
+ (BOOL)currentSensitivityExceedsThresholdsV2:(double)a3 initialSensitivity:(double)a4;
- (OS_dispatch_queue)sanitizeQueue;
- (PISensitiveContentAnalysisRequest)initWithComposition:(id)a3;
- (id)dumpFileName;
- (int64_t)mediaComponentType;
- (void)resolveWithInputBufferResponse:(id)a3 completion:(id)a4;
- (void)setSanitizeQueue:(id)a3;
- (void)submit:(id)a3;
@end

@implementation PISensitiveContentAnalysisRequest

- (void).cxx_destruct
{
}

- (void)setSanitizeQueue:(id)a3
{
}

- (OS_dispatch_queue)sanitizeQueue
{
  return self->_sanitizeQueue;
}

- (void)submit:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PISensitiveContentAnalysisRequest *)self sanitizeQueue];

  if (!v5)
  {
    v12 = NUAssertLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [NSString stringWithFormat:@"Sanitize queue not initialized"];
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v16 = NUAssertLogger();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific(*v14);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v20;
        __int16 v29 = 2114;
        v30 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v19;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x40000];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A4C8]) initWithRequest:self];
  [v7 setScalePolicy:v6];
  v8 = [(PISensitiveContentAnalysisRequest *)self sanitizeQueue];
  [v7 setResponseQueue:v8];

  v9 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
  [v7 setColorSpace:v9];

  v10 = [MEMORY[0x1E4F7A5D8] BGRA8];
  [v7 setPixelFormat:v10];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __44__PISensitiveContentAnalysisRequest_submit___block_invoke;
  v25[3] = &unk_1E5D81798;
  v25[4] = self;
  id v26 = v4;
  id v11 = v4;
  [v7 submit:v25];
}

uint64_t __44__PISensitiveContentAnalysisRequest_submit___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolveWithInputBufferResponse:a2 completion:*(void *)(a1 + 40)];
}

- (void)resolveWithInputBufferResponse:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __79__PISensitiveContentAnalysisRequest_resolveWithInputBufferResponse_completion___block_invoke;
  v51[3] = &unk_1E5D7ED38;
  v51[4] = self;
  id v7 = v6;
  id v52 = v7;
  id v8 = a3;
  v9 = (void (**)(void, void))MEMORY[0x1AD0F8FE0](v51);
  id v50 = 0;
  v10 = [v8 result:&v50];

  id v11 = v50;
  if (v10)
  {
    gotLoadHelper_x8__OBJC_CLASS___SCMLImageSanitizerConfiguration(v12);
    id v14 = objc_alloc_init(*(Class *)(v13 + 1584));
    [v14 setBackends:1];
    [v14 setGranularity:2];
    if (objc_opt_respondsToSelector()) {
      [v14 setMode:3];
    }
    gotLoadHelper_x8__OBJC_CLASS___SCMLImageSanitizer(v15);
    id v17 = objc_alloc(*(Class *)(v16 + 1576));
    id v49 = v11;
    v18 = (void *)[v17 initWithConfiguration:v14 error:&v49];
    id v19 = v49;

    if (v18)
    {
      v20 = [v10 buffer];
      uint64_t v21 = [v20 CVPixelBuffer];

      id v48 = v19;
      id v22 = [v18 sanitizePixelBuffer:v21 error:&v48];
      id v11 = v48;

      if (v22)
      {
        v43 = v18;
        v44 = v22;
        v23 = [[_PISensitiveContentAnalysisResult alloc] initWithSanitization:v22];
        v24 = +[PIGlobalSettings globalSettings];
        int v25 = [v24 sensitivityCheckDumpsImages];

        if (v25)
        {
          id v26 = [(PISensitiveContentAnalysisRequest *)self dumpFileName];
          v42 = v23;
          [(_PISensitiveContentAnalysisResult *)v23 sensitivityScore];
          uint64_t v28 = objc_msgSend(v26, "stringByAppendingFormat:", @"-score_%f.jpg", v27);

          __int16 v29 = NSTemporaryDirectory();
          v41 = (void *)v28;
          v30 = [v29 stringByAppendingPathComponent:v28];

          uint64_t v31 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v21];
          v32 = [MEMORY[0x1E4F1E018] context];
          v33 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
          uint64_t v34 = [v33 CGColorSpace];
          v40 = (void *)v31;
          v35 = [v32 JPEGRepresentationOfImage:v31 colorSpace:v34 options:MEMORY[0x1E4F1CC08]];

          [v35 writeToFile:v30 atomically:1];
          if (*MEMORY[0x1E4F7A750] != -1) {
            dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_175);
          }
          v36 = *MEMORY[0x1E4F7A758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v30;
            _os_log_impl(&dword_1A9680000, v36, OS_LOG_TYPE_DEFAULT, "Dumped sensitivity image to %@", buf, 0xCu);
          }

          v23 = v42;
        }
        v37 = [(NURenderRequest *)self responseQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __79__PISensitiveContentAnalysisRequest_resolveWithInputBufferResponse_completion___block_invoke_144;
        block[3] = &unk_1E5D80C50;
        v46 = v23;
        id v47 = v7;
        v38 = v23;
        dispatch_async(v37, block);

        v18 = v43;
        id v22 = v44;
      }
      else
      {
        uint64_t v39 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to run SCMLImageSanitizer" object:v18 underlyingError:v11];

        v9[2](v9, v39);
        id v11 = (id)v39;
      }
    }
    else
    {
      id v11 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Couldn't create SCMLImageSanitizer" object:v14 underlyingError:v19];

      ((void (**)(void, id))v9)[2](v9, v11);
    }
  }
  else
  {
    ((void (**)(void, id))v9)[2](v9, v11);
  }
}

void __79__PISensitiveContentAnalysisRequest_resolveWithInputBufferResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) responseQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PISensitiveContentAnalysisRequest_resolveWithInputBufferResponse_completion___block_invoke_2;
  v7[3] = &unk_1E5D80C50;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __79__PISensitiveContentAnalysisRequest_resolveWithInputBufferResponse_completion___block_invoke_144(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __79__PISensitiveContentAnalysisRequest_resolveWithInputBufferResponse_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)dumpFileName
{
  id v2 = (void *)MEMORY[0x1E4F7A408];
  id v3 = [(NURenderRequest *)self composition];
  uint64_t v4 = [v2 debugDiagnosticNameForComposition:v3];

  if (v4) {
    id v5 = (__CFString *)v4;
  }
  else {
    id v5 = @"SensitivityCheckImage";
  }
  uint64_t v6 = dumpFileName_sDumpIndex++;
  id v7 = [NSString stringWithFormat:@"%@-%ld", v5, v6];

  return v7;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (PISensitiveContentAnalysisRequest)initWithComposition:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PISensitiveContentAnalysisRequest;
  id v3 = [(NURenderRequest *)&v10 initWithComposition:a3];
  id v4 = [(NURenderRequest *)v3 name];
  id v5 = (const char *)[v4 UTF8String];
  uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
  sanitizeQueue = v3->_sanitizeQueue;
  v3->_sanitizeQueue = (OS_dispatch_queue *)v7;

  return v3;
}

+ (BOOL)currentSensitivityExceedsThresholds:(double)a3 initialSensitivity:(double)a4
{
  dispatch_queue_t v7 = +[PIGlobalSettings globalSettings];
  int v8 = [v7 sensitivityCheckVersion2Thresholds];

  if (v8)
  {
    return [a1 currentSensitivityExceedsThresholdsV2:a3 initialSensitivity:a4];
  }
  else
  {
    return [a1 currentSensitivityExceedsThresholdsV1:a3 initialSensitivity:a4];
  }
}

+ (BOOL)currentSensitivityExceedsThresholdsV2:(double)a3 initialSensitivity:(double)a4
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__PISensitiveContentAnalysisRequest_currentSensitivityExceedsThresholdsV2_initialSensitivity___block_invoke_2;
  v12[3] = &unk_1E5D7ED10;
  id v13 = &__block_literal_global_111;
  uint64_t v5 = MEMORY[0x1AD0F8FE0](v12, a2);
  uint64_t v6 = (void *)v5;
  float64x2_t v7 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vcgtq_f64((float64x2_t)xmmword_1A980B890, v7), (int32x4_t)vcgtq_f64((float64x2_t)xmmword_1A980B8A0, v7)))) & 1) != 0|| a4 < 0.6|| a4 < 0.8)
  {
    char v9 = (*(uint64_t (**)(uint64_t))(v5 + 16))(v5);
    if (a3 > 0.8) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v9;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

BOOL __94__PISensitiveContentAnalysisRequest_currentSensitivityExceedsThresholdsV2_initialSensitivity___block_invoke_2(uint64_t a1, double a2, double a3)
{
  int v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  int v7 = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a3);
  if (v7 <= v6) {
    return 0;
  }
  if (v7 == 2)
  {
    double v8 = vabdd_f64(a3, a2);
    double v9 = 0.002;
  }
  else if (v7 == 3 && v6 == 2)
  {
    double v8 = vabdd_f64(a3, a2);
    double v9 = 0.02;
  }
  else
  {
    if ((v7 != 4 || v6 != 3) && (v7 != 5 || v6 != 4) && (v7 != 6 || v6 != 5)) {
      return 1;
    }
    double v8 = vabdd_f64(a3, a2);
    double v9 = 0.04;
  }
  return v8 > v9;
}

uint64_t __94__PISensitiveContentAnalysisRequest_currentSensitivityExceedsThresholdsV2_initialSensitivity___block_invoke(double a1)
{
  if (a1 < 0.01) {
    return 1;
  }
  if (a1 < 0.11) {
    return 2;
  }
  if (a1 < 0.2) {
    return 3;
  }
  if (a1 < 0.45) {
    return 4;
  }
  if (a1 < 0.6) {
    return 5;
  }
  if (a1 >= 0.8) {
    return 7;
  }
  return 6;
}

+ (BOOL)currentSensitivityExceedsThresholdsV1:(double)a3 initialSensitivity:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a4 >= 0.25)
  {
    if (a4 >= 0.45)
    {
      if (a4 >= 0.6)
      {
        if (a4 >= 0.8) {
          unsigned int v6 = 5;
        }
        else {
          unsigned int v6 = 4;
        }
      }
      else
      {
        unsigned int v6 = 3;
      }
    }
    else
    {
      unsigned int v6 = 2;
    }
  }
  else
  {
    unsigned int v6 = 1;
  }
  if (a3 < 0.25)
  {
LABEL_14:
    BOOL v7 = 0;
    goto LABEL_15;
  }
  if (a3 < 0.45)
  {
    if (v6 < 2)
    {
      BOOL v7 = a3 - a4 > 0.05;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (a3 >= 0.6)
  {
    if (a3 >= 0.8) {
      unsigned int v12 = 5;
    }
    else {
      unsigned int v12 = 4;
    }
    BOOL v7 = v12 > v6;
  }
  else
  {
    BOOL v7 = v6 < 3;
  }
LABEL_15:
  BOOL v8 = a3 >= 0.8 || a4 >= 0.8 || v7;
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_175);
  }
  double v9 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v10 = @"NO";
    int v13 = 134218498;
    double v14 = a3;
    if (v8) {
      objc_super v10 = @"YES";
    }
    __int16 v15 = 2048;
    double v16 = a4;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_1A9680000, v9, OS_LOG_TYPE_DEFAULT, "PISensitiveContent: current %.5f, initial %.5f, should filter: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  return v8;
}

@end