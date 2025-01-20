@interface PKColor
+ (BOOL)supportsSecureCoding;
+ (id)colorFromString:(id)a3;
+ (id)colorWithH:(double)a3 S:(double)a4 B:(double)a5 A:(double)a6;
+ (id)colorWithR:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6;
+ (id)matchingColorFromColor:(CGColor *)a3;
- (BOOL)isEqual:(id)a3;
- (CGColor)CGColor;
- (NSString)string;
- (PKColor)initWithCoder:(id)a3;
- (double)luminance;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKColor

- (void)dealloc
{
  v3 = (const void *)atomic_load((unint64_t *)&self->_colorRef);
  if (v3) {
    CFRelease(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKColor;
  [(PKColor *)&v4 dealloc];
}

+ (id)colorFromString:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F28FE8];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initWithString:v4];

    int v15 = 0;
    if ([v5 scanString:@"#" intoString:0]
      && [v5 scanHexInt:&v15]
      && [v5 isAtEnd])
    {
      v6 = +[PKColor colorWithR:(float)((float)BYTE2(v15) / 255.0) G:(float)((float)BYTE1(v15) / 255.0) B:(float)((float)v15 / 255.0) A:1.0];
    }
    else
    {
      [v5 setScanLocation:0];
      id v14 = 0;
      int v7 = objc_msgSend(v5, "scanUpToString:intoString:", @"("), &v14;
      id v8 = v14;
      id v9 = 0;
      if (v7
        && (id v9 = 0, [v5 scanString:@"(" intoString:0)]
        && (v13 = 0, int v10 = objc_msgSend(v5, "scanUpToString:intoString:", @""), &v13),
                       id v9 = v13,
                       v10)
        && objc_msgSend(v5, "scanString:intoString:", @""), 0)
        && [v5 isAtEnd])
      {
        v11 = [v9 componentsSeparatedByString:@","];
        v6 = _ColorWithColorSpaceAndComponents(v8, v11);
      }
      else
      {
        [v5 setScanLocation:0];
        v6 = 0;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)colorWithR:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6
{
  v6 = objc_alloc_init(PKColor);
  v7.f64[0] = a3;
  v7.f64[1] = a4;
  __asm { FMOV            V1.2D, #1.0 }
  *(int8x16_t *)&v6->_red = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v7, _Q1), (int8x16_t)_Q1, (int8x16_t)v7), (int8x16_t)vcltzq_f64(v7));
  v7.f64[0] = a5;
  v7.f64[1] = a6;
  *(int8x16_t *)&v6->_blue = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v7, _Q1), (int8x16_t)_Q1, (int8x16_t)v7), (int8x16_t)vcltzq_f64(v7));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKColor;
  v5 = [(PKColor *)&v11 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"red"];
    v5->_red = v6;
    [v4 decodeFloatForKey:@"green"];
    v5->_green = v7;
    [v4 decodeFloatForKey:@"blue"];
    v5->_blue = v8;
    [v4 decodeFloatForKey:@"alpha"];
    v5->_alpha = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float red = self->_red;
  id v9 = a3;
  *(float *)&double v5 = red;
  [v9 encodeFloat:@"red" forKey:v5];
  double green = self->_green;
  *(float *)&double green = green;
  [v9 encodeFloat:@"green" forKey:green];
  double blue = self->_blue;
  *(float *)&double blue = blue;
  [v9 encodeFloat:@"blue" forKey:blue];
  double alpha = self->_alpha;
  *(float *)&double alpha = alpha;
  [v9 encodeFloat:@"alpha" forKey:alpha];
}

- (CGColor)CGColor
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  result = (CGColor *)atomic_load((unint64_t *)&self->_colorRef);
  if (!result)
  {
    long long v4 = *(_OWORD *)&self->_blue;
    v6[0] = *(_OWORD *)&self->_red;
    v6[1] = v4;
    if (qword_1EB402B88 != -1) {
      dispatch_once(&qword_1EB402B88, &__block_literal_global_23);
    }
    result = CGColorCreate((CGColorSpaceRef)_MergedGlobals_199, (const CGFloat *)v6);
    if (result)
    {
      double v5 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_colorRef, (unint64_t *)&v5, (unint64_t)result);
      if (v5)
      {
        CFRelease(result);
        return v5;
      }
    }
  }
  return result;
}

+ (id)matchingColorFromColor:(CGColor *)a3
{
  if (!a3) {
    goto LABEL_13;
  }
  v3 = a3;
  if (qword_1EB402B88 != -1) {
    goto LABEL_14;
  }
  while (1)
  {
    long long v4 = (CGColorSpace *)_MergedGlobals_199;
    if (CGColorSpaceGetNumberOfComponents((CGColorSpaceRef)_MergedGlobals_199) == 3) {
      break;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    dispatch_once(&qword_1EB402B88, &__block_literal_global_23);
  }
  if (CGColorGetColorSpace(v3) == v4) {
    CopyByMatchingToColorSpace = (CGColor *)CFRetain(v3);
  }
  else {
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v4, kCGRenderingIntentPerceptual, v3, 0);
  }
  float v6 = CopyByMatchingToColorSpace;
  if (CopyByMatchingToColorSpace)
  {
    Components = CGColorGetComponents(CopyByMatchingToColorSpace);
    float v8 = objc_alloc_init(PKColor);
    uint64_t v9 = 0;
    v8->_float red = *Components;
    v8->_double green = Components[1];
    v8->_double blue = Components[2];
    v8->_double alpha = Components[3];
    atomic_compare_exchange_strong((atomic_ullong *volatile)&v8->_colorRef, (unint64_t *)&v9, (unint64_t)v6);
    if (v9) {
      CFRelease(v6);
    }
  }
  else
  {
    float v8 = 0;
  }
  return v8;
}

+ (id)colorWithH:(double)a3 S:(double)a4 B:(double)a5 A:(double)a6
{
  if (a3 <= 1.0) {
    double v6 = a3;
  }
  else {
    double v6 = 1.0;
  }
  if (a3 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.0;
  }
  if (a4 <= 1.0) {
    double v8 = a4;
  }
  else {
    double v8 = 1.0;
  }
  if (a4 >= 0.0) {
    double v9 = v8;
  }
  else {
    double v9 = 0.0;
  }
  if (a5 <= 1.0) {
    double v10 = a5;
  }
  else {
    double v10 = 1.0;
  }
  if (a5 >= 0.0) {
    double v11 = v10;
  }
  else {
    double v11 = 0.0;
  }
  double v12 = v7 * 6.0;
  if (v7 == 1.0) {
    double v12 = 0.0;
  }
  float v13 = v12;
  int v14 = (int)v13;
  HIDWORD(v15) = 0;
  *(float *)&double v15 = (1.0 - v9) * v11;
  double v16 = (float)(v13 - (float)(int)v13);
  double v19 = v11 * (1.0 - v9 * v16);
  float v17 = v19;
  double v18 = v11 * (1.0 - v9 * (1.0 - v16));
  *(float *)&double v19 = v18;
  switch(v14)
  {
    case 0:
      double v19 = *(float *)&v19;
      double v15 = *(float *)&v15;
      goto LABEL_31;
    case 1:
      double v18 = v17;
      double v15 = *(float *)&v15;
      goto LABEL_25;
    case 2:
      double v18 = *(float *)&v15;
      double v15 = *(float *)&v19;
LABEL_25:
      double v19 = v11;
      return (id)[a1 colorWithR:v18 G:v19 B:v15 A:a6];
    case 3:
      double v18 = *(float *)&v15;
      double v19 = v17;
      goto LABEL_29;
    case 4:
      double v18 = *(float *)&v19;
      double v19 = *(float *)&v15;
LABEL_29:
      double v15 = v11;
      break;
    case 5:
      double v19 = *(float *)&v15;
      double v15 = v17;
LABEL_31:
      double v18 = v11;
      break;
    default:
      return (id)[a1 colorWithR:v18 G:v19 B:v15 A:a6];
  }
  return (id)[a1 colorWithR:v18 G:v19 B:v15 A:a6];
}

- (double)luminance
{
  return self->_green * 0.7152 + self->_red * 0.2126 + self->_blue * 0.0722;
}

- (NSString)string
{
  v3 = &unk_191673000;
  float v4 = self->_red * 255.0;
  LODWORD(v3) = llroundf(v4);
  float v5 = self->_green * 255.0;
  LODWORD(v2) = llroundf(v5);
  unint64_t v6 = 0x1E4F29000uLL;
  float v7 = self->_blue * 255.0;
  LODWORD(v6) = llroundf(v7);
  return (NSString *)[NSString stringWithFormat:@"rgba(%d, %d, %d, %.2f)", v3, v2, v6, *(void *)&self->_alpha];
}

- (unint64_t)hash
{
  float v2 = self->_red * 255.0;
  unint64_t v3 = llroundf(v2);
  float v4 = self->_green * 255.0;
  unint64_t v5 = llroundf(v4);
  float v6 = self->_blue * 255.0;
  float v7 = self->_alpha * 255.0;
  return (v5 << 16) | (v3 << 24) | (llroundf(v6) << 8) | llroundf(v7);
}

- (BOOL)isEqual:(id)a3
{
  float v4 = (PKColor *)a3;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      if (self) {
        LOBYTE(self) = self->_red == v5[1] && self->_green == v5[2] && self->_blue == v5[3] && self->_alpha == v5[4];
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

@end