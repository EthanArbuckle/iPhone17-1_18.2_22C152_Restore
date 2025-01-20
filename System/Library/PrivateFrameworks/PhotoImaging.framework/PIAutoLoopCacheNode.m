@interface PIAutoLoopCacheNode
+ (id)nodeWithInput:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration;
- (PIAutoLoopCacheNode)initWithInput:(id)a3 frameDuration:(id *)a4;
- (id)descriptionSubClassHook;
- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4;
- (id)outputSettings:(id *)a3;
- (id)persistentLongExposureURL;
- (id)persistentMaskURL;
- (id)persistentURL;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)subsampleFactorForScale:(id)a3;
@end

@implementation PIAutoLoopCacheNode

- (id)outputSettings:(id *)a3
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)PIAutoLoopCacheNode;
  v5 = [(NUVideoCacheNode *)&v27 outputSettings:sel_outputSettings_];
  if (v5)
  {
    v6 = [(NUCacheNode *)self inputNode];
    v7 = [v6 outputImageGeometry:a3];

    if (v7)
    {
      v8 = [(NUCacheNode *)self inputNode];
      v9 = [v8 videoProperties:a3];

      if (v9)
      {
        v10 = [v9 colorProperties];
        v11 = (void *)[v10 mutableCopy];

        uint64_t v12 = *MEMORY[0x1E4F162E0];
        v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F162E0]];
        int v14 = [v13 isEqualToString:*MEMORY[0x1E4F24C08]];

        if (v14) {
          [v11 setObject:*MEMORY[0x1E4F162F0] forKeyedSubscript:v12];
        }
        [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F16258]];
        uint64_t v15 = [v7 scaledSize];
        double v17 = (double)(v15 * v16) * 1.5;
        [(PIAutoLoopCacheNode *)self frameDuration];
        double v18 = 1.0 / CMTimeGetSeconds(&v26);
        v28[0] = *MEMORY[0x1E4F161D8];
        v19 = [NSNumber numberWithDouble:v18 * (v17 * 8.0) * 0.05];
        uint64_t v20 = *MEMORY[0x1E4F162A8];
        v29[0] = v19;
        v29[1] = &unk_1F0009A28;
        uint64_t v21 = *MEMORY[0x1E4F16278];
        v28[1] = v20;
        v28[2] = v21;
        v22 = [NSNumber numberWithDouble:v18];
        v28[3] = *MEMORY[0x1E4F161C0];
        v29[2] = v22;
        v29[3] = MEMORY[0x1E4F1CC28];
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

        [v5 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F16268]];
        id v24 = v5;
      }
      else
      {
        id v24 = 0;
      }
    }
    else
    {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v25 = NUAssertLogger_7830();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      CMTime v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "originalRequest != nil");
      *(_DWORD *)buf = 138543362;
      v42 = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    objc_super v27 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v29 = NUAssertLogger_7830();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v33 = dispatch_get_specific(*v27);
        v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        v36 = [v34 callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v33;
        __int16 v43 = 2114;
        v44 = v37;
        _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v32;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  v8 = [(NUCacheNode *)self temporaryURLPrefix];
  v9 = [v8 URLByAppendingPathExtension:@"stab"];
  v10 = [v9 URLByAppendingPathExtension:@"mov"];

  v11 = [v8 URLByAppendingPathExtension:@"lexp"];
  uint64_t v12 = [v11 URLByAppendingPathExtension:@"jpg"];

  v13 = [v8 URLByAppendingPathExtension:@"mask"];
  int v14 = [v13 URLByAppendingPathExtension:@"jpg"];

  uint64_t v15 = [PIAutoLoopExportRequest alloc];
  uint64_t v16 = [v7 composition];
  double v17 = [(id)*MEMORY[0x1E4F44410] identifier];
  double v18 = [(PIAutoLoopExportRequest *)v15 initWithComposition:v16 stabilizedVideoURL:v10 longExposureDestinationURL:v12 maskDestinationURL:v14 destinationUTI:v17];

  v19 = [(PIAutoLoopCacheNode *)self outputSettings:a4];
  if (v19)
  {
    [(NUVideoExportRequest *)v18 setOutputSettings:v19];
    dispatch_queue_t v20 = dispatch_queue_create("PIAutoLoopCacheNode", 0);
    [(NURenderRequest *)v18 setResponseQueue:v20];

    uint64_t v21 = [v7 name];
    if ([v21 length])
    {
      v22 = [v7 name];
      [(NURenderRequest *)v18 setName:v22];
    }
    else
    {
      [(NURenderRequest *)v18 setName:@"PIAutoLoopCacheNode-autoLoopExportRequest"];
    }

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __65__PIAutoLoopCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
    v38[3] = &unk_1E5D7F6D0;
    v38[4] = self;
    id v39 = v12;
    id v40 = v14;
    [(NURenderRequest *)v18 setCompletionBlock:v38];
    v23 = v18;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __65__PIAutoLoopCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v16 = 0;
  v4 = [v3 result:&v16];
  id v5 = v16;
  id v6 = *(void **)(a1 + 32);
  if (!v4)
  {
    v13 = *(void **)(a1 + 32);
LABEL_6:
    [v13 resolveWithSourceNode:0 error:v5];
    goto LABEL_8;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  v8 = [*(id *)(a1 + 32) persistentLongExposureURL];
  id v15 = 0;
  LOBYTE(v7) = [v6 installTemporaryURL:v7 intoPersistentURL:v8 error:&v15];
  id v9 = v15;

  v10 = *(void **)(a1 + 32);
  if ((v7 & 1) == 0)
  {
    [*(id *)(a1 + 32) resolveWithSourceNode:0 error:v9];
    id v5 = v9;
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = [*(id *)(a1 + 32) persistentMaskURL];
  id v14 = 0;
  LOBYTE(v11) = [v10 installTemporaryURL:v11 intoPersistentURL:v12 error:&v14];
  id v5 = v14;

  v13 = *(void **)(a1 + 32);
  if ((v11 & 1) == 0) {
    goto LABEL_6;
  }
  [v13 resolveSourceWithResponse:v3];
LABEL_8:
}

- (id)persistentMaskURL
{
  v2 = [(NUCacheNode *)self persistentURLPrefix];
  id v3 = [v2 URLByAppendingPathExtension:@"mask"];
  v4 = [v3 URLByAppendingPathExtension:@"jpg"];

  return v4;
}

- (id)persistentLongExposureURL
{
  v2 = [(NUCacheNode *)self persistentURLPrefix];
  id v3 = [v2 URLByAppendingPathExtension:@"lexp"];
  v4 = [v3 URLByAppendingPathExtension:@"jpg"];

  return v4;
}

- (id)persistentURL
{
  v2 = [(NUCacheNode *)self persistentURLPrefix];
  id v3 = [v2 URLByAppendingPathExtension:@"stab"];
  v4 = [v3 URLByAppendingPathExtension:@"mov"];

  return v4;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PIAutoLoopCacheNode;
  id v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  return v6;
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  return 1;
}

- (id)descriptionSubClassHook
{
  return @"AutoLoop";
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  v4 = [(NURenderNode *)self settings];
  CFDictionaryRef dictionaryRepresentation = [v4 objectForKeyedSubscript:@"frameDuration"];

  CMTimeMakeFromDictionary((CMTime *)retstr, dictionaryRepresentation);

  return result;
}

- (PIAutoLoopCacheNode)initWithInput:(id)a3 frameDuration:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v13 = NUAssertLogger_7830();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    id v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v17 = NUAssertLogger_7830();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        CMTime v26 = dispatch_get_specific(*v15);
        objc_super v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        id v15 = [v27 callStackSymbols];
        v29 = [v15 componentsJoinedByString:@"\n"];
        LODWORD(time.value) = 138543618;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v26;
        LOWORD(time.flags) = 2114;
        *(void *)((char *)&time.flags + 2) = v29;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v15 = [v19 componentsJoinedByString:@"\n"];
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v15;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
    }
    int v23 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if ((a4->var2 & 1) == 0)
  {
    dispatch_queue_t v20 = NUAssertLogger_7830();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "CMTIME_IS_VALID(frameDuration)");
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);
    }
    id v15 = (const void **)MEMORY[0x1E4F7A308];
    v22 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v17 = NUAssertLogger_7830();
    int v23 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        LODWORD(time.value) = 138543362;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v23)
    {
      BOOL v30 = dispatch_get_specific(*v15);
      v31 = (void *)MEMORY[0x1E4F29060];
      id v32 = v30;
      v33 = [v31 callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v30;
      LOWORD(time.flags) = 2114;
      *(void *)((char *)&time.flags + 2) = v34;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  uint64_t v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  CMTime time = (CMTime)*a4;
  CFDictionaryRef v9 = CMTimeCopyAsDictionary(&time, 0);
  [v8 setObject:v9 forKeyedSubscript:@"frameDuration"];

  uint64_t v36 = *MEMORY[0x1E4F7A300];
  v37 = v7;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v35.receiver = self;
  v35.super_class = (Class)PIAutoLoopCacheNode;
  uint64_t v11 = [(NUCacheNode *)&v35 initWithInputs:v10 settings:v8 subsampleFactor:0];

  return v11;
}

+ (id)nodeWithInput:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    v46 = NUAssertLogger_7830();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(v74.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v74.start.value + 4) = (CMTimeValue)v47;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v74, 0xCu);
    }
    v48 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v50 = NUAssertLogger_7830();
    BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v51)
      {
        v54 = dispatch_get_specific(*v48);
        v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = v54;
        v57 = [v55 callStackSymbols];
        v58 = [v57 componentsJoinedByString:@"\n"];
        LODWORD(v74.start.value) = 138543618;
        *(CMTimeValue *)((char *)&v74.start.value + 4) = (CMTimeValue)v54;
        LOWORD(v74.start.flags) = 2114;
        *(void *)((char *)&v74.start.flags + 2) = v58;
        _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v74, 0x16u);
      }
    }
    else if (v51)
    {
      v52 = [MEMORY[0x1E4F29060] callStackSymbols];
      v53 = [v52 componentsJoinedByString:@"\n"];
      LODWORD(v74.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v74.start.value + 4) = (CMTimeValue)v53;
      _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v74, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v13 = v12;
  id v14 = [v11 objectForKeyedSubscript:@"recipe"];
  if (MEMORY[0x1AD0F94E0]())
  {
    [MEMORY[0x1E4F7A438] invalidError:@"invalid autoloop recipe" object:v14];
    id v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = [v13 beginGroupWithName:@"AutoLoop" error:a6];
    if (v16)
    {
      double v17 = [v10 videoProperties:a6];
      BOOL v18 = v17;
      if (v17)
      {
        [v17 orientation];
        v19 = [v10 outputImageGeometry:a6];
        if (v19)
        {
          v66 = v19;
          v67 = v18;
          [v19 orientation];
          NUOrientationInverse();
          uint64_t v20 = NUOrientationConcat();
          uint64_t v21 = NUOrientationInverse();
          v22 = (void *)[objc_alloc(MEMORY[0x1E4F7A5B8]) initWithOrientation:v20 input:v10];
          int v23 = +[PIAutoLoopStabVideoNode nodeWithInput:v22 recipe:v14 error:a6];

          if (v23)
          {
            memset(&v73, 0, sizeof(v73));
            PIAutoLoopRecipeGetFrameDuration(v14, &v73);
            id v24 = (void *)[objc_alloc(MEMORY[0x1E4F7A5B8]) initWithOrientation:v21 input:v23];

            id v25 = objc_alloc((Class)a1);
            v74.start = v73;
            CMTime v26 = (void *)[v25 initWithInput:v24 frameDuration:&v74];
            id v27 = (id)[v16 addTag:@"StabilizedVideo" forNode:v26];
            id v28 = [v11 objectForKeyedSubscript:@"flavor"];
            uint64_t v29 = PIAutoLoopFlavorFromString(v28);
            v65 = PIAutoLoopRecipeGetFlavorParameters(v14, v29);
            if (v65)
            {
              v61 = v28;
              long long v30 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
              *(_OWORD *)&v74.start.value = *MEMORY[0x1E4F1FA20];
              *(_OWORD *)&v74.start.epoch = v30;
              *(_OWORD *)&v74.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
              v31 = [v11 objectForKeyedSubscript:@"trim"];
              v62 = v31;
              v63 = v24;
              if (v31)
              {
                id v32 = v31;
                uint64_t v59 = v29;
                v60 = v26;
                v33 = [v31 objectForKeyedSubscript:@"start"];
                v34 = [v32 objectForKeyedSubscript:@"end"];
                objc_super v35 = [v32 objectForKeyedSubscript:@"startScale"];
                uint64_t v36 = [v32 objectForKeyedSubscript:@"endScale"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        memset(&v68, 0, 24);
                        CMTimeMake(&v68.start, [v33 integerValue], objc_msgSend(v35, "intValue"));
                        memset(&v72, 0, sizeof(v72));
                        CMTimeMake(&v72, [v34 integerValue], objc_msgSend(v36, "intValue"));
                        CMTime lhs = v72;
                        CMTime rhs = v68.start;
                        CMTimeSubtract(&duration, &lhs, &rhs);
                        CMTime lhs = v68.start;
                        CMTimeRangeMake(&v74, &lhs, &duration);
                      }
                    }
                  }
                }

                uint64_t v29 = v59;
                CMTime v26 = v60;
                id v24 = v63;
              }
              switch(v29)
              {
                case 1:
                  v37 = PIAutoLoopVideoNode;
                  goto LABEL_27;
                case 2:
                  v37 = PIAutoLoopMirrorVideoNode;
LABEL_27:
                  id v43 = [v37 alloc];
                  CMTime v72 = v73;
                  CMTimeRange v68 = v74;
                  v44 = (PILongExposureCacheNode *)[v43 initWithInput:v26 frameDuration:&v72 trimRange:&v68 settings:v65];
                  goto LABEL_28;
                case 3:
                  if ([v13 mediaComponentType] == 1)
                  {
                    v38 = v26;
                    uint64_t v39 = [[PILongExposureCacheNode alloc] initWithAutoLoopCacheNode:v26 urlKey:@"persistentLongExposureURL"];
                    id v40 = (id)[v16 addTag:@"LongExposure" forNode:v39];
                    v41 = [[PILongExposureCacheNode alloc] initWithAutoLoopCacheNode:v26 urlKey:@"persistentMaskURL"];
                    id v42 = (id)[v16 addTag:@"LongExposureMotion" forNode:v41];

                    v64 = v41;
                    CMTime v26 = v38;
                  }
                  else
                  {
                    v44 = v26;
LABEL_28:
                    uint64_t v39 = v44;
                  }
                  id v24 = [v16 addTag:@"Output" forNode:v39];

                  if ([v13 endGroupWithName:@"AutoLoop" error:a6])
                  {
                    id v15 = v24;
                    id v24 = v15;
                  }
                  else
                  {
                    id v15 = 0;
                  }
                  id v28 = v61;
LABEL_33:

                  break;
                default:
                  id v28 = v61;
                  [MEMORY[0x1E4F7A438] invalidError:@"Invalid recipe flavor" object:v61];
                  id v15 = 0;
                  *a6 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_33;
              }
            }
            else
            {
              [MEMORY[0x1E4F7A438] invalidError:@"Malformed AutoLoop recipe : missing flavor parameters" object:v28];
              id v15 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            id v15 = 0;
          }
          v19 = v66;
          BOOL v18 = v67;
        }
        else
        {
          id v15 = 0;
        }
      }
      else
      {
        id v15 = 0;
      }
    }
    else
    {
      id v15 = 0;
    }
  }
  return v15;
}

@end