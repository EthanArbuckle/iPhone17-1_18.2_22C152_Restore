@interface NUTextAndGlyphView
- (NUTextAndGlyph)textAndGlyph;
- (NUTextAndGlyphView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (UILabel)label;
- (unint64_t)alignment;
- (void)layoutSubviews;
- (void)nu_crossFadeViewClearVisibleState;
- (void)nu_crossFadeViewSetValue:(id)a3;
- (void)setAlignment:(unint64_t)a3;
- (void)setTextAndGlyph:(id)a3;
@end

@implementation NUTextAndGlyphView

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)NUTextAndGlyphView;
  [(NUTextAndGlyphView *)&v33 layoutSubviews];
  v3 = [(NUTextAndGlyphView *)self label];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(NUTextAndGlyphView *)self imageView];
  [v12 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v34.origin.x = v5;
  CGFloat rect = v7;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  double Width = CGRectGetWidth(v34);
  v35.origin.x = v14;
  CGFloat v32 = v16;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  double v22 = CGRectGetWidth(v35);
  double v23 = 0.0;
  if ([(NUTextAndGlyphView *)self alignment] != 1)
  {
    [(NUTextAndGlyphView *)self bounds];
    double v23 = CGRectGetMidX(v36) + (Width + v22 + 4.0) * -0.5;
  }
  [(NUTextAndGlyphView *)self bounds];
  double MidY = CGRectGetMidY(v37);
  v38.origin.x = v23;
  v38.origin.y = rect;
  v38.size.width = v9;
  v38.size.height = v11;
  CGFloat v25 = MidY - CGRectGetHeight(v38) * 0.5;
  v39.origin.x = v23;
  v39.origin.y = v25;
  v39.size.width = v9;
  v39.size.height = v11;
  CGFloat v26 = CGRectGetMaxX(v39) + 4.0;
  [(NUTextAndGlyphView *)self bounds];
  double v27 = CGRectGetMidY(v40);
  v41.origin.x = v26;
  v41.origin.y = v32;
  v41.size.width = v18;
  v41.size.height = v20;
  double v28 = v27 - CGRectGetHeight(v41) * 0.5;
  v29 = [(NUTextAndGlyphView *)self label];
  objc_msgSend(v29, "setFrame:", v23, v25, v9, v11);

  v30 = [(NUTextAndGlyphView *)self imageView];
  objc_msgSend(v30, "setFrame:", v26, v28, v18, v20);
}

- (UILabel)label
{
  return self->_label;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (NUTextAndGlyphView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NUTextAndGlyphView;
  v3 = -[NUTextAndGlyphView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    label = v3->_label;
    v3->_label = (UILabel *)v9;

    [(NUTextAndGlyphView *)v3 addSubview:v3->_label];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v5, v6, v7, v8);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v11;

    [(NUTextAndGlyphView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)nu_crossFadeViewClearVisibleState
{
}

- (void)nu_crossFadeViewSetValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  [(NUTextAndGlyphView *)self setTextAndGlyph:v4];
}

- (void)setTextAndGlyph:(id)a3
{
  id v15 = a3;
  id v4 = [v15 attributedText];

  if (v4)
  {
    id v5 = [v15 attributedText];
    double v6 = [(NUTextAndGlyphView *)self label];
    [v6 setAttributedText:v5];
  }
  else
  {
    id v5 = [v15 text];
    double v6 = [(NUTextAndGlyphView *)self label];
    [v6 setText:v5];
  }

  double v7 = [v15 glyph];
  double v8 = [(NUTextAndGlyphView *)self imageView];
  [v8 setImage:v7];

  uint64_t v9 = [v15 attributedText];
  double v10 = [v9 attribute:*MEMORY[0x263F1C240] atIndex:0 effectiveRange:0];
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x263F1C550] labelColor];
  }
  v12 = [(NUTextAndGlyphView *)self imageView];
  [v12 setTintColor:v11];

  if (!v10) {
  -[NUTextAndGlyphView setAlignment:](self, "setAlignment:", [v15 alignment]);
  }
  double v13 = [(NUTextAndGlyphView *)self label];
  [v13 sizeToFit];

  objc_super v14 = [(NUTextAndGlyphView *)self imageView];
  [v14 sizeToFit];

  [(NUTextAndGlyphView *)self setNeedsLayout];
}

- (NUTextAndGlyph)textAndGlyph
{
  return self->_textAndGlyph;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_textAndGlyph, 0);
}

@end