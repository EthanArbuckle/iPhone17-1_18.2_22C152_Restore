@interface PKWatchHeroImageView
+ (CGSize)heroWatchImageSize;
+ (CGSize)recommendedCardImageSize;
- (BOOL)hideDoneLabel;
- (CGPoint)watchScreenCenter;
- (CGRect)cardFrame;
- (CGRect)spaceBelowCardFrame;
- (CGRect)watchScreenFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKWatchHeroImageView)init;
- (PKWatchHeroImageView)initWithFrame:(CGRect)a3;
- (UIImage)cardImage;
- (UIImage)wallpaperImage;
- (double)watchDeviceImageScaleFactor;
- (unint64_t)size;
- (void)_updatedAccessibilityLabel;
- (void)layoutSubviews;
- (void)setCardImage:(id)a3;
- (void)setHideDoneLabel:(BOOL)a3;
- (void)setSize:(unint64_t)a3;
- (void)setWallpaperImage:(id)a3;
- (void)setWallpaperImage:(id)a3 contentMode:(int64_t)a4;
@end

@implementation PKWatchHeroImageView

- (PKWatchHeroImageView)init
{
  return -[PKWatchHeroImageView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKWatchHeroImageView)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)PKWatchHeroImageView;
  v3 = -[PKWatchHeroImageView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_size = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F50C10]);
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    +[PKWatchHeroImageView heroWatchImageSize];
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", v6, v7, v8, v9);
    watchView = v4->_watchView;
    v4->_watchView = (BPSIllustratedWatchView *)v10;

    [(BPSIllustratedWatchView *)v4->_watchView setAllowScaling:1];
    [(PKWatchHeroImageView *)v4 addSubview:v4->_watchView];
    id v12 = objc_alloc(MEMORY[0x1E4FB1930]);
    v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v14 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(UILabel *)v13 setTextColor:v14];
    v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [(UILabel *)v13 setFont:v15];
    id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
    v17 = PKLocalizedPaymentString(&cfstr_WatchPaymentCo.isa);
    v18 = (void *)[v16 initWithString:v17];

    v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v18 insertAttributedString:v19 atIndex:0];

    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB0870]) initWithData:0 ofType:0];
    v21 = [MEMORY[0x1E4FB1830] configurationWithFont:v15 scale:1];
    v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill" withConfiguration:v21];
    v23 = [v22 imageWithTintColor:v14];
    [v20 setImage:v23];

    v24 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v20];
    [v18 insertAttributedString:v24 atIndex:0];

    uint64_t v25 = [v18 length];
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v15, 0, v25);
    [(UILabel *)v13 setAttributedText:v18];
    doneLabel = v4->_doneLabel;
    v4->_doneLabel = v13;
    v27 = v13;

    [(PKWatchHeroImageView *)v4 addSubview:v4->_doneLabel];
    [(PKWatchHeroImageView *)v4 setClipsToBounds:1];
    v28 = [MEMORY[0x1E4FB1618] clearColor];

    [(PKWatchHeroImageView *)v4 setBackgroundColor:v28];
    [(PKWatchHeroImageView *)v4 setAccessibilityTraits:*MEMORY[0x1E4FB25A0]];
    [(PKWatchHeroImageView *)v4 setIsAccessibilityElement:1];
    [(PKWatchHeroImageView *)v4 _updatedAccessibilityLabel];
  }
  return v4;
}

- (void)_updatedAccessibilityLabel
{
  if (self->_cardArtImageView) {
    v3 = @"WATCH_DEVICE_ACCESSIBILITY_LABEL_PASS";
  }
  else {
    v3 = @"WATCH_DEVICE_ACCESSIBILITY_LABEL";
  }
  PKLocalizedPaymentString(&v3->isa);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKWatchHeroImageView *)self setAccessibilityLabel:v4];
}

- (double)watchDeviceImageScaleFactor
{
  return 1.0;
}

- (CGPoint)watchScreenCenter
{
  [(PKWatchHeroImageView *)self watchScreenFrame];
  double v4 = v3 + v2 * 0.5;
  double v7 = v6 + v5 * 0.5;
  result.y = v7;
  result.x = v4;
  return result;
}

- (CGRect)watchScreenFrame
{
  [(BPSIllustratedWatchView *)self->_watchView watchScreenInsetGuide];

  return CGRectInset(*(CGRect *)&v2, 3.0, 0.0);
}

- (CGRect)cardFrame
{
  [(PKWatchHeroImageView *)self watchScreenFrame];
  double v4 = v3;
  double v6 = v5;
  [(PKWatchHeroImageView *)self watchScreenCenter];
  UIRoundToViewScale();
  double v8 = v7;
  +[PKBridgeWatchAttributeController heroWatchSize];
  UIRoundToViewScale();
  double v10 = v9;
  UIRoundToViewScale();
  double v12 = v11;
  double v13 = v4 + v10;
  double v14 = v8;
  double v15 = v6;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (CGRect)spaceBelowCardFrame
{
  [(PKWatchHeroImageView *)self cardFrame];
  CGFloat v4 = v3;
  CGFloat rect = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PKWatchHeroImageView *)self watchScreenFrame];
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  CGFloat rect_16 = CGRectGetMinX(v24);
  v25.origin.CGFloat x = v4;
  v25.origin.CGFloat y = v6;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v10;
  CGFloat rect_8 = CGRectGetMaxY(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v15 = CGRectGetWidth(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v27);
  v28.origin.CGFloat x = rect;
  v28.origin.CGFloat y = v6;
  v28.size.CGFloat width = v8;
  v28.size.CGFloat height = v10;
  double v17 = MaxY - CGRectGetMaxY(v28);
  double v19 = rect_8;
  double v18 = rect_16;
  double v20 = v15;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

+ (CGSize)heroWatchImageSize
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double v3 = (double *)((char *)&unk_1A0444758 + 8 * v2);
  CGFloat v4 = (double *)((char *)&unk_1A04447A0 + 8 * v2);
  if (v2 >= 9)
  {
    CGFloat v4 = (double *)(MEMORY[0x1E4F1DB30] + 8);
    double v3 = (double *)MEMORY[0x1E4F1DB30];
  }
  double v5 = *v3;
  double v6 = *v4;
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)PKWatchHeroImageView;
  [(PKWatchHeroImageView *)&v25 layoutSubviews];
  [(PKWatchHeroImageView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = v3;
  double v10 = v4;
  watchView = self->_watchView;
  if (self->_size)
  {
    LODWORD(v3) = 1148846080;
    LODWORD(v4) = 1112014848;
    -[BPSIllustratedWatchView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_watchView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v9, v10, v3, v4);
    watchView = self->_watchView;
    PKSizeAlignedInRect();
    double v6 = v12;
    double v8 = v13;
    double v9 = v14;
    double v10 = v15;
  }
  -[BPSIllustratedWatchView setFrame:](watchView, "setFrame:", v6, v8, v9, v10);
  wallpaperImageView = self->_wallpaperImageView;
  if (wallpaperImageView)
  {
    [(PKWatchHeroImageView *)self watchScreenFrame];
    -[UIImageView setFrame:](wallpaperImageView, "setFrame:");
  }
  cardArtImageView = self->_cardArtImageView;
  if (cardArtImageView)
  {
    [(PKWatchHeroImageView *)self cardFrame];
    -[UIImageView setFrame:](cardArtImageView, "setFrame:");
  }
  if (!self->_hideDoneLabel)
  {
    [(PKWatchHeroImageView *)self spaceBelowCardFrame];
    -[UILabel sizeThatFits:](self->_doneLabel, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v19 = v18;
    double v21 = v20;
    UIRoundToViewScale();
    double v23 = v22;
    UIRoundToViewScale();
    -[UILabel setFrame:](self->_doneLabel, "setFrame:", v23, v24, v19, v21);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  +[PKWatchHeroImageView heroWatchImageSize];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

+ (CGSize)recommendedCardImageSize
{
  +[PKWatchHeroImageView heroWatchImageSize];
  v2.n128_f64[0] = v2.n128_f64[0] * 0.555;
  v3.n128_u64[0] = 0x3FCA5E353F7CED91;
  v4.n128_f64[0] = v4.n128_f64[0] * 0.206;

  PKSizeRoundToPixel(v2, v4, v3);
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)setSize:(unint64_t)a3
{
  if (self->_size != a3)
  {
    self->_size = a3;
    [(BPSIllustratedWatchView *)self->_watchView setAllowScaling:a3 == 0];
    [(PKWatchHeroImageView *)self setNeedsLayout];
  }
}

- (void)setHideDoneLabel:(BOOL)a3
{
  if (self->_hideDoneLabel != a3)
  {
    self->_hideDoneLabel = a3;
    if (a3) {
      [(UILabel *)self->_doneLabel removeFromSuperview];
    }
    else {
      [(PKWatchHeroImageView *)self addSubview:self->_doneLabel];
    }
    [(PKWatchHeroImageView *)self setNeedsLayout];
  }
}

- (void)setWallpaperImage:(id)a3
{
}

- (void)setWallpaperImage:(id)a3 contentMode:(int64_t)a4
{
  id v6 = a3;
  wallpaperImageView = self->_wallpaperImageView;
  id v11 = v6;
  if (v6)
  {
    if (!wallpaperImageView)
    {
      double v8 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
      double v9 = self->_wallpaperImageView;
      self->_wallpaperImageView = v8;

      [(UIImageView *)self->_wallpaperImageView setContentMode:a4];
      [(UIImageView *)self->_wallpaperImageView setClipsToBounds:1];
      [(BPSIllustratedWatchView *)self->_watchView addSubview:self->_wallpaperImageView];
      id v6 = v11;
      wallpaperImageView = self->_wallpaperImageView;
    }
    [(UIImageView *)wallpaperImageView setImage:v6];
  }
  else
  {
    [(UIImageView *)wallpaperImageView removeFromSuperview];
    double v10 = self->_wallpaperImageView;
    self->_wallpaperImageView = 0;
  }
  [(PKWatchHeroImageView *)self setNeedsLayout];
}

- (UIImage)wallpaperImage
{
  return [(UIImageView *)self->_wallpaperImageView image];
}

- (void)setCardImage:(id)a3
{
  id v4 = a3;
  cardArtImageView = self->_cardArtImageView;
  id v11 = v4;
  if (v4)
  {
    if (!cardArtImageView)
    {
      id v6 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
      double v7 = self->_cardArtImageView;
      self->_cardArtImageView = v6;

      [(UIImageView *)self->_cardArtImageView setContentMode:1];
      [(BPSIllustratedWatchView *)self->_watchView addSubview:self->_cardArtImageView];
      double v8 = [(UIImageView *)self->_cardArtImageView layer];
      [(PKWatchHeroImageView *)self cardFrame];
      +[PKTransactionDataOverlayCardFaceView borderWidth];
      id v9 = +[PKTransactionDataOverlayCardFaceView borderColor];
      [v9 CGColor];
      PKPaymentStyleApplyCorners();

      id v4 = v11;
      cardArtImageView = self->_cardArtImageView;
    }
    [(UIImageView *)cardArtImageView setImage:v4];
  }
  else
  {
    [(UIImageView *)cardArtImageView removeFromSuperview];
    double v10 = self->_cardArtImageView;
    self->_cardArtImageView = 0;
  }
  [(PKWatchHeroImageView *)self _updatedAccessibilityLabel];
  [(PKWatchHeroImageView *)self setNeedsLayout];
}

- (UIImage)cardImage
{
  return [(UIImageView *)self->_cardArtImageView image];
}

- (BOOL)hideDoneLabel
{
  return self->_hideDoneLabel;
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardArtImageView, 0);
  objc_storeStrong((id *)&self->_wallpaperImageView, 0);
  objc_storeStrong((id *)&self->_doneLabel, 0);

  objc_storeStrong((id *)&self->_watchView, 0);
}

@end