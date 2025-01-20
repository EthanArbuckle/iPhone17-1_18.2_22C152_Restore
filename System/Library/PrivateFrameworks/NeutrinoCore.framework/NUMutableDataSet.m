@interface NUMutableDataSet
- (NUMutableDataSet)initWithCapacity:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)capacity;
- (void)_data;
- (void)addValue:(double)a3;
- (void)appendDataSet:(id)a3;
@end

@implementation NUMutableDataSet

- (void)appendDataSet:(id)a3
{
  v5 = (uint64_t **)a3;
  v38 = v5;
  if (!v5)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"NUDataSet.mm", 402, @"Invalid parameter not satisfying: %@", @"dataSet != nil" object file lineNumber description];

    v5 = 0;
  }
  v8 = v5[14];
  v7 = v5[15];
  if ((char *)v7 - (char *)v8 >= 1)
  {
    uint64_t v9 = v7 - v8;
    end = self->super._data._values.__end_;
    value = self->super._data._values.__end_cap_.__value_;
    if (v9 <= value - end)
    {
      if (v9 <= 0)
      {
        v20 = self->super._data._values.__end_;
        v21 = &end[v9];
        v22 = &v20[-v9];
        v23 = v20;
        if (v22 < end)
        {
          v23 = self->super._data._values.__end_;
          do
          {
            uint64_t v24 = *(void *)v22++;
            *(void *)v23++ = v24;
          }
          while (v22 < end);
        }
        self->super._data._values.__end_ = v23;
        if (v20 != v21) {
          memmove(&v20[-(v20 - v21)], end, (char *)v20 - (char *)v21);
        }
        size_t v6 = 8 * v9;
        if (&v8[v9] != v8) {
          memmove(end, v8, v6);
        }
      }
      else
      {
        v18 = v5[14];
        uint64_t v19 = (char *)v7 - (char *)v18;
        if (v7 != v18) {
          memmove(self->super._data._values.__end_, v8, (char *)v7 - (char *)v18);
        }
        self->super._data._values.__end_ = (double *)((char *)end + v19);
      }
    }
    else
    {
      begin = self->super._data._values.__begin_;
      uint64_t v13 = end - begin;
      if ((unint64_t)(v13 + v9) >> 61) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v14 = (char *)value - (char *)begin;
      uint64_t v15 = v14 >> 2;
      if (v14 >> 2 <= (unint64_t)(v13 + v9)) {
        uint64_t v15 = v13 + v9;
      }
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v16 = v15;
      }
      if (v16) {
        unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v16);
      }
      else {
        uint64_t v17 = 0;
      }
      v25 = (double *)(v16 + 8 * v13);
      v26 = &v25[v9];
      uint64_t v27 = 8 * v9;
      v28 = v25;
      do
      {
        uint64_t v29 = *v8++;
        *(void *)v28++ = v29;
        v27 -= 8;
      }
      while (v27);
      v30 = self->super._data._values.__begin_;
      if (v30 != end)
      {
        v31 = end;
        do
        {
          uint64_t v32 = *((void *)v31-- - 1);
          *((void *)v25-- - 1) = v32;
        }
        while (v31 != v30);
      }
      v33 = (double *)(v16 + 8 * v17);
      v34 = self->super._data._values.__end_;
      int64_t v35 = (char *)v34 - (char *)end;
      if (v34 != end) {
        memmove(v26, end, (char *)v34 - (char *)end);
      }
      v36 = self->super._data._values.__begin_;
      self->super._data._values.__begin_ = v25;
      self->super._data._values.__end_ = (double *)((char *)v26 + v35);
      self->super._data._values.__end_cap_.__value_ = v33;
      if (v36) {
        operator delete(v36);
      }
    }
  }
  [(NUDataSet *)self _resetStats];
}

- (void)addValue:(double)a3
{
  end = self->super._data._values.__end_;
  value = self->super._data._values.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->super._data._values.__begin_;
    uint64_t v9 = end - begin;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = (char *)value - (char *)begin;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    BOOL v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8;
    unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v12) {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v13);
      begin = self->super._data._values.__begin_;
      end = self->super._data._values.__end_;
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = (double *)(v13 + 8 * v9);
    unint64_t v16 = (double *)(v13 + 8 * v14);
    *uint64_t v15 = a3;
    v7 = v15 + 1;
    while (end != begin)
    {
      uint64_t v17 = *((void *)end-- - 1);
      *((void *)v15-- - 1) = v17;
    }
    self->super._data._values.__begin_ = v15;
    self->super._data._values.__end_ = v7;
    self->super._data._values.__end_cap_.__value_ = v16;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    double *end = a3;
    v7 = end + 1;
  }
  self->super._data._values.__end_ = v7;

  [(NUDataSet *)self _resetStats];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NUDataSet allocWithZone:a3];

  return [(NUDataSet *)v4 initWithDataSet:self];
}

- (int64_t)capacity
{
  return self->super._data._values.__end_cap_.__value_ - self->super._data._values.__begin_;
}

- (NUMutableDataSet)initWithCapacity:(int64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3 < 0)
  {
    uint64_t v17 = NUAssertLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "capacity >= 0");
      *(_DWORD *)buf = 138543362;
      v33 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v24;
        __int16 v34 = 2114;
        int64_t v35 = v26;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableDataSet initWithCapacity:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Statistics/NUDataSet.mm", 371, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"capacity >= 0");
  }
  v31.receiver = self;
  v31.super_class = (Class)NUMutableDataSet;
  v4 = [(NUDataSet *)&v31 init];
  v5 = v4;
  if (v4)
  {
    begin = v4->super._data._values.__begin_;
    if (a3 > (unint64_t)(v4->super._data._values.__end_cap_.__value_ - begin))
    {
      if ((unint64_t)a3 >> 61) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      end = v4->super._data._values.__end_;
      v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a3);
      uint64_t v9 = (double *)&v8[((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v11 = (double *)&v8[8 * v10];
      BOOL v12 = v5->super._data._values.__begin_;
      unint64_t v13 = v5->super._data._values.__end_;
      uint64_t v14 = v9;
      if (v13 != v12)
      {
        uint64_t v14 = v9;
        do
        {
          uint64_t v15 = *((void *)v13-- - 1);
          *((void *)v14-- - 1) = v15;
        }
        while (v13 != v12);
      }
      v5->super._data._values.__begin_ = v14;
      v5->super._data._values.__end_ = v9;
      v5->super._data._values.__end_cap_.__value_ = v11;
      if (v12) {
        operator delete(v12);
      }
    }
  }
  return v5;
}

- (void)_data
{
  return &self->super._data;
}

@end