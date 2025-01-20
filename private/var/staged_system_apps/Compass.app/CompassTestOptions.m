@interface CompassTestOptions
- (BOOL)shouldSetBearing;
- (void)setShouldSetBearing:(BOOL)a3;
@end

@implementation CompassTestOptions

- (BOOL)shouldSetBearing
{
  return self->_shouldSetBearing;
}

- (void)setShouldSetBearing:(BOOL)a3
{
  self->_shouldSetBearing = a3;
}

@end