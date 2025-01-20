@interface RTIColor
+ (BOOL)supportsSecureCoding;
+ (RTIColor)colorWithCGColor:(CGColor *)a3;
+ (RTIColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (RTIColor)colorWithWhite:(double)a3 alpha:(double)a4;
- (BOOL)isEqual:(id)a3;
- (CGColor)cgColor;
- (RTIColor)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTIColor

+ (RTIColor)colorWithWhite:(double)a3 alpha:(double)a4
{
  v6 = (double *)objc_alloc_init((Class)a1);
  *((unsigned char *)v6 + 8) = 0;
  v6[2] = a3;
  v6[3] = a4;
  v6[4] = 0.0;
  v6[5] = 0.0;
  return (RTIColor *)v6;
}

+ (RTIColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v10 = (double *)objc_alloc_init((Class)a1);
  *((unsigned char *)v10 + 8) = 1;
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a5;
  v10[5] = a6;
  return (RTIColor *)v10;
}

+ (RTIColor)colorWithCGColor:(CGColor *)a3
{
  v4 = (char *)objc_alloc_init((Class)a1);
  v4[8] = 1;
  *((void *)v4 + 6) = CGColorRetain(a3);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(DeviceRGB, kCGRenderingIntentDefault, a3, 0);
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  size_t NumberOfComponents = CGColorGetNumberOfComponents(CopyByMatchingToColorSpace);
  memcpy(v4 + 16, Components, 8 * NumberOfComponents);
  CGColorRelease(CopyByMatchingToColorSpace);
  return (RTIColor *)v4;
}

- (CGColor)cgColor
{
  result = self->_cgColor;
  if (!result)
  {
    if (*((unsigned char *)self + 8) == 1)
    {
      result = CGColorCreateSRGB(self->_values[0], self->_values[1], self->_values[2], self->_values[3]);
      goto LABEL_6;
    }
    if (!*((unsigned char *)self + 8))
    {
      result = CGColorCreateGenericGray(self->_values[0], self->_values[1]);
LABEL_6:
      self->_cgColor = result;
      return result;
    }
    return 0;
  }
  return result;
}

- (void)dealloc
{
  cgColor = self->_cgColor;
  if (cgColor)
  {
    CFRelease(cgColor);
    self->_cgColor = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RTIColor;
  [(RTIColor *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_values length:32 freeWhenDone:0];
  [v4 encodeInt32:*((char *)self + 8) forKey:@"colorType"];
  [v4 encodeObject:v5 forKey:@"colorValues"];
}

- (RTIColor)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v8.receiver = self;
  v8.super_class = (Class)RTIColor;
  id v5 = [(RTIColor *)&v8 init];
  if (v5)
  {
    *((unsigned char *)v5 + 8) = [v4 decodeInt32ForKey:@"colorType"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorValues"];
    [v6 getBytes:v5->_values length:32];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[RTIColor allocWithZone:a3] init];
  *((unsigned char *)result + 8) = *((unsigned char *)self + 8);
  long long v5 = *(_OWORD *)&self->_values[2];
  *((_OWORD *)result + 1) = *(_OWORD *)self->_values;
  *((_OWORD *)result + 2) = v5;
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = 0;
  unint64_t result = *((char *)self + 8);
  values = self->_values;
  do
    unint64_t result = (unint64_t)((double)(257 * result) + values[v3++] * 256.0);
  while (v3 != 4);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTIColor *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
      && *((unsigned __int8 *)self + 8) == *((unsigned __int8 *)v4 + 8)
      && *(void *)&v4->_values[0] == *(void *)&self->_values[0]
      && *(void *)&v4->_values[1] == *(void *)&self->_values[1]
      && *(void *)&v4->_values[2] == *(void *)&self->_values[2]
      && *(void *)&v4->_values[3] == *(void *)&self->_values[3];
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  [v3 appendFormat:@"; color = %@", -[RTIColor cgColor](self, "cgColor")];
  return v3;
}

@end