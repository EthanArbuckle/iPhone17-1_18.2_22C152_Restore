@interface FMDRequestCurrentLocation
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (BOOL)finalLocation;
- (FMDLocation)location;
- (FMDRequestCurrentLocation)initWithAccount:(id)a3 location:(id)a4 finalLocation:(BOOL)a5 reason:(int64_t)a6 accuracyChange:(double)a7 cacheValidityDuration:(double)a8;
- (double)accuracyChange;
- (double)cacheValidityDuration;
- (id)requestBody;
- (id)urlTemplateType;
- (int64_t)maxConsecutiveNetworkNotificationRetries;
- (int64_t)maxNonNetworkRelatedRetries;
- (int64_t)maxTimerBasedNetworkRetries;
- (int64_t)publishReason;
- (void)setAccuracyChange:(double)a3;
- (void)setCacheValidityDuration:(double)a3;
- (void)setFinalLocation:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setPublishReason:(int64_t)a3;
@end

@implementation FMDRequestCurrentLocation

- (FMDRequestCurrentLocation)initWithAccount:(id)a3 location:(id)a4 finalLocation:(BOOL)a5 reason:(int64_t)a6 accuracyChange:(double)a7 cacheValidityDuration:(double)a8
{
  BOOL v11 = a5;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FMDRequestCurrentLocation;
  v15 = [(FMDRequest *)&v18 initWithAccount:a3];
  v16 = v15;
  if (v15)
  {
    [(FMDRequestCurrentLocation *)v15 setLocation:v14];
    [(FMDRequestCurrentLocation *)v16 setFinalLocation:v11];
    [(FMDRequestCurrentLocation *)v16 setPublishReason:a6];
    [(FMDRequestCurrentLocation *)v16 setAccuracyChange:a7];
    [(FMDRequestCurrentLocation *)v16 setCacheValidityDuration:a8];
  }

  return v16;
}

- (id)urlTemplateType
{
  return @"currentLocation";
}

- (id)requestBody
{
  v12.receiver = self;
  v12.super_class = (Class)FMDRequestCurrentLocation;
  v3 = [(FMDRequest *)&v12 requestBody];
  v4 = +[NSNumber numberWithInteger:qword_10031CBC8];
  [v3 setObject:v4 forKeyedSubscript:@"statusCode"];

  v5 = [(FMDRequestCurrentLocation *)self location];
  v6 = [v5 dictionaryValue];
  [v3 addEntriesFromDictionary:v6];

  v7 = +[NSNumber numberWithBool:[(FMDRequestCurrentLocation *)self finalLocation]];
  [v3 setObject:v7 forKeyedSubscript:@"locationFinished"];

  if ([(FMDRequestCurrentLocation *)self publishReason])
  {
    v8 = +[NSNumber numberWithInteger:[(FMDRequestCurrentLocation *)self publishReason]];
    [v3 setObject:v8 forKeyedSubscript:@"reason"];
  }
  [(FMDRequestCurrentLocation *)self accuracyChange];
  if (v9 != 0.0)
  {
    [(FMDRequestCurrentLocation *)self accuracyChange];
    v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v10 forKeyedSubscript:@"accuracyChange"];
  }

  return v3;
}

- (int64_t)maxTimerBasedNetworkRetries
{
  return 10;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return 10;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return 10;
}

- (BOOL)canRequestBeRetriedNow
{
  v3 = [(FMDRequestCurrentLocation *)self location];
  v4 = [v3 timeStamp];
  [(FMDRequestCurrentLocation *)self cacheValidityDuration];
  v5 = [v4 dateByAddingTimeInterval:];

  v6 = +[NSDate date];
  if ([v6 compare:v5] == (id)1)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)FMDRequestCurrentLocation;
    BOOL v7 = [(FMDRequest *)&v9 canRequestBeRetriedNow];
  }

  return v7;
}

- (BOOL)canReplace:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (FMDLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (BOOL)finalLocation
{
  return self->_finalLocation;
}

- (void)setFinalLocation:(BOOL)a3
{
  self->_finalLocation = a3;
}

- (int64_t)publishReason
{
  return self->_publishReason;
}

- (void)setPublishReason:(int64_t)a3
{
  self->_publishReason = a3;
}

- (double)accuracyChange
{
  return self->_accuracyChange;
}

- (void)setAccuracyChange:(double)a3
{
  self->_accuracyChange = a3;
}

- (double)cacheValidityDuration
{
  return self->_cacheValidityDuration;
}

- (void)setCacheValidityDuration:(double)a3
{
  self->_cacheValidityDuration = a3;
}

- (void).cxx_destruct
{
}

@end