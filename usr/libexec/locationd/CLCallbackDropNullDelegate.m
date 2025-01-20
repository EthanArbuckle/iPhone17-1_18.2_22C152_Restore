@interface CLCallbackDropNullDelegate
- (BOOL)valid;
- (void)setValid:(BOOL)a3;
@end

@implementation CLCallbackDropNullDelegate

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end