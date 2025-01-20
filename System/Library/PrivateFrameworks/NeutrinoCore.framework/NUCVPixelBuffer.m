@interface NUCVPixelBuffer
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (NUCVPixelBuffer)init;
- (NUCVPixelBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3;
- (NUColorSpace)colorSpace;
- (NUPixelFormat)format;
- (__CVBuffer)CVPixelBuffer;
- (id)CIImageProcessorDigestObject;
- (id)debugQuickLookObject;
- (void)dealloc;
@end

@implementation NUCVPixelBuffer

- (__CVBuffer)CVPixelBuffer
{
  return self->_buffer;
}

- (id)CIImageProcessorDigestObject
{
  v3 = objc_alloc_init(NUDigest);
  [(NUDigest *)v3 addBytes:&self->_buffer length:8];
  v4 = [(NUDigest *)v3 stringValue];

  return v4;
}

- (NUColorSpace)colorSpace
{
  CGColorSpaceRef ColorSpace = CVImageBufferGetColorSpace(self->_buffer);
  if (ColorSpace)
  {
    v4 = [[NUColorSpace alloc] initWithCGColorSpace:ColorSpace];
  }
  else
  {
    CFDictionaryRef v5 = CVBufferCopyAttachments(self->_buffer, kCVAttachmentMode_ShouldPropagate);
    v4 = +[NUColorSpace colorSpaceFromVideoColorProperties:v5];
  }

  return v4;
}

- (NUPixelFormat)format
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(self->_buffer);

  return (NUPixelFormat *)+[NUPixelFormat pixelFormatForCVPixelFormat:PixelFormatType];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  size_t Width = CVPixelBufferGetWidth(self->_buffer);
  size_t Height = CVPixelBufferGetHeight(self->_buffer);
  int64_t v5 = Width;
  result.var1 = Height;
  result.var0 = v5;
  return result;
}

- (id)debugQuickLookObject
{
  return (id)[MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:self->_buffer];
}

- (void)dealloc
{
  CFRelease(self->_buffer);
  v3.receiver = self;
  v3.super_class = (Class)NUCVPixelBuffer;
  [(NUCVPixelBuffer *)&v3 dealloc];
}

- (NUCVPixelBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v6 = NUAssertLogger_23595();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pixelBuffer != NULL");
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v9 = NUAssertLogger_23595();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        __int16 v25 = 2114;
        v26 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCVPixelBuffer initWithCVPixelBuffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUCVPixelBuffer.m", 26, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"pixelBuffer != NULL");
  }
  v22.receiver = self;
  v22.super_class = (Class)NUCVPixelBuffer;
  v4 = [(NUCVPixelBuffer *)&v22 init];
  v4->_buffer = a3;
  CFRetain(a3);
  return v4;
}

- (NUCVPixelBuffer)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23610);
  }
  objc_super v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    int64_t v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_23610);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23610);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    id v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  objc_super v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCVPixelBuffer init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUCVPixelBuffer.m", 21, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end