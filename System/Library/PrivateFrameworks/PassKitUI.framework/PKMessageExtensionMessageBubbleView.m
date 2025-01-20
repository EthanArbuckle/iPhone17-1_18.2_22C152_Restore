@interface PKMessageExtensionMessageBubbleView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKMessageExtensionMessageBubbleView)init;
- (PKSharingMessageExtensionViewProperties)properties;
- (UIEdgeInsets)contentInset;
- (void)_setupBubbleView;
- (void)beginValidateMessage;
- (void)completeValidateMessage;
- (void)layoutSubviews;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setProperties:(id)a3;
@end

@implementation PKMessageExtensionMessageBubbleView

- (PKMessageExtensionMessageBubbleView)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKMessageExtensionMessageBubbleView;
  v2 = [(PKMessageExtensionMessageBubbleView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PKMessageExtensionMessageBubbleView *)v2 _setupBubbleView];
  }
  return v3;
}

- (void)beginValidateMessage
{
  if (!self->_isValidatingMessage)
  {
    self->_isValidatingMessage = 1;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __59__PKMessageExtensionMessageBubbleView_beginValidateMessage__block_invoke;
    v2[3] = &unk_1E59CA7D0;
    v2[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0x10000 animations:v2 completion:0];
  }
}

uint64_t __59__PKMessageExtensionMessageBubbleView_beginValidateMessage__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 480) startAnimating];
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 432);

  return [v2 setAlpha:0.0];
}

- (void)completeValidateMessage
{
  if (self->_isValidatingMessage)
  {
    self->_isValidatingMessage = 0;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __62__PKMessageExtensionMessageBubbleView_completeValidateMessage__block_invoke;
    v2[3] = &unk_1E59CA7D0;
    v2[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0x10000 animations:v2 completion:0];
  }
}

uint64_t __62__PKMessageExtensionMessageBubbleView_completeValidateMessage__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 480) stopAnimating];
  v2 = [*(id *)(*(void *)(a1 + 32) + 416) image];
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 489);

    if (!v3) {
      [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
  v4 = *(void **)(*(void *)(a1 + 32) + 432);

  return [v4 setAlpha:1.0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKMessageExtensionMessageBubbleView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a3.width, 10000.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKMessageExtensionMessageBubbleView;
  [(PKMessageExtensionMessageBubbleView *)&v3 layoutSubviews];
  [(PKMessageExtensionMessageBubbleView *)self bounds];
  -[PKMessageExtensionMessageBubbleView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v10 = [(PKMessageExtensionMessageBubbleView *)self _shouldReverseLayoutDirection];
  memset(&slice, 0, sizeof(slice));
  CGFloat v11 = self->_contentInset.left + 12.0;
  CGFloat v12 = x + v11;
  double v13 = 0.0;
  CGFloat v14 = width - (v11 + self->_contentInset.right + 12.0);
  remainder.origin.double x = v12;
  remainder.origin.double y = y + 0.0;
  remainder.size.double width = v14;
  remainder.size.double height = height;
  char v15 = [(UILabel *)self->_buttonLabel isHidden];
  v51.origin.double x = v12;
  v51.origin.double y = y + 0.0;
  v51.size.double width = v14;
  v51.size.double height = height;
  CGRectDivide(v51, &slice, &remainder, 13.0, CGRectMaxYEdge);
  -[UILabel sizeThatFits:](self->_buttonLabel, "sizeThatFits:", width, height);
  double v17 = v16;
  PKFloatRoundToPixel();
  double v19 = v18;
  v47.origin.double x = 0.0;
  v47.origin.double y = 0.0;
  v47.size.double width = v18;
  v47.size.double height = v17 + v17;
  CGSize v41 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGPoint v43 = (CGPoint)*MEMORY[0x1E4F1DB28];
  v46.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v46.size = v41;
  if (v15)
  {
    CGRect v46 = remainder;
  }
  else
  {
    if (v10) {
      CGRectEdge v20 = CGRectMinXEdge;
    }
    else {
      CGRectEdge v20 = CGRectMaxXEdge;
    }
    CGRectDivide(remainder, &slice, &v46, v18, v20);
    double v13 = slice.origin.x;
    v47.origin.double x = slice.origin.x;
    CGRectDivide(v46, &slice, &v46, 5.0, v20);
  }
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v46.size.width, v46.size.height, v41);
  if (v21 == 0.0)
  {
    v22 = [(UILabel *)self->_subtitleLabel font];
    [v22 lineHeight];
    CGFloat v24 = v23;
  }
  else
  {
    CGFloat v24 = v21;
  }
  CGRectDivide(v46, &slice, &v46, v24, CGRectMaxYEdge);
  if (!a4) {
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v46.size.width, v46.size.height);
  v45.origin = v43;
  v45.size = v42;
  CGRectDivide(v46, &v45, &v46, v25, CGRectMaxYEdge);
  if (!a4)
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
    if ((v15 & 1) == 0)
    {
      CGFloat v26 = v45.origin.y;
      v47.origin.double y = v45.origin.y;
      -[UIView setFrame:](self->_buttonBackgroundView, "setFrame:", v13, v45.origin.y, v19, v17 + v17);
      v27 = [(UIView *)self->_buttonBackgroundView layer];
      PKFloatRoundToPixel();
      objc_msgSend(v27, "setCornerRadius:", fmin(v28, 20.0));

      v52.origin.double x = v13;
      v52.origin.double y = v26;
      v52.size.double width = v19;
      v52.size.double height = v17 + v17;
      CGRectDivide(v52, &slice, &v47, 8.0, CGRectMinXEdge);
      CGRectDivide(v47, &slice, &v47, 14.0, CGRectMinXEdge);
      buttonIconView = self->_buttonIconView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](buttonIconView, "setFrame:");
      CGRectDivide(v47, &slice, &v47, 4.0, CGRectMinXEdge);
      CGRectDivide(v47, &slice, &v47, 8.0, CGRectMaxXEdge);
      buttonLabel = self->_buttonLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](buttonLabel, "setFrame:");
    }
  }
  CGRectDivide(remainder, &slice, &remainder, 12.0, CGRectMinYEdge);
  v44.origin = v43;
  v44.size = v42;
  CGFloat v31 = CGRectGetMinY(v45) + -12.0 + -13.0;
  CGRectDivide(remainder, &v44, &remainder, v31, CGRectMinYEdge);
  if (!a4)
  {
    -[UIView setFrame:](self->_cardView, "setFrame:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
    spinner = self->_spinner;
    [(UIView *)self->_cardView center];
    -[UIActivityIndicatorView setCenter:](spinner, "setCenter:");
  }
  if (!self->_isUsingFallbackImage)
  {
    PKSizeScaleAspectFit();
    if (a4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v33 = [(UIImageView *)self->_cardArtImageView image];
  [v33 size];

  if (!a4)
  {
LABEL_19:
    cardArtImageView = self->_cardArtImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](cardArtImageView, "setFrame:");
    CGRect v53 = CGRectInset(v44, 5.0, 5.0);
    double v35 = v53.size.height;
    CGFloat v36 = v53.size.width * 0.5;
    -[UILabel sizeThatFits:](self->_leftTitleLabel, "sizeThatFits:", v53.size.width * 0.5, v53.size.height);
    leftTitleLabel = self->_leftTitleLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](leftTitleLabel, "setFrame:");
    -[UILabel sizeThatFits:](self->_rightTitleLabel, "sizeThatFits:", v36, v35);
    rightTitleLabel = self->_rightTitleLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](rightTitleLabel, "setFrame:");
  }
LABEL_20:
  double v39 = height - CGRectGetMinY(v45) + 13.0 + v44.size.width * 0.6 + 12.0;
  double v40 = width;
  result.double height = v39;
  result.double width = v40;
  return result;
}

- (void)_setupBubbleView
{
  int v3 = [(PKMessageExtensionMessageBubbleView *)self _shouldReverseLayoutDirection];
  [(PKMessageExtensionMessageBubbleView *)self setPreservesSuperviewLayoutMargins:1];
  [(PKMessageExtensionMessageBubbleView *)self setAutoresizingMask:18];
  double v4 = +[PKSharingMessageExtensionInvitationTheme messageBubbleBackgroundColor];
  [(PKMessageExtensionMessageBubbleView *)self setBackgroundColor:v4];

  objc_super v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  cardView = self->_cardView;
  self->_cardView = v5;

  v7 = self->_cardView;
  v8 = +[PKSharingMessageExtensionInvitationTheme carKeyImageBackgroundColor];
  [(UIView *)v7 setBackgroundColor:v8];

  v9 = [(UIView *)self->_cardView layer];
  [v9 setCornerRadius:8.0];

  [(PKMessageExtensionMessageBubbleView *)self addSubview:self->_cardView];
  int v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  cardArtImageView = self->_cardArtImageView;
  self->_cardArtImageView = v10;

  id v56 = [(UIImageView *)self->_cardArtImageView layer];
  [v56 setCornerRadius:8.0];
  [v56 setMasksToBounds:1];
  [(PKMessageExtensionMessageBubbleView *)self addSubview:self->_cardArtImageView];
  CGFloat v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  leftTitleLabel = self->_leftTitleLabel;
  self->_leftTitleLabel = v12;

  CGFloat v14 = self->_leftTitleLabel;
  char v15 = +[PKSharingMessageExtensionInvitationTheme messageDefaultFont];
  [(UILabel *)v14 setFont:v15];

  [(UILabel *)self->_leftTitleLabel setTextAlignment:0];
  [(UILabel *)self->_leftTitleLabel setNumberOfLines:0];
  [(UILabel *)self->_leftTitleLabel setMinimumScaleFactor:0.5];
  double v16 = self->_leftTitleLabel;
  double v17 = +[PKSharingMessageExtensionInvitationTheme primaryTextColor];
  [(UILabel *)v16 setTextColor:v17];

  [(UILabel *)self->_leftTitleLabel setBaselineAdjustment:1];
  [(PKMessageExtensionMessageBubbleView *)self addSubview:self->_leftTitleLabel];
  CGFloat v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  rightTitleLabel = self->_rightTitleLabel;
  self->_rightTitleLabel = v18;

  CGRectEdge v20 = self->_rightTitleLabel;
  double v21 = +[PKSharingMessageExtensionInvitationTheme messageDefaultFont];
  [(UILabel *)v20 setFont:v21];

  [(UILabel *)self->_rightTitleLabel setTextAlignment:2];
  [(UILabel *)self->_rightTitleLabel setNumberOfLines:0];
  [(UILabel *)self->_rightTitleLabel setMinimumScaleFactor:0.5];
  v22 = self->_rightTitleLabel;
  double v23 = +[PKSharingMessageExtensionInvitationTheme primaryTextColor];
  [(UILabel *)v22 setTextColor:v23];

  [(UILabel *)self->_rightTitleLabel setBaselineAdjustment:1];
  [(PKMessageExtensionMessageBubbleView *)self addSubview:self->_rightTitleLabel];
  CGFloat v24 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  buttonBackgroundView = self->_buttonBackgroundView;
  self->_buttonBackgroundView = v24;

  CGFloat v26 = self->_buttonBackgroundView;
  v27 = [MEMORY[0x1E4FB1618] systemBlackColor];
  [(UIView *)v26 setBackgroundColor:v27];

  [(PKMessageExtensionMessageBubbleView *)self addSubview:self->_buttonBackgroundView];
  double v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  buttonLabel = self->_buttonLabel;
  self->_buttonLabel = v28;

  v30 = self->_buttonLabel;
  CGFloat v31 = +[PKSharingMessageExtensionInvitationTheme messageDefaultFont];
  [(UILabel *)v30 setFont:v31];

  [(UILabel *)self->_buttonLabel setTextAlignment:1];
  [(UILabel *)self->_buttonLabel setNumberOfLines:1];
  [(UILabel *)self->_buttonLabel setMinimumScaleFactor:0.5];
  [(UILabel *)self->_buttonLabel setBaselineAdjustment:1];
  v32 = self->_buttonLabel;
  v33 = +[PKSharingMessageExtensionInvitationTheme primaryTextColor];
  [(UILabel *)v32 setTextColor:v33];

  [(UILabel *)self->_buttonLabel setHidden:1];
  [(UILabel *)self->_buttonLabel setClipsToBounds:1];
  [(PKMessageExtensionMessageBubbleView *)self addSubview:self->_buttonLabel];
  v34 = (void *)MEMORY[0x1E4FB1818];
  double v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  CGFloat v36 = [v34 imageNamed:@"AddPass_Icon" inBundle:v35];

  v37 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v36];
  buttonIconView = self->_buttonIconView;
  self->_buttonIconView = v37;

  [(UIImageView *)self->_buttonIconView setContentMode:1];
  [(PKMessageExtensionMessageBubbleView *)self addSubview:self->_buttonIconView];
  double v39 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v39;

  CGSize v41 = self->_titleLabel;
  CGSize v42 = +[PKSharingMessageExtensionInvitationTheme messageTitleFont];
  [(UILabel *)v41 setFont:v42];

  if (v3) {
    uint64_t v43 = 2;
  }
  else {
    uint64_t v43 = 0;
  }
  [(UILabel *)self->_titleLabel setTextAlignment:v43];
  [(UILabel *)self->_titleLabel setNumberOfLines:2];
  LODWORD(v44) = 0.5;
  [(UILabel *)self->_titleLabel _setHyphenationFactor:v44];
  [(UILabel *)self->_titleLabel setMinimumScaleFactor:0.5];
  CGRect v45 = self->_titleLabel;
  CGRect v46 = +[PKSharingMessageExtensionInvitationTheme captionTextColor];
  [(UILabel *)v45 setTextColor:v46];

  [(UILabel *)self->_titleLabel setBaselineAdjustment:1];
  [(UILabel *)self->_titleLabel sizeToFit];
  [(PKMessageExtensionMessageBubbleView *)self addSubview:self->_titleLabel];
  CGRect v47 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v47;

  v49 = self->_subtitleLabel;
  v50 = +[PKSharingMessageExtensionInvitationTheme messageDefaultFont];
  [(UILabel *)v49 setFont:v50];

  [(UILabel *)self->_subtitleLabel setTextAlignment:v43];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:2];
  LODWORD(v51) = 0.5;
  [(UILabel *)self->_subtitleLabel _setHyphenationFactor:v51];
  [(UILabel *)self->_subtitleLabel setMinimumScaleFactor:0.5];
  CGRect v52 = self->_subtitleLabel;
  CGRect v53 = +[PKSharingMessageExtensionInvitationTheme subcaptionTextColor];
  [(UILabel *)v52 setTextColor:v53];

  [(UILabel *)self->_subtitleLabel setBaselineAdjustment:1];
  [(UILabel *)self->_subtitleLabel sizeToFit];
  [(PKMessageExtensionMessageBubbleView *)self addSubview:self->_subtitleLabel];
  v54 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
  spinner = self->_spinner;
  self->_spinner = v54;

  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(PKMessageExtensionMessageBubbleView *)self addSubview:self->_spinner];
}

- (void)setProperties:(id)a3
{
  id v25 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_properties, a3);
    uint64_t v5 = [v25 cardImage];
    if (v5)
    {
      v6 = (void *)v5;
      self->_isUsingFallbackImage = 0;
    }
    else
    {
      v6 = [v25 fallbackCardImageName];
      double v8 = 1.0;
      if (!v6) {
        goto LABEL_5;
      }
      double v21 = [(UIImageView *)self->_cardArtImageView image];

      if (v21) {
        goto LABEL_5;
      }
      v22 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:2 scale:54.0];
      double v23 = [MEMORY[0x1E4FB1818] systemImageNamed:v6];
      uint64_t v24 = [v23 imageWithSymbolConfiguration:v22];

      self->_isUsingFallbackImage = 1;
      if (!v24) {
        goto LABEL_6;
      }
      v6 = (void *)v24;
    }
    [(UIImageView *)self->_cardArtImageView setImage:v6];
    LOBYTE(v7) = self->_isUsingFallbackImage;
    double v8 = (double)v7;
LABEL_5:

LABEL_6:
    [(UIView *)self->_cardView setAlpha:v8];
    int v9 = [(PKMessageExtensionMessageBubbleView *)self _shouldReverseLayoutDirection];
    leftTitleLabel = self->_leftTitleLabel;
    if (v9)
    {
      CGFloat v11 = [v25 rightTitleText];
      [(UILabel *)leftTitleLabel setText:v11];

      rightTitleLabel = self->_rightTitleLabel;
      [v25 leftTitleText];
    }
    else
    {
      double v13 = [v25 leftTitleText];
      [(UILabel *)leftTitleLabel setText:v13];

      rightTitleLabel = self->_rightTitleLabel;
      [v25 rightTitleText];
    CGFloat v14 = };
    [(UILabel *)rightTitleLabel setText:v14];

    titleLabel = self->_titleLabel;
    double v16 = [v25 title];
    [(UILabel *)titleLabel setText:v16];

    subtitleLabel = self->_subtitleLabel;
    CGFloat v18 = [v25 subtitle];
    [(UILabel *)subtitleLabel setText:v18];

    double v19 = [v25 buttonText];
    BOOL v20 = v19 == 0;
    [(UILabel *)self->_buttonLabel setHidden:v20];
    [(UIImageView *)self->_buttonIconView setHidden:v20];
    [(UIView *)self->_buttonBackgroundView setHidden:v20];
    [(UILabel *)self->_buttonLabel setText:v19];
    [(PKMessageExtensionMessageBubbleView *)self setNeedsLayout];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  [(PKMessageExtensionMessageBubbleView *)self setNeedsLayout];
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PKSharingMessageExtensionViewProperties)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundView, 0);
  objc_storeStrong((id *)&self->_buttonIconView, 0);
  objc_storeStrong((id *)&self->_buttonLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_rightTitleLabel, 0);
  objc_storeStrong((id *)&self->_leftTitleLabel, 0);
  objc_storeStrong((id *)&self->_cardArtImageView, 0);

  objc_storeStrong((id *)&self->_cardView, 0);
}

@end