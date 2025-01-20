@interface TSWPHyperlinkPopoverTitleView
- (NSString)titleString;
- (TSWPHyperlinkPopoverTitleView)initWithFrame:(CGRect)a3 titleString:(id)a4;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setTitleString:(id)a3;
@end

@implementation TSWPHyperlinkPopoverTitleView

- (TSWPHyperlinkPopoverTitleView)initWithFrame:(CGRect)a3 titleString:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPHyperlinkPopoverTitleView;
  v5 = -[TSWPHyperlinkPopoverTitleView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    -[TSWPHyperlinkPopoverTitleView setTitleString:](v5, "setTitleString:", [a4 stringByRemovingPercentEncoding]);
    [(TSWPHyperlinkPopoverTitleView *)v5 setOpaque:0];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkPopoverTitleView;
  [(TSWPHyperlinkPopoverTitleView *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [(TSWPHyperlinkPopoverTitleView *)self bounds];
  CGContextClearRect(CurrentContext, v32);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "blackColor"), "CGColor"));
  for (double i = 18.0; ; double i = i + -1.0)
  {
    uint64_t v6 = [MEMORY[0x263F1C658] boldSystemFontOfSize:i];
    [(NSString *)[(TSWPHyperlinkPopoverTitleView *)self titleString] sizeWithFont:v6];
    double v8 = v7;
    [(TSWPHyperlinkPopoverTitleView *)self bounds];
    if (i == 12.0 || v8 < v9) {
      break;
    }
  }
  v11 = [(TSWPHyperlinkPopoverTitleView *)self titleString];
  [(TSWPHyperlinkPopoverTitleView *)self bounds];
  -[NSString sizeWithFont:constrainedToSize:lineBreakMode:](v11, "sizeWithFont:constrainedToSize:lineBreakMode:", v6, 5, v12, v13);
  double v15 = v14;
  double v17 = v16;
  [(TSWPHyperlinkPopoverTitleView *)self bounds];
  double v19 = v18 - v17;
  [(TSWPHyperlinkPopoverTitleView *)self bounds];
  double v21 = v20 - v15;
  [(TSWPHyperlinkPopoverTitleView *)self bounds];
  double v23 = v22 + v19 * 0.5;
  double v25 = v24 - v19;
  double v27 = v26 + v21 * 0.5;
  double v29 = v28 - v21;
  v30 = [(TSWPHyperlinkPopoverTitleView *)self titleString];

  -[NSString drawInRect:withFont:lineBreakMode:alignment:](v30, "drawInRect:withFont:lineBreakMode:alignment:", v6, 5, 1, v27, v23, v29, v25);
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

@end