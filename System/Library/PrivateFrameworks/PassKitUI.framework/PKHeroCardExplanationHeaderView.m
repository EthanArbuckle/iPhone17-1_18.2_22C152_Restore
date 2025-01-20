@interface PKHeroCardExplanationHeaderView
+ (CGSize)recommendedCardImageSize;
- (BOOL)hideBackground;
- (BOOL)hideBorders;
- (BOOL)hideShadow;
- (CGSize)sizeThatFits:(CGSize)result;
- (PKHeroCardExplanationHeaderView)initWithImage:(id)a3;
- (UIImage)cardImage;
- (UIImageView)cardImageView;
- (double)cornerRadius;
- (unint64_t)padding;
- (unint64_t)size;
- (void)hideLoadingContent;
- (void)layoutSubviews;
- (void)setCardImage:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHideBackground:(BOOL)a3;
- (void)setHideBorders:(BOOL)a3;
- (void)setHideShadow:(BOOL)a3;
- (void)setPadding:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
- (void)showLoadingContent;
- (void)updateCardSizeValues;
@end

@implementation PKHeroCardExplanationHeaderView

+ (CGSize)recommendedCardImageSize
{
  double v2 = 280.0;
  double v3 = 176.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKHeroCardExplanationHeaderView)initWithImage:(id)a3
{
  id v4 = a3;
  v5 = [(PKHeroCardExplanationHeaderView *)self init];
  v6 = v5;
  if (v5)
  {
    if ([(UIView *)v5 pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      uint64_t v7 = 2;
      uint64_t v8 = 3;
    }
    else
    {
      unint64_t v9 = PKUIGetMinScreenType();
      uint64_t v8 = 3;
      if (v9 >= 4) {
        uint64_t v8 = 4;
      }
      uint64_t v7 = 2;
      if (v9 >= 4) {
        uint64_t v7 = 3;
      }
    }
    v6->_size = v8;
    v6->_padding = v7;
    [(PKHeroCardExplanationHeaderView *)v6 updateCardSizeValues];
    if (v4) {
      [v4 size];
    }
    else {
      [(id)objc_opt_class() recommendedCardImageSize];
    }
    double v12 = v10;
    double v13 = v11;
    id v14 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v12, v13);
    cardImageShadowView = v6->_cardImageShadowView;
    v6->_cardImageShadowView = (UIView *)v15;

    [(PKHeroCardExplanationHeaderView *)v6 addSubview:v6->_cardImageShadowView];
    v17 = [(UIView *)v6->_cardImageShadowView layer];
    [v17 setShouldRasterize:1];
    [v17 setRasterizationScale:PKUIScreenScale()];
    LODWORD(v18) = 1041865114;
    [v17 setShadowOpacity:v18];
    objc_msgSend(v17, "setShadowOffset:", 0.0, 10.0);
    [v17 setShadowRadius:15.0];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
    cardImageView = v6->_cardImageView;
    v6->_cardImageView = (UIImageView *)v19;

    [(UIView *)v6->_cardImageShadowView addSubview:v6->_cardImageView];
    [(UIImageView *)v6->_cardImageView setAccessibilityIgnoresInvertColors:1];
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
    spinner = v6->_spinner;
    v6->_spinner = (UIActivityIndicatorView *)v21;

    [(PKHeroCardExplanationHeaderView *)v6 setHideBackground:0];
  }

  return v6;
}

- (UIImage)cardImage
{
  return [(UIImageView *)self->_cardImageView image];
}

- (void)setCardImage:(id)a3
{
  [(UIImageView *)self->_cardImageView setImage:a3];
  [(UIImageView *)self->_cardImageView sizeToFit];

  [(PKHeroCardExplanationHeaderView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PKHeroCardExplanationHeaderView;
  [(PKHeroCardExplanationHeaderView *)&v20 layoutSubviews];
  double v3 = [(UIImageView *)self->_cardImageView image];

  if (v3)
  {
    [(PKHeroCardExplanationHeaderView *)self bounds];
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v6 = [(UIImageView *)self->_cardImageView image];
    [v6 size];

    PKSizeScaleAspectFit();
    UIRectCenteredXInRect();
    double v8 = v7;
    double v10 = v9;
    -[UIView setFrame:](self->_cardImageShadowView, "setFrame:");
    [(UIImageView *)self->_cardImageView frame];
    double v12 = v11;
    double v14 = v13;
    -[UIImageView setFrame:](self->_cardImageView, "setFrame:", v4, v5, v8, v10);
    if (!self->_hideBorders)
    {
      [(UIView *)self->_cardImageShadowView frame];
      if (v16 != v12 || v15 != v14)
      {
        double v18 = [(UIImageView *)self->_cardImageView layer];
        [(UIImageView *)self->_cardImageView frame];
        +[PKTransactionDataOverlayCardFaceView borderWidth];
        id v19 = +[PKTransactionDataOverlayCardFaceView borderColor];
        [v19 CGColor];
        PKPaymentStyleApplyCorners();
      }
    }
  }
  [(UIActivityIndicatorView *)self->_spinner frame];
  [(PKHeroCardExplanationHeaderView *)self bounds];
  UIRectCenteredAboutPoint();
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double cardBackingHeight = self->_cardBackingHeight;
  result.height = cardBackingHeight;
  return result;
}

- (void)setSize:(unint64_t)a3
{
  if (self->_size != a3)
  {
    self->_size = a3;
    [(PKHeroCardExplanationHeaderView *)self updateCardSizeValues];
    [(PKHeroCardExplanationHeaderView *)self setNeedsLayout];
  }
}

- (void)setPadding:(unint64_t)a3
{
  if (self->_padding != a3)
  {
    self->_padding = a3;
    [(PKHeroCardExplanationHeaderView *)self updateCardSizeValues];
    [(PKHeroCardExplanationHeaderView *)self setNeedsLayout];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    id v4 = [(UIImageView *)self->_cardImageView layer];
    [v4 setCornerRadius:a3];
    [v4 setMasksToBounds:a3 > 0.0];
  }
}

- (void)updateCardSizeValues
{
  unint64_t size = self->_size;
  if (size <= 4) {
    *(void *)&self->_cardHeight = qword_1A04431D8[size];
  }
  switch(self->_padding)
  {
    case 0uLL:
    case 5uLL:
      self->_cardTopPadding = 0.0;
      self->_double cardBottomPadding = 0.0;
      double cardBottomPadding = 0.0;
      break;
    case 1uLL:
      self->_cardTopPadding = 0.0;
      goto LABEL_8;
    case 2uLL:
      self->_cardTopPadding = 15.0;
LABEL_8:
      self->_double cardBottomPadding = 20.0;
      double cardBottomPadding = 20.0;
      break;
    case 3uLL:
      self->_cardTopPadding = 30.0;
      self->_double cardBottomPadding = 60.0;
      double cardBottomPadding = 60.0;
      break;
    case 4uLL:
      self->_cardTopPadding = 10.0;
      self->_double cardBottomPadding = 10.0;
      double cardBottomPadding = 10.0;
      break;
    default:
      double cardBottomPadding = self->_cardBottomPadding;
      break;
  }
  self->_double cardBackingHeight = cardBottomPadding + self->_cardHeight + self->_cardTopPadding;
}

- (void)showLoadingContent
{
  double v3 = [(UIImageView *)self->_cardImageView layer];
  [v3 setOpacity:0.0];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  spinner = self->_spinner;

  [(PKHeroCardExplanationHeaderView *)self addSubview:spinner];
}

- (void)hideLoadingContent
{
  double v3 = [(UIImageView *)self->_cardImageView layer];
  objc_msgSend(v3, "pkui_animateToOpacity:withCompletion:", 0, 1.0);

  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  spinner = self->_spinner;

  [(UIActivityIndicatorView *)spinner removeFromSuperview];
}

- (void)setHideBackground:(BOOL)a3
{
  self->_hideBackground = a3;
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = PKProvisioningSecondaryBackgroundColor();
  }
  id v5 = (id)v4;
  [(PKHeroCardExplanationHeaderView *)self setBackgroundColor:v4];
}

- (void)setHideShadow:(BOOL)a3
{
  if (((!self->_hideShadow ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    uint64_t v4 = [(UIView *)self->_cardImageShadowView layer];
    id v6 = v4;
    LODWORD(v5) = 1041865114;
    if (v3) {
      *(float *)&double v5 = 0.0;
    }
    [v4 setShadowOpacity:v5];
  }
}

- (UIImageView)cardImageView
{
  return self->_cardImageView;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)padding
{
  return self->_padding;
}

- (BOOL)hideBorders
{
  return self->_hideBorders;
}

- (void)setHideBorders:(BOOL)a3
{
  self->_hideBorders = a3;
}

- (BOOL)hideShadow
{
  return self->_hideShadow;
}

- (BOOL)hideBackground
{
  return self->_hideBackground;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardImageView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_cardImageShadowView, 0);
}

@end