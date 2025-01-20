@interface NUFaceDetectionJob
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (NUFaceDetectionJob)initWithFaceDetectionRequest:(id)a3;
- (NUFaceDetectionJob)initWithRequest:(id)a3;
- (id)cacheKey;
- (id)detectFaceLandmarksInBuffer:(__CVBuffer *)a3 withFaceRects:(id)a4 error:(id *)a5;
- (id)detectFaceRectsInBuffer:(__CVBuffer *)a3 maxResultCount:(unint64_t)a4 error:(id *)a5;
- (id)result;
- (id)scalePolicy;
- (void)cleanUp;
@end

@implementation NUFaceDetectionJob

- (void).cxx_destruct
{
}

- (void)cleanUp
{
  v4.receiver = self;
  v4.super_class = (Class)NUFaceDetectionJob;
  [(NURenderJob *)&v4 cleanUp];
  faces = self->_faces;
  self->_faces = 0;
}

- (id)result
{
  v3 = objc_alloc_init(_NUFaceDetectionResult);
  [(_NUFaceDetectionResult *)v3 setFaces:self->_faces];
  -[_NUFaceDetectionResult setImageSize:](v3, "setImageSize:", self->_imageSize.width, self->_imageSize.height);

  return v3;
}

- (BOOL)render:(id *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v30 = NUAssertLogger_16485();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v33 = NUAssertLogger_16485();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        v40 = [v38 callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543618;
        *(void *)((char *)&buf.origin.x + 4) = v37;
        WORD2(buf.origin.y) = 2114;
        *(void *)((char *)&buf.origin.y + 6) = v41;
        _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v34)
    {
      v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v36;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 201, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"error != nil");
  }
  v5 = -[NURenderJob renderer:](self, "renderer:");
  if (v5)
  {
    v6 = [(NURenderJob *)self outputImage];
    [v6 extent];
    buf.origin.x = v7;
    buf.origin.y = v8;
    buf.size.width = v9;
    buf.size.height = v10;
    NU::RectT<long>::RectT(&v51, &buf, 0);
    CGSize v47 = v52;
    CGPoint v49 = v51;
    id v11 = +[NUVideoUtilities newPixelBufferOfSize:v52 format:1111970369];
    if (v11)
    {
      v12 = +[NUColorSpace sRGBColorSpace];
      v13 = (__CVBuffer *)[v11 CVPixelBuffer];
      v46 = v12;
      CVBufferSetAttachment(v13, (CFStringRef)*MEMORY[0x1E4F24A00], (CFTypeRef)[v12 CGColorSpace], kCVAttachmentMode_ShouldPropagate);
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E070]), "initWithPixelBuffer:", objc_msgSend(v11, "CVPixelBuffer"));
      v15 = NSString;
      v16 = [(NURenderJob *)self request];
      v17 = [v16 name];
      v18 = [v15 stringWithFormat:@"%@-j%lld", v17, -[NURenderJob jobNumber](self, "jobNumber")];
      [v14 setLabel:v18];

      v19 = [(NURenderJob *)self outputImage];
      buf.origin = v49;
      buf.size = v47;
      v50 = v14;
      v20 = objc_msgSend(v5, "renderImage:rect:toDestination:atPoint:error:", v19, &buf, v14, 0, 0, a3);

      if (v20)
      {
        v21 = [v20 waitUntilCompletedAndReturnError:a3];
        if (v21)
        {
          v22 = [(NUFaceDetectionJob *)self faceDetectionRequest];
          v23 = -[NUFaceDetectionJob detectFaceRectsInBuffer:maxResultCount:error:](self, "detectFaceRectsInBuffer:maxResultCount:error:", [v11 CVPixelBuffer], objc_msgSend(v22, "maxFaceCount"), a3);
          if ([v23 count])
          {
            -[NUFaceDetectionJob detectFaceLandmarksInBuffer:withFaceRects:error:](self, "detectFaceLandmarksInBuffer:withFaceRects:error:", [v11 CVPixelBuffer], v23, a3);
            v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
            uint64_t v24 = [(NSArray *)v48 count];
            BOOL v25 = v24 == [v23 count];
            if (!v25)
            {
              *a3 = +[NUError mismatchError:@"detected face rects but not an equal number of face landmarks" object:v23];
            }
            faces = self->_faces;
            self->_faces = v48;
          }
          else
          {
            faces = self->_faces;
            self->_faces = (NSArray *)MEMORY[0x1E4F1CBF0];
            BOOL v25 = 1;
          }

          v27 = [(NURenderJob *)self outputGeometry];
          self->_imageSize.width = [v27 size];
          self->_imageSize.height = v28;
        }
        else
        {
          v22 = [(NURenderJob *)self request];
          v23 = (void *)[v22 copy];
          +[NUError errorWithCode:1 reason:@"failed to render for face detection. Error completing task." object:v23 underlyingError:*a3];
          BOOL v25 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v21 = [(NURenderJob *)self request];
        v22 = (void *)[v21 copy];
        +[NUError errorWithCode:1 reason:@"failed to render for face detection. Task creation failed." object:v22 underlyingError:*a3];
        BOOL v25 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[NUError failureError:@"failed to allocate buffer for image" object:v6];
      BOOL v25 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (id)detectFaceLandmarksInBuffer:(__CVBuffer *)a3 withFaceRects:(id)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a5)
  {
    v20 = NUAssertLogger_16485();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)CGRect buf = 138543362;
      v55 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v23 = NUAssertLogger_16485();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int64_t v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v55 = v27;
        __int16 v56 = 2114;
        v57 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      BOOL v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v55 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob detectFaceLandmarksInBuffer:withFaceRects:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 178, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  CGFloat v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x1E4F45798]);
  [v9 setRevision:2];
  [v9 setInputFaceObservations:v8];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F45890]);
    id v11 = +[NUFactory sharedFactory];
    v12 = [v11 visionSession];
    v13 = (void *)[v10 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08] session:v12];

    id v53 = v9;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    int v15 = [v13 performRequests:v14 error:a5];

    if (v15)
    {
      v16 = [v9 results];

      if (!v16)
      {
        v36 = NUAssertLogger_16485();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = [NSString stringWithFormat:@"successful face landmark request has nil results"];
          *(_DWORD *)CGRect buf = 138543362;
          v55 = v37;
          _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v39 = NUAssertLogger_16485();
        BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
        if (v38)
        {
          if (v40)
          {
            uint64_t v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            uint64_t v44 = (void *)MEMORY[0x1E4F29060];
            id v45 = v43;
            v46 = [v44 callStackSymbols];
            CGSize v47 = [v46 componentsJoinedByString:@"\n"];
            *(_DWORD *)CGRect buf = 138543618;
            v55 = v43;
            __int16 v56 = 2114;
            v57 = v47;
            _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v40)
        {
          v41 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
          *(_DWORD *)CGRect buf = 138543362;
          v55 = v42;
          _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob detectFaceLandmarksInBuffer:withFaceRects:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 194, @"successful face landmark request has nil results", v48, v49, v50, v51, v52);
      }
      v17 = [v9 results];
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
    *a5 = +[NUError failureError:@"unable to create face landmark request" object:v18];

    v17 = 0;
  }

  return v17;
}

- (id)detectFaceRectsInBuffer:(__CVBuffer *)a3 maxResultCount:(unint64_t)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    v22 = NUAssertLogger_16485();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)CGRect buf = 138543362;
      v57 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v25 = NUAssertLogger_16485();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        id v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        uint64_t v32 = [v30 callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v57 = v29;
        __int16 v58 = 2114;
        v59 = v33;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v57 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob detectFaceRectsInBuffer:maxResultCount:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 153, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"error != NULL");
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F457A8]);
  [v8 setRevision:2];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F45890]);
    id v10 = +[NUFactory sharedFactory];
    id v11 = [v10 visionSession];
    v12 = (void *)[v9 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08] session:v11];

    id v55 = v8;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    int v14 = [v12 performRequests:v13 error:a5];

    if (v14)
    {
      int v15 = [v8 results];

      if (!v15)
      {
        v38 = NUAssertLogger_16485();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          id v39 = [NSString stringWithFormat:@"successful face rect request has nil results"];
          *(_DWORD *)CGRect buf = 138543362;
          v57 = v39;
          _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        BOOL v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = NUAssertLogger_16485();
        BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
        if (v40)
        {
          if (v42)
          {
            id v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v46 = (void *)MEMORY[0x1E4F29060];
            id v47 = v45;
            uint64_t v48 = [v46 callStackSymbols];
            uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
            *(_DWORD *)CGRect buf = 138543618;
            v57 = v45;
            __int16 v58 = 2114;
            v59 = v49;
            _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v42)
        {
          uint64_t v43 = [MEMORY[0x1E4F29060] callStackSymbols];
          uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
          *(_DWORD *)CGRect buf = 138543362;
          v57 = v44;
          _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob detectFaceRectsInBuffer:maxResultCount:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 168, @"successful face rect request has nil results", v50, v51, v52, v53, v54);
      }
      v16 = [v8 results];
      unint64_t v17 = [v16 count];

      if (v17 < a4) {
        a4 = v17;
      }
      v18 = [v8 results];
      v19 = objc_msgSend(v18, "subarrayWithRange:", 0, a4);
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
    *a5 = +[NUError failureError:@"unable to create face rect request" object:v20];

    v19 = 0;
  }

  return v19;
}

- (id)cacheKey
{
  v3 = objc_alloc_init(NUDigest);
  objc_super v4 = [(NURenderJob *)self renderNode];
  objc_msgSend(v4, "nu_updateDigest:", v3);

  [(NUDigest *)v3 finalize];
  v5 = [(NUDigest *)v3 stringValue];

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
  v2 = [(NUFaceDetectionJob *)self faceDetectionRequest];
  v3 = [v2 scalePolicy];

  return v3;
}

- (NUFaceDetectionJob)initWithRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16517);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = NSString;
    id v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    id v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)CGRect buf = 138543362;
    id v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16517);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16517);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v14 = (void *)MEMORY[0x1E4F29060];
    int v15 = v13;
    v16 = [v14 callStackSymbols];
    unint64_t v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)CGRect buf = 138543362;
    id v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  int v15 = v18;
  v22 = [v20 callStackSymbols];
  v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)CGRect buf = 138543618;
  id v31 = specific;
  __int16 v32 = 2114;
  uint64_t v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  BOOL v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 114, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUFaceDetectionJob)initWithFaceDetectionRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUFaceDetectionJob;
  return [(NURenderJob *)&v4 initWithRequest:a3];
}

@end