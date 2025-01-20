@interface NUMutableHistogram
- (id)copyWithZone:(_NSZone *)a3;
- (void)increment:(int64_t)a3;
- (void)observeValue:(double)a3;
- (void)observeValuesInDataSet:(id)a3;
- (void)smoothWithFunction:(int64_t)a3 windowSize:(int64_t)a4 sampleMode:(int64_t)a5;
- (void)write:(id)a3;
@end

@implementation NUMutableHistogram

- (void)smoothWithFunction:(int64_t)a3 windowSize:(int64_t)a4 sampleMode:(int64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v8 = [(NUHistogram *)self _samplerForSampleMode:a5];
  v35 = v8;
  if (a3 == 1)
  {
    if ((a4 & 0x8000000000000001) != 1) {
      __assert_rtn("tent", "Histogram.hpp", 298, "size % 2 == 1");
    }
    value = self->super._histogram.__ptr_.__value_;
    uint64_t v36 = 0;
    std::vector<long>::vector(&__p, a4, &v36);
    uint64_t v11 = 0;
    unint64_t v12 = ((unint64_t)a4 >> 1) + 1;
    uint64x2_t v13 = (uint64x2_t)vdupq_n_s64(a4 - 1);
    int64x2_t v14 = vdupq_n_s64(1uLL);
    int64x2_t v15 = vdupq_n_s64(2uLL);
    int64x2_t v16 = (int64x2_t)xmmword_1A9A72C90;
    v17 = __p;
    int64x2_t v18 = vdupq_n_s64(v12);
    do
    {
      int32x2_t v19 = vmovn_s64((int64x2_t)vcgeq_u64(v13, (uint64x2_t)v16));
      int64x2_t v20 = vabsq_s64(vaddq_s64(vsubq_s64(v16, v18), v14));
      if (v19.i8[0]) {
        v17[v11] = v12 - v20.i64[0];
      }
      if (v19.i8[4]) {
        v17[v11 + 1] = v12 - v20.i64[1];
      }
      v11 += 2;
      int64x2_t v16 = vaddq_s64(v16, v15);
    }
    while (((a4 + 1) & 0xFFFFFFFFFFFFFFFELL) != v11);
    memset(buf, 0, sizeof(buf));
    std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(buf, v17, (uint64_t)v38, (v38 - (unsigned char *)v17) >> 3);
    unint64_t v40 = v12 * v12;
    if (__p)
    {
      v38 = __p;
      operator delete(__p);
    }
    NU::Histogram<long,double>::convolve((uint64_t)value, buf, (uint64_t)&v35);
  }
  else
  {
    if (a3)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24121);
      }
      v21 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown window function: %ld", a3, v35);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v22;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24121);
      }
      v24 = (id)_NUAssertLogger;
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v25)
        {
          v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v29 = [MEMORY[0x1E4F29060] callStackSymbols];
          v30 = [v29 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v30;
          _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v25)
      {
        v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v27;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUMutableHistogram smoothWithFunction:windowSize:sampleMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 226, @"Unknown window function: %ld", v31, v32, v33, v34, a3);
    }
    v9 = self->super._histogram.__ptr_.__value_;
    NU::Histogram<long,double>::Kernel::box(buf, a4);
    NU::Histogram<long,double>::convolve((uint64_t)v9, buf, (uint64_t)&v35);
  }
  if (*(void *)buf) {
    operator delete(*(void **)buf);
  }
}

- (void)observeValuesInDataSet:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v32 = v4;
  if (!v4)
  {
    int64x2_t v18 = NUAssertLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int32x2_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dataSet != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        BOOL v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v25;
        __int16 v35 = 2114;
        uint64_t v36 = v27;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableHistogram observeValuesInDataSet:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 210, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"dataSet != nil");
  }
  uint64_t v5 = objc_msgSend(v4, "_const_data");
  v6 = *(double **)v5;
  uint64_t v7 = *(void *)(v5 + 8) - *(void *)v5;
  if (v7)
  {
    uint64_t v8 = v7 >> 3;
    value = (double *)self->super._histogram.__ptr_.__value_;
    double v10 = *value;
    double v11 = value[1] - *value;
    uint64_t v12 = *((void *)value + 2);
    uint64_t v13 = (*((void *)value + 3) - v12) >> 3;
    double v14 = (double)v13;
    uint64_t v15 = v13 - 1;
    do
    {
      double v16 = *v6++;
      uint64_t v17 = vcvtmd_s64_f64((v16 - v10) / v11 * v14);
      if (v15 < v17) {
        uint64_t v17 = v15;
      }
      ++*(void *)(v12 + 8 * (v17 & ~(v17 >> 63)));
      ++*((void *)value + 5);
      --v8;
    }
    while (v8);
  }
}

- (void)observeValue:(double)a3
{
  value = (double *)self->super._histogram.__ptr_.__value_;
  uint64_t v4 = *((void *)value + 2);
  uint64_t v5 = (*((void *)value + 3) - v4) >> 3;
  int64_t v6 = vcvtmd_s64_f64((a3 - *value) / (value[1] - *value) * (double)v5);
  uint64_t v7 = v5 - 1;
  if (v7 >= v6) {
    uint64_t v7 = v6;
  }
  ++*(void *)(v4 + 8 * (v7 & ~(v7 >> 63)));
  ++*((void *)value + 5);
}

- (void)write:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v7 = NUAssertLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v10 = NUAssertLogger();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        double v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        __int16 v25 = 2114;
        v26 = v16;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableHistogram write:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 196, @"Invalid parameter not satisfying: %s", v17, v18, v19, v20, (uint64_t)"block != nil");
  }
  value = self->super._histogram.__ptr_.__value_;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __28__NUMutableHistogram_write___block_invoke;
  v21[3] = &unk_1E5D95720;
  id v6 = v4;
  v21[4] = self;
  id v22 = v6;
  value[5] += __28__NUMutableHistogram_write___block_invoke((uint64_t)v21, value[2]);
}

uint64_t __28__NUMutableHistogram_write___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) binCount];
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);

  return v5(v3, a2, v4);
}

- (void)increment:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 < 0 || [(NUHistogram *)self binCount] <= a3)
  {
    id v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "index >= 0 && index < self.binCount");
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v9 = NUAssertLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        uint64_t v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v21 = v13;
        __int16 v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      BOOL v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableHistogram increment:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 189, @"Invalid parameter not satisfying: %s", v16, v17, v18, v19, (uint64_t)"index >= 0 && index < self.binCount");
  }
  value = self->super._histogram.__ptr_.__value_;
  ++*(void *)(value[2] + 8 * a3);
  ++value[5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NUHistogram allocWithZone:a3];

  return [(NUHistogram *)v4 initWithHistogram:self];
}

@end