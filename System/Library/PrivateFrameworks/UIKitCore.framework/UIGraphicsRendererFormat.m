@interface UIGraphicsRendererFormat
+ (UIGraphicsRendererFormat)defaultFormat;
+ (UIGraphicsRendererFormat)preferredFormat;
- (CGRect)bounds;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation UIGraphicsRendererFormat

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(UIGraphicsRendererFormat *)self bounds];
  v4[1] = v5;
  v4[2] = v6;
  v4[3] = v7;
  v4[4] = v8;
  return v4;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

+ (UIGraphicsRendererFormat)defaultFormat
{
  v2 = (char *)objc_alloc_init((Class)a1);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(_OWORD *)(v2 + 8) = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)(v2 + 24) = v3;
  return (UIGraphicsRendererFormat *)v2;
}

+ (UIGraphicsRendererFormat)preferredFormat
{
  v2 = (char *)objc_alloc_init((Class)a1);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(_OWORD *)(v2 + 8) = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)(v2 + 24) = v3;
  return (UIGraphicsRendererFormat *)v2;
}

@end