@interface _CHWorkoutDetailTrackLapTableItem
- (CHWorkoutTrackLap)trackLap;
- (int64_t)lapIndex;
- (unint64_t)distanceUnit;
- (void)setDistanceUnit:(unint64_t)a3;
- (void)setLapIndex:(int64_t)a3;
- (void)setTrackLap:(id)a3;
@end

@implementation _CHWorkoutDetailTrackLapTableItem

- (int64_t)lapIndex
{
  return self->_lapIndex;
}

- (void)setLapIndex:(int64_t)a3
{
  self->_lapIndex = a3;
}

- (unint64_t)distanceUnit
{
  return self->_distanceUnit;
}

- (void)setDistanceUnit:(unint64_t)a3
{
  self->_distanceUnit = a3;
}

- (CHWorkoutTrackLap)trackLap
{
  return self->_trackLap;
}

- (void)setTrackLap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end