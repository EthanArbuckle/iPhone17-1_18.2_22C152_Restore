@interface _UICGColorCacheKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCacheKey:(id)a3;
- (_UICGColorCacheKey)initWithColors:(CGColor *)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _UICGColorCacheKey

- (_UICGColorCacheKey)initWithColors:(CGColor *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UICGColorCacheKey;
  v4 = [(_UICGColorCacheKey *)&v9 init];
  v5 = v4;
  if (a3 && v4)
  {
    v4->_colors = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    v8 = (CGColor **)&v10;
    do
    {
      CFArrayAppendValue(v5->_colors, a3);
      v6 = v8++;
      a3 = *v6;
    }
    while (*v6);
  }
  return v5;
}

- (void)dealloc
{
  colors = self->_colors;
  if (colors) {
    CFRelease(colors);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UICGColorCacheKey;
  [(_UICGColorCacheKey *)&v4 dealloc];
}

- (unint64_t)hash
{
  colors = self->_colors;
  if (!colors || CFArrayGetCount(colors) < 1) {
    return 0;
  }
  unint64_t v4 = 0;
  CFIndex v5 = 0;
  do
  {
    CFHashCode ValueAtIndex = (CFHashCode)CFArrayGetValueAtIndex(self->_colors, v5);
    if (ValueAtIndex) {
      CFHashCode ValueAtIndex = CFHash((CFTypeRef)ValueAtIndex);
    }
    v4 ^= ValueAtIndex;
    ++v5;
  }
  while (v5 < CFArrayGetCount(self->_colors));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (_UICGColorCacheKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(_UICGColorCacheKey *)self isEqualToCacheKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  unint64_t v4 = (CFArrayRef *)a3;
  colors = self->_colors;
  if (colors)
  {
    CFIndex Count = CFArrayGetCount(colors);
    CFArrayRef v7 = v4[1];
    if (!v7 || Count != CFArrayGetCount(v7)) {
      goto LABEL_10;
    }
    if (Count < 1)
    {
      BOOL v15 = 1;
      goto LABEL_12;
    }
    CFHashCode ValueAtIndex = (CGColor *)CFArrayGetValueAtIndex(self->_colors, 0);
    objc_super v9 = (CGColor *)CFArrayGetValueAtIndex(v4[1], 0);
    if (CGColorEqualToColor(ValueAtIndex, v9))
    {
      CFIndex v10 = 1;
      do
      {
        CFIndex v11 = v10;
        if (Count == v10) {
          break;
        }
        v12 = (CGColor *)CFArrayGetValueAtIndex(self->_colors, v10);
        v13 = (CGColor *)CFArrayGetValueAtIndex(v4[1], v11);
        BOOL v14 = CGColorEqualToColor(v12, v13);
        CFIndex v10 = v11 + 1;
      }
      while (v14);
      BOOL v15 = v11 >= Count;
    }
    else
    {
LABEL_10:
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = v4[1] == 0;
  }
LABEL_12:

  return v15;
}

@end