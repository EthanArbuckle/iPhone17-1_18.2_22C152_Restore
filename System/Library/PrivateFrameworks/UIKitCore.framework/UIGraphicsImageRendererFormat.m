@interface UIGraphicsImageRendererFormat
+ (UIGraphicsImageRendererFormat)formatForTraitCollection:(UITraitCollection *)traitCollection;
+ (id)defaultFormat;
- (BOOL)_grayscale;
- (BOOL)_wantsAlphaMask;
- (BOOL)opaque;
- (BOOL)prefersExtendedRange;
- (BOOL)supportsHighDynamicRange;
- (CGColorSpace)_overrideColorSpace;
- (CGFloat)scale;
- (UIGraphicsImageRendererFormat)init;
- (UIGraphicsImageRendererFormatRange)preferredRange;
- (double)_contextScale;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_overrideBitsPerComponent;
- (void)_setGrayscale:(BOOL)a3;
- (void)_setOverrideBitsPerComponent:(int64_t)a3;
- (void)_setOverrideColorSpace:(CGColorSpace *)a3;
- (void)_setWantsAlphaMask:(BOOL)a3;
- (void)dealloc;
- (void)setOpaque:(BOOL)opaque;
- (void)setPreferredRange:(UIGraphicsImageRendererFormatRange)preferredRange;
- (void)setPrefersExtendedRange:(BOOL)prefersExtendedRange;
- (void)setScale:(CGFloat)scale;
@end

@implementation UIGraphicsImageRendererFormat

- (void)dealloc
{
  CGColorSpaceRelease(self->_overrideColorSpace);
  v3.receiver = self;
  v3.super_class = (Class)UIGraphicsImageRendererFormat;
  [(UIGraphicsImageRendererFormat *)&v3 dealloc];
}

+ (id)defaultFormat
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___UIGraphicsImageRendererFormat;
  v2 = objc_msgSendSuper2(&v7, sel_defaultFormat);
  [v2 setOpaque:0];
  [v2 _setOverrideColorSpace:0];
  [v2 _setOverrideBitsPerComponent:0];
  if (dyld_program_sdk_at_least())
  {
    [v2 setPreferredRange:0];
  }
  else
  {
    objc_super v3 = +[UIDevice currentDevice];
    if ([v3 _supportsDeepColor]) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    [v2 setPreferredRange:v4];

    v5 = +[UIScreen mainScreen];
    [v5 _maximumSupportedScale];
    objc_msgSend(v2, "setScale:");
  }
  return v2;
}

- (void)setPreferredRange:(UIGraphicsImageRendererFormatRange)preferredRange
{
  if (self->_preferredRange != preferredRange)
  {
    v5 = self;
    [(UIGraphicsImageRendererFormat *)v5 _setOverrideColorSpace:0];
    [(UIGraphicsImageRendererFormat *)v5 _setOverrideBitsPerComponent:0];

    self->_preferredRange = preferredRange;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIGraphicsImageRendererFormat;
  uint64_t v4 = [(UIGraphicsRendererFormat *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOpaque:", -[UIGraphicsImageRendererFormat opaque](self, "opaque"));
  [(UIGraphicsImageRendererFormat *)self scale];
  objc_msgSend(v4, "setScale:");
  v4[9] = self->_preferredRange;
  objc_msgSend(v4, "_setOverrideColorSpace:", -[UIGraphicsImageRendererFormat _overrideColorSpace](self, "_overrideColorSpace"));
  objc_msgSend(v4, "_setOverrideBitsPerComponent:", -[UIGraphicsImageRendererFormat _overrideBitsPerComponent](self, "_overrideBitsPerComponent"));
  return v4;
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (void)_setOverrideColorSpace:(CGColorSpace *)a3
{
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    if (a3) {
      self->_preferredRange = -1;
    }
    CGColorSpaceRetain(a3);
    CGColorSpaceRelease(self->_overrideColorSpace);
    self->_overrideColorSpace = a3;
  }
}

- (void)_setOverrideBitsPerComponent:(int64_t)a3
{
  self->_overrideBitsPerComponent = a3;
}

- (void)setOpaque:(BOOL)opaque
{
  self->_opaque = opaque;
}

- (void)setScale:(CGFloat)scale
{
  self->_scale = scale;
}

- (double)_contextScale
{
  [(UIGraphicsImageRendererFormat *)self scale];
  if (result == 0.0)
  {
    objc_super v3 = +[UIScreen mainScreen];
    [v3 scale];
    double v5 = v4;

    return v5;
  }
  return result;
}

- (CGFloat)scale
{
  return self->_scale;
}

- (CGColorSpace)_overrideColorSpace
{
  return self->_overrideColorSpace;
}

- (int64_t)_overrideBitsPerComponent
{
  return self->_overrideBitsPerComponent;
}

- (UIGraphicsImageRendererFormat)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIGraphicsImageRendererFormat;
  v2 = [(UIGraphicsImageRendererFormat *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_overrideColorSpace = 0;
    v2->_scale = _UIScreenForcedMainScreenScale(1);
  }
  return v3;
}

- (UIGraphicsImageRendererFormatRange)preferredRange
{
  return self->_preferredRange;
}

+ (UIGraphicsImageRendererFormat)formatForTraitCollection:(UITraitCollection *)traitCollection
{
  objc_super v5 = traitCollection;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"UIGraphicsImageRenderer.m", 81, @"Invalid parameter not satisfying: %@", @"traitCollection" object file lineNumber description];
  }
  objc_super v6 = [a1 preferredFormat];
  [(UITraitCollection *)v5 displayScale];
  if (fabs(v7) >= 2.22044605e-16) {
    objc_msgSend(v6, "setScale:");
  }
  uint64_t v8 = [(UITraitCollection *)v5 displayGamut];
  if (v8 != -1) {
    [v6 setPrefersExtendedRange:v8 != 0];
  }

  return (UIGraphicsImageRendererFormat *)v6;
}

- (void)setPrefersExtendedRange:(BOOL)prefersExtendedRange
{
  BOOL v3 = prefersExtendedRange;
  if ([(UIGraphicsImageRendererFormat *)self prefersExtendedRange] != prefersExtendedRange
    || v3
    && [(UIGraphicsImageRendererFormat *)self preferredRange] == UIGraphicsImageRendererFormatRangeAutomatic)
  {
    if (v3) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
    [(UIGraphicsImageRendererFormat *)self setPreferredRange:v5];
  }
}

- (BOOL)prefersExtendedRange
{
  UIGraphicsImageRendererFormatRange v2 = [(UIGraphicsImageRendererFormat *)self preferredRange];
  BOOL result = 1;
  if (!(!v5 & v4))
  {
    switch(v2)
    {
      case UIGraphicsImageRendererFormatRangeUnspecified:
      case UIGraphicsImageRendererFormatRangeStandard:
        return 0;
      case UIGraphicsImageRendererFormatRangeAutomatic:
        objc_super v6 = +[UIScreen mainScreen];
        double v7 = [v6 traitCollection];
        uint64_t v8 = [v7 displayGamut];

        if (v8 != -1) {
          return v8 != 0;
        }
        v9 = +[UIDevice currentDevice];
        char v10 = [v9 _supportsDeepColor];

        return v10;
      case UIGraphicsImageRendererFormatRangeExtended:
        return result;
      default:
        JUMPOUT(0);
    }
  }
  if ((unint64_t)(v2 - 100) >= 2) {
    return 0;
  }
  return result;
}

- (BOOL)supportsHighDynamicRange
{
  return (self->_preferredRange & 0xFFFFFFFFFFFFFFFELL) == 100;
}

- (BOOL)_wantsAlphaMask
{
  return [(UIGraphicsImageRendererFormat *)self preferredRange] == 0x7FFF;
}

- (void)_setWantsAlphaMask:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIGraphicsImageRendererFormat *)self _wantsAlphaMask] != a3)
  {
    if (v3) {
      uint64_t v5 = 0x7FFFLL;
    }
    else {
      uint64_t v5 = 0;
    }
    [(UIGraphicsImageRendererFormat *)self setPreferredRange:v5];
  }
}

- (BOOL)_grayscale
{
  return [(UIGraphicsImageRendererFormat *)self preferredRange] == 32766;
}

- (void)_setGrayscale:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIGraphicsImageRendererFormat *)self _grayscale] != a3)
  {
    if (v3) {
      uint64_t v5 = 32766;
    }
    else {
      uint64_t v5 = 0;
    }
    [(UIGraphicsImageRendererFormat *)self setPreferredRange:v5];
  }
}

@end