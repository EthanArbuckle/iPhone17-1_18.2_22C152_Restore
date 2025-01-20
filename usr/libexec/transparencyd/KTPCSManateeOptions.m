@interface KTPCSManateeOptions
- (BOOL)roll;
- (void)setRoll:(BOOL)a3;
@end

@implementation KTPCSManateeOptions

- (BOOL)roll
{
  return self->_roll;
}

- (void)setRoll:(BOOL)a3
{
  self->_roll = a3;
}

@end