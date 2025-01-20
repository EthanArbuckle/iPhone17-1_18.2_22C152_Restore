@interface PLMomentProcessingData
- (CLLocation)pl_location;
- (CLLocationCoordinate2D)pl_coordinate;
- (NSDate)pl_endDate;
- (NSDate)pl_startDate;
- (NSString)pl_uuid;
- (PLMomentProcessingData)initWithMoment:(id)a3;
- (signed)pl_originatorState;
- (unint64_t)pl_numberOfAssets;
- (unsigned)pl_locationType;
@end

@implementation PLMomentProcessingData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pl_location, 0);
  objc_storeStrong((id *)&self->_pl_endDate, 0);
  objc_storeStrong((id *)&self->_pl_startDate, 0);
  objc_storeStrong((id *)&self->_pl_uuid, 0);
}

- (unsigned)pl_locationType
{
  return self->_pl_locationType;
}

- (signed)pl_originatorState
{
  return self->_pl_originatorState;
}

- (CLLocationCoordinate2D)pl_coordinate
{
  double latitude = self->_pl_coordinate.latitude;
  double longitude = self->_pl_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CLLocation)pl_location
{
  return self->_pl_location;
}

- (unint64_t)pl_numberOfAssets
{
  return self->_pl_numberOfAssets;
}

- (NSDate)pl_endDate
{
  return self->_pl_endDate;
}

- (NSDate)pl_startDate
{
  return self->_pl_startDate;
}

- (NSString)pl_uuid
{
  return self->_pl_uuid;
}

- (PLMomentProcessingData)initWithMoment:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLMomentProcessingData;
  v5 = [(PLMomentProcessingData *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pl_uuid");
    pl_uuid = v5->_pl_uuid;
    v5->_pl_uuid = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "pl_startDate");
    pl_startDate = v5->_pl_startDate;
    v5->_pl_startDate = (NSDate *)v8;

    uint64_t v10 = objc_msgSend(v4, "pl_endDate");
    pl_endDate = v5->_pl_endDate;
    v5->_pl_endDate = (NSDate *)v10;

    v5->_pl_numberOfAssets = objc_msgSend(v4, "pl_numberOfAssets");
    uint64_t v12 = objc_msgSend(v4, "pl_location");
    pl_location = v5->_pl_location;
    v5->_pl_location = (CLLocation *)v12;

    objc_msgSend(v4, "pl_coordinate");
    v5->_pl_coordinate.double latitude = v14;
    v5->_pl_coordinate.double longitude = v15;
    v5->_pl_originatorState = objc_msgSend(v4, "pl_originatorState");
    v5->_pl_locationType = objc_msgSend(v4, "pl_locationType");
  }

  return v5;
}

@end