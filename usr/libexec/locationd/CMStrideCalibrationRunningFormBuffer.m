@interface CMStrideCalibrationRunningFormBuffer
+ (BOOL)isAvailable;
- (CMCalibrationTrackRawStrideLength)strideLengthFromStartDate:(id)a3 endDate:(id)a4;
- (id).cxx_construct;
- (void)ageOutFormMetrics;
- (void)feedRunningFormMetrics:(const FormMetrics *)a3;
@end

@implementation CMStrideCalibrationRunningFormBuffer

+ (BOOL)isAvailable
{
  sub_100103240();

  return sub_10010145C();
}

- (void)ageOutFormMetrics
{
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t value = self->fRunningFormMetrics.__size_.__value_;
  if (value)
  {
    double v5 = Current + -600.0;
    do
    {
      unint64_t start = self->fRunningFormMetrics.__start_;
      if (self->fRunningFormMetrics.__map_.__begin_[start / 0x14][start % 0x14].var8 >= v5) {
        break;
      }
      self->fRunningFormMetrics.__start_ = start + 1;
      self->fRunningFormMetrics.__size_.__value_ = value - 1;
      sub_100C64D30((uint64_t)&self->fRunningFormMetrics, 1);
      unint64_t value = self->fRunningFormMetrics.__size_.__value_;
    }
    while (value);
  }
}

- (void)feedRunningFormMetrics:(const FormMetrics *)a3
{
  [(CMStrideCalibrationRunningFormBuffer *)self ageOutFormMetrics];

  sub_100C64AA8(&self->fRunningFormMetrics.__map_.__first_, (uint64_t)a3);
}

- (CMCalibrationTrackRawStrideLength)strideLengthFromStartDate:(id)a3 endDate:(id)a4
{
  int v5 = 0;
  double v6 = 0.0;
  if (a3)
  {
    v8 = 0;
    if (a4)
    {
      [a3 timeIntervalSinceReferenceDate];
      double v10 = v9;
      [a4 timeIntervalSinceReferenceDate];
      unint64_t start = self->fRunningFormMetrics.__start_;
      begin = self->fRunningFormMetrics.__map_.__begin_;
      end = self->fRunningFormMetrics.__map_.__end_;
      v15 = &begin[start / 0x14];
      if (end == begin) {
        unint64_t v16 = 0;
      }
      else {
        unint64_t v16 = (unint64_t)&(*v15)[start % 0x14];
      }
      int v5 = 0;
      double v17 = 0.0;
LABEL_8:
      unint64_t v18 = v16 - 4000;
      while (1)
      {
        unint64_t v19 = end == begin
            ? 0
            : (unint64_t)&begin[(self->fRunningFormMetrics.__size_.__value_ + start) / 0x14][(self->fRunningFormMetrics.__size_.__value_ + start) % 0x14];
        if (v16 == v19) {
          break;
        }
        if ((*(_DWORD *)(v16 + 32) & 0xFFFFFFBF) == 0)
        {
          double v20 = *(double *)(v16 + 56);
          if (v20 >= v10 && v20 <= v11)
          {
            double v17 = v17 + *(double *)(v16 + 64);
            ++v5;
          }
        }
        v18 += 200;
        v16 += 200;
        if (*v15 == (FormMetrics *)v18)
        {
          unint64_t v22 = (unint64_t)v15[1];
          ++v15;
          unint64_t v16 = v22;
          goto LABEL_8;
        }
      }
      if (v5)
      {
        double v6 = v17 / (double)v5;
        v8 = &_mh_execute_header;
      }
      else
      {
        double v6 = 0.0;
        v8 = 0;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  unint64_t v23 = (unint64_t)v8 | v5;
  result.var1 = v23;
  result.var2 = BYTE4(v23);
  result.var0 = v6;
  return result;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end