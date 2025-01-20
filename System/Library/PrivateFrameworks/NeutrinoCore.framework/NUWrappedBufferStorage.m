@interface NUWrappedBufferStorage
- (NSString)description;
- (NUWrappedBufferStorage)initWithSize:(id)a3 format:(id)a4 bytes:(void *)a5 rowBytes:(int64_t)a6 length:(int64_t)a7;
- (const)bytes;
- (id)newRenderDestination;
- (int64_t)readBufferInRegion:(id)a3 block:(id)a4;
- (int64_t)rowBytes;
- (int64_t)sizeInBytes;
- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4;
- (void)mutableBytes;
@end

@implementation NUWrappedBufferStorage

- (int64_t)rowBytes
{
  return self->_rowBytes;
}

- (const)bytes
{
  return self->_bytes;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p> bytes=%p length=%ld", objc_opt_class(), self, self->_bytes, self->_length];
}

- (id)newRenderDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F1E070]);
  v4 = [(NUWrappedBufferStorage *)self mutableBytes];
  uint64_t v5 = [(_NUAbstractStorage *)self size];
  [(_NUAbstractStorage *)self size];
  uint64_t v7 = v6;
  int64_t v8 = [(NUWrappedBufferStorage *)self rowBytes];
  v9 = [(_NUAbstractStorage *)self format];
  v10 = objc_msgSend(v3, "initWithBitmapData:width:height:bytesPerRow:format:", v4, v5, v7, v8, objc_msgSend(v9, "CIFormat"));

  [v10 setLabel:@"NUWrappedBufferStorage-new"];
  return v10;
}

- (void)mutableBytes
{
  return self->_bytes;
}

- (int64_t)writeBufferInRegion:(id)a3 block:(id)a4
{
  uint64_t v6 = (void (**)(id, NUMutableBufferAdapter *))a4;
  id v7 = a3;
  int64_t v8 = [[NUMutableBufferAdapter alloc] initWithMutableBuffer:self];
  v6[2](v6, v8);

  [(NUBufferAdapter *)v8 invalidate];
  [(_NUAbstractStorage *)self validateRegion:v7];

  return 1;
}

- (int64_t)readBufferInRegion:(id)a3 block:(id)a4
{
  uint64_t v6 = (void (**)(id, NUBufferAdapter *))a4;
  [(_NUAbstractStorage *)self assertIsValidInRegion:a3];
  id v7 = [[NUBufferAdapter alloc] initWithBuffer:self];
  v6[2](v6, v7);

  [(NUBufferAdapter *)v7 invalidate];
  return 1;
}

- (int64_t)sizeInBytes
{
  return self->_length;
}

- (NUWrappedBufferStorage)initWithSize:(id)a3 format:(id)a4 bytes:(void *)a5 rowBytes:(int64_t)a6 length:(int64_t)a7
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  if (!v13)
  {
    v17 = NUAssertLogger_8992();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pixelFormat != nil");
      *(_DWORD *)buf = 138543362;
      v99 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_8992();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v53 = (void *)MEMORY[0x1E4F29060];
        id v54 = v52;
        v55 = [v53 callStackSymbols];
        v56 = [v55 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v99 = v52;
        __int16 v100 = 2114;
        v101 = v56;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v99 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUWrappedBufferStorage initWithSize:format:bytes:rowBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 353, @"Invalid parameter not satisfying: %s", v57, v58, v59, v60, (uint64_t)"pixelFormat != nil");
  }
  if (!a5)
  {
    v24 = NUAssertLogger_8992();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "bytes != nil");
      *(_DWORD *)buf = 138543362;
      v99 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_8992();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v62 = (void *)MEMORY[0x1E4F29060];
        id v63 = v61;
        v64 = [v62 callStackSymbols];
        v65 = [v64 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v99 = v61;
        __int16 v100 = 2114;
        v101 = v65;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v99 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUWrappedBufferStorage initWithSize:format:bytes:rowBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 354, @"Invalid parameter not satisfying: %s", v66, v67, v68, v69, (uint64_t)"bytes != nil");
  }
  if (!a6)
  {
    v31 = NUAssertLogger_8992();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "rowBytes != 0");
      *(_DWORD *)buf = 138543362;
      v99 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v34 = NUAssertLogger_8992();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v71 = (void *)MEMORY[0x1E4F29060];
        id v72 = v70;
        v73 = [v71 callStackSymbols];
        v74 = [v73 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v99 = v70;
        __int16 v100 = 2114;
        v101 = v74;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v99 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUWrappedBufferStorage initWithSize:format:bytes:rowBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 355, @"Invalid parameter not satisfying: %s", v75, v76, v77, v78, (uint64_t)"rowBytes != 0");
  }
  if (!a7)
  {
    v38 = NUAssertLogger_8992();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "length != 0");
      *(_DWORD *)buf = 138543362;
      v99 = v39;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v41 = NUAssertLogger_8992();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v42)
      {
        v79 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v80 = (void *)MEMORY[0x1E4F29060];
        id v81 = v79;
        v82 = [v80 callStackSymbols];
        v83 = [v82 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v99 = v79;
        __int16 v100 = 2114;
        v101 = v83;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v42)
    {
      v43 = [MEMORY[0x1E4F29060] callStackSymbols];
      v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v99 = v44;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUWrappedBufferStorage initWithSize:format:bytes:rowBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 356, @"Invalid parameter not satisfying: %s", v84, v85, v86, v87, (uint64_t)"length != 0");
  }
  if (var1 * a6 > a7)
  {
    v45 = NUAssertLogger_8992();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "length >= size.height * rowBytes");
      *(_DWORD *)buf = 138543362;
      v99 = v46;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v48 = NUAssertLogger_8992();
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (v47)
    {
      if (v49)
      {
        v88 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v89 = (void *)MEMORY[0x1E4F29060];
        id v90 = v88;
        v91 = [v89 callStackSymbols];
        v92 = [v91 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v99 = v88;
        __int16 v100 = 2114;
        v101 = v92;
        _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v49)
    {
      v50 = [MEMORY[0x1E4F29060] callStackSymbols];
      v51 = [v50 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v99 = v51;
      _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUWrappedBufferStorage initWithSize:format:bytes:rowBytes:length:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUBufferStorage.m", 357, @"Invalid parameter not satisfying: %s", v93, v94, v95, v96, (uint64_t)"length >= size.height * rowBytes");
  }
  v14 = v13;
  v97.receiver = self;
  v97.super_class = (Class)NUWrappedBufferStorage;
  v15 = [(_NUAbstractStorage *)&v97 init];
  v15->_rowBytes = a6;
  v15->_length = a7;
  v15->_bytes = a5;
  -[_NUAbstractStorage _resetSize:format:](v15, "_resetSize:format:", var0, var1, v14);

  return v15;
}

@end