@interface PKHeroCardWatchExplainationHeaderView
- (BOOL)_isSmallPhone;
- (CGSize)recommendedCardImageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKHeroCardWatchExplainationHeaderView)init;
- (UIImage)cardImage;
- (id)_deviceBackgroundColor;
- (void)layoutSubviews;
- (void)setCardImage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKHeroCardWatchExplainationHeaderView

- (PKHeroCardWatchExplainationHeaderView)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKHeroCardWatchExplainationHeaderView;
  v2 = [(PKHeroCardWatchExplainationHeaderView *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(PKHeroCardWatchExplainationHeaderView *)v2 _deviceBackgroundColor];
    [(PKHeroCardWatchExplainationHeaderView *)v3 setBackgroundColor:v4];

    v5 = objc_alloc_init(PKWatchHeroImageView);
    watchView = v3->_watchView;
    v3->_watchView = v5;

    [(PKHeroCardWatchExplainationHeaderView *)v3 addSubview:v3->_watchView];
    id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    passImageView = v3->_passImageView;
    v3->_passImageView = (UIImageView *)v8;

    [(UIImageView *)v3->_passImageView setAccessibilityIgnoresInvertColors:1];
    [(PKWatchHeroImageView *)v3->_watchView addSubview:v3->_passImageView];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[PKWatchHeroImageView sizeThatFits:](self->_watchView, "sizeThatFits:", a3.width, a3.height);
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKHeroCardWatchExplainationHeaderView;
  [(PKHeroCardWatchExplainationHeaderView *)&v6 layoutSubviews];
  [(PKHeroCardWatchExplainationHeaderView *)self bounds];
  -[PKWatchHeroImageView sizeThatFits:](self->_watchView, "sizeThatFits:", v3, v4);
  [(PKWatchHeroImageView *)self->_watchView frame];
  PKRectCenteredIntegralRect();
  -[PKWatchHeroImageView setFrame:](self->_watchView, "setFrame:");
  passImageView = self->_passImageView;
  [(PKWatchHeroImageView *)self->_watchView cardFrame];
  -[UIImageView setFrame:](passImageView, "setFrame:");
}

- (void)setCardImage:(id)a3
{
  objc_storeStrong((id *)&self->_cardImage, a3);
  id v5 = a3;
  [(UIImageView *)self->_passImageView setImage:v5];
}

- (BOOL)_isSmallPhone
{
  return PKUIGetMinScreenWidthType() == 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKHeroCardWatchExplainationHeaderView;
  [(PKHeroCardWatchExplainationHeaderView *)&v5 traitCollectionDidChange:a3];
  double v4 = [(PKHeroCardWatchExplainationHeaderView *)self _deviceBackgroundColor];
  [(PKHeroCardWatchExplainationHeaderView *)self setBackgroundColor:v4];
}

- (id)_deviceBackgroundColor
{
  v2 = [(PKHeroCardWatchExplainationHeaderView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    PKProvisioningBackgroundColor();
  }
  else {
  double v4 = PKProvisioningSecondaryBackgroundColor();
  }

  return v4;
}

- (CGSize)recommendedCardImageSize
{
  [(PKWatchHeroImageView *)self->_watchView cardFrame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.CGFloat width = v3;
  return result;
}

- (UIImage)cardImage
{
  return self->_cardImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_watchView, 0);

  objc_storeStrong((id *)&self->_passImageView, 0);
}

@end