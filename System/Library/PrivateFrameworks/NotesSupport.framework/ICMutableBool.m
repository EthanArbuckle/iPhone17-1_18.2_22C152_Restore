@interface ICMutableBool
- (BOOL)value;
- (void)setValue:(BOOL)a3;
@end

@implementation ICMutableBool

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

@end