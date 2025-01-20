@interface OITSUBool
- (BOOL)value;
- (void)setValue:(BOOL)a3;
@end

@implementation OITSUBool

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

@end