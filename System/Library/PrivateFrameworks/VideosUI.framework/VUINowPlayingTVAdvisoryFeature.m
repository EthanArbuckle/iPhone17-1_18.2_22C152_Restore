@interface VUINowPlayingTVAdvisoryFeature
- (BOOL)isEqual:(id)a3;
- (BOOL)isSkippable;
- (NSArray)advisoryDisabledTimeRanges;
- (VUINowPlayingTVAdvisoryFeature)initWithType:(unint64_t)a3 startTime:(double)a4 duration:(double)a5;
- (unint64_t)hash;
- (void)setAdvisoryDisabledTimeRanges:(id)a3;
@end

@implementation VUINowPlayingTVAdvisoryFeature

- (VUINowPlayingTVAdvisoryFeature)initWithType:(unint64_t)a3 startTime:(double)a4 duration:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)VUINowPlayingTVAdvisoryFeature;
  return [(VUINowPlayingTimeBoundFeature *)&v6 initWithType:a3 startTime:a4 duration:a5];
}

- (BOOL)isSkippable
{
  return 0;
}

- (unint64_t)hash
{
  v2 = _sFeatureTypeDescription([(VUINowPlayingTimeBoundFeature *)self type]);
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VUINowPlayingTVAdvisoryFeature *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    unint64_t v7 = [(VUINowPlayingTimeBoundFeature *)self type];
    if (v7 == [(VUINowPlayingTimeBoundFeature *)v6 type]
      && ([(VUINowPlayingTimeBoundFeature *)self startTime],
          double v9 = v8,
          [(VUINowPlayingTimeBoundFeature *)v6 startTime],
          v9 == v10)
      && ([(VUINowPlayingTimeBoundFeature *)self duration],
          double v12 = v11,
          [(VUINowPlayingTimeBoundFeature *)v6 duration],
          v12 == v13))
    {
      v14 = [(VUINowPlayingTVAdvisoryFeature *)self advisoryDisabledTimeRanges];
      v15 = [(VUINowPlayingTVAdvisoryFeature *)v6 advisoryDisabledTimeRanges];
      BOOL v16 = v14 == v15;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (NSArray)advisoryDisabledTimeRanges
{
  return self->_advisoryDisabledTimeRanges;
}

- (void)setAdvisoryDisabledTimeRanges:(id)a3
{
}

- (void).cxx_destruct
{
}

@end