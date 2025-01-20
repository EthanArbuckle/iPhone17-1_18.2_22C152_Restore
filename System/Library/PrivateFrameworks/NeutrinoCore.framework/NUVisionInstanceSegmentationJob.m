@interface NUVisionInstanceSegmentationJob
- ($0AC6E346AE4835514AAA8AC86D8F4844)idealModelSize;
- (BOOL)isUsingTargetSamplePoints;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)runMainRequest:(id)a3 onImage:(id)a4 orientation:(int64_t)a5 scale:(CGSize)a6 renderer:(id)a7 error:(id *)a8;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (NSArray)targetSamplePoints;
- (VNGenerateImageSegmentationRequest)visionRequest;
- (_NUVisionInstanceSegmentationResult)visionResult;
- (id)_calculateInstancePropertiesForObservation:(id)a3 context:(id)a4 observationOrientation:(int64_t)a5 observationScale:(CGSize)a6;
- (id)result;
- (id)scalePolicy;
- (void)setVisionRequest:(id)a3;
- (void)setVisionResult:(id)a3;
@end

@implementation NUVisionInstanceSegmentationJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionResult, 0);

  objc_storeStrong((id *)&self->_visionRequest, 0);
}

- (void)setVisionResult:(id)a3
{
}

- (_NUVisionInstanceSegmentationResult)visionResult
{
  return self->_visionResult;
}

- (void)setVisionRequest:(id)a3
{
}

- (VNGenerateImageSegmentationRequest)visionRequest
{
  return self->_visionRequest;
}

- (id)result
{
  v2 = [(NUVisionInstanceSegmentationJob *)self visionResult];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)_calculateInstancePropertiesForObservation:(id)a3 context:(id)a4 observationOrientation:(int64_t)a5 observationScale:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v10 = a3;
  id v11 = a4;
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = [v10 allInstances];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = [v10 allInstances];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __126__NUVisionInstanceSegmentationJob__calculateInstancePropertiesForObservation_context_observationOrientation_observationScale___block_invoke;
    v17[3] = &unk_1E5D944F8;
    id v18 = v10;
    int64_t v21 = a5;
    CGFloat v22 = width;
    CGFloat v23 = height;
    id v19 = v11;
    id v20 = v12;
    [v15 enumerateIndexesUsingBlock:v17];
  }

  return v12;
}

void __126__NUVisionInstanceSegmentationJob__calculateInstancePropertiesForObservation_context_observationOrientation_observationScale___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a2];
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v13 = 0;
  v7 = GenerateMaskForInstances(v4, v5, v6, &v13, *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v8 = v13;

  if (v7)
  {
    v9 = +[NUMaskUtilities propertiesForMask:v7 context:*(void *)(a1 + 40)];
    id v10 = *(void **)(a1 + 48);
    id v11 = [NSNumber numberWithUnsignedInteger:a2];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_297);
    }
    v12 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_fault_impl(&dword_1A9892000, v12, OS_LOG_TYPE_FAULT, "Failed to generate mask for Vision segmentation instance, error: %@", buf, 0xCu);
    }
  }
}

- (BOOL)render:(id *)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v52 = NUAssertLogger_6987();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(buf[0].f64[0]) = 138543362;
      *(void *)((char *)buf[0].f64 + 4) = v53;
      _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v55 = NUAssertLogger_6987();
    BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v56)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        v62 = [v60 callStackSymbols];
        v63 = [v62 componentsJoinedByString:@"\n"];
        LODWORD(buf[0].f64[0]) = 138543618;
        *(void *)((char *)buf[0].f64 + 4) = v59;
        WORD2(buf[0].f64[1]) = 2114;
        *(void *)((char *)&buf[0].f64[1] + 6) = v63;
        _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v56)
    {
      v57 = [MEMORY[0x1E4F29060] callStackSymbols];
      v58 = [v57 componentsJoinedByString:@"\n"];
      LODWORD(buf[0].f64[0]) = 138543362;
      *(void *)((char *)buf[0].f64 + 4) = v58;
      _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVisionInstanceSegmentationJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionInstanceSegmentationRequest.m", 493, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"error != nil");
  }
  v5 = [(NURenderJob *)self outputImage];
  uint64_t v6 = [(NURenderJob *)self outputGeometry];
  v7 = [(NURenderJob *)self renderer:a3];
  if (!v7) {
    goto LABEL_46;
  }
  uint64_t v8 = [v6 orientation];
  [v5 extent];
  uint64_t v11 = 6;
  if (v10 <= v9) {
    uint64_t v11 = v8;
  }
  uint64_t v12 = 8;
  if (v10 <= v9) {
    uint64_t v12 = 1;
  }
  uint64_t v13 = 8;
  if (v10 <= v9) {
    uint64_t v13 = 1;
  }
  uint64_t v14 = 8;
  if (v10 <= v9) {
    uint64_t v14 = v8;
  }
  if (v8 != 8) {
    uint64_t v13 = v14;
  }
  if (v8 != 6) {
    uint64_t v12 = v13;
  }
  if ((unint64_t)(v8 - 3) >= 2) {
    uint64_t v15 = v12;
  }
  else {
    uint64_t v15 = v11;
  }
  uint64_t v16 = [(NUVisionInstanceSegmentationJob *)self idealModelSize];
  if (!v16 || (uint64_t v18 = v17) == 0)
  {
    v48 = @"invalid model size";
    v49 = 0;
LABEL_49:
    +[NUError invalidError:v48 object:v49];
    BOOL v45 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_50;
  }
  uint64_t v19 = v16;
  [v5 extent];
  if (v20 <= 0.0 || v21 <= 0.0)
  {
    v48 = @"invalid image size";
    v49 = v5;
    goto LABEL_49;
  }
  if ((unint64_t)(v15 - 5) >= 4) {
    double v22 = v20;
  }
  else {
    double v22 = v21;
  }
  if ((unint64_t)(v15 - 5) >= 4) {
    double v23 = v21;
  }
  else {
    double v23 = v20;
  }
  double v24 = (double)v19 / v22;
  double v25 = (double)v18 / v23;
  BOOL v26 = +[NUGlobalSettings inpaintSegmentationUsesNonUniformScaling];
  if (v24 >= v25) {
    double v27 = v24;
  }
  else {
    double v27 = v25;
  }
  if (!v26)
  {
    double v24 = v27;
    double v25 = v27;
  }
  if ([(NUVisionInstanceSegmentationJob *)self isUsingTargetSamplePoints])
  {
    v68 = v7;
    v69 = v6;
    v28 = (void *)MEMORY[0x1E4F1CA48];
    v29 = [(NUVisionInstanceSegmentationJob *)self targetSamplePoints];
    v30 = objc_msgSend(v28, "arrayWithCapacity:", objc_msgSend(v29, "count"));

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v31 = [(NUVisionInstanceSegmentationJob *)self targetSamplePoints];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v74 objects:v78 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v75;
      float64x2_t v70 = (float64x2_t)vdupq_n_s64(0x3FEFFF2E40000000uLL);
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v75 != v34) {
            objc_enumerationMutation(v31);
          }
          objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * i), "nu_CGPoint");
          double v71 = v37;
          double v72 = v36;
          float64x2_t v80 = 0u;
          memset(buf, 0, sizeof(buf));
          NUOrientationMakeTransformWithSizeAndOrigin(v15, 1, 1, 0, 0, (uint64_t)buf);
          v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F458E0]), "initWithLocation:", vmaxnmq_f64(vminnmq_f64(vaddq_f64(v80, vmlaq_n_f64(vmulq_n_f64(buf[1], v71), buf[0], v72)), v70), (float64x2_t)0));
          [v30 addObject:v38];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v74 objects:v78 count:16];
      }
      while (v33);
    }

    v39 = [(NUVisionInstanceSegmentationJob *)self visionRequest];
    [v39 setTargetPoints:v30];

    uint64_t v6 = v69;
    v7 = v68;
  }
  v40 = [(NUVisionInstanceSegmentationJob *)self visionRequest];
  BOOL v41 = -[NUVisionInstanceSegmentationJob runMainRequest:onImage:orientation:scale:renderer:error:](self, "runMainRequest:onImage:orientation:scale:renderer:error:", v40, v5, v15, v7, a3, v24, v25);

  if (!v41)
  {
LABEL_46:
    BOOL v45 = 0;
    goto LABEL_50;
  }
  v42 = [(NUVisionInstanceSegmentationJob *)self visionRequest];
  v43 = [v42 results];

  uint64_t v44 = [v43 count];
  BOOL v45 = v44 == 1;
  if (v44 == 1)
  {
    v51 = [v43 firstObject];
    v73 = [v7 context];
    v46 = -[NUVisionInstanceSegmentationJob _calculateInstancePropertiesForObservation:context:observationOrientation:observationScale:](self, "_calculateInstancePropertiesForObservation:context:observationOrientation:observationScale:", v51, v73, v15, v24, v25);
    v47 = -[_NUVisionInstanceSegmentationResult initWithObservation:usingTargetPoints:observationOrientation:observationScale:perInstanceProperties:]([_NUVisionInstanceSegmentationResult alloc], "initWithObservation:usingTargetPoints:observationOrientation:observationScale:perInstanceProperties:", v51, [(NUVisionInstanceSegmentationJob *)self isUsingTargetSamplePoints], v15, v46, v24, v25);
    [(NUVisionInstanceSegmentationJob *)self setVisionResult:v47];
  }
  else
  {
    v51 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
    *a3 = +[NUError invalidError:@"Unexpected number of observations" object:v51];
  }

LABEL_50:
  return v45;
}

- (BOOL)runMainRequest:(id)a3 onImage:(id)a4 orientation:(int64_t)a5 scale:(CGSize)a6 renderer:(id)a7 error:(id *)a8
{
  double height = a6.height;
  double width = a6.width;
  v113[4] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v104 = a7;
  id v15 = a4;
  uint64_t v16 = [(NURenderJob *)self renderNode];
  uint64_t v17 = [v16 resamplingColorSpace];
  uint64_t v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = +[NUColorSpace sRGBColorSpace];
  }
  double v20 = v19;

  v102 = v20;
  uint64_t v21 = objc_msgSend(v15, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v20, "CGColorSpace"));
  double v22 = (void *)v21;
  if (v21) {
    double v23 = (void *)v21;
  }
  else {
    double v23 = v15;
  }
  id v24 = v23;

  double v25 = ApplyOrientation(v24, a5);

  id v26 = v25;
  [v26 extent];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  v35 = [v26 imageByClampingToExtent];

  v112[0] = @"inputScale";
  double v36 = [NSNumber numberWithDouble:height];
  v113[0] = v36;
  v112[1] = @"inputAspectRatio";
  double v37 = [NSNumber numberWithDouble:width / height];
  v113[1] = v37;
  v112[2] = @"inputB";
  v112[3] = @"inputC";
  v113[2] = &unk_1F004A540;
  v113[3] = &unk_1F004A550;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:4];
  v39 = [v35 imageByApplyingFilter:@"CIBicubicScaleTransform" withInputParameters:v38];

  CGAffineTransformMakeScale(&v111, width, height);
  v114.origin.x = v28;
  v114.origin.y = v30;
  v114.size.double width = v32;
  v114.size.double height = v34;
  CGRect v115 = CGRectApplyAffineTransform(v114, &v111);
  CGRect v116 = CGRectIntegral(v115);
  v40 = objc_msgSend(v39, "imageByCroppingToRect:", v116.origin.x, v116.origin.y, v116.size.width, v116.size.height);

  [v40 extent];
  id v107 = +[NUVideoUtilities newPixelBufferOfSize:format:](NUVideoUtilities, "newPixelBufferOfSize:format:", vcvtpd_s64_f64(v41), vcvtpd_s64_f64(v42), 1111970369);
  v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", objc_msgSend(v107, "CVPixelBuffer"));
  [v43 setColorSpace:0];
  v106 = [v104 context];
  uint64_t v44 = [v106 startTaskToRender:v40 toDestination:v43 error:a8];
  v103 = v44;
  if (v44)
  {
    v101 = [v44 waitUntilCompletedAndReturnError:a8];
    if (v101)
    {
      v100 = +[NUGlobalSettings inpaintSegmentationInputTensorsDumpPath];
      if (v100)
      {
        BOOL v45 = (__CVBuffer *)[v107 CVPixelBuffer];
        id v46 = v100;
        if (CVPixelBufferGetPixelFormatType(v45) != 1111970369)
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_7005);
          }
          long long v77 = (void *)_NUAssertLogger;
          if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
          {
            v78 = NSString;
            v79 = v77;
            float64x2_t v80 = [v78 stringWithFormat:@"wrong pixel format"];
            LODWORD(v111.a) = 138543362;
            *(void *)((char *)&v111.a + 4) = v80;
            _os_log_error_impl(&dword_1A9892000, v79, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v111, 0xCu);

            uint64_t v81 = _NULogOnceToken;
            BOOL v82 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
            if (v81 != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_7005);
            }
          }
          else
          {
            BOOL v82 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
          }
          v83 = (id)_NUAssertLogger;
          BOOL v84 = os_log_type_enabled(v83, OS_LOG_TYPE_ERROR);
          if (v82)
          {
            if (v84)
            {
              v85 = [MEMORY[0x1E4F29060] callStackSymbols];
              v86 = [v85 componentsJoinedByString:@"\n"];
              LODWORD(v111.a) = 138543362;
              *(void *)((char *)&v111.a + 4) = v86;
              _os_log_error_impl(&dword_1A9892000, v83, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v111, 0xCu);
            }
          }
          else if (v84)
          {
            specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v88 = (void *)MEMORY[0x1E4F29060];
            id v89 = specific;
            v90 = [v88 callStackSymbols];
            v91 = [v90 componentsJoinedByString:@"\n"];
            LODWORD(v111.a) = 138543618;
            *(void *)((char *)&v111.a + 4) = specific;
            WORD2(v111.b) = 2114;
            *(void *)((char *)&v111.b + 6) = v91;
            _os_log_error_impl(&dword_1A9892000, v83, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v111, 0x16u);
          }
          _NUAssertFailHandler((uint64_t)"void DumpTensorsForBuffer(CVPixelBufferRef, NSString *__strong)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionInstanceSegmentationRequest.m", 392, @"wrong pixel format", v92, v93, v94, v95, v96);
        }
        CVPixelBufferLockBaseAddress(v45, 1uLL);
        id v47 = v46;
        v48 = fopen((const char *)[v47 UTF8String], "w");
        if (v48)
        {
          size_t v49 = CVPixelBufferGetWidth(v45);
          size_t v50 = CVPixelBufferGetHeight(v45);
          size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v45);
          BaseAddress = CVPixelBufferGetBaseAddress(v45);
          id v98 = v14;
          pixelBuffer = v45;
          id v97 = v47;
          if (v50)
          {
            v54 = BaseAddress;
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (v49)
              {
                uint64_t v56 = 2;
                size_t v57 = v49;
                do
                {
                  LOBYTE(v53) = v54[v56];
                  fprintf(v48, "%.6f, ", (double)v53);
                  v56 += 4;
                  --v57;
                }
                while (v57);
              }
              v54 += BytesPerRow;
            }
            v58 = CVPixelBufferGetBaseAddress(pixelBuffer);
            for (uint64_t j = 0; j != v50; ++j)
            {
              if (v49)
              {
                uint64_t v61 = 1;
                size_t v62 = v49;
                do
                {
                  LOBYTE(v59) = v58[v61];
                  fprintf(v48, "%.6f, ", (double)v59);
                  v61 += 4;
                  --v62;
                }
                while (v62);
              }
              v58 += BytesPerRow;
            }
            v63 = (unsigned __int8 *)CVPixelBufferGetBaseAddress(pixelBuffer);
            for (uint64_t k = 0; k != v50; ++k)
            {
              uint64_t v65 = v63;
              for (size_t m = v49; m; --m)
              {
                unsigned int v67 = *v65;
                v65 += 4;
                fprintf(v48, "%.6f, ", (double)v67);
              }
              v63 += BytesPerRow;
            }
          }
          else
          {
            CVPixelBufferGetBaseAddress(v45);
            CVPixelBufferGetBaseAddress(v45);
          }
          fclose(v48);
          CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
          id v14 = v98;
          id v47 = v97;
          printf("Dumped Photos vision input to %s\n", (const char *)[v97 UTF8String]);
        }
      }
      id v69 = objc_alloc(MEMORY[0x1E4F45890]);
      uint64_t v70 = [v107 CVPixelBuffer];
      uint64_t v109 = *MEMORY[0x1E4F45CA0];
      v110 = v106;
      double v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      double v72 = +[NUFactory sharedFactory];
      v73 = [v72 visionSession];
      long long v74 = (void *)[v69 initWithCVPixelBuffer:v70 options:v71 session:v73];

      id v108 = v14;
      long long v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
      char v68 = [v74 performRequests:v75 error:a8];
    }
    else
    {
      char v68 = 0;
    }
  }
  else
  {
    char v68 = 0;
  }

  return v68;
}

- (BOOL)prepare:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F45838]);
  [(NUVisionInstanceSegmentationJob *)self setVisionRequest:v5];

  uint64_t v6 = [(NUVisionInstanceSegmentationJob *)self visionRequest];
  int v7 = [v6 setRevision:1 error:a3];

  if (!v7) {
    return 0;
  }
  uint64_t v8 = +[NUGlobalSettings inpaintSegmentationUsesConnectedComponents] ^ 1;
  double v9 = [(NUVisionInstanceSegmentationJob *)self visionRequest];
  [v9 setDisableConnectedComponentRefinement:v8];

  if (!_maximumTargetPoints)
  {
    double v10 = [(NUVisionInstanceSegmentationJob *)self visionRequest];
    _maximumTargetPoints = [v10 maximumTargetPoints];
  }
  v12.receiver = self;
  v12.super_class = (Class)NUVisionInstanceSegmentationJob;
  return [(NURenderJob *)&v12 prepare:a3];
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (id)scalePolicy
{
  v2 = [(NURenderJob *)self request];
  v3 = [v2 scalePolicy];

  return v3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)idealModelSize
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(NUVisionInstanceSegmentationJob *)self visionRequest];

  if (!v3)
  {
    uint64_t v13 = NUAssertLogger_6987();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [NSString stringWithFormat:@"Vision request not set up until prepare:"];
      *(_DWORD *)buf = 138543362;
      double v33 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v16 = NUAssertLogger_6987();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        double v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        double v25 = [v23 callStackSymbols];
        id v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v33 = v22;
        __int16 v34 = 2114;
        v35 = v26;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v33 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVisionInstanceSegmentationJob idealModelSize]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionInstanceSegmentationRequest.m", 348, @"Vision request not set up until prepare:", v27, v28, v29, v30, v31);
  }
  v4 = [(NUVisionInstanceSegmentationJob *)self visionRequest];
  id v5 = [v4 supportedImageSizeSet];

  uint64_t v6 = [v5 firstObject];
  int v7 = [v6 pixelsWideRange];
  uint64_t v8 = [v7 idealDimension];

  double v9 = [v6 pixelsHighRange];
  uint64_t v10 = [v9 idealDimension];

  if ((v10 | v8) < 0)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    [v20 handleFailureInFunction:v21, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
  }
  int64_t v11 = v8;
  int64_t v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (BOOL)isUsingTargetSamplePoints
{
  v2 = [(NUVisionInstanceSegmentationJob *)self targetSamplePoints];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)targetSamplePoints
{
  v2 = [(NURenderJob *)self request];
  BOOL v3 = [v2 targetSamplePoints];

  return (NSArray *)v3;
}

@end