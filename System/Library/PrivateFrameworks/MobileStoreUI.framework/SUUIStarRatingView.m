@interface SUUIStarRatingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIStarRatingView)initWithFrame:(CGRect)a3;
- (UIImage)ratingStarsImage;
- (UILabel)textLabel;
- (double)elementSpacing;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setElementSpacing:(double)a3;
- (void)setRatingStarsImage:(id)a3;
@end

@implementation SUUIStarRatingView

- (SUUIStarRatingView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIStarRatingView;
  result = -[SUUIStarRatingView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_elementSpacing = 3.0;
  }
  return result;
}

- (UIImage)ratingStarsImage
{
  return [(UIImageView *)self->_ratingStarsImageView image];
}

- (void)setRatingStarsImage:(id)a3
{
  id v13 = a3;
  id v4 = [(UIImageView *)self->_ratingStarsImageView image];

  id v6 = v13;
  if (v4 != v13)
  {
    ratingStarsImageView = self->_ratingStarsImageView;
    if (v13)
    {
      if (!ratingStarsImageView)
      {
        v8 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        v9 = self->_ratingStarsImageView;
        self->_ratingStarsImageView = v8;

        v10 = self->_ratingStarsImageView;
        v11 = [(SUUIStarRatingView *)self backgroundColor];
        [(UIImageView *)v10 setBackgroundColor:v11];

        [(SUUIStarRatingView *)self addSubview:self->_ratingStarsImageView];
        ratingStarsImageView = self->_ratingStarsImageView;
      }
      id v12 = v13;
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v5 = [(UIImageView *)ratingStarsImageView setImage:v12];
    id v6 = v13;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (UILabel)textLabel
{
  textLabel = self->_textLabel;
  if (!textLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    uint64_t v5 = self->_textLabel;
    self->_textLabel = v4;

    id v6 = self->_textLabel;
    v7 = [(SUUIStarRatingView *)self backgroundColor];
    [(UILabel *)v6 setBackgroundColor:v7];

    [(SUUIStarRatingView *)self addSubview:self->_textLabel];
    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (void)layoutSubviews
{
  [(SUUIStarRatingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  id v15 = [(UIImageView *)self->_ratingStarsImageView image];
  if (v15)
  {
    [(UIImageView *)self->_ratingStarsImageView frame];
    [v15 size];
    double v8 = v7;
    CGFloat v10 = v9;
    *(float *)&double v7 = (v6 - v9) * 0.5;
    CGFloat v11 = ceilf(*(float *)&v7);
    -[UIImageView setFrame:](self->_ratingStarsImageView, "setFrame:", -1.0, v11, v8, v9);
    v17.origin.x = -1.0;
    v17.origin.y = v11;
    v17.size.width = v8;
    v17.size.height = v10;
    double v12 = CGRectGetMaxX(v17) + self->_elementSpacing;
  }
  else
  {
    double v12 = 0.0;
  }
  id v13 = [(UILabel *)self->_textLabel text];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    [(UILabel *)self->_textLabel frame];
    -[UILabel setFrame:](self->_textLabel, "setFrame:", v12, 0.0, v4 - v12, v6);
  }
}

- (void)setBackgroundColor:(id)a3
{
  ratingStarsImageView = self->_ratingStarsImageView;
  id v5 = a3;
  [(UIImageView *)ratingStarsImageView setBackgroundColor:v5];
  [(UILabel *)self->_textLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIStarRatingView;
  [(SUUIStarRatingView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v5 = [(UIImageView *)self->_ratingStarsImageView image];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 size];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  CGFloat v11 = [(UILabel *)self->_textLabel text];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    if (v6)
    {
      double v8 = v8 + self->_elementSpacing;
      double width = width - v8;
    }
    -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", width, 1.79769313e308);
    if (v10 < v14) {
      double v10 = v14;
    }
    double v8 = v8 + v13;
  }

  double v15 = v8;
  double v16 = v10;
  result.height = v16;
  result.double width = v15;
  return result;
}

- (double)elementSpacing
{
  return self->_elementSpacing;
}

- (void)setElementSpacing:(double)a3
{
  self->_elementSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_ratingStarsImageView, 0);
}

@end