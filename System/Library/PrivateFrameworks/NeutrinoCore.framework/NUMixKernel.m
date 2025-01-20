@interface NUMixKernel
+ (void)mixTexture:(id)a3 region:(id *)a4 withTexture:(id)a5 region:(id *)a6 factor:(float)a7 intoTexture:(id)a8 atPoint:(id *)a9 withCommandBuffer:(id)a10;
+ (void)mixTexture:(id)a3 withTexture:(id)a4 factor:(float)a5 intoTexture:(id)a6 withCommandBuffer:(id)a7;
- ($48674E8BCF979F004322B2CC8DC33EC6)sourceRegion1;
- ($48674E8BCF979F004322B2CC8DC33EC6)sourceRegion2;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)destinationOffset;
- (MTLTexture)sourceTexture1;
- (MTLTexture)sourceTexture2;
- (float)factor;
- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4;
- (void)setDestinationOffset:(id *)a3;
- (void)setFactor:(float)a3;
- (void)setSourceRegion1:(id *)a3;
- (void)setSourceRegion2:(id *)a3;
- (void)setSourceTexture1:(id)a3;
- (void)setSourceTexture2:(id)a3;
@end

@implementation NUMixKernel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTexture2, 0);

  objc_storeStrong((id *)&self->_sourceTexture1, 0);
}

- (void)setDestinationOffset:(id *)a3
{
  unint64_t var2 = a3->var2;
  *(_OWORD *)&self->_destinationOffset.x = *(_OWORD *)&a3->var0;
  self->_destinationOffset.z = var2;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)destinationOffset
{
  *($B15351F604C5A8240EC3E8415888573B *)retstr = *($B15351F604C5A8240EC3E8415888573B *)((char *)self + 40);
  return self;
}

- (void)setSourceRegion2:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var2;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_sourceRegion2.origin.x = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_sourceRegion2.origin.z = v4;
  *(_OWORD *)&self->_sourceRegion2.size.height = v3;
}

- ($48674E8BCF979F004322B2CC8DC33EC6)sourceRegion2
{
  long long v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var2;
  *(_OWORD *)&retstr->var0.unint64_t var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (void)setSourceRegion1:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var2;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_sourceRegion1.origin.x = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_sourceRegion1.origin.z = v4;
  *(_OWORD *)&self->_sourceRegion1.size.height = v3;
}

- ($48674E8BCF979F004322B2CC8DC33EC6)sourceRegion1
{
  long long v3 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var2;
  *(_OWORD *)&retstr->var0.unint64_t var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var0;
  return self;
}

- (void)setSourceTexture2:(id)a3
{
}

- (MTLTexture)sourceTexture2
{
  return self->_sourceTexture2;
}

- (void)setSourceTexture1:(id)a3
{
}

- (MTLTexture)sourceTexture1
{
  return self->_sourceTexture1;
}

- (void)setFactor:(float)a3
{
  self->_factor = a3;
}

- (float)factor
{
  return self->_factor;
}

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (v7)
    {
      uint64_t v8 = [(NUMixKernel *)self sourceTexture1];
      if (v8)
      {
        v9 = (void *)v8;
        memset(v80, 0, 48);
        [(NUMixKernel *)self sourceRegion1];
        id v10 = v9;
        if ([v10 width] && objc_msgSend(v10, "height")) {
          [v10 depth];
        }

        v11 = NUAssertLogger_9464();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = [NSString stringWithFormat:@"Invalid region"];
          int v76 = 138543362;
          v77 = v12;
          _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v76, 0xCu);
        }
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = NUAssertLogger_9464();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v15)
          {
            v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v19 = (void *)MEMORY[0x1E4F29060];
            id v20 = v18;
            v21 = [v19 callStackSymbols];
            v22 = [v21 componentsJoinedByString:@"\n"];
            int v76 = 138543618;
            v77 = v18;
            __int16 v78 = 2114;
            v79 = v22;
            _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v76, 0x16u);
          }
        }
        else if (v15)
        {
          v16 = [MEMORY[0x1E4F29060] callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          int v76 = 138543362;
          v77 = v17;
          _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v76, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUMixKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 237, @"Invalid region", v23, v24, v25, v26, v75);
      }
      v41 = NUAssertLogger_9464();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = [NSString stringWithFormat:@"Missing source texture"];
        *(_DWORD *)v80 = 138543362;
        *(void *)&v80[4] = v42;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v80, 0xCu);
      }
      v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v44 = NUAssertLogger_9464();
      BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
      if (v43)
      {
        if (v45)
        {
          v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v67 = (void *)MEMORY[0x1E4F29060];
          id v68 = v66;
          v69 = [v67 callStackSymbols];
          v70 = [v69 componentsJoinedByString:@"\n"];
          *(_DWORD *)v80 = 138543618;
          *(void *)&v80[4] = v66;
          *(_WORD *)&v80[12] = 2114;
          *(void *)&v80[14] = v70;
          _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v80, 0x16u);
        }
      }
      else if (v45)
      {
        v46 = [MEMORY[0x1E4F29060] callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)v80 = 138543362;
        *(void *)&v80[4] = v47;
        _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v80, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUMixKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 235, @"Missing source texture", v71, v72, v73, v74, v75);
    }
    v34 = NUAssertLogger_9464();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "destinationTexture != nil");
      *(_DWORD *)v80 = 138543362;
      *(void *)&v80[4] = v35;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v80, 0xCu);
    }
    v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v37 = NUAssertLogger_9464();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        v60 = [v58 callStackSymbols];
        v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)v80 = 138543618;
        *(void *)&v80[4] = v57;
        *(_WORD *)&v80[12] = 2114;
        *(void *)&v80[14] = v61;
        _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v80, 0x16u);
      }
    }
    else if (v38)
    {
      v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      v40 = [v39 componentsJoinedByString:@"\n"];
      *(_DWORD *)v80 = 138543362;
      *(void *)&v80[4] = v40;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v80, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMixKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 232, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"destinationTexture != nil");
  }
  v27 = NUAssertLogger_9464();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "commandBuffer != nil");
    *(_DWORD *)v80 = 138543362;
    *(void *)&v80[4] = v28;
    _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v80, 0xCu);
  }
  v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v30 = NUAssertLogger_9464();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
  if (v29)
  {
    if (v31)
    {
      v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v49 = (void *)MEMORY[0x1E4F29060];
      id v50 = v48;
      v51 = [v49 callStackSymbols];
      v52 = [v51 componentsJoinedByString:@"\n"];
      *(_DWORD *)v80 = 138543618;
      *(void *)&v80[4] = v48;
      *(_WORD *)&v80[12] = 2114;
      *(void *)&v80[14] = v52;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v80, 0x16u);
    }
  }
  else if (v31)
  {
    v32 = [MEMORY[0x1E4F29060] callStackSymbols];
    v33 = [v32 componentsJoinedByString:@"\n"];
    *(_DWORD *)v80 = 138543362;
    *(void *)&v80[4] = v33;
    _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v80, 0xCu);
  }
  _NUAssertFailHandler((uint64_t)"-[NUMixKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 231, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"commandBuffer != nil");
}

+ (void)mixTexture:(id)a3 region:(id *)a4 withTexture:(id)a5 region:(id *)a6 factor:(float)a7 intoTexture:(id)a8 atPoint:(id *)a9 withCommandBuffer:(id)a10
{
  id v17 = a10;
  id v18 = a8;
  id v19 = a5;
  id v20 = a3;
  v21 = [NUMixKernel alloc];
  v22 = [v17 device];
  uint64_t v23 = [(NUComputeKernel *)v21 initWithDevice:v22];

  [(NUMixKernel *)v23 setSourceTexture1:v20];
  [(NUMixKernel *)v23 setSourceTexture2:v19];

  long long v24 = *(_OWORD *)&a4->var0.var2;
  v29[0] = *(_OWORD *)&a4->var0.var0;
  v29[1] = v24;
  v29[2] = *(_OWORD *)&a4->var1.var1;
  [(NUMixKernel *)v23 setSourceRegion1:v29];
  long long v25 = *(_OWORD *)&a6->var0.var2;
  v28[0] = *(_OWORD *)&a6->var0.var0;
  v28[1] = v25;
  v28[2] = *(_OWORD *)&a6->var1.var1;
  [(NUMixKernel *)v23 setSourceRegion2:v28];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v27 = *a9;
  [(NUMixKernel *)v23 setDestinationOffset:&v27];
  *(float *)&double v26 = a7;
  [(NUMixKernel *)v23 setFactor:v26];
  [(NUMixKernel *)v23 encodeToCommandBuffer:v17 destinationTexture:v18];
}

+ (void)mixTexture:(id)a3 withTexture:(id)a4 factor:(float)a5 intoTexture:(id)a6 withCommandBuffer:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  memset(v19, 0, 24);
  v19[3] = [v15 width];
  v19[4] = [v15 height];
  v19[5] = 1;
  memset(v18, 0, 24);
  v18[3] = [v14 width];
  v18[4] = [v14 height];
  v18[5] = 1;
  memset(v17, 0, sizeof(v17));
  *(float *)&double v16 = a5;
  [a1 mixTexture:v15 region:v19 withTexture:v14 region:v18 factor:v13 intoTexture:v17 atPoint:v16 withCommandBuffer:v12];
}

@end