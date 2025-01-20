@interface NUIOSurface
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (BOOL)isPurged;
- (BOOL)makeNonPurgeable;
- (BOOL)read:(id)a3;
- (BOOL)write:(id)a3;
- (CGColorSpace)colorSpace;
- (IOSurface)IOSurface;
- (NSString)name;
- (NUIOSurface)init;
- (NUIOSurface)initWithIOSurface:(__IOSurface *)a3;
- (NUIOSurface)initWithSize:(id)a3 format:(id)a4;
- (NUPixelFormat)format;
- (__CVBuffer)pixelBuffer;
- (__IOSurface)IOSurfaceRef;
- (id)_newTextureForDevice:(id)a3;
- (id)_purgeStateDescription;
- (id)debugQuickLookObject;
- (id)description;
- (id)newRenderDestination;
- (id)textureForDevice:(id)a3;
- (int)_fetchPurgeState:(unsigned int *)a3;
- (int64_t)rowBytes;
- (int64_t)sizeInBytes;
- (unsigned)_purgeLevelToOSValue:(int64_t)a3;
- (void)_allocateSurface;
- (void)dealloc;
- (void)debugDump:(id)a3;
- (void)invalidatePixelBuffer;
- (void)makePurgeable:(int64_t)a3;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setName:(id)a3;
@end

@implementation NUIOSurface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);

  objc_storeStrong((id *)&self->_textures, 0);
}

- (__IOSurface)IOSurfaceRef
{
  return self->_IOSurfaceRef;
}

- (NUPixelFormat)format
{
  return self->_format;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height = self->_size.height;
  int64_t width = self->_size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)debugDump:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2FDE0]];
  uint64_t v6 = CGImageCreateFromIOSurface();
  if (v6)
  {
    v7 = (CGImage *)v6;
    v8 = +[NUGlobalSettings tempDir];
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

    v10 = [v4 stringByAppendingPathExtension:@"tiff"];
    v11 = [v8 stringByAppendingPathComponent:v10];

    CFURLRef v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
    v13 = [(id)*MEMORY[0x1E4F444E0] identifier];
    v14 = CGImageDestinationCreateWithURL(v12, v13, 1uLL, 0);

    CGImageDestinationAddImage(v14, v7, 0);
    if (CGImageDestinationFinalize(v14))
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_152_12580);
      }
      uint64_t v15 = _NULogger;
      if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v21 = 138412546;
      v22 = self;
      __int16 v23 = 2112;
      v24 = v11;
      v16 = "Dumped IOSurface: %@ to: %@";
      v17 = v15;
      uint32_t v18 = 22;
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_152_12580);
      }
      uint64_t v20 = _NULogger;
      if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      int v21 = 138412290;
      v22 = self;
      v16 = "Failed to dump IOSurface: %@";
      v17 = v20;
      uint32_t v18 = 12;
    }
    _os_log_impl(&dword_1A9892000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
LABEL_16:
    CFRelease(v14);
    CFRelease(v7);

    goto LABEL_17;
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_152_12580);
  }
  v19 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    v22 = self;
    _os_log_impl(&dword_1A9892000, v19, OS_LOG_TYPE_DEFAULT, "Failed to create CGImage from IOSurface: %@", (uint8_t *)&v21, 0xCu);
  }
LABEL_17:
}

- (void)invalidatePixelBuffer
{
  obj = self;
  objc_sync_enter(obj);
  CVPixelBufferRelease(obj->_pixelBuffer);
  obj->_pixelBuffer = 0;
  objc_sync_exit(obj);
}

- (__CVBuffer)pixelBuffer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  CVPixelBufferRef pixelBufferOut = v2->_pixelBuffer;
  v3 = pixelBufferOut;
  objc_sync_exit(v2);

  if (!pixelBufferOut)
  {
    if (CVPixelBufferCreateWithIOSurface(0, v2->_IOSurfaceRef, 0, &pixelBufferOut))
    {
      uint64_t v6 = NUAssertLogger_12593();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = [NSString stringWithFormat:@"Failed to create pixel buffer from IOSUrface"];
        *(_DWORD *)buf = 138543362;
        v26 = v7;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v9 = NUAssertLogger_12593();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v10)
        {
          v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v14 = (void *)MEMORY[0x1E4F29060];
          id v15 = v13;
          v16 = [v14 callStackSymbols];
          uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v26 = v13;
          __int16 v27 = 2114;
          uint64_t v28 = v17;
          uint32_t v18 = (void *)v17;
          _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v10)
      {
        v11 = [MEMORY[0x1E4F29060] callStackSymbols];
        CFURLRef v12 = [v11 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v26 = v12;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUIOSurface pixelBuffer]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 369, @"Failed to create pixel buffer from IOSUrface", v19, v20, v21, v22, v23);
    }
    id v4 = v2;
    objc_sync_enter(v4);
    CVPixelBufferRelease(v2->_pixelBuffer);
    v2->_pixelBuffer = pixelBufferOut;
    objc_sync_exit(v4);

    return pixelBufferOut;
  }
  return v3;
}

- (id)_newTextureForDevice:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F35330];
  format = self->_format;
  id v6 = a3;
  v7 = objc_msgSend(v4, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[NUPixelFormat metalFormat](format, "metalFormat"), self->_size.width, self->_size.height, 0);
  [v7 setUsage:3];
  v8 = objc_msgSend(v6, "newTextureWithDescriptor:iosurface:plane:", v7, -[NUIOSurface IOSurfaceRef](self, "IOSurfaceRef"), 0);

  return v8;
}

- (id)textureForDevice:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v16 = NUAssertLogger_12593();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "device != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v19 = NUAssertLogger_12593();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        __int16 v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        __int16 v34 = 2114;
        v35 = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface textureForDevice:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 334, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"device != nil");
  }
  id v5 = v4;
  id v6 = self;
  objc_sync_enter(v6);
  textures = v6->_textures;
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "registryID"));
  id v9 = [(NSMutableDictionary *)textures objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  if (!v9)
  {
    id v9 = [(NUIOSurface *)v6 _newTextureForDevice:v5];
    BOOL v10 = v6;
    objc_sync_enter(v10);
    v11 = v6->_textures;
    if (!v11)
    {
      CFURLRef v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v13 = v6->_textures;
      v6->_textures = v12;

      v11 = v6->_textures;
    }
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "registryID"));
    [(NSMutableDictionary *)v11 setObject:v9 forKeyedSubscript:v14];

    objc_sync_exit(v10);
  }

  return v9;
}

- (id)newRenderDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F1E070]);
  id v4 = [(NUIOSurface *)self IOSurface];
  id v5 = (void *)[v3 initWithIOSurface:v4];

  [v5 setLabel:@"NUIOSurface-new"];
  return v5;
}

- (BOOL)write:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v52 = NUAssertLogger_12593();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      v69 = v53;
      _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v55 = NUAssertLogger_12593();
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
        v69 = v59;
        __int16 v70 = 2114;
        v71 = v63;
        _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v56)
    {
      v57 = [MEMORY[0x1E4F29060] callStackSymbols];
      v58 = [v57 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v58;
      _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface write:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 298, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"block != nil");
  }
  id v5 = (void (**)(void, void))v4;
  BOOL v6 = 0;
  if (IOSurfaceLock(self->_IOSurfaceRef, 0, 0)) {
    goto LABEL_32;
  }
  BaseAddress = IOSurfaceGetBaseAddress(self->_IOSurfaceRef);
  BOOL v6 = BaseAddress != 0;
  if (BaseAddress)
  {
    v8 = -[NUMutableBufferAdapter initWithSize:format:rowBytes:mutableBytes:]([NUMutableBufferAdapter alloc], "initWithSize:format:rowBytes:mutableBytes:", self->_size.width, self->_size.height, self->_format, IOSurfaceGetBytesPerRow(self->_IOSurfaceRef), BaseAddress);
    ((void (**)(void, NUMutableBufferAdapter *))v5)[2](v5, v8);
    [(NUBufferAdapter *)v8 invalidate];

    goto LABEL_18;
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
  }
  id v9 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = NSString;
    v11 = v9;
    CFURLRef v12 = [v10 stringWithFormat:@"Invalid surface data: %@", self];
    *(_DWORD *)buf = 138543362;
    v69 = v12;
    _os_log_impl(&dword_1A9892000, v11, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

    uint64_t v13 = _NULogOnceToken;
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
      }
LABEL_12:
      v14 = (void *)_NUAssertLogger;
      if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        uint64_t v22 = v14;
        uint64_t v23 = [v20 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = v19;
        __int16 v70 = 2114;
        v71 = v24;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_36:
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    if (v13 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
    }
  }
  else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    goto LABEL_12;
  }
  id v25 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v49 = (void *)MEMORY[0x1E4F29060];
    uint64_t v22 = v25;
    v50 = [v49 callStackSymbols];
    v51 = [v50 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v69 = v51;
    _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_36;
  }
LABEL_17:
  _NUAssertContinueHandler((uint64_t)"-[NUIOSurface write:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 308, @"Invalid surface data: %@", v15, v16, v17, v18, (uint64_t)self);
LABEL_18:
  uint64_t v26 = IOSurfaceUnlock(self->_IOSurfaceRef, 0, 0);
  if (v26)
  {
    uint64_t v27 = v26;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
    }
    uint64_t v28 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = NSString;
      uint64_t v30 = v28;
      uint64_t v31 = [v29 stringWithFormat:@"%@ failed to unlock: %d", self, v27];
      *(_DWORD *)buf = 138543362;
      v69 = v31;
      _os_log_impl(&dword_1A9892000, v30, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v32 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v32 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
        }
LABEL_26:
        v33 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v39 = (void *)MEMORY[0x1E4F29060];
          id v40 = v38;
          v41 = v33;
          v42 = [v39 callStackSymbols];
          v43 = [v42 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v69 = v38;
          __int16 v70 = 2114;
          v71 = v43;
          _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_34:
          goto LABEL_31;
        }
        goto LABEL_31;
      }
      if (v32 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_26;
    }
    v44 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v46 = (void *)MEMORY[0x1E4F29060];
      v41 = v44;
      v47 = [v46 callStackSymbols];
      v48 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v48;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_34;
    }
LABEL_31:
    _NUAssertContinueHandler((uint64_t)"-[NUIOSurface write:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 318, @"%@ failed to unlock: %d", v34, v35, v36, v37, (uint64_t)self);
  }
LABEL_32:

  return v6;
}

- (BOOL)read:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v52 = NUAssertLogger_12593();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      v69 = v53;
      _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v55 = NUAssertLogger_12593();
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
        v69 = v59;
        __int16 v70 = 2114;
        v71 = v63;
        _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v56)
    {
      v57 = [MEMORY[0x1E4F29060] callStackSymbols];
      v58 = [v57 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v58;
      _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface read:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 270, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"block != nil");
  }
  id v5 = (void (**)(void, void))v4;
  if (!IOSurfaceLock(self->_IOSurfaceRef, 1u, 0))
  {
    BaseAddress = IOSurfaceGetBaseAddress(self->_IOSurfaceRef);
    BOOL v6 = BaseAddress != 0;
    if (BaseAddress)
    {
      v8 = -[NUBufferAdapter initWithSize:format:rowBytes:bytes:]([NUBufferAdapter alloc], "initWithSize:format:rowBytes:bytes:", self->_size.width, self->_size.height, self->_format, IOSurfaceGetBytesPerRow(self->_IOSurfaceRef), BaseAddress);
      ((void (**)(void, NUBufferAdapter *))v5)[2](v5, v8);
      [(NUBufferAdapter *)v8 invalidate];

      goto LABEL_19;
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
    }
    id v9 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = NSString;
      v11 = v9;
      CFURLRef v12 = [v10 stringWithFormat:@"Invalid surface data: %@", self];
      *(_DWORD *)buf = 138543362;
      v69 = v12;
      _os_log_impl(&dword_1A9892000, v11, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v13 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v13 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
        }
LABEL_13:
        v14 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          BOOL v20 = (void *)MEMORY[0x1E4F29060];
          id v21 = v19;
          uint64_t v22 = v14;
          uint64_t v23 = [v20 callStackSymbols];
          v24 = [v23 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v69 = v19;
          __int16 v70 = 2114;
          v71 = v24;
          _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_37:
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v13 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_13;
    }
    id v25 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v49 = (void *)MEMORY[0x1E4F29060];
      uint64_t v22 = v25;
      v50 = [v49 callStackSymbols];
      v51 = [v50 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v51;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_37;
    }
LABEL_18:
    _NUAssertContinueHandler((uint64_t)"-[NUIOSurface read:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 280, @"Invalid surface data: %@", v15, v16, v17, v18, (uint64_t)self);
LABEL_19:
    uint64_t v26 = IOSurfaceUnlock(self->_IOSurfaceRef, 1u, 0);
    if (!v26) {
      goto LABEL_33;
    }
    uint64_t v27 = v26;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
    }
    uint64_t v28 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = NSString;
      uint64_t v30 = v28;
      uint64_t v31 = [v29 stringWithFormat:@"%@ failed to unlock: %d", self, v27];
      *(_DWORD *)buf = 138543362;
      v69 = v31;
      _os_log_impl(&dword_1A9892000, v30, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v32 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v32 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
        }
LABEL_27:
        v33 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v39 = (void *)MEMORY[0x1E4F29060];
          id v40 = v38;
          v41 = v33;
          v42 = [v39 callStackSymbols];
          v43 = [v42 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v69 = v38;
          __int16 v70 = 2114;
          v71 = v43;
          _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_35:
          goto LABEL_32;
        }
        goto LABEL_32;
      }
      if (v32 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_27;
    }
    v44 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v46 = (void *)MEMORY[0x1E4F29060];
      v41 = v44;
      v47 = [v46 callStackSymbols];
      v48 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v48;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_35;
    }
LABEL_32:
    _NUAssertContinueHandler((uint64_t)"-[NUIOSurface read:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 290, @"%@ failed to unlock: %d", v34, v35, v36, v37, (uint64_t)self);
    goto LABEL_33;
  }
  BOOL v6 = 0;
LABEL_33:

  return v6;
}

- (id)debugQuickLookObject
{
  return (id)[MEMORY[0x1E4F1E050] imageWithIOSurface:self->_IOSurfaceRef];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size = self->_size;
  format = self->_format;
  BOOL v6 = [(NUIOSurface *)self colorSpace];
  v7 = [(NUIOSurface *)self _purgeStateDescription];
  v8 = [v3 stringWithFormat:@"<%@:%p size:%dx%d format:%@ colorSpace:%@ purgeable:%@>", v4, self, size, format, v6, v7];

  return v8;
}

- (unsigned)_purgeLevelToOSValue:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 33;
  }
  else {
    return dword_1A9A72EE0[a3 - 1];
  }
}

- (id)_purgeStateDescription
{
  unsigned int v3 = 0;
  if ([(NUIOSurface *)self _fetchPurgeState:&v3]) {
    return @"Purgeable (Error)";
  }
  if (v3 > 2) {
    return @"Purgeable (Unknown)";
  }
  return off_1E5D94988[v3];
}

- (int)_fetchPurgeState:(unsigned int *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = IOSurfaceSetPurgeable(self->_IOSurfaceRef, 3u, a3);
  if (v4)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
    }
    id v5 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = NSString;
      v7 = v5;
      v8 = [v6 stringWithFormat:@"%@ failed to read purgeable: %d", self, v4];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v8;
      _os_log_impl(&dword_1A9892000, v7, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v9 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v9 != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
        }
LABEL_9:
        BOOL v10 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v16 = (void *)MEMORY[0x1E4F29060];
          id v17 = specific;
          uint64_t v18 = v10;
          uint64_t v19 = [v16 callStackSymbols];
          BOOL v20 = [v19 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v27 = specific;
          __int16 v28 = 2114;
          uint64_t v29 = v20;
          _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v9 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
      }
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    id v21 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F29060];
      uint64_t v18 = v21;
      v24 = [v23 callStackSymbols];
      id v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v25;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUIOSurface _fetchPurgeState:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 204, @"%@ failed to read purgeable: %d", v11, v12, v13, v14, (uint64_t)self);
  }
  return v4;
}

- (BOOL)isPurged
{
  int v4 = 0;
  return ![(NUIOSurface *)self _fetchPurgeState:&v4] && v4 == 2;
}

- (BOOL)makeNonPurgeable
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint32_t oldState = 0;
  uint64_t v3 = IOSurfaceSetPurgeable(self->_IOSurfaceRef, 0, &oldState);
  if (v3)
  {
    uint64_t v5 = v3;
    BOOL v6 = NUAssertLogger_12593();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [NSString stringWithFormat:@"%@ failed to set non volatile state: %d", self, v5];
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v9 = NUAssertLogger_12593();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        uint64_t v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        id v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        __int16 v25 = 2114;
        uint64_t v26 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface makeNonPurgeable]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 183, @"%@ failed to set non volatile state: %d", v18, v19, v20, v21, (uint64_t)self);
  }
  return oldState != 2;
}

- (void)makePurgeable:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = IOSurfaceSetPurgeable(self->_IOSurfaceRef, [(NUIOSurface *)self _purgeLevelToOSValue:a3], 0);
  if (v4)
  {
    uint64_t v5 = v4;
    BOOL v6 = NUAssertLogger_12593();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [NSString stringWithFormat:@"%@ failed to set volatile state: %d", self, v5];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v9 = NUAssertLogger_12593();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        uint64_t v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        id v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v13;
        __int16 v24 = 2114;
        __int16 v25 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface makePurgeable:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 176, @"%@ failed to set volatile state: %d", v18, v19, v20, v21, (uint64_t)self);
  }
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  if (a3)
  {
    CFPropertyListRef v4 = CGColorSpaceCopyPropertyList(a3);
    if (v4)
    {
      uint64_t v5 = v4;
      IOSurfaceSetValue(self->_IOSurfaceRef, (CFStringRef)*MEMORY[0x1E4F2F068], v4);
      CFRelease(v5);
    }
  }
  else
  {
    IOSurfaceRef = self->_IOSurfaceRef;
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F2F068];
    IOSurfaceRemoveValue(IOSurfaceRef, v7);
  }
}

- (CGColorSpace)colorSpace
{
  $0AC6E346AE4835514AAA8AC86D8F4844 result = (CGColorSpace *)IOSurfaceCopyValue(self->_IOSurfaceRef, (CFStringRef)*MEMORY[0x1E4F2F068]);
  if (result)
  {
    uint64_t v3 = result;
    CGColorSpaceRef v4 = CGColorSpaceCreateWithPropertyList(result);
    uint64_t v5 = (CGColorSpace *)CFAutorelease(v4);
    CFRelease(v3);
    return v5;
  }
  return result;
}

- (void)setName:(id)a3
{
  id v4 = (id)[a3 copy];
  IOSurfaceSetValue(self->_IOSurfaceRef, (CFStringRef)*MEMORY[0x1E4F2F128], v4);
}

- (NSString)name
{
  v2 = (void *)IOSurfaceCopyValue(self->_IOSurfaceRef, (CFStringRef)*MEMORY[0x1E4F2F128]);
  uint64_t v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (int64_t)sizeInBytes
{
  return IOSurfaceGetAllocSize(self->_IOSurfaceRef);
}

- (int64_t)rowBytes
{
  return IOSurfaceGetBytesPerRow(self->_IOSurfaceRef);
}

- (void)dealloc
{
  IOSurfaceRef = self->_IOSurfaceRef;
  if (IOSurfaceRef) {
    CFRelease(IOSurfaceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)NUIOSurface;
  [(NUIOSurface *)&v4 dealloc];
}

- (void)_allocateSurface
{
  v77[5] = *MEMORY[0x1E4F143B8];
  if ([(NUPixelFormat *)self->_format isYCC])
  {
    uint64_t v3 = [(NUPixelFormat *)self->_format chromaSubsampling];
    int64_t width = self->_size.width;
    uint64_t v5 = (v3 + width - 1) / v3;
    int64_t v7 = (v6 + self->_size.height - 1) / v6;
    int64_t v48 = v7;
    int64_t v8 = +[NUImageUtilities alignedRowBytesForWidth:width bytesPerPixel:[(NUPixelFormat *)self->_format bytesPerLuma]];
    int64_t v9 = self->_size.height * v8;
    int64_t v44 = v9;
    int64_t v51 = +[NUImageUtilities alignedRowBytesForWidth:v5 bytesPerPixel:[(NUPixelFormat *)self->_format bytesPerChroma]];
    int64_t v53 = v51 * v7;
    v76[0] = *MEMORY[0x1E4F2F2C0];
    uint64_t v59 = [NSNumber numberWithInteger:self->_size.width];
    v77[0] = v59;
    v76[1] = *MEMORY[0x1E4F2F0E8];
    uint64_t v57 = [NSNumber numberWithInteger:self->_size.height];
    v77[1] = v57;
    v76[2] = *MEMORY[0x1E4F2F150];
    uint64_t v47 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NUPixelFormat CVPixelFormat](self->_format, "CVPixelFormat"));
    v77[2] = v47;
    v76[3] = *MEMORY[0x1E4F2F238];
    uint64_t v68 = *MEMORY[0x1E4F2F258];
    uint64_t v10 = v68;
    uint64_t v55 = [NSNumber numberWithInteger:self->_size.width];
    v74[0] = v55;
    uint64_t v69 = *MEMORY[0x1E4F2F220];
    uint64_t v11 = v69;
    v58 = [NSNumber numberWithInteger:self->_size.height];
    v74[1] = v58;
    uint64_t v70 = *MEMORY[0x1E4F2F170];
    uint64_t v12 = v70;
    BOOL v56 = objc_msgSend(NSNumber, "numberWithInteger:", -[NUPixelFormat bytesPerLuma](self->_format, "bytesPerLuma"));
    v74[2] = v56;
    uint64_t v71 = *MEMORY[0x1E4F2F178];
    uint64_t v13 = v71;
    v54 = [NSNumber numberWithInteger:v8];
    v74[3] = v54;
    uint64_t v72 = *MEMORY[0x1E4F2F248];
    uint64_t v14 = v72;
    v52 = [NSNumber numberWithInteger:v9];
    uint64_t v73 = *MEMORY[0x1E4F2F240];
    uint64_t v15 = v73;
    v74[4] = v52;
    v74[5] = &unk_1F0049D58;
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v68 count:6];
    v75[0] = v50;
    v66[0] = v10;
    v46 = [NSNumber numberWithInteger:v5];
    v67[0] = v46;
    v66[1] = v11;
    v49 = [NSNumber numberWithInteger:v48];
    v67[1] = v49;
    v66[2] = v12;
    v45 = objc_msgSend(NSNumber, "numberWithInteger:", -[NUPixelFormat bytesPerChroma](self->_format, "bytesPerChroma"));
    v67[2] = v45;
    v66[3] = v13;
    uint64_t v16 = [NSNumber numberWithInteger:v51];
    v67[3] = v16;
    v66[4] = v14;
    id v17 = [NSNumber numberWithInteger:v53];
    v67[4] = v17;
    v66[5] = v15;
    uint64_t v18 = (void *)v47;
    uint64_t v19 = [NSNumber numberWithInteger:v44];
    v67[5] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:6];
    v75[1] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
    v77[3] = v21;
    v76[4] = *MEMORY[0x1E4F2EFB8];
    uint64_t v22 = [NSNumber numberWithInteger:v53 + v44];
    v77[4] = v22;
    CFDictionaryRef v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:5];

    __int16 v24 = (void *)v57;
    __int16 v25 = (void *)v59;

    uint64_t v26 = (void *)v55;
  }
  else
  {
    v64[0] = *MEMORY[0x1E4F2F2C0];
    __int16 v25 = [NSNumber numberWithInteger:self->_size.width];
    v65[0] = v25;
    v64[1] = *MEMORY[0x1E4F2F0E8];
    __int16 v24 = [NSNumber numberWithInteger:self->_size.height];
    v65[1] = v24;
    v64[2] = *MEMORY[0x1E4F2F150];
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NUPixelFormat CVPixelFormat](self->_format, "CVPixelFormat"));
    v65[2] = v18;
    v64[3] = *MEMORY[0x1E4F2EFD8];
    uint64_t v26 = objc_msgSend(NSNumber, "numberWithInteger:", -[NUPixelFormat bytesPerPixel](self->_format, "bytesPerPixel"));
    v65[3] = v26;
    CFDictionaryRef v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:4];
  }

  uint64_t v27 = IOSurfaceCreate(v23);
  self->_IOSurfaceRef = v27;
  if (!v27)
  {
    __int16 v28 = NUAssertLogger_12593();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [NSString stringWithFormat:@"Failed to create IOSurface with properties: %@ and NUPixelFormat:%@", v23, self->_format];
      *(_DWORD *)buf = 138543362;
      id v61 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger_12593();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v61 = v35;
        __int16 v62 = 2114;
        v63 = v39;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v61 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface _allocateSurface]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 117, @"Failed to create IOSurface with properties: %@ and NUPixelFormat:%@", v40, v41, v42, v43, (uint64_t)v23);
  }
}

- (IOSurface)IOSurface
{
  return (IOSurface *)self->_IOSurfaceRef;
}

- (NUIOSurface)initWithIOSurface:(__IOSurface *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    int64_t v9 = NUAssertLogger_12593();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "surface != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_12593();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        uint64_t v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        uint64_t v19 = [v17 callStackSymbols];
        uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v16;
        __int16 v28 = 2114;
        uint64_t v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface initWithIOSurface:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 51, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"surface != NULL");
  }
  v25.receiver = self;
  v25.super_class = (Class)NUIOSurface;
  objc_super v4 = [(NUIOSurface *)&v25 init];
  uint64_t v5 = (__IOSurface *)CFRetain(a3);
  v4->_IOSurfaceRef = v5;
  v4->_size.int64_t width = IOSurfaceGetWidth(v5);
  v4->_size.int64_t height = IOSurfaceGetHeight(v4->_IOSurfaceRef);
  uint64_t v6 = +[NUPixelFormat pixelFormatForCVPixelFormat:IOSurfaceGetPixelFormat(v4->_IOSurfaceRef)];
  format = v4->_format;
  v4->_format = (NUPixelFormat *)v6;

  return v4;
}

- (NUIOSurface)initWithSize:(id)a3 format:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int64_t v7 = (NUPixelFormat *)a4;
  if (var0 < 1 || var1 <= 0)
  {
    uint64_t v12 = NUAssertLogger_12593();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "size.width > 0 && size.height > 0");
      *(_DWORD *)buf = 138543362;
      v46 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v15 = NUAssertLogger_12593();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        uint64_t v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v46 = v26;
        __int16 v47 = 2114;
        int64_t v48 = v30;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v46 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 36, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"size.width > 0 && size.height > 0");
  }
  int64_t v8 = v7;
  if (!v7)
  {
    uint64_t v19 = NUAssertLogger_12593();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "format != nil");
      *(_DWORD *)buf = 138543362;
      v46 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_12593();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v46 = v35;
        __int16 v47 = 2114;
        int64_t v48 = v39;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      objc_super v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v46 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUIOSurface initWithSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 37, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"format != nil");
  }
  v44.receiver = self;
  v44.super_class = (Class)NUIOSurface;
  int64_t v9 = [(NUIOSurface *)&v44 init];
  v9->_size.int64_t width = var0;
  v9->_size.int64_t height = var1;
  format = v9->_format;
  v9->_format = v8;

  [(NUIOSurface *)v9 _allocateSurface];
  return v9;
}

- (NUIOSurface)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
  }
  uint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    objc_super v4 = NSString;
    uint64_t v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    int64_t v7 = NSStringFromClass(v6);
    int64_t v8 = NSStringFromSelector(a2);
    int64_t v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12606);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29060];
    BOOL v13 = v11;
    uint64_t v14 = [v12 callStackSymbols];
    uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  BOOL v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  BOOL v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUIOSurface init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUIOSurface.m", 31, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end