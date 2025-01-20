@interface NUAlphaHistogramCalculator
- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceThresholds;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceWeights;
- (NUAlphaHistogramCalculator)init;
- (id)_computeAlphaHistogramForBufferBGRA8:(id)a3 error:(id *)a4;
- (id)computeHistogramFromBuffer:(id)a3 error:(id *)a4;
- (void)setLuminanceThresholds:(id)a3;
- (void)setLuminanceWeights:(id)a3;
@end

@implementation NUAlphaHistogramCalculator

- (void)setLuminanceThresholds:(id)a3
{
  self->_luminanceThresholds = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceThresholds
{
  float r = self->_luminanceThresholds.r;
  float g = self->_luminanceThresholds.g;
  float b = self->_luminanceThresholds.b;
  float a = self->_luminanceThresholds.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (void)setLuminanceWeights:(id)a3
{
  self->_luminanceWeights = ($43F634250C0E94E2A09AB0840E4770D1)a3;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)luminanceWeights
{
  float r = self->_luminanceWeights.r;
  float g = self->_luminanceWeights.g;
  float b = self->_luminanceWeights.b;
  float a = self->_luminanceWeights.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (id)_computeAlphaHistogramForBufferBGRA8:(id)a3 error:(id *)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v21 = NUAssertLogger_1902();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      *(_DWORD *)buf = 138543362;
      v66 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v24 = NUAssertLogger_1902();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v35;
        __int16 v67 = 2114;
        v68 = v39;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAlphaHistogramCalculator _computeAlphaHistogramForBufferBGRA8:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 343, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"buffer != nil");
  }
  if (!a4)
  {
    v28 = NUAssertLogger_1902();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v66 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v31 = NUAssertLogger_1902();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        v47 = [v45 callStackSymbols];
        v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v44;
        __int16 v67 = 2114;
        v68 = v48;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAlphaHistogramCalculator _computeAlphaHistogramForBufferBGRA8:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 344, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"error != NULL");
  }
  v7 = v6;
  float g = self->_luminanceWeights.g;
  float b = self->_luminanceWeights.b;
  float a = self->_luminanceWeights.a;
  float v59 = ldexpf(self->_luminanceWeights.r, 10);
  float v56 = ldexpf(g, 10);
  float v54 = ldexpf(b, 10);
  float v11 = ldexpf(a, 10);
  v12.i64[0] = __PAIR64__(LODWORD(v56), LODWORD(v59));
  v12.i64[1] = __PAIR64__(LODWORD(v11), LODWORD(v54));
  int32x4_t v60 = vmovl_s16(vmovn_s32(vcvtq_s32_f32(vrndxq_f32(v12))));
  float v13 = self->_luminanceThresholds.g;
  float v14 = self->_luminanceThresholds.b;
  float v15 = self->_luminanceThresholds.a;
  float v57 = ldexpf(self->_luminanceThresholds.r, 8);
  float v55 = ldexpf(v13, 8);
  float v53 = ldexpf(v14, 8);
  float v16 = ldexpf(v15, 8);
  v17.i64[0] = __PAIR64__(LODWORD(v55), LODWORD(v57));
  v17.i64[1] = __PAIR64__(LODWORD(v16), LODWORD(v53));
  int32x4_t v58 = vmovl_s16(vmovn_s32(vcvtq_s32_f32(vrndxq_f32(v17))));
  v18 = objc_alloc_init(NUMutableImageHistogram);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __73__NUAlphaHistogramCalculator__computeAlphaHistogramForBufferBGRA8_error___block_invoke;
  v61[3] = &unk_1E5D93FD0;
  id v64 = v7;
  int32x4_t v62 = v60;
  int32x4_t v63 = v58;
  id v19 = v7;
  [(NUMutableImageHistogram *)v18 write:v61];

  return v18;
}

uint64_t __73__NUAlphaHistogramCalculator__computeAlphaHistogramForBufferBGRA8_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = [*(id *)(a1 + 64) size];
  uint64_t v12 = v11;
  uint64_t v13 = [*(id *)(a1 + 64) bytes];
  uint64_t v14 = [*(id *)(a1 + 64) rowBytes];
  if (v12 < 1) {
    return 0;
  }
  uint64_t v16 = 0;
  for (uint64_t i = 0; i != v12; ++i)
  {
    if (v10 >= 1)
    {
      v18 = (__int32 *)(v13 + i * v14);
      uint64_t v19 = v10;
      do
      {
        __int32 v20 = *v18++;
        v15.i32[0] = v20;
        int16x4_t v21 = (int16x4_t)vmovl_u8(*(uint8x8_t *)v15.i8).u64[0];
        int8x8_t v22 = (int8x8_t)vrev32_s16(v21);
        int32x4_t v23 = (int32x4_t)vmovl_u16((uint16x4_t)vext_s8(v22, v22, 6uLL));
        int32x4_t v24 = *(int32x4_t *)(a1 + 48);
        int v25 = vaddvq_s32(vmulq_s32(*(int32x4_t *)(a1 + 32), v23));
        int v26 = v25 + 1535;
        uint64_t v27 = v21.u16[3];
        *(void *)(a2 + 8 * v23.u32[0]) += v21.u8[6];
        if (v25 + 512 >= 0) {
          int v26 = v25 + 512;
        }
        int v28 = v26 >> 10;
        v23.i32[3] = v28;
        uint32x4_t v15 = (uint32x4_t)vcgeq_s32(v23, v24);
        *(void *)(a3 + 8 * v23.u32[1]) += v27;
        *(void *)(a4 + 8 * v23.u32[2]) += v27;
        if ((vminvq_u32(v15) & 0x80000000) == 0) {
          uint64_t v29 = 0;
        }
        else {
          uint64_t v29 = v27;
        }
        *(void *)(a5 + 8 * v28) += v29;
        v16 += v27;
        --v19;
      }
      while (v19);
    }
  }
  return v16;
}

- (id)computeHistogramFromBuffer:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    float32x4_t v17 = NUAssertLogger_1902();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int32 v20 = NUAssertLogger_1902();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v31;
        __int16 v51 = 2114;
        uint64_t v52 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      int8x8_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      int32x4_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAlphaHistogramCalculator computeHistogramFromBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 308, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"buffer != nil");
  }
  if (!a4)
  {
    int32x4_t v24 = NUAssertLogger_1902();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v27 = NUAssertLogger_1902();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v40;
        __int16 v51 = 2114;
        uint64_t v52 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAlphaHistogramCalculator computeHistogramFromBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogramCalculator.m", 309, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v8 = [v6 format];
  v9 = +[NUPixelFormat BGRA8];
  int v10 = [v8 isEqualToPixelFormat:v9];

  if (v10)
  {
    if ([(NUHistogramCalculator *)self binCount] == 256)
    {
      [(NUHistogramCalculator *)self range];
      if (v11 == 0.0)
      {
        [(NUHistogramCalculator *)self range];
        if (v12 == 1.0)
        {
          uint64_t v13 = [(NUAlphaHistogramCalculator *)self _computeAlphaHistogramForBufferBGRA8:v7 error:a4];
          goto LABEL_12;
        }
      }
      uint32x4_t v15 = @"Unsupported histogram range for 8-bit image";
    }
    else
    {
      uint32x4_t v15 = @"Unsupported histogram bin count for 8-bit image";
    }
    +[NUError unsupportedError:v15 object:self];
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v14 = [v7 format];
    *a4 = +[NUError unsupportedError:@"Unsupported pixel format" object:v14];

    uint64_t v13 = 0;
  }
LABEL_12:

  return v13;
}

- (NUAlphaHistogramCalculator)init
{
  v3.receivefloat r = self;
  v3.super_class = (Class)NUAlphaHistogramCalculator;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result = [(NUHistogramCalculator *)&v3 init];
  result->_luminanceWeights = ($43F634250C0E94E2A09AB0840E4770D1)NUStandardLuminanceWeights;
  *(void *)&result->_luminanceThresholds.float r = 0;
  *(void *)&result->_luminanceThresholds.float b = 0;
  return result;
}

@end