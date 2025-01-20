@interface _UITextFieldBackgroundCacheKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCacheKey:(id)a3;
- (_UITextFieldBackgroundCacheKey)initWithClassName:(id)a3 scale:(double)a4 cornerRadius:(double)a5 lineWidth:(double)a6 strokeColor:(CGColor *)a7 fillColor:(CGColor *)a8;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _UITextFieldBackgroundCacheKey

- (_UITextFieldBackgroundCacheKey)initWithClassName:(id)a3 scale:(double)a4 cornerRadius:(double)a5 lineWidth:(double)a6 strokeColor:(CGColor *)a7 fillColor:(CGColor *)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UITextFieldBackgroundCacheKey;
  v16 = [(_UITextFieldBackgroundCacheKey *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_className, a3);
    v17->_scale = a4;
    v17->_cornerRadius = a5;
    v17->_lineWidth = a6;
    CGColorRetain(a7);
    v17->_strokeColor = a7;
    CGColorRetain(a8);
    v17->_fillColor = a8;
  }

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_className hash];
  double scale = self->_scale;
  double cornerRadius = self->_cornerRadius;
  double lineWidth = self->_lineWidth;
  strokeColor = self->_strokeColor;
  if (strokeColor) {
    CFHashCode v8 = CFHash(strokeColor);
  }
  else {
    CFHashCode v8 = 0;
  }
  CFHashCode fillColor = (CFHashCode)self->_fillColor;
  if (fillColor) {
    CFHashCode fillColor = CFHash((CFTypeRef)fillColor);
  }
  return v3 ^ (unint64_t)scale ^ (unint64_t)cornerRadius ^ (unint64_t)lineWidth ^ v8 ^ fillColor;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UITextFieldBackgroundCacheKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_UITextFieldBackgroundCacheKey *)self isEqualToCacheKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  id v4 = a3;
  BOOL v6 = v4
    && ((className = self->_className, className == *((NSString **)v4 + 1))
     || -[NSString isEqualToString:](className, "isEqualToString:"))
    && self->_scale == *((double *)v4 + 2)
    && self->_cornerRadius == *((double *)v4 + 3)
    && self->_lineWidth == *((double *)v4 + 4)
    && CGColorEqualToColor(self->_strokeColor, *((CGColorRef *)v4 + 5))
    && CGColorEqualToColor(self->_fillColor, *((CGColorRef *)v4 + 6));

  return v6;
}

- (void)dealloc
{
  CGColorRelease(self->_strokeColor);
  CGColorRelease(self->_fillColor);
  v3.receiver = self;
  v3.super_class = (Class)_UITextFieldBackgroundCacheKey;
  [(_UITextFieldBackgroundCacheKey *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end