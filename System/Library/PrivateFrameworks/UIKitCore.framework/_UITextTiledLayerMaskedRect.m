@interface _UITextTiledLayerMaskedRect
+ (id)ghostedRect:(CGRect)a3;
+ (id)rect:(CGRect)a3 alpha:(double)a4;
- (CGRect)boundingRect;
- (_UITextTiledLayerMaskedRect)initWithRect:(CGRect)a3 alpha:(double)a4;
- (double)alpha;
- (id)description;
@end

@implementation _UITextTiledLayerMaskedRect

+ (id)ghostedRect:(CGRect)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRect:alpha:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.2);
  return v3;
}

+ (id)rect:(CGRect)a3 alpha:(double)a4
{
  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithRect:alpha:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  return v4;
}

- (_UITextTiledLayerMaskedRect)initWithRect:(CGRect)a3 alpha:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)_UITextTiledLayerMaskedRect;
  result = [(_UITextTiledLayerMaskedRect *)&v10 init];
  if (result)
  {
    result->_alpha = a4;
    result->_boundingRect.origin.CGFloat x = x;
    result->_boundingRect.origin.CGFloat y = y;
    result->_boundingRect.size.CGFloat width = width;
    result->_boundingRect.size.CGFloat height = height;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSStringFromCGRect(self->_boundingRect);
  v6 = [v3 stringWithFormat:@"<%@:%p %@ alpha=%f>", v4, self, v5, *(void *)&self->_alpha];

  return v6;
}

- (double)alpha
{
  return self->_alpha;
}

- (CGRect)boundingRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end