@interface TSUBool
- (BOOL)value;
- (void)setValue:(BOOL)a3;
@end

@implementation TSUBool

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

@end