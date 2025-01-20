@interface SUGradientColorStop
+ (BOOL)supportsSecureCoding;
- (CGColor)copyCGColor;
- (SUGradientColorStop)init;
- (SUGradientColorStop)initWithCoder:(id)a3;
- (SUGradientColorStop)initWithColor:(CGColor *)a3 offset:(double)a4;
- (double)offset;
- (id)description;
- (int64_t)compare:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUGradientColorStop

- (SUGradientColorStop)init
{
  return [(SUGradientColorStop *)self initWithColor:0 offset:0.0];
}

- (SUGradientColorStop)initWithColor:(CGColor *)a3 offset:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SUGradientColorStop;
  v6 = [(SUGradientColorStop *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_offset = a4;
    v6->_rawColor = CGColorRetain(a3);
    SUColorGetRGBA(a3, &v7->_r, &v7->_g, &v7->_b, &v7->_a);
  }
  return v7;
}

- (SUGradientColorStop)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SUGradientColorStop;
  v4 = [(SUGradientColorStop *)&v12 init];
  if (v4)
  {
    [a3 decodeFloatForKey:@"r"];
    v4->_r = v5;
    [a3 decodeFloatForKey:@"g"];
    v4->_g = v6;
    [a3 decodeFloatForKey:@"b"];
    v4->_b = v7;
    [a3 decodeFloatForKey:@"A"];
    v4->_a = v8;
    [a3 decodeFloatForKey:@"offset"];
    v4->_offset = v9;
    v10 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"rawcolor"];
    if (v10) {
      v4->_rawColor = CGColorRetain((CGColorRef)[v10 CGColor]);
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  rawColor = self->_rawColor;
  if (rawColor) {
    CGColorRelease(rawColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)SUGradientColorStop;
  [(SUGradientColorStop *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  double r = self->_r;
  *(float *)&double r = r;
  [a3 encodeFloat:@"r" forKey:r];
  double g = self->_g;
  *(float *)&double g = g;
  [a3 encodeFloat:@"g" forKey:g];
  double b = self->_b;
  *(float *)&double b = b;
  [a3 encodeFloat:@"b" forKey:b];
  double a = self->_a;
  *(float *)&double a = a;
  [a3 encodeFloat:@"A" forKey:a];
  double offset = self->_offset;
  *(float *)&double offset = offset;
  [a3 encodeFloat:@"offset" forKey:offset];
  if (self->_rawColor)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F1C550], "colorWithCGColor:");
    [a3 safeEncodeUIColor:v10 forKey:@"rawcolor"];
  }
}

- (int64_t)compare:(id)a3
{
  double offset = self->_offset;
  double v4 = *((double *)a3 + 5);
  if (offset < v4) {
    return -1;
  }
  else {
    return offset > v4;
  }
}

- (CGColor)copyCGColor
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  rawColodouble r = self->_rawColor;
  if (rawColor)
  {
    return CGColorCreateCopy(rawColor);
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    long long v6 = *(_OWORD *)&self->_b;
    v8[0] = *(_OWORD *)&self->_r;
    v8[1] = v6;
    float v7 = CGColorCreate(DeviceRGB, (const CGFloat *)v8);
    CGColorSpaceRelease(DeviceRGB);
    return v7;
  }
}

- (double)offset
{
  return self->_offset;
}

- (id)description
{
  v3 = NSString;
  v7.receivedouble r = self;
  v7.super_class = (Class)SUGradientColorStop;
  id v4 = [(SUGradientColorStop *)&v7 description];
  if (self->_rawColor) {
    float v5 = (__CFString *)objc_msgSend(MEMORY[0x263F1C550], "colorWithCGColor:");
  }
  else {
    float v5 = @"nil";
  }
  return (id)[v3 stringWithFormat:@"%@: Color: %@", v4, v5];
}

@end