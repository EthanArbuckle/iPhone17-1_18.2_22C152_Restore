@interface _UICollectionViewTrackedValueItem
- (double)timeStamp;
- (double)value;
- (void)setTimeStamp:(double)a3;
- (void)setValue:(double)a3;
@end

@implementation _UICollectionViewTrackedValueItem

- (double)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(double)a3
{
  self->_timeStamp = a3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

@end