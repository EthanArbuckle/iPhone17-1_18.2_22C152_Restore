@interface NURenderJobStatisticsHistogram
- (NURenderJobStatisticsHistogram)initWithBins:(unint64_t)a3 millisPerBin:(double)a4;
- (double)millisPerBin;
- (id)description;
- (id)getPercentiles:(int64_t *)a3 numSamples:(int64_t)a4;
- (id)graphHistogram:(int64_t *)a3 label:(id)a4;
- (int64_t)completeDurationHistogram;
- (int64_t)completeDurationHistogramCount;
- (int64_t)completeLatencyHistogram;
- (int64_t)completeLatencyHistogramCount;
- (int64_t)prepareDurationHistogram;
- (int64_t)prepareDurationHistogramCount;
- (int64_t)prepareLatencyHistogram;
- (int64_t)prepareLatencyHistogramCount;
- (int64_t)renderDurationHistogram;
- (int64_t)renderDurationHistogramCount;
- (int64_t)renderLatencyHistogram;
- (int64_t)renderLatencyHistogramCount;
- (int64_t)totalDurationHistogram;
- (int64_t)totalDurationHistogramCount;
- (int64_t)totalHistogram;
- (int64_t)totalHistogramCount;
- (int64_t)totalLatencyHistogram;
- (int64_t)totalLatencyHistogramCount;
- (unint64_t)binCount;
- (void)addStatisticsToHistogram:(id)a3;
- (void)dealloc;
@end

@implementation NURenderJobStatisticsHistogram

- (int64_t)totalHistogramCount
{
  return self->_totalHistogramCount;
}

- (int64_t)totalLatencyHistogramCount
{
  return self->_totalLatencyHistogramCount;
}

- (int64_t)totalDurationHistogramCount
{
  return self->_totalDurationHistogramCount;
}

- (int64_t)completeDurationHistogramCount
{
  return self->_completeDurationHistogramCount;
}

- (int64_t)completeLatencyHistogramCount
{
  return self->_completeLatencyHistogramCount;
}

- (int64_t)renderDurationHistogramCount
{
  return self->_renderDurationHistogramCount;
}

- (int64_t)renderLatencyHistogramCount
{
  return self->_renderLatencyHistogramCount;
}

- (int64_t)prepareDurationHistogramCount
{
  return self->_prepareDurationHistogramCount;
}

- (int64_t)prepareLatencyHistogramCount
{
  return self->_prepareLatencyHistogramCount;
}

- (int64_t)totalHistogram
{
  return self->_totalHistogram;
}

- (int64_t)totalLatencyHistogram
{
  return self->_totalLatencyHistogram;
}

- (int64_t)totalDurationHistogram
{
  return self->_totalDurationHistogram;
}

- (int64_t)completeDurationHistogram
{
  return self->_completeDurationHistogram;
}

- (int64_t)completeLatencyHistogram
{
  return self->_completeLatencyHistogram;
}

- (int64_t)renderDurationHistogram
{
  return self->_renderDurationHistogram;
}

- (int64_t)renderLatencyHistogram
{
  return self->_renderLatencyHistogram;
}

- (int64_t)prepareDurationHistogram
{
  return self->_prepareDurationHistogram;
}

- (int64_t)prepareLatencyHistogram
{
  return self->_prepareLatencyHistogram;
}

- (double)millisPerBin
{
  return self->_millisPerBin;
}

- (unint64_t)binCount
{
  return self->_binCount;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:1024];
  v25 = [(NURenderJobStatisticsHistogram *)self getPercentiles:self->_prepareLatencyHistogram numSamples:self->_prepareLatencyHistogramCount];
  v22 = [(NURenderJobStatisticsHistogram *)self getPercentiles:self->_prepareDurationHistogram numSamples:self->_prepareDurationHistogramCount];
  v21 = [(NURenderJobStatisticsHistogram *)self getPercentiles:self->_renderLatencyHistogram numSamples:self->_renderLatencyHistogramCount];
  v4 = [(NURenderJobStatisticsHistogram *)self getPercentiles:self->_renderDurationHistogram numSamples:self->_renderDurationHistogramCount];
  v5 = [(NURenderJobStatisticsHistogram *)self getPercentiles:self->_completeLatencyHistogram numSamples:self->_completeLatencyHistogramCount];
  v6 = [(NURenderJobStatisticsHistogram *)self getPercentiles:self->_completeDurationHistogram numSamples:self->_completeDurationHistogramCount];
  v7 = [(NURenderJobStatisticsHistogram *)self getPercentiles:self->_totalLatencyHistogram numSamples:self->_totalLatencyHistogramCount];
  v23 = [(NURenderJobStatisticsHistogram *)self getPercentiles:self->_totalDurationHistogram numSamples:self->_totalDurationHistogramCount];
  v24 = [(NURenderJobStatisticsHistogram *)self getPercentiles:self->_totalHistogram numSamples:self->_totalHistogramCount];
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v3 appendFormat:@"<%@, %p\n", v9, self];

  objc_msgSend(v3, "appendFormat:", @"Time Resolution: %.3f millis\n", *(void *)&self->_millisPerBin);
  objc_msgSend(v3, "appendFormat:", @"Histogram Bins: %lu\n", self->_binCount);
  objc_msgSend(v3, "appendFormat:", @"Max Representable Time (> are clipped): %.1f millis\n", self->_millisPerBin * (double)self->_binCount);
  objc_msgSend(v3, "appendFormat:", @"Num Samples: %lli\n\n", self->_totalDurationHistogramCount);
  [v3 appendFormat:@"Percentiles:          99.9%%     99%%     90%%     50%%     25%%     1%%\n"];
  v10 = __45__NURenderJobStatisticsHistogram_description__block_invoke(v25);
  [v3 appendFormat:@"Prepare     (wait): %@\n", v10];

  v11 = __45__NURenderJobStatisticsHistogram_description__block_invoke(v22);
  [v3 appendFormat:@"Prepare  (execute): %@\n", v11];

  v12 = __45__NURenderJobStatisticsHistogram_description__block_invoke(v21);
  [v3 appendFormat:@"Render      (wait): %@\n", v12];

  v13 = __45__NURenderJobStatisticsHistogram_description__block_invoke(v4);
  [v3 appendFormat:@"Render   (execute): %@\n", v13];

  v14 = __45__NURenderJobStatisticsHistogram_description__block_invoke(v5);
  [v3 appendFormat:@"Complete    (wait): %@\n", v14];

  v15 = __45__NURenderJobStatisticsHistogram_description__block_invoke(v6);
  [v3 appendFormat:@"Complete (execute): %@\n", v15];

  [v3 appendFormat:@"\n"];
  v16 = __45__NURenderJobStatisticsHistogram_description__block_invoke(v7);
  [v3 appendFormat:@"Total       (wait): %@\n", v16];

  v17 = __45__NURenderJobStatisticsHistogram_description__block_invoke(v23);
  [v3 appendFormat:@"Total    (execute): %@\n", v17];

  v18 = __45__NURenderJobStatisticsHistogram_description__block_invoke(v24);
  [v3 appendFormat:@"Total             : %@\n", v18];

  [v3 appendFormat:@"\n"];
  v19 = [(NURenderJobStatisticsHistogram *)self graphHistogram:self->_totalDurationHistogram label:@"Graph: Total (execute) (y = samples, x = millis):"];
  [v3 appendString:v19];

  [v3 appendFormat:@"\n>"];

  return v3;
}

id __45__NURenderJobStatisticsHistogram_description__block_invoke(void *a1)
{
  id v1 = a1;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:100];
  if ([v1 count])
  {
    unint64_t v3 = 0;
    do
    {
      v4 = [v1 objectAtIndexedSubscript:v3];
      [v4 doubleValue];
      double v6 = v5;

      if (v6 >= 0.0)
      {
        v7 = [v1 objectAtIndexedSubscript:v3];
        [v7 doubleValue];
        objc_msgSend(v2, "appendFormat:", @"%6.2f  ", v8);
      }
      else
      {
        [v2 appendString:@"        "];
      }
      ++v3;
    }
    while (v3 < [v1 count]);
  }

  return v2;
}

- (id)getPercentiles:(int64_t *)a3 numSamples:(int64_t)a4
{
  v35[6] = *MEMORY[0x1E4F143B8];
  double v4 = (float)a4;
  uint64_t v5 = (uint64_t)(v4 * 0.999);
  uint64_t v6 = (uint64_t)(v4 * 0.99);
  if (v5 <= 1) {
    uint64_t v5 = 1;
  }
  if (v6 <= 1) {
    uint64_t v6 = 1;
  }
  uint64_t v7 = (uint64_t)(v4 * 0.9);
  if (v7 <= 1) {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (uint64_t)(v4 * 0.5);
  if (v8 <= 1) {
    uint64_t v8 = 1;
  }
  uint64_t v9 = (uint64_t)(v4 * 0.25);
  if (v9 <= 1) {
    uint64_t v9 = 1;
  }
  double v10 = 0.01;
  uint64_t v11 = (uint64_t)(v4 * 0.01);
  if (v11 <= 1) {
    uint64_t v11 = 1;
  }
  unint64_t binCount = self->_binCount;
  if (binCount)
  {
    unint64_t v13 = 0;
    uint64_t v14 = 0;
    double v10 = -1.0;
    double v15 = -1.0;
    double v16 = -1.0;
    double v17 = -1.0;
    double v18 = -1.0;
    double v19 = -1.0;
    double v20 = -1.0;
    do
    {
      v14 += a3[v13];
      if (v14 > v11 && v15 == -1.0) {
        double v15 = self->_millisPerBin * (double)(v13 + 1);
      }
      if (v14 > v9 && v16 == -1.0) {
        double v16 = self->_millisPerBin * (double)(v13 + 1);
      }
      if (v14 > v8 && v17 == -1.0) {
        double v17 = self->_millisPerBin * (double)(v13 + 1);
      }
      if (v14 > v7 && v18 == -1.0) {
        double v18 = self->_millisPerBin * (double)(v13 + 1);
      }
      ++v13;
      if (v14 > v6 && v19 == -1.0) {
        double v19 = self->_millisPerBin * (double)v13;
      }
      if (v14 > v5 && v20 == -1.0) {
        double v20 = self->_millisPerBin * (double)v13;
      }
    }
    while (binCount != v13);
  }
  else
  {
    double v20 = -1.0;
    double v19 = -1.0;
    double v18 = -1.0;
    double v17 = -1.0;
    double v16 = -1.0;
    double v15 = -1.0;
  }
  v27 = objc_msgSend(NSNumber, "numberWithDouble:", v20, v10);
  v35[0] = v27;
  v28 = [NSNumber numberWithDouble:v19];
  v35[1] = v28;
  v29 = [NSNumber numberWithDouble:v18];
  v35[2] = v29;
  v30 = [NSNumber numberWithDouble:v17];
  v35[3] = v30;
  v31 = [NSNumber numberWithDouble:v16];
  v35[4] = v31;
  v32 = [NSNumber numberWithDouble:v15];
  v35[5] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:6];

  return v33;
}

- (id)graphHistogram:(int64_t *)a3 label:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t binCount = self->_binCount;
  double v8 = log2((double)binCount);
  if (ceil(v8) != floor(v8))
  {
    v39 = NUAssertLogger_21966();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = [NSString stringWithFormat:@"binCount is not power of 2"];
      *(_DWORD *)buf = 138543362;
      v74 = v40;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v42 = NUAssertLogger_21966();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v43)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E4F29060];
        id v55 = v53;
        v56 = [v54 callStackSymbols];
        v57 = [v56 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v74 = v53;
        __int16 v75 = 2114;
        v76 = v57;
        _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v43)
    {
      v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v74 = v45;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJobStatisticsHistogram graphHistogram:label:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 2165, @"binCount is not power of 2", v58, v59, v60, v61, v71);
  }
  if (binCount <= 0x3F)
  {
    v46 = NUAssertLogger_21966();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = [NSString stringWithFormat:@"binCount should be >= 64"];
      *(_DWORD *)buf = 138543362;
      v74 = v47;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v49 = NUAssertLogger_21966();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v63 = (void *)MEMORY[0x1E4F29060];
        id v64 = v62;
        v65 = [v63 callStackSymbols];
        v66 = [v65 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v74 = v62;
        __int16 v75 = 2114;
        v76 = v66;
        _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v50)
    {
      v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      v52 = [v51 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v74 = v52;
      _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJobStatisticsHistogram graphHistogram:label:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 2166, @"binCount should be >= 64", v67, v68, v69, v70, v71);
  }
  uint64_t v9 = (char *)malloc_type_calloc(0x40uLL, 8uLL, 0x100004000313F17uLL);
  double v10 = v9;
  unint64_t v11 = self->_binCount;
  unint64_t v12 = v11 >> 6;
  if (v11)
  {
    for (unint64_t i = 0; i != v11; ++i)
      *(void *)&v9[8 * (i / v12)] += a3[i];
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2048];
  [v14 appendFormat:@"%@\n", v6];
  uint64_t v15 = 0;
  int64x2_t v16 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  int64x2_t v17 = 0uLL;
  do
  {
    int64x2_t v18 = *(int64x2_t *)&v10[v15];
    int64x2_t v17 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v18, v17), (int8x16_t)v18, (int8x16_t)v17);
    int64x2_t v16 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v16, v18), (int8x16_t)v18, (int8x16_t)v16);
    v15 += 16;
  }
  while (v15 != 512);
  v72 = v6;
  uint64_t v19 = vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL).u64[0];
  uint64_t v20 = (uint64_t)vbsl_s8((int8x8_t)vcgtd_s64(v19, v16.i64[0]), *(int8x8_t *)v16.i8, (int8x8_t)v19);
  uint64_t v21 = vextq_s8((int8x16_t)v17, (int8x16_t)v17, 8uLL).u64[0];
  double v22 = (double)(*(void *)&vbsl_s8((int8x8_t)vcgtd_s64(v17.i64[0], v21), *(int8x8_t *)v17.i8, (int8x8_t)v21) - v20)
      / 20.0;
  double v23 = (double)v20;
  int v24 = 20;
  do
  {
    int v25 = v24;
    if (v24)
    {
      double v26 = v23 + v22 * (double)v24;
      objc_msgSend(v14, "appendFormat:", @"%5.0f |", *(void *)&v26, v72);
    }
    else
    {
      [v14 appendFormat:@"  > 0 |"];
      double v26 = v23 + v22 * 0.0;
    }
    for (uint64_t j = 0; j != 512; j += 8)
    {
      uint64_t v28 = *(void *)&v10[j];
      if (v26 > (double)v28 || v28 <= 0) {
        v30 = @" ";
      }
      else {
        v30 = @".";
      }
      [v14 appendString:v30];
    }
    [v14 appendString:@"\n"];
    int v24 = v25 - 1;
  }
  while (v25);
  uint64_t v31 = 73;
  do
  {
    [v14 appendString:@"-"];
    --v31;
  }
  while (v31);
  [v14 appendString:@"\n     "];
  unint64_t v32 = 0;
  double v33 = (double)v12;
  do
  {
    if (-1431655765 * v32 > 0x55555555
      || (int v34 = (int)(self->_millisPerBin * (double)v32 * v33), v34 <= 99))
    {
      [v14 appendString:@" "];
    }
    else
    {
      objc_msgSend(v14, "appendFormat:", @"%i", (656 * (v34 % 0x3E8u)) >> 16);
    }
    ++v32;
  }
  while (v32 != 69);
  [v14 appendString:@"\n      "];
  for (unint64_t k = 0; k != 69; ++k)
  {
    if (-1431655765 * k > 0x55555555
      || (int v36 = (int)(self->_millisPerBin * (double)k * v33), v36 <= 9))
    {
      [v14 appendString:@" "];
    }
    else
    {
      objc_msgSend(v14, "appendFormat:", @"%i", (103 * (v36 % 0x64u)) >> 10);
    }
  }
  [v14 appendString:@"\n      "];
  for (unint64_t m = 0; m != 69; ++m)
  {
    if (-1431655765 * m < 0x55555556) {
      objc_msgSend(v14, "appendFormat:", @"%i", ((int)(self->_millisPerBin * (double)m * v33) % 10));
    }
    else {
      [v14 appendString:@" "];
    }
  }
  free(v10);

  return v14;
}

- (void)addStatisticsToHistogram:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__NURenderJobStatisticsHistogram_addStatisticsToHistogram___block_invoke;
  v8[3] = &unk_1E5D95600;
  v8[4] = self;
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void, void))MEMORY[0x1AD0FAD00](v8);
  [v4 prepareLatency];
  ((void (**)(void, int64_t *, int64_t *))v5)[2](v5, self->_prepareLatencyHistogram, &self->_prepareLatencyHistogramCount);
  [v4 prepareDuration];
  ((void (**)(void, int64_t *, int64_t *))v5)[2](v5, self->_prepareDurationHistogram, &self->_prepareDurationHistogramCount);
  [v4 renderLatency];
  ((void (**)(void, int64_t *, int64_t *))v5)[2](v5, self->_renderLatencyHistogram, &self->_renderLatencyHistogramCount);
  [v4 renderDuration];
  ((void (**)(void, int64_t *, int64_t *))v5)[2](v5, self->_renderDurationHistogram, &self->_renderDurationHistogramCount);
  [v4 completeLatency];
  ((void (**)(void, int64_t *, int64_t *))v5)[2](v5, self->_completeLatencyHistogram, &self->_completeLatencyHistogramCount);
  [v4 completeDuration];
  ((void (**)(void, int64_t *, int64_t *))v5)[2](v5, self->_completeDurationHistogram, &self->_completeDurationHistogramCount);
  [v4 duration];
  ((void (**)(void, int64_t *, int64_t *))v5)[2](v5, self->_totalDurationHistogram, &self->_totalDurationHistogramCount);
  [v4 latency];
  ((void (**)(void, int64_t *, int64_t *))v5)[2](v5, self->_totalLatencyHistogram, &self->_totalLatencyHistogramCount);
  [v4 totalDuration];
  double v7 = v6;

  ((void (*)(void (**)(void, void, void), int64_t *, int64_t *, double))v5[2])(v5, self->_totalHistogram, &self->_totalHistogramCount, v7);
}

uint64_t __59__NURenderJobStatisticsHistogram_addStatisticsToHistogram___block_invoke(uint64_t result, uint64_t a2, void *a3, double a4)
{
  if (a4 > 0.0)
  {
    uint64_t v6 = result;
    double v7 = a4 * 1000.0;
    [*(id *)(result + 32) millisPerBin];
    unint64_t v9 = (unint64_t)(v7 / v8);
    result = [*(id *)(v6 + 32) binCount];
    if (result - 1 <= v9)
    {
      result = [*(id *)(v6 + 32) binCount];
      unint64_t v9 = result - 1;
    }
    ++*(void *)(a2 + 8 * v9);
    ++*a3;
  }
  return result;
}

- (void)dealloc
{
  free(self->_prepareLatencyHistogram);
  free(self->_prepareDurationHistogram);
  free(self->_renderLatencyHistogram);
  free(self->_renderDurationHistogram);
  free(self->_completeLatencyHistogram);
  free(self->_completeDurationHistogram);
  free(self->_totalDurationHistogram);
  free(self->_totalLatencyHistogram);
  free(self->_totalHistogram);
  v3.receiver = self;
  v3.super_class = (Class)NURenderJobStatisticsHistogram;
  [(NURenderJobStatisticsHistogram *)&v3 dealloc];
}

- (NURenderJobStatisticsHistogram)initWithBins:(unint64_t)a3 millisPerBin:(double)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  double v7 = log2((double)a3);
  if (ceil(v7) != floor(v7))
  {
    double v10 = NUAssertLogger_21966();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unint64_t v11 = [NSString stringWithFormat:@"binCount must be a power of 2"];
      *(_DWORD *)buf = 138543362;
      v44 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    unint64_t v13 = NUAssertLogger_21966();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        int v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        v27 = [v25 callStackSymbols];
        uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v24;
        __int16 v45 = 2114;
        v46 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64x2_t v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJobStatisticsHistogram initWithBins:millisPerBin:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 2105, @"binCount must be a power of 2", v29, v30, v31, v32, (uint64_t)v42.receiver);
  }
  if (a3 <= 0x3F)
  {
    int64x2_t v17 = NUAssertLogger_21966();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int64x2_t v18 = [NSString stringWithFormat:@"binCount should be >= 64"];
      *(_DWORD *)buf = 138543362;
      v44 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_21966();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        double v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        int v36 = [v34 callStackSymbols];
        v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v44 = v33;
        __int16 v45 = 2114;
        v46 = v37;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      double v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v44 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJobStatisticsHistogram initWithBins:millisPerBin:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 2106, @"binCount should be >= 64", v38, v39, v40, v41, (uint64_t)v42.receiver);
  }
  v42.receiver = self;
  v42.super_class = (Class)NURenderJobStatisticsHistogram;
  double v8 = [(NURenderJobStatisticsHistogram *)&v42 init];
  if (v8)
  {
    v8->_prepareLatencyHistograunint64_t m = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_prepareDurationHistograunint64_t m = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_renderLatencyHistograunint64_t m = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_renderDurationHistograunint64_t m = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_completeLatencyHistograunint64_t m = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_completeDurationHistograunint64_t m = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_totalDurationHistograunint64_t m = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_totalLatencyHistograunint64_t m = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_totalHistograunint64_t m = (int64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v8->_millisPerBin = a4;
    v8->_unint64_t binCount = a3;
  }
  return v8;
}

@end