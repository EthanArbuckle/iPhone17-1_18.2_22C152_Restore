@interface SSCAMetalLayerOnGlassDrawableInterval
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)debugDescription;
- (SSCAMetalLayerOnGlassDrawableInterval)initWithSignpostInterval:(id)a3;
- (SSInFlightCAMetalDrawableInterval)inFlightDrawableInterval;
- (_SSCAMLTimeInterval)backingInterval;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)instantaneousFramesPerSecond;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (float)durationSeconds;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
@end

@implementation SSCAMetalLayerOnGlassDrawableInterval

- (double)startSeconds
{
  unint64_t v3 = [(SSCAMetalLayerOnGlassDrawableInterval *)self startMachContinuousTime];
  [(SSCAMetalLayerOnGlassDrawableInterval *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3 = [(SSCAMetalLayerOnGlassDrawableInterval *)self endMachContinuousTime];
  [(SSCAMetalLayerOnGlassDrawableInterval *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(SSCAMetalLayerOnGlassDrawableInterval *)self endMachContinuousTime];
  return v3 - [(SSCAMetalLayerOnGlassDrawableInterval *)self startMachContinuousTime];
}

- (float)durationSeconds
{
  [(SSCAMetalLayerOnGlassDrawableInterval *)self endSeconds];
  double v4 = v3;
  [(SSCAMetalLayerOnGlassDrawableInterval *)self startSeconds];
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  [(SSCAMetalLayerOnGlassDrawableInterval *)self startSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  [(SSCAMetalLayerOnGlassDrawableInterval *)self endSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  [(SSCAMetalLayerOnGlassDrawableInterval *)self durationSeconds];
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  [(SSCAMetalLayerOnGlassDrawableInterval *)self startSeconds];
  return v2 * 1000.0;
}

- (double)endMs
{
  [(SSCAMetalLayerOnGlassDrawableInterval *)self endSeconds];
  return v2 * 1000.0;
}

- (double)durationMs
{
  [(SSCAMetalLayerOnGlassDrawableInterval *)self durationSeconds];
  return (float)(v2 * 1000.0);
}

- (NSDate)startDate
{
  float v2 = [(SSCAMetalLayerOnGlassDrawableInterval *)self backingInterval];
  double v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  float v2 = [(SSCAMetalLayerOnGlassDrawableInterval *)self backingInterval];
  double v3 = [v2 endDate];

  return (NSDate *)v3;
}

- (unint64_t)startMachContinuousTime
{
  float v2 = [(SSCAMetalLayerOnGlassDrawableInterval *)self backingInterval];
  unint64_t v3 = [v2 startMachContinuousTime];

  return v3;
}

- (unint64_t)endMachContinuousTime
{
  float v2 = [(SSCAMetalLayerOnGlassDrawableInterval *)self backingInterval];
  unint64_t v3 = [v2 endMachContinuousTime];

  return v3;
}

- (double)timebaseRatio
{
  float v2 = [(SSCAMetalLayerOnGlassDrawableInterval *)self backingInterval];
  [v2 timebaseRatio];
  double v4 = v3;

  return v4;
}

- (SSCAMetalLayerOnGlassDrawableInterval)initWithSignpostInterval:(id)a3
{
  id v4 = a3;
  double v5 = [_SSCAMLTimeInterval alloc];
  uint64_t v6 = [v4 startMachContinuousTime];
  uint64_t v7 = [v4 endMachContinuousTime];
  v8 = [v4 beginDate];
  v9 = [v4 endDate];
  [v4 timebaseRatio];
  v10 = -[_SSCAMLTimeInterval initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:](v5, "initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:", v6, v7, v8, v9);

  if (v10)
  {
    v11 = [[SSInFlightCAMetalDrawableInterval alloc] initWithOnGlassSignpostInterval:v4];
    if (v11)
    {
      v16.receiver = self;
      v16.super_class = (Class)SSCAMetalLayerOnGlassDrawableInterval;
      v12 = [(SSCAMetalLayerOnGlassDrawableInterval *)&v16 init];
      p_isa = (id *)&v12->super.isa;
      if (v12)
      {
        objc_storeStrong((id *)&v12->_backingInterval, v10);
        objc_storeStrong(p_isa + 1, v11);
      }
      self = p_isa;
      v14 = self;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  double v3 = _timeIntervalDict(self);
  id v4 = [(SSCAMetalLayerOnGlassDrawableInterval *)self inFlightDrawableInterval];
  double v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:kSSCAMetalLayerOnGlassDrawableIntervalKey_InFlightDrawableInfo];

  uint64_t v6 = NSNumber;
  [(SSCAMetalLayerOnGlassDrawableInterval *)self instantaneousFramesPerSecond];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:kSSCAMetalLayerOnGlassDrawableIntervalKey_InstantaneousFramesPerSecond];

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMetalLayerOnGlassDrawableInterval *)self jsonDescription:3];
}

- (SSInFlightCAMetalDrawableInterval)inFlightDrawableInterval
{
  return self->_inFlightDrawableInterval;
}

- (double)instantaneousFramesPerSecond
{
  return self->_instantaneousFramesPerSecond;
}

- (_SSCAMLTimeInterval)backingInterval
{
  return self->_backingInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingInterval, 0);

  objc_storeStrong((id *)&self->_inFlightDrawableInterval, 0);
}

@end