@interface PIImageIO
+ (BOOL)writeCGImage:(CGImage *)a3 fileURL:(id)a4;
+ (BOOL)writeCGImage:(CGImage *)a3 fileURL:(id)a4 options:(id)a5;
+ (BOOL)writeImage:(id)a3 fileURL:(id)a4;
+ (id)writeImage:(id)a3 toDirectoryAtPath:(id)a4 withBasename:(id)a5;
+ (id)writeImage:(id)a3 toTemporaryDirectoryWithBasename:(id)a4;
@end

@implementation PIImageIO

+ (id)writeImage:(id)a3 toDirectoryAtPath:(id)a4 withBasename:(id)a5
{
  v7 = NSString;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = getpid();
  uint64_t v12 = writeImage_toDirectoryAtPath_withBasename__count++;
  v13 = [v7 stringWithFormat:@"%@-%d-%ld.tiff", v8, v11, v12];

  v14 = [v9 stringByAppendingPathComponent:v13];

  v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
  LODWORD(v13) = +[PIImageIO writeImage:v10 fileURL:v15];

  if (v13) {
    v16 = v14;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  return v17;
}

+ (id)writeImage:(id)a3 toTemporaryDirectoryWithBasename:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = NSTemporaryDirectory();
  id v9 = [a1 writeImage:v7 toDirectoryAtPath:v8 withBasename:v6];

  return v9;
}

+ (BOOL)writeCGImage:(CGImage *)a3 fileURL:(id)a4 options:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  CFDictionaryRef v8 = (const __CFDictionary *)a5;
  if (!a3)
  {
    id v17 = NUAssertLogger_25467();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "cgImage != NULL");
      v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v21 = NUAssertLogger_25467();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v30 = dispatch_get_specific(*v19);
        v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        v19 = [v31 callStackSymbols];
        v33 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v40 = (const void **)v30;
        __int16 v41 = 2114;
        v42 = v33;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v40 = v19;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v27 = _NUAssertFailHandler();
    goto LABEL_21;
  }
  if (!v7)
  {
    v24 = NUAssertLogger_25467();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileURL != nil");
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = (const void **)MEMORY[0x1E4F7A308];
    v26 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v21 = NUAssertLogger_25467();
    int v27 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        v28 = [MEMORY[0x1E4F29060] callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v40 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_23;
    }
LABEL_21:
    if (v27)
    {
      v34 = dispatch_get_specific(*v19);
      v35 = (void *)MEMORY[0x1E4F29060];
      id v36 = v34;
      v37 = [v35 callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v40 = (const void **)v34;
      __int16 v41 = 2114;
      v42 = v38;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_23:

    _NUAssertFailHandler();
  }
  CFDictionaryRef v9 = v8;
  id v10 = [v7 pathExtension];
  CFStringRef v11 = (const __CFString *)NUFileTypeFromExtension();
  uint64_t v12 = CGImageDestinationCreateWithURL((CFURLRef)v7, v11, 1uLL, 0);

  if (v12 && (CGImageDestinationAddImage(v12, a3, v9), BOOL v13 = CGImageDestinationFinalize(v12), CFRelease(v12), v13))
  {
    v14 = [v7 path];
    NSLog(&cfstr_SuccessfullyWr.isa, v14);
    BOOL v15 = 1;
  }
  else
  {
    v14 = [v7 path];
    NSLog(&cfstr_FailedToWriteI.isa, v14);
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)writeCGImage:(CGImage *)a3 fileURL:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!a3)
  {
    BOOL v13 = NUAssertLogger_25467();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "cgImage != NULL");
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v17 = NUAssertLogger_25467();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v26 = dispatch_get_specific(*v15);
        int v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        BOOL v15 = [v27 callStackSymbols];
        v29 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = (const void **)v26;
        __int16 v51 = 2114;
        v52 = v29;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v15 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v15;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v23 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  id v6 = v5;
  if (!v5)
  {
    v20 = NUAssertLogger_25467();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileURL != nil");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v15 = (const void **)MEMORY[0x1E4F7A308];
    BOOL v22 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v17 = NUAssertLogger_25467();
    int v23 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v50 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_25;
    }
LABEL_23:
    if (v23)
    {
      v30 = dispatch_get_specific(*v15);
      v31 = (void *)MEMORY[0x1E4F29060];
      id v32 = v30;
      v33 = [v31 callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v50 = (const void **)v30;
      __int16 v51 = 2114;
      v52 = v34;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_25:

    _NUAssertFailHandler();
  }
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  switch(BitsPerComponent)
  {
    case 0x20uLL:
      CFDictionaryRef v8 = [MEMORY[0x1E4F7A5D8] RGBAf];
      goto LABEL_9;
    case 0x10uLL:
      CFDictionaryRef v8 = [MEMORY[0x1E4F7A5D8] RGBA16];
      goto LABEL_9;
    case 8uLL:
      CFDictionaryRef v8 = [MEMORY[0x1E4F7A5D8] BGRA8];
LABEL_9:
      CFDictionaryRef v9 = v8;
      id v10 = optionsForFormat(v8);
      BOOL v11 = +[PIImageIO writeCGImage:a3 fileURL:v6 options:v10];

      return v11;
  }
  v35 = NUAssertLogger_25467();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unhandled bit depth: %ld", CGImageGetBitsPerComponent(a3));
    id v36 = (const void **)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v50 = v36;
    _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  v37 = (const void **)MEMORY[0x1E4F7A308];
  v38 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  v39 = NUAssertLogger_25467();
  BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
  if (v38)
  {
    if (v40)
    {
      uint64_t v43 = dispatch_get_specific(*v37);
      v44 = (void *)MEMORY[0x1E4F29060];
      id v45 = v43;
      v46 = [v44 callStackSymbols];
      v47 = [v46 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v50 = (const void **)v43;
      __int16 v51 = 2114;
      v52 = v47;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v40)
  {
    __int16 v41 = [MEMORY[0x1E4F29060] callStackSymbols];
    v42 = [v41 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v50 = v42;
    _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  CGImageGetBitsPerComponent(a3);
  v48 = (void *)_NUAssertFailHandler();
  return optionsForFormat(v48);
}

+ (BOOL)writeImage:(id)a3 fileURL:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v14 = NUAssertLogger_25467();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)buf = 138543362;
      id v28 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v18 = NUAssertLogger_25467();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        BOOL v22 = dispatch_get_specific(*v16);
        int v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v28 = v22;
        __int16 v29 = 2114;
        v30 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v28 = v21;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v7 = v6;
  CFDictionaryRef v8 = [v5 format];
  CFDictionaryRef v9 = optionsForFormat(v8);
  uint64_t v10 = [MEMORY[0x1E4F7A500] newCGImageFromBufferImage:v5];
  if (v10)
  {
    BOOL v11 = (CGImage *)v10;
    BOOL v12 = +[PIImageIO writeCGImage:v10 fileURL:v7 options:v9];
    CGImageRelease(v11);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

@end