@interface PIAutoLoopExportJob
+ (BOOL)shouldUseMetalRenderer;
+ (id)metalRenderer;
- (BOOL)writeVideoFrom:(id)a3 toWriter:(id)a4 stillImageTime:(id *)a5 createCustomMetadata:(BOOL)a6 geometryTransform:(id)a7 inputSize:(CGSize)a8 outputSize:(CGSize)a9 error:(id *)a10;
- (PIAutoLoopExportJob)initWithAutoLoopExportRequest:(id)a3;
- (PIAutoLoopExportJob)initWithVideoExportRequest:(id)a3;
- (id)renderer:(id *)a3;
@end

@implementation PIAutoLoopExportJob

- (BOOL)writeVideoFrom:(id)a3 toWriter:(id)a4 stillImageTime:(id *)a5 createCustomMetadata:(BOOL)a6 geometryTransform:(id)a7 inputSize:(CGSize)a8 outputSize:(CGSize)a9 error:(id *)a10
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if (!a10)
  {
    v70 = NUAssertLogger_18177();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v71 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v71;
      _os_log_error_impl(&dword_1A9680000, v70, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v72 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v74 = NUAssertLogger_18177();
    BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v75)
      {
        v76 = dispatch_get_specific(*v72);
        v77 = (void *)MEMORY[0x1E4F29060];
        id v78 = v76;
        v79 = [v77 callStackSymbols];
        v80 = [v79 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v76;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v80;
        _os_log_error_impl(&dword_1A9680000, v74, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v75)
    {
LABEL_53:
      v86 = [MEMORY[0x1E4F29060] callStackSymbols];
      v87 = [v86 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v87;
      _os_log_error_impl(&dword_1A9680000, v74, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
LABEL_56:

    _NUAssertFailHandler();
    __break(1u);
  }
  v95 = v16;
  v97 = v15;
  v96 = [(PIAutoLoopExportJob *)self renderer:a10];
  if (v96)
  {
    if ([(NURenderJob *)self isCanceled])
    {
      v17 = (void *)MEMORY[0x1E4F7A438];
      v18 = [(NURenderJob *)self request];
      v19 = (void *)[v18 copy];
      id v20 = [v17 canceledError:@"AL export was canceled" object:v19];
LABEL_5:
      *a10 = v20;

LABEL_20:
      goto LABEL_21;
    }
    if (([v14 startReading] & 1) == 0)
    {
      v51 = (void *)MEMORY[0x1E4F7A438];
      v18 = [v14 error];
      *a10 = [v51 errorWithCode:1 reason:@"Could not start reading AVAsset" object:v14 underlyingError:v18];
      goto LABEL_20;
    }
    if (([v15 startWriting] & 1) == 0)
    {
      v53 = NSString;
      v54 = [v15 outputURL];
      v18 = [v53 stringWithFormat:@"Could not start writing AVAsset %@", v54];

      v55 = (void *)MEMORY[0x1E4F7A438];
      v19 = [v15 error];
      id v20 = [v55 errorWithCode:1 reason:v18 object:v15 underlyingError:v19];
      goto LABEL_5;
    }
    *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
    *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v15 startSessionAtSourceTime:buf];
    v21 = [v14 outputs];
    uint64_t v22 = [v21 count];
    v23 = [v15 inputs];
    BOOL v24 = v22 == [v23 count];

    if (v24)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_58);
      }
      v25 = *MEMORY[0x1E4F7A760];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v96;
        _os_log_impl(&dword_1A9680000, v25, OS_LOG_TYPE_DEFAULT, "AL Export video using renderer: %{public}@", buf, 0xCu);
      }
      v26 = [(NURenderJob *)self outputGeometry];
      uint64_t v27 = [v26 scaledSize];
      uint64_t v29 = v28;

      v94 = -[PILongExposureAccumulator initWithSize:renderer:jobNumber:]([PILongExposureAccumulator alloc], "initWithSize:renderer:jobNumber:", v27, v29, v96, [(NURenderJob *)self jobNumber]);
      if (![(PILongExposureAccumulator *)v94 start:a10])
      {
        BOOL v50 = 0;
LABEL_39:

        goto LABEL_22;
      }
      NUAbsoluteTime();
      double v31 = v30;
      group = dispatch_group_create();
      v32 = [v14 outputs];
      BOOL v33 = [v32 count] == 0;

      if (!v33)
      {
        unint64_t v34 = 0;
        do
        {
          v35 = [v97 inputs];
          v36 = [v35 objectAtIndexedSubscript:v34];

          v37 = [v14 outputs];
          v38 = [v37 objectAtIndexedSubscript:v34];

          objc_msgSend(NSString, "stringWithFormat:", @"export_track_queue_%lu", v34);
          id v39 = objc_claimAutoreleasedReturnValue();
          dispatch_queue_t v40 = dispatch_queue_create((const char *)[v39 UTF8String], 0);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LOBYTE(v109) = 0;
          dispatch_group_enter(group);
          v100[0] = MEMORY[0x1E4F143A8];
          v100[1] = 3221225472;
          v100[2] = __128__PIAutoLoopExportJob_writeVideoFrom_toWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_error___block_invoke;
          v100[3] = &unk_1E5D807F8;
          v106 = buf;
          id v41 = v36;
          id v101 = v41;
          v102 = self;
          v103 = v94;
          id v42 = v38;
          id v104 = v42;
          v107 = a10;
          v105 = group;
          [v41 requestMediaDataWhenReadyOnQueue:v40 usingBlock:v100];

          _Block_object_dispose(buf, 8);
          v43 = [v14 outputs];
          unint64_t v44 = [v43 count];

          ++v34;
        }
        while (v34 < v44);
      }
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      NUAbsoluteTime();
      double v46 = v45;
      if ([(NURenderJob *)self isCanceled])
      {
        v47 = (void *)MEMORY[0x1E4F7A438];
        v48 = [(NURenderJob *)self request];
        v49 = (void *)[v48 copy];
        *a10 = [v47 canceledError:@"AL export was canceled" object:v49];

        BOOL v50 = 0;
LABEL_38:

        goto LABEL_39;
      }
      dispatch_group_enter(group);
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __128__PIAutoLoopExportJob_writeVideoFrom_toWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_error___block_invoke_38;
      v98[3] = &unk_1E5D812E0;
      v56 = group;
      v99 = v56;
      [v97 finishWritingWithCompletionHandler:v98];
      v57 = [(PIAutoLoopExportJob *)self autoLoopExportRequest];
      v58 = [v57 destinationLongExposureURL];
      v59 = [v57 destinationUTI];
      v60 = [v57 outputColorSpace];
      if ([(PILongExposureAccumulator *)v94 writeLongExposureImage:v58 UTI:v59 colorSpace:v60 error:a10])
      {
        v61 = [v57 destinationMaskURL];
        v62 = [v57 destinationUTI];
        BOOL v63 = [(PILongExposureAccumulator *)v94 writeMaskImage:v61 UTI:v62 error:a10];

        if (!v63)
        {
LABEL_36:
          BOOL v50 = 0;
LABEL_37:

          v48 = v99;
          goto LABEL_38;
        }
        dispatch_group_wait(v56, 0xFFFFFFFFFFFFFFFFLL);
        NUAbsoluteTime();
        double v65 = v64;
        v66 = NURenderLogger();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          *(double *)&buf[4] = v46 - v31;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v65 - v46;
          *(_WORD *)&buf[22] = 2048;
          double v109 = v65 - v31;
          _os_log_impl(&dword_1A9680000, v66, OS_LOG_TYPE_DEFAULT, "AL Export timings: loop = %g s, finish = %g s, total = %g s", buf, 0x20u);
        }

        if ([v14 status] == 3)
        {
          v67 = (void *)MEMORY[0x1E4F7A438];
          v58 = [v14 error];
          id v68 = [v67 errorWithCode:1 reason:@"Failed to read from AVAsset" object:v14 underlyingError:v58];
        }
        else
        {
          if ([v97 status] != 3)
          {
            BOOL v50 = 1;
            goto LABEL_37;
          }
          v69 = (void *)MEMORY[0x1E4F7A438];
          v58 = [v97 error];
          id v68 = [v69 errorWithCode:1 reason:@"Failed to write to AVAsset" object:v97 underlyingError:v58];
        }
        *a10 = v68;
      }
      else
      {
      }
      goto LABEL_36;
    }
    v81 = NUAssertLogger_18177();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      v82 = [NSString stringWithFormat:@"Reader outputs should match writer inputs"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v82;
      _os_log_error_impl(&dword_1A9680000, v81, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v83 = (const void **)MEMORY[0x1E4F7A308];
    v84 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v74 = NUAssertLogger_18177();
    BOOL v85 = os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);
    if (!v84)
    {
      if (!v85) {
        goto LABEL_56;
      }
      goto LABEL_53;
    }
    if (v85)
    {
      v88 = dispatch_get_specific(*v83);
      v89 = (void *)MEMORY[0x1E4F29060];
      id v90 = v88;
      v91 = [v89 callStackSymbols];
      v92 = [v91 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v88;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v92;
      _os_log_error_impl(&dword_1A9680000, v74, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_56;
  }
LABEL_21:
  BOOL v50 = 0;
LABEL_22:

  return v50;
}

void __128__PIAutoLoopExportJob_writeVideoFrom_toWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_58);
    }
    v2 = *MEMORY[0x1E4F7A760];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A760], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A9680000, v2, OS_LOG_TYPE_INFO, "media data ready after finished", v9, 2u);
    }
    [*(id *)(a1 + 32) markAsFinished];
  }
  else
  {
    while ([*(id *)(a1 + 32) isReadyForMoreMediaData])
    {
      if ([*(id *)(a1 + 40) isCanceled])
      {
        [*(id *)(a1 + 48) cancel];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        break;
      }
      uint64_t v3 = [*(id *)(a1 + 56) copyNextSampleBuffer];
      if (v3)
      {
        v4 = (opaqueCMSampleBuffer *)v3;
        int v5 = [*(id *)(a1 + 32) appendSampleBuffer:v3];
        CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v4);
        if (ImageBuffer)
        {
          v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A3D8]) initWithCVPixelBuffer:ImageBuffer];
          v5 &= [*(id *)(a1 + 48) accumulate:v7 error:*(void *)(a1 + 80)];
        }
        CFRelease(v4);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v5 ^ 1;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        break;
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      [*(id *)(a1 + 32) markAsFinished];
      v8 = *(NSObject **)(a1 + 64);
      dispatch_group_leave(v8);
    }
  }
}

void __128__PIAutoLoopExportJob_writeVideoFrom_toWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_error___block_invoke_38(uint64_t a1)
{
}

- (id)renderer:(id *)a3
{
  int v5 = +[PIAutoLoopExportJob metalRenderer];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PIAutoLoopExportJob;
    id v7 = [(NUVideoExportJob *)&v10 renderer:a3];
  }
  v8 = v7;

  return v8;
}

- (PIAutoLoopExportJob)initWithVideoExportRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v8 = NSString;
      v9 = v7;
      objc_super v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = NSStringFromSelector(a2);
      v13 = [v8 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_56);
        }
LABEL_7:
        os_log_t v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          id v16 = (void *)MEMORY[0x1E4F29060];
          v17 = v15;
          v18 = [v16 callStackSymbols];
          v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          uint64_t v28 = v19;
          _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_56);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      uint64_t v22 = (void *)MEMORY[0x1E4F29060];
      id v23 = specific;
      v17 = v20;
      BOOL v24 = [v22 callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = specific;
      __int16 v29 = 2114;
      double v30 = v25;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_56);
  }
}

- (PIAutoLoopExportJob)initWithAutoLoopExportRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PIAutoLoopExportJob;
  return [(NUVideoExportJob *)&v4 initWithVideoExportRequest:a3];
}

+ (id)metalRenderer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PIAutoLoopExportJob_metalRenderer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (metalRenderer_onceToken != -1) {
    dispatch_once(&metalRenderer_onceToken, block);
  }
  v2 = (void *)metalRenderer_metalRenderer;
  return v2;
}

void __36__PIAutoLoopExportJob_metalRenderer__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldUseMetalRenderer])
  {
    id v3 = MTLCreateSystemDefaultDevice();
    if (v3)
    {
      uint64_t v1 = [objc_alloc(MEMORY[0x1E4F7A570]) initWithMetalDevice:v3 options:0];
      v2 = (void *)metalRenderer_metalRenderer;
      metalRenderer_metalRenderer = v1;
    }
  }
}

+ (BOOL)shouldUseMetalRenderer
{
  v2 = [MEMORY[0x1E4F7A4A0] globalSettings];
  char v3 = [v2 BOOLSettingForKey:@"PI_AUTOLOOP_EXPORT_USE_METAL" defaultValue:&__block_literal_global_18243];

  return v3;
}

uint64_t __45__PIAutoLoopExportJob_shouldUseMetalRenderer__block_invoke()
{
  return 0;
}

@end