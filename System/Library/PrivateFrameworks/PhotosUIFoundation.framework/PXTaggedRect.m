@interface PXTaggedRect
- (CGRect)rect;
- (PXTaggedRect)init;
- (PXTaggedRect)initWithRect:(CGRect)a3 tag:(unint64_t)a4;
- (id)description;
- (unint64_t)tag;
@end

@implementation PXTaggedRect

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

- (unint64_t)tag
{
  return self->_tag;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(PXTaggedRect *)self tag];
  [(PXTaggedRect *)self rect];
  v7 = NSStringFromCGRect(v11);
  v8 = [v3 stringWithFormat:@"<%@: %p, tag=%lu rect=%@>", v5, self, v6, v7];

  return v8;
}

- (PXTaggedRect)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXTaggedRect.m", 26, @"%s is not available as initializer", "-[PXTaggedRect init]");

  abort();
}

- (PXTaggedRect)initWithRect:(CGRect)a3 tag:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PXTaggedRect;
  CGRect result = [(PXTaggedRect *)&v10 init];
  if (result)
  {
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
    result->_tag = a4;
  }
  return result;
}

@end