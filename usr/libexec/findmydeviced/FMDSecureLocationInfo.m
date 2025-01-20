@interface FMDSecureLocationInfo
+ (id)stringFromPublishReason:(int64_t)a3;
- (BOOL)isLocationValid;
- (FMDDeviceMotion)motionInfo;
- (FMDSecureLocationInfo)initWithLocation:(id)a3 motion:(id)a4 publishReason:(int64_t)a5;
- (FMGeoLocatable)locationInfo;
- (id)convertToSecureLocationObject;
- (int64_t)_spMotionStateFrom:(int64_t)a3;
- (int64_t)_spPublishReasonFrom:(int64_t)a3;
- (int64_t)publishReason;
- (void)setLocationInfo:(id)a3;
- (void)setMotionInfo:(id)a3;
- (void)setPublishReason:(int64_t)a3;
@end

@implementation FMDSecureLocationInfo

- (FMDSecureLocationInfo)initWithLocation:(id)a3 motion:(id)a4 publishReason:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FMDSecureLocationInfo;
  v11 = [(FMDSecureLocationInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_locationInfo, a3);
    objc_storeStrong((id *)&v12->_motionInfo, a4);
    v12->_publishReason = a5;
  }

  return v12;
}

+ (id)stringFromPublishReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return @"unknown";
  }
  else {
    return off_1002DBF90[a3 - 1];
  }
}

- (id)convertToSecureLocationObject
{
  id v3 = objc_alloc_init((Class)SPSecureLocation);
  [v3 setFindMyId:&stru_1002E7428];
  v4 = [(FMGeoLocatable *)self->_locationInfo latitude];
  [v4 doubleValue];
  [v3 setLatitude:];

  v5 = [(FMGeoLocatable *)self->_locationInfo longitude];
  [v5 doubleValue];
  [v3 setLongitude:];

  v6 = [(FMGeoLocatable *)self->_locationInfo horizontalAccuracy];
  [v6 doubleValue];
  [v3 setHorizontalAccuracy:];

  v7 = [(FMGeoLocatable *)self->_locationInfo verticalAccuracy];
  [v7 doubleValue];
  [v3 setVerticalAccuracy:];

  v8 = [(FMGeoLocatable *)self->_locationInfo speed];
  [v8 doubleValue];
  [v3 setSpeed:];

  id v9 = [(FMGeoLocatable *)self->_locationInfo course];
  [v9 doubleValue];
  [v3 setCourse:];

  id v10 = [(FMGeoLocatable *)self->_locationInfo floor];
  [v3 setFloor:v10];

  v11 = [(FMGeoLocatable *)self->_locationInfo timestamp];
  if (v11)
  {
    [v3 setTimestamp:v11];
  }
  else
  {
    v12 = +[NSDate date];
    [v3 setTimestamp:v12];
  }
  v13 = [(FMDSecureLocationInfo *)self motionInfo];
  [v3 setMotionActivityState:-[FMDSecureLocationInfo _spMotionStateFrom:](self, "_spMotionStateFrom:", [v13 activityState])];

  [v3 setPublishReason:-[FMDSecureLocationInfo _spPublishReasonFrom:](self, "_spPublishReasonFrom:", -[FMDSecureLocationInfo publishReason](self, "publishReason"))];

  return v3;
}

- (BOOL)isLocationValid
{
  id v3 = [(FMGeoLocatable *)self->_locationInfo latitude];
  [v3 doubleValue];
  if (v4 == 0.0)
  {
    v5 = [(FMGeoLocatable *)self->_locationInfo longitude];
    [v5 doubleValue];
    BOOL v7 = v6 != 0.0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (int64_t)_spMotionStateFrom:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 5) {
    return 0;
  }
  else {
    return a3;
  }
}

- (int64_t)_spPublishReasonFrom:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xC) {
    return 0;
  }
  else {
    return a3;
  }
}

- (FMGeoLocatable)locationInfo
{
  return self->_locationInfo;
}

- (void)setLocationInfo:(id)a3
{
}

- (FMDDeviceMotion)motionInfo
{
  return self->_motionInfo;
}

- (void)setMotionInfo:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionInfo, 0);

  objc_storeStrong((id *)&self->_locationInfo, 0);
}

@end