@interface _PIParallaxLayerStackJob
- (BOOL)complete:(id *)a3;
- (BOOL)isBackfillRequest;
- (BOOL)isDebugRequest;
- (BOOL)isInactiveRequest;
- (BOOL)isMainRequest;
- (BOOL)isPreviewRequest;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)shouldUseVideoFrame;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (BOOL)wantsRenderStage;
- (CIImage)backgroundImage;
- (CIImage)foregroundImage;
- (NSArray)layers;
- (NUImageBuffer)backgroundBuffer;
- (NUImageBuffer)foregroundBuffer;
- (PFPosterOrientedLayout)layout;
- (PFPosterOrientedLayout)requestLayout;
- (PIParallaxStyle)style;
- (PISegmentationItem)segmentationItem;
- (_PIParallaxLayerStackDebugImageCollector)debugImageCollector;
- (_PIParallaxLayerStackJob)initWithParallaxLayerStackRequest:(id)a3;
- (_PIParallaxLayerStackJob)initWithRequest:(id)a3;
- (id)backfillScalePolicy;
- (id)cacheImage:(id)a3 key:(id)a4 format:(id)a5 colorSpace:(id)a6;
- (id)cachedImage:(id)a3 forKey:(id)a4;
- (id)debugTintedImage:(id)a3 isBackfill:(BOOL)a4;
- (id)deviceScalePolicy;
- (id)effectiveLayout;
- (id)imageByCachingImage:(id)a3 format:(id)a4 colorSpace:(id)a5 key:(id)a6;
- (id)layerForBuffer:(id)a3 image:(id)a4 zPosition:(double)a5 identifier:(id)a6;
- (id)layerForVideoData:(id)a3 zPosition:(double)a4 identifier:(id)a5;
- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3;
- (id)newRenderedPixelBufferFromImage:(id)a3 hasAlpha:(BOOL)a4 error:(id *)a5;
- (id)result;
- (id)scalePolicy;
- (id)targetColorSpace;
- (int64_t)mode;
- (void)setBackgroundBuffer:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setDebugImageCollector:(id)a3;
- (void)setForegroundBuffer:(id)a3;
- (void)setForegroundImage:(id)a3;
- (void)setLayers:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation _PIParallaxLayerStackJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_debugImageCollector, 0);
  objc_storeStrong((id *)&self->_backgroundBuffer, 0);
  objc_storeStrong((id *)&self->_foregroundBuffer, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_foregroundImage, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_cachedImageEntries, 0);
}

- (void)setLayers:(id)a3
{
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setDebugImageCollector:(id)a3
{
}

- (_PIParallaxLayerStackDebugImageCollector)debugImageCollector
{
  return self->_debugImageCollector;
}

- (void)setBackgroundBuffer:(id)a3
{
}

- (NUImageBuffer)backgroundBuffer
{
  return self->_backgroundBuffer;
}

- (void)setForegroundBuffer:(id)a3
{
}

- (NUImageBuffer)foregroundBuffer
{
  return self->_foregroundBuffer;
}

- (void)setBackgroundImage:(id)a3
{
}

- (CIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setForegroundImage:(id)a3
{
}

- (CIImage)foregroundImage
{
  return self->_foregroundImage;
}

- (void)setLayout:(id)a3
{
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- (id)cacheImage:(id)a3 key:(id)a4 format:(id)a5 colorSpace:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (const void **)a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    v27 = NUAssertLogger_19382();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v29 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v31 = NUAssertLogger_19382();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v50 = dispatch_get_specific(*v29);
        v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        v29 = [v51 callStackSymbols];
        v53 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v68 = (const void **)v50;
        __int16 v69 = 2114;
        uint64_t v70 = (uint64_t)v53;
        _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v68 = v29;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v37 = _NUAssertFailHandler();
    goto LABEL_39;
  }
  if (!v12)
  {
    v34 = NUAssertLogger_19382();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "format != nil");
      v35 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v35;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v29 = (const void **)MEMORY[0x1E4F7A308];
    v36 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v31 = NUAssertLogger_19382();
    int v37 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (!v36)
    {
      if (v37)
      {
        v38 = [MEMORY[0x1E4F29060] callStackSymbols];
        v29 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v68 = v29;
        _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_41:

      int v42 = _NUAssertFailHandler();
      goto LABEL_42;
    }
LABEL_39:
    if (v37)
    {
      v54 = dispatch_get_specific(*v29);
      v55 = (void *)MEMORY[0x1E4F29060];
      id v56 = v54;
      v29 = [v55 callStackSymbols];
      v57 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v68 = (const void **)v54;
      __int16 v69 = 2114;
      uint64_t v70 = (uint64_t)v57;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_41;
  }
  if (!v11)
  {
    v39 = NUAssertLogger_19382();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      v40 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v40;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v29 = (const void **)MEMORY[0x1E4F7A308];
    v41 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v31 = NUAssertLogger_19382();
    int v42 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (!v41)
    {
      if (v42)
      {
        v43 = [MEMORY[0x1E4F29060] callStackSymbols];
        v29 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v68 = v29;
        _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_44:

      int v47 = _NUAssertFailHandler();
      goto LABEL_45;
    }
LABEL_42:
    if (v42)
    {
      v58 = dispatch_get_specific(*v29);
      v59 = (void *)MEMORY[0x1E4F29060];
      id v60 = v58;
      v29 = [v59 callStackSymbols];
      v61 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v68 = (const void **)v58;
      __int16 v69 = 2114;
      uint64_t v70 = (uint64_t)v61;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_44;
  }
  v14 = v13;
  [v10 extent];
  if (CGRectIsInfinite(v75))
  {
    v44 = NUAssertLogger_19382();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = [NSString stringWithFormat:@"Invalid image extent"];
      *(_DWORD *)buf = 138543362;
      v68 = v45;
      _os_log_error_impl(&dword_1A9680000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v29 = (const void **)MEMORY[0x1E4F7A308];
    v46 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v31 = NUAssertLogger_19382();
    int v47 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (!v46)
    {
      if (v47)
      {
        v48 = [MEMORY[0x1E4F29060] callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v68 = v49;
        _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_47;
    }
LABEL_45:
    if (v47)
    {
      v62 = dispatch_get_specific(*v29);
      v63 = (void *)MEMORY[0x1E4F29060];
      id v64 = v62;
      v65 = [v63 callStackSymbols];
      v66 = [v65 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v68 = (const void **)v62;
      __int16 v69 = 2114;
      uint64_t v70 = (uint64_t)v66;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_47:

    _NUAssertFailHandler();
  }
  v15 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
  v16 = [v15 cache];
  v17 = [v16 objectForKey:v11];

  if (v17
    && ([(_PIParallaxRenderCacheEntry *)v17 image],
        v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v18 digest],
        uint64_t v20 = [v10 digest],
        v18,
        v19 == v20))
  {
    v21 = v17;
  }
  else
  {
    v21 = [[_PIParallaxRenderCacheEntry alloc] initWithImage:v10 format:v12 colorSpace:v14];

    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_19344);
    }
    v22 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      *(_DWORD *)buf = 138543874;
      v68 = v11;
      __int16 v69 = 2048;
      uint64_t v70 = [(_PIParallaxRenderCacheEntry *)v21 sizeInBytes];
      __int16 v71 = 2048;
      uint64_t v72 = [v10 digest];
      _os_log_impl(&dword_1A9680000, v23, OS_LOG_TYPE_INFO, "Cache miss for image: %{public}@ cost: %lu digest: %llx", buf, 0x20u);
    }
    v24 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
    v25 = [v24 cache];
    objc_msgSend(v25, "setObject:forKey:cost:", v21, v11, -[_PIParallaxRenderCacheEntry sizeInBytes](v21, "sizeInBytes"));
  }
  return v21;
}

- (id)imageByCachingImage:(id)a3 format:(id)a4 colorSpace:(id)a5 key:(id)a6
{
  v7 = [(_PIParallaxLayerStackJob *)self cacheImage:a3 key:a6 format:a4 colorSpace:a5];
  [(NSMutableArray *)self->_cachedImageEntries addObject:v7];
  v8 = [v7 cachedImage];

  return v8;
}

- (id)cachedImage:(id)a3 forKey:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F7A5D8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 RGBAh];
  id v10 = [MEMORY[0x1E4F7A400] sRGBLinearColorSpace];
  v11 = [(_PIParallaxLayerStackJob *)self imageByCachingImage:v8 format:v9 colorSpace:v10 key:v7];

  return v11;
}

- (id)debugTintedImage:(id)a3 isBackfill:(BOOL)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v18 = @"inputBiasVector";
    v5 = (void *)MEMORY[0x1E4F1E080];
    id v6 = a3;
    id v7 = [v5 vectorWithX:0.1 Y:0.0 Z:-0.1 W:0.0];
    v19[0] = v7;
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = (void **)v19;
    id v10 = &v18;
  }
  else
  {
    v16 = @"inputBiasVector";
    v11 = (void *)MEMORY[0x1E4F1E080];
    id v12 = a3;
    id v7 = [v11 vectorWithX:-0.1 Y:0.0 Z:0.1 W:0.0];
    v17 = v7;
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = &v17;
    id v10 = &v16;
  }
  id v13 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
  v14 = [a3 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v13];

  return v14;
}

- (id)newRenderedPixelBufferFromImage:(id)a3 hasAlpha:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(NURenderJob *)self renderer:a5];
  if (v9)
  {
    if (v6) {
      uint64_t v10 = 1111970369;
    }
    else {
      uint64_t v10 = 875704422;
    }
    v11 = (void *)MEMORY[0x1E4F7A718];
    [v8 extent];
    NUPixelRectFromCGRect();
    id v12 = objc_msgSend(v11, "newPixelBufferOfSize:format:", v23[6], v23[7], v10);
    if (v12)
    {
      id v13 = v12;
      if (v6)
      {
        v14 = (__CVBuffer *)[v12 CVPixelBuffer];
        CVBufferSetAttachment(v14, (CFStringRef)*MEMORY[0x1E4F249D0], (CFTypeRef)*MEMORY[0x1E4F1CFC8], kCVAttachmentMode_ShouldPropagate);
        v15 = (__CVBuffer *)[v13 CVPixelBuffer];
        CVBufferSetAttachment(v15, (CFStringRef)*MEMORY[0x1E4F249D8], (CFTypeRef)*MEMORY[0x1E4F249E8], kCVAttachmentMode_ShouldPropagate);
      }
      v16 = [(_PIParallaxLayerStackJob *)self targetColorSpace];
      objc_msgSend(v16, "applyAttachmentsToCVPixelBuffer:", objc_msgSend(v13, "CVPixelBuffer"));

      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", objc_msgSend(v13, "CVPixelBuffer"));
      v18 = v17;
      if (v17)
      {
        if (v6) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 0;
        }
        [v17 setAlphaMode:v19];
        [v8 extent];
        NUPixelRectFromCGRect();
        uint64_t v20 = objc_msgSend(v9, "renderImage:rect:toDestination:atPoint:error:", v8, v23, v18, *MEMORY[0x1E4F7A318], *(void *)(MEMORY[0x1E4F7A318] + 8), a5);
        if (v20) {
          v21 = [[_PIParallaxRenderBuffer alloc] initWithPixelBuffer:v13 renderTask:v20];
        }
        else {
          v21 = 0;
        }
      }
      else
      {
        [MEMORY[0x1E4F7A438] failureError:@"Failed to create renderDestination" object:0];
        v21 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      [MEMORY[0x1E4F7A438] failureError:@"Failed to create pixel buffer" object:0];
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)layerForVideoData:(id)a3 zPosition:(double)a4 identifier:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    uint64_t v20 = NUAssertLogger_19382();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "videoData != nil");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v22 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v24 = NUAssertLogger_19382();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v33 = dispatch_get_specific(*v22);
        v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        v22 = [v34 callStackSymbols];
        v36 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = (const void **)v33;
        __int16 v44 = 2114;
        v45 = v36;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = v22;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v30 = _NUAssertFailHandler();
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    v27 = NUAssertLogger_19382();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v22 = (const void **)MEMORY[0x1E4F7A308];
    v29 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v24 = NUAssertLogger_19382();
    int v30 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v43 = v32;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_23;
    }
LABEL_21:
    if (v30)
    {
      int v37 = dispatch_get_specific(*v22);
      v38 = (void *)MEMORY[0x1E4F29060];
      id v39 = v37;
      v40 = [v38 callStackSymbols];
      v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v43 = (const void **)v37;
      __int16 v44 = 2114;
      v45 = v41;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_23:

    _NUAssertFailHandler();
  }
  v11 = [(_PIParallaxLayerStackJob *)self segmentationItem];
  [v11 settlingEffectNormalizedBounds];

  id v12 = [(NURenderJob *)self fullSizeGeometry];
  id v13 = v12;
  if (v12) {
    [v12 extent];
  }
  NUPixelRectToCGRect();

  NURectDenormalize();
  NURectFlipYOrigin();
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8CCD8]), "initWithVideoData:frame:zPosition:identifier:", v8, v10, v14, v15, v16, v17, a4);

  return v18;
}

- (id)layerForBuffer:(id)a3 image:(id)a4 zPosition:(double)a5 identifier:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10)
  {
    v26 = NUAssertLogger_19382();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v30 = NUAssertLogger_19382();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        __int16 v44 = dispatch_get_specific(*v28);
        v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v28 = [v45 callStackSymbols];
        int v47 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v47;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      BOOL v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v36 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  if (!v11)
  {
    v33 = NUAssertLogger_19382();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v34;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = (const void **)MEMORY[0x1E4F7A308];
    id v35 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v30 = NUAssertLogger_19382();
    int v36 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (!v35)
    {
      if (v36)
      {
        int v37 = [MEMORY[0x1E4F29060] callStackSymbols];
        v28 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v28;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_31:

      int v41 = _NUAssertFailHandler();
      goto LABEL_32;
    }
LABEL_29:
    if (v36)
    {
      v48 = dispatch_get_specific(*v28);
      v49 = (void *)MEMORY[0x1E4F29060];
      id v50 = v48;
      v28 = [v49 callStackSymbols];
      v51 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v48;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v51;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  id v13 = v12;
  if (!v12)
  {
    v38 = NUAssertLogger_19382();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v39;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = (const void **)MEMORY[0x1E4F7A308];
    v40 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v30 = NUAssertLogger_19382();
    int v41 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (!v40)
    {
      if (v41)
      {
        int v42 = [MEMORY[0x1E4F29060] callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v43;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_34;
    }
LABEL_32:
    if (v41)
    {
      id v52 = dispatch_get_specific(*v28);
      v53 = (void *)MEMORY[0x1E4F29060];
      id v54 = v52;
      v55 = [v53 callStackSymbols];
      id v56 = [v55 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v52;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v56;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_34:

    _NUAssertFailHandler();
  }
  memset(buf, 0, 32);
  [v11 extent];
  NUPixelRectFromCGRect();
  [(NURenderJob *)self renderScale];
  NUPixelRectToCGRect();
  NUScaleInvert();
  NUScaleToDouble();
  NUScaleRect();
  double v14 = [(NURenderJob *)self fullSizeGeometry];
  double v15 = v14;
  if (v14) {
    [v14 extent];
  }
  NUPixelRectToCGRect();

  NURectFlipYOrigin();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = (void *)[v10 CVPixelBuffer];
  if (v24) {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8CC80]), "initWithImage:frame:zPosition:identifier:", v24, v13, v17, v19, v21, v23, a5);
  }

  return v24;
}

- (id)result
{
  v3 = objc_alloc_init(_PIParallaxLayerStackResult);
  v4 = [(_PIParallaxLayerStackJob *)self layout];
  v5 = [v4 clockLayerOrder];
  uint64_t v6 = [v5 isEqualToString:*MEMORY[0x1E4F8D090]];

  id v7 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
  uint64_t v8 = [v7 isSettlingEffectEnabled];

  id v9 = objc_alloc(MEMORY[0x1E4F8CC98]);
  id v10 = [(_PIParallaxLayerStackJob *)self layers];
  id v11 = [(_PIParallaxLayerStackJob *)self layout];
  id v12 = (void *)[v9 initWithLayers:v10 layout:v11 depthEnabled:v6 parallaxDisabled:0 clockAreaLuminance:v8 settlingEffectEnabled:*MEMORY[0x1E4F8CFC8]];

  id v13 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
  LODWORD(v8) = [v13 headroomBlurEnabled];

  if (v8) {
    [v12 markMayContainBakedHeadroom];
  }
  [(_PIParallaxLayerStackResult *)v3 setLayerStack:v12];

  return v3;
}

- (BOOL)complete:(id *)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v6 = self->_cachedImageEntries;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "waitForRender:", a3, (void)v47))
        {
          BOOL v14 = 0;
          goto LABEL_38;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v11 = [(_PIParallaxLayerStackJob *)self segmentationItem];
  uint64_t v12 = [v11 classification];

  if (v12 == 1)
  {
    id v13 = (double *)MEMORY[0x1E4F8D100];
  }
  else
  {
    id v13 = (double *)MEMORY[0x1E4F8D108];
    if (v12 != 2) {
      id v13 = (double *)MEMORY[0x1E4F8D0F8];
    }
  }
  double v15 = *v13;
  double v16 = [(_PIParallaxLayerStackJob *)self foregroundImage];
  double v17 = (double *)MEMORY[0x1E4F8D0E0];
  if (!v16) {
    double v17 = (double *)MEMORY[0x1E4F8D110];
  }
  double v18 = *v17;

  uint64_t v6 = (NSMutableArray *)(id)*MEMORY[0x1E4F8CFA0];
  id v19 = (id)*MEMORY[0x1E4F8CF90];
  int64_t v20 = [(_PIParallaxLayerStackJob *)self mode];
  int64_t v21 = v20;
  if (v20 == 3)
  {
    double v22 = -20.0;
    double v15 = -10.0;
    double v23 = (id *)MEMORY[0x1E4F8CFB0];
    v24 = (id *)MEMORY[0x1E4F8CFB8];
    goto LABEL_20;
  }
  if (v20 == 2)
  {
    double v22 = v18 + -0.5;
    double v15 = v15 + -0.5;
    double v23 = (id *)MEMORY[0x1E4F8CF98];
    v24 = (id *)MEMORY[0x1E4F8CFA8];
LABEL_20:
    BOOL v25 = (NSMutableArray *)*v24;

    id v26 = *v23;
    uint64_t v6 = v25;
    id v19 = v26;
    goto LABEL_22;
  }
  double v22 = v18;
LABEL_22:
  v27 = [(_PIParallaxLayerStackJob *)self backgroundBuffer];

  if (v27)
  {
    v28 = [(_PIParallaxLayerStackJob *)self backgroundBuffer];
    v29 = [(_PIParallaxLayerStackJob *)self backgroundImage];
    int v30 = [(_PIParallaxLayerStackJob *)self layerForBuffer:v28 image:v29 zPosition:v19 identifier:v22];

    if (!v30)
    {
      v43 = (void *)MEMORY[0x1E4F7A438];
      __int16 v44 = [(_PIParallaxLayerStackJob *)self backgroundImage];
      v45 = @"Failed to render background layer";
      goto LABEL_36;
    }
    [v5 addObject:v30];
  }
  BOOL v31 = [(_PIParallaxLayerStackJob *)self foregroundBuffer];

  if (!v31)
  {
LABEL_28:
    id v35 = [(_PIParallaxLayerStackJob *)self debugImageCollector];

    if (v35)
    {
      int v36 = [(_PIParallaxLayerStackJob *)self debugImageCollector];
      int v37 = [v36 resultLayersWithRenderer:self];
      [v5 addObjectsFromArray:v37];
    }
    if (v21 == 7)
    {
      v38 = [(_PIParallaxLayerStackJob *)self segmentationItem];
      int v39 = [v38 isSettlingEffectAvailable];

      if (v39)
      {
        v40 = [(_PIParallaxLayerStackJob *)self segmentationItem];
        int v41 = [v40 settlingEffectVideoData];

        int v42 = [(_PIParallaxLayerStackJob *)self layerForVideoData:v41 zPosition:*MEMORY[0x1E4F8CFC0] identifier:v18];
        [v5 addObject:v42];
      }
    }
    [(_PIParallaxLayerStackJob *)self setLayers:v5];
    BOOL v14 = 1;
    goto LABEL_37;
  }
  BOOL v32 = [(_PIParallaxLayerStackJob *)self foregroundBuffer];
  v33 = [(_PIParallaxLayerStackJob *)self foregroundImage];
  v34 = [(_PIParallaxLayerStackJob *)self layerForBuffer:v32 image:v33 zPosition:v6 identifier:v15];

  if (v34)
  {
    [v5 addObject:v34];

    goto LABEL_28;
  }
  v43 = (void *)MEMORY[0x1E4F7A438];
  __int16 v44 = [(_PIParallaxLayerStackJob *)self backgroundImage];
  v45 = @"Failed to render foreground layer";
LABEL_36:
  *a3 = [v43 failureError:v45 object:v44];

  BOOL v14 = 0;
LABEL_37:

LABEL_38:
  return v14;
}

- (BOOL)render:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(_PIParallaxLayerStackJob *)self mode] == 7) {
    return 1;
  }
  uint64_t v6 = [(NURenderJob *)self renderer:a3];
  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = self->_cachedImageEntries;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "render:error:", v6, a3, (void)v20))
          {
            BOOL v5 = 0;
            goto LABEL_19;
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v12 = [(_PIParallaxLayerStackJob *)self foregroundImage];

    if (v12)
    {
      id v13 = [(_PIParallaxLayerStackJob *)self foregroundImage];
      id v14 = [(_PIParallaxLayerStackJob *)self newRenderedPixelBufferFromImage:v13 hasAlpha:1 error:a3];
      [(_PIParallaxLayerStackJob *)self setForegroundBuffer:v14];
    }
    double v15 = [(_PIParallaxLayerStackJob *)self backgroundImage];

    if (v15)
    {
      double v16 = [(_PIParallaxLayerStackJob *)self backgroundImage];
      id v17 = [(_PIParallaxLayerStackJob *)self newRenderedPixelBufferFromImage:v16 hasAlpha:0 error:a3];
      [(_PIParallaxLayerStackJob *)self setBackgroundBuffer:v17];
    }
    double v18 = [(_PIParallaxLayerStackJob *)self debugImageCollector];

    if (v18)
    {
      uint64_t v7 = [(_PIParallaxLayerStackJob *)self debugImageCollector];
      [(NSMutableArray *)v7 renderImagesWithRenderer:self];
      BOOL v5 = 1;
LABEL_19:
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  v191.receiver = self;
  v191.super_class = (Class)_PIParallaxLayerStackJob;
  LODWORD(v4) = [(NURenderJob *)&v191 prepare:a3];
  if (!v4) {
    return (char)v4;
  }
  uint64_t v5 = [(_PIParallaxLayerStackJob *)self segmentationItem];
  if (!v5)
  {
    v154 = NUAssertLogger_19382();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
    {
      v155 = [NSString stringWithFormat:@"Missing segmentation item"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v155;
      _os_log_error_impl(&dword_1A9680000, v154, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v114 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v116 = NUAssertLogger_19382();
    BOOL v157 = os_log_type_enabled(v116, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v157)
      {
        v164 = dispatch_get_specific(*v114);
        v165 = (void *)MEMORY[0x1E4F29060];
        id v166 = v164;
        v114 = [v165 callStackSymbols];
        v167 = [v114 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v164;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v167;
        _os_log_error_impl(&dword_1A9680000, v116, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v157)
    {
      v158 = [MEMORY[0x1E4F29060] callStackSymbols];
      v114 = [v158 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v114;
      _os_log_error_impl(&dword_1A9680000, v116, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v162 = _NUAssertFailHandler();
    goto LABEL_77;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [(_PIParallaxLayerStackJob *)self effectiveLayout];
  uint64_t v8 = [(_PIParallaxLayerStackJob *)self style];
  uint64_t v9 = v8;
  if (v8)
  {
    id v186 = v8;
  }
  else
  {
    uint64_t v10 = [v6 originalStyle];
    id v186 = +[PIParallaxStyle styleWithBakedStyle:v10];
  }
  uint64_t v11 = [v6 classification];
  BOOL v12 = [(_PIParallaxLayerStackJob *)self isMainRequest];
  BOOL v187 = [(_PIParallaxLayerStackJob *)self isBackfillRequest];
  BOOL v184 = [(_PIParallaxLayerStackJob *)self isInactiveRequest];
  BOOL v13 = [(_PIParallaxLayerStackJob *)self isDebugRequest];
  BOOL v178 = [(_PIParallaxLayerStackJob *)self isPreviewRequest];
  id v14 = +[PIGlobalSettings globalSettings];
  int v15 = [v14 segmentationDebugTintLayers];

  double v16 = [(NURenderJob *)self outputGeometry];
  [v16 size];
  NUPixelSizeToCGSize();
  double v18 = v17;
  double v20 = v19;

  v190 = objc_msgSend(v7, "layoutByUpdatingImageSize:", v18, v20);

  long long v21 = [(NURenderJob *)self outputImage];
  if (!v21)
  {
    v159 = NUAssertLogger_19382();
    if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
    {
      v160 = [NSString stringWithFormat:@"Missing output image"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v160;
      _os_log_error_impl(&dword_1A9680000, v159, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v114 = (const void **)MEMORY[0x1E4F7A308];
    v161 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v116 = NUAssertLogger_19382();
    int v162 = os_log_type_enabled(v116, OS_LOG_TYPE_ERROR);
    if (!v161)
    {
      if (v162)
      {
        v163 = [MEMORY[0x1E4F29060] callStackSymbols];
        v114 = [v163 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v114;
        _os_log_error_impl(&dword_1A9680000, v116, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_79:

      int v117 = _NUAssertFailHandler();
      goto LABEL_80;
    }
LABEL_77:
    if (v162)
    {
      v168 = dispatch_get_specific(*v114);
      v169 = (void *)MEMORY[0x1E4F29060];
      id v170 = v168;
      v114 = [v169 callStackSymbols];
      v171 = [v114 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v168;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v171;
      _os_log_error_impl(&dword_1A9680000, v116, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_79;
  }
  int v180 = v15;
  BOOL v181 = v13;
  char v182 = (char)v4;
  id v22 = v21;
  long long v23 = [v6 segmentationMatte];
  v189 = v22;
  if (v23)
  {
    v24 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
    char v25 = [v24 isSettlingEffectEnabled] | v184;

    if (v25) {
      goto LABEL_14;
    }
    id v26 = (void *)MEMORY[0x1E4F1E050];
    v27 = [v6 segmentationMatte];
    v28 = [v26 imageWithNUImageBuffer:v27];

    if ((unint64_t)(v11 - 3) <= 1)
    {
      uint64_t v29 = +[PISegmentationHelper invertImage:v28];

      v28 = (void *)v29;
    }
    if (!v28)
    {
LABEL_14:
      v183 = 0;
      long long v23 = 0;
    }
    else
    {
      int v30 = [v6 segmentationBackground];

      if (v30)
      {
        BOOL v31 = (void *)MEMORY[0x1E4F1E050];
        BOOL v32 = [v6 segmentationBackground];
        uint64_t v33 = [v31 imageWithNUImageBuffer:v32];

        id v34 = v189;
        v183 = (void *)v33;
        id v22 = +[PISegmentationHelper backgroundForImage:v189 matte:v28 infill:v33];
      }
      else
      {
        v183 = 0;
        id v34 = v22;
      }
      long long v23 = +[PISegmentationHelper upsampleMatteImage:v28 guideImage:v34];

      if (v12)
      {
        id v35 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
        int v36 = [v35 cache];

        if (v36)
        {
          int v37 = [MEMORY[0x1E4F7A5D8] R8];
          v38 = [MEMORY[0x1E4F7A400] linearGrayColorSpace];
          uint64_t v39 = [(_PIParallaxLayerStackJob *)self imageByCachingImage:v23 format:v37 colorSpace:v38 key:@"MatteImage"];

          long long v23 = (void *)v39;
        }
      }
    }
  }
  else
  {
    v183 = 0;
  }
  if (v184) {
    [v186 inactiveFilter];
  }
  else {
  v40 = [v186 filter];
  }
  int v41 = [v186 kind];
  if (([v41 isEqualToString:*MEMORY[0x1E4F8D000]] & 1) == 0
    && ([v41 isEqualToString:*MEMORY[0x1E4F8D018]] & 1) == 0
    && ([v41 isEqualToString:*MEMORY[0x1E4F8D008]] & 1) == 0)
  {
    int v42 = [v41 isEqualToString:*MEMORY[0x1E4F8D010]];
    if (v40) {
      goto LABEL_27;
    }
LABEL_49:
    v112 = NUAssertLogger_19382();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    {
      v113 = [NSString stringWithFormat:@"missing style filter"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v113;
      _os_log_error_impl(&dword_1A9680000, v112, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v114 = (const void **)MEMORY[0x1E4F7A308];
    v115 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v116 = NUAssertLogger_19382();
    int v117 = os_log_type_enabled(v116, OS_LOG_TYPE_ERROR);
    if (!v115)
    {
      if (v117)
      {
        v118 = [MEMORY[0x1E4F29060] callStackSymbols];
        v119 = [v118 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v119;
        _os_log_error_impl(&dword_1A9680000, v116, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_82;
    }
LABEL_80:
    if (v117)
    {
      v172 = dispatch_get_specific(*v114);
      v173 = (void *)MEMORY[0x1E4F29060];
      id v174 = v172;
      v175 = [v173 callStackSymbols];
      v176 = [v175 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v172;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v176;
      _os_log_error_impl(&dword_1A9680000, v116, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_82:

    _NUAssertFailHandler();
  }
  int v42 = 1;
  if (!v40) {
    goto LABEL_49;
  }
LABEL_27:
  int v177 = v42;
  v179 = v41;
  [v190 visibleFrame];
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  [(NURenderJob *)self renderScale];
  NUScaleToDouble();
  NUScaleRect();
  double v52 = v51;
  objc_msgSend(v40, "setVisibleFrame:");
  [v190 deviceResolution];
  objc_msgSend(v40, "setRenderScale:", fmin(v52 / v53, 1.0));
  id v54 = [v6 localLightData];
  [v40 setLocalLightData:v54];

  [v40 setInputGuideImage:v189];
  [v40 setInputBackgroundImage:v22];
  if (v23)
  {
    [v40 setInputMatteImage:v23];
    [v40 setInputForegroundImage:v189];
  }
  v55 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
  id v56 = [v55 cache];

  if (v56) {
    [v40 setCache:self];
  }
  v57 = [v40 outputBackgroundImage];

  uint64_t v58 = [v40 outputForegroundImage];
  uint64_t v185 = [v40 outputMatteImage];

  memset(buf, 0, 32);
  NUScaleToDouble();
  NUScaleRect();
  NUPixelRectFromCGRect();
  NUPixelRectToCGRect();
  CGFloat v60 = v59;
  CGFloat v62 = v61;
  CGFloat v64 = v63;
  CGFloat v66 = v65;
  [v57 extent];
  v204.origin.CGFloat x = v67;
  v204.origin.CGFloat y = v68;
  v204.size.CGFloat width = v69;
  v204.size.CGFloat height = v70;
  v194.origin.CGFloat x = v60;
  v194.origin.CGFloat y = v62;
  v194.size.CGFloat width = v64;
  v194.size.CGFloat height = v66;
  CGRect v195 = CGRectUnion(v194, v204);
  CGFloat x = v195.origin.x;
  CGFloat y = v195.origin.y;
  CGFloat width = v195.size.width;
  CGFloat height = v195.size.height;
  [v57 extent];
  v205.origin.CGFloat x = v75;
  v205.origin.CGFloat y = v76;
  v205.size.CGFloat width = v77;
  v205.size.CGFloat height = v78;
  v196.origin.CGFloat x = x;
  v196.origin.CGFloat y = y;
  v196.size.CGFloat width = width;
  v196.size.CGFloat height = height;
  if ((!CGRectEqualToRect(v196, v205) || v187) && PFPosterEnableHeadroom())
  {
    [v190 extendedImageExtent];
    NUScaleToDouble();
    NUScaleRect();
    NUPixelRectFromCGRect();
    v79 = objc_alloc_init(PIHeadroomFilter);
    [(PIHeadroomFilter *)v79 setInputImage:v57];
    NUPixelRectToCGRect();
    -[PIHeadroomFilter setExtendedRect:](v79, "setExtendedRect:");
    v80 = [v190 configuration];
    [v80 screenScale];
    -[PIHeadroomFilter setRenderScale:](v79, "setRenderScale:");

    v81 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
    -[PIHeadroomFilter setUseBlur:](v79, "setUseBlur:", [v81 headroomBlurEnabled] & (v177 ^ 1));

    [(PIHeadroomFilter *)v79 setIsInactive:v184];
    if ([v186 hasTonalityMode]) {
      -[PIHeadroomFilter setUseHighKeyStyle:](v79, "setUseHighKeyStyle:", [v186 tonality] == 3);
    }
    if ([v186 hasHeadroomLook]) {
      -[PIHeadroomFilter setUseHighKeyStyle:](v79, "setUseHighKeyStyle:", [v186 headroomLook] == 2);
    }
    if ([v186 hasColorParameter])
    {
      v82 = [v186 color];
      [(PIHeadroomFilter *)v79 setPrimaryGradientColor:v82];
    }
    uint64_t v83 = [(PIHeadroomFilter *)v79 outputImage];

    v57 = (void *)v83;
  }
  v84 = v183;
  if (v185 && v58)
  {
    uint64_t v85 = +[PISegmentationHelper foregroundForImage:matte:](PISegmentationHelper, "foregroundForImage:matte:", v58);

    uint64_t v58 = (void *)v85;
    v84 = v183;
  }
  if (!v187)
  {
    if (!v178)
    {
      [v190 parallaxVisibleFrame];
      v206.origin.CGFloat x = v86;
      v206.origin.CGFloat y = v87;
      v206.size.CGFloat width = v88;
      v206.size.CGFloat height = v89;
      v197.origin.CGFloat x = v44;
      v197.origin.CGFloat y = v46;
      v197.size.CGFloat width = v48;
      v197.size.CGFloat height = v50;
      CGRect v198 = CGRectUnion(v197, v206);
      CGFloat v90 = v198.origin.x;
      CGFloat v91 = v198.origin.y;
      CGFloat v92 = v198.size.width;
      CGFloat v93 = v198.size.height;
      [v190 inactiveFrame];
      v207.origin.CGFloat x = v94;
      v207.origin.CGFloat y = v95;
      v207.size.CGFloat width = v96;
      v207.size.CGFloat height = v97;
      v199.origin.CGFloat x = v90;
      v199.origin.CGFloat y = v91;
      v199.size.CGFloat width = v92;
      v199.size.CGFloat height = v93;
      CGRect v200 = CGRectUnion(v199, v207);
      CGFloat v98 = v200.origin.x;
      CGFloat v99 = v200.origin.y;
      CGFloat v100 = v200.size.width;
      CGFloat v101 = v200.size.height;
      [v190 parallaxInactiveFrame];
      v208.origin.CGFloat x = v102;
      v208.origin.CGFloat y = v103;
      v208.size.CGFloat width = v104;
      v208.size.CGFloat height = v105;
      v201.origin.CGFloat x = v98;
      v201.origin.CGFloat y = v99;
      v201.size.CGFloat width = v100;
      v201.size.CGFloat height = v101;
      CGRect v202 = CGRectUnion(v201, v208);
      CGFloat v106 = v202.origin.x;
      CGFloat v107 = v202.origin.y;
      CGFloat v108 = v202.size.width;
      CGFloat v109 = v202.size.height;
      if ([(_PIParallaxLayerStackJob *)self shouldUseVideoFrame])
      {
        [v6 settlingEffectNormalizedBounds];
        v110 = [(NURenderJob *)self outputGeometry];
        v111 = v110;
        if (v110) {
          [v110 extent];
        }
        NUPixelRectToCGRect();
        NURectDenormalize();
        CGFloat v121 = v120;
        CGFloat v123 = v122;
        CGFloat v125 = v124;
        CGFloat v127 = v126;

        v203.origin.CGFloat x = v106;
        v203.origin.CGFloat y = v107;
        v203.size.CGFloat width = v108;
        v203.size.CGFloat height = v109;
        v209.origin.CGFloat x = v121;
        v209.origin.CGFloat y = v123;
        v209.size.CGFloat width = v125;
        v209.size.CGFloat height = v127;
        CGRectIntersection(v203, v209);
        v84 = v183;
      }
    }
    NUScaleToDouble();
    NUScaleRect();
    NUPixelRectFromCGRect();
    NUAlignPixelRectToPixelGrid();
    [v190 extendedImageExtent];
    NUScaleToDouble();
    NUScaleRect();
    NUPixelRectFromCGRect();
    NUPixelRectIntersection();
    NUPixelRectToCGRect();
    double v129 = v128;
    double v131 = v130;
    double v133 = v132;
    double v135 = v134;
    uint64_t v136 = objc_msgSend(v57, "imageByCroppingToRect:");

    uint64_t v137 = objc_msgSend(v58, "imageByCroppingToRect:", v129, v131, v133, v135);

    v57 = (void *)v136;
    uint64_t v58 = (void *)v137;
  }
  v138 = v6;
  if (v180)
  {
    uint64_t v139 = [(_PIParallaxLayerStackJob *)self debugTintedImage:v58 isBackfill:v187];

    v140 = self;
    uint64_t v141 = [(_PIParallaxLayerStackJob *)self debugTintedImage:v57 isBackfill:v187];

    v57 = (void *)v141;
    uint64_t v58 = (void *)v139;
  }
  else
  {
    v140 = self;
  }
  v188 = v40;
  if (v181)
  {
    v142 = objc_alloc_init(_PIParallaxLayerStackDebugImageCollector);
    v143 = v140;
    [(_PIParallaxLayerStackJob *)v140 setDebugImageCollector:v142];

    v144 = [(_PIParallaxLayerStackJob *)v140 debugImageCollector];
    v145 = v138;
    v146 = v140;
    v147 = v189;
    v148 = v190;
    v149 = v186;
    v4 = v138;
    v150 = (void *)v185;
    [v144 prepareImagesForItem:v145 renderer:v146 layout:v190 style:v186 inputImage:v189 matteImage:v185 infillImage:v84 foregroundImage:v58 backgroundImage:v57];

    v151 = v179;
  }
  else
  {
    v143 = v140;
    [(_PIParallaxLayerStackJob *)v140 setBackgroundImage:v57];
    [(_PIParallaxLayerStackJob *)v140 setForegroundImage:v58];
    v151 = v179;
    v147 = v189;
    v148 = v190;
    v152 = v138;
    v150 = (void *)v185;
    v149 = v186;
    v4 = v152;
  }
  [(_PIParallaxLayerStackJob *)v143 setLayout:v148];

  LOBYTE(v4) = v182;
  return (char)v4;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PIParallaxLayerStackJob;
  id v3 = [(NURenderJob *)&v5 newRenderPipelineStateForEvaluationMode:a3];
  [v3 setSampleMode:2];
  [v3 setDisableIntermediateCaching:1];
  return v3;
}

- (id)scalePolicy
{
  unint64_t v3 = [(_PIParallaxLayerStackJob *)self mode];
  if (v3 > 7)
  {
    v4 = 0;
  }
  else if (((1 << v3) & 0x8B) != 0 {
         || ((1 << v3) & 0x34) == 0
  }
         && (+[PIGlobalSettings globalSettings],
             uint64_t v6 = objc_claimAutoreleasedReturnValue(),
             char v7 = [v6 segmentationDebugPreviewHighQuality],
             v6,
             (v7 & 1) != 0))
  {
    v4 = [(_PIParallaxLayerStackJob *)self deviceScalePolicy];
  }
  else
  {
    v4 = [(_PIParallaxLayerStackJob *)self backfillScalePolicy];
  }
  return v4;
}

- (id)deviceScalePolicy
{
  v2 = [(_PIParallaxLayerStackJob *)self effectiveLayout];
  unint64_t v3 = [[_PIParallaxLayerStackScalePolicy alloc] initWithLayout:v2];

  return v3;
}

- (id)backfillScalePolicy
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [(_PIParallaxLayerStackJob *)self segmentationItem];
  if (!v2)
  {
    uint64_t v11 = NUAssertLogger_19382();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = [NSString stringWithFormat:@"Missing segmentation item"];
      int v24 = 138543362;
      char v25 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v24, 0xCu);
    }
    BOOL v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v15 = NUAssertLogger_19382();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        double v19 = dispatch_get_specific(*v13);
        double v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        id v22 = [v20 callStackSymbols];
        long long v23 = [v22 componentsJoinedByString:@"\n"];
        int v24 = 138543618;
        char v25 = v19;
        __int16 v26 = 2114;
        v27 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v24, 0x16u);
      }
    }
    else if (v16)
    {
      double v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v18 = [v17 componentsJoinedByString:@"\n"];
      int v24 = 138543362;
      char v25 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v24, 0xCu);
    }
    _NUAssertFailHandler();
  }
  unint64_t v3 = v2;
  v4 = [v2 segmentationMatte];
  objc_super v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 size];
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 1512;
    uint64_t v6 = 2016;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:v6 * v8];

  return v9;
}

- (id)effectiveLayout
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(_PIParallaxLayerStackJob *)self requestLayout];
  if (v3) {
    goto LABEL_15;
  }
  v4 = [(_PIParallaxLayerStackJob *)self segmentationItem];
  objc_super v5 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
  if (([v5 isSettlingEffectEnabled] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v6 = [v4 settlingEffectLayout];

  if (!v6)
  {
LABEL_6:
    uint64_t v8 = [v4 originalLayout];

    if (v8) {
      [v4 originalLayout];
    }
    else {
    uint64_t v7 = [v4 defaultLayout];
    }
    goto LABEL_10;
  }
  uint64_t v7 = [v4 settlingEffectLayout];
LABEL_10:
  uint64_t v9 = (void *)v7;
  if ([(_PIParallaxLayerStackJob *)self mode] == 1 || [(_PIParallaxLayerStackJob *)self mode] == 5)
  {
    uint64_t v10 = [v9 landscapeLayout];
  }
  else
  {
    uint64_t v10 = [v9 portraitLayout];
  }
  unint64_t v3 = (void *)v10;

  if (!v3)
  {
    BOOL v12 = NUAssertLogger_19382();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = [NSString stringWithFormat:@"Missing parallax layout"];
      int v25 = 138543362;
      __int16 v26 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v25, 0xCu);
    }
    id v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v16 = NUAssertLogger_19382();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        double v20 = dispatch_get_specific(*v14);
        id v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        long long v23 = [v21 callStackSymbols];
        int v24 = [v23 componentsJoinedByString:@"\n"];
        int v25 = 138543618;
        __int16 v26 = v20;
        __int16 v27 = 2114;
        uint64_t v28 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v25, 0x16u);
      }
    }
    else if (v17)
    {
      double v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v19 = [v18 componentsJoinedByString:@"\n"];
      int v25 = 138543362;
      __int16 v26 = v19;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v25, 0xCu);
    }
    _NUAssertFailHandler();
  }
LABEL_15:
  return v3;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (BOOL)wantsRenderStage
{
  return 1;
}

- (BOOL)shouldUseVideoFrame
{
  v2 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
  char v3 = [v2 shouldUseVideoFrame];

  return v3;
}

- (id)targetColorSpace
{
  if ([(_PIParallaxLayerStackJob *)self isInactiveRequest]) {
    [MEMORY[0x1E4F7A400] sRGBColorSpace];
  }
  else {
  v2 = [MEMORY[0x1E4F7A400] displayP3ColorSpace];
  }
  return v2;
}

- (BOOL)isPreviewRequest
{
  return [(_PIParallaxLayerStackJob *)self mode] == 4 || [(_PIParallaxLayerStackJob *)self mode] == 5;
}

- (BOOL)isDebugRequest
{
  return [(_PIParallaxLayerStackJob *)self mode] == 6;
}

- (BOOL)isInactiveRequest
{
  return [(_PIParallaxLayerStackJob *)self mode] == 3;
}

- (BOOL)isBackfillRequest
{
  return [(_PIParallaxLayerStackJob *)self mode] == 2;
}

- (BOOL)isMainRequest
{
  return [(_PIParallaxLayerStackJob *)self mode] == 0;
}

- (int64_t)mode
{
  v2 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
  int64_t v3 = [v2 layerStackMode];

  return v3;
}

- (PFPosterOrientedLayout)requestLayout
{
  v2 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
  int64_t v3 = [v2 layout];

  return (PFPosterOrientedLayout *)v3;
}

- (PIParallaxStyle)style
{
  v2 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
  int64_t v3 = [v2 style];

  return (PIParallaxStyle *)v3;
}

- (PISegmentationItem)segmentationItem
{
  v2 = [(_PIParallaxLayerStackJob *)self layerStackRequest];
  int64_t v3 = [v2 segmentationItem];

  return (PISegmentationItem *)v3;
}

- (_PIParallaxLayerStackJob)initWithRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v6 = (os_log_t *)MEMORY[0x1E4F7A748];
    uint64_t v7 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSString;
      uint64_t v9 = v7;
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      BOOL v12 = NSStringFromSelector(a2);
      BOOL v13 = [v8 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v11, v12];
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v13;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v14 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_532);
        }
LABEL_7:
        os_log_t v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          BOOL v16 = (void *)MEMORY[0x1E4F29060];
          BOOL v17 = v15;
          double v18 = [v16 callStackSymbols];
          double v19 = [v18 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          uint64_t v28 = v19;
          _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_532);
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
      id v22 = (void *)MEMORY[0x1E4F29060];
      id v23 = specific;
      BOOL v17 = v20;
      int v24 = [v22 callStackSymbols];
      int v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = specific;
      __int16 v29 = 2114;
      int v30 = v25;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    __int16 v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_532);
  }
}

- (_PIParallaxLayerStackJob)initWithParallaxLayerStackRequest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_PIParallaxLayerStackJob;
  int64_t v3 = [(NURenderJob *)&v7 initWithRequest:a3];
  if (v3)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cachedImageEntries = v3->_cachedImageEntries;
    v3->_cachedImageEntries = v4;
  }
  return v3;
}

@end