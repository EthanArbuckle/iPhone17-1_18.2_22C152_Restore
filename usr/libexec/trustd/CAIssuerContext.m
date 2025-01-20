@interface CAIssuerContext
- (void)callback;
- (void)setCallback:(void *)a3;
@end

@implementation CAIssuerContext

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (void)callback
{
  return self->_callback;
}

@end