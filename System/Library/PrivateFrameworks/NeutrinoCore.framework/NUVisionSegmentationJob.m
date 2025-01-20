@interface NUVisionSegmentationJob
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (NUImageBuffer)confidenceMap;
- (NUImageBuffer)segmentedMatte;
- (NUVisionSegmentationJob)initWithRequest:(id)a3;
- (NUVisionSegmentationJob)initWithVisionSegmentationRequest:(id)a3;
- (NUVisionSegmentationRequest)confidenceMapRequest;
- (__CVBuffer)_combineMultipleObservations:(id)a3 context:(id)a4 error:(id *)a5;
- (id)result;
- (id)scalePolicy;
- (void)cleanUp;
- (void)setConfidenceMap:(id)a3;
- (void)setSegmentedMatte:(id)a3;
@end

@implementation NUVisionSegmentationJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceMap, 0);
  objc_storeStrong((id *)&self->_segmentedMatte, 0);

  objc_storeStrong((id *)&self->_confidenceMapRequest, 0);
}

- (void)setConfidenceMap:(id)a3
{
}

- (NUImageBuffer)confidenceMap
{
  return self->_confidenceMap;
}

- (void)setSegmentedMatte:(id)a3
{
}

- (NUImageBuffer)segmentedMatte
{
  return self->_segmentedMatte;
}

- (NUVisionSegmentationRequest)confidenceMapRequest
{
  return self->_confidenceMapRequest;
}

- (void)cleanUp
{
  [(NUVisionSegmentationJob *)self setSegmentedMatte:0];
  v3.receiver = self;
  v3.super_class = (Class)NUVisionSegmentationJob;
  [(NURenderJob *)&v3 cleanUp];
}

- (id)result
{
  objc_super v3 = [_NUVisionSegmentationResult alloc];
  v4 = [(NUVisionSegmentationJob *)self segmentedMatte];
  v5 = [(NUVisionSegmentationJob *)self confidenceMap];
  v6 = [(_NUVisionSegmentationResult *)v3 initWithSegmentedMatteBuffer:v4 confidenceMapBuffer:v5];

  v7 = [(NUVisionSegmentationJob *)self segmentationRequest];
  -[_NUVisionSegmentationResult setSegmentationType:](v6, "setSegmentationType:", [v7 segmentationType]);

  return v6;
}

- (BOOL)render:(id *)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v62 = NUAssertLogger_20242();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)pixelBufferOut = 138543362;
      *(void *)&pixelBufferOut[4] = v63;
      _os_log_error_impl(&dword_1A9892000, v62, OS_LOG_TYPE_ERROR, "Fail: %{public}@", pixelBufferOut, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v65 = NUAssertLogger_20242();
    BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v66)
      {
        v69 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v70 = (void *)MEMORY[0x1E4F29060];
        id v71 = v69;
        v72 = [v70 callStackSymbols];
        v73 = [v72 componentsJoinedByString:@"\n"];
        *(_DWORD *)pixelBufferOut = 138543618;
        *(void *)&pixelBufferOut[4] = v69;
        __int16 v98 = 2114;
        v99 = v73;
        _os_log_error_impl(&dword_1A9892000, v65, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", pixelBufferOut, 0x16u);
      }
    }
    else if (v66)
    {
      v67 = [MEMORY[0x1E4F29060] callStackSymbols];
      v68 = [v67 componentsJoinedByString:@"\n"];
      *(_DWORD *)pixelBufferOut = 138543362;
      *(void *)&pixelBufferOut[4] = v68;
      _os_log_error_impl(&dword_1A9892000, v65, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", pixelBufferOut, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVisionSegmentationJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionSegmentationRequest.m", 284, @"Invalid parameter not satisfying: %s", v74, v75, v76, v77, (uint64_t)"error != nil");
  }
  v5 = -[NURenderJob renderer:](self, "renderer:");
  if (!v5)
  {
    LOBYTE(v16) = 0;
    goto LABEL_63;
  }
  v6 = [(NURenderJob *)self outputImage];
  v7 = [v5 context];
  id v8 = objc_alloc(MEMORY[0x1E4F45890]);
  uint64_t v95 = *MEMORY[0x1E4F45CA0];
  v96 = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
  v10 = +[NUFactory sharedFactory];
  v11 = [v10 visionSession];
  v12 = (void *)[v8 initWithCIImage:v6 options:v9 session:v11];

  v13 = [(NUVisionSegmentationJob *)self segmentationRequest];
  uint64_t v14 = [v13 segmentationType];

  v15 = (Class *)0x1E4F45818;
  switch(v14)
  {
    case 0:
      +[NUError unknownError:@"Unknown segmentation type" object:0];
      LOBYTE(v16) = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_62;
    case 1:
      v89 = v7;
      v87 = v6;
      v17 = v12;
      id v18 = objc_alloc_init(MEMORY[0x1E4F45850]);
      v19 = [(NUVisionSegmentationJob *)self segmentationRequest];
      char v20 = [v19 produceConfidenceMap];

      if ((v20 & 1) == 0)
      {
        v12 = v17;
        break;
      }
      id v21 = objc_alloc_init(MEMORY[0x1E4F45850]);
      [v21 setRevision:1];
      [v21 setQualityLevel:1];
      v12 = v17;
      if (!v21) {
        break;
      }
      v94[0] = v18;
      v94[1] = v21;
      v22 = v21;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
      char v24 = 0;
      goto LABEL_14;
    case 2:
      goto LABEL_10;
    case 3:
      v15 = (Class *)0x1E4F45858;
LABEL_10:
      v89 = v7;
      v87 = v6;
      id v18 = objc_alloc_init(*v15);
      break;
    default:
      v89 = v7;
      v87 = v6;
      id v18 = 0;
      break;
  }
  id v93 = v18;
  char v24 = 1;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
  v22 = 0;
LABEL_14:
  id v92 = 0;
  v25 = v12;
  v88 = (void *)v23;
  char v26 = [v12 performRequests:v23 error:&v92];
  id v27 = v92;
  v28 = v27;
  if ((v26 & 1) == 0)
  {
    +[NUError errorWithCode:1 reason:@"Vision segmentation failed" object:v18 underlyingError:v27];
    LOBYTE(v16) = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v25;
    v6 = v87;
LABEL_31:
    v35 = v22;
    v7 = v89;
    goto LABEL_61;
  }
  id v86 = v27;
  if (v14 != 3)
  {
    if (v14 == 2)
    {
      v33 = [v18 results];
      uint64_t v34 = [v33 count];

      if (v34)
      {
        v16 = [v18 results];
        id v91 = 0;
        v31 = [(NUVisionSegmentationJob *)self _combineMultipleObservations:v16 context:v89 error:&v91];
        id v83 = v91;
        v32 = 0;
        goto LABEL_24;
      }
      LOBYTE(v16) = 1;
      goto LABEL_30;
    }
    if (v14 != 1)
    {
      v16 = 0;
      v12 = v25;
      v35 = v22;
      v7 = v89;
LABEL_49:
      *a3 = +[NUError errorWithCode:3 reason:@"No pixelBuffer from vision segmentation" object:v18 underlyingError:v16];

      LOBYTE(v16) = 0;
      goto LABEL_50;
    }
  }
  v29 = [v18 results];
  v16 = [v29 firstObject];

  if (!v16)
  {
    *a3 = +[NUError missingError:@"Vision segmentation missing observation" object:v18];
LABEL_30:
    v12 = v25;
    v28 = v86;
    v6 = v87;
    goto LABEL_31;
  }
  uint64_t v30 = [v16 pixelBuffer];
  v31 = (__CVBuffer *)v30;
  if (v24)
  {
    v32 = 0;
    id v83 = 0;
LABEL_24:
    v35 = v22;
    goto LABEL_38;
  }
  CVBufferRef buffer = (CVBufferRef)v30;
  v35 = v22;
  v36 = [v22 results];
  v37 = [v36 firstObject];

  if (v37)
  {
    v32 = (__CVBuffer *)[v37 pixelBuffer];
    v31 = buffer;
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_227);
    }
    v31 = buffer;
    v38 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v60 = v38;
      v61 = +[NUError missingError:@"Vision confidence map missing observation" object:v35];
      *(_DWORD *)pixelBufferOut = 138412290;
      *(void *)&pixelBufferOut[4] = v61;
      _os_log_error_impl(&dword_1A9892000, v60, OS_LOG_TYPE_ERROR, "%@", pixelBufferOut, 0xCu);

      v31 = buffer;
    }
    v32 = 0;
  }

  id v83 = 0;
LABEL_38:

  if (!v31)
  {
    v12 = v25;
    v7 = v89;
    v16 = v83;
    goto LABEL_49;
  }
  v39 = [(NURenderJob *)self outputGeometry];
  uint64_t v40 = [v39 scaledSize];
  size_t v80 = v41;
  size_t v81 = v40;

  size_t Width = CVPixelBufferGetWidth(v31);
  size_t Height = CVPixelBufferGetHeight(v31);
  buffera = v31;
  CGColorSpaceRef ColorSpace = CVImageBufferGetColorSpace(v31);
  v12 = v25;
  v7 = v89;
  if (!ColorSpace)
  {
    v43 = +[NUColorSpace linearGrayColorSpace];
    CVBufferSetAttachment(buffera, (CFStringRef)*MEMORY[0x1E4F24A00], (CFTypeRef)[v43 CGColorSpace], kCVAttachmentMode_ShouldPropagate);

    v12 = v25;
  }
  if (v32)
  {
    v44 = v32;
    if (!CVImageBufferGetColorSpace(v32))
    {
      v45 = +[NUColorSpace linearGrayColorSpace];
      CFStringRef v46 = (const __CFString *)*MEMORY[0x1E4F24A00];
      v47 = (const void *)[v45 CGColorSpace];
      CFStringRef v48 = v46;
      v12 = v25;
      CVBufferSetAttachment(v32, v48, v47, kCVAttachmentMode_ShouldPropagate);

      v44 = v32;
    }
    v49 = [[NUCVPixelBuffer alloc] initWithCVPixelBuffer:v44];
    [(NUVisionSegmentationJob *)self setConfidenceMap:v49];
  }
  if (Width == v81 && Height == v80)
  {
    v50 = [[NUCVPixelBuffer alloc] initWithCVPixelBuffer:buffera];
    [(NUVisionSegmentationJob *)self setSegmentedMatte:v50];

    LOBYTE(v16) = 1;
LABEL_50:
    v28 = v86;
    v6 = v87;
    goto LABEL_61;
  }
  *(void *)pixelBufferOut = 0;
  CFDictionaryRef v51 = CVBufferCopyAttachments(buffera, kCVAttachmentMode_ShouldPropagate);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(buffera);
  size_t v53 = v81;
  CFDictionaryRef v82 = v51;
  uint64_t v54 = CVPixelBufferCreate(0, v53, v80, PixelFormatType, v51, (CVPixelBufferRef *)pixelBufferOut);
  v6 = v87;
  if (v54)
  {
    v55 = [NSNumber numberWithInt:v54];
    *a3 = +[NUError failureError:@"Failed to create output pixel buffer" object:v55];

    LOBYTE(v16) = 0;
  }
  else
  {
    VTPixelTransferSessionRef pixelTransferSessionOut = 0;
    uint64_t v56 = VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
    if (!v56 && pixelTransferSessionOut)
    {
      uint64_t v56 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, buffera, *(CVPixelBufferRef *)pixelBufferOut);
      VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
      CFRelease(pixelTransferSessionOut);
      VTPixelTransferSessionRef pixelTransferSessionOut = 0;
    }
    LOBYTE(v16) = v56 == 0;
    if (v56)
    {
      v57 = [NSNumber numberWithInt:v56];
      *a3 = +[NUError failureError:@"Failed to transfer pixel buffer" object:v57];
    }
    else
    {
      v58 = [NUCVPixelBuffer alloc];
      v57 = [(NUCVPixelBuffer *)v58 initWithCVPixelBuffer:*(void *)pixelBufferOut];
      [(NUVisionSegmentationJob *)self setSegmentedMatte:v57];
    }

    CFRelease(*(CFTypeRef *)pixelBufferOut);
  }
  v28 = v86;

LABEL_61:
LABEL_62:

LABEL_63:
  return (char)v16;
}

- (__CVBuffer)_combineMultipleObservations:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (![v9 count])
  {
    v52 = NUAssertLogger_20242();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      size_t v53 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "observations.count > 0");
      *(_DWORD *)buf = 138543362;
      size_t v81 = v53;
      _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v55 = NUAssertLogger_20242();
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
        *(_DWORD *)buf = 138543618;
        size_t v81 = v59;
        __int16 v82 = 2114;
        id v83 = v63;
        _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v56)
    {
      v57 = [MEMORY[0x1E4F29060] callStackSymbols];
      v58 = [v57 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      size_t v81 = v58;
      _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVisionSegmentationJob _combineMultipleObservations:context:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionSegmentationRequest.m", 209, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"observations.count > 0");
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v74 objects:v79 count:16];
  if (v13)
  {
    v5 = (__CVBuffer *)v13;
    uint64_t v14 = *(void *)v75;
    do
    {
      for (i = 0; i != v5; i = (__CVBuffer *)((char *)i + 1))
      {
        if (*(void *)v75 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = [*(id *)(*((void *)&v74 + 1) + 8 * i) instanceSegmentationMask];
        [v11 addObject:v16];
      }
      v5 = (__CVBuffer *)[v12 countByEnumeratingWithState:&v74 objects:v79 count:16];
    }
    while (v5);
  }

  v17 = [(NUVisionSegmentationJob *)self segmentationRequest];
  uint64_t v18 = [v17 visionSegmentationPolicy];

  switch(v18)
  {
    case 0:
      v19 = [v11 objectAtIndexedSubscript:0];
      char v20 = v19;
      goto LABEL_38;
    case 1:
      char v20 = 0;
      if ([v12 count])
      {
        unint64_t v21 = 0;
        double v22 = 0.0;
        do
        {
          uint64_t v23 = [v12 objectAtIndexedSubscript:v21];
          [v23 boundingBox];
          double v25 = v24;
          char v26 = [v12 objectAtIndexedSubscript:v21];
          [v26 boundingBox];
          double v28 = v25 * v27;

          if (v28 > v22)
          {
            uint64_t v29 = [v11 objectAtIndexedSubscript:v21];

            char v20 = (void *)v29;
            double v22 = v28;
          }
          ++v21;
        }
        while (v21 < [v12 count]);
      }
      goto LABEL_37;
    case 2:
      if ([v12 count])
      {
        unint64_t v30 = 0;
        char v20 = 0;
        float v31 = 0.0;
        do
        {
          v32 = [v12 objectAtIndexedSubscript:v30];
          [v32 confidence];
          float v34 = v33;

          if (v34 > v31)
          {
            uint64_t v35 = [v11 objectAtIndexedSubscript:v30];

            float v31 = v34;
            char v20 = (void *)v35;
          }
          ++v30;
        }
        while (v30 < [v12 count]);
      }
      else
      {
        char v20 = 0;
      }
LABEL_37:
      v19 = v20;
LABEL_38:
      v5 = (__CVBuffer *)[v19 pixelBuffer];
      goto LABEL_39;
    case 3:
      v36 = [v11 objectAtIndexedSubscript:0];
      v5 = (__CVBuffer *)[v36 pixelBuffer];

      if ([v11 count] == 1) {
        goto LABEL_40;
      }
      v68 = v10;
      char v20 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithPixelBuffer:v5];
      v37 = [MEMORY[0x1E4F1E000] componentAdd];
      [v20 setBlendKernel:v37];

      v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count") - 1);
      if ((unint64_t)[v11 count] < 2) {
        goto LABEL_28;
      }
      unint64_t v39 = 1;
      break;
    default:
      goto LABEL_40;
  }
  do
  {
    uint64_t v40 = (void *)MEMORY[0x1E4F1E050];
    size_t v41 = [v11 objectAtIndexedSubscript:v39];
    objc_msgSend(v40, "imageWithCVPixelBuffer:", objc_msgSend(v41, "pixelBuffer"));
    id v42 = (id)objc_claimAutoreleasedReturnValue();

    id v73 = 0;
    v43 = [v68 startTaskToRender:v42 toDestination:v20 error:&v73];
    id v44 = v73;
    if (!v43)
    {
      CFDictionaryRef v51 = [v11 objectAtIndexedSubscript:v39];
      *a5 = +[NUError errorWithCode:1 reason:@"Merge render failed" object:v51 underlyingError:v44];

      v5 = 0;
      goto LABEL_42;
    }
    [v38 addObject:v43];

    ++v39;
  }
  while (v39 < [v11 count]);
LABEL_28:
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v42 = v38;
  uint64_t v45 = [v42 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v70 != v47) {
          objc_enumerationMutation(v42);
        }
        id v49 = (id)[*(id *)(*((void *)&v69 + 1) + 8 * j) waitUntilCompletedAndReturnError:a5];
      }
      uint64_t v46 = [v42 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v46);
  }
LABEL_42:

  id v10 = v68;
LABEL_39:

LABEL_40:
  return v5;
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
  v2 = [(NUVisionSegmentationJob *)self segmentationRequest];
  objc_super v3 = [v2 scalePolicy];

  return v3;
}

- (NUVisionSegmentationJob)initWithRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_20160);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = NSString;
    v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    float v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_20160);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_20160);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F29060];
    v15 = v13;
    v16 = [v14 callStackSymbols];
    v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    float v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  char v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  v15 = v18;
  double v22 = [v20 callStackSymbols];
  uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  float v31 = specific;
  __int16 v32 = 2114;
  float v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  double v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUVisionSegmentationJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionSegmentationRequest.m", 185, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUVisionSegmentationJob)initWithVisionSegmentationRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUVisionSegmentationJob;
  return [(NURenderJob *)&v4 initWithRequest:a3];
}

@end