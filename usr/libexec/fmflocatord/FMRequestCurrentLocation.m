@interface FMRequestCurrentLocation
+ (id)serializedFormOfLocation:(id)a3;
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (BOOL)finalLocation;
- (CLLocation)location;
- (FMRequestCurrentLocation)initWithProvider:(id)a3 location:(id)a4 finalLocation:(BOOL)a5 locateCommand:(id)a6 reason:(int64_t)a7 accuracyChange:(double)a8;
- (NSDictionary)locateCommand;
- (double)accuracyChange;
- (id)requestBody;
- (id)requestUrl;
- (int64_t)maxConsecutiveNetworkNotificationRetries;
- (int64_t)maxNonNetworkRelatedRetries;
- (int64_t)maxTimerBasedNetworkRetries;
- (int64_t)publishReason;
- (void)deinitializeRequest;
- (void)setAccuracyChange:(double)a3;
- (void)setFinalLocation:(BOOL)a3;
- (void)setLocateCommand:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPublishReason:(int64_t)a3;
@end

@implementation FMRequestCurrentLocation

- (void)deinitializeRequest
{
  v3.receiver = self;
  v3.super_class = (Class)FMRequestCurrentLocation;
  [(FMRequest *)&v3 deinitializeRequest];
  [(FMRequestCurrentLocation *)self setLocation:0];
  [(FMRequestCurrentLocation *)self setLocateCommand:0];
}

- (FMRequestCurrentLocation)initWithProvider:(id)a3 location:(id)a4 finalLocation:(BOOL)a5 locateCommand:(id)a6 reason:(int64_t)a7 accuracyChange:(double)a8
{
  BOOL v11 = a5;
  id v14 = a4;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)FMRequestCurrentLocation;
  v16 = [(FMRequest *)&v19 initWithProvider:a3];
  v17 = v16;
  if (v16)
  {
    [(FMRequestCurrentLocation *)v16 setLocation:v14];
    [(FMRequestCurrentLocation *)v17 setFinalLocation:v11];
    [(FMRequestCurrentLocation *)v17 setLocateCommand:v15];
    [(FMRequestCurrentLocation *)v17 setPublishReason:a7];
    [(FMRequestCurrentLocation *)v17 setAccuracyChange:a8];
  }

  return v17;
}

- (id)requestUrl
{
  v2 = [(FMRequest *)self provider];
  objc_super v3 = [v2 formattedURLForTemplate:@"${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/currentLocation"];

  return v3;
}

- (id)requestBody
{
  v18.receiver = self;
  v18.super_class = (Class)FMRequestCurrentLocation;
  objc_super v3 = [(FMRequest *)&v18 requestBody];
  [v3 setObject:&off_10005EF18 forKeyedSubscript:@"statusCode"];
  v4 = [(FMRequestCurrentLocation *)self location];
  v5 = +[FMRequestCurrentLocation serializedFormOfLocation:v4];
  [v3 addEntriesFromDictionary:v5];

  v6 = +[NSNumber numberWithBool:[(FMRequestCurrentLocation *)self finalLocation]];
  [v3 setObject:v6 forKeyedSubscript:@"locationFinished"];

  if ([(FMRequestCurrentLocation *)self publishReason])
  {
    v7 = +[NSNumber numberWithInteger:[(FMRequestCurrentLocation *)self publishReason]];
    [v3 setObject:v7 forKeyedSubscript:@"reason"];
  }
  [(FMRequestCurrentLocation *)self accuracyChange];
  [(FMRequestCurrentLocation *)self accuracyChange];
  if (fabs(v8) != INFINITY)
  {
    [(FMRequestCurrentLocation *)self accuracyChange];
    if (v9 > 0.0)
    {
      [(FMRequestCurrentLocation *)self accuracyChange];
      v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v3 setObject:v10 forKeyedSubscript:@"accuracyChange"];
    }
  }
  BOOL v11 = [(FMRequest *)self provider];
  v12 = [v11 standardDeviceContext];

  v13 = [(FMRequestCurrentLocation *)self locateCommand];
  id v14 = [v13 objectForKeyedSubscript:@"id"];

  [v12 fm_safelyMapKey:@"cmdId" toObject:v14];
  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"deviceContext"];
  }
  id v15 = [(FMRequest *)self provider];
  v16 = [v15 locationDeviceInfo];
  [v3 setObject:v16 forKeyedSubscript:@"deviceInfo"];

  return v3;
}

+ (id)serializedFormOfLocation:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  v5 = [v3 timestamp];
  v6 = [v5 stringValueForServer];

  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"timestamp"];
  }
  [v3 coordinate];
  v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v7 forKeyedSubscript:@"latitude"];

  [v3 coordinate];
  double v9 = +[NSNumber numberWithDouble:v8];
  [v4 setObject:v9 forKeyedSubscript:@"longitude"];

  [v3 horizontalAccuracy];
  v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v10 forKeyedSubscript:@"horizontalAccuracy"];

  [v3 verticalAccuracy];
  BOOL v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v11 forKeyedSubscript:@"vertAcc"];

  [v3 altitude];
  v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v12 forKeyedSubscript:@"alt"];

  [v3 speed];
  v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v13 forKeyedSubscript:@"speed"];

  [v3 course];
  id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v14 forKeyedSubscript:@"course"];

  id v15 = [v3 floor];
  v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 level]);
  [v4 setObject:v16 forKeyedSubscript:@"floorLevel"];

  v17 = +[CommonUtil stringForLocationType:](CommonUtil, "stringForLocationType:", [v3 type]);
  [v4 setObject:v17 forKeyedSubscript:@"positionType"];

  return v4;
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
  id v3 = [(FMRequestCurrentLocation *)self location];
  v4 = [v3 timestamp];
  v5 = [(FMRequestCurrentLocation *)self locateCommand];
  v6 = [v5 objectForKeyedSubscript:@"locationValidityDuration"];
  [v6 doubleValue];
  v7 = [v4 dateByAddingTimeInterval:x0];

  double v8 = +[NSDate date];
  if ([v8 compare:v7] == (id)1)
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)FMRequestCurrentLocation;
    BOOL v9 = [(FMRequest *)&v11 canRequestBeRetriedNow];
  }

  return v9;
}

- (BOOL)canReplace:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(FMRequest *)self delegate];
      v7 = [v5 delegate];
      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CLLocation)location
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

- (NSDictionary)locateCommand
{
  return self->_locateCommand;
}

- (void)setLocateCommand:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locateCommand, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end