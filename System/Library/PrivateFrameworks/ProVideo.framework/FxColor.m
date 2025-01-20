@interface FxColor
+ (id)colorWithCGColor:(CGColor *)a3;
+ (id)colorWithCIColor:(id)a3;
+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5;
+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)colorWithString:(id)a3;
- (CGColor)_cgColor;
- (CGColorSpace)colorSpace;
- (FxColor)initWithCGColor:(CGColor *)a3;
- (FxColor)initWithCoder:(id)a3;
- (FxColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (FxColor)initWithString:(id)a3;
- (const)components;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
- (id)ciColor;
- (id)description;
- (id)stringRepresentation;
- (unint64_t)numberOfComponents;
- (void)convertToRGBA:(double *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FxColor

+ (id)colorWithCGColor:(CGColor *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCGColor:a3];

  return v3;
}

+ (id)colorWithCIColor:(id)a3
{
  [a3 red];
  double v5 = v4;
  [a3 green];
  double v7 = v6;
  [a3 blue];
  double v9 = v8;
  [a3 alpha];

  return +[FxColor colorWithRed:v5 green:v7 blue:v9 alpha:v10];
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  double v6 = (void *)[objc_alloc((Class)a1) initWithRed:a3 green:a4 blue:a5 alpha:a6];

  return v6;
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  return (id)[a1 colorWithRed:a3 green:a4 blue:a5 alpha:1.0];
}

+ (id)colorWithString:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithString:a3];

  return v3;
}

- (FxColor)initWithString:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v4 = (char *)[a3 UTF8String];
  if (v4)
  {
    double v5 = v4;
    double v10 = 0;
    int v6 = *v4;
    if (v6 == 91 || v6 == 40) {
      double v5 = v4 + 1;
    }
    uint64_t v7 = 0;
    while (1)
    {
      *((double *)&v11 + v7) = strtod(v5, &v10);
      if (v10 == v5) {
        break;
      }
      ++v7;
      double v5 = v10;
      if (v7 == 4) {
        return -[FxColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
      }
    }
    switch((int)v7)
    {
      case 0:
        *(void *)&long long v12 = 0;
        *((void *)&v12 + 1) = 0x3FF0000000000000;
        long long v11 = 0uLL;
        break;
      case 1:
        *((void *)&v12 + 1) = 0x3FF0000000000000;
        *((void *)&v11 + 1) = v11;
        *(void *)&long long v12 = v11;
        break;
      case 2:
        long long v9 = v11;
        *((void *)&v11 + 1) = v11;
        long long v12 = v9;
        break;
      case 3:
        *((void *)&v12 + 1) = 0x3FF0000000000000;
        break;
      default:
        return -[FxColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
    }
    return -[FxColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
  }
  else
  {
    return [(FxColor *)self initWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  }
}

- (FxColor)initWithCGColor:(CGColor *)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FxColor;
    double v4 = [(FxColor *)&v6 init];
    if (v4) {
      v4->_priv = CGColorRetain(a3);
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (FxColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  DeviceRGB = (CGColorSpace *)initWithRed_green_blue_alpha__cs;
  if (!initWithRed_green_blue_alpha__cs)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    initWithRed_green_blue_alpha__cs = (uint64_t)DeviceRGB;
  }
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  long long v12 = CGColorCreate(DeviceRGB, components);
  uint64_t v13 = [(FxColor *)self initWithCGColor:v12];
  CGColorRelease(v12);
  return v13;
}

- (void)dealloc
{
  CGColorRelease((CGColorRef)self->_priv);
  v3.receiver = self;
  v3.super_class = (Class)FxColor;
  [(FxColor *)&v3 dealloc];
}

- (unint64_t)numberOfComponents
{
  return CGColorGetNumberOfComponents((CGColorRef)self->_priv);
}

- (const)components
{
  return CGColorGetComponents((CGColorRef)self->_priv);
}

- (double)alpha
{
  return CGColorGetAlpha((CGColorRef)self->_priv);
}

- (double)red
{
  unint64_t v3 = [(FxColor *)self numberOfComponents];
  double v4 = [(FxColor *)self components];
  double result = 0.0;
  if (v3 >= 2) {
    return *v4;
  }
  return result;
}

- (double)green
{
  unint64_t v3 = [(FxColor *)self numberOfComponents];
  double v4 = [(FxColor *)self components];
  double result = 0.0;
  if (v3 >= 3) {
    return v4[1];
  }
  return result;
}

- (double)blue
{
  unint64_t v3 = [(FxColor *)self numberOfComponents];
  double v4 = [(FxColor *)self components];
  double result = 0.0;
  if (v3 >= 4) {
    return v4[2];
  }
  return result;
}

- (id)stringRepresentation
{
  unint64_t v3 = NSString;
  [(FxColor *)self red];
  uint64_t v5 = v4;
  [(FxColor *)self green];
  uint64_t v7 = v6;
  [(FxColor *)self blue];
  uint64_t v9 = v8;
  [(FxColor *)self alpha];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%g %g %g %g", v5, v7, v9, v10);
}

- (CGColorSpace)colorSpace
{
  return CGColorGetColorSpace((CGColorRef)self->_priv);
}

- (void)convertToRGBA:(double *)a3
{
  unint64_t v5 = [(FxColor *)self numberOfComponents];
  uint64_t v6 = [(FxColor *)self components];
  if (v5)
  {
    double v7 = 1.0;
    if (v5 != 1) {
      double v7 = *v6;
    }
    *a3 = v7;
    double v8 = v6[v5 > 2];
    a3[1] = v8;
    double v9 = v6[2 * (v5 > 3)];
    a3[2] = v9;
    double v10 = v6[v5 - 1];
    *a3 = v7 * v10;
    a3[1] = v8 * v10;
    a3[2] = v9 * v10;
    a3[3] = v10;
  }
}

- (CGColor)_cgColor
{
  return (CGColor *)self->_priv;
}

- (id)ciColor
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  [(FxColor *)self convertToRGBA:&v8];
  double v4 = *(double *)&v8 / *((double *)&v9 + 1);
  *(float *)&double v4 = *(double *)&v8 / *((double *)&v9 + 1);
  [a3 encodeFloat:@"red" forKey:v4];
  double v5 = *((double *)&v8 + 1) / *((double *)&v9 + 1);
  *(float *)&double v5 = *((double *)&v8 + 1) / *((double *)&v9 + 1);
  [a3 encodeFloat:@"green" forKey:v5];
  double v6 = *(double *)&v9 / *((double *)&v9 + 1);
  *(float *)&double v6 = *(double *)&v9 / *((double *)&v9 + 1);
  [a3 encodeFloat:@"blue" forKey:v6];
  HIDWORD(v7) = HIDWORD(v9);
  *(float *)&double v7 = *((double *)&v9 + 1);
  [a3 encodeFloat:@"alpha" forKey:v7];
}

- (FxColor)initWithCoder:(id)a3
{
  [a3 decodeFloatForKey:@"red"];
  double v6 = v5;
  [a3 decodeFloatForKey:@"green"];
  double v8 = v7;
  [a3 decodeFloatForKey:@"blue"];
  double v10 = v9;
  [a3 decodeFloatForKey:@"alpha"];

  return [(FxColor *)self initWithRed:v6 green:v8 blue:v10 alpha:v11];
}

- (id)description
{
  unint64_t v3 = NSString;
  [(FxColor *)self red];
  uint64_t v5 = v4;
  [(FxColor *)self green];
  uint64_t v7 = v6;
  [(FxColor *)self blue];
  uint64_t v9 = v8;
  [(FxColor *)self alpha];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"(%g %g %g %g)", v5, v7, v9, v10);
}

@end