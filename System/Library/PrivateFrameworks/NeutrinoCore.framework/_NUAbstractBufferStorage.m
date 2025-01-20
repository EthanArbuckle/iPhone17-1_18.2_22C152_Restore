@interface _NUAbstractBufferStorage
- (const)bytesAtPoint:(id)a3;
- (int64_t)copyFromStorage:(id)a3 region:(id)a4;
- (void)mutableBytesAtPoint:(id)a3;
@end

@implementation _NUAbstractBufferStorage

- (int64_t)copyFromStorage:(id)a3 region:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v18 = NUAssertLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = [MEMORY[0x1E4F29060] callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v39;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v40 = "other != nil";
    uint64_t v41 = 192;
LABEL_32:

    _NUAssertFailHandler((uint64_t)"-[_NUAbstractBufferStorage copyFromStorage:region:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", v41, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)v40);
  }
  uint64_t v8 = [v6 size];
  uint64_t v10 = v9;
  if (v8 != [(_NUAbstractStorage *)self size] || v10 != v11)
  {
    v25 = NUAssertLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUPixelSizeEqualToSize(other.size, self.size)");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger();
    BOOL v28 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v28)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = [MEMORY[0x1E4F29060] callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v44;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v40 = "NUPixelSizeEqualToSize(other.size, self.size)";
    uint64_t v41 = 193;
    goto LABEL_32;
  }
  v12 = [(_NUAbstractStorage *)self format];
  v13 = [v6 format];
  char v14 = [v12 isEqualToPixelFormat:v13];

  if ((v14 & 1) == 0)
  {
    v31 = NUAssertLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[self.format isEqualToPixelFormat:other.format]");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger();
    BOOL v34 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v34)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = [MEMORY[0x1E4F29060] callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v47;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v36;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    v40 = "[self.format isEqualToPixelFormat:other.format]";
    uint64_t v41 = 194;
    goto LABEL_32;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v56 = 1;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __51___NUAbstractBufferStorage_copyFromStorage_region___block_invoke;
  v52[3] = &unk_1E5D94E90;
  v54 = buf;
  v52[4] = self;
  id v15 = v7;
  id v53 = v15;
  int64_t v16 = [v6 readBufferInRegion:v15 block:v52];
  if (v16 == 1) {
    int64_t v16 = *(void *)(*(void *)&buf[8] + 24);
  }

  _Block_object_dispose(buf, 8);
  return v16;
}

- (void)mutableBytesAtPoint:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(_NUAbstractStorage *)self size];
  if (var0 < 0 || var0 >= v6 || var1 < 0 || var1 >= v7)
  {
    v12 = NUAssertLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUPixelPointInRect(point, extent)");
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v15 = NUAssertLogger();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        __int16 v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUAbstractBufferStorage mutableBytesAtPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 182, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"NUPixelPointInRect(point, extent)");
  }
  uint64_t v8 = [(_NUAbstractStorage *)self format];
  uint64_t v9 = [v8 bytesPerPixel];

  uint64_t v10 = [(_NUAbstractBufferStorage *)self rowBytes];
  return (void *)([(_NUAbstractBufferStorage *)self mutableBytes] + v10 * var1 + v9 * var0);
}

- (const)bytesAtPoint:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(_NUAbstractStorage *)self size];
  if (var0 < 0 || var0 >= v6 || var1 < 0 || var1 >= v7)
  {
    v12 = NUAssertLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUPixelPointInRect(point, extent)");
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v15 = NUAssertLogger();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        __int16 v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUAbstractBufferStorage bytesAtPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageStorage.mm", 171, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"NUPixelPointInRect(point, extent)");
  }
  uint64_t v8 = [(_NUAbstractStorage *)self format];
  uint64_t v9 = [v8 bytesPerPixel];

  uint64_t v10 = [(_NUAbstractBufferStorage *)self rowBytes];
  return (const void *)([(_NUAbstractBufferStorage *)self bytes] + v10 * var1 + v9 * var0);
}

@end