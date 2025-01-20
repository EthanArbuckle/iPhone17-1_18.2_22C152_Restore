@interface SKUIRedeemITunesPassLearnMoreView
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

@implementation SKUIRedeemITunesPassLearnMoreView

- (UIControl)button
{
  button = self->_button;
  if (!button)
  {
    v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    v5 = self->_button;
    self->_button = v4;

    v6 = self->_button;
    v7 = [(SKUIRedeemITunesPassLearnMoreView *)self backgroundColor];
    [(UIButton *)v6 setBackgroundColor:v7];

    v8 = [(UIButton *)self->_button titleLabel];
    v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    [v8 setFont:v9];

    [(SKUIRedeemITunesPassLearnMoreView *)self addSubview:self->_button];
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
  id v5 = [(SKUIRedeemITunesPassLearnMoreView *)self button];
  [v5 setTitle:v4 forState:0];

  [(SKUIRedeemITunesPassLearnMoreView *)self setNeedsLayout];
}

- (void)setExplanationString:(id)a3
{
  id v4 = a3;
  explanationLabel = self->_explanationLabel;
  id v14 = v4;
  if (!explanationLabel)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v7 = self->_explanationLabel;
    self->_explanationLabel = v6;

    v8 = self->_explanationLabel;
    v9 = [(SKUIRedeemITunesPassLearnMoreView *)self backgroundColor];
    [(UILabel *)v8 setBackgroundColor:v9];

    v10 = self->_explanationLabel;
    v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)self->_explanationLabel setNumberOfLines:0];
    [(UILabel *)self->_explanationLabel setTextAlignment:1];
    v12 = self->_explanationLabel;
    v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.600000024];
    [(UILabel *)v12 setTextColor:v13];

    [(SKUIRedeemITunesPassLearnMoreView *)self addSubview:self->_explanationLabel];
    id v4 = v14;
    explanationLabel = self->_explanationLabel;
  }
  [(UILabel *)explanationLabel setText:v4];
  [(SKUIRedeemITunesPassLearnMoreView *)self setNeedsLayout];
}

- (void)setHeaderImage:(id)a3
{
  id v4 = a3;
  headerImageView = self->_headerImageView;
  id v10 = v4;
  if (!headerImageView)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    v7 = self->_headerImageView;
    self->_headerImageView = v6;

    v8 = self->_headerImageView;
    v9 = [(SKUIRedeemITunesPassLearnMoreView *)self backgroundColor];
    [(UIImageView *)v8 setBackgroundColor:v9];

    [(SKUIRedeemITunesPassLearnMoreView *)self addSubview:self->_headerImageView];
    id v4 = v10;
    headerImageView = self->_headerImageView;
  }
  [(UIImageView *)headerImageView setImage:v4];
  [(SKUIRedeemITunesPassLearnMoreView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemITunesPassLearnMoreView layoutSubviews]";
}

- (void)setBackgroundColor:(id)a3
{
  button = self->_button;
  id v5 = a3;
  [(UIButton *)button setBackgroundColor:v5];
  [(UILabel *)self->_explanationLabel setBackgroundColor:v5];
  [(UIImageView *)self->_headerImageView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUIRedeemITunesPassLearnMoreView;
  [(SKUIRedeemITunesPassLearnMoreView *)&v6 setBackgroundColor:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end