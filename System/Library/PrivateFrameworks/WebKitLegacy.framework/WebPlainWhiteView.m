@interface WebPlainWhiteView
- (id)elementAtPoint:(CGPoint)a3;
- (id)elementAtPoint:(CGPoint)a3 allowShadowContent:(BOOL)a4;
- (void)drawRect:(CGRect)a3;
@end

@implementation WebPlainWhiteView

- (void)drawRect:(CGRect)a3
{
  v4 = (CGContext *)WKGetCurrentGraphicsContext();
  WebCore::cachedCGColor();
  CGContextSetFillColorWithColor(v4, color);
  if (color) {
    CFRelease(color);
  }
  [(WebPlainWhiteView *)self bounds];
  WKRectFill();
}

- (id)elementAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)elementAtPoint:(CGPoint)a3 allowShadowContent:(BOOL)a4
{
  return 0;
}

@end