@interface NUImageFactory
+ (CGImage)newCGImageFromBufferImage:(id)a3;
+ (CGImage)newCGImageFromImageBuffer:(id)a3;
+ (CGImage)newCGImageFromImageStorage:(id)a3 colorSpace:(id)a4;
+ (id)_newCIImageFromImage:(id)a3;
+ (id)bufferImageWithLayout:(id)a3 format:(id)a4 colorSpace:(id)a5;
+ (id)surfaceImageWithLayout:(id)a3 format:(id)a4 colorSpace:(id)a5;
@end

@implementation NUImageFactory

+ (CGImage)newCGImageFromImageBuffer:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v23 = NUAssertLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "imageBuffer != nil");
      *(_DWORD *)buf = 138543362;
      v39 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v26 = NUAssertLogger();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v39 = v30;
        __int16 v40 = 2114;
        v41 = v32;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v39 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUImageFactory newCGImageFromImageBuffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 417, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"imageBuffer != nil");
  }
  v5 = (__CVBuffer *)[v3 CVPixelBuffer];
  if (!CVPixelBufferGetIOSurface(v5) || (v6 = (CGImage *)CGImageCreateFromIOSurface()) == 0)
  {
    CGImageRef imageOut = 0;
    if (VTCreateCGImageFromCVPixelBuffer(v5, 0, &imageOut))
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
      }
      v7 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = NSString;
        v9 = [v4 format];
        v10 = [v8 stringWithFormat:@"newCGImageFromImageBuffer: unsupported format: %@", v9];
        *(_DWORD *)buf = 138543362;
        v39 = v10;
        _os_log_impl(&dword_1A9892000, v7, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);
      }
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
        }
        v11 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v13 = [MEMORY[0x1E4F29060] callStackSymbols];
          v14 = [v13 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v39 = v12;
          __int16 v40 = 2114;
          v41 = v14;
          _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_26151);
        }
        v11 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v21 = [MEMORY[0x1E4F29060] callStackSymbols];
          v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v39 = v22;
          _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
      }

      v15 = [v4 format];
      _NUAssertContinueHandler((uint64_t)"+[NUImageFactory newCGImageFromImageBuffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 430, @"newCGImageFromImageBuffer: unsupported format: %@", v16, v17, v18, v19, (uint64_t)v15);

      v6 = 0;
    }
    else
    {
      v6 = imageOut;
    }
  }

  return v6;
}

+ (CGImage)newCGImageFromImageStorage:(id)a3 colorSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0;
  v13[1] = 0;
  v13[2] = [v6 size];
  v13[3] = v8;
  v9 = +[NURegion regionWithRect:v13];
  v10 = [[NUBufferImageAdapter alloc] initWithBufferProvider:v6 colorSpace:v7 validRegion:v9];
  v11 = (CGImage *)[a1 newCGImageFromBufferImage:v10];

  return v11;
}

+ (CGImage)newCGImageFromBufferImage:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v66 = v3;
  if (!v3)
  {
    v50 = NUAssertLogger();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      callbacks.version = 138543362;
      *(void *)(&callbacks.version + 1) = v51;
      _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&callbacks, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v53 = NUAssertLogger();
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v54)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = [MEMORY[0x1E4F29060] callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        callbacks.version = 138543618;
        *(void *)(&callbacks.version + 1) = v57;
        WORD2(callbacks.getBytePointer) = 2114;
        *(CGDataProviderGetBytePointerCallback *)((char *)&callbacks.getBytePointer + 6) = v59;
        _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&callbacks, 0x16u);
      }
    }
    else if (v54)
    {
      v55 = [MEMORY[0x1E4F29060] callStackSymbols];
      v56 = [v55 componentsJoinedByString:@"\n"];
      callbacks.version = 138543362;
      *(void *)(&callbacks.version + 1) = v56;
      _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&callbacks, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"CGImageRef newCGImageFromImage(__strong id<NUBufferImage>)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 237, @"Invalid parameter not satisfying: %s", v60, v61, v62, v63, (uint64_t)"image != nil");
  }
  v4 = v3;
  v5 = [v3 immutableImageCopy];

  id v6 = [v5 format];
  size_t v7 = [v5 size];
  size_t v9 = v8;
  v10 = +[NUPixelFormat R8];
  char v11 = [v6 isEqualToPixelFormat:v10];

  if (v11)
  {
    CGBitmapInfo v12 = 0;
    size_t v13 = 8;
    size_t v14 = 8;
    goto LABEL_17;
  }
  v15 = +[NUPixelFormat RGBAf];
  char v16 = [v6 isEqualToPixelFormat:v15];

  if (v16)
  {
    CGBitmapInfo v12 = 8451;
    size_t v14 = 128;
    size_t v13 = 32;
    goto LABEL_17;
  }
  uint64_t v17 = +[NUPixelFormat RGBAh];
  char v18 = [v6 isEqualToPixelFormat:v17];

  if (v18)
  {
    CGBitmapInfo v12 = 4355;
    size_t v14 = 64;
    size_t v13 = 16;
    goto LABEL_17;
  }
  uint64_t v19 = +[NUPixelFormat ARGB8];
  char v20 = [v6 isEqualToPixelFormat:v19];

  if (v20)
  {
    CGBitmapInfo v12 = 4;
LABEL_16:
    size_t v14 = 32;
    size_t v13 = 8;
    goto LABEL_17;
  }
  v21 = +[NUPixelFormat BGRA8];
  char v22 = [v6 isEqualToPixelFormat:v21];

  if (v22)
  {
    CGBitmapInfo v12 = 8194;
    goto LABEL_16;
  }
  v23 = +[NUPixelFormat RGBA8];
  if ([v6 isEqualToPixelFormat:v23])
  {

LABEL_15:
    CGBitmapInfo v12 = 16385;
    goto LABEL_16;
  }
  v24 = +[NUPixelFormat sRGBA8];
  char v25 = [v6 isEqualToPixelFormat:v24];

  if (v25) {
    goto LABEL_15;
  }
  uint64_t v35 = +[NUPixelFormat A2RGB10];
  char v36 = [v6 isEqualToPixelFormat:v35];

  if ((v36 & 1) == 0)
  {
    v37 = NUAssertLogger();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = [NSString stringWithFormat:@"newCGImageFromImage unsupported format: %@", v6];
      callbacks.version = 138543362;
      *(void *)(&callbacks.version + 1) = v38;
      _os_log_impl(&dword_1A9892000, v37, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&callbacks, 0xCu);
    }
    v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v40 = NUAssertLogger();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (v39)
    {
      if (v41)
      {
        uint64_t v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = [MEMORY[0x1E4F29060] callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        callbacks.version = 138543618;
        *(void *)(&callbacks.version + 1) = v42;
        WORD2(callbacks.getBytePointer) = 2114;
        *(CGDataProviderGetBytePointerCallback *)((char *)&callbacks.getBytePointer + 6) = v44;
        _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&callbacks, 0x16u);
      }
    }
    else if (v41)
    {
      v64 = [MEMORY[0x1E4F29060] callStackSymbols];
      v65 = [v64 componentsJoinedByString:@"\n"];
      callbacks.version = 138543362;
      *(void *)(&callbacks.version + 1) = v65;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&callbacks, 0xCu);
    }
    _NUAssertContinueHandler((uint64_t)"CGImageRef newCGImageFromImage(__strong id<NUBufferImage>)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 322, @"newCGImageFromImage unsupported format: %@", v45, v46, v47, v48, (uint64_t)v6);
    goto LABEL_32;
  }
  CGBitmapInfo v12 = 204806;
  size_t v14 = 32;
  size_t v13 = 10;
LABEL_17:
  size_t v26 = [v6 alignedRowBytesForWidth:v7];
  BOOL v27 = [v5 layout];
  uint64_t v28 = [v27 tileCount];

  if (v28 == 1) {
    v29 = &xmmword_1F0012B10;
  }
  else {
    v29 = &xmmword_1F0012B38;
  }
  long long v30 = v29[1];
  *(_OWORD *)&callbacks.version = *v29;
  *(_OWORD *)&callbacks.releaseBytePointer = v30;
  callbacks.releaseInfo = (CGDataProviderReleaseInfoCallback)*((void *)v29 + 4);
  id v31 = v5;
  v32 = CGDataProviderCreateDirect(v31, v26 * v9, &callbacks);
  if (!v32)
  {
LABEL_32:
    uint64_t v34 = 0;
    goto LABEL_33;
  }
  uint64_t v33 = [v31 colorSpace];
  uint64_t v34 = CGImageCreate(v7, v9, v13, v14, v26, (CGColorSpaceRef)[v33 CGColorSpace], v12, v32, 0, 0, kCGRenderingIntentDefault);

  CGDataProviderRelease(v32);
LABEL_33:

  return v34;
}

+ (id)_newCIImageFromImage:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    char v18 = NUAssertLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        char v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        size_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v25;
        __int16 v36 = 2114;
        v37 = v27;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUImageFactory _newCIImageFromImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 387, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"image != nil");
  }
  v4 = v3;
  uint64_t v32 = *MEMORY[0x1E4F1E3E8];
  v5 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v33 = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  size_t v7 = [v4 immutableImageCopy];

  size_t v8 = [[_NUImageCIProvider alloc] initWithImage:v7];
  uint64_t v9 = [v7 size];
  uint64_t v11 = v10;
  id v12 = objc_alloc(MEMORY[0x1E4F1E050]);
  size_t v13 = [v7 format];
  uint64_t v14 = [v13 CIFormat];
  v15 = [v7 colorSpace];
  char v16 = objc_msgSend(v12, "initWithImageProvider:size::format:colorSpace:options:", v8, v9, v11, v14, objc_msgSend(v15, "CGColorSpace"), v6);

  return v16;
}

+ (id)bufferImageWithLayout:(id)a3 format:(id)a4 colorSpace:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    v15 = NUAssertLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      char v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "layout != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v18 = NUAssertLogger();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v41 = v28;
        __int16 v42 = 2114;
        v43 = v30;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      char v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v31 = "layout != nil";
    uint64_t v32 = 373;
LABEL_22:

    _NUAssertFailHandler((uint64_t)"+[NUImageFactory bufferImageWithLayout:format:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", v32, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)v31);
  }
  if (!v8)
  {
    BOOL v22 = NUAssertLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "format != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v18 = NUAssertLogger();
    BOOL v25 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v25)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v41 = v33;
        __int16 v42 = 2114;
        v43 = v35;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      size_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v27;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v31 = "format != nil";
    uint64_t v32 = 374;
    goto LABEL_22;
  }
  uint64_t v10 = [_NUBufferImage alloc];
  uint64_t v11 = +[NUFactory sharedFactory];
  id v12 = [v11 bufferFactory];
  size_t v13 = [(_NUImage *)v10 initWithLayout:v7 format:v8 colorSpace:v9 tileFactory:v12];

  [(_NUImage *)v13 beginAccess];

  return v13;
}

+ (id)surfaceImageWithLayout:(id)a3 format:(id)a4 colorSpace:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    v15 = NUAssertLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      char v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "layout != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v18 = NUAssertLogger();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v41 = v28;
        __int16 v42 = 2114;
        v43 = v30;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      char v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v31 = "layout != nil";
    uint64_t v32 = 443;
LABEL_22:

    _NUAssertFailHandler((uint64_t)"+[NUImageFactory(Private) surfaceImageWithLayout:format:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", v32, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)v31);
  }
  if (!v8)
  {
    BOOL v22 = NUAssertLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "format != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    char v18 = NUAssertLogger();
    BOOL v25 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v25)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v41 = v33;
        __int16 v42 = 2114;
        v43 = v35;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      size_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v41 = v27;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v31 = "format != nil";
    uint64_t v32 = 444;
    goto LABEL_22;
  }
  uint64_t v10 = [_NUSurfaceImage alloc];
  uint64_t v11 = +[NUFactory sharedFactory];
  id v12 = [v11 surfaceFactory];
  size_t v13 = [(_NUImage *)v10 initWithLayout:v7 format:v8 colorSpace:v9 tileFactory:v12];

  [(_NUImage *)v13 beginAccess];

  return v13;
}

@end