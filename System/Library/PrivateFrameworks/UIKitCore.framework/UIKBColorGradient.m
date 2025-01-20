@interface UIKBColorGradient
+ (id)gradientWithUIColor:(id)a3;
- (CGGradient)CGGradient;
- (UIKBColorGradient)initWithUIColor:(id)a3;
@end

@implementation UIKBColorGradient

+ (id)gradientWithUIColor:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUIColor:v3];

  return v4;
}

- (UIKBColorGradient)initWithUIColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBColorGradient;
  v6 = [(UIKBColorGradient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_color, a3);
  }

  return v7;
}

- (CGGradient)CGGradient
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [(UIColor *)self->_color CGColor];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  *(_OWORD *)locations = xmmword_186B89740;
  v7[0] = v2;
  v7[1] = v2;
  CFArrayRef v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = CGGradientCreateWithColors(DeviceGray, v4, locations);

  CGColorSpaceRelease(DeviceGray);
  return v5;
}

- (void).cxx_destruct
{
}

@end