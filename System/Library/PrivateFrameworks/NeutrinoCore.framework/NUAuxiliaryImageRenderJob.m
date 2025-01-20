@interface NUAuxiliaryImageRenderJob
- (BOOL)complete:(id *)a3;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (BOOL)wantsPrepareNodeCached;
- (BOOL)wantsRenderNodeCached;
- (BOOL)wantsRenderScaleClampedToNativeScale;
- (NUAuxiliaryImage)auxiliaryImage;
- (NUImageProperties)imageProperties;
- (id)evaluateOutputGeometry:(id *)a3;
- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3;
- (id)result;
- (id)scalePolicy;
- (int64_t)auxiliaryImageType;
- (unsigned)targetPixelFormat;
- (void)cleanUp;
- (void)setAuxiliaryImage:(id)a3;
- (void)setAuxiliaryImageType:(int64_t)a3;
- (void)setImageProperties:(id)a3;
@end

@implementation NUAuxiliaryImageRenderJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImage, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_pixelBuffer, 0);

  objc_storeStrong((id *)&self->_renderTask, 0);
}

- (void)setAuxiliaryImageType:(int64_t)a3
{
  self->_auxiliaryImageType = a3;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (void)setAuxiliaryImage:(id)a3
{
}

- (NUAuxiliaryImage)auxiliaryImage
{
  return (NUAuxiliaryImage *)objc_getProperty(self, a2, 256, 1);
}

- (void)setImageProperties:(id)a3
{
}

- (NUImageProperties)imageProperties
{
  return (NUImageProperties *)objc_getProperty(self, a2, 248, 1);
}

- (id)result
{
  v3 = objc_alloc_init(_NUAuxiliaryImageRenderResult);
  v4 = [(NUAuxiliaryImageRenderJob *)self auxiliaryImage];
  [(_NUAuxiliaryImageRenderResult *)v3 setAuxiliaryImage:v4];

  return v3;
}

- (void)cleanUp
{
  renderTask = self->_renderTask;
  self->_renderTask = 0;

  pixelBuffer = self->_pixelBuffer;
  self->_pixelBuffer = 0;
}

- (BOOL)complete:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v17 = NUAssertLogger_987();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v34 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_987();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v34 = v24;
        __int16 v35 = 2114;
        v36 = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v34 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRenderJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 304, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"error != NULL");
  }
  v5 = [(NUAuxiliaryImageRenderJob *)self auxiliaryImage];

  if (!v5)
  {
    v6 = [(CIRenderTask *)self->_renderTask waitUntilCompletedAndReturnError:a3];

    if (!v6)
    {
      v13 = [(NURenderJob *)self request];
      v16 = (void *)[v13 copy];
      *a3 = +[NUError errorWithCode:1 reason:@"failed to render auxiliaryImage" object:v16 underlyingError:*a3];

      BOOL v14 = 0;
      goto LABEL_6;
    }
    v7 = [(NUAuxiliaryImageRenderJob *)self imageProperties];
    v8 = objc_msgSend(v7, "auxiliaryImagePropertiesForType:", -[NUAuxiliaryImageRenderJob auxiliaryImageType](self, "auxiliaryImageType"));

    v9 = [(NUCVPixelBuffer *)self->_pixelBuffer CVPixelBuffer];
    int64_t v10 = [(NUAuxiliaryImageRenderJob *)self auxiliaryImageType];
    v11 = [v8 auxiliaryImageTypeCGIdentifier];
    v12 = +[NUAuxiliaryImageFactory auxiliaryImageWithPixelBuffer:v9 auxiliaryImageType:v10 identifier:v11 originalProperties:v8 error:a3];
    [(NUAuxiliaryImageRenderJob *)self setAuxiliaryImage:v12];
  }
  v13 = [(NUAuxiliaryImageRenderJob *)self auxiliaryImage];
  BOOL v14 = v13 != 0;
LABEL_6:

  return v14;
}

- (BOOL)render:(id *)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v51 = NUAssertLogger_987();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v52;
      _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v54 = NUAssertLogger_987();
    BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = (void *)MEMORY[0x1E4F29060];
        id v60 = v58;
        v61 = [v59 callStackSymbols];
        v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v58;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v62;
        _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v55)
    {
      v56 = [MEMORY[0x1E4F29060] callStackSymbols];
      v57 = [v56 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v57;
      _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 200, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)"error != nil");
  }
  v5 = [(NURenderJob *)self renderNode];
  int v6 = objc_msgSend(v5, "canPropagateOriginalAuxiliaryData:", -[NUAuxiliaryImageRenderJob auxiliaryImageType](self, "auxiliaryImageType"));

  if (v6)
  {
    v7 = [(NURenderJob *)self request];
    if ([v7 skipRenderIfNotRequired])
    {
      +[NUError skippedError:@"Original auxiliary data can be propagated, skipping render" object:v7];
      BOOL v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = [(NURenderJob *)self renderNode];
      v23 = objc_msgSend(v22, "originalAuxiliaryImageForType:error:", -[NUAuxiliaryImageRenderJob auxiliaryImageType](self, "auxiliaryImageType"), a3);

      BOOL v8 = v23 != 0;
      if (v23) {
        [(NUAuxiliaryImageRenderJob *)self setAuxiliaryImage:v23];
      }
    }
    return v8;
  }
  uint64_t v9 = [(NURenderJob *)self renderer:a3];
  if (!v9) {
    return 0;
  }
  int64_t v10 = (void *)v9;
  v11 = [(NURenderJob *)self outputGeometry];
  uint64_t v12 = [v11 scaledSize];
  uint64_t v14 = v13;
  v15 = +[NUVideoUtilities newPixelBufferOfSize:format:](NUVideoUtilities, "newPixelBufferOfSize:format:", v12, v13, [(NUAuxiliaryImageRenderJob *)self targetPixelFormat]);
  pixelBuffer = self->_pixelBuffer;
  self->_pixelBuffer = v15;

  v17 = self->_pixelBuffer;
  if (!v17)
  {
    v24 = [(NURenderJob *)self request];
    v25 = (void *)[v24 copy];
    *a3 = +[NUError failureError:@"failed to allocate buffer for depth" object:v25];

    return 0;
  }
  v18 = 0;
  unint64_t auxiliaryImageType = self->_auxiliaryImageType;
  v68 = v11;
  if (auxiliaryImageType <= 0xB)
  {
    if (((1 << auxiliaryImageType) & 0x378) != 0)
    {
      v20 = [(NUCVPixelBuffer *)v17 CVPixelBuffer];
      CVBufferSetAttachment(v20, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
      BOOL v21 = [(NUCVPixelBuffer *)self->_pixelBuffer CVPixelBuffer];
      CVBufferSetAttachment(v21, (CFStringRef)*MEMORY[0x1E4F24A90], (CFTypeRef)*MEMORY[0x1E4F24AB0], kCVAttachmentMode_ShouldPropagate);
      v18 = 0;
      goto LABEL_29;
    }
    if (((1 << auxiliaryImageType) & 0xC00) != 0)
    {
      v18 = +[NUColorSpace displayP3ColorSpace];
      objc_msgSend(v18, "applyAttachmentsToCVPixelBuffer:", -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer"));
      goto LABEL_29;
    }
    if (auxiliaryImageType != 7) {
      goto LABEL_29;
    }
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType([(NUCVPixelBuffer *)v17 CVPixelBuffer]);
    CFDictionaryRef v27 = CVPixelFormatDescriptionCreateWithPixelFormatType(0, PixelFormatType);
    v28 = [(__CFDictionary *)v27 objectForKeyedSubscript:*MEMORY[0x1E4F24EB0]];
    char v29 = [v28 BOOLValue];

    uint64_t v30 = [(__CFDictionary *)v27 objectForKeyedSubscript:*MEMORY[0x1E4F24EB8]];
    int v31 = [v30 BOOLValue];

    if ((v29 & 1) != 0 || v31)
    {
      v34 = [(NUCVPixelBuffer *)self->_pixelBuffer CVPixelBuffer];
      CFStringRef v33 = (const __CFString *)*MEMORY[0x1E4F24A00];
      CVBufferRemoveAttachment(v34, (CFStringRef)*MEMORY[0x1E4F24A00]);
      __int16 v35 = [(NUCVPixelBuffer *)self->_pixelBuffer CVPixelBuffer];
      CVBufferSetAttachment(v35, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
      v36 = [(NUCVPixelBuffer *)self->_pixelBuffer CVPixelBuffer];
      CVBufferSetAttachment(v36, (CFStringRef)*MEMORY[0x1E4F24C18], (CFTypeRef)*MEMORY[0x1E4F24C40], kCVAttachmentMode_ShouldPropagate);
      v18 = 0;
    }
    else
    {
      v18 = +[NUColorSpace linearGrayColorSpace];
      uint64_t v32 = [(NUCVPixelBuffer *)self->_pixelBuffer CVPixelBuffer];
      CFStringRef v33 = (const __CFString *)*MEMORY[0x1E4F24A00];
      CVBufferSetAttachment(v32, (CFStringRef)*MEMORY[0x1E4F24A00], (CFTypeRef)[v18 CGColorSpace], kCVAttachmentMode_ShouldPropagate);
    }
    uint64_t v37 = [(NUImageProperties *)self->_imageProperties flexRangeProperties];
    if (v37)
    {
      v38 = (void *)v37;
    }
    else
    {
      if (+[NUGlobalSettings forceMeteorPlusLinear])
      {
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v67 = +[NUColorSpace genericGrayGamma2_2ColorSpace];

      v39 = [(NUCVPixelBuffer *)self->_pixelBuffer CVPixelBuffer];
      v38 = +[NUColorSpace linearGrayColorSpace];
      CVBufferSetAttachment(v39, v33, (CFTypeRef)[v38 CGColorSpace], kCVAttachmentMode_ShouldPropagate);
      v18 = (void *)v67;
    }

    goto LABEL_28;
  }
LABEL_29:
  v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer"));
  v41 = NSString;
  v42 = [(NURenderJob *)self request];
  v43 = [v42 name];
  v44 = [v41 stringWithFormat:@"%@-j%lld", v43, -[NURenderJob jobNumber](self, "jobNumber")];
  [v40 setLabel:v44];

  objc_msgSend(v40, "setColorSpace:", objc_msgSend(v18, "CGColorSpace"));
  v45 = [(NURenderJob *)self outputImage];
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  *(void *)&buf[16] = v12;
  uint64_t v70 = v14;
  objc_msgSend(v10, "renderImage:rect:toDestination:atPoint:error:", v45, buf, v40, 0, 0, a3);
  v46 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
  renderTask = self->_renderTask;
  self->_renderTask = v46;

  if (!self->_renderTask)
  {
    v48 = [(NURenderJob *)self request];
    v49 = (void *)[v48 copy];
    *a3 = +[NUError errorWithCode:1 reason:@"failed to prepare render auxiliaryImage" object:v49 underlyingError:*a3];
  }
  return self->_renderTask != 0;
}

- (unsigned)targetPixelFormat
{
  int64_t v3 = [(NUAuxiliaryImageRenderJob *)self auxiliaryImageType];
  if ((unint64_t)(v3 - 10) < 2) {
    return 1111970369;
  }
  if (v3 == 2) {
    return 1751411059;
  }
  unsigned int v4 = 1278226488;
  if (v3 == 7)
  {
    v5 = [(NUAuxiliaryImageRenderJob *)self imageProperties];
    int v6 = [v5 auxiliaryImagePropertiesForType:7];

    uint64_t v10 = 0;
    v7 = [v6 auxiliaryImage:&v10];
    BOOL v8 = v7;
    if (v7) {
      unsigned int v4 = [v7 pixelFormatType];
    }
  }
  return v4;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v7 = NUAssertLogger_987();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v10 = NUAssertLogger_987();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        uint64_t v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v14;
        __int16 v26 = 2114;
        CFDictionaryRef v27 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 160, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"error != nil");
  }
  int64_t v3 = a3;
  v5 = [(NURenderJob *)self request];
  -[NUAuxiliaryImageRenderJob setAuxiliaryImageType:](self, "setAuxiliaryImageType:", [v5 auxiliaryImageType]);
  v23.receiver = self;
  v23.super_class = (Class)NUAuxiliaryImageRenderJob;
  LOBYTE(v3) = [(NURenderJob *)&v23 prepare:v3];

  return (char)v3;
}

- (id)evaluateOutputGeometry:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = [(NURenderJob *)self prepareNode];

  if (!v5)
  {
    BOOL v11 = NUAssertLogger_987();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [NSString stringWithFormat:@"Missing prepare node"];
      *(_DWORD *)buf = 138543362;
      char v29 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_987();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        uint64_t v21 = [v19 callStackSymbols];
        uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        char v29 = v18;
        __int16 v30 = 2114;
        int v31 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      char v29 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRenderJob evaluateOutputGeometry:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 147, @"Missing prepare node", v23, v24, v25, v26, (uint64_t)v27.receiver);
  }
  int v6 = [(NURenderJob *)self prepareNode];
  v7 = [v6 imageProperties:a3];
  [(NUAuxiliaryImageRenderJob *)self setImageProperties:v7];

  BOOL v8 = [(NUAuxiliaryImageRenderJob *)self imageProperties];

  if (v8)
  {
    v27.receiver = self;
    v27.super_class = (Class)NUAuxiliaryImageRenderJob;
    uint64_t v9 = [(NURenderJob *)&v27 evaluateOutputGeometry:a3];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUAuxiliaryImageRenderJob;
  id v5 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](&v8, sel_newRenderPipelineStateForEvaluationMode_);
  int v6 = v5;
  if (a3) {
    [v5 setAuxiliaryImageType:self->_auxiliaryImageType];
  }
  return v6;
}

- (id)scalePolicy
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *((void *)&NUScaleOne + 1);
  uint64_t v3 = NUScaleOne;
  id v5 = [(NUAuxiliaryImageRenderJob *)self imageProperties];

  if (!v5)
  {
    v17 = NUAssertLogger_987();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [NSString stringWithFormat:@"Missing image properties"];
      *(_DWORD *)CFStringRef v33 = 138543362;
      *(void *)&v33[4] = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v33, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v20 = NUAssertLogger_987();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        objc_super v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)CFStringRef v33 = 138543618;
        *(void *)&v33[4] = v24;
        __int16 v34 = 2114;
        __int16 v35 = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v33, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)CFStringRef v33 = 138543362;
      *(void *)&v33[4] = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v33, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRenderJob scalePolicy]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 124, @"Missing image properties", v29, v30, v31, v32, *(uint64_t *)v33);
  }
  int v6 = [(NUAuxiliaryImageRenderJob *)self imageProperties];
  v7 = objc_msgSend(v6, "auxiliaryImagePropertiesForType:", -[NUAuxiliaryImageRenderJob auxiliaryImageType](self, "auxiliaryImageType"));

  if (v7)
  {
    objc_super v8 = [(NUAuxiliaryImageRenderJob *)self imageProperties];
    uint64_t v9 = [v8 size];
    uint64_t v11 = v10;

    uint64_t v12 = [v7 size];
    uint64_t v3 = NUScaleToFitSizeInSize(v9, v11, v12, v13);
    uint64_t v4 = v14;
  }
  BOOL v15 = -[NUFixedScalePolicy initWithScale:]([NUFixedScalePolicy alloc], "initWithScale:", v3, v4);

  return v15;
}

- (BOOL)wantsRenderScaleClampedToNativeScale
{
  return 1;
}

- (BOOL)wantsRenderNodeCached
{
  return 0;
}

- (BOOL)wantsPrepareNodeCached
{
  return 0;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

@end