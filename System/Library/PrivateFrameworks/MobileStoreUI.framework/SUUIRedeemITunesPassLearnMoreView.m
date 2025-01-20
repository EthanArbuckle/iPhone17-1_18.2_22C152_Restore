@interface SUUIRedeemITunesPassLearnMoreView
- (NSString)buttonTitle;
- (NSString)explanationString;
- (UIControl)button;
- (UIImage)headerImage;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setExplanationString:(id)a3;
- (void)setHeaderImage:(id)a3;
@end

@implementation SUUIRedeemITunesPassLearnMoreView

- (UIControl)button
{
  button = self->_button;
  if (!button)
  {
    v4 = [MEMORY[0x263F824E8] buttonWithType:1];
    v5 = self->_button;
    self->_button = v4;

    v6 = self->_button;
    v7 = [(SUUIRedeemITunesPassLearnMoreView *)self backgroundColor];
    [(UIButton *)v6 setBackgroundColor:v7];

    v8 = [(UIButton *)self->_button titleLabel];
    v9 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v8 setFont:v9];

    [(SUUIRedeemITunesPassLearnMoreView *)self addSubview:self->_button];
    button = self->_button;
  }
  return (UIControl *)button;
}

- (NSString)buttonTitle
{
  return [(UIButton *)self->_button titleForState:0];
}

- (NSString)explanationString
{
  return [(UILabel *)self->_explanationLabel text];
}

- (UIImage)headerImage
{
  return [(UIImageView *)self->_headerImageView image];
}

- (void)setButtonTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIRedeemITunesPassLearnMoreView *)self button];
  [v5 setTitle:v4 forState:0];

  [(SUUIRedeemITunesPassLearnMoreView *)self setNeedsLayout];
}

- (void)setExplanationString:(id)a3
{
  id v4 = a3;
  explanationLabel = self->_explanationLabel;
  id v14 = v4;
  if (!explanationLabel)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    v7 = self->_explanationLabel;
    self->_explanationLabel = v6;

    v8 = self->_explanationLabel;
    v9 = [(SUUIRedeemITunesPassLearnMoreView *)self backgroundColor];
    [(UILabel *)v8 setBackgroundColor:v9];

    v10 = self->_explanationLabel;
    v11 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)self->_explanationLabel setNumberOfLines:0];
    [(UILabel *)self->_explanationLabel setTextAlignment:1];
    v12 = self->_explanationLabel;
    v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.600000024];
    [(UILabel *)v12 setTextColor:v13];

    [(SUUIRedeemITunesPassLearnMoreView *)self addSubview:self->_explanationLabel];
    id v4 = v14;
    explanationLabel = self->_explanationLabel;
  }
  [(UILabel *)explanationLabel setText:v4];
  [(SUUIRedeemITunesPassLearnMoreView *)self setNeedsLayout];
}

- (void)setHeaderImage:(id)a3
{
  id v4 = a3;
  headerImageView = self->_headerImageView;
  id v10 = v4;
  if (!headerImageView)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    v7 = self->_headerImageView;
    self->_headerImageView = v6;

    v8 = self->_headerImageView;
    v9 = [(SUUIRedeemITunesPassLearnMoreView *)self backgroundColor];
    [(UIImageView *)v8 setBackgroundColor:v9];

    [(SUUIRedeemITunesPassLearnMoreView *)self addSubview:self->_headerImageView];
    id v4 = v10;
    headerImageView = self->_headerImageView;
  }
  [(UIImageView *)headerImageView setImage:v4];
  [(SUUIRedeemITunesPassLearnMoreView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  [(SUUIRedeemITunesPassLearnMoreView *)self bounds];
  double v32 = v3;
  double v5 = v4;
  double v6 = v4 + -20.0;
  double v7 = v3 + -30.0;
  [(UIImageView *)self->_headerImageView frame];
  -[UIImageView sizeThatFits:](self->_headerImageView, "sizeThatFits:", v7, 1.79769313e308);
  double v9 = v8;
  double v11 = v10;
  [(UILabel *)self->_explanationLabel frame];
  -[UILabel sizeThatFits:](self->_explanationLabel, "sizeThatFits:", v7, 1.79769313e308);
  double v13 = v12;
  double v15 = v14;
  double v30 = v14;
  [(UIButton *)self->_button frame];
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v7, 1.79769313e308);
  double v31 = v16;
  double v33 = v17;
  double v18 = v11 + v15 + v17;
  *(float *)&double v17 = fmin((v6 - v18) * 0.5, 40.0);
  double v19 = floorf(*(float *)&v17);
  *(float *)&double v18 = v18 + v19 + -7.0 + v19;
  *(float *)&double v17 = (v32 - v9) * 0.5;
  CGFloat v20 = floorf(*(float *)&v17);
  *(float *)&double v18 = (v5 - ceilf(*(float *)&v18)) * 0.5;
  CGFloat v21 = floorf(*(float *)&v18);
  -[UIImageView setFrame:](self->_headerImageView, "setFrame:", v20, v21, v9, v11);
  CGFloat v22 = v13;
  float v23 = (v32 - v13) * 0.5;
  CGFloat v24 = floorf(v23);
  v35.origin.x = v20;
  v35.origin.y = v21;
  v35.size.width = v9;
  v35.size.height = v11;
  CGFloat v25 = CGRectGetMaxY(v35) + v19 + -7.0;
  -[UILabel setFrame:](self->_explanationLabel, "setFrame:", v24, v25, v13, v30);
  float v26 = (v32 - v31) * 0.5;
  double v27 = floorf(v26);
  v36.origin.x = v24;
  v36.origin.y = v25;
  v36.size.width = v22;
  v36.size.height = v30;
  double MaxY = CGRectGetMaxY(v36);
  button = self->_button;
  -[UIButton setFrame:](button, "setFrame:", v27, MaxY + v19, v31, v33);
}

- (void)setBackgroundColor:(id)a3
{
  button = self->_button;
  id v5 = a3;
  [(UIButton *)button setBackgroundColor:v5];
  [(UILabel *)self->_explanationLabel setBackgroundColor:v5];
  [(UIImageView *)self->_headerImageView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIRedeemITunesPassLearnMoreView;
  [(SUUIRedeemITunesPassLearnMoreView *)&v6 setBackgroundColor:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end