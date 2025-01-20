@interface TUIImpression
- ($F24F406B2B787EFB06265DBA3D28CBD5)timingAtIndex:(unint64_t)a3;
- (CGSize)size;
- (TUIIdentifier)identifier;
- (TUIImpression)initWithData:(id)a3 size:(CGSize)a4 identifier:(id)a5;
- (TUIImpression)initWithImpression:(id)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)description;
- (unint64_t)timingCount;
- (unint64_t)timingCountWithTime:(double)a3 threshold:(double)a4;
- (void)becameHiddenAtTime:(double)a3;
- (void)becameHiddenAtTime:(double)a3 threshold:(double)a4;
- (void)becameVisibleAtTime:(double)a3;
@end

@implementation TUIImpression

- (TUIImpression)initWithData:(id)a3 size:(CGSize)a4 identifier:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUIImpression;
  v12 = [(TUIImpression *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_data, a3);
    v14 = (TUIIdentifier *)[v11 copyWithZone:0];
    identifier = v13->_identifier;
    v13->_identifier = v14;

    v13->_visible = 0;
    v13->_size.CGFloat width = width;
    v13->_size.CGFloat height = height;
  }

  return v13;
}

- (TUIImpression)initWithImpression:(id)a3
{
  v4 = (char *)a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIImpression;
  v5 = [(TUIImpression *)&v11 init];
  v6 = (char *)v5;
  v7 = v5;
  if (v4 && v5)
  {
    objc_storeStrong(&v5->_data, *((id *)v4 + 5));
    if (v6 != v4) {
      sub_1366EC(v6 + 8, *((char **)v4 + 1), *((void *)v4 + 2), (uint64_t)(*((void *)v4 + 2) - *((void *)v4 + 1)) >> 4);
    }
    v7->_visible = v4[32];
    v8 = (TUIIdentifier *)[*((id *)v4 + 6) copyWithZone:0];
    identifier = v7->_identifier;
    v7->_identifier = v8;

    v7->_size = *(CGSize *)(v4 + 56);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return _[v4 initWithImpression:self];
}

- (unint64_t)timingCount
{
  return (self->_timings.__end_ - self->_timings.__begin_) >> 4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timingAtIndex:(unint64_t)a3
{
  begin = self->_timings.__begin_;
  double v4 = 0.0;
  double v5 = 0.0;
  if (a3 < (self->_timings.__end_ - begin) >> 4)
  {
    v6 = (double *)((char *)begin + 16 * a3);
    double v5 = *v6;
    double v4 = v6[1];
  }
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (void)becameVisibleAtTime:(double)a3
{
  if (!self->_visible)
  {
    p_end_cap = &self->_timings.__end_cap_;
    value = self->_timings.__end_cap_.__value_;
    self->_visible = 1;
    end = self->_timings.__end_;
    if (end >= value)
    {
      p_timings = &self->_timings;
      begin = self->_timings.__begin_;
      uint64_t v10 = (end - begin) >> 4;
      unint64_t v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 60) {
        sub_4484();
      }
      uint64_t v12 = value - begin;
      if (v12 >> 3 > v11) {
        unint64_t v11 = v12 >> 3;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        double v18 = a3;
        v14 = (char *)sub_21C3C((uint64_t)p_end_cap, v13);
        a3 = v18;
        v15 = v14;
        begin = self->_timings.__begin_;
        end = self->_timings.__end_;
      }
      else
      {
        v15 = 0;
      }
      v16 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v15[16 * v10];
      objc_super v17 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v15[16 * v13];
      *(int64x2_t *)v16 = vdupq_lane_s64(*(uint64_t *)&a3, 0);
      v7 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v16 + 16);
      if (end != begin)
      {
        do
        {
          *((_OWORD *)v16 - 1) = *((_OWORD *)end - 1);
          v16 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v16 - 16);
          end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 16);
        }
        while (end != begin);
        begin = p_timings->__begin_;
      }
      self->_timings.__begin_ = v16;
      self->_timings.__end_ = v7;
      self->_timings.__end_cap_.__value_ = v17;
      if (begin) {
        operator delete(begin);
      }
    }
    else
    {
      *(double *)end = a3;
      *((double *)end + 1) = a3;
      v7 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 16);
    }
    self->_timings.__end_ = v7;
  }
}

- (void)becameHiddenAtTime:(double)a3
{
}

- (void)becameHiddenAtTime:(double)a3 threshold:(double)a4
{
  if (self->_visible)
  {
    self->_visible = 0;
    end = self->_timings.__end_;
    if (self->_timings.__begin_ != end)
    {
      if (a3 - *((double *)end - 2) >= a4) {
        *((double *)end - 1) = a3;
      }
      else {
        self->_timings.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 16);
      }
    }
  }
}

- (unint64_t)timingCountWithTime:(double)a3 threshold:(double)a4
{
  begin = self->_timings.__begin_;
  end = self->_timings.__end_;
  unint64_t result = (end - begin) >> 4;
  BOOL v8 = !self->_visible || end == begin;
  if (!v8 && a3 - *((double *)end - 2) < a4) {
    --result;
  }
  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  double v5 = [(TUIImpression *)self data];
  unint64_t v6 = [(TUIImpression *)self timingCount];
  [(TUIImpression *)self size];
  v7 = NSStringFromCGSize(v11);
  BOOL v8 = +[NSString stringWithFormat:@"<%@: %p> [Data: %@] [Timing Count: %lu] [Size: %@]", v4, self, v5, v6, v7];

  return v8;
}

- (id)data
{
  return self->_data;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_data, 0);
  begin = self->_timings.__begin_;
  if (begin)
  {
    self->_timings.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end