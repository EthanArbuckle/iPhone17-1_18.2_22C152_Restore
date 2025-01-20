@interface UnityOptions
- (BOOL)lowBrightness;
- (void)setLowBrightness:(BOOL)a3;
@end

@implementation UnityOptions

- (BOOL)lowBrightness
{
  return self->_lowBrightness;
}

- (void)setLowBrightness:(BOOL)a3
{
  self->_lowBrightness = a3;
}

@end