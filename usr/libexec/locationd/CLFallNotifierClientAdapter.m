@interface CLFallNotifierClientAdapter
- (BOOL)valid;
- (void)setValid:(BOOL)a3;
@end

@implementation CLFallNotifierClientAdapter

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end