@interface NUHistogram
- ($F24F406B2B787EFB06265DBA3D28CBD5)range;
- (NUHistogram)init;
- (NUHistogram)initWithBinCount:(int64_t)a3 range:(id)a4;
- (NUHistogram)initWithHistogram:(id)a3;
- (const)values;
- (double)maximum;
- (double)median;
- (double)minimum;
- (double)mode;
- (double)percentile:(double)a3;
- (double)threshold:(double)a3;
- (id).cxx_construct;
- (id)_samplerForSampleMode:(int64_t)a3;
- (id)debugDescription;
- (id)modalityAnalysisWithLimit:(int64_t)a3 locality:(double)a4 sensitivity:(double)a5 sampleMode:(int64_t)a6;
- (id)modalityAnalysisWithLimit:(int64_t)a3 sampleMode:(int64_t)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)binCount;
- (int64_t)sampleCount;
@end

@implementation NUHistogram

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_histogram.__ptr_.__value_;
  self->_histogram.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<NU::Histogram<long,double>>::operator()[abi:ne180100]((uint64_t)value);
  }
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(NUHistogram *)self binCount];
  [(NUHistogram *)self range];
  uint64_t v7 = v6;
  [(NUHistogram *)self range];
  [v3 appendFormat:@"<%@:%p> count=%ld, range: [%0.3f..%0.3f], sampleCount=%ld\n", v4, self, v5, v7, v8, -[NUHistogram sampleCount](self, "sampleCount")];
  v9 = [(NUHistogram *)self values];
  uint64_t v10 = [(NUHistogram *)self binCount];
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      [(NUHistogram *)self range];
      double v13 = v12;
      [(NUHistogram *)self range];
      double v15 = v14;
      [(NUHistogram *)self range];
      objc_msgSend(v3, "appendFormat:", @"\t%4ld\t%0.3f\t%6ld\t%0.5f\n", i, v16 + (double)i / (double)(v10 - 1) * (v13 - v15), v9[i], (double)v9[i] / (double)-[NUHistogram sampleCount](self, "sampleCount"));
    }
  }

  return v3;
}

- (id)modalityAnalysisWithLimit:(int64_t)a3 locality:(double)a4 sensitivity:(double)a5 sampleMode:(int64_t)a6
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    v32 = NUAssertLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "limit > 0");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v35 = NUAssertLogger();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = [MEMORY[0x1E4F29060] callStackSymbols];
        v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v55;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogram modalityAnalysisWithLimit:locality:sensitivity:sampleMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 150, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"limit > 0");
  }
  if (a4 <= 0.0 || a4 > 1.0)
  {
    v39 = NUAssertLogger();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "0.0 < locality && locality <= 1.0");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v40;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v42 = NUAssertLogger();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (v41)
    {
      if (v43)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v61 = [MEMORY[0x1E4F29060] callStackSymbols];
        v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v62;
        _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v43)
    {
      v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v45;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogram modalityAnalysisWithLimit:locality:sensitivity:sampleMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 151, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)"0.0 < locality && locality <= 1.0");
  }
  if (a5 <= 0.0 || a5 > 1.0)
  {
    v46 = NUAssertLogger();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "0.0 < sensitivity && sensitivity <= 1.0");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v47;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v49 = NUAssertLogger();
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v67 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v68 = [MEMORY[0x1E4F29060] callStackSymbols];
        v69 = [v68 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v67;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v69;
        _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v50)
    {
      v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      v52 = [v51 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v52;
      _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogram modalityAnalysisWithLimit:locality:sensitivity:sampleMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 152, @"Invalid parameter not satisfying: %s", v70, v71, v72, v73, (uint64_t)"0.0 < sensitivity && sensitivity <= 1.0");
  }
  id v74 = [(NUHistogram *)self _samplerForSampleMode:a6];
  value = self->_histogram.__ptr_.__value_;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x4812000000;
  v81 = __Block_byref_object_copy__105;
  v82 = __Block_byref_object_dispose__106;
  v83 = &unk_1A9AA79AF;
  v85 = 0;
  v86 = 0;
  v84 = 0;
  if ((unint64_t)a3 >= 0xFFFFFFFFFFFFFFFLL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  double v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NU::Histogram<long,double>::Sample>>(a3 + 1);
  double v16 = (char *)v84;
  double v15 = v85;
  v17 = v13;
  if (v85 != v84)
  {
    do
    {
      *((_OWORD *)v17 - 1) = *((_OWORD *)v15 - 1);
      v17 -= 16;
      v15 -= 16;
    }
    while (v15 != v16);
    double v15 = (char *)v84;
  }
  v84 = v17;
  v85 = v13;
  v86 = &v13[16 * v14];
  if (v15) {
    operator delete(v15);
  }
  uint64_t v18 = value[5];
  uint64_t v19 = (uint64_t)(value[3] - value[2]) >> 3;
  uint64_t v20 = vcvtpd_s64_f64((double)v19 * a4);
  NU::Histogram<long,double>::Kernel::box(&v75, (v20 + (v20 < 0)) | 1);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3321888768;
  *(void *)&buf[16] = ___ZNK2NU9HistogramIldE16modalityAnalysisEmRKdS3_RU15__autoreleasingKU13block_pointerFllE_block_invoke;
  v88 = &unk_1F00100B8;
  v90 = value;
  __p = 0;
  v92 = 0;
  uint64_t v93 = 0;
  v21 = v75;
  std::vector<long>::__init_with_size[abi:ne180100]<long *,long *>(&__p, v75, v76, (v76 - (uint64_t)v75) >> 3);
  v95 = &v74;
  unint64_t v96 = vcvtmd_s64_f64((double)(v18 / v19) * a5);
  uint64_t v94 = v77;
  v89 = &v78;
  int64_t v97 = a3;
  NU::Histogram<long,double>::findAllModes((uint64_t)value, (uint64_t *)&v74, buf);
  v23 = (unsigned char *)v79[6];
  v22 = (unsigned char *)v79[7];
  int64_t v24 = v22 - v23;
  if (v22 == v23)
  {
    v25 = 0;
    v26 = 0;
  }
  else
  {
    if (v24 < 0) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NU::Histogram<long,double>::Sample>>(v24 >> 4);
    memmove(v25, v23, v24);
    v26 = &v25[16 * (v24 >> 4)];
  }
  if (__p)
  {
    v92 = __p;
    operator delete(__p);
  }
  if (v21) {
    operator delete(v21);
  }
  _Block_object_dispose(&v78, 8);
  if (v84)
  {
    v85 = (char *)v84;
    operator delete(v84);
  }
  if ((v26 - v25) >> 4 >= (unint64_t)a3) {
    int64_t v27 = a3;
  }
  else {
    int64_t v27 = (v26 - v25) >> 4;
  }
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v27];
  if (v27)
  {
    v29 = (double *)v25;
    do
    {
      v30 = [NSNumber numberWithDouble:*v29];
      [v28 addObject:v30];

      v29 += 2;
      --v27;
    }
    while (v27);
  }
  else if (!v25)
  {
    goto LABEL_35;
  }
  operator delete(v25);
LABEL_35:

  return v28;
}

- (id)modalityAnalysisWithLimit:(int64_t)a3 sampleMode:(int64_t)a4
{
  return [(NUHistogram *)self modalityAnalysisWithLimit:a3 locality:a4 sensitivity:0.05 sampleMode:0.1];
}

- (id)_samplerForSampleMode:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      value = self->_histogram.__ptr_.__value_;
      uint64_t v4 = (uint64_t)(value[3] - value[2]) >> 3;
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      int64_t v5 = ___ZNK2NU9HistogramIldE9zeroClampEv_block_invoke;
      goto LABEL_7;
    case 1:
      uint64_t v7 = NU::Histogram<long,double>::edgeClamp((uint64_t)self->_histogram.__ptr_.__value_);
      goto LABEL_8;
    case 2:
      value = self->_histogram.__ptr_.__value_;
      uint64_t v4 = (uint64_t)(value[3] - value[2]) >> 3;
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      int64_t v5 = ___ZNK2NU9HistogramIldE6mirrorEv_block_invoke;
      goto LABEL_7;
    case 3:
      value = self->_histogram.__ptr_.__value_;
      uint64_t v4 = (uint64_t)(value[3] - value[2]) >> 3;
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      int64_t v5 = ___ZNK2NU9HistogramIldE6repeatEv_block_invoke;
LABEL_7:
      double v12 = v5;
      double v13 = &__block_descriptor_48_e8_q16__0q8l;
      uint64_t v14 = value;
      uint64_t v15 = v4;
      uint64_t v7 = MEMORY[0x1AD0FAD00](&v10, a2);
LABEL_8:
      uint64_t v6 = (void *)v7;
      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  uint64_t v8 = (void *)MEMORY[0x1AD0FAD00](v6, a2);

  return v8;
}

- (double)mode
{
  value = self->_histogram.__ptr_.__value_;
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x4012000000;
  uint64_t v10 = __Block_byref_object_copy__24127;
  uint64_t v11 = __Block_byref_object_dispose__24128;
  double v12 = &unk_1A9AA79AF;
  uint64_t v13 = value[1];
  uint64_t v14 = 0;
  NU::Histogram<long,double>::edgeClamp((uint64_t)value);
  v5[4] = &v7;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___ZNK2NU9HistogramIldE4modeEv_block_invoke;
  v5[3] = &unk_1E5D95748;
  NU::Histogram<long,double>::findAllModes((uint64_t)value, (uint64_t *)&v6, v5);
  double v3 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (double)median
{
  [(NUHistogram *)self percentile:0.5];
  return result;
}

- (double)maximum
{
  return NU::Histogram<long,double>::maximum((uint64_t)self->_histogram.__ptr_.__value_);
}

- (double)minimum
{
  return NU::Histogram<long,double>::minimum((uint64_t)self->_histogram.__ptr_.__value_);
}

- (double)threshold:(double)a3
{
  value = (double *)self->_histogram.__ptr_.__value_;
  double v4 = 1.0;
  if (*value <= a3)
  {
    double v5 = value[1];
    double v4 = 0.0;
    if (v5 > a3)
    {
      uint64_t v6 = *((void *)value + 2);
      uint64_t v7 = (*((void *)value + 3) - v6) >> 3;
      int64_t v8 = vcvtmd_s64_f64((a3 - *value) / ((v5 - *value) / (double)v7));
      double v9 = 0.0;
      BOOL v10 = v7 <= v8;
      uint64_t v11 = v7 - v8;
      if (!v10)
      {
        uint64_t v12 = 0;
        uint64_t v13 = (uint64_t *)(v6 + 8 * v8);
        do
        {
          uint64_t v14 = *v13++;
          v12 += v14;
          --v11;
        }
        while (v11);
        double v9 = (double)v12;
      }
      return v9 / (double)*((uint64_t *)value + 5);
    }
  }
  return v4;
}

- (double)percentile:(double)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0 || a3 > 1.0)
  {
    v17 = NUAssertLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "p >= 0.0 && p <= 1.0");
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        int64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v24;
        __int16 v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogram percentile:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 94, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"p >= 0.0 && p <= 1.0");
  }
  value = (double *)self->_histogram.__ptr_.__value_;
  if (a3 <= 0.0)
  {
    return NU::Histogram<long,double>::minimum((uint64_t)value);
  }
  else if (a3 >= 1.0)
  {
    return NU::Histogram<long,double>::maximum((uint64_t)value);
  }
  else
  {
    uint64_t v5 = *((void *)value + 5);
    if (v5)
    {
      uint64_t v6 = *((void *)value + 2);
      uint64_t v7 = *((void *)value + 3) - v6;
      if (v7 < 1)
      {
        return *value;
      }
      else
      {
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        double v10 = (double)v5;
        int64_t v11 = llround((double)v5 * a3);
        uint64_t v12 = v7 >> 3;
        if (v7 >> 3 <= 1) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = v7 >> 3;
        }
        while (1)
        {
          uint64_t v14 = *(void *)(v6 + 8 * v9);
          if (v14 + v8 >= v11) {
            break;
          }
          ++v9;
          v8 += v14;
          if (v13 == v9) {
            return *value;
          }
        }
        double v16 = (value[1] - *value) / (double)v12;
        return *value + (double)v9 * v16 + -((double)v8 - a3 * v10) / (double)v14 * v16;
      }
    }
    else
    {
      return *value + a3 * (value[1] - *value);
    }
  }
}

- (const)values
{
  return (const int64_t *)*((void *)self->_histogram.__ptr_.__value_ + 2);
}

- (int64_t)sampleCount
{
  return *((void *)self->_histogram.__ptr_.__value_ + 5);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)range
{
  value = (double *)self->_histogram.__ptr_.__value_;
  double v3 = *value;
  double v4 = value[1];
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (int64_t)binCount
{
  return (uint64_t)(*((void *)self->_histogram.__ptr_.__value_ + 3) - *((void *)self->_histogram.__ptr_.__value_ + 2)) >> 3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = +[NUMutableHistogram allocWithZone:a3];

  return [(NUHistogram *)v4 initWithHistogram:self];
}

- (NUHistogram)initWithHistogram:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v19.receiver = self;
    v19.super_class = (Class)NUHistogram;
    [(NUHistogram *)&v19 init];
    operator new();
  }
  double v4 = NUAssertLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
    *(_DWORD *)buf = 138543362;
    BOOL v21 = v5;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v7 = NUAssertLogger();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v8)
    {
      int64_t v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      BOOL v21 = v11;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v10 = [v9 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v21 = v10;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  _NUAssertFailHandler((uint64_t)"-[NUHistogram initWithHistogram:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 51, @"Invalid parameter not satisfying: %s", v14, v15, v16, v17, (uint64_t)"other != nil");
}

- (NUHistogram)initWithBinCount:(int64_t)a3 range:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    double v4 = NUAssertLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "count > 0");
      buf[0] = 138543362;
      *(void *)&buf[1] = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v7 = NUAssertLogger();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        uint64_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
        objc_super v19 = [v18 componentsJoinedByString:@"\n"];
        buf[0] = 138543618;
        *(void *)&buf[1] = v17;
        __int16 v32 = 2114;
        __int16 v33 = v19;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v10 = [v9 componentsJoinedByString:@"\n"];
      buf[0] = 138543362;
      *(void *)&buf[1] = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    uint64_t v20 = "count > 0";
    uint64_t v21 = 38;
  }
  else
  {
    if (a4.var0 < a4.var1)
    {
      v30.receiver = self;
      v30.super_class = (Class)NUHistogram;
      [(NUHistogram *)&v30 init];
      operator new();
    }
    int64_t v11 = NUAssertLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "range.min < range.max");
      buf[0] = 138543362;
      *(void *)&buf[1] = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);
    }
    uint64_t v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v7 = NUAssertLogger();
    BOOL v14 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v14)
      {
        __int16 v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
        buf[0] = 138543618;
        *(void *)&buf[1] = v22;
        __int16 v32 = 2114;
        __int16 v33 = v24;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);
      }
    }
    else if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
      buf[0] = 138543362;
      *(void *)&buf[1] = v16;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);
    }
    uint64_t v20 = "range.min < range.max";
    uint64_t v21 = 39;
  }

  _NUAssertFailHandler((uint64_t)"-[NUHistogram initWithBinCount:range:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", v21, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)v20);
}

- (NUHistogram)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24121);
  }
  double v3 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    double v4 = NSString;
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(a2);
    BOOL v8 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v6, v7];
    *(_DWORD *)buf = 138543362;
    __int16 v22 = v8;
    _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24121);
    }
    uint64_t v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v12;
      __int16 v23 = 2114;
      uint64_t v24 = v14;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24121);
    }
    uint64_t v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64_t v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
  }

  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUHistogram init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUHistogram.mm", 33, @"Initializer not available: -[%@ %@], use designated initializer instead.", v17, v18, v19, v20, v16);
}

@end