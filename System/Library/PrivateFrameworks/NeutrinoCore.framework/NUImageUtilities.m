@interface NUImageUtilities
+ (int64_t)alignedRowBytesForWidth:(int64_t)a3 bytesPerPixel:(int64_t)a4;
+ (void)copyBuffer:(id)a3 rect:(id *)a4 toBuffer:(id)a5 atPoint:(id)a6;
+ (void)copyPixelsFromImage:(id)a3 atPoint:(id)a4 toBuffer:(id)a5;
+ (void)copyPixelsFromImage:(id)a3 rect:(id *)a4 destPtr:(void *)a5 destPtrRowBytes:(int64_t)a6;
+ (void)copyPixelsFromImage:(id)a3 srcRect:(id *)a4 destImage:(id)a5 destOrigin:(id)a6;
+ (void)copyPixelsFromSurfaceImage:(id)a3 atPoint:(id)a4 toBuffer:(id)a5;
+ (void)copyPixelsFromSurfaceImage:(id)a3 rect:(id *)a4 destPtr:(void *)a5 destPtrRowBytes:(int64_t)a6;
+ (void)copyPixelsToImage:(id)a3 atPoint:(id)a4 fromBuffer:(id)a5 inRect:(id *)a6;
+ (void)copyPixelsToImage:(id)a3 rect:(id *)a4 srcPtr:(const void *)a5 srcPtrRowBytes:(int64_t)a6;
+ (void)copySurfaceImage:(id)a3 toImage:(id)a4;
+ (void)copyTexture:(id)a3 fromRect:(id *)a4 toSurfaceImage:(id)a5 atPoint:(id)a6 withDevice:(id)a7;
+ (void)fillPixelsInBuffer:(id)a3 rect:(id *)a4 srcPixel:(const void *)a5;
+ (void)fillPixelsInImage:(id)a3 rect:(id *)a4 srcPixel:(const void *)a5;
+ (void)renderImage:(id)a3 toSurface:(id)a4 atPoint:(id)a5 withContext:(id)a6 andColorSpace:(id)a7;
@end

@implementation NUImageUtilities

+ (int64_t)alignedRowBytesForWidth:(int64_t)a3 bytesPerPixel:(int64_t)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    v18 = NUAssertLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "width > 0");
      *(_DWORD *)buf = 138543362;
      v48 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = [MEMORY[0x1E4F29060] callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v48 = v32;
        __int16 v49 = 2114;
        v50 = v34;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v48 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities alignedRowBytesForWidth:bytesPerPixel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 311, @"Invalid parameter not satisfying: %s", v35, v36, v37, v38, (uint64_t)"width > 0");
  }
  int64_t v4 = a3 * a4;
  if ((unsigned __int128)(a3 * (__int128)a4) >> 64 != (a3 * a4) >> 63)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    v6 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [NSString stringWithFormat:@"integer overflow detected"];
      *(_DWORD *)buf = 138543362;
      v48 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
      }
      v8 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = [MEMORY[0x1E4F29060] callStackSymbols];
        v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v48 = v11;
        __int16 v49 = 2114;
        v50 = v13;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
      }
      v8 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = [MEMORY[0x1E4F29060] callStackSymbols];
        v10 = [v9 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v48 = v10;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
    }

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities alignedRowBytesForWidth:bytesPerPixel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 317, @"integer overflow detected", v14, v15, v16, v17, v46);
  }
  int64_t result = (v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (result < v4)
  {
    v25 = NUAssertLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = [NSString stringWithFormat:@"integer overflow detected"];
      *(_DWORD *)buf = 138543362;
      v48 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = [MEMORY[0x1E4F29060] callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v48 = v39;
        __int16 v49 = 2114;
        v50 = v41;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v48 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities alignedRowBytesForWidth:bytesPerPixel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 324, @"integer overflow detected", v42, v43, v44, v45, v46);
  }
  return result;
}

+ (void)renderImage:(id)a3 toSurface:(id)a4 atPoint:(id)a5 withContext:(id)a6 andColorSpace:(id)a7
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!v12)
  {
    BOOL v22 = NUAssertLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v42 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v43 = [v42 componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543618;
        *(void *)((char *)&buf.origin.x + 4) = v41;
        WORD2(buf.origin.y) = 2114;
        *(void *)((char *)&buf.origin.y + 6) = v43;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v44 = "image != nil";
    uint64_t v45 = 286;
LABEL_29:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities renderImage:toSurface:atPoint:withContext:andColorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v45, @"Invalid parameter not satisfying: %s", v52, v53, v54, v55, (uint64_t)v44);
  }
  if (!v14)
  {
    BOOL v29 = NUAssertLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "context != nil");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger();
    BOOL v32 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v32)
      {
        uint64_t v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v47 = [MEMORY[0x1E4F29060] callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543618;
        *(void *)((char *)&buf.origin.x + 4) = v46;
        WORD2(buf.origin.y) = 2114;
        *(void *)((char *)&buf.origin.y + 6) = v48;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v34;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v44 = "context != nil";
    uint64_t v45 = 287;
    goto LABEL_29;
  }
  if (!v13)
  {
    uint64_t v35 = NUAssertLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "surface != nil");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger();
    BOOL v38 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v38)
      {
        __int16 v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v51 = [v50 componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543618;
        *(void *)((char *)&buf.origin.x + 4) = v49;
        WORD2(buf.origin.y) = 2114;
        *(void *)((char *)&buf.origin.y + 6) = v51;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v38)
    {
      v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      v40 = [v39 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v40;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v44 = "surface != nil";
    uint64_t v45 = 288;
    goto LABEL_29;
  }
  [v12 extent];
  buf.origin.x = v16;
  buf.origin.y = v17;
  buf.size.width = v18;
  buf.size.height = v19;
  NU::RectT<long>::RectT(v58, &buf, 0);
  long long v56 = v59;
  CGAffineTransformMakeTranslation(&v57, (double)(var0 - v58[0]), (double)(var1 - v58[1]));
  v20 = [v12 imageByApplyingTransform:&v57];

  v21 = [v20 imageByClampingToExtent];

  objc_msgSend(v14, "render:toIOSurface:bounds:colorSpace:", v21, objc_msgSend(v13, "IOSurfaceRef"), objc_msgSend(v15, "CGColorSpace"), (double)var0, (double)var1, (double)(uint64_t)v56, (double)*((uint64_t *)&v56 + 1));
}

+ (void)copyTexture:(id)a3 fromRect:(id *)a4 toSurfaceImage:(id)a5 atPoint:(id)a6 withDevice:(id)a7
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = v14;
  if (!v13)
  {
    v24 = NUAssertLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        __int16 v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v49;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v51;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      BOOL v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v52 = "image != nil";
    uint64_t v53 = 261;
LABEL_38:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyTexture:fromRect:toSurfaceImage:atPoint:withDevice:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v53, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)v52);
  }
  if (!v14)
  {
    v31 = NUAssertLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      BOOL v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "device != nil");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger();
    BOOL v34 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v34)
      {
        uint64_t v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v55 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v56 = [v55 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v54;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v56;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      uint64_t v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v52 = "device != nil";
    uint64_t v53 = 262;
    goto LABEL_38;
  }
  if (!v12)
  {
    uint64_t v37 = NUAssertLogger();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      BOOL v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "srcTexture != nil");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v38;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger();
    BOOL v40 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v39)
    {
      if (v40)
      {
        CGAffineTransform v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v57;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v59;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v40)
    {
      v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v42;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v52 = "srcTexture != nil";
    uint64_t v53 = 263;
    goto LABEL_38;
  }
  CGFloat v16 = [v12 device];
  CGFloat v17 = [v15 metalDevice];

  if (v16 != v17)
  {
    uint64_t v43 = NUAssertLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "srcTexture.device == device.metalDevice");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v44;
      _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger();
    BOOL v46 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v45)
    {
      if (v46)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v61 = [MEMORY[0x1E4F29060] callStackSymbols];
        v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v60;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v62;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v46)
    {
      v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      v48 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v48;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v52 = "srcTexture.device == device.metalDevice";
    uint64_t v53 = 264;
    goto LABEL_38;
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 v18 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)CGRect buf = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16] = v18;
  long long v79 = *(_OWORD *)buf;
  $0AC6E346AE4835514AAA8AC86D8F4844 v80 = v18;
  v77[0] = var0;
  v77[1] = var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v78 = v18;
  CGFloat v19 = [[NURegion alloc] initWithRect:v77];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __75__NUImageUtilities_copyTexture_fromRect_toSurfaceImage_atPoint_withDevice___block_invoke;
  v67[3] = &unk_1E5D94910;
  id v20 = v13;
  id v68 = v20;
  v69 = v19;
  id v21 = v15;
  id v70 = v21;
  int64_t v72 = var0;
  int64_t v73 = var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v74 = v80;
  long long v75 = *(_OWORD *)buf;
  long long v76 = *(_OWORD *)&buf[16];
  id v22 = v12;
  id v71 = v22;
  v23 = v19;
  [v21 executeMetal:v67];
}

void __75__NUImageUtilities_copyTexture_fromRect_toSurfaceImage_atPoint_withDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__NUImageUtilities_copyTexture_fromRect_toSurfaceImage_atPoint_withDevice___block_invoke_2;
  v10[3] = &unk_1E5D948E8;
  long long v7 = *(_OWORD *)(a1 + 80);
  long long v13 = *(_OWORD *)(a1 + 64);
  long long v14 = v7;
  long long v8 = *(_OWORD *)(a1 + 112);
  long long v15 = *(_OWORD *)(a1 + 96);
  long long v16 = v8;
  id v11 = *(id *)(a1 + 56);
  id v12 = v3;
  id v9 = v3;
  [v4 writeTextureRegion:v5 device:v6 withBlock:v10];
}

void __75__NUImageUtilities_copyTexture_fromRect_toSurfaceImage_atPoint_withDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = v3;
  long long v5 = 0uLL;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v6 = 0uLL;
  if (v3)
  {
    [v3 frameRect];
    long long v6 = v17;
    long long v5 = v18;
  }
  long long v7 = *(_OWORD *)(a1 + 64);
  v21[0] = *(_OWORD *)(a1 + 48);
  v21[1] = v7;
  v20[0] = v6;
  v20[1] = v5;
  NU::RectT<long>::Intersection((uint64_t)v19, (uint64_t *)v21, (uint64_t *)v20);
  int64x2_t v11 = v19[0];
  long long v8 = v17;
  uint64_t v9 = *(void *)(a1 + 32);
  int64x2_t v13 = vaddq_s64(vsubq_s64(v19[0], *(int64x2_t *)(a1 + 48)), *(int64x2_t *)(a1 + 80));
  uint64_t v14 = 0;
  int64x2_t v15 = v19[1];
  uint64_t v16 = 1;
  v10 = [v4 texture];
  v12[0] = v11.i64[0] - v8;
  v12[1] = v11.i64[1] - *((void *)&v8 + 1);
  v12[2] = 0;
  +[NUCopyKernel copyFromTexture:v9 region:&v13 toTexture:v10 atPoint:v12 withCommandBuffer:*(void *)(a1 + 40)];
}

+ (void)copySurfaceImage:(id)a3 toImage:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 size];
  uint64_t v10 = v9;
  if (v8 != [v7 size] || v10 != v11)
  {
    long long v17 = NUAssertLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUPixelSizeEqualToSize(surfaceImage.size, image.size)");
      *(_DWORD *)CGRect buf = 138543362;
      BOOL v40 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v20 = NUAssertLogger();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        BOOL v40 = v24;
        __int16 v41 = 2114;
        uint64_t v42 = v26;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      id v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      BOOL v40 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copySurfaceImage:toImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 250, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"NUPixelSizeEqualToSize(surfaceImage.size, image.size)");
  }
  uint64_t v12 = [v7 size];
  uint64_t v14 = v13;
  v38[0] = 0;
  v38[1] = 0;
  v38[2] = v12;
  v38[3] = v13;
  int64x2_t v15 = +[NURegion regionWithRect:v38];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __45__NUImageUtilities_copySurfaceImage_toImage___block_invoke;
  v31[3] = &unk_1E5D948C0;
  id v33 = a1;
  id v16 = v7;
  id v32 = v16;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = v12;
  uint64_t v37 = v14;
  [v6 readBufferRegion:v15 withBlock:v31];
}

void __45__NUImageUtilities_copySurfaceImage_toImage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v5 = *(void **)(a1 + 40);
  if (v3)
  {
    [v3 frameRect];
    uint64_t v8 = *((void *)&v12 + 1);
    uint64_t v7 = v12;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  uint64_t v9 = [v4 buffer];
  long long v10 = *(_OWORD *)(a1 + 64);
  v11[0] = *(_OWORD *)(a1 + 48);
  v11[1] = v10;
  objc_msgSend(v5, "copyPixelsToImage:atPoint:fromBuffer:inRect:", v6, v7, v8, v9, v11);
}

+ (void)copyPixelsFromImage:(id)a3 srcRect:(id *)a4 destImage:(id)a5 destOrigin:(id)a6
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  id v11 = a3;
  id v12 = a5;
  int64_t v13 = a4->var0.var0;
  int64_t v14 = a4->var0.var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v35 = a4->var1;
  int64x2_t v15 = [v12 layout];
  uint64_t v16 = [v15 imageSize];
  uint64_t v18 = v17;

  v33[0] = var0;
  v33[1] = var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v34 = v35;
  CGFloat v19 = +[NURegion regionWithRect:v33];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  _OWORD v21[2] = __69__NUImageUtilities_copyPixelsFromImage_srcRect_destImage_destOrigin___block_invoke;
  v21[3] = &unk_1E5D94898;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = v16;
  uint64_t v26 = v18;
  int64_t v27 = var0;
  int64_t v28 = var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v29 = v35;
  int64_t v30 = var0 - v13;
  int64_t v31 = var1 - v14;
  id v32 = a1;
  id v20 = v11;
  id v22 = v20;
  [v12 writeBufferRegion:v19 withBlock:v21];
}

void __69__NUImageUtilities_copyPixelsFromImage_srcRect_destImage_destOrigin___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = v3;
  long long v16 = *(_OWORD *)(a1 + 56);
  long long v18 = *(_OWORD *)(a1 + 40);
  if (v3)
  {
    [v3 frameRect];
    long long v6 = v21;
    long long v5 = v22;
  }
  else
  {
    long long v5 = 0uLL;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v6 = 0uLL;
  }
  int64x2_t v7 = *(int64x2_t *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 88);
  long long v27 = v6;
  long long v28 = v5;
  int64x2_t v25 = v7;
  long long v26 = v8;
  NU::RectT<long>::Intersection((uint64_t)&v23, (uint64_t *)&v27, v25.i64);
  long long v27 = v18;
  long long v28 = v16;
  int64x2_t v25 = v23;
  long long v26 = v24;
  NU::RectT<long>::Intersection((uint64_t)&v23, (uint64_t *)&v27, v25.i64);
  if ((void)v24 && *((void *)&v24 + 1))
  {
    long long v17 = v24;
    int64x2_t v19 = v23;
    uint64_t v9 = [v4 mutableBuffer];
    long long v10 = [v9 format];
    uint64_t v11 = [v10 bytesPerPixel];

    if (v4)
    {
      [v4 frameRect];
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    uint64_t v12 = [v9 rowBytes];
    uint64_t v13 = [v9 mutableBytes];
    int64_t v14 = *(void **)(a1 + 120);
    uint64_t v15 = *(void *)(a1 + 32);
    v20[0] = vsubq_s64(v19, *(int64x2_t *)(a1 + 104));
    v20[1] = v17;
    objc_msgSend(v14, "copyPixelsFromImage:rect:destPtr:destPtrRowBytes:", v15, v20, v13 + (v19.i64[1] - *((void *)&v27 + 1)) * v12 + (v19.i64[0] - (void)v27) * v11, objc_msgSend(v9, "rowBytes"));
  }
}

+ (void)fillPixelsInBuffer:(id)a3 rect:(id *)a4 srcPixel:(const void *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  if (!v48)
  {
    int64_t v14 = NUAssertLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v17 = NUAssertLogger();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        id v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        $0AC6E346AE4835514AAA8AC86D8F4844 v34 = [MEMORY[0x1E4F29060] callStackSymbols];
        $0AC6E346AE4835514AAA8AC86D8F4844 v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v35;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      int64x2_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v36 = "buffer != nil";
    uint64_t v37 = 211;
LABEL_37:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities fillPixelsInBuffer:rect:srcPixel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v37, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)v36);
  }
  if (a4->var1.var0) {
    BOOL v7 = a4->var1.var1 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    long long v21 = NUAssertLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelRectIsEmpty(rect)");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int64x2_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v17 = NUAssertLogger();
    BOOL v24 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v24)
      {
        BOOL v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v40;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      int64x2_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v36 = "!NUPixelRectIsEmpty(rect)";
    uint64_t v37 = 212;
    goto LABEL_37;
  }
  if (!a5)
  {
    long long v27 = NUAssertLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "srcPixel != nil");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    $0AC6E346AE4835514AAA8AC86D8F4844 v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v17 = NUAssertLogger();
    BOOL v30 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v30)
      {
        __int16 v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v42 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v43;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v30)
    {
      int64_t v31 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v32 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v36 = "srcPixel != nil";
    uint64_t v37 = 213;
    goto LABEL_37;
  }
  v50[0] = 0;
  v50[1] = 0;
  *(void *)&long long v51 = [v48 size];
  *((void *)&v51 + 1) = v8;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  *(void *)CGRect buf = 0;
  *(void *)&buf[8] = 0;
  *(_OWORD *)&buf[16] = v51;
  v54[0] = var0;
  v54[1] = var1;
  NU::RectT<long>::Intersection((uint64_t)&v52, (uint64_t *)buf, (uint64_t *)v54);
  v49[0] = v52;
  v49[1] = v53;
  if ((void)v53 && *((void *)&v53 + 1))
  {
    uint64_t v11 = [v48 mutableBytes];
    uint64_t v12 = [v48 rowBytes];
    uint64_t v13 = [v48 format];
    nu::fill_rect<NUPixelRect>(v50, v11, v12, (uint64_t *)v49, (unsigned __int8 *)a5, [v13 bytesPerPixel]);
  }
}

+ (void)fillPixelsInImage:(id)a3 rect:(id *)a4 srcPixel:(const void *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (!v7)
  {
    long long v17 = NUAssertLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)CGRect buf = 138543362;
      CGAffineTransform v57 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v20 = NUAssertLogger();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v37 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        CGAffineTransform v57 = v36;
        __int16 v58 = 2114;
        long long v59 = v38;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      long long v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64x2_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      CGAffineTransform v57 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v39 = "image != nil";
    uint64_t v40 = 193;
LABEL_32:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities fillPixelsInImage:rect:srcPixel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v40, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)v39);
  }
  if (a4->var1.var0) {
    BOOL v9 = a4->var1.var1 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    BOOL v24 = NUAssertLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int64x2_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelRectIsEmpty(rect)");
      *(_DWORD *)CGRect buf = 138543362;
      CGAffineTransform v57 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v20 = NUAssertLogger();
    BOOL v27 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v27)
      {
        __int16 v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v42 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        CGAffineTransform v57 = v41;
        __int16 v58 = 2114;
        long long v59 = v43;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      long long v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      $0AC6E346AE4835514AAA8AC86D8F4844 v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      CGAffineTransform v57 = v29;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v39 = "!NUPixelRectIsEmpty(rect)";
    uint64_t v40 = 194;
    goto LABEL_32;
  }
  if (!a5)
  {
    BOOL v30 = NUAssertLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      int64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "srcPixel != nil");
      *(_DWORD *)CGRect buf = 138543362;
      CGAffineTransform v57 = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v20 = NUAssertLogger();
    BOOL v33 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v33)
      {
        uint64_t v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v45 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        CGAffineTransform v57 = v44;
        __int16 v58 = 2114;
        long long v59 = v46;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      $0AC6E346AE4835514AAA8AC86D8F4844 v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      CGAffineTransform v57 = v35;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v39 = "srcPixel != nil";
    uint64_t v40 = 195;
    goto LABEL_32;
  }
  long long v10 = [v7 layout];
  uint64_t v11 = [v10 imageSize];
  uint64_t v13 = v12;

  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  v55[0] = a4->var0;
  v55[1] = var1;
  uint64_t v15 = +[NURegion regionWithRect:v55];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __52__NUImageUtilities_fillPixelsInImage_rect_srcPixel___block_invoke;
  v51[3] = &__block_descriptor_104_e35_v24__0___NUMutableBufferTile__8_B16l;
  v51[4] = 0;
  v51[5] = 0;
  v51[6] = v11;
  v51[7] = v13;
  $0AC6E346AE4835514AAA8AC86D8F4844 v16 = a4->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v53 = v16;
  uint64_t v54 = a5;
  [v8 writeBufferRegion:v15 withBlock:v51];
}

void __52__NUImageUtilities_fillPixelsInImage_rect_srcPixel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = v3;
  long long v14 = *(_OWORD *)(a1 + 48);
  long long v15 = *(_OWORD *)(a1 + 32);
  if (v3)
  {
    [v3 frameRect];
    long long v6 = v16;
    long long v5 = v17;
  }
  else
  {
    long long v5 = 0uLL;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v6 = 0uLL;
  }
  long long v7 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 80);
  long long v24 = v6;
  long long v25 = v5;
  long long v22 = v7;
  long long v23 = v8;
  NU::RectT<long>::Intersection((uint64_t)&v20, (uint64_t *)&v24, (uint64_t *)&v22);
  long long v24 = v15;
  long long v25 = v14;
  long long v22 = v20;
  long long v23 = v21;
  NU::RectT<long>::Intersection((uint64_t)&v20, (uint64_t *)&v24, (uint64_t *)&v22);
  long long v18 = v20;
  long long v19 = v21;
  if ((void)v21 && *((void *)&v21 + 1))
  {
    BOOL v9 = [v4 mutableBuffer];
    if (v4)
    {
      [v4 frameRect];
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
    }
    uint64_t v10 = objc_msgSend(v9, "mutableBytes", v14, v15, v16, v17, v18, v19);
    uint64_t v11 = [v9 rowBytes];
    uint64_t v12 = *(unsigned __int8 **)(a1 + 96);
    uint64_t v13 = [v9 format];
    nu::fill_rect<NUPixelRect>((uint64_t *)&v24, v10, v11, (uint64_t *)&v18, v12, [v13 bytesPerPixel]);
  }
}

+ (void)copyPixelsToImage:(id)a3 atPoint:(id)a4 fromBuffer:(id)a5 inRect:(id *)a6
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v11 = a3;
  id v12 = a5;
  objc_msgSend(a1, "copyPixelsToImage:rect:srcPtr:srcPtrRowBytes:", v11, &v13, objc_msgSend(v12, "bytesAtPoint:", a6->var0.var0, a6->var0.var1, var0, var1, a6->var1.var0, a6->var1.var1), objc_msgSend(v12, "rowBytes"));
}

+ (void)copyPixelsToImage:(id)a3 rect:(id *)a4 srcPtr:(const void *)a5 srcPtrRowBytes:(int64_t)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = v9;
  if (!v9)
  {
    long long v23 = NUAssertLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v73 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v26 = NUAssertLogger();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        uint64_t v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v49 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v50 = [v49 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        int64_t v73 = v48;
        __int16 v74 = 2114;
        long long v75 = v50;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      long long v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      $0AC6E346AE4835514AAA8AC86D8F4844 v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v73 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    long long v51 = "image != nil";
    uint64_t v52 = 163;
LABEL_44:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyPixelsToImage:rect:srcPtr:srcPtrRowBytes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v52, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)v51);
  }
  int64_t var0 = a4->var1.var0;
  if (var0) {
    BOOL v12 = a4->var1.var1 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    BOOL v30 = NUAssertLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      int64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelRectIsEmpty(rect)");
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v73 = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v26 = NUAssertLogger();
    BOOL v33 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v33)
      {
        $0AC6E346AE4835514AAA8AC86D8F4844 v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v54 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        int64_t v73 = v53;
        __int16 v74 = 2114;
        long long v75 = v55;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      $0AC6E346AE4835514AAA8AC86D8F4844 v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v73 = v35;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    long long v51 = "!NUPixelRectIsEmpty(rect)";
    uint64_t v52 = 164;
    goto LABEL_44;
  }
  if (!a5)
  {
    uint64_t v36 = NUAssertLogger();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "srcPtr != nil");
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v73 = v37;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v26 = NUAssertLogger();
    BOOL v39 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v39)
      {
        uint64_t v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        CGAffineTransform v57 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v58 = [v57 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        int64_t v73 = v56;
        __int16 v74 = 2114;
        long long v75 = v58;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      uint64_t v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v73 = v41;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    long long v51 = "srcPtr != nil";
    uint64_t v52 = 165;
    goto LABEL_44;
  }
  if ((int)a6 >= 0) {
    uint64_t v13 = a6;
  }
  else {
    uint64_t v13 = -(int)a6;
  }
  long long v14 = [v9 format];
  uint64_t v15 = [v14 bytesPerPixel] * var0;

  if (v15 > v13)
  {
    uint64_t v42 = NUAssertLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "abs((int)srcPtrRowBytes) >= (NUWidth(rect) * [[image format] bytesPerPixel])");
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v73 = v43;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v26 = NUAssertLogger();
    BOOL v45 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      if (v45)
      {
        long long v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v60 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        int64_t v73 = v59;
        __int16 v74 = 2114;
        long long v75 = v61;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v45)
    {
      uint64_t v46 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v47 = [v46 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v73 = v47;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    long long v51 = "abs((int)srcPtrRowBytes) >= (NUWidth(rect) * [[image format] bytesPerPixel])";
    uint64_t v52 = 166;
    goto LABEL_44;
  }
  long long v16 = [v10 layout];
  uint64_t v17 = [v16 imageSize];
  uint64_t v19 = v18;

  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  v71[0] = a4->var0;
  v71[1] = var1;
  long long v21 = +[NURegion regionWithRect:v71];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __65__NUImageUtilities_copyPixelsToImage_rect_srcPtr_srcPtrRowBytes___block_invoke;
  v66[3] = &__block_descriptor_112_e35_v24__0___NUMutableBufferTile__8_B16l;
  v66[4] = 0;
  v66[5] = 0;
  v66[6] = v17;
  v66[7] = v19;
  $0AC6E346AE4835514AAA8AC86D8F4844 v22 = a4->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v67 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v68 = v22;
  int64_t v69 = a6;
  id v70 = a5;
  [v10 writeBufferRegion:v21 withBlock:v66];
}

void __65__NUImageUtilities_copyPixelsToImage_rect_srcPtr_srcPtrRowBytes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = v3;
  long long v28 = *(_OWORD *)(a1 + 48);
  long long v30 = *(_OWORD *)(a1 + 32);
  if (v3)
  {
    [v3 frameRect];
    long long v6 = v32;
    long long v5 = v33;
  }
  else
  {
    long long v5 = 0uLL;
    long long v6 = 0uLL;
  }
  long long v7 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 80);
  long long v38 = v6;
  long long v39 = v5;
  long long v36 = v7;
  long long v37 = v8;
  NU::RectT<long>::Intersection((uint64_t)&v34, (uint64_t *)&v38, (uint64_t *)&v36);
  long long v38 = v30;
  long long v39 = v28;
  long long v36 = v34;
  long long v37 = v35;
  NU::RectT<long>::Intersection((uint64_t)&v34, (uint64_t *)&v38, (uint64_t *)&v36);
  uint64_t v9 = v35;
  if ((void)v35)
  {
    uint64_t v10 = *((void *)&v35 + 1);
    if (*((void *)&v35 + 1))
    {
      long long v29 = v34;
      id v11 = [v4 mutableBuffer];
      int64_t v31 = v11;
      BOOL v12 = [v11 format];
      uint64_t v13 = [v12 bytesPerPixel];

      uint64_t v14 = *(void *)(a1 + 96);
      uint64_t v26 = *(void *)(a1 + 64);
      uint64_t v27 = *(void *)(a1 + 104);
      uint64_t v25 = *(void *)(a1 + 72);
      if (v4)
      {
        [v4 frameRect];
      }
      else
      {
        long long v38 = 0u;
        long long v39 = 0u;
      }
      uint64_t v24 = [v11 rowBytes];
      uint64_t v15 = [v11 mutableBytes];
      long long v16 = v11;
      uint64_t v18 = *((void *)&v38 + 1);
      uint64_t v17 = v38;
      uint64_t v19 = *(void *)(a1 + 96);
      uint64_t v20 = [v16 rowBytes];
      long long v21 = (char *)(v27 + (*((void *)&v29 + 1) - v25) * v14 + (v29 - v26) * v13);
      $0AC6E346AE4835514AAA8AC86D8F4844 v22 = (char *)(v15 + (*((void *)&v29 + 1) - v18) * v24 + (v29 - v17) * v13);
      size_t v23 = v9 * v13;
      do
      {
        memcpy(v22, v21, v23);
        v21 += v19;
        v22 += v20;
        --v10;
      }
      while (v10);
    }
  }
}

+ (void)copyPixelsFromSurfaceImage:(id)a3 atPoint:(id)a4 toBuffer:(id)a5
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [v10 size];
  objc_msgSend(a1, "copyPixelsFromSurfaceImage:rect:destPtr:destPtrRowBytes:", v9, &v13, objc_msgSend(v10, "mutableBytes", var0, var1, v11, v12), objc_msgSend(v10, "rowBytes"));
}

+ (void)copyPixelsFromSurfaceImage:(id)a3 rect:(id *)a4 destPtr:(void *)a5 destPtrRowBytes:(int64_t)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = v9;
  if (!v9)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 v22 = NUAssertLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      size_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v72 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        uint64_t v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v48 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        int64_t v72 = v47;
        __int16 v73 = 2114;
        __int16 v74 = v49;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v72 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v50 = "image != nil";
    uint64_t v51 = 132;
LABEL_41:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyPixelsFromSurfaceImage:rect:destPtr:destPtrRowBytes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v51, @"Invalid parameter not satisfying: %s", v61, v62, v63, v64, (uint64_t)v50);
  }
  int64_t var0 = a4->var1.var0;
  if (var0) {
    BOOL v12 = a4->var1.var1 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    long long v29 = NUAssertLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      long long v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelRectIsEmpty(rect)");
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v72 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger();
    BOOL v32 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v32)
      {
        uint64_t v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        $0AC6E346AE4835514AAA8AC86D8F4844 v53 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        int64_t v72 = v52;
        __int16 v73 = 2114;
        __int16 v74 = v54;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      long long v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v72 = v34;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v50 = "!NUPixelRectIsEmpty(rect)";
    uint64_t v51 = 133;
    goto LABEL_41;
  }
  if (!a5)
  {
    long long v35 = NUAssertLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      long long v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "destPtr != nil");
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v72 = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger();
    BOOL v38 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v38)
      {
        uint64_t v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v56 = [MEMORY[0x1E4F29060] callStackSymbols];
        CGAffineTransform v57 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        int64_t v72 = v55;
        __int16 v73 = 2114;
        __int16 v74 = v57;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v38)
    {
      long long v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v40 = [v39 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v72 = v40;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v50 = "destPtr != nil";
    uint64_t v51 = 134;
    goto LABEL_41;
  }
  uint64_t v13 = [v9 format];
  int64_t v14 = [v13 bytesPerPixel] * var0;

  if (v14 > a6)
  {
    __int16 v41 = NUAssertLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "destPtrRowBytes >= (NUWidth(rect) * [[image format] bytesPerPixel])");
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v72 = v42;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger();
    BOOL v44 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v43)
    {
      if (v44)
      {
        __int16 v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v59 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        int64_t v72 = v58;
        __int16 v73 = 2114;
        __int16 v74 = v60;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v44)
    {
      BOOL v45 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      int64_t v72 = v46;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v50 = "destPtrRowBytes >= (NUWidth(rect) * [[image format] bytesPerPixel])";
    uint64_t v51 = 135;
    goto LABEL_41;
  }
  uint64_t v15 = [v10 layout];
  uint64_t v16 = [v15 imageSize];
  uint64_t v18 = v17;

  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  v70[0] = a4->var0;
  v70[1] = var1;
  uint64_t v20 = +[NURegion regionWithRect:v70];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __76__NUImageUtilities_copyPixelsFromSurfaceImage_rect_destPtr_destPtrRowBytes___block_invoke;
  v65[3] = &__block_descriptor_112_e28_v24__0___NUBufferTile__8_B16l;
  v65[4] = 0;
  v65[5] = 0;
  v65[6] = v16;
  v65[7] = v18;
  $0AC6E346AE4835514AAA8AC86D8F4844 v21 = a4->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v66 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v67 = v21;
  int64_t v68 = a6;
  int64_t v69 = a5;
  [v10 readBufferRegion:v20 withBlock:v65];
}

void __76__NUImageUtilities_copyPixelsFromSurfaceImage_rect_destPtr_destPtrRowBytes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = v3;
  long long v29 = *(_OWORD *)(a1 + 48);
  long long v31 = *(_OWORD *)(a1 + 32);
  if (v3)
  {
    [v3 contentRect];
    long long v6 = v33;
    long long v5 = v34;
  }
  else
  {
    long long v5 = 0uLL;
    long long v6 = 0uLL;
  }
  long long v7 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 80);
  long long v39 = v6;
  long long v40 = v5;
  long long v37 = v7;
  long long v38 = v8;
  NU::RectT<long>::Intersection((uint64_t)&v35, (uint64_t *)&v39, (uint64_t *)&v37);
  long long v39 = v31;
  long long v40 = v29;
  long long v37 = v35;
  long long v38 = v36;
  NU::RectT<long>::Intersection((uint64_t)&v35, (uint64_t *)&v39, (uint64_t *)&v37);
  uint64_t v9 = v36;
  if ((void)v36)
  {
    uint64_t v10 = *((void *)&v36 + 1);
    if (*((void *)&v36 + 1))
    {
      long long v30 = v35;
      long long v28 = v4;
      uint64_t v11 = [v4 buffer];
      BOOL v32 = v11;
      BOOL v12 = [v11 format];
      uint64_t v13 = [v12 bytesPerPixel];

      uint64_t v27 = v9;
      if (v4)
      {
        [v4 frameRect];
      }
      else
      {
        long long v39 = 0u;
        long long v40 = 0u;
      }
      uint64_t v26 = [v11 rowBytes];
      uint64_t v25 = [v11 bytes];
      int64_t v14 = v11;
      uint64_t v15 = *((void *)&v39 + 1);
      uint64_t v16 = v39;
      uint64_t v18 = *(void *)(a1 + 96);
      uint64_t v17 = *(void *)(a1 + 104);
      uint64_t v20 = *(void *)(a1 + 64);
      uint64_t v19 = *(void *)(a1 + 72);
      uint64_t v21 = [v14 rowBytes];
      $0AC6E346AE4835514AAA8AC86D8F4844 v22 = (char *)(v17 + (*((void *)&v30 + 1) - v19) * v18 + (v30 - v20) * v13);
      size_t v23 = (char *)(v25 + (*((void *)&v30 + 1) - v15) * v26 + (v30 - v16) * v13);
      uint64_t v24 = *(void *)(a1 + 96);
      do
      {
        memcpy(v22, v23, v27 * v13);
        v23 += v21;
        v22 += v24;
        --v10;
      }
      while (v10);

      int64_t v4 = v28;
    }
  }
}

+ (void)copyPixelsFromImage:(id)a3 atPoint:(id)a4 toBuffer:(id)a5
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [v10 size];
  objc_msgSend(a1, "copyPixelsFromImage:rect:destPtr:destPtrRowBytes:", v9, &v13, objc_msgSend(v10, "mutableBytes", var0, var1, v11, v12), objc_msgSend(v10, "rowBytes"));
}

+ (void)copyBuffer:(id)a3 rect:(id *)a4 toBuffer:(id)a5 atPoint:(id)a6
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    uint64_t v65 = NUAssertLogger();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v66 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "srcBuffer != nil");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v66;
      _os_log_error_impl(&dword_1A9892000, v65, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v68 = NUAssertLogger();
    BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v69)
      {
        v126 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v127 = [MEMORY[0x1E4F29060] callStackSymbols];
        v128 = [v127 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v126;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v128;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v69)
    {
      id v70 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v71 = [v70 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v71;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    v129 = "srcBuffer != nil";
    uint64_t v130 = 78;
LABEL_121:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyBuffer:rect:toBuffer:atPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v130, @"Invalid parameter not satisfying: %s", v158, v159, v160, v161, (uint64_t)v129);
  }
  if (a4->var0.var0 < 0)
  {
    int64_t v72 = NUAssertLogger();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      __int16 v73 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "rect.origin.x >= 0");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v73;
      _os_log_error_impl(&dword_1A9892000, v72, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    __int16 v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v68 = NUAssertLogger();
    BOOL v75 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v74)
    {
      if (v75)
      {
        v131 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v132 = [MEMORY[0x1E4F29060] callStackSymbols];
        v133 = [v132 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v131;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v133;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v75)
    {
      uint64_t v76 = [MEMORY[0x1E4F29060] callStackSymbols];
      v77 = [v76 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v77;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    v129 = "rect.origin.x >= 0";
    uint64_t v130 = 79;
    goto LABEL_121;
  }
  int64_t v14 = a4->var1.var0;
  int64_t v13 = a4->var0.var0;
  if (v14 + v13 > [v11 size])
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 v78 = NUAssertLogger();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      long long v79 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "rect.origin.x + rect.size.width <= srcBuffer.size.width");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v79;
      _os_log_error_impl(&dword_1A9892000, v78, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    $0AC6E346AE4835514AAA8AC86D8F4844 v80 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v68 = NUAssertLogger();
    BOOL v81 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v80)
    {
      if (v81)
      {
        v134 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v135 = [MEMORY[0x1E4F29060] callStackSymbols];
        v136 = [v135 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v134;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v136;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v81)
    {
      uint64_t v82 = [MEMORY[0x1E4F29060] callStackSymbols];
      v83 = [v82 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v83;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    v129 = "rect.origin.x + rect.size.width <= srcBuffer.size.width";
    uint64_t v130 = 80;
    goto LABEL_121;
  }
  int64_t v15 = a4->var0.var1;
  if (v15 < 0)
  {
    v84 = NUAssertLogger();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      v85 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "rect.origin.y >= 0");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v85;
      _os_log_error_impl(&dword_1A9892000, v84, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    v86 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v68 = NUAssertLogger();
    BOOL v87 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v86)
    {
      if (v87)
      {
        v137 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v138 = [MEMORY[0x1E4F29060] callStackSymbols];
        v139 = [v138 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v137;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v139;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v87)
    {
      v88 = [MEMORY[0x1E4F29060] callStackSymbols];
      v89 = [v88 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v89;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    v129 = "rect.origin.y >= 0";
    uint64_t v130 = 81;
    goto LABEL_121;
  }
  int64_t v16 = a4->var1.var1;
  [v11 size];
  if (v16 + v15 > v17)
  {
    v90 = NUAssertLogger();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      v91 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "rect.origin.y + rect.size.height <= srcBuffer.size.height");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v91;
      _os_log_error_impl(&dword_1A9892000, v90, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    v92 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v68 = NUAssertLogger();
    BOOL v93 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v92)
    {
      if (v93)
      {
        v140 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v141 = [MEMORY[0x1E4F29060] callStackSymbols];
        v142 = [v141 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v140;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v142;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v93)
    {
      v94 = [MEMORY[0x1E4F29060] callStackSymbols];
      v95 = [v94 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v95;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    v129 = "rect.origin.y + rect.size.height <= srcBuffer.size.height";
    uint64_t v130 = 82;
    goto LABEL_121;
  }
  if (!v12)
  {
    v96 = NUAssertLogger();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      v97 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dstBuffer != nil");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v97;
      _os_log_error_impl(&dword_1A9892000, v96, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    v98 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v68 = NUAssertLogger();
    BOOL v99 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v98)
    {
      if (v99)
      {
        v143 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v144 = [MEMORY[0x1E4F29060] callStackSymbols];
        v145 = [v144 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v143;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v145;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v99)
    {
      v100 = [MEMORY[0x1E4F29060] callStackSymbols];
      v101 = [v100 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v101;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    v129 = "dstBuffer != nil";
    uint64_t v130 = 83;
    goto LABEL_121;
  }
  if (var0 < 0)
  {
    v102 = NUAssertLogger();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      v103 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "point.x >= 0");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v103;
      _os_log_error_impl(&dword_1A9892000, v102, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    v104 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v68 = NUAssertLogger();
    BOOL v105 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v104)
    {
      if (v105)
      {
        v146 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v147 = [MEMORY[0x1E4F29060] callStackSymbols];
        v148 = [v147 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v146;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v148;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v105)
    {
      v106 = [MEMORY[0x1E4F29060] callStackSymbols];
      v107 = [v106 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v107;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    v129 = "point.x >= 0";
    uint64_t v130 = 84;
    goto LABEL_121;
  }
  int64_t v18 = a4->var1.var0;
  if (v18 + var0 > [v12 size])
  {
    v108 = NUAssertLogger();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      v109 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "point.x + rect.size.width <= dstBuffer.size.width");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v109;
      _os_log_error_impl(&dword_1A9892000, v108, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    v110 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v68 = NUAssertLogger();
    BOOL v111 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v110)
    {
      if (v111)
      {
        v149 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v150 = [MEMORY[0x1E4F29060] callStackSymbols];
        v151 = [v150 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v149;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v151;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v111)
    {
      v112 = [MEMORY[0x1E4F29060] callStackSymbols];
      v113 = [v112 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v113;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    v129 = "point.x + rect.size.width <= dstBuffer.size.width";
    uint64_t v130 = 85;
    goto LABEL_121;
  }
  if (a4->var0.var1 < 0)
  {
    v114 = NUAssertLogger();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
    {
      v115 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "rect.origin.y >= 0");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v115;
      _os_log_error_impl(&dword_1A9892000, v114, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    v116 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v68 = NUAssertLogger();
    BOOL v117 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v116)
    {
      if (v117)
      {
        v152 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v153 = [MEMORY[0x1E4F29060] callStackSymbols];
        v154 = [v153 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v152;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v154;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v117)
    {
      v118 = [MEMORY[0x1E4F29060] callStackSymbols];
      v119 = [v118 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v119;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    v129 = "rect.origin.y >= 0";
    uint64_t v130 = 86;
    goto LABEL_121;
  }
  int64_t v19 = a4->var1.var1;
  [v12 size];
  if (v19 + var1 > v20)
  {
    v120 = NUAssertLogger();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      v121 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "point.y + rect.size.height <= dstBuffer.size.height");
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v121;
      _os_log_error_impl(&dword_1A9892000, v120, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
    }
    v122 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v68 = NUAssertLogger();
    BOOL v123 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (v122)
    {
      if (v123)
      {
        v155 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v156 = [MEMORY[0x1E4F29060] callStackSymbols];
        v157 = [v156 componentsJoinedByString:@"\n"];
        LODWORD(src.data) = 138543618;
        *(void **)((char *)&src.data + 4) = v155;
        WORD2(src.height) = 2114;
        *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v157;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
      }
    }
    else if (v123)
    {
      v124 = [MEMORY[0x1E4F29060] callStackSymbols];
      v125 = [v124 componentsJoinedByString:@"\n"];
      LODWORD(src.data) = 138543362;
      *(void **)((char *)&src.data + 4) = v125;
      _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
    }
    v129 = "point.y + rect.size.height <= dstBuffer.size.height";
    uint64_t v130 = 87;
    goto LABEL_121;
  }
  uint64_t v21 = [v11 format];
  $0AC6E346AE4835514AAA8AC86D8F4844 v22 = [v12 format];
  int v23 = [v21 isEqualToPixelFormat:v22];

  if (v23)
  {
    int64_t v25 = a4->var1.var0;
    int64_t v24 = a4->var1.var1;
    uint64_t v26 = [v11 format];
    uint64_t v27 = [v26 bytesPerPixel];
    long long v28 = (char *)[v11 bytes];
    uint64_t v29 = [v11 rowBytes];
    long long v30 = (char *)[v12 mutableBytes];
    uint64_t v31 = [v12 rowBytes];
    if (v25 && v24)
    {
      uint64_t v32 = v31;
      size_t v33 = v27 * v25;
      do
      {
        memcpy(v30, v28, v33);
        v28 += v29;
        v30 += v32;
        --v24;
      }
      while (v24);
    }

    goto LABEL_25;
  }
  src.data = objc_msgSend(v11, "bytesAtPoint:", a4->var0.var0, a4->var0.var1);
  v34.i64[0] = 0xFFFFFFFFLL;
  v34.i64[1] = 0xFFFFFFFFLL;
  int8x16_t v35 = vandq_s8((int8x16_t)a4->var1, v34);
  *(int8x16_t *)&src.height = vextq_s8(v35, v35, 8uLL);
  src.rowBytes = [v11 rowBytes];
  dest.data = objc_msgSend(v12, "mutableBytesAtPoint:", var0, var1);
  v36.i64[0] = 0xFFFFFFFFLL;
  v36.i64[1] = 0xFFFFFFFFLL;
  int8x16_t v37 = vandq_s8((int8x16_t)a4->var1, v36);
  *(int8x16_t *)&dest.height = vextq_s8(v37, v37, 8uLL);
  dest.rowBytes = [v12 rowBytes];
  long long v38 = [v11 format];
  long long v39 = +[NUPixelFormat BGRA8];
  int v40 = [v38 isEqualToPixelFormat:v39];
  char v41 = v40;
  if (!v40
    || ([v12 format],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        +[NUPixelFormat RGBA8],
        long long v6 = objc_claimAutoreleasedReturnValue(),
        ([v21 isEqualToPixelFormat:v6] & 1) == 0))
  {
    id v177 = v11;
    v178 = v12;
    uint64_t v42 = [v11 format];
    uint64_t v43 = +[NUPixelFormat RGBA8];
    if ([v42 isEqualToPixelFormat:v43])
    {
      BOOL v44 = [v178 format];
      BOOL v45 = +[NUPixelFormat BGRA8];
      char v46 = [v44 isEqualToPixelFormat:v45];

      if (v41)
      {
      }
      id v11 = v177;
      id v12 = v178;
      if (v46) {
        goto LABEL_24;
      }
    }
    else
    {

      if (v41)
      {
      }
      id v11 = v177;
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    uint64_t v47 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = NSString;
      uint64_t v49 = [v11 format];
      uint64_t v50 = [v178 format];
      uint64_t v51 = [v48 stringWithFormat:@"Unsupported pixel format conversion from %@ to %@", v49, v50];
      *(_DWORD *)CGRect buf = 138543362;
      v182 = v51;
      _os_log_error_impl(&dword_1A9892000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11412);
    }
    $0AC6E346AE4835514AAA8AC86D8F4844 v53 = (id)_NUAssertLogger;
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (v52)
    {
      if (v54)
      {
        CGAffineTransform v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v58 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v182 = v57;
        __int16 v183 = 2114;
        v184 = v59;
        _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v54)
    {
      uint64_t v55 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v56 = [v55 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v182 = v56;
      _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v60 = [v11 format];
    [v178 format];
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyBuffer:rect:toBuffer:atPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 118, @"Unsupported pixel format conversion from %@ to %@", v61, v62, v63, v64, v60);
  }

LABEL_24:
  *(_DWORD *)permuteMap = 50331906;
  if (vImagePermuteChannels_ARGB8888(&src, &dest, permuteMap, 0))
  {
    v162 = NUAssertLogger();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
    {
      v163 = [NSString stringWithFormat:@"Failed to convert image data"];
      *(_DWORD *)CGRect buf = 138543362;
      v182 = v163;
      _os_log_error_impl(&dword_1A9892000, v162, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v164 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v165 = NUAssertLogger();
    BOOL v166 = os_log_type_enabled(v165, OS_LOG_TYPE_ERROR);
    if (v164)
    {
      if (v166)
      {
        v169 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v170 = [MEMORY[0x1E4F29060] callStackSymbols];
        v171 = [v170 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v182 = v169;
        __int16 v183 = 2114;
        v184 = v171;
        _os_log_error_impl(&dword_1A9892000, v165, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v166)
    {
      v167 = [MEMORY[0x1E4F29060] callStackSymbols];
      v168 = [v167 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v182 = v168;
      _os_log_error_impl(&dword_1A9892000, v165, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyBuffer:rect:toBuffer:atPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 114, @"Failed to convert image data", v172, v173, v174, v175, v176);
  }
LABEL_25:
}

+ (void)copyPixelsFromImage:(id)a3 rect:(id *)a4 destPtr:(void *)a5 destPtrRowBytes:(int64_t)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = v9;
  if (!v9)
  {
    uint64_t v29 = NUAssertLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      long long v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "image != nil");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v32 = NUAssertLogger();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        BOOL v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v55 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v56 = [v55 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v54;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v56;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      int8x16_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      int8x16_t v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    CGAffineTransform v57 = "image != nil";
    uint64_t v58 = 37;
LABEL_45:

    _NUAssertFailHandler((uint64_t)"+[NUImageUtilities copyPixelsFromImage:rect:destPtr:destPtrRowBytes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", v58, @"Invalid parameter not satisfying: %s", v68, v69, v70, v71, (uint64_t)v57);
  }
  int64_t var0 = a4->var1.var0;
  if (var0) {
    BOOL v12 = a4->var1.var1 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    int8x16_t v36 = NUAssertLogger();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      int8x16_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "!NUPixelRectIsEmpty(rect)");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v32 = NUAssertLogger();
    BOOL v39 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v39)
      {
        long long v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v60 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v61;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      int v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v41;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    CGAffineTransform v57 = "!NUPixelRectIsEmpty(rect)";
    uint64_t v58 = 38;
    goto LABEL_45;
  }
  if (!a5)
  {
    uint64_t v42 = NUAssertLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "destPtr != nil");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v43;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v32 = NUAssertLogger();
    BOOL v45 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      if (v45)
      {
        uint64_t v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v63 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v64 = [v63 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v62;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v64;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v45)
    {
      char v46 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v47 = [v46 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v47;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    CGAffineTransform v57 = "destPtr != nil";
    uint64_t v58 = 39;
    goto LABEL_45;
  }
  int64_t v13 = [v9 format];
  int64_t v14 = [v13 bytesPerPixel] * var0;

  if (v14 > a6)
  {
    uint64_t v48 = NUAssertLogger();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      uint64_t v49 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "destPtrRowBytes >= (NUWidth(rect) * [[image format] bytesPerPixel])");
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v49;
      _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v32 = NUAssertLogger();
    BOOL v51 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v50)
    {
      if (v51)
      {
        uint64_t v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        $0AC6E346AE4835514AAA8AC86D8F4844 v66 = [MEMORY[0x1E4F29060] callStackSymbols];
        $0AC6E346AE4835514AAA8AC86D8F4844 v67 = [v66 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        *(void *)&uint8_t buf[4] = v65;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v67;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v51)
    {
      uint64_t v52 = [MEMORY[0x1E4F29060] callStackSymbols];
      $0AC6E346AE4835514AAA8AC86D8F4844 v53 = [v52 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      *(void *)&uint8_t buf[4] = v53;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    CGAffineTransform v57 = "destPtrRowBytes >= (NUWidth(rect) * [[image format] bytesPerPixel])";
    uint64_t v58 = 40;
    goto LABEL_45;
  }
  int64_t v15 = [v10 layout];
  uint64_t v16 = [v15 imageSize];
  uint64_t v18 = v17;

  *(void *)&long long v19 = v16;
  *((void *)&v19 + 1) = v18;
  $0AC6E346AE4835514AAA8AC86D8F4844 v20 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  *(void *)CGRect buf = 0;
  *(void *)&buf[8] = 0;
  *(_OWORD *)&buf[16] = v19;
  v85[0] = v20;
  v85[1] = var1;
  NU::RectT<long>::Intersection((uint64_t)v84, (uint64_t *)buf, (uint64_t *)v85);
  long long v72 = v84[1];
  long long v73 = v84[0];
  $0AC6E346AE4835514AAA8AC86D8F4844 v22 = [v10 validRegion];
  v83[0] = v73;
  v83[1] = v72;
  int v23 = [v22 regionByClippingToRect:v83];
  $0AC6E346AE4835514AAA8AC86D8F4844 v24 = a4->var1;
  v82[0] = a4->var0;
  v82[1] = v24;
  int64_t v25 = +[NURegion regionWithRect:v82];
  char v26 = [v23 isEqualToRegion:v25];

  if ((v26 & 1) == 0)
  {
    *(void *)CGRect buf = 0;
    *(void *)&buf[8] = 0;
    uint64_t v27 = [v10 format];
    nu::fill_rect<NUPixelRect>(&a4->var0.var0, (uint64_t)a5, a6, &a4->var0.var0, buf, [v27 bytesPerPixel]);
  }
  if (([v23 isEmpty] & 1) == 0)
  {
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __69__NUImageUtilities_copyPixelsFromImage_rect_destPtr_destPtrRowBytes___block_invoke;
    v74[3] = &unk_1E5D94810;
    long long v76 = v73;
    long long v77 = v72;
    id v75 = v22;
    $0AC6E346AE4835514AAA8AC86D8F4844 v28 = a4->var1;
    $0AC6E346AE4835514AAA8AC86D8F4844 v78 = a4->var0;
    $0AC6E346AE4835514AAA8AC86D8F4844 v79 = v28;
    int64_t v80 = a6;
    BOOL v81 = a5;
    [v10 readBufferRegion:v23 withBlock:v74];
  }
}

void __69__NUImageUtilities_copyPixelsFromImage_rect_destPtr_destPtrRowBytes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = v3;
  if (v3)
  {
    [v3 contentRect];
    long long v5 = v21;
    long long v6 = v22;
  }
  else
  {
    long long v6 = 0uLL;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v5 = 0uLL;
  }
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = *(_OWORD *)(a1 + 56);
  v25[0] = v5;
  v25[1] = v6;
  v24[0] = v7;
  v24[1] = v8;
  NU::RectT<long>::Intersection((uint64_t)v23, (uint64_t *)v25, (uint64_t *)v24);
  id v9 = *(void **)(a1 + 32);
  v20[0] = v23[0];
  v20[1] = v23[1];
  id v10 = [v9 regionByClippingToRect:v20];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__NUImageUtilities_copyPixelsFromImage_rect_destPtr_destPtrRowBytes___block_invoke_2;
  v14[3] = &unk_1E5D947E8;
  id v11 = v4;
  id v15 = v11;
  long long v12 = *(_OWORD *)(a1 + 88);
  long long v16 = *(_OWORD *)(a1 + 72);
  long long v17 = v12;
  uint64_t v13 = *(void *)(a1 + 112);
  uint64_t v18 = *(void *)(a1 + 104);
  uint64_t v19 = v13;
  [v10 enumerateRects:v14];
}

void __69__NUImageUtilities_copyPixelsFromImage_rect_destPtr_destPtrRowBytes___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  int64_t v4 = [*(id *)(a1 + 32) buffer];
  long long v5 = [v4 format];
  uint64_t v6 = [v5 bytesPerPixel];

  long long v7 = *(void **)(a1 + 32);
  uint64_t v23 = v6;
  if (v7) {
    [v7 frameRect];
  }
  else {
    long long v24 = 0u;
  }
  uint64_t v22 = [v4 rowBytes];
  uint64_t v21 = [v4 bytes];
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v19 = *(void *)(a1 + 80);
  uint64_t v20 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v12 = a2[2];
  uint64_t v11 = a2[3];
  uint64_t v13 = [v4 rowBytes];
  if (v12 && v11)
  {
    uint64_t v14 = v13;
    id v15 = (char *)(v21 + (v9 - *((void *)&v24 + 1)) * v22 + (v8 - v24) * v6);
    long long v16 = (char *)(v19 + (v9 - v10) * v20 + (v8 - v18) * v6);
    uint64_t v17 = *(void *)(a1 + 72);
    do
    {
      memcpy(v16, v15, v12 * v23);
      v15 += v14;
      v16 += v17;
      --v11;
    }
    while (v11);
  }
}

@end