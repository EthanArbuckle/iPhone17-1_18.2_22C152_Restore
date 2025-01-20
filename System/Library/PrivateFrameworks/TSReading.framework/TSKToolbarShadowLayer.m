@interface TSKToolbarShadowLayer
- (void)drawInContext:(CGContext *)a3;
@end

@implementation TSKToolbarShadowLayer

- (void)drawInContext:(CGContext *)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)TSKToolbarShadowLayer;
  -[TSKToolbarShadowLayer drawInContext:](&v11, sel_drawInContext_);
  CGContextSaveGState(a3);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.100000001), "CGColor");
  v12[1] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "clearColor"), "CGColor");
  v6 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)[MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2], 0);
  [(TSKToolbarShadowLayer *)self bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  CGContextClipToRect(a3, v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  v13.CGFloat y = CGRectGetHeight(v15);
  v13.CGFloat x = 0.0;
  CGContextDrawLinearGradient(a3, v6, *MEMORY[0x263F00148], v13, 0);
  CGGradientRelease(v6);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRestoreGState(a3);
}

@end