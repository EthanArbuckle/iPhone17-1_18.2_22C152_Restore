@interface VUIGDPRConfig
- (VUIGDPRConfig)init;
- (double)popoverHeight;
- (void)setPopoverHeight:(double)a3;
@end

@implementation VUIGDPRConfig

- (void)setPopoverHeight:(double)a3
{
  self->_popoverHeight = a3;
}

- (VUIGDPRConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIGDPRConfig;
  result = [(VUIGDPRConfig *)&v3 init];
  if (result) {
    result->_popoverHeight = 0.0;
  }
  return result;
}

- (double)popoverHeight
{
  return self->_popoverHeight;
}

@end