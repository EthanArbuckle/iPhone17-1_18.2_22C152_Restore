@interface UIDisplayP3Color
- (BOOL)_isDeepColor;
- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6;
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (BOOL)getWhite:(double *)a3 alpha:(double *)a4;
- (BOOL)isEqual:(id)a3;
- (CGColor)CGColor;
- (UIDisplayP3Color)colorWithAlphaComponent:(double)a3;
- (UIDisplayP3Color)initWithDisplayP3Red:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (double)alphaComponent;
- (id)colorSpaceName;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)set;
- (void)setFill;
- (void)setStroke;
@end

@implementation UIDisplayP3Color

- (UIDisplayP3Color)initWithDisplayP3Red:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v18.receiver = self;
  v18.super_class = (Class)UIDisplayP3Color;
  v10 = [(UIDisplayP3Color *)&v18 init];
  if (v10)
  {
    BOOL v11 = a5 >= 0.0 && a5 <= 1.0;
    if (!v11 || a4 < 0.0 || a3 > 1.0 || a3 < 0.0 || a4 > 1.0) {
      UIColorBreakForOutOfRangeColorComponents();
    }
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
    v10->redComponent = v13;
    if (a4 <= 1.0) {
      double v14 = a4;
    }
    else {
      double v14 = 1.0;
    }
    if (a4 < 0.0) {
      double v14 = 0.0;
    }
    v10->greenComponent = v14;
    if (a5 <= 1.0) {
      double v15 = a5;
    }
    else {
      double v15 = 1.0;
    }
    if (a5 < 0.0) {
      double v15 = 0.0;
    }
    v10->blueComponent = v15;
    if (a6 <= 1.0) {
      double v12 = a6;
    }
    if (a6 < 0.0) {
      double v12 = 0.0;
    }
    v10->alphaComponent = v12;
    v16 = v10;
  }

  return v10;
}

- (void)dealloc
{
  CGColorRelease(self->_cachedColor);
  v3.receiver = self;
  v3.super_class = (Class)UIDisplayP3Color;
  [(UIDisplayP3Color *)&v3 dealloc];
}

- (UIDisplayP3Color)colorWithAlphaComponent:(double)a3
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
    v5 = [[UIDisplayP3Color alloc] initWithDisplayP3Red:self->redComponent green:self->greenComponent blue:self->blueComponent alpha:v4];
  }
  return v5;
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
  v5 = [(UIDisplayP3Color *)self CGColor];
  CGContextSetFillColorWithColor(v4, v5);
  CGContextSetStrokeColorWithColor(v4, v5);
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
  v5 = [(UIDisplayP3Color *)self CGColor];
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
  v5 = [(UIDisplayP3Color *)self CGColor];
  CGContextSetStrokeColorWithColor(v4, v5);
}

- (id)colorSpaceName
{
  return @"UIDisplayP3ColorSpace";
}

- (id)description
{
  double v3 = NSString;
  double v4 = [(UIDisplayP3Color *)self colorSpaceName];
  v5 = [v3 stringWithFormat:@"%@ %g %g %g %g", v4, *(void *)&self->redComponent, *(void *)&self->greenComponent, *(void *)&self->blueComponent, *(void *)&self->alphaComponent];

  return v5;
}

- (BOOL)_isDeepColor
{
  double v9 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  uint64_t v6 = 0;
  [(UIDisplayP3Color *)self getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
  double v2 = 1.0;
  if (v9 <= 1.0) {
    double v3 = v9;
  }
  else {
    double v3 = 1.0;
  }
  if (v9 < 0.0) {
    double v3 = 0.0;
  }
  if (v9 != v3) {
    return 1;
  }
  if (v8 <= 1.0) {
    double v2 = v8;
  }
  if (v8 < 0.0) {
    double v2 = 0.0;
  }
  if (v8 != v2) {
    return 1;
  }
  double v5 = 1.0;
  if (v7 <= 1.0) {
    double v5 = v7;
  }
  if (v7 < 0.0) {
    double v5 = 0.0;
  }
  return v7 != v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (UIDisplayP3Color *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![(UIColor *)v4 _isDynamic])
  {
    uint64_t v6 = [(UIDisplayP3Color *)v4 colorSpaceName];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->redComponent == v4->redComponent
        && self->greenComponent == v4->greenComponent
        && self->blueComponent == v4->blueComponent)
      {
        double alphaComponent = self->alphaComponent;
LABEL_18:
        BOOL v5 = alphaComponent == v4->alphaComponent;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      double v8 = [(UIDisplayP3Color *)self colorSpaceName];
      int v9 = [v6 isEqualToString:v8];

      if (v9
        || ([v6 isEqualToString:@"UIExtendedSRGBColorSpace"] & 1) != 0
        || [v6 isEqualToString:@"UIDeviceRGBColorSpace"])
      {
        double v13 = 0.0;
        double v14 = 0.0;
        double v11 = 0.0;
        double v12 = 0.0;
        [(UIDisplayP3Color *)self getRed:&v14 green:&v13 blue:&v12 alpha:&v11];
        if (v14 == v4->redComponent && v13 == v4->greenComponent && v12 == v4->blueComponent)
        {
          double alphaComponent = v11;
          goto LABEL_18;
        }
      }
    }
    BOOL v5 = 0;
    goto LABEL_20;
  }
  BOOL v5 = 0;
LABEL_21:

  return v5;
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

- (CGColor)CGColor
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v2 = (CGColor *)atomic_load((unint64_t *)&self->_cachedColor);
  if (!v2)
  {
    double alphaComponent = self->alphaComponent;
    double greenComponent = self->greenComponent;
    double redComponent = self->redComponent;
    double v11 = greenComponent;
    double blueComponent = self->blueComponent;
    double v13 = alphaComponent;
    long long v8 = 0u;
    long long v9 = 0u;
    UISCreateCachedColorTransform();
    if (qword_1EB25E440 != -1) {
      dispatch_once(&qword_1EB25E440, &__block_literal_global_2190);
    }
    if (CGColorTransformConvertColorComponents())
    {
      *((double *)&v9 + 1) = alphaComponent;
      if (qword_1EB25E410 != -1) {
        dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
      }
      double v2 = CGColorCreate((CGColorSpaceRef)qword_1EB25E408, (const CGFloat *)&v8);
    }
    else
    {
      double v2 = 0;
    }
    CGColorTransformRelease();
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_cachedColor, (unint64_t *)&v6, (unint64_t)v2);
    if (v6)
    {
      CGColorRelease(v2);
      return v6;
    }
  }
  return v2;
}

- (double)alphaComponent
{
  return self->alphaComponent;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  double v16 = 0.0;
  double v17 = 0.0;
  double v15 = 0.0;
  [(UIDisplayP3Color *)self getRed:&v17 green:&v16 blue:&v15 alpha:0];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  _NXRGBToHSB((long double *)&v14, (double *)&v13, (double *)&v12, v17, v16, v15);
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
    *a6 = self->alphaComponent;
  }
  return 1;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double greenComponent = self->greenComponent;
  double blueComponent = self->blueComponent;
  double alphaComponent = self->alphaComponent;
  v16[0] = *(void *)&self->redComponent;
  *(double *)&v16[1] = greenComponent;
  *(double *)&v16[2] = blueComponent;
  *(double *)&v16[3] = alphaComponent;
  if (qword_1EB25E440 != -1) {
    dispatch_once(&qword_1EB25E440, &__block_literal_global_2190);
  }
  uint64_t v13 = qword_1EB25E438;
  long long v17 = 0u;
  long long v18 = 0u;
  if (qword_1EB25E410 != -1) {
    dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
  }
  if (qword_1EB25E408 == v13) {
    goto LABEL_12;
  }
  if (qword_1EB25E450 != -1) {
    dispatch_once(&qword_1EB25E450, &__block_literal_global_2192);
  }
  if (qword_1EB25E448 == v13)
  {
LABEL_12:
    uint64_t v14 = (double *)v16;
    if (!a3) {
      goto LABEL_14;
    }
LABEL_13:
    *a3 = *v14;
    goto LABEL_14;
  }
  UISCreateCachedColorTransform();
  if (!CGColorTransformConvertColorComponents())
  {
    CGColorTransformRelease();
    return 0;
  }
  *((double *)&v18 + 1) = alphaComponent;
  CGColorTransformRelease();
  uint64_t v14 = (double *)&v17;
  if (a3) {
    goto LABEL_13;
  }
LABEL_14:
  if (a4) {
    *a4 = v14[1];
  }
  if (a5) {
    *a5 = v14[2];
  }
  if (a6) {
    *a6 = v14[3];
  }
  return 1;
}

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
  if (qword_1EB25E440 != -1) {
    dispatch_once(&qword_1EB25E440, &__block_literal_global_2190);
  }
  uint64_t v9 = qword_1EB25E438;
  uint64_t v13 = 0;
  double v14 = 0.0;
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

@end