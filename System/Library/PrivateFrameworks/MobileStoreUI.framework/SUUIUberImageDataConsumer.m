@interface SUUIUberImageDataConsumer
- (UIColor)backgroundColor;
- (id)imageForImage:(id)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SUUIUberImageDataConsumer

- (id)imageForImage:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  [v4 size];
  double v8 = v7;
  v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  CGFloat v11 = v10;
  v39.width = v6;
  v39.height = v8;
  UIGraphicsBeginImageContextWithOptions(v39, 1, v11);

  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, v6, v8);
  if (self->_backgroundColor)
  {
    c = CurrentContext;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_2568A17C8;
    long long v36 = unk_2568A17D8;
    id v14 = [(UIColor *)self->_backgroundColor colorWithAlphaComponent:0.0];
    CGColorRef v15 = CGColorRetain((CGColorRef)[v14 CGColor]);

    id v16 = [(UIColor *)self->_backgroundColor colorWithAlphaComponent:0.25];
    CGColorRef v17 = CGColorRetain((CGColorRef)[v16 CGColor]);

    id v18 = [(UIColor *)self->_backgroundColor colorWithAlphaComponent:0.75];
    CGColorRef v19 = CGColorRetain((CGColorRef)[v18 CGColor]);

    id v20 = [(UIColor *)self->_backgroundColor colorWithAlphaComponent:1.0];
    CGColorRef v21 = CGColorRetain((CGColorRef)[v20 CGColor]);

    values[0] = v15;
    values[1] = v17;
    values[2] = v19;
    values[3] = v21;
    CFArrayRef v22 = CFArrayCreate(0, (const void **)values, 4, MEMORY[0x263EFFF70]);
    v23 = CGGradientCreateWithColors(DeviceRGB, v22, locations);
    [v4 size];
    double v25 = v24;
    v26 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v27 = [v26 userInterfaceIdiom];

    double v28 = 70.0;
    if ((v27 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      double v28 = 30.0;
    }
    CGFloat v29 = v25 - v28;
    [v4 size];
    v41.y = v30;
    v40.x = 0.0;
    v41.x = 0.0;
    v40.y = v29;
    CGContextDrawLinearGradient(c, v23, v40, v41, 0);
    CGGradientRelease(v23);
    CFRelease(v22);
    CGColorRelease(v15);
    CGColorRelease(v17);
    CGColorRelease(v19);
    CGColorRelease(v21);
    CGColorSpaceRelease(DeviceRGB);
  }
  v31 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v31;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end