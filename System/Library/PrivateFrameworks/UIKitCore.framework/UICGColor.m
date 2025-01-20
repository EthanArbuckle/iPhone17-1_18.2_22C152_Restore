@interface UICGColor
- (BOOL)_isDeepColor;
- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6;
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (BOOL)getWhite:(double *)a3 alpha:(double *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPatternColor;
- (CGColor)CGColor;
- (UICGColor)colorWithAlphaComponent:(double)a3;
- (UICGColor)initWithCGColor:(CGColor *)a3;
- (double)alphaComponent;
- (id)colorSpaceName;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)set;
- (void)setFill;
- (void)setStroke;
@end

@implementation UICGColor

- (unint64_t)hash
{
  unint64_t result = (unint64_t)self->_cachedColor;
  if (result) {
    return CFHash((CFTypeRef)result);
  }
  return result;
}

- (UICGColor)colorWithAlphaComponent:(double)a3
{
  CopyWithAlpha = CGColorCreateCopyWithAlpha(self->_cachedColor, a3);
  v4 = +[UIColor colorWithCGColor:CopyWithAlpha];
  CGColorRelease(CopyWithAlpha);
  return (UICGColor *)v4;
}

- (UICGColor)initWithCGColor:(CGColor *)a3
{
  v3 = self;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UICGColor;
    v3 = [(UICGColor *)&v6 init];
    if (v3) {
      v3->_cachedColor = CGColorRetain(a3);
    }
  }
  return v3;
}

- (void)dealloc
{
  CGColorRelease(self->_cachedColor);
  v3.receiver = self;
  v3.super_class = (Class)UICGColor;
  [(UICGColor *)&v3 dealloc];
}

- (void)set
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v4 = 0;
  }
  else {
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSetFillColorWithColor(v4, self->_cachedColor);
  cachedColor = self->_cachedColor;
  CGContextSetStrokeColorWithColor(v4, cachedColor);
}

- (CGColor)CGColor
{
  return self->_cachedColor;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  cachedColor = self->_cachedColor;
  if (!cachedColor) {
    return 0;
  }
  Components = CGColorGetComponents(self->_cachedColor);
  CGFloat Alpha = CGColorGetAlpha(cachedColor);
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(cachedColor);
  if (!Components) {
    return 0;
  }
  CGColorSpaceRef v14 = ColorSpace;
  long long v19 = 0u;
  long long v20 = 0u;
  if (qword_1EB25E410 != -1) {
    dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
  }
  if ((CGColorSpaceRef)qword_1EB25E408 == v14) {
    goto LABEL_11;
  }
  if (qword_1EB25E450 != -1) {
    dispatch_once(&qword_1EB25E450, &__block_literal_global_2192);
  }
  if ((CGColorSpaceRef)qword_1EB25E448 == v14) {
    goto LABEL_11;
  }
  UISCreateCachedColorTransform();
  if (!CGColorTransformConvertColorComponents())
  {
    CGColorTransformRelease();
    return 0;
  }
  *((CGFloat *)&v20 + 1) = Alpha;
  CGColorTransformRelease();
  Components = (const CGFloat *)&v19;
LABEL_11:
  uint64_t v16 = *((void *)Components + 1);
  uint64_t v15 = *((void *)Components + 2);
  uint64_t v17 = *((void *)Components + 3);
  if (a3) {
    *a3 = *Components;
  }
  if (a4) {
    *(void *)a4 = v16;
  }
  if (a5) {
    *(void *)a5 = v15;
  }
  if (a6) {
    *(void *)a6 = v17;
  }
  return 1;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  double v17 = 0.0;
  double v18 = 0.0;
  uint64_t v15 = 0;
  double v16 = 0.0;
  BOOL v10 = [(UICGColor *)self getRed:&v18 green:&v17 blue:&v16 alpha:&v15];
  if (v10)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v12 = 0;
    _NXRGBToHSB((long double *)&v14, (double *)&v13, (double *)&v12, v18, v17, v16);
    if (a3) {
      *(void *)a3 = v14;
    }
    if (a4) {
      *(void *)a4 = v13;
    }
    if (a5) {
      *(void *)a5 = v12;
    }
    if (a6) {
      *(void *)a6 = v15;
    }
  }
  return v10;
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  cachedColor = self->_cachedColor;
  if (!cachedColor) {
    return 0;
  }
  Components = CGColorGetComponents(self->_cachedColor);
  CGFloat Alpha = CGColorGetAlpha(cachedColor);
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(cachedColor);
  if (!Components) {
    return 0;
  }
  CGColorSpaceRef v10 = ColorSpace;
  uint64_t v13 = 0;
  CGFloat v14 = 0.0;
  if (qword_1EB25E400 != -1) {
    dispatch_once(&qword_1EB25E400, &__block_literal_global_2182);
  }
  if ((CGColorSpaceRef)qword_1EB25E3F8 == v10) {
    goto LABEL_11;
  }
  if (qword_1EB25E430 != -1) {
    dispatch_once(&qword_1EB25E430, &__block_literal_global_2188);
  }
  if ((CGColorSpaceRef)qword_1EB25E428 == v10) {
    goto LABEL_11;
  }
  UISCreateCachedColorTransform();
  if (!CGColorTransformConvertColorComponents())
  {
    CGColorTransformRelease();
    return 0;
  }
  CGFloat v14 = Alpha;
  CGColorTransformRelease();
  Components = (const CGFloat *)&v13;
LABEL_11:
  uint64_t v11 = *((void *)Components + 1);
  if (a3) {
    *a3 = *Components;
  }
  if (a4) {
    *(void *)a4 = v11;
  }
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UICGColor *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ![(UIColor *)v4 _isDynamic])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      cachedColor = self->_cachedColor;
      if (isKindOfClass) {
        v8 = v4->_cachedColor;
      }
      else {
        v8 = [(UICGColor *)v4 CGColor];
      }
      BOOL v5 = CGColorEqualToColor(cachedColor, v8);
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (double)alphaComponent
{
  return CGColorGetAlpha(self->_cachedColor);
}

- (void)setFill
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v4 = 0;
  }
  else {
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  cachedColor = self->_cachedColor;
  CGContextSetFillColorWithColor(v4, cachedColor);
}

- (id)colorSpaceName
{
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(self->_cachedColor);
  unsigned __int32 v4 = CGColorSpaceGetModel(ColorSpace) + 1;
  if (v4 >= 8)
  {
    v7.receiver = self;
    v7.super_class = (Class)UICGColor;
    BOOL v5 = [(UIColor *)&v7 colorSpaceName];
  }
  else
  {
    BOOL v5 = off_1E52F1560[v4];
  }
  return v5;
}

- (void)setStroke
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    unsigned __int32 v4 = 0;
  }
  else {
    unsigned __int32 v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  cachedColor = self->_cachedColor;
  CGContextSetStrokeColorWithColor(v4, cachedColor);
}

- (id)description
{
  size_t NumberOfComponents = CGColorGetNumberOfComponents(self->_cachedColor);
  Components = CGColorGetComponents(self->_cachedColor);
  for (i = [MEMORY[0x1E4F28E78] string];
  {
    uint64_t v6 = *(void *)Components++;
    objc_msgSend(i, "appendFormat:", @"%g ", v6);
  }
  objc_super v7 = NSString;
  v8 = [(UICGColor *)self colorSpaceName];
  v9 = [v7 stringWithFormat:@"%@ %@", v8, i];

  return v9;
}

- (BOOL)_isDeepColor
{
  double v11 = 0.0;
  double v12 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  if ([(UICGColor *)self getRed:&v11 green:&v10 blue:&v9 alpha:0])
  {
    double v3 = 1.0;
    if (v11 <= 1.0) {
      double v4 = v11;
    }
    else {
      double v4 = 1.0;
    }
    if (v11 < 0.0) {
      double v4 = 0.0;
    }
    if (v11 != v4) {
      goto LABEL_13;
    }
    if (v10 <= 1.0) {
      double v3 = v10;
    }
    if (v10 < 0.0) {
      double v3 = 0.0;
    }
    if (v10 != v3)
    {
LABEL_13:
      LOBYTE(v5) = 1;
      return v5;
    }
    double v6 = v9;
  }
  else
  {
    BOOL v5 = [(UICGColor *)self getWhite:&v12 alpha:0];
    if (!v5) {
      return v5;
    }
    double v6 = v12;
  }
  double v7 = 1.0;
  if (v6 <= 1.0) {
    double v7 = v6;
  }
  if (v6 < 0.0) {
    double v7 = 0.0;
  }
  LOBYTE(v5) = v6 != v7;
  return v5;
}

- (BOOL)isPatternColor
{
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(self->_cachedColor);
  return CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelPattern;
}

@end