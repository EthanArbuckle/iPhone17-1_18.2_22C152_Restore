@interface MNTraceLocationRow
- ($F24F406B2B787EFB06265DBA3D28CBD5)correctedCoordinate;
- (MNLocation)location;
- (MNLocationMatchInfo)matchInfo;
- (NSError)error;
- (double)correctedCourse;
- (double)timestamp;
- (int64_t)locationEventType;
- (unint64_t)originalMatchType;
- (void)setCorrectedCoordinate:(id)a3;
- (void)setCorrectedCourse:(double)a3;
- (void)setError:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationEventType:(int64_t)a3;
- (void)setMatchInfo:(id)a3;
- (void)setOriginalMatchType:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MNTraceLocationRow

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (MNLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (MNLocationMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void)setMatchInfo:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)correctedCoordinate
{
  double latitude = self->_correctedCoordinate.latitude;
  double longitude = self->_correctedCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCorrectedCoordinate:(id)a3
{
  self->_correctedCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (double)correctedCourse
{
  return self->_correctedCourse;
}

- (void)setCorrectedCourse:(double)a3
{
  self->_correctedCourse = a3;
}

- (int64_t)locationEventType
{
  return self->_locationEventType;
}

- (void)setLocationEventType:(int64_t)a3
{
  self->_locationEventType = a3;
}

- (unint64_t)originalMatchType
{
  return self->_originalMatchType;
}

- (void)setOriginalMatchType:(unint64_t)a3
{
  self->_originalMatchType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end