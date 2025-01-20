@interface TSWPDefaultGraphicalAttachmentRenderer
- (void)drawAttachment:(id)a3 inContext:(CGContext *)a4 selection:(id)a5;
@end

@implementation TSWPDefaultGraphicalAttachmentRenderer

- (void)drawAttachment:(id)a3 inContext:(CGContext *)a4 selection:(id)a5
{
  [a3 size];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.578999996, 0.702000022, 0.910000026, 1.0), "CGColor"));
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.833999991, 0.883000016, 0.967000008, 1.0), "CGColor"));
  CGContextSetLineWidth(a4, 1.0);
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = v7;
  uint64_t v13 = v9;

  CGContextFillRect(a4, *(CGRect *)&v10);
}

@end