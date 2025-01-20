@interface PLDataDensityClustering
- (PLDataDensityClustering)init;
- (double)maximumDistance;
- (unint64_t)minimumNumberOfObjects;
- (void)setMaximumDistance:(double)a3;
- (void)setMinimumNumberOfObjects:(unint64_t)a3;
@end

@implementation PLDataDensityClustering

- (void)setMinimumNumberOfObjects:(unint64_t)a3
{
  self->_minimumNumberOfObjects = a3;
}

- (unint64_t)minimumNumberOfObjects
{
  return self->_minimumNumberOfObjects;
}

- (void)setMaximumDistance:(double)a3
{
  self->_maximumDistance = a3;
}

- (double)maximumDistance
{
  return self->_maximumDistance;
}

- (PLDataDensityClustering)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLDataDensityClustering;
  result = [(PLDataDensityClustering *)&v3 init];
  if (result)
  {
    result->_maximumDistance = 50.0;
    result->_minimumNumberOfObjects = 2;
  }
  return result;
}

@end