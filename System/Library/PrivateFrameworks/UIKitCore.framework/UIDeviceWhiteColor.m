@interface UIDeviceWhiteColor
- (BOOL)_isDeepColor;
- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6;
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (BOOL)getWhite:(double *)a3 alpha:(double *)a4;
- (BOOL)isEqual:(id)a3;
- (CGColor)CGColor;
- (UIDeviceWhiteColor)colorWithAlphaComponent:(double)a3;
- (UIDeviceWhiteColor)initWithCGColor:(CGColor *)a3;
- (UIDeviceWhiteColor)initWithWhite:(double)a3 alpha:(double)a4;
- (double)alphaComponent;
- (id)colorSpaceName;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)set;
- (void)setFill;
- (void)setStroke;
@end

@implementation UIDeviceWhiteColor

- (CGColor)CGColor
{
  components[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  result = (CGColor *)atomic_load((unint64_t *)&self->_cachedColor);
  if (!result)
  {
    double alphaComponent = self->alphaComponent;
    components[0] = self->whiteComponent;
    components[1] = alphaComponent;
    if (qword_1EB25E400 != -1) {
      dispatch_once(&qword_1EB25E400, &__block_literal_global_2182);
    }
    result = CGColorCreate((CGColorSpaceRef)qword_1EB25E3F8, components);
    v5 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_cachedColor, (unint64_t *)&v5, (unint64_t)result);
    if (v5)
    {
      CGColorRelease(result);
      return v5;
    }
  }
  return result;
}

- (unint64_t)hash
{
  return (int)vcvtd_n_s64_f64(self->alphaComponent, 0x10uLL)
       + 13 * (int)vcvtd_n_s64_f64(self->whiteComponent, 0x10uLL);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIDeviceWhiteColor *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![(UIColor *)v4 _isDynamic])
  {
    v6 = [(UIDeviceWhiteColor *)v4 colorSpaceName];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->whiteComponent == v4->whiteComponent)
      {
        double alphaComponent = self->alphaComponent;
        double v8 = v4->alphaComponent;
LABEL_12:
        BOOL v5 = alphaComponent == v8;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v9 = [(UIDeviceWhiteColor *)self colorSpaceName];
      int v10 = [v6 isEqualToString:v9];

      if (v10)
      {
        double v12 = 0.0;
        double v13 = 0.0;
        [(UIDeviceWhiteColor *)v4 getWhite:&v13 alpha:&v12];
        if (self->whiteComponent == v13)
        {
          double alphaComponent = self->alphaComponent;
          double v8 = v12;
          goto LABEL_12;
        }
      }
    }
    BOOL v5 = 0;
    goto LABEL_14;
  }
  BOOL v5 = 0;
LABEL_15:

  return v5;
}

- (id)colorSpaceName
{
  if (dyld_program_sdk_at_least()) {
    v2 = @"UIExtendedGrayColorSpace";
  }
  else {
    v2 = @"UIDeviceWhiteColorSpace";
  }
  return v2;
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
  BOOL v5 = [(UIDeviceWhiteColor *)self CGColor];
  CGContextSetFillColorWithColor(v4, v5);
  CGContextSetStrokeColorWithColor(v4, v5);
}

- (double)alphaComponent
{
  return self->alphaComponent;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  if (a3) {
    *a3 = self->whiteComponent;
  }
  if (a4) {
    *a4 = self->whiteComponent;
  }
  if (a5) {
    *a5 = self->whiteComponent;
  }
  if (a6) {
    *a6 = self->alphaComponent;
  }
  return 1;
}

- (UIDeviceWhiteColor)colorWithAlphaComponent:(double)a3
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
    BOOL v5 = self;
  }
  else {
    BOOL v5 = [[UIDeviceWhiteColor alloc] initWithWhite:self->whiteComponent alpha:v4];
  }
  return v5;
}

- (UIDeviceWhiteColor)initWithWhite:(double)a3 alpha:(double)a4
{
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    if (a3 == 1.0 && a4 == 1.0)
    {
      uint64_t v15 = +[UIColor whiteColor];
    }
    else if (a3 == 0.0 && a4 == 1.0)
    {
      uint64_t v15 = +[UIColor blackColor];
    }
    else if (a3 == 0.0 && a4 == 0.0)
    {
      uint64_t v15 = +[UIColor clearColor];
    }
    else if (a3 == 0.0 && a4 == 0.5)
    {
      uint64_t v15 = +[UIColor __halfTransparentBlackColor];
    }
    else
    {
      if (a3 != 1.0 || a4 != 0.5) {
        goto LABEL_2;
      }
      uint64_t v15 = +[UIColor __halfTransparentWhiteColor];
    }
    double v8 = (UIDeviceWhiteColor *)v15;
    if (v15)
    {

      return v8;
    }
  }
LABEL_2:
  v17.receiver = self;
  v17.super_class = (Class)UIDeviceWhiteColor;
  double v8 = [(UIDeviceWhiteColor *)&v17 init];
  if (v8)
  {
    if (a3 > 2.0 || a3 < -1.0) {
      UIColorBreakForOutOfRangeColorComponents();
    }
    char v10 = dyld_program_sdk_at_least();
    double v11 = 0.0;
    double v12 = 1.0;
    if (a3 <= 1.0) {
      double v13 = a3;
    }
    else {
      double v13 = 1.0;
    }
    if (a3 < 0.0) {
      double v13 = 0.0;
    }
    if (v10) {
      double v13 = a3;
    }
    v8->whiteComponent = v13;
    if (a4 <= 1.0) {
      double v12 = a4;
    }
    if (a4 >= 0.0) {
      double v11 = v12;
    }
    v8->double alphaComponent = v11;
  }
  return v8;
}

- (void)dealloc
{
  CGColorRelease(self->_cachedColor);
  v3.receiver = self;
  v3.super_class = (Class)UIDeviceWhiteColor;
  [(UIDeviceWhiteColor *)&v3 dealloc];
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
  BOOL v5 = [(UIDeviceWhiteColor *)self CGColor];
  CGContextSetStrokeColorWithColor(v4, v5);
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  if (a3) {
    *a3 = self->whiteComponent;
  }
  if (a4) {
    *a4 = self->alphaComponent;
  }
  return 1;
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
  BOOL v5 = [(UIDeviceWhiteColor *)self CGColor];
  CGContextSetFillColorWithColor(v4, v5);
}

- (UIDeviceWhiteColor)initWithCGColor:(CGColor *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIDeviceWhiteColor;
  double v4 = [(UIDeviceWhiteColor *)&v8 init];
  if (v4)
  {
    Components = CGColorGetComponents(a3);
    v4->whiteComponent = *Components;
    v4->double alphaComponent = Components[1];
    v6 = v4;
  }

  return v4;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  if (a3) {
    *a3 = 0.0;
  }
  if (a4) {
    *a4 = 0.0;
  }
  if (a5) {
    *a5 = self->whiteComponent;
  }
  if (a6) {
    *a6 = self->alphaComponent;
  }
  return 1;
}

- (id)description
{
  objc_super v3 = NSString;
  double v4 = [(UIDeviceWhiteColor *)self colorSpaceName];
  BOOL v5 = [v3 stringWithFormat:@"%@ %g %g", v4, *(void *)&self->whiteComponent, *(void *)&self->alphaComponent];

  return v5;
}

- (BOOL)_isDeepColor
{
  double whiteComponent = self->whiteComponent;
  double v3 = 0.0;
  if (whiteComponent >= 0.0)
  {
    double v3 = 1.0;
    if (whiteComponent <= 1.0) {
      double v3 = self->whiteComponent;
    }
  }
  return whiteComponent != v3;
}

@end