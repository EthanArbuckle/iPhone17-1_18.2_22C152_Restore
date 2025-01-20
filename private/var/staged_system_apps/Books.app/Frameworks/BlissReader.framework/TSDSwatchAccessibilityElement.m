@interface TSDSwatchAccessibilityElement
- (BOOL)isAccessibilityElement;
- (id)swatchElement;
- (void)setSwatchElement:(id)a3;
@end

@implementation TSDSwatchAccessibilityElement

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)swatchElement
{
  return self->_swatchElement;
}

- (void)setSwatchElement:(id)a3
{
  self->_swatchElement = a3;
}

@end