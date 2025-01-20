@interface NUKeyFrameSourceNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3;
- (NUKeyFrameSourceNode)initWithSettings:(id)a3 orientation:(int64_t)a4;
- (NUKeyFrameSourceNode)initWithVideoSource:(id)a3 time:(id *)a4 settings:(id)a5 orientation:(int64_t)a6;
- (__CVBuffer)_pixelBufferWithAuxiliaryImageType:(int64_t)a3 error:(id *)a4;
- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (opaqueCMSampleBuffer)_sampleBufferWithAuxiliaryImageType:(int64_t)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation NUKeyFrameSourceNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSourceNode, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NUSourceNode *)self auxiliaryImageType];
  videoSourceNode = self->_videoSourceNode;
  if (v5 < 2)
  {
    uint64_t v10 = [(NUVideoSourceNode *)videoSourceNode pixelSizeWithSourceOptions:v4];
    int64_t v12 = v13;
  }
  else
  {
    v7 = [(NUVideoSourceNode *)videoSourceNode auxiliaryVideoTrackProperties];
    v8 = [(NUSourceNode *)self auxiliaryImageTypeString];
    v9 = [v7 objectForKeyedSubscript:v8];

    uint64_t v10 = [v9 size];
    int64_t v12 = v11;
  }
  int64_t v14 = v10;
  int64_t v15 = v12;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v23 = NUAssertLogger_554();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(frameTime.value) = 138543362;
      *(CMTimeValue *)((char *)&frameTime.value + 4) = (CMTimeValue)v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&frameTime, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v26 = NUAssertLogger_554();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        LODWORD(frameTime.value) = 138543618;
        *(CMTimeValue *)((char *)&frameTime.value + 4) = (CMTimeValue)v30;
        LOWORD(frameTime.flags) = 2114;
        *(void *)((char *)&frameTime.flags + 2) = v34;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&frameTime, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      LODWORD(frameTime.value) = 138543362;
      *(CMTimeValue *)((char *)&frameTime.value + 4) = (CMTimeValue)v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&frameTime, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _evaluateImagePropertiesWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1405, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v8 = [(NUSourceNode *)self originalNode];
  v9 = v8;
  if (!v8)
  {
    v18 = [(NUVideoSourceNode *)self->_videoSourceNode _evaluateImagePropertiesWithSourceOptions:v7 error:a4];
    goto LABEL_26;
  }
  uint64_t v10 = [v8 imageProperties:a4];
  if (v10)
  {
    int64_t v11 = [[_NUImageProperties alloc] initWithProperties:v10];
    [(_NUImageProperties *)v11 resetAuxiliaryImageProperties];
    videoSourceNode = self->_videoSourceNode;
    id v40 = 0;
    CMTime frameTime = (CMTime)self->_frameTime;
    int64_t v13 = [(NURenderNode *)videoSourceNode outputTimedMetadataSampleWithIdentifier:kMetadataIdentifier_SmartStyleInfo atTime:&frameTime error:&v40];
    id v14 = v40;
    int64_t v15 = v14;
    if (v13)
    {
      CMTime frameTime = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      id v39 = 0;
      v16 = [(NUKeyFrameSourceNode *)self _sampleBufferWithAuxiliaryImageType:3 error:&v39];
      id v17 = v39;

      if (v16)
      {
        CMSampleBufferGetPresentationTimeStamp(&frameTime, v16);
        CFRelease(v16);
      }
      else
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
        }
        v20 = _NURenderLogger;
        if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.value) = 138543362;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v17;
          _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Failed to get style learn time: %{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      v21 = [v13 metadataGroup];
      CMTime buf = frameTime;
      v18 = +[NUVideoUtilities semanticStylePropertiesFromMetadataGroup:v21 keyTime:&buf error:a4];

      if (!v18)
      {
        *a4 = +[NUError errorWithCode:1 reason:@"Failed to get styles properties from video metadata" object:v13 underlyingError:v17];
LABEL_24:

        goto LABEL_25;
      }
      [(_NUImageProperties *)v11 setSemanticStyleProperties:v18];
    }
    else if (v14)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
      }
      v19 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        LODWORD(frameTime.value) = 138543362;
        *(CMTimeValue *)((char *)&frameTime.value + 4) = (CMTimeValue)v15;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Failed to get style metadata: %{public}@", (uint8_t *)&frameTime, 0xCu);
      }
      id v17 = v15;
    }
    else
    {
      id v17 = 0;
    }
    v18 = v11;
    goto LABEL_24;
  }
  v18 = 0;
LABEL_25:

LABEL_26:

  return v18;
}

- (opaqueCMSampleBuffer)_sampleBufferWithAuxiliaryImageType:(int64_t)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v22 = NUAssertLogger_554();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_554();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        id v39 = [v37 callStackSymbols];
        id v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v40;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      BOOL v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _sampleBufferWithAuxiliaryImageType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1369, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"error != NULL");
  }
  if ((unint64_t)a3 <= 1)
  {
    v29 = NUAssertLogger_554();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "auxiliaryImageType != NUAuxiliaryImageTypeNone && auxiliaryImageType != NUAuxiliaryImageTypeUnknown");
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v32 = NUAssertLogger_554();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        v48 = [v46 callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v49;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&buf[4] = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _sampleBufferWithAuxiliaryImageType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1370, @"Invalid parameter not satisfying: %s", v50, v51, v52, v53, (uint64_t)"auxiliaryImageType != NUAuxiliaryImageTypeNone && auxiliaryImageType != NUAuxiliaryImageTypeUnknown");
  }
  v7 = [(NUVideoSourceNode *)self->_videoSourceNode asset:a4];
  if (v7)
  {
    v8 = [(NUVideoSourceNode *)self->_videoSourceNode auxiliaryVideoTrackProperties];
    if ((unint64_t)a3 > 0xB) {
      v9 = @"Invalid";
    }
    else {
      v9 = off_1E5D94190[a3];
    }
    int64_t v11 = v9;
    int64_t v12 = [v8 objectForKeyedSubscript:v11];

    if (v12)
    {
      int64_t v13 = objc_msgSend(MEMORY[0x1E4F8CC38], "trackWithTrackID:forAsset:", objc_msgSend(v12, "trackID"), v7);
      id v14 = v13;
      if (v13)
      {
        *(_OWORD *)CMTime buf = *(_OWORD *)&self->_frameTime.value;
        *(void *)&buf[16] = self->_frameTime.epoch;
        int64_t v15 = [v13 makeSampleCursorWithPresentationTimeStamp:buf];
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F16698]) initWithAsset:v7 timebase:0];
        id v17 = (void *)[objc_alloc(MEMORY[0x1E4F166A8]) initWithStartCursor:v15];
        [v17 setDirection:0];
        id v54 = 0;
        uint64_t v10 = (opaqueCMSampleBuffer *)[v16 createSampleBufferForRequest:v17 error:&v54];
        id v18 = v54;
        if (!v10)
        {
          *a4 = +[NUError errorWithCode:1 reason:@"Failed to read sample" object:v7 underlyingError:v18];
        }
      }
      else
      {
        +[NUError missingError:@"No such track" object:v12];
        uint64_t v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if ((unint64_t)a3 > 0xB) {
        v19 = @"Invalid";
      }
      else {
        v19 = off_1E5D94190[a3];
      }
      v20 = v19;
      *a4 = +[NUError notFoundError:@"No auxiliary video properties" object:v20];

      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a5)
  {
    id v18 = NUAssertLogger_554();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&buf[4] = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_554();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        id v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        uint64_t v35 = [v33 callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        *(void *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v36;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&buf[4] = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1329, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  if (!a4)
  {
    v25 = NUAssertLogger_554();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      BOOL v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor != NULL");
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_554();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        uint64_t v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        uint64_t v44 = [v42 callStackSymbols];
        v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        *(void *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v45;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      *(void *)&buf[4] = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1331, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"subsampleFactor != NULL");
  }
  v9 = v8;
  *a4 = 1;
  *(void *)CMTime buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v56 = __Block_byref_object_copy__587;
  v57 = __Block_byref_object_dispose__588;
  id v58 = 0;
  int64_t v10 = [(NUSourceNode *)self auxiliaryImageType];
  int64_t v11 = [v9 objectForKeyedSubscript:@"imageType"];
  int v12 = [v11 isEqualToString:@"Disparity"];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__NUKeyFrameSourceNode__evaluateImageWithSourceOptions_subsampleFactor_error___block_invoke;
  block[3] = &unk_1E5D93BE8;
  if (v12) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = v10;
  }
  uint64_t v53 = v14;
  id v54 = a5;
  id v51 = v9;
  uint64_t v52 = buf;
  block[4] = self;
  id v15 = v9;
  dispatch_sync(queue, block);
  id v16 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v16;
}

void __78__NUKeyFrameSourceNode__evaluateImageWithSourceOptions_subsampleFactor_error___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _pixelBufferWithAuxiliaryImageType:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
  if (v2)
  {
    uint64_t v3 = v2;
    if ([*(id *)(a1 + 32) auxiliaryImageType] == 2
      || [*(id *)(a1 + 32) auxiliaryImageType] == 11
      || [*(id *)(a1 + 32) auxiliaryImageType] == 10
      || [*(id *)(a1 + 32) auxiliaryImageType] == 9
      || [*(id *)(a1 + 32) auxiliaryImageType] == 3
      || [*(id *)(a1 + 32) auxiliaryImageType] == 4)
    {
      uint64_t v13 = *MEMORY[0x1E4F1E390];
      id v4 = [MEMORY[0x1E4F1CA98] null];
      v14[0] = v4;
      unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
    else
    {
      unint64_t v5 = 0;
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1E050]) initWithCVPixelBuffer:v3 options:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v9)
    {
      **(void **)(a1 + 64) = +[NUError errorWithCode:3 reason:@"Unable to produce CIImage from CVPixelBuffer" object:*(void *)(a1 + 32)];
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    uint64_t v10 = [*(id *)(a1 + 32) applySourceOptions:*(void *)(a1 + 40) image:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (__CVBuffer)_pixelBufferWithAuxiliaryImageType:(int64_t)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    BOOL v27 = NUAssertLogger_554();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(v54.value) = 138543362;
      *(CMTimeValue *)((char *)&v54.value + 4) = (CMTimeValue)v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v54, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v30 = NUAssertLogger_554();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        id v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        uint64_t v37 = [v35 callStackSymbols];
        uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
        LODWORD(v54.value) = 138543618;
        *(CMTimeValue *)((char *)&v54.value + 4) = (CMTimeValue)v34;
        LOWORD(v54.flags) = 2114;
        *(void *)((char *)&v54.flags + 2) = v38;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v54, 0x16u);
      }
    }
    else if (v31)
    {
      id v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v33 = [v32 componentsJoinedByString:@"\n"];
      LODWORD(v54.value) = 138543362;
      *(CMTimeValue *)((char *)&v54.value + 4) = (CMTimeValue)v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v54, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _pixelBufferWithAuxiliaryImageType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1264, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"error != NULL");
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 result = self->_pixelBuffer;
  if (result) {
    return result;
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(NUVideoSourceNode *)self->_videoSourceNode asset:a4];
  if (!result) {
    return result;
  }
  id v8 = result;
  uint64_t v9 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:result error:a4];
  if (!v9)
  {

    return 0;
  }
  uint64_t v10 = v9;
  memset(&v54, 0, sizeof(v54));
  [v9 timeRange];
  CMTimeRangeGetEnd(&lhs, &range);
  +[NUVideoUtilities minimumFrameDurationForAssetTrack:v10];
  CMTimeSubtract(&v54, &lhs, &rhs);
  memset(&v50, 0, sizeof(v50));
  CMTime time1 = (CMTime)self->_frameTime;
  CMTime time2 = v54;
  CMTimeMinimum(&v50, &time1, &time2);
  id v11 = v10;
  int v12 = +[NUVideoUtilities defaultVideoSettingsForAVAssetReader];
  uint64_t v13 = v11;
  uint64_t v44 = v12;
  if ((unint64_t)a3 < 2) {
    goto LABEL_12;
  }
  uint64_t v14 = [(NUVideoSourceNode *)self->_videoSourceNode auxiliaryVideoTrackProperties];
  if ((unint64_t)a3 > 0xB) {
    id v15 = @"Invalid";
  }
  else {
    id v15 = off_1E5D94190[a3];
  }
  id v16 = v15;
  id v17 = [v14 objectForKeyedSubscript:v16];

  if (v17)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F8CC38], "trackWithTrackID:forAsset:", objc_msgSend(v17, "trackID"), v8);

    int v12 = v44;
LABEL_12:
    id v47 = 0;
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v8 error:&v47];
    id v19 = v47;
    if (v18)
    {
      id v43 = v11;
      id v46 = 0;
      v20 = +[NUVideoUtilities readerOutputForAssetTrack:v13 outputSettings:v12 error:&v46];
      id v21 = v46;

      if (v20)
      {
        id v45 = 0;
        CMTime time1 = v50;
        BOOL v22 = +[NUVideoUtilities readVideoFrameAtTime:&time1 fromAsset:v8 reader:v18 readerOutput:v20 error:&v45];
        id v23 = v45;

        self->_pixelBuffer = v22;
        if (v22)
        {
          IOSurface = CVPixelBufferGetIOSurface(v22);
          if (IOSurface)
          {
            v25 = IOSurface;
            IOSurfaceLock(IOSurface, 1u, 0);
            IOSurfaceUnlock(v25, 1u, 0);
          }
          int v26 = 0;
        }
        else
        {
          int v26 = 1;
          *a4 = +[NUError errorWithCode:1 reason:@"Failed to read video frame" object:v8 underlyingError:v23];
        }
        id v21 = v23;
      }
      else
      {
        int v26 = 1;
        *a4 = +[NUError errorWithCode:1 reason:@"Failed to create asset reader output" object:v8 underlyingError:v21];
      }

      id v19 = v21;
      id v11 = v43;
      int v12 = v44;
    }
    else
    {
      int v26 = 1;
      *a4 = +[NUError errorWithCode:1 reason:@"Failed to create asset reader" object:v8 underlyingError:v19];
    }

    goto LABEL_25;
  }
  id v19 = [NSNumber numberWithInteger:a3];
  *a4 = +[NUError errorWithCode:3 reason:@"Failed to find auxiliary video properties" object:v19];
  int v26 = 1;
  uint64_t v13 = v11;
  int v12 = v44;
LABEL_25:

  if (v26) {
    return 0;
  }
  return self->_pixelBuffer;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)NUKeyFrameSourceNode;
  [(NUKeyFrameSourceNode *)&v3 dealloc];
}

- (NUKeyFrameSourceNode)initWithSettings:(id)a3 orientation:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_409);
  }
  uint64_t v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSString;
    id v8 = v6;
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    id v11 = NSStringFromSelector(a2);
    int v12 = [v7 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v10, v11];
    *(_DWORD *)CMTime buf = 138543362;
    id v32 = v12;
    _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_409);
      }
      goto LABEL_8;
    }
    if (v13 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_409);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v14 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v15 = (void *)MEMORY[0x1E4F29060];
    id v16 = v14;
    id v17 = [v15 callStackSymbols];
    id v18 = [v17 componentsJoinedByString:@"\n"];
    *(_DWORD *)CMTime buf = 138543362;
    id v32 = v18;
    _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v19 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v21 = (void *)MEMORY[0x1E4F29060];
  id v22 = specific;
  id v16 = v19;
  id v23 = [v21 callStackSymbols];
  v24 = [v23 componentsJoinedByString:@"\n"];
  *(_DWORD *)CMTime buf = 138543618;
  id v32 = specific;
  __int16 v33 = 2114;
  id v34 = v24;
  _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v25 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v25);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode initWithSettings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1254, @"Initializer not available: -[%@ %@], use designated initializer instead.", v27, v28, v29, v30, v26);
}

- (NUKeyFrameSourceNode)initWithVideoSource:(id)a3 time:(id *)a4 settings:(id)a5 orientation:(int64_t)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (NUVideoSourceNode *)a3;
  id v11 = a5;
  if (!v10)
  {
    v20 = NUAssertLogger_554();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "video != nil");
      *(_DWORD *)CMTime buf = 138543362;
      CMTime v54 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v23 = NUAssertLogger_554();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        id v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        uint64_t v37 = [v35 callStackSymbols];
        uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        CMTime v54 = v34;
        __int16 v55 = 2114;
        uint64_t v56 = v38;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      CMTime v54 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode initWithVideoSource:time:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1240, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"video != nil");
  }
  if ((a4->var2 & 1) == 0)
  {
    uint64_t v27 = NUAssertLogger_554();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CMTIME_IS_VALID(time)");
      *(_DWORD *)CMTime buf = 138543362;
      CMTime v54 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v30 = NUAssertLogger_554();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        id v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        id v46 = [v44 callStackSymbols];
        id v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime buf = 138543618;
        CMTime v54 = v43;
        __int16 v55 = 2114;
        uint64_t v56 = v47;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      id v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime buf = 138543362;
      CMTime v54 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode initWithVideoSource:time:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1241, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"CMTIME_IS_VALID(time)");
  }
  int v12 = v11;
  v52.receiver = self;
  v52.super_class = (Class)NUKeyFrameSourceNode;
  uint64_t v13 = [(NUVideoFrameSourceNode *)&v52 initWithSettings:v11 orientation:a6];
  uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v15 = dispatch_queue_create("NUKeyFrameSourceNode", v14);
  queue = v13->_queue;
  v13->_queue = (OS_dispatch_queue *)v15;

  videoSourceNode = v13->_videoSourceNode;
  v13->_videoSourceNode = v10;

  int64_t var3 = a4->var3;
  *(_OWORD *)&v13->_frameTime.value = *(_OWORD *)&a4->var0;
  v13->_frameTime.epoch = var3;

  return v13;
}

@end