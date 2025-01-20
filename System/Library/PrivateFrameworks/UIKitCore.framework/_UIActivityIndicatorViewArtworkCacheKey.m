@interface _UIActivityIndicatorViewArtworkCacheKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCacheKey:(id)a3;
- (_UIActivityIndicatorViewArtworkCacheKey)initWithStyle:(int64_t)a3 width:(double)a4 spokeCount:(int64_t)a5 spokeFrameRatio:(int64_t)a6 shadowOffset:(CGSize)a7 color:(CGColor *)a8 shadowColor:(CGColor *)a9;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _UIActivityIndicatorViewArtworkCacheKey

- (_UIActivityIndicatorViewArtworkCacheKey)initWithStyle:(int64_t)a3 width:(double)a4 spokeCount:(int64_t)a5 spokeFrameRatio:(int64_t)a6 shadowOffset:(CGSize)a7 color:(CGColor *)a8 shadowColor:(CGColor *)a9
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  v20.receiver = self;
  v20.super_class = (Class)_UIActivityIndicatorViewArtworkCacheKey;
  v17 = [(_UIActivityIndicatorViewArtworkCacheKey *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_style = a3;
    v17->_CGFloat width = a4;
    v17->_spokeCount = a5;
    v17->_spokeFrameRatio = a6;
    v17->_shadowOffset.CGFloat width = width;
    v17->_shadowOffset.CGFloat height = height;
    CGColorRetain(a8);
    v18->_color = a8;
    CGColorRetain(a9);
    v18->_shadowColor = a9;
  }
  return v18;
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  CGColorRelease(self->_shadowColor);
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityIndicatorViewArtworkCacheKey;
  [(_UIActivityIndicatorViewArtworkCacheKey *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIActivityIndicatorViewArtworkCacheKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_UIActivityIndicatorViewArtworkCacheKey *)self isEqualToCacheKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  v4 = (CGColorRef *)a3;
  BOOL v5 = v4;
  BOOL v7 = v4
    && (CGColorRef)self->_style == v4[1]
    && self->_width == *((double *)v4 + 2)
    && (CGColorRef)self->_spokeCount == v4[3]
    && (CGColorRef)self->_spokeFrameRatio == v4[4]
    && (self->_shadowOffset.width == *((double *)v4 + 5)
      ? (BOOL v6 = self->_shadowOffset.height == *((double *)v4 + 6))
      : (BOOL v6 = 0),
        v6 && CGColorEqualToColor(self->_color, v4[7]))
    && CGColorEqualToColor(self->_shadowColor, v5[8]);

  return v7;
}

- (unint64_t)hash
{
  int64_t style = self->_style;
  double width = self->_width;
  int64_t spokeCount = self->_spokeCount;
  int64_t spokeFrameRatio = self->_spokeFrameRatio;
  double v7 = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  color = self->_color;
  if (color) {
    CFHashCode v10 = CFHash(color);
  }
  else {
    CFHashCode v10 = 0;
  }
  CFHashCode shadowColor = (CFHashCode)self->_shadowColor;
  if (shadowColor) {
    CFHashCode shadowColor = CFHash((CFTypeRef)shadowColor);
  }
  return style ^ spokeCount ^ spokeFrameRatio ^ (unint64_t)width ^ (unint64_t)v7 ^ (unint64_t)height ^ v10 ^ shadowColor;
}

@end