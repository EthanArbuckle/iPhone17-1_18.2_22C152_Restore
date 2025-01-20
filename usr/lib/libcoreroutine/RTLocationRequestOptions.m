@interface RTLocationRequestOptions
- (BOOL)fallback;
- (BOOL)yieldLastLocation;
- (RTLocationRequestOptions)initWithDesiredAccuracy:(double)a3 horizontalAccuracy:(double)a4 maxAge:(double)a5 yieldLastLocation:(BOOL)a6 timeout:(double)a7 fallback:(BOOL)a8 fallbackHorizontalAccuracy:(double)a9 fallbackMaxAge:(double)a10;
- (double)desiredAccuracy;
- (double)fallbackHorizontalAccuracy;
- (double)fallbackMaxAge;
- (double)horizontalAccuracy;
- (double)maxAge;
- (double)timeout;
- (id)description;
@end

@implementation RTLocationRequestOptions

- (RTLocationRequestOptions)initWithDesiredAccuracy:(double)a3 horizontalAccuracy:(double)a4 maxAge:(double)a5 yieldLastLocation:(BOOL)a6 timeout:(double)a7 fallback:(BOOL)a8 fallbackHorizontalAccuracy:(double)a9 fallbackMaxAge:(double)a10
{
  v19.receiver = self;
  v19.super_class = (Class)RTLocationRequestOptions;
  result = [(RTLocationRequestOptions *)&v19 init];
  if (result)
  {
    result->_desiredAccuracy = a3;
    result->_horizontalAccuracy = a4;
    result->_yieldLastLocation = a6;
    result->_fallback = a8;
    result->_maxAge = a5;
    result->_fallbackHorizontalAccuracy = a9;
    result->_fallbackMaxAge = a10;
    result->_timeout = a7;
  }
  return result;
}

- (BOOL)yieldLastLocation
{
  return self->_yieldLastLocation;
}

- (double)timeout
{
  return self->_timeout;
}

- (double)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (id)description
{
  v2 = @"YES";
  if (self->_yieldLastLocation) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (!self->_fallback) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"desired accuracy, %.2f, horizontalAccuracy, %.2f, maxAge, %.2f, yieldLastLocation, %@, fallback, %@, fallbackHorizontalAccuracy, %.2f, fallbackMaxAge, %.2f, timeout, %.2f", *(_OWORD *)&self->_desiredAccuracy, *(void *)&self->_maxAge, v3, v2, *(void *)&self->_fallbackHorizontalAccuracy, *(void *)&self->_fallbackMaxAge, *(void *)&self->_timeout];
}

- (BOOL)fallback
{
  return self->_fallback;
}

- (double)fallbackHorizontalAccuracy
{
  return self->_fallbackHorizontalAccuracy;
}

- (double)fallbackMaxAge
{
  return self->_fallbackMaxAge;
}

@end