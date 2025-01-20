@interface _UISearchBarBackgroundCacheKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCacheKey:(id)a3;
- (_UISearchBarBackgroundCacheKey)initWithBarPosition:(int64_t)a3 usesContiguousBarBackground:(BOOL)a4 scale:(double)a5 alpha:(double)a6 height:(double)a7 statusBarHeight:(double)a8 backgroundColor:(CGColor *)a9 strokeColor:(CGColor *)a10;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _UISearchBarBackgroundCacheKey

- (_UISearchBarBackgroundCacheKey)initWithBarPosition:(int64_t)a3 usesContiguousBarBackground:(BOOL)a4 scale:(double)a5 alpha:(double)a6 height:(double)a7 statusBarHeight:(double)a8 backgroundColor:(CGColor *)a9 strokeColor:(CGColor *)a10
{
  v21.receiver = self;
  v21.super_class = (Class)_UISearchBarBackgroundCacheKey;
  v18 = [(_UISearchBarBackgroundCacheKey *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_barPosition = a3;
    v18->_usesContiguousBarBackground = a4;
    v18->_scale = a5;
    v18->_alpha = a6;
    v18->_height = a7;
    v18->_statusBarHeight = a8;
    CGColorRetain(a9);
    v19->_backgroundColor = a9;
    CGColorRetain(a10);
    v19->_strokeColor = a10;
  }
  return v19;
}

- (unint64_t)hash
{
  int64_t barPosition = self->_barPosition;
  BOOL usesContiguousBarBackground = self->_usesContiguousBarBackground;
  double scale = self->_scale;
  double alpha = self->_alpha;
  double height = self->_height;
  double statusBarHeight = self->_statusBarHeight;
  backgroundColor = self->_backgroundColor;
  if (backgroundColor) {
    CFHashCode v10 = CFHash(backgroundColor);
  }
  else {
    CFHashCode v10 = 0;
  }
  CFHashCode strokeColor = (CFHashCode)self->_strokeColor;
  if (strokeColor) {
    CFHashCode strokeColor = CFHash((CFTypeRef)strokeColor);
  }
  return barPosition ^ usesContiguousBarBackground ^ (unint64_t)scale ^ (unint64_t)height ^ (unint64_t)statusBarHeight ^ v10 ^ strokeColor ^ (unint64_t)(alpha * 100.0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UISearchBarBackgroundCacheKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_UISearchBarBackgroundCacheKey *)self isEqualToCacheKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  v4 = (CGColorRef *)a3;
  BOOL v5 = v4;
  BOOL v6 = v4
    && (CGColorRef)self->_barPosition == v4[1]
    && self->_usesContiguousBarBackground == *((unsigned __int8 *)v4 + 16)
    && self->_scale == *((double *)v4 + 3)
    && self->_alpha == *((double *)v4 + 4)
    && self->_height == *((double *)v4 + 5)
    && self->_statusBarHeight == *((double *)v4 + 6)
    && CGColorEqualToColor(self->_backgroundColor, v4[7])
    && CGColorEqualToColor(self->_strokeColor, v5[8]);

  return v6;
}

- (void)dealloc
{
  CGColorRelease(self->_backgroundColor);
  CGColorRelease(self->_strokeColor);
  v3.receiver = self;
  v3.super_class = (Class)_UISearchBarBackgroundCacheKey;
  [(_UISearchBarBackgroundCacheKey *)&v3 dealloc];
}

@end