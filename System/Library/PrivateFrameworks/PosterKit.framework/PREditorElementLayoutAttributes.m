@interface PREditorElementLayoutAttributes
- (CGRect)rect;
- (PREditorElementLayoutAttributes)initWithRect:(CGRect)a3 variant:(unint64_t)a4 resolvedTitleLayout:(unint64_t)a5;
- (unint64_t)resolvedTitleLayout;
- (unint64_t)variant;
@end

@implementation PREditorElementLayoutAttributes

- (PREditorElementLayoutAttributes)initWithRect:(CGRect)a3 variant:(unint64_t)a4 resolvedTitleLayout:(unint64_t)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)PREditorElementLayoutAttributes;
  result = [(PREditorElementLayoutAttributes *)&v12 init];
  if (result)
  {
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
    result->_variant = a4;
    result->_resolvedTitleLayout = a5;
  }
  return result;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (unint64_t)resolvedTitleLayout
{
  return self->_resolvedTitleLayout;
}

@end