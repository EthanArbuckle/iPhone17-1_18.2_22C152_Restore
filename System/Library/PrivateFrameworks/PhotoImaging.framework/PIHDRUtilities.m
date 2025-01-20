@interface PIHDRUtilities
+ (BOOL)_renderImage:(id)a3 toPixelBuffer:(__CVBuffer *)a4;
+ (__CVBuffer)_newHLGPixelBufferOfSize:(CGSize)a3;
+ (__CVBuffer)newHLGPixelBufferFromSDRImage:(CGImage *)a3;
+ (void)recycleHLGPixelBuffer:(__CVBuffer *)a3;
@end

@implementation PIHDRUtilities

+ (void)recycleHLGPixelBuffer:(__CVBuffer *)a3
{
}

+ (__CVBuffer)_newHLGPixelBufferOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v19[2] = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v5 = *MEMORY[0x1E4F24D20];
  v18[0] = *MEMORY[0x1E4F24D40];
  v18[1] = v5;
  v19[0] = MEMORY[0x1E4F1CC38];
  v19[1] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  uint64_t v7 = *MEMORY[0x1E4F24AA8];
  uint64_t v8 = *MEMORY[0x1E4F24BC8];
  v16[0] = *MEMORY[0x1E4F24A90];
  v16[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F24BD8];
  v17[0] = v7;
  v17[1] = v9;
  v16[2] = *MEMORY[0x1E4F24C18];
  v17[2] = *MEMORY[0x1E4F24C30];
  CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  if (CVPixelBufferCreate(0, (unint64_t)width, (unint64_t)height, 0x78343230u, v6, &pixelBufferOut)) {
    NSLog(&cfstr_FailedToAlloca_2.isa);
  }
  CVBufferSetAttachments(pixelBufferOut, v10, kCVAttachmentMode_ShouldPropagate);
  uint64_t v15 = 0x4240133DA0E92F00;
  v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v15 length:8];
  CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F1ED30], v11, kCVAttachmentMode_ShouldPropagate);

  v12 = pixelBufferOut;
  return v12;
}

+ (BOOL)_renderImage:(id)a3 toPixelBuffer:(__CVBuffer *)a4
{
  id v5 = a3;
  if (a4)
  {
    CFDictionaryRef v6 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithPixelBuffer:a4];
    uint64_t v7 = [MEMORY[0x1E4F1E018] context];
    id v16 = 0;
    uint64_t v8 = [v7 startTaskToRender:v5 toDestination:v6 error:&v16];
    id v9 = v16;

    id v15 = v9;
    CFDictionaryRef v10 = [v8 waitUntilCompletedAndReturnError:&v15];
    id v11 = v15;

    if (v8) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    BOOL v13 = !v12;
    if (v12) {
      NSLog(&cfstr_FailedToStartR.isa, v5, v6, v11);
    }
    else {
      NSLog(&cfstr_SuccesfullyRen.isa, v10);
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (__CVBuffer)newHLGPixelBufferFromSDRImage:(CGImage *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    CFDictionaryRef v10 = NUAssertLogger_27183();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v14 = NUAssertLogger_27183();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        __int16 v25 = 2114;
        v26 = v22;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v4 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCGImage:");
  id v5 = [v4 imageByApplyingFilter:@"PIHDRInverseHLGFilter"];
  [v5 extent];
  uint64_t v8 = (__CVBuffer *)objc_msgSend(a1, "_newHLGPixelBufferOfSize:", v6, v7);
  if (([a1 _renderImage:v5 toPixelBuffer:v8] & 1) == 0)
  {
    [a1 recycleHLGPixelBuffer:v8];
    uint64_t v8 = 0;
  }

  return v8;
}

@end