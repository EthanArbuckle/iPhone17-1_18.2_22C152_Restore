@interface NUAspectFitScalePolicy
- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3;
- (NUAspectFitScalePolicy)initWithTargetPixelSize:(id)a3;
@end

@implementation NUAspectFitScalePolicy

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a3.var0 || (int64_t var1 = a3.var1) == 0)
  {
    v15 = NUAssertLogger_24625();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelSizeIsEmpty(imageSize)");
      *(_DWORD *)buf = 138543362;
      v32 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_24625();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        __int16 v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAspectFitScalePolicy scaleForImageSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScalePolicy.m", 137, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"!NUPixelSizeIsEmpty(imageSize)");
  }
  int64_t var0 = a3.var0;
  if (a3.var0 >= a3.var1)
  {
    int64_t width = self->super._size.width;
    int64_t height = self->super._size.height;
  }
  else
  {
    int64_t height = self->super._size.width;
    int64_t width = self->super._size.height;
    if ((height | width) < 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
      [v7 handleFailureInFunction:v8, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
    }
  }
  uint64_t v9 = NUScaleToFitSizeInSize(var0, var1, width, height);
  int64_t v11 = v10;
  uint64_t v12 = NUScaleCompare(v9, v10, NUScaleOne, *((uint64_t *)&NUScaleOne + 1));
  if (v12 >= 0) {
    int64_t v13 = *((void *)&NUScaleOne + 1);
  }
  else {
    int64_t v13 = v11;
  }
  if (v12 >= 0) {
    int64_t v14 = NUScaleOne;
  }
  else {
    int64_t v14 = v9;
  }
  result.int64_t var1 = v13;
  result.int64_t var0 = v14;
  return result;
}

- (NUAspectFitScalePolicy)initWithTargetPixelSize:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  if (a3.var0 >= a3.var1)
  {
    int64_t var1 = a3.var0;
    int64_t var0 = a3.var1;
  }
  else if ((a3.var1 | a3.var0) < 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    [v6 handleFailureInFunction:v7, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)NUAspectFitScalePolicy;
  return -[NUFitScalePolicy initWithTargetPixelSize:](&v9, sel_initWithTargetPixelSize_, var1, var0);
}

@end