@interface NUFillKernel
+ (void)fillTexture:(id)a3 color:(id)a4 withCommandBuffer:(id)a5;
+ (void)fillTexture:(id)a3 region:(id *)a4 color:(id)a5 withCommandBuffer:(id)a6;
- ($01BB1521EC52D44A8E7628F5261DCEC8)color;
- ($48674E8BCF979F004322B2CC8DC33EC6)region;
- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4;
- (void)setColor:(id)a3;
- (void)setRegion:(id *)a3;
@end

@implementation NUFillKernel

- (void)setRegion:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var2;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_region.origin.x = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_region.origin.z = v4;
  *(_OWORD *)&self->_region.size.height = v3;
}

- ($48674E8BCF979F004322B2CC8DC33EC6)region
{
  long long v3 = *(_OWORD *)&self[1].var0.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var2 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

- (void)setColor:(id)a3
{
  self->_color = ($3ED934EFF50B3E737D3D4A62C605F33B)a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)color
{
  double red = self->_color.red;
  double green = self->_color.green;
  double blue = self->_color.blue;
  double alpha = self->_color.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      memset(v63, 0, 48);
      [(NUFillKernel *)self region];
      id v9 = v8;
      if ([v9 width] && objc_msgSend(v9, "height")) {
        [v9 depth];
      }

      v10 = NUAssertLogger_9464();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [NSString stringWithFormat:@"Invalid region"];
        int buf = 138543362;
        buf_4 = v11;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v13 = NUAssertLogger_9464();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v14)
        {
          v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v18 = (void *)MEMORY[0x1E4F29060];
          id v19 = v17;
          v20 = [v18 callStackSymbols];
          v21 = [v20 componentsJoinedByString:@"\n"];
          int buf = 138543618;
          buf_4 = v17;
          __int16 buf_12 = 2114;
          buf_14 = v21;
          _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
        }
      }
      else if (v14)
      {
        v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        int buf = 138543362;
        buf_4 = v16;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUFillKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 133, @"Invalid region", v22, v23, v24, v25, v58);
    }
    v33 = NUAssertLogger_9464();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "destinationTexture != nil");
      *(_DWORD *)v63 = 138543362;
      *(void *)&v63[4] = v34;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v63, 0xCu);
    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v36 = NUAssertLogger_9464();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)v63 = 138543618;
        *(void *)&v63[4] = v49;
        *(_WORD *)&v63[12] = 2114;
        *(void *)&v63[14] = v53;
        _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v63, 0x16u);
      }
    }
    else if (v37)
    {
      v38 = [MEMORY[0x1E4F29060] callStackSymbols];
      v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)v63 = 138543362;
      *(void *)&v63[4] = v39;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v63, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUFillKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 130, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"destinationTexture != nil");
  }
  v26 = NUAssertLogger_9464();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "commandBuffer != nil");
    *(_DWORD *)v63 = 138543362;
    *(void *)&v63[4] = v27;
    _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v63, 0xCu);
  }
  v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v29 = NUAssertLogger_9464();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
  if (v28)
  {
    if (v30)
    {
      v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v41 = (void *)MEMORY[0x1E4F29060];
      id v42 = v40;
      v43 = [v41 callStackSymbols];
      v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)v63 = 138543618;
      *(void *)&v63[4] = v40;
      *(_WORD *)&v63[12] = 2114;
      *(void *)&v63[14] = v44;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v63, 0x16u);
    }
  }
  else if (v30)
  {
    v31 = [MEMORY[0x1E4F29060] callStackSymbols];
    v32 = [v31 componentsJoinedByString:@"\n"];
    *(_DWORD *)v63 = 138543362;
    *(void *)&v63[4] = v32;
    _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v63, 0xCu);
  }
  _NUAssertFailHandler((uint64_t)"-[NUFillKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 129, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"commandBuffer != nil");
}

+ (void)fillTexture:(id)a3 region:(id *)a4 color:(id)a5 withCommandBuffer:(id)a6
{
  double var3 = a5.var3;
  double var2 = a5.var2;
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v12 = a6;
  id v13 = a3;
  BOOL v14 = [NUFillKernel alloc];
  v15 = [v12 device];
  v16 = [(NUComputeKernel *)v14 initWithDevice:v15];

  -[NUFillKernel setColor:](v16, "setColor:", var0, var1, var2, var3);
  long long v17 = *(_OWORD *)&a4->var0.var2;
  v18[0] = *(_OWORD *)&a4->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a4->var1.var1;
  [(NUFillKernel *)v16 setRegion:v18];
  [(NUFillKernel *)v16 encodeToCommandBuffer:v12 destinationTexture:v13];
}

+ (void)fillTexture:(id)a3 color:(id)a4 withCommandBuffer:(id)a5
{
  double var3 = a4.var3;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  id v12 = a3;
  memset(v13, 0, 24);
  v13[3] = [v12 width];
  v13[4] = [v12 height];
  v13[5] = 1;
  objc_msgSend(a1, "fillTexture:region:color:withCommandBuffer:", v12, v13, v11, var0, var1, var2, var3);
}

@end