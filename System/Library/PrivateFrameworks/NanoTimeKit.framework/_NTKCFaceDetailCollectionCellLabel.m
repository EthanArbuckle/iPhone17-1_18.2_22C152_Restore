@interface _NTKCFaceDetailCollectionCellLabel
- (BOOL)active;
- (BOOL)is3Lines;
- (BOOL)usesShortTextWidth;
- (CGRect)_textBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (_NTKCFaceDetailCollectionCellLabel)init;
- (double)firstLineBaseline;
- (id)_activeFont;
- (id)_inactiveFont;
- (int64_t)_numberOfLines;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setUsesShortTextWidth:(BOOL)a3;
@end

@implementation _NTKCFaceDetailCollectionCellLabel

- (_NTKCFaceDetailCollectionCellLabel)init
{
  v12.receiver = self;
  v12.super_class = (Class)_NTKCFaceDetailCollectionCellLabel;
  v2 = [(_NTKCFaceDetailCollectionCellLabel *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F39C88] layer];
    background = v2->_background;
    v2->_background = (CAShapeLayer *)v3;

    NTKCActiveColor();
    id v5 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setFillColor:](v2->_background, "setFillColor:", [v5 CGColor]);

    [(CAShapeLayer *)v2->_background setHidden:1];
    v6 = [(_NTKCFaceDetailCollectionCellLabel *)v2 layer];
    [v6 addSublayer:v2->_background];

    uint64_t v7 = objc_opt_new();
    label = v2->_label;
    v2->_label = (UILabel *)v7;

    [(UILabel *)v2->_label setAllowsDefaultTighteningForTruncation:1];
    v9 = [(_NTKCFaceDetailCollectionCellLabel *)v2 _inactiveFont];
    [(UILabel *)v2->_label setFont:v9];

    v10 = [(_NTKCFaceDetailCollectionCellLabel *)v2 _inactiveTextColor];
    [(UILabel *)v2->_label setTextColor:v10];

    [(UILabel *)v2->_label setNumberOfLines:3];
    [(_NTKCFaceDetailCollectionCellLabel *)v2 addSubview:v2->_label];
  }
  return v2;
}

- (void)setUsesShortTextWidth:(BOOL)a3
{
  if (self->_usesShortTextWidth != a3)
  {
    self->_usesShortTextWidth = a3;
    [(_NTKCFaceDetailCollectionCellLabel *)self sizeToFit];
    [(_NTKCFaceDetailCollectionCellLabel *)self setNeedsLayout];
  }
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (void)setText:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UILabel *)self->_label text];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    if (v4)
    {
      uint64_t v7 = [MEMORY[0x1E4FB0848] NTKHyphenationParagraphStyle];
      [v7 setAlignment:1];
      id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v11 = *MEMORY[0x1E4FB0738];
      v12[0] = v7;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      v10 = (void *)[v8 initWithString:v4 attributes:v9];

      [(UILabel *)self->_label setAttributedText:v10];
    }
    else
    {
      [(UILabel *)self->_label setText:0];
    }
    [(_NTKCFaceDetailCollectionCellLabel *)self sizeToFit];
    [(_NTKCFaceDetailCollectionCellLabel *)self setNeedsLayout];
  }
}

- (double)firstLineBaseline
{
  [(UILabel *)self->_label _firstLineBaseline];
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  char v6 = [(UILabel *)self->_label text];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v8 = [(UILabel *)self->_label font];
    unint64_t v9 = [(_NTKCFaceDetailCollectionCellLabel *)self _numberOfLines];
    [(_NTKCFaceDetailCollectionCellLabel *)self _textBounds];
    if (v9 <= 2)
    {
      double v14 = dbl_1BC8A0598[v9];
      double height = dbl_1BC8A05B0[v9];
      CGRectGetWidth(*(CGRect *)&v10);
      UICeilToViewScale();
      double width = v15 + v14;
    }
    if (width < height) {
      double width = height;
    }
    [(UILabel *)self->_label setFont:v8];
    -[UILabel setFrame:](self->_label, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
  }
  double v16 = width;
  double v17 = height;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)_NTKCFaceDetailCollectionCellLabel;
  [(_NTKCFaceDetailCollectionCellLabel *)&v18 layoutSubviews];
  [(_NTKCFaceDetailCollectionCellLabel *)self bounds];
  double x = v19.origin.x;
  double y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  BOOL v7 = CGRectGetHeight(v19) <= 19.0;
  double v8 = x;
  double v9 = y;
  double v10 = width;
  double v11 = height;
  if (!v7)
  {
    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    *(CGRect *)&double v8 = CGRectInset(v20, 6.0, 0.0);
  }
  -[UILabel setFrame:](self->_label, "setFrame:", v8, v9, v10, v11);
  -[CAShapeLayer setFrame:](self->_background, "setFrame:", x, y, width, height);
  objc_super v12 = [MEMORY[0x1E4F19A30] currentDevice];
  uint64_t v13 = [v12 deviceCategory];

  double v14 = 3.0;
  if (v13 != 1)
  {
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    double v15 = CGRectGetHeight(v21);
    v22.origin.double x = x;
    v22.origin.double y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    double v16 = CGRectGetWidth(v22);
    if (v15 < v16) {
      double v16 = v15;
    }
    double v14 = v16 * 0.5;
  }
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v14);
  id v17 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_background, "setPath:", [v17 CGPath]);
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(_NTKCFaceDetailCollectionCellLabel *)self _activeFont];
    }
    else {
    id v4 = [(_NTKCFaceDetailCollectionCellLabel *)self _inactiveFont];
    }
    [(UILabel *)self->_label setFont:v4];

    if (self->_active) {
      [(_NTKCFaceDetailCollectionCellLabel *)self _activeTextColor];
    }
    else {
    id v5 = [(_NTKCFaceDetailCollectionCellLabel *)self _inactiveTextColor];
    }
    [(UILabel *)self->_label setTextColor:v5];

    BOOL v6 = !self->_active;
    background = self->_background;
    [(CAShapeLayer *)background setHidden:v6];
  }
}

- (id)_activeFont
{
  return (id)[MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09C0]];
}

- (id)_inactiveFont
{
  return (id)[MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09B8]];
}

- (int64_t)_numberOfLines
{
  [(_NTKCFaceDetailCollectionCellLabel *)self _textBounds];
  CGFloat x = v7.origin.x;
  CGFloat y = v7.origin.y;
  CGFloat width = v7.size.width;
  CGFloat height = v7.size.height;
  if (CGRectGetHeight(v7) > 38.0) {
    return 2;
  }
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectGetHeight(v8) > 19.0;
}

- (CGRect)_textBounds
{
  BOOL usesShortTextWidth = self->_usesShortTextWidth;
  uint64_t v3 = NTKCScreenStyle();
  id v4 = (double *)((char *)&unk_1BC8A0500 + 8 * !usesShortTextWidth);
  if (v3 == 1) {
    id v4 = (double *)((char *)&unk_1BC8A04F0 + 8 * !usesShortTextWidth);
  }
  double v5 = *v4;
  BOOL v6 = [(_NTKCFaceDetailCollectionCellLabel *)self _activeFont];
  [(UILabel *)self->_label setFont:v6];

  CGRect v7 = [(UILabel *)self->_label attributedText];
  objc_msgSend(v7, "boundingRectWithSize:options:context:", 8, 0, v5, 1.79769313e308);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v26.origin.CGFloat x = v9;
  v26.origin.CGFloat y = v11;
  v26.size.CGFloat width = v13;
  v26.size.CGFloat height = v15;
  if (CGRectGetWidth(v26) > v5)
  {
    double v16 = [(UILabel *)self->_label attributedText];
    objc_msgSend(v16, "boundingRectWithSize:options:context:", 9, 0, v5, 1.79769313e308);
    CGFloat v9 = v17;
    CGFloat v11 = v18;
    CGFloat v13 = v19;
    CGFloat v15 = v20;
  }
  double v21 = v9;
  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (BOOL)is3Lines
{
  return [(_NTKCFaceDetailCollectionCellLabel *)self _numberOfLines] == 2;
}

- (BOOL)usesShortTextWidth
{
  return self->_usesShortTextWidth;
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end