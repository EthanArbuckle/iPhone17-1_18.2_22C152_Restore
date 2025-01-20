@interface RTLearnedLocationStoreMetrics
- (unint64_t)placeCountDevice;
- (unint64_t)placeCountTotal;
- (unint64_t)visitCountDevice;
- (unint64_t)visitCountTotal;
- (void)setPlaceCountDevice:(unint64_t)a3;
- (void)setPlaceCountTotal:(unint64_t)a3;
- (void)setVisitCountDevice:(unint64_t)a3;
- (void)setVisitCountTotal:(unint64_t)a3;
@end

@implementation RTLearnedLocationStoreMetrics

- (unint64_t)visitCountDevice
{
  return self->_visitCountDevice;
}

- (void)setVisitCountDevice:(unint64_t)a3
{
  self->_visitCountDevice = a3;
}

- (unint64_t)visitCountTotal
{
  return self->_visitCountTotal;
}

- (void)setVisitCountTotal:(unint64_t)a3
{
  self->_visitCountTotal = a3;
}

- (unint64_t)placeCountDevice
{
  return self->_placeCountDevice;
}

- (void)setPlaceCountDevice:(unint64_t)a3
{
  self->_placeCountDevice = a3;
}

- (unint64_t)placeCountTotal
{
  return self->_placeCountTotal;
}

- (void)setPlaceCountTotal:(unint64_t)a3
{
  self->_placeCountTotal = a3;
}

@end