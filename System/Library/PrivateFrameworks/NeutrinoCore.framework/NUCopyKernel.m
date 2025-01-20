@interface NUCopyKernel
+ (void)copyFromTexture:(id)a3 region:(id *)a4 toTexture:(id)a5 atPoint:(id *)a6 withCommandBuffer:(id)a7;
+ (void)copyFromTexture:(id)a3 toTexture:(id)a4 atPoint:(id *)a5 withCommandBuffer:(id)a6;
+ (void)copyFromTexture:(id)a3 toTexture:(id)a4 withCommandBuffer:(id)a5;
- ($48674E8BCF979F004322B2CC8DC33EC6)sourceRegion;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)destinationOffset;
- (MTLTexture)sourceTexture;
- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4;
- (void)setDestinationOffset:(id *)a3;
- (void)setSourceRegion:(id *)a3;
- (void)setSourceTexture:(id)a3;
@end

@implementation NUCopyKernel

- (void).cxx_destruct
{
}

- (void)setDestinationOffset:(id *)a3
{
  unint64_t var2 = a3->var2;
  *(_OWORD *)&self->_destinationOffset.x = *(_OWORD *)&a3->var0;
  self->_destinationOffset.z = var2;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)destinationOffset
{
  *($B15351F604C5A8240EC3E8415888573B *)retstr = ($B15351F604C5A8240EC3E8415888573B)self[1];
  return self;
}

- (void)setSourceRegion:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var2;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_sourceRegion.origin.x = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_sourceRegion.origin.z = v4;
  *(_OWORD *)&self->_sourceRegion.size.height = v3;
}

- ($48674E8BCF979F004322B2CC8DC33EC6)sourceRegion
{
  long long v3 = *(_OWORD *)&self[1].var0.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.unint64_t var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

- (void)setSourceTexture:(id)a3
{
}

- (MTLTexture)sourceTexture
{
  return self->_sourceTexture;
}

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      v9 = [(NUCopyKernel *)self sourceTexture];
      if (v9)
      {
        v10 = v9;
        uint64_t v11 = [v9 pixelFormat];
        if (v11 == [v8 pixelFormat])
        {
          memset(v98, 0, 48);
          [(NUCopyKernel *)self sourceRegion];
          id v12 = v10;
          if ([v12 width] && objc_msgSend(v12, "height")) {
            [v12 depth];
          }

          v13 = NUAssertLogger_9464();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = [NSString stringWithFormat:@"Invalid source region"];
            int buf = 138543362;
            buf_4 = v14;
            _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
          }
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v16 = NUAssertLogger_9464();
          BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
          if (specific)
          {
            if (v17)
            {
              v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              v21 = (void *)MEMORY[0x1E4F29060];
              id v22 = v20;
              v23 = [v21 callStackSymbols];
              v24 = [v23 componentsJoinedByString:@"\n"];
              int buf = 138543618;
              buf_4 = v20;
              __int16 buf_12 = 2114;
              buf_14 = v24;
              _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
            }
          }
          else if (v17)
          {
            v18 = [MEMORY[0x1E4F29060] callStackSymbols];
            v19 = [v18 componentsJoinedByString:@"\n"];
            int buf = 138543362;
            buf_4 = v19;
            _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
          }
          _NUAssertFailHandler((uint64_t)"-[NUCopyKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 198, @"Invalid source region", v25, v26, v27, v28, v93);
        }
        v50 = NUAssertLogger_9464();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = [NSString stringWithFormat:@"Pixel format mismatch"];
          *(_DWORD *)v98 = 138543362;
          *(void *)&v98[4] = v51;
          _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v98, 0xCu);
        }
        v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v53 = NUAssertLogger_9464();
        BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
        if (v52)
        {
          if (v54)
          {
            v84 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v85 = (void *)MEMORY[0x1E4F29060];
            id v86 = v84;
            v87 = [v85 callStackSymbols];
            v88 = [v87 componentsJoinedByString:@"\n"];
            *(_DWORD *)v98 = 138543618;
            *(void *)&v98[4] = v84;
            *(_WORD *)&v98[12] = 2114;
            *(void *)&v98[14] = v88;
            _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v98, 0x16u);
          }
        }
        else if (v54)
        {
          v55 = [MEMORY[0x1E4F29060] callStackSymbols];
          v56 = [v55 componentsJoinedByString:@"\n"];
          *(_DWORD *)v98 = 138543362;
          *(void *)&v98[4] = v56;
          _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v98, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUCopyKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 195, @"Pixel format mismatch", v89, v90, v91, v92, v93);
      }
      v43 = NUAssertLogger_9464();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = [NSString stringWithFormat:@"Missing source texture"];
        *(_DWORD *)v98 = 138543362;
        *(void *)&v98[4] = v44;
        _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v98, 0xCu);
      }
      v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v46 = NUAssertLogger_9464();
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
      if (v45)
      {
        if (v47)
        {
          v75 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v76 = (void *)MEMORY[0x1E4F29060];
          id v77 = v75;
          v78 = [v76 callStackSymbols];
          v79 = [v78 componentsJoinedByString:@"\n"];
          *(_DWORD *)v98 = 138543618;
          *(void *)&v98[4] = v75;
          *(_WORD *)&v98[12] = 2114;
          *(void *)&v98[14] = v79;
          _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v98, 0x16u);
        }
      }
      else if (v47)
      {
        v48 = [MEMORY[0x1E4F29060] callStackSymbols];
        v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)v98 = 138543362;
        *(void *)&v98[4] = v49;
        _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v98, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUCopyKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 192, @"Missing source texture", v80, v81, v82, v83, v93);
    }
    v36 = NUAssertLogger_9464();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dstTexture != nil");
      *(_DWORD *)v98 = 138543362;
      *(void *)&v98[4] = v37;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v98, 0xCu);
    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v39 = NUAssertLogger_9464();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v67 = (void *)MEMORY[0x1E4F29060];
        id v68 = v66;
        v69 = [v67 callStackSymbols];
        v70 = [v69 componentsJoinedByString:@"\n"];
        *(_DWORD *)v98 = 138543618;
        *(void *)&v98[4] = v66;
        *(_WORD *)&v98[12] = 2114;
        *(void *)&v98[14] = v70;
        _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v98, 0x16u);
      }
    }
    else if (v40)
    {
      v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)v98 = 138543362;
      *(void *)&v98[4] = v42;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v98, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCopyKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 190, @"Invalid parameter not satisfying: %s", v71, v72, v73, v74, (uint64_t)"dstTexture != nil");
  }
  v29 = NUAssertLogger_9464();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "commandBuffer != nil");
    *(_DWORD *)v98 = 138543362;
    *(void *)&v98[4] = v30;
    _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v98, 0xCu);
  }
  v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v32 = NUAssertLogger_9464();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
  if (v31)
  {
    if (v33)
    {
      v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v58 = (void *)MEMORY[0x1E4F29060];
      id v59 = v57;
      v60 = [v58 callStackSymbols];
      v61 = [v60 componentsJoinedByString:@"\n"];
      *(_DWORD *)v98 = 138543618;
      *(void *)&v98[4] = v57;
      *(_WORD *)&v98[12] = 2114;
      *(void *)&v98[14] = v61;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v98, 0x16u);
    }
  }
  else if (v33)
  {
    v34 = [MEMORY[0x1E4F29060] callStackSymbols];
    v35 = [v34 componentsJoinedByString:@"\n"];
    *(_DWORD *)v98 = 138543362;
    *(void *)&v98[4] = v35;
    _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v98, 0xCu);
  }
  _NUAssertFailHandler((uint64_t)"-[NUCopyKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 189, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"commandBuffer != nil");
}

+ (void)copyFromTexture:(id)a3 region:(id *)a4 toTexture:(id)a5 atPoint:(id *)a6 withCommandBuffer:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  v14 = [NUCopyKernel alloc];
  v15 = [v11 device];
  v16 = [(NUComputeKernel *)v14 initWithDevice:v15];

  [(NUCopyKernel *)v16 setSourceTexture:v13];
  long long v17 = *(_OWORD *)&a4->var0.var2;
  v19[0] = *(_OWORD *)&a4->var0.var0;
  v19[1] = v17;
  v19[2] = *(_OWORD *)&a4->var1.var1;
  [(NUCopyKernel *)v16 setSourceRegion:v19];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v18 = *a6;
  [(NUCopyKernel *)v16 setDestinationOffset:&v18];
  [(NUCopyKernel *)v16 encodeToCommandBuffer:v11 destinationTexture:v12];
}

+ (void)copyFromTexture:(id)a3 toTexture:(id)a4 atPoint:(id *)a5 withCommandBuffer:(id)a6
{
  memset(v14, 0, 24);
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v14[3] = [v12 width];
  v14[4] = [v12 height];
  v14[5] = [v12 depth];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a5;
  [a1 copyFromTexture:v12 region:v14 toTexture:v11 atPoint:&v13 withCommandBuffer:v10];
}

+ (void)copyFromTexture:(id)a3 toTexture:(id)a4 withCommandBuffer:(id)a5
{
  memset(v5, 0, sizeof(v5));
  [a1 copyFromTexture:a3 toTexture:a4 atPoint:v5 withCommandBuffer:a5];
}

@end