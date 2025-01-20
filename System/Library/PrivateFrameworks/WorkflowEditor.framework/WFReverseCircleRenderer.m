@interface WFReverseCircleRenderer
- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4;
@end

@implementation WFReverseCircleRenderer

- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  -[MKOverlayRenderer rectForMapRect:](self, "rectForMapRect:", *MEMORY[0x263F10860], *(double *)(MEMORY[0x263F10860] + 8), *(double *)(MEMORY[0x263F10860] + 16), *(double *)(MEMORY[0x263F10860] + 24));
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGContextSaveGState(a4);
  v17.origin.x = v8;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  CGContextAddRect(a4, v17);
  CGContextAddPath(a4, a3);
  CGContextClip(a4);
  id v15 = [(MKOverlayPathRenderer *)self fillColor];
  CGContextSetFillColorWithColor(a4, (CGColorRef)[v15 CGColor]);

  v18.origin.x = v8;
  v18.origin.y = v10;
  v18.size.width = v12;
  v18.size.height = v14;
  CGContextFillRect(a4, v18);
  CGContextRestoreGState(a4);
}

@end