@interface _TVTextBadge
+ (id)textBadgeViewWithElement:(id)a3 existingView:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)text;
- (NSString)type;
- (UIColor)tintColor;
- (double)cornerRadius;
- (double)lineWidth;
- (void)drawRect:(CGRect)a3;
- (void)setCornerRadius:(double)a3;
- (void)setLineWidth:(double)a3;
- (void)setText:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setType:(id)a3;
@end

@implementation _TVTextBadge

+ (id)textBadgeViewWithElement:(id)a3 existingView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (_TVTextBadge *)v5;
  }
  else
  {
    v8 = [_TVTextBadge alloc];
    v7 = -[_TVTextBadge initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v9 = v7;
  v10 = [v6 style];
  v11 = objc_msgSend(v10, "tv_backgroundColor");
  v12 = [v11 color];
  [(_TVTextBadge *)v9 setBackgroundColor:v12];

  v13 = objc_msgSend(v6, "tv_attributedString");
  [(_TVTextBadge *)v9 setText:v13];
  v14 = [v6 attributes];
  v15 = [v14 objectForKeyedSubscript:@"type"];
  [(_TVTextBadge *)v9 setType:v15];

  v16 = [v6 style];
  v17 = objc_msgSend(v16, "tv_tintColor");
  v18 = [v17 color];
  [(_TVTextBadge *)v9 setTintColor:v18];

  long long v30 = TVCornerRadiiZero;
  long long v31 = *(_OWORD *)&qword_230C384E8;
  +[TVMLUtilities _cornerRadiiFromElement:v6 cornerRadii:&v30 circle:0];
  +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v30, v31);
  -[_TVTextBadge setCornerRadius:](v9, "setCornerRadius:");
  v19 = [v6 style];

  objc_msgSend(v19, "tv_borderWidths");
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = fmax(fmax(v21, v25), fmax(v23, v27));
  if (v28 < 1.0) {
    double v28 = 2.0;
  }
  [(_TVTextBadge *)v9 setLineWidth:v28];
  [(_TVTextBadge *)v9 setNeedsDisplay];

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(UIView *)self tv_padding];
  double v8 = v7;
  double v9 = v5;
  double v11 = v10;
  double v12 = v6;
  if (width == 0.0) {
    double v13 = 0.0;
  }
  else {
    double v13 = width - v5 - v6;
  }
  v14 = [(_TVTextBadge *)self text];
  objc_msgSend(v14, "boundingRectWithSize:options:context:", 2, 0, v13, 0.0);
  CGRect v21 = CGRectIntegral(v20);
  double v15 = v21.size.width;
  double height = v21.size.height;

  double v17 = v12 + v9 + v15;
  double v18 = v11 + v8 + height;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self tv_padding];
  double v9 = v8;
  double v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if ([(NSString *)self->_type isEqualToString:@"fill"])
  {
    double v13 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, self->_cornerRadius);
    [(UIColor *)self->_tintColor set];
    [v13 fill];
    CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOut);
    v14 = [(_TVTextBadge *)self text];
    objc_msgSend(v14, "drawAtPoint:", v11, v9);
  }
  else
  {
    double v15 = [(_TVTextBadge *)self text];
    objc_msgSend(v15, "drawAtPoint:", v11, v9);

    double v13 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", 1.0, 1.0, width + -2.0, height + -2.0, self->_cornerRadius);
    [(UIColor *)self->_tintColor set];
    [v13 setLineWidth:self->_lineWidth];
    [v13 stroke];
  }

  CGContextRestoreGState(CurrentContext);
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end