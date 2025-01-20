@interface SUUIViewTextProperties
- (SUUIViewTextProperties)initWithStringLayout:(id)a3;
- (SUUIViewTextProperties)initWithTextLayout:(id)a3 isExpanded:(BOOL)a4;
- (double)baselineOffsetFromBottom;
- (double)desiredOffsetTop;
- (double)firstBaselineOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBaselineOffsetFromBottom:(double)a3;
- (void)setDesiredOffsetTop:(double)a3;
- (void)setFirstBaselineOffset:(double)a3;
@end

@implementation SUUIViewTextProperties

- (SUUIViewTextProperties)initWithStringLayout:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIViewTextProperties;
  v5 = [(SUUIViewTextProperties *)&v15 init];
  if (v5)
  {
    [v4 firstBaselineOffset];
    double v7 = v6;
    -[SUUIViewTextProperties setFirstBaselineOffset:](v5, "setFirstBaselineOffset:");
    v8 = [v4 attributedString];
    double LineHeight = SUUIAttributedStringGetLineHeight(v8);

    [v4 boundingSize];
    double v11 = v10;
    [v4 baselineOffset];
    *(float *)&double v12 = v11 - v12;
    [(SUUIViewTextProperties *)v5 setBaselineOffsetFromBottom:roundf(*(float *)&v12)];
    float v13 = LineHeight - v7;
    [(SUUIViewTextProperties *)v5 setDesiredOffsetTop:roundf(v13)];
  }

  return v5;
}

- (SUUIViewTextProperties)initWithTextLayout:(id)a3 isExpanded:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SUUIViewTextProperties;
  double v6 = [(SUUIViewTextProperties *)&v20 init];
  if (v6)
  {
    double v7 = (const __CTFrame *)[v5 textFrame];
    CFArrayRef Lines = CTFrameGetLines(v7);
    CFIndex Count = CFArrayGetCount(Lines);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      uint64_t v11 = [v5 textSize];
      double v13 = v12;
      MEMORY[0x270FA5388](v11);
      v22.location = 0;
      v22.length = v10;
      CTFrameGetLineOrigins(v7, v22, (CGPoint *)&v19 - v10);
      float v14 = *((double *)&v19 - 1);
      [(SUUIViewTextProperties *)v6 setBaselineOffsetFromBottom:roundf(v14)];
      float v15 = v13 - ((double *)&v19 - 2 * v10)[1];
      double v16 = roundf(v15);
      [(SUUIViewTextProperties *)v6 setFirstBaselineOffset:v16];
      [v5 lineHeight];
      [(SUUIViewTextProperties *)v6 setDesiredOffsetTop:v17 - v16];
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(SUUIViewTextProperties *)self baselineOffsetFromBottom];
  objc_msgSend(v4, "setBaselineOffsetFromBottom:");
  [(SUUIViewTextProperties *)self desiredOffsetTop];
  objc_msgSend(v4, "setDesiredOffsetTop:");
  [(SUUIViewTextProperties *)self firstBaselineOffset];
  objc_msgSend(v4, "setFirstBaselineOffset:");
  return v4;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)SUUIViewTextProperties;
  id v4 = [(SUUIViewTextProperties *)&v12 description];
  [(SUUIViewTextProperties *)self baselineOffsetFromBottom];
  uint64_t v6 = v5;
  [(SUUIViewTextProperties *)self firstBaselineOffset];
  uint64_t v8 = v7;
  [(SUUIViewTextProperties *)self desiredOffsetTop];
  CFIndex v10 = [v3 stringWithFormat:@"%@: [Bottom: %.2f, First Baseline: %.2f, Offset Top: %.2f]", v4, v6, v8, v9];

  return v10;
}

- (double)baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (void)setBaselineOffsetFromBottom:(double)a3
{
  self->_baselineOffsetFromBottom = a3;
}

- (double)desiredOffsetTop
{
  return self->_desiredOffsetTop;
}

- (void)setDesiredOffsetTop:(double)a3
{
  self->_desiredOffsetTop = a3;
}

- (double)firstBaselineOffset
{
  return self->_firstBaselineOffset;
}

- (void)setFirstBaselineOffset:(double)a3
{
  self->_firstBaselineOffset = a3;
}

@end