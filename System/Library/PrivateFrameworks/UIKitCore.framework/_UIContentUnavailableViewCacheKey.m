@interface _UIContentUnavailableViewCacheKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCacheKey:(id)a3;
- (_UIContentUnavailableViewCacheKey)initWithStyle:(unint64_t)a3 color:(CGColor *)a4;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _UIContentUnavailableViewCacheKey

- (_UIContentUnavailableViewCacheKey)initWithStyle:(unint64_t)a3 color:(CGColor *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIContentUnavailableViewCacheKey;
  v6 = [(_UIContentUnavailableViewCacheKey *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_style = a3;
    CGColorRetain(a4);
    v7->_color = a4;
  }
  return v7;
}

- (unint64_t)hash
{
  unint64_t style = self->_style;
  CFHashCode color = (CFHashCode)self->_color;
  if (color) {
    CFHashCode color = CFHash((CFTypeRef)color);
  }
  return color ^ style;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIContentUnavailableViewCacheKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_UIContentUnavailableViewCacheKey *)self isEqualToCacheKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  v4 = (CGColorRef *)a3;
  BOOL v5 = v4;
  BOOL v6 = v4 && (CGColorRef)self->_style == v4[1] && CGColorEqualToColor(self->_color, v4[2]);

  return v6;
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)_UIContentUnavailableViewCacheKey;
  [(_UIContentUnavailableViewCacheKey *)&v3 dealloc];
}

@end