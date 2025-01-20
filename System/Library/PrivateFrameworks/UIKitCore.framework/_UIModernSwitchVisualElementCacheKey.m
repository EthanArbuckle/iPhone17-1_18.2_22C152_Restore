@interface _UIModernSwitchVisualElementCacheKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCacheKey:(id)a3;
- (_UIModernSwitchVisualElementCacheKey)initWithMask:(unint64_t)a3 color:(CGColor *)a4;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _UIModernSwitchVisualElementCacheKey

- (unint64_t)hash
{
  unint64_t mask = self->_mask;
  CFHashCode color = (CFHashCode)self->_color;
  if (color) {
    CFHashCode color = CFHash((CFTypeRef)color);
  }
  return color ^ mask;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIModernSwitchVisualElementCacheKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_UIModernSwitchVisualElementCacheKey *)self isEqualToCacheKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  v4 = (CGColorRef *)a3;
  BOOL v5 = v4;
  BOOL v6 = v4 && (CGColorRef)self->_mask == v4[1] && CGColorEqualToColor(self->_color, v4[2]);

  return v6;
}

- (_UIModernSwitchVisualElementCacheKey)initWithMask:(unint64_t)a3 color:(CGColor *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIModernSwitchVisualElementCacheKey;
  BOOL v6 = [(_UIModernSwitchVisualElementCacheKey *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_unint64_t mask = a3;
    CGColorRetain(a4);
    v7->_CFHashCode color = a4;
  }
  return v7;
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)_UIModernSwitchVisualElementCacheKey;
  [(_UIModernSwitchVisualElementCacheKey *)&v3 dealloc];
}

@end