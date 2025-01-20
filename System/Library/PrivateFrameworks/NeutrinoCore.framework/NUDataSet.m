@interface NUDataSet
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDataSet:(id)a3;
- (NUDataSet)init;
- (NUDataSet)initWithDataSet:(id)a3;
- (NUDataSet)initWithValue:(double)a3;
- (NUDataSet)initWithValues:(const double *)a3 count:(int64_t)a4;
- (const)_const_data;
- (double)coefficientOfVariation;
- (double)confidenceInterval95;
- (double)estimatedCoefficientOfVariation;
- (double)estimatedConfidenceInterval95;
- (double)estimatedStandardDeviation;
- (double)estimatedStandardError;
- (double)geometricMean;
- (double)max;
- (double)mean;
- (double)median;
- (double)medianAbsoluteDeviation;
- (double)min;
- (double)percentile:(double)a3;
- (double)standardDeviation;
- (double)standardError;
- (double)sum;
- (double)valueAtIndex:(int64_t)a3;
- (double)variance;
- (id).cxx_construct;
- (id)description;
- (id)filter:(id)a3;
- (id)map:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)count;
- (unint64_t)hash;
- (void)_resetStats;
- (void)enumerateValues:(id)a3;
@end

@implementation NUDataSet

- (id).cxx_construct
{
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_data._values.__begin_;
  if (begin)
  {
    self->_data._values.__end_ = begin;
    operator delete(begin);
  }
}

- (id)map:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v11 = NUAssertLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "mapper != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        __int16 v30 = 2114;
        v31 = v20;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet map:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 349, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"mapper != nil");
  }
  v5 = [[NUMutableDataSet alloc] initWithCapacity:[(NUDataSet *)self count]];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __17__NUDataSet_map___block_invoke;
  v25[3] = &unk_1E5D95188;
  v6 = v5;
  v26 = v6;
  id v7 = v4;
  id v27 = v7;
  [(NUDataSet *)self enumerateValues:v25];
  v8 = v27;
  v9 = v6;

  return v9;
}

uint64_t __17__NUDataSet_map___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return objc_msgSend(v1, "addValue:");
}

- (id)filter:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v11 = NUAssertLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "filter != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        __int16 v30 = 2114;
        v31 = v20;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet filter:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 334, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"filter != nil");
  }
  v5 = [[NUMutableDataSet alloc] initWithCapacity:[(NUDataSet *)self count]];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __20__NUDataSet_filter___block_invoke;
  v25[3] = &unk_1E5D95188;
  id v6 = v4;
  id v27 = v6;
  id v7 = v5;
  v26 = v7;
  [(NUDataSet *)self enumerateValues:v25];
  v8 = v26;
  v9 = v7;

  return v9;
}

uint64_t __20__NUDataSet_filter___block_invoke(uint64_t a1, double a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    v5 = *(void **)(a1 + 32);
    return [v5 addValue:a2];
  }
  return result;
}

- (double)percentile:(double)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0)
  {
    v5 = NUAssertLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "p >= 0.0");
      *(_DWORD *)buf = 138543362;
      v34 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v8 = NUAssertLogger();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v34 = v19;
        __int16 v35 = 2114;
        v36 = v21;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v34 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet percentile:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 326, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"p >= 0.0");
  }
  if (a3 > 1.0)
  {
    v12 = NUAssertLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "p <= 1.0");
      *(_DWORD *)buf = 138543362;
      v34 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v15 = NUAssertLogger();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v16)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v34 = v26;
        __int16 v35 = 2114;
        v36 = v28;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v34 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet percentile:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 327, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"p <= 1.0");
  }
  p_data = &self->_data;

  return NU::Percentile((NU *)p_data, (const NU::DataSet *)a2, a3);
}

- (double)estimatedCoefficientOfVariation
{
  [(NUDataSet *)self median];
  double v4 = v3;
  [(NUDataSet *)self estimatedStandardDeviation];
  return v5 / v4;
}

- (double)estimatedConfidenceInterval95
{
  unsigned int v3 = [(NUDataSet *)self count];
  if (v3 >= 2)
  {
    int v5 = v3 - 1;
    if (v3 - 1 >= 0x1F4) {
      int v5 = 500;
    }
    double v4 = gT95[v5 - 1];
  }
  else
  {
    double v4 = NAN;
  }
  [(NUDataSet *)self estimatedStandardError];
  return v4 * v6;
}

- (double)estimatedStandardError
{
  [(NUDataSet *)self estimatedStandardDeviation];
  double v4 = v3;
  uint64_t v5 = [(NUDataSet *)self count];
  if (v5) {
    return v4 / sqrt((double)v5);
  }
  else {
    return 0.0;
  }
}

- (double)estimatedStandardDeviation
{
  [(NUDataSet *)self medianAbsoluteDeviation];
  return v2 * 1.4826;
}

- (double)medianAbsoluteDeviation
{
  if ((*(_WORD *)&self->_flags & 0x800) == 0)
  {
    [(NUDataSet *)self median];
    NU::operator+((uint64_t)&self->_data, &v9, -v3);
    double v6 = v9;
    uint64_t v5 = v10;
    if (v9 != v10)
    {
      id v7 = v9;
      do
      {
        *id v7 = fabs(*v7);
        ++v7;
      }
      while (v7 != v5);
    }
    self->_stats.mad = NU::Percentile((NU *)&v9, v4, 0.5);
    if (v6) {
      operator delete(v6);
    }
  }
  return self->_stats.mad;
}

- (double)coefficientOfVariation
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0) {
    return self->_stats.cv;
  }
  [(NUDataSet *)self mean];
  double v4 = v3;
  [(NUDataSet *)self standardDeviation];
  double result = v5 / v4;
  self->_stats.cv = result;
  *(_WORD *)&self->_flags |= 0x400u;
  return result;
}

- (double)confidenceInterval95
{
  if ((*(_WORD *)&self->_flags & 0x200) != 0) {
    return self->_stats.ci95;
  }
  unsigned int v3 = [(NUDataSet *)self count];
  if (v3 >= 2)
  {
    int v6 = v3 - 1;
    if (v3 - 1 >= 0x1F4) {
      int v6 = 500;
    }
    double v4 = gT95[v6 - 1];
  }
  else
  {
    double v4 = NAN;
  }
  [(NUDataSet *)self standardError];
  double result = v4 * v7;
  self->_stats.ci95 = result;
  *(_WORD *)&self->_flags |= 0x200u;
  return result;
}

- (double)standardError
{
  if ((*(_WORD *)&self->_flags & 0x100) != 0) {
    return self->_stats.stderr;
  }
  [(NUDataSet *)self standardDeviation];
  double v4 = v3;
  uint64_t v5 = [(NUDataSet *)self count];
  if (v5) {
    double result = v4 / sqrt((double)v5);
  }
  else {
    double result = 0.0;
  }
  self->_stats.stderr = result;
  *(_WORD *)&self->_flags |= 0x100u;
  return result;
}

- (double)standardDeviation
{
  if ((*(_WORD *)&self->_flags & 0x80) != 0) {
    return self->_stats.stddev;
  }
  [(NUDataSet *)self variance];
  double result = sqrt(v3);
  self->_stats.stddev = result;
  *(_WORD *)&self->_flags |= 0x80u;
  return result;
}

- (double)variance
{
  if ((*(_WORD *)&self->_flags & 0x40) != 0) {
    return self->_stats.variance;
  }
  [(NUDataSet *)self mean];
  double result = NU::Variance((NU *)&self->_data, v3, v4);
  self->_stats.variance = result;
  *(_WORD *)&self->_flags |= 0x40u;
  return result;
}

- (double)max
{
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    return self->_stats.max;
  }
  double result = NU::Max(&self->_data._values.__begin_, (const DataSet *)a2);
  self->_stats.max = result;
  *(_WORD *)&self->_flags |= 4u;
  return result;
}

- (double)min
{
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    return self->_stats.min;
  }
  double result = NU::Min(&self->_data._values.__begin_, (const DataSet *)a2);
  self->_stats.min = result;
  *(_WORD *)&self->_flags |= 2u;
  return result;
}

- (double)median
{
  if ((*(_WORD *)&self->_flags & 0x20) != 0) {
    return self->_stats.median;
  }
  double result = NU::Percentile((NU *)&self->_data, (const NU::DataSet *)a2, 0.5);
  self->_stats.median = result;
  *(_WORD *)&self->_flags |= 0x20u;
  return result;
}

- (double)geometricMean
{
  if ((*(_WORD *)&self->_flags & 0x10) != 0) {
    return self->_stats.geomean;
  }
  double result = NU::GeometricMean((NU *)&self->_data, (const NU::DataSet *)a2);
  self->_stats.geomean = result;
  *(_WORD *)&self->_flags |= 0x10u;
  return result;
}

- (double)mean
{
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    return self->_stats.mean;
  }
  double v3 = NU::Sum(&self->_data._values.__begin_, (const DataSet *)a2);
  int64_t v4 = (char *)self->_data._values.__end_ - (char *)self->_data._values.__begin_;
  if (v4) {
    double result = v3 / (double)(v4 >> 3);
  }
  else {
    double result = 0.0;
  }
  self->_stats.mean = result;
  *(_WORD *)&self->_flags |= 8u;
  return result;
}

- (double)sum
{
  if (*(_WORD *)&self->_flags) {
    return self->_stats.sum;
  }
  double result = NU::Sum(&self->_data._values.__begin_, (const DataSet *)a2);
  self->_stats.sum = result;
  *(_WORD *)&self->_flags |= 1u;
  return result;
}

- (void)_resetStats
{
  *(_WORD *)&self->_flags = 0;
}

- (BOOL)isEqualToDataSet:(id)a3
{
  int64_t v4 = a3;
  if (v4
    && (begin = self->_data._values.__begin_,
        end = self->_data._values.__end_,
        double v7 = (double *)v4[14],
        (char *)end - (char *)begin == v4[15] - (void)v7))
  {
    if (begin == end)
    {
      BOOL v10 = 1;
    }
    else
    {
      v8 = begin + 1;
      do
      {
        double v9 = *v7++;
        BOOL v10 = *(v8 - 1) == v9;
        BOOL v11 = *(v8 - 1) != v9 || v8 == end;
        ++v8;
      }
      while (!v11);
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUDataSet *)self isEqualToDataSet:v4];

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)NUDataSet;
  return [(NUDataSet *)&v3 hash];
}

- (void)enumerateValues:(id)a3
{
  int v6 = (void (**)(double))a3;
  begin = self->_data._values.__begin_;
  for (i = self->_data._values.__end_; begin != i; ++begin)
    v6[2](*begin);
}

- (double)valueAtIndex:(int64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a3 < 0)
  {
    int v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "index >= 0");
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v9 = NUAssertLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v35 = v20;
        __int16 v36 = 2114;
        uint64_t v37 = v22;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      BOOL v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet valueAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 126, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"index >= 0");
  }
  if ([(NUDataSet *)self count] <= a3)
  {
    v13 = NUAssertLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "index < self.count");
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v16 = NUAssertLogger();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        id v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v35 = v27;
        __int16 v36 = 2114;
        uint64_t v37 = v29;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet valueAtIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 127, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"index < self.count");
  }
  return self->_data._values.__begin_[a3];
}

- (int64_t)count
{
  return self->_data._values.__end_ - self->_data._values.__begin_;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p count=%lu>", objc_opt_class(), self, -[NUDataSet count](self, "count")];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[NUMutableDataSet allocWithZone:a3];

  return [(NUDataSet *)v4 initWithDataSet:self];
}

- (NUDataSet)initWithDataSet:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = (NUDataSet *)a3;
  if (!v4)
  {
    id v27 = NUAssertLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      *(_DWORD *)buf = 138543362;
      v43 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v30 = NUAssertLogger();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v43 = v34;
        __int16 v44 = 2114;
        v45 = v36;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v43 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUDataSet initWithDataSet:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 92, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"other != nil");
  }
  v41.receiver = self;
  v41.super_class = (Class)NUDataSet;
  BOOL v5 = [(NUDataSet *)&v41 init];
  int v6 = v5;
  if (v5 != v4)
  {
    p_data = &v5->_data;
    begin = v5->_data._values.__begin_;
    double v9 = v4->_data._values.__begin_;
    end = v4->_data._values.__end_;
    size_t v11 = (char *)end - (char *)v9;
    unint64_t v12 = end - v9;
    uint64_t value = (uint64_t)v5->_data._values.__end_cap_.__value_;
    if (v12 <= (value - (uint64_t)begin) >> 3)
    {
      p_end = (void **)&v5->_data._values.__end_;
      BOOL v17 = v5->_data._values.__end_;
      unint64_t v18 = v17 - begin;
      if (v18 < v12)
      {
        v19 = &v9[v18];
        if (v17 != begin)
        {
          memmove(v5->_data._values.__begin_, v4->_data._values.__begin_, (char *)v17 - (char *)begin);
          begin = (double *)*p_end;
        }
        size_t v11 = (char *)end - (char *)v19;
        if (end == v19) {
          goto LABEL_21;
        }
        v20 = begin;
        uint64_t v21 = v19;
        goto LABEL_20;
      }
    }
    else
    {
      if (begin)
      {
        v5->_data._values.__end_ = begin;
        operator delete(begin);
        uint64_t value = 0;
        p_data->_values.__begin_ = 0;
        v6->_data._values.__end_ = 0;
        v6->_data._values.__end_cap_.__value_ = 0;
      }
      if ((v11 & 0x8000000000000000) != 0) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v14 = value >> 2;
      if (value >> 2 <= v12) {
        uint64_t v14 = end - v9;
      }
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v14;
      }
      std::vector<double>::__vallocate[abi:ne180100](&v6->_data._values.__begin_, v15);
      p_end = (void **)&v6->_data._values.__end_;
      begin = v6->_data._values.__end_;
    }
    if (end == v9)
    {
LABEL_21:
      *p_end = (char *)begin + v11;
      goto LABEL_22;
    }
    v20 = begin;
    uint64_t v21 = v9;
LABEL_20:
    memmove(v20, v21, v11);
    goto LABEL_21;
  }
LABEL_22:
  long long v22 = *(_OWORD *)&v4->_stats.sum;
  *(_OWORD *)&v6->_stats.max = *(_OWORD *)&v4->_stats.max;
  *(_OWORD *)&v6->_stats.sum = v22;
  long long v23 = *(_OWORD *)&v4->_stats.geomean;
  long long v24 = *(_OWORD *)&v4->_stats.variance;
  long long v25 = *(_OWORD *)&v4->_stats.stderr;
  *(_OWORD *)&v6->_stats.cv = *(_OWORD *)&v4->_stats.cv;
  *(_OWORD *)&v6->_stats.stderr = v25;
  *(_OWORD *)&v6->_stats.variance = v24;
  *(_OWORD *)&v6->_stats.geomean = v23;
  v6->_flags = v4->_flags;

  return v6;
}

- (NUDataSet)initWithValues:(const double *)a3 count:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v10 = NUAssertLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      size_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "values != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        long long v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      unint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v26 = "values != NULL";
    uint64_t v27 = 80;
LABEL_25:

    _NUAssertFailHandler((uint64_t)"-[NUDataSet initWithValues:count:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", v27, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)v26);
  }
  if (!a4)
  {
    BOOL v17 = NUAssertLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "count != 0");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger();
    BOOL v20 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v20)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v30;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v26 = "count != 0";
    uint64_t v27 = 81;
    goto LABEL_25;
  }
  v35.receiver = self;
  v35.super_class = (Class)NUDataSet;
  int v6 = [(NUDataSet *)&v35 init];
  if ((unint64_t)a4 >> 61) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  double v7 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a4);
  memmove(v7, a3, 8 * a4);
  memset(buf, 0, sizeof(buf));
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(buf, v7, (uint64_t)v7 + 8 * a4, (8 * a4) >> 3);
  begin = v6->_data._values.__begin_;
  if (begin)
  {
    v6->_data._values.__end_ = begin;
    operator delete(begin);
    v6->_data._values.__begin_ = 0;
    v6->_data._values.__end_ = 0;
    v6->_data._values.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v6->_data._values.__begin_ = *(_OWORD *)buf;
  v6->_data._values.__end_cap_.__value_ = *(double **)&buf[16];
  if (v7) {
    operator delete(v7);
  }
  return v6;
}

- (NUDataSet)initWithValue:(double)a3
{
  double v4 = a3;
  return [(NUDataSet *)self initWithValues:&v4 count:1];
}

- (NUDataSet)init
{
  v3.receiver = self;
  v3.super_class = (Class)NUDataSet;
  return [(NUDataSet *)&v3 init];
}

- (const)_const_data
{
  return &self->_data;
}

@end