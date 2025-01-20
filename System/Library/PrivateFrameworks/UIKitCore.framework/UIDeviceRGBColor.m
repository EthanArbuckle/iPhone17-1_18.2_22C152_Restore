@interface UIDeviceRGBColor
- (BOOL)_isDeepColor;
- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6;
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (BOOL)getWhite:(double *)a3 alpha:(double *)a4;
- (BOOL)isEqual:(id)a3;
- (CGColor)CGColor;
- (UIDeviceRGBColor)colorWithAlphaComponent:(double)a3;
- (UIDeviceRGBColor)initWithCGColor:(CGColor *)a3;
- (UIDeviceRGBColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6;
- (UIDeviceRGBColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (double)alphaComponent;
- (id)colorSpaceName;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)set;
- (void)setFill;
- (void)setStroke;
@end

@implementation UIDeviceRGBColor

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double greenComponent = self->greenComponent;
  double blueComponent = self->blueComponent;
  double alphaComponent = self->alphaComponent;
  v12[0] = *(void *)&self->redComponent;
  *(double *)&v12[1] = greenComponent;
  *(double *)&v12[2] = blueComponent;
  *(double *)&v12[3] = alphaComponent;
  if (qword_1EB25E410 != -1) {
    dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
  }
  uint64_t v13 = 0;
  double v14 = 0.0;
  uint64_t v9 = qword_1EB25E408;
  if (qword_1EB25E400 != -1) {
    dispatch_once(&qword_1EB25E400, &__block_literal_global_2182);
  }
  if (qword_1EB25E3F8 == v9) {
    goto LABEL_12;
  }
  if (qword_1EB25E430 != -1) {
    dispatch_once(&qword_1EB25E430, &__block_literal_global_2188);
  }
  if (qword_1EB25E428 == v9)
  {
LABEL_12:
    v10 = (double *)v12;
    if (!a3) {
      goto LABEL_14;
    }
LABEL_13:
    *a3 = *v10;
    goto LABEL_14;
  }
  UISCreateCachedColorTransform();
  if (!CGColorTransformConvertColorComponents())
  {
    CGColorTransformRelease();
    return 0;
  }
  double v14 = alphaComponent;
  CGColorTransformRelease();
  v10 = (double *)&v13;
  if (a3) {
    goto LABEL_13;
  }
LABEL_14:
  if (a4) {
    *a4 = v10[1];
  }
  return 1;
}

- (CGColor)CGColor
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  result = (CGColor *)atomic_load((unint64_t *)&self->_cachedColor);
  if (!result)
  {
    double alphaComponent = self->alphaComponent;
    double greenComponent = self->greenComponent;
    double blueComponent = self->blueComponent;
    components[0] = self->redComponent;
    components[1] = greenComponent;
    components[2] = blueComponent;
    components[3] = alphaComponent;
    if (qword_1EB25E410 != -1) {
      dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
    }
    result = CGColorCreate((CGColorSpaceRef)qword_1EB25E408, components);
    v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_cachedColor, (unint64_t *)&v7, (unint64_t)result);
    if (v7)
    {
      CGColorRelease(result);
      return v7;
    }
  }
  return result;
}

- (unint64_t)hash
{
  return 13
       * (13
        * ((int)vcvtd_n_s64_f64(self->greenComponent, 0x10uLL) + 13
                                                               * (int)vcvtd_n_s64_f64(self->redComponent, 0x10uLL))
        + (int)vcvtd_n_s64_f64(self->blueComponent, 0x10uLL))
       + (int)vcvtd_n_s64_f64(self->alphaComponent, 0x10uLL);
}

- (UIDeviceRGBColor)colorWithAlphaComponent:(double)a3
{
  double v3 = 1.0;
  if (a3 <= 1.0) {
    double v3 = a3;
  }
  if (a3 >= 0.0) {
    double v4 = v3;
  }
  else {
    double v4 = 0.0;
  }
  if (v4 == self->alphaComponent) {
    v5 = self;
  }
  else {
    v5 = [[UIDeviceRGBColor alloc] initWithRed:self->redComponent green:self->greenComponent blue:self->blueComponent alpha:v4];
  }
  return v5;
}

- (UIDeviceRGBColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v25.receiver = self;
  v25.super_class = (Class)UIDeviceRGBColor;
  v10 = [(UIDeviceRGBColor *)&v25 init];
  if (v10)
  {
    if (a5 < -1.0 || a5 > 2.0 || a4 < -1.0 || a3 > 2.0 || a3 < -1.0 || a4 > 2.0) {
      UIColorBreakForOutOfRangeColorComponents();
    }
    char v16 = dyld_program_sdk_at_least();
    if (a3 <= 1.0) {
      double v17 = a3;
    }
    else {
      double v17 = 1.0;
    }
    if (a3 < 0.0) {
      double v17 = 0.0;
    }
    if (v16) {
      double v17 = a3;
    }
    v10->redComponent = v17;
    char v18 = dyld_program_sdk_at_least();
    if (a4 <= 1.0) {
      double v19 = a4;
    }
    else {
      double v19 = 1.0;
    }
    if (a4 < 0.0) {
      double v19 = 0.0;
    }
    if (v18) {
      double v19 = a4;
    }
    v10->double greenComponent = v19;
    char v20 = dyld_program_sdk_at_least();
    if (a5 <= 1.0) {
      double v21 = a5;
    }
    else {
      double v21 = 1.0;
    }
    if (a5 < 0.0) {
      double v21 = 0.0;
    }
    if (v20) {
      double v21 = a5;
    }
    v10->double blueComponent = v21;
    if (a6 <= 1.0) {
      double v22 = a6;
    }
    else {
      double v22 = 1.0;
    }
    if (a6 < 0.0) {
      double v22 = 0.0;
    }
    v10->double alphaComponent = v22;
    v23 = v10;
  }

  return v10;
}

- (UIDeviceRGBColor)initWithCGColor:(CGColor *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIDeviceRGBColor;
  double v4 = [(UIDeviceRGBColor *)&v8 init];
  if (v4)
  {
    Components = CGColorGetComponents(a3);
    v4->redComponent = *Components;
    v4->double greenComponent = Components[1];
    v4->double blueComponent = Components[2];
    v4->double alphaComponent = Components[3];
    v6 = v4;
  }

  return v4;
}

- (void)set
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v4 = 0;
  }
  else {
    double v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  v5 = [(UIDeviceRGBColor *)self CGColor];
  CGContextSetFillColorWithColor(v4, v5);
  CGContextSetStrokeColorWithColor(v4, v5);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (UIDeviceRGBColor *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![(UIColor *)v4 _isDynamic])
  {
    v6 = [(UIDeviceRGBColor *)v4 colorSpaceName];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->redComponent == v4->redComponent
        && self->greenComponent == v4->greenComponent
        && self->blueComponent == v4->blueComponent)
      {
        double alphaComponent = self->alphaComponent;
        double v8 = v4->alphaComponent;
LABEL_17:
        BOOL v5 = alphaComponent == v8;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v9 = [(UIDeviceRGBColor *)self colorSpaceName];
      int v10 = [v6 isEqualToString:v9];

      if (v10 || [v6 isEqualToString:@"UIDisplayP3ColorSpace"])
      {
        double v14 = 0.0;
        double v15 = 0.0;
        double v12 = 0.0;
        double v13 = 0.0;
        [(UIDeviceRGBColor *)v4 getRed:&v15 green:&v14 blue:&v13 alpha:&v12];
        if (self->redComponent == v15 && self->greenComponent == v14 && self->blueComponent == v13)
        {
          double alphaComponent = self->alphaComponent;
          double v8 = v12;
          goto LABEL_17;
        }
      }
    }
    BOOL v5 = 0;
    goto LABEL_19;
  }
  BOOL v5 = 0;
LABEL_20:

  return v5;
}

- (id)colorSpaceName
{
  if (dyld_program_sdk_at_least()) {
    v2 = @"UIExtendedSRGBColorSpace";
  }
  else {
    v2 = @"UIDeviceRGBColorSpace";
  }
  return v2;
}

- (void)dealloc
{
  CGColorRelease(self->_cachedColor);
  v3.receiver = self;
  v3.super_class = (Class)UIDeviceRGBColor;
  [(UIDeviceRGBColor *)&v3 dealloc];
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  if (a3) {
    *a3 = self->redComponent;
  }
  if (a4) {
    *a4 = self->greenComponent;
  }
  if (a5) {
    *a5 = self->blueComponent;
  }
  if (a6) {
    *a6 = self->alphaComponent;
  }
  return 1;
}

- (UIDeviceRGBColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  char v11 = dyld_program_sdk_at_least();
  if (a3 <= 1.0) {
    double v12 = a3;
  }
  else {
    double v12 = 1.0;
  }
  if (a3 < 0.0) {
    double v12 = 0.0;
  }
  if ((v11 & 1) == 0) {
    a3 = v12;
  }
  char v13 = dyld_program_sdk_at_least();
  if (a4 <= 1.0) {
    double v14 = a4;
  }
  else {
    double v14 = 1.0;
  }
  if (a4 < 0.0) {
    double v14 = 0.0;
  }
  if ((v13 & 1) == 0) {
    a4 = v14;
  }
  char v15 = dyld_program_sdk_at_least();
  if (a5 <= 1.0) {
    double v16 = a5;
  }
  else {
    double v16 = 1.0;
  }
  if (a5 < 0.0) {
    double v16 = 0.0;
  }
  if ((v15 & 1) == 0) {
    a5 = v16;
  }
  long double v17 = fmod(a3, 1.0) * 6.0;
  int v18 = (int)v17;
  long double v19 = v17 - (double)(int)v17;
  double v20 = (1.0 - a4) * a5;
  double v21 = (1.0 - v19 * a4) * a5;
  double v22 = (1.0 - (1.0 - v19) * a4) * a5;
  double v23 = a5;
  double v24 = v22;
  switch(v18)
  {
    case 1:
      double v23 = v21;
      double v24 = a5;
      break;
    case 2:
      double v23 = (1.0 - a4) * a5;
      double v24 = a5;
      double v20 = v22;
      break;
    case 3:
      double v23 = (1.0 - a4) * a5;
      double v24 = v21;
      goto LABEL_27;
    case 4:
      double v23 = v22;
      double v24 = (1.0 - a4) * a5;
LABEL_27:
      double v20 = a5;
      break;
    case 5:
      double v23 = a5;
      double v24 = (1.0 - a4) * a5;
      double v20 = v21;
      break;
    default:
      break;
  }
  return [(UIDeviceRGBColor *)self initWithRed:v23 green:v24 blue:v20 alpha:a6];
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  double redComponent = self->redComponent;
  uint64_t v13 = 0;
  _NXRGBToHSB((long double *)&v15, (double *)&v14, (double *)&v13, redComponent, self->greenComponent, self->blueComponent);
  if (a3) {
    *(void *)a3 = v15;
  }
  if (a4) {
    *(void *)a4 = v14;
  }
  if (a5) {
    *(void *)a5 = v13;
  }
  if (a6) {
    *a6 = self->alphaComponent;
  }
  return 1;
}

- (double)alphaComponent
{
  return self->alphaComponent;
}

- (void)setFill
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v4 = 0;
  }
  else {
    double v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  BOOL v5 = [(UIDeviceRGBColor *)self CGColor];
  CGContextSetFillColorWithColor(v4, v5);
}

- (void)setStroke
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v4 = 0;
  }
  else {
    double v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  BOOL v5 = [(UIDeviceRGBColor *)self CGColor];
  CGContextSetStrokeColorWithColor(v4, v5);
}

- (id)description
{
  objc_super v3 = NSString;
  double v4 = [(UIDeviceRGBColor *)self colorSpaceName];
  BOOL v5 = [v3 stringWithFormat:@"%@ %g %g %g %g", v4, *(void *)&self->redComponent, *(void *)&self->greenComponent, *(void *)&self->blueComponent, *(void *)&self->alphaComponent];

  return v5;
}

- (BOOL)_isDeepColor
{
  double redComponent = self->redComponent;
  double v3 = 0.0;
  if (redComponent >= 0.0)
  {
    double v3 = 1.0;
    if (redComponent <= 1.0) {
      double v3 = self->redComponent;
    }
  }
  if (redComponent != v3) {
    return 1;
  }
  double greenComponent = self->greenComponent;
  double v5 = 0.0;
  if (greenComponent >= 0.0)
  {
    double v5 = 1.0;
    if (greenComponent <= 1.0) {
      double v5 = self->greenComponent;
    }
  }
  if (greenComponent != v5) {
    return 1;
  }
  double blueComponent = self->blueComponent;
  double v8 = 0.0;
  if (blueComponent >= 0.0)
  {
    double v8 = 1.0;
    if (blueComponent <= 1.0) {
      double v8 = self->blueComponent;
    }
  }
  return blueComponent != v8;
}

@end