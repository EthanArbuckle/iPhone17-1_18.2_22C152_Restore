@interface PICoreImageUtilities
+ (id)framedRectImageWithCGRect:(CGRect)a3 color:(id)a4 borderWidth:(double)a5;
+ (id)loadFilterWithName:(id)a3;
+ (id)metalKernelWithFunctionName:(id)a3 error:(id *)a4;
+ (id)metalLibraryData;
@end

@implementation PICoreImageUtilities

+ (id)loadFilterWithName:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1E040] filterWithName:v3];
  if (!v4)
  {
    v4 = [MEMORY[0x1E4F1E040] filterWithName:v3];
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v6 = 138412290;
        id v7 = v3;
        _os_log_error_impl(&dword_1A9680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to load filter named '%@'", (uint8_t *)&v6, 0xCu);
      }
      v4 = 0;
    }
  }

  return v4;
}

+ (id)framedRectImageWithCGRect:(CGRect)a3 color:(id)a4 borderWidth:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = (void *)MEMORY[0x1E4F1E040];
  id v11 = a4;
  v12 = [v10 roundedRectangleGeneratorFilter];
  objc_msgSend(v12, "setExtent:", x, y, width, height);
  [v12 setColor:v11];

  v13 = [MEMORY[0x1E4F1E040] roundedRectangleGeneratorFilter];
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  CGRect v22 = CGRectInset(v21, a5, a5);
  objc_msgSend(v13, "setExtent:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  v14 = [MEMORY[0x1E4F1E008] blackColor];
  [v13 setColor:v14];

  v15 = [MEMORY[0x1E4F1E040] sourceOutCompositingFilter];
  v16 = [v12 outputImage];
  [v15 setInputImage:v16];

  v17 = [v13 outputImage];
  [v15 setBackgroundImage:v17];

  v18 = [v15 outputImage];

  return v18;
}

+ (id)metalKernelWithFunctionName:(id)a3 error:(id *)a4
{
  int v6 = (void *)MEMORY[0x1E4F1E058];
  id v7 = a3;
  uint64_t v8 = [a1 metalLibraryData];
  v9 = [v6 kernelWithFunctionName:v7 fromMetalLibraryData:v8 error:a4];

  return v9;
}

+ (id)metalLibraryData
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PICoreImageUtilities_metalLibraryData__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (metalLibraryData_onceToken != -1) {
    dispatch_once(&metalLibraryData_onceToken, block);
  }
  v2 = (void *)metalLibraryData_metalLibraryData;
  return v2;
}

void __40__PICoreImageUtilities_metalLibraryData__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v1 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  v2 = [v1 URLForResource:@"default" withExtension:@"metallib"];
  id v19 = 0;
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v2 options:1 error:&v19];
  id v4 = v19;
  v5 = (void *)metalLibraryData_metalLibraryData;
  metalLibraryData_metalLibraryData = v3;

  if (!metalLibraryData_metalLibraryData)
  {
    int v6 = NUAssertLogger_12955();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithFormat:@"Failed to load metal lib data: %@", v4];
      *(_DWORD *)buf = 138543362;
      CGRect v21 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v10 = NUAssertLogger_12955();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        CGRect v21 = v14;
        __int16 v22 = 2114;
        v23 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      CGRect v21 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
}

@end