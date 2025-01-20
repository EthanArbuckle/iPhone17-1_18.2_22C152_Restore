@interface PKEducationPhone
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKEducationPhone)initWithFrame:(CGRect)a3;
- (PKEducationPhone)initWithFrame:(CGRect)a3 displayOptions:(unint64_t)a4;
- (double)_deviceIconsPadding;
- (double)_topPadding;
- (void)_setHomeButtonOutlineColor;
- (void)_startPowerIndicatorAnimation;
- (void)layoutSubviews;
- (void)setPassImage:(id)a3;
- (void)startAnimation;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKEducationPhone

- (PKEducationPhone)initWithFrame:(CGRect)a3
{
  return -[PKEducationPhone initWithFrame:displayOptions:](self, "initWithFrame:displayOptions:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKEducationPhone)initWithFrame:(CGRect)a3 displayOptions:(unint64_t)a4
{
  char v4 = a4;
  v60.receiver = self;
  v60.super_class = (Class)PKEducationPhone;
  v5 = -[PKEducationPhone initWithFrame:](&v60, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    p_screenSize = &v5->_screenSize;
    PKScreenSize();
    *(void *)&p_screenSize->width = v8;
    v6->_screenSize.height = v9;
    v6->_screenType = PKUIGetMinScreenType();
    v6->_hasPearl = PKPearlIsAvailable();
    v10 = objc_alloc_init(PKPhoneHeroView);
    phoneBackgroundView = v6->_phoneBackgroundView;
    v6->_phoneBackgroundView = v10;

    [(PKEducationPhone *)v6 addSubview:v6->_phoneBackgroundView];
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    cardImageView = v6->_cardImageView;
    v6->_cardImageView = v12;

    [(UIImageView *)v6->_cardImageView setContentMode:1];
    [(PKEducationPhone *)v6 addSubview:v6->_cardImageView];
    if ((v4 & 1) == 0)
    {
      v14 = objc_alloc_init(PKPaymentSetupInitialCardEducationIconsView);
      iconsView = v6->_iconsView;
      v6->_iconsView = v14;

      [(PKEducationPhone *)v6 addSubview:v6->_iconsView];
    }
    id v16 = objc_alloc(MEMORY[0x1E4FB1838]);
    v17 = PKUIImageNamed(@"CardStack_Illustration");
    uint64_t v18 = [v16 initWithImage:v17];
    walletImageView = v6->_walletImageView;
    v6->_walletImageView = (UIImageView *)v18;

    [(UIImageView *)v6->_walletImageView setContentMode:1];
    [(PKEducationPhone *)v6 addSubview:v6->_walletImageView];
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    homeButtonView = v6->_homeButtonView;
    v6->_homeButtonView = v20;

    v22 = v6->_homeButtonView;
    if (v6->_hasPearl)
    {
      v23 = [MEMORY[0x1E4FB1618] labelColor];
      [(UIView *)v22 setBackgroundColor:v23];
    }
    else
    {
      v24 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [(UIView *)v22 setBackgroundColor:v24];

      [(UIView *)v6->_homeButtonView setAlpha:0.4];
    }
    [(PKEducationPhone *)v6 addSubview:v6->_homeButtonView];
    if (!v6->_hasPearl)
    {
      v25 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      homeButtonOutlineView = v6->_homeButtonOutlineView;
      v6->_homeButtonOutlineView = v25;

      v27 = [(UIView *)v6->_homeButtonOutlineView layer];
      [v27 setBorderWidth:2.0];

      [(PKEducationPhone *)v6 addSubview:v6->_homeButtonOutlineView];
      [(PKEducationPhone *)v6 _setHomeButtonOutlineColor];
    }
    v28 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    biometricsImageView = v6->_biometricsImageView;
    v6->_biometricsImageView = v28;

    [(UIImageView *)v6->_biometricsImageView setContentMode:1];
    if (v6->_hasPearl) {
      v30 = @"PearlIDIcon";
    }
    else {
      v30 = @"TouchIDIcon";
    }
    v31 = v30;
    if ((v4 & 2) != 0)
    {
      uint64_t v32 = [NSString stringWithFormat:@"%@Barcode", v31];

      v31 = (__CFString *)v32;
    }
    v33 = PKPassKitUIBundle();
    v34 = [v33 URLForResource:v31 withExtension:@"pdf"];

    v35 = v6->_biometricsImageView;
    double v36 = PKUIScreenScale();
    v37 = PKUIImageFromPDF(v34, 40.0, 40.0, v36);
    [(UIImageView *)v35 setImage:v37];

    [(PKEducationPhone *)v6 addSubview:v6->_biometricsImageView];
    if (v6->_hasPearl)
    {
      v38 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      powerIndicatorView = v6->_powerIndicatorView;
      v6->_powerIndicatorView = v38;

      [(UIImageView *)v6->_powerIndicatorView setContentMode:1];
      v40 = PKPassKitUIBundle();
      v41 = [v40 URLForResource:@"Education_Power_Button" withExtension:@"pdf"];

      double v42 = PKUIScreenScale();
      v43 = PKUIImageFromPDF(v41, 20.0, 40.0, v42);
      v44 = v6->_powerIndicatorView;
      v45 = [v43 imageWithRenderingMode:2];
      [(UIImageView *)v44 setImage:v45];

      v46 = v6->_powerIndicatorView;
      v47 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [(UIImageView *)v46 setTintColor:v47];

      [(UIImageView *)v6->_powerIndicatorView setAlpha:0.4];
      v48 = [(UIImageView *)v6->_powerIndicatorView layer];
      objc_msgSend(v48, "setAnchorPoint:", 0.0, 0.5);

      [(PKEducationPhone *)v6 addSubview:v6->_powerIndicatorView];
      v49 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      powerArrowImageView = v6->_powerArrowImageView;
      v6->_powerArrowImageView = v49;

      v51 = PKPassKitUIBundle();
      v52 = [v51 URLForResource:@"Education_Power_Arrow" withExtension:@"pdf"];

      double v53 = PKUIScreenScale();
      v54 = PKUIImageFromPDF(v52, 40.0, 40.0, v53);
      v55 = v6->_powerArrowImageView;
      v56 = [v54 imageWithRenderingMode:2];
      [(UIImageView *)v55 setImage:v56];

      v57 = v6->_powerArrowImageView;
      v58 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [(UIImageView *)v57 setTintColor:v58];

      [(PKEducationPhone *)v6 addSubview:v6->_powerArrowImageView];
    }
  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  unint64_t screenType = self->_screenType;
  if (screenType > 0x13) {
    double v6 = 0.3;
  }
  else {
    double v6 = dbl_1A0442A90[screenType];
  }
  double v7 = v6 * self->_screenSize.width / (self->_screenSize.width / self->_screenSize.height);
  if (self->_hasPearl) {
    double v8 = 0.0;
  }
  else {
    double v8 = 45.0;
  }
  [(PKEducationPhone *)self _topPadding];
  double v10 = v7 + v9;
  [(PKEducationPhone *)self _deviceIconsPadding];
  double v12 = v8 + v10 + v11 + 34.0;
  double v13 = width;
  result.height = v12;
  result.CGFloat width = v13;
  return result;
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)PKEducationPhone;
  [(PKEducationPhone *)&v63 layoutSubviews];
  [(PKEducationPhone *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(PKEducationPhone *)self _topPadding];
  double v8 = v7;
  double v9 = v6 - v7 + -34.0;
  double v10 = v9 + -45.0;
  if (self->_hasPearl) {
    double v10 = v9;
  }
  -[PKPhoneHeroView sizeThatFits:](self->_phoneBackgroundView, "sizeThatFits:", v4, v10);
  double v12 = v11;
  double v14 = v13;
  iconsView = self->_iconsView;
  double v16 = v4 - v11;
  double v17 = v16 * 0.5;
  if (iconsView)
  {
    -[PKPaymentSetupInitialCardEducationIconsView setFrame:](iconsView, "setFrame:", v16 * 0.5, v8, v12, 34.0);
    v64.origin.x = v17;
    v64.origin.y = v8;
    v64.size.double width = v12;
    v64.size.height = 34.0;
    double MaxY = CGRectGetMaxY(v64);
    [(PKEducationPhone *)self _deviceIconsPadding];
    double v8 = MaxY + v19;
  }
  CGFloat v62 = v8;
  -[PKPhoneHeroView setFrame:](self->_phoneBackgroundView, "setFrame:", v17, v8, v12, v14);
  [(PKPhoneHeroView *)self->_phoneBackgroundView deviceCornerRadius];
  double v21 = v20;
  v22 = [(UIImageView *)self->_cardImageView image];
  [v22 size];
  PKSizeAspectFit();
  PKSizeRoundToPixel(v23, v24, v25);
  double v27 = v26;
  double v29 = v28;

  CGFloat v61 = v14;
  double v30 = v17;
  CGFloat v31 = (v4 - v27) * 0.5;
  double v32 = v8 + v21;
  -[UIImageView setFrame:](self->_cardImageView, "setFrame:", v31, v32, v27, v29);
  PKFloatRoundToPixel();
  double v34 = v33;
  double v58 = v29;
  double v59 = v4;
  double v35 = (v4 - v33) * 0.5;
  v65.origin.x = v31;
  double v57 = v32;
  v65.origin.y = v32;
  v65.size.double width = v27;
  v65.size.height = v29;
  double v36 = v12;
  -[UIImageView setFrame:](self->_biometricsImageView, "setFrame:", v35, CGRectGetMaxY(v65) + 20.0, v34, v34);
  PKFloatRoundToPixel();
  double v38 = v37;
  v66.origin.x = v30;
  v66.origin.y = v62;
  v66.size.double width = v12;
  v66.size.height = v61;
  double v39 = CGRectGetMaxY(v66);
  double MinY = v39;
  double v60 = v38;
  if (self->_hasPearl)
  {
    double v41 = v12 * 0.5;
    PKFloatRoundToPixel();
    double v42 = (v59 - v12 * 0.5) * 0.5;
    double v44 = MinY - v43 - v38;
    double v45 = v43 * 0.5;
  }
  else
  {
    double v42 = (v59 + -35.0) * 0.5;
    double v44 = v39 + 10.0;
    double v41 = 35.0;
    v67.origin.x = v42;
    v67.origin.y = MinY + 10.0;
    v67.size.double width = 35.0;
    v67.size.height = 35.0;
    CGRect v68 = CGRectInset(v67, 4.0, 4.0);
    double width = v68.size.width;
    -[UIView setFrame:](self->_homeButtonOutlineView, "setFrame:", v68.origin.x, v68.origin.y);
    v47 = [(UIView *)self->_homeButtonOutlineView layer];
    [v47 setCornerRadius:width * 0.5];

    double v45 = 17.5;
  }
  -[UIView setFrame:](self->_homeButtonView, "setFrame:", v42, v44, v41);
  v48 = [(UIView *)self->_homeButtonView layer];
  [v48 setCornerRadius:v45];

  v49 = [(UIImageView *)self->_walletImageView image];
  [v49 size];
  double v51 = v50;
  double v53 = v52;

  double v54 = v36 / (v51 / v53);
  if (self->_hasPearl)
  {
    [(UIView *)self->_homeButtonView frame];
    double MinY = CGRectGetMinY(v69);
  }
  -[UIImageView setFrame:](self->_walletImageView, "setFrame:", v30, MinY - v54 - v60, v36, v54);
  if (self->_hasPearl)
  {
    double v55 = v32 + (v58 + -30.0) * 0.5;
    v70.origin.x = v30;
    v70.origin.y = v62;
    v70.size.double width = v36;
    v70.size.height = v61;
    CGFloat v56 = CGRectGetMaxX(v70) + 5.0;
    -[UIImageView setFrame:](self->_powerIndicatorView, "setFrame:", v56, v55, 5.0, 30.0);
    v71.size.double width = 5.0;
    v71.size.height = 30.0;
    v71.origin.x = v56;
    v71.origin.y = v57 + (v58 + -30.0) * 0.5;
    -[UIImageView setFrame:](self->_powerArrowImageView, "setFrame:", CGRectGetMaxX(v71) + 5.0, v55, 35.0, 30.0);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKEducationPhone;
  [(PKEducationPhone *)&v4 traitCollectionDidChange:a3];
  [(PKEducationPhone *)self _setHomeButtonOutlineColor];
}

- (void)setPassImage:(id)a3
{
  [(UIImageView *)self->_cardImageView setImage:a3];

  [(PKEducationPhone *)self setNeedsLayout];
}

- (void)startAnimation
{
  if (!self->_isAnimating)
  {
    self->_isAnimating = 1;
    if (self->_hasPearl) {
      [(PKEducationPhone *)self _startPowerIndicatorAnimation];
    }
  }
}

- (void)_setHomeButtonOutlineColor
{
  if (self->_homeButtonOutlineView)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__PKEducationPhone__setHomeButtonOutlineColor__block_invoke;
    v7[3] = &unk_1E59CA7D0;
    v7[4] = self;
    v2 = (void *)MEMORY[0x1E4FB1E20];
    double v3 = self;
    objc_super v4 = [v2 currentTraitCollection];
    double v5 = (void *)MEMORY[0x1E4FB1E20];
    double v6 = [(PKEducationPhone *)v3 traitCollection];

    [v5 setCurrentTraitCollection:v6];
    __46__PKEducationPhone__setHomeButtonOutlineColor__block_invoke((uint64_t)v7);
    [MEMORY[0x1E4FB1E20] setCurrentTraitCollection:v4];
  }
}

void __46__PKEducationPhone__setHomeButtonOutlineColor__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 464) layer];
  id v1 = [MEMORY[0x1E4FB1618] systemBlueColor];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));
}

- (double)_topPadding
{
  unint64_t screenType = self->_screenType;
  double result = 10.0;
  if (screenType <= 0x13) {
    return dbl_1A0442B30[screenType];
  }
  return result;
}

- (double)_deviceIconsPadding
{
  unint64_t screenType = self->_screenType;
  double result = 16.0;
  if (screenType <= 0x13) {
    return dbl_1A0442BD0[screenType];
  }
  return result;
}

- (void)_startPowerIndicatorAnimation
{
  v23[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F3A488];
  objc_super v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
  v23[0] = v4;
  uint64_t v5 = *MEMORY[0x1E4F3A498];
  double v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  v23[1] = v6;
  double v7 = [MEMORY[0x1E4F39C10] functionWithName:v3];
  v23[2] = v7;
  double v8 = [MEMORY[0x1E4F39C10] functionWithName:v5];
  v23[3] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  double v10 = [MEMORY[0x1E4F39BD8] animation];
  [v10 setKeyPath:@"position.x"];
  [v10 setValues:&unk_1EF2B9EE8];
  [v10 setKeyTimes:&unk_1EF2B9ED0];
  [v10 setDuration:1.0];
  [v10 setAdditive:1];
  [v10 setTimingFunctions:v9];
  double v11 = [MEMORY[0x1E4F39B38] animation];
  v22 = v10;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v11 setAnimations:v12];

  [v11 setDuration:3.0];
  LODWORD(v13) = 2139095039;
  [v11 setRepeatCount:v13];
  double v14 = [(UIImageView *)self->_powerArrowImageView layer];
  [v14 addAnimation:v11 forKey:@"double-tap"];

  v15 = [MEMORY[0x1E4F39BD8] animation];
  [v15 setKeyPath:@"transform.scale.x"];
  [v15 setValues:&unk_1EF2B9F00];
  [v15 setKeyTimes:&unk_1EF2B9ED0];
  [v15 setDuration:1.0];
  [v15 setTimingFunctions:v9];
  double v16 = [MEMORY[0x1E4F39BD8] animation];
  [v16 setKeyPath:@"opacity"];
  [v16 setValues:&unk_1EF2B9F18];
  [v16 setKeyTimes:&unk_1EF2B9ED0];
  [v16 setDuration:1.0];
  [v16 setTimingFunctions:v9];
  double v17 = [MEMORY[0x1E4F39B38] animation];

  v21[0] = v15;
  v21[1] = v16;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v17 setAnimations:v18];

  [v17 setDuration:3.0];
  LODWORD(v19) = 2139095039;
  [v17 setRepeatCount:v19];
  double v20 = [(UIImageView *)self->_powerIndicatorView layer];
  [v20 addAnimation:v17 forKey:@"power-indicator"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerArrowImageView, 0);
  objc_storeStrong((id *)&self->_powerIndicatorView, 0);
  objc_storeStrong((id *)&self->_biometricsImageView, 0);
  objc_storeStrong((id *)&self->_cardImageView, 0);
  objc_storeStrong((id *)&self->_walletImageView, 0);
  objc_storeStrong((id *)&self->_homeButtonOutlineView, 0);
  objc_storeStrong((id *)&self->_homeButtonView, 0);
  objc_storeStrong((id *)&self->_iconsView, 0);

  objc_storeStrong((id *)&self->_phoneBackgroundView, 0);
}

@end