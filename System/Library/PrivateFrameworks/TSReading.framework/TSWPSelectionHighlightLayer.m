@interface TSWPSelectionHighlightLayer
- (void)renderInContext:(CGContext *)a3;
@end

@implementation TSWPSelectionHighlightLayer

- (void)renderInContext:(CGContext *)a3
{
  if (([(TSWPSelectionHighlightLayer *)self isHidden] & 1) == 0)
  {
    CGContextSaveGState(a3);
    v5 = (CGColor *)[(TSWPSelectionHighlightLayer *)self fillColor];
    if (v5) {
      CGContextSetFillColorWithColor(a3, v5);
    }
    v6 = (CGColor *)[(TSWPSelectionHighlightLayer *)self strokeColor];
    if (v6) {
      CGContextSetStrokeColorWithColor(a3, v6);
    }
    [(TSWPSelectionHighlightLayer *)self lineWidth];
    CGContextSetLineWidth(a3, v7);
    [(TSWPSelectionHighlightLayer *)self miterLimit];
    CGContextSetMiterLimit(a3, v8);
    v9 = (void *)[(TSWPSelectionHighlightLayer *)self lineCap];
    if ([v9 isEqualToString:*MEMORY[0x263F15E68]])
    {
      CGLineCap v10 = kCGLineCapButt;
    }
    else if ([v9 isEqualToString:*MEMORY[0x263F15E70]])
    {
      CGLineCap v10 = kCGLineCapRound;
    }
    else
    {
      if (![v9 isEqualToString:*MEMORY[0x263F15E78]]) {
        goto LABEL_13;
      }
      CGLineCap v10 = kCGLineCapSquare;
    }
    CGContextSetLineCap(a3, v10);
LABEL_13:
    v11 = (void *)[(TSWPSelectionHighlightLayer *)self lineJoin];
    if ([v11 isEqualToString:*MEMORY[0x263F15E88]])
    {
      CGLineJoin v12 = kCGLineJoinMiter;
    }
    else if ([v11 isEqualToString:*MEMORY[0x263F15E98]])
    {
      CGLineJoin v12 = kCGLineJoinRound;
    }
    else
    {
      if (![v11 isEqualToString:*MEMORY[0x263F15E80]]) {
        goto LABEL_20;
      }
      CGLineJoin v12 = kCGLineJoinBevel;
    }
    CGContextSetLineJoin(a3, v12);
LABEL_20:
    objc_msgSend((id)-[TSWPSelectionHighlightLayer lineDashPattern](self, "lineDashPattern"), "count");
    operator new[]();
  }
}

@end