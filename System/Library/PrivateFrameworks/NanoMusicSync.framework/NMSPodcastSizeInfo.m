@interface NMSPodcastSizeInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NMSPodcastSizeInfo)init;
- (NMSPodcastSizeInfo)initWithCoder:(id)a3;
- (double)sizeDurationRatio;
- (double)totalDuration;
- (id)description;
- (unint64_t)averageSize;
- (unint64_t)count;
- (unint64_t)totalSize;
- (void)encodeWithCoder:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setTotalDuration:(double)a3;
- (void)setTotalSize:(unint64_t)a3;
@end

@implementation NMSPodcastSizeInfo

- (NMSPodcastSizeInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)NMSPodcastSizeInfo;
  result = [(NMSPodcastSizeInfo *)&v3 init];
  if (result)
  {
    result->_totalSize = 0;
    result->_totalDuration = 0.0;
    result->_count = 0;
  }
  return result;
}

- (double)sizeDurationRatio
{
  double totalDuration = self->_totalDuration;
  double result = 16000.0;
  if (fabs(totalDuration) >= 2.22044605e-16)
  {
    unint64_t totalSize = self->_totalSize;
    if (totalSize) {
      return (double)totalSize / totalDuration;
    }
  }
  return result;
}

- (unint64_t)averageSize
{
  unint64_t count = self->_count;
  unint64_t result = self->_totalSize;
  if (count) {
    result /= count;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NMSPodcastSizeInfo *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    unint64_t v7 = [(NMSPodcastSizeInfo *)self totalSize];
    if (v7 == [(NMSPodcastSizeInfo *)v6 totalSize]
      && ([(NMSPodcastSizeInfo *)self totalDuration],
          double v9 = v8,
          [(NMSPodcastSizeInfo *)v6 totalDuration],
          vabdd_f64(v9, v10) < 2.22044605e-16))
    {
      unint64_t v11 = [(NMSPodcastSizeInfo *)self count];
      BOOL v12 = v11 == [(NMSPodcastSizeInfo *)v6 count];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p totalSize:%llu totalDuration:%f count:%llu>", v5, self, self->_totalSize, *(void *)&self->_totalDuration, self->_count];

  return v6;
}

- (NMSPodcastSizeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMSPodcastSizeInfo;
  v5 = [(NMSPodcastSizeInfo *)&v11 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_totalSize);
    v5->_unint64_t totalSize = [v4 decodeInt64ForKey:v6];

    unint64_t v7 = NSStringFromSelector(sel_totalDuration);
    [v4 decodeDoubleForKey:v7];
    v5->_double totalDuration = v8;

    double v9 = NSStringFromSelector(sel_count);
    v5->_unint64_t count = [v4 decodeInt64ForKey:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t totalSize = self->_totalSize;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_totalSize);
  [v5 encodeInt64:totalSize forKey:v6];

  double totalDuration = self->_totalDuration;
  double v8 = NSStringFromSelector(sel_totalDuration);
  [v5 encodeDouble:v8 forKey:totalDuration];

  unint64_t count = self->_count;
  NSStringFromSelector(sel_count);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInt64:count forKey:v10];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(unint64_t)a3
{
  self->_unint64_t totalSize = a3;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(double)a3
{
  self->_double totalDuration = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_unint64_t count = a3;
}

@end