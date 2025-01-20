@interface SUInnerShadowLabel
- (void)drawRect:(CGRect)a3;
@end

@implementation SUInnerShadowLabel

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = (CGColor *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor"), "CGColor");
  v13.double width = 0.0;
  v13.double height = 1.0;
  CGContextSetShadowWithColor(CurrentContext, v13, 0.0, v9);
  CGContextBeginTransparencyLayer(CurrentContext, 0);
  v12.receiver = self;
  v12.super_class = (Class)SUInnerShadowLabel;
  -[SUInnerShadowLabel drawRect:](&v12, sel_drawRect_, x, y, width, height);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceAtop);
  CGContextBeginTransparencyLayer(CurrentContext, 0);
  v10 = (CGColor *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.45), "CGColor");
  v14.double width = 0.0;
  v14.double height = 1.0;
  CGContextSetShadowWithColor(CurrentContext, v14, 0.0, v10);
  CGContextBeginTransparencyLayer(CurrentContext, 0);
  [(SUInnerShadowLabel *)self bounds];
  CGContextFillRect(CurrentContext, v15);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOut);
  v11.receiver = self;
  v11.super_class = (Class)SUInnerShadowLabel;
  -[SUInnerShadowLabel drawRect:](&v11, sel_drawRect_, x, y, width, height);
  CGContextEndTransparencyLayer(CurrentContext);
  CGContextEndTransparencyLayer(CurrentContext);
  CGContextEndTransparencyLayer(CurrentContext);
}

@end