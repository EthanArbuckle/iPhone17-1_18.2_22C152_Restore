@interface _UIColorPickerColorQueueContainer
- (BOOL)isVolatile;
- (NSString)colorSpace;
- (UIColor)color;
- (void)setColor:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setIsVolatile:(BOOL)a3;
@end

@implementation _UIColorPickerColorQueueContainer

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
}

- (BOOL)isVolatile
{
  return self->_isVolatile;
}

- (void)setIsVolatile:(BOOL)a3
{
  self->_isVolatile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end