@interface ICQPreferencesRemoteUIDelegateBorderedButton
- (void)drawRect:(CGRect)a3;
@end

@implementation ICQPreferencesRemoteUIDelegateBorderedButton

- (void)drawRect:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ICQPreferencesRemoteUIDelegateBorderedButton;
  -[ICQPreferencesRemoteUIDelegateBorderedButton drawRect:](&v14, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ICQPreferencesRemoteUIDelegateBorderedButton *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 1.0);
  id v13 = [MEMORY[0x263F825C8] colorWithWhite:0.78 alpha:1.0];
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v13 CGColor]);

  CGContextMoveToPoint(CurrentContext, v5, v7);
  CGContextAddLineToPoint(CurrentContext, v9, v7);
  CGContextMoveToPoint(CurrentContext, v5, v11);
  CGContextAddLineToPoint(CurrentContext, v9, v11);
  CGContextStrokePath(CurrentContext);
}

@end