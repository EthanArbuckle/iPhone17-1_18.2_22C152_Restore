@interface TFBetaAppLaunchScreenView
- (TFAppLockupView)lockupView;
- (TFBetaAppLaunchScreenView)initWithFrame:(CGRect)a3;
- (TFBetaAppLaunchScreenViewSpecification)specification;
- (TFDeviceInstructionView)instructionView;
- (UIButton)primaryButton;
- (UIButton)secondaryButton;
- (UILabel)bodyTextLabel;
- (UILabel)bodyTitleLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIScrollView)scrollView;
- (UIView)snapshot;
- (UIVisualEffectView)buttonBackgroundEffectView;
- (void)_layoutButtonModuleWithLayoutMetrics:(id)a3;
- (void)_layoutScrollViewWithLayoutMetrics:(id)a3 accomodatingPinnedBottomView:(id)a4;
- (void)_prepareForDisplayWithTraitCollection:(id)a3;
- (void)cleanupSnapshot;
- (void)layoutSubviews;
- (void)prepareForState:(unint64_t)a3;
- (void)setBodyTitle:(id)a3 bodyText:(id)a4;
- (void)setDeviceImage:(id)a3 withOrientation:(int64_t)a4;
- (void)setDeviceImageOrientation:(int64_t)a3;
- (void)setDeviceImageVisibility:(BOOL)a3;
- (void)setLockup:(id)a3;
- (void)setPrimaryButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setSecondaryButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setSnapshot:(id)a3;
- (void)setSpecification:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)snapshotCurrentView;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TFBetaAppLaunchScreenView

- (TFBetaAppLaunchScreenView)initWithFrame:(CGRect)a3
{
  v61.receiver = self;
  v61.super_class = (Class)TFBetaAppLaunchScreenView;
  v3 = -[TFBetaAppLaunchScreenView initWithFrame:](&v61, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [TFBetaAppLaunchScreenViewSpecification alloc];
    v5 = [(TFBetaAppLaunchScreenView *)v3 traitCollection];
    uint64_t v6 = [(TFBetaAppLaunchScreenViewSpecification *)v4 initWithTraitCollection:v5];
    specification = v3->_specification;
    v3->_specification = (TFBetaAppLaunchScreenViewSpecification *)v6;

    id v8 = objc_alloc(MEMORY[0x263F1C940]);
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], v10, v11, v12);
    scrollView = v3->_scrollView;
    v3->_scrollView = (UIScrollView *)v13;

    v15 = [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification backgroundColor];
    [(UIScrollView *)v3->_scrollView setBackgroundColor:v15];

    [(UIScrollView *)v3->_scrollView setContentInsetAdjustmentBehavior:2];
    [(UIScrollView *)v3->_scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v3->_scrollView setShowsHorizontalScrollIndicator:0];
    [(TFBetaAppLaunchScreenView *)v3 addSubview:v3->_scrollView];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v16;

    v18 = v3->_titleLabel;
    v19 = [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification titleFont];
    [(UILabel *)v18 setFont:v19];

    v20 = v3->_titleLabel;
    v21 = [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification textColor];
    [(UILabel *)v20 setTextColor:v21];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3->_titleLabel setNumberOfLines:1];
    [(UIScrollView *)v3->_scrollView addSubview:v3->_titleLabel];
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v22;

    v24 = v3->_subtitleLabel;
    v25 = [(TFBetaAppLaunchScreenView *)v3 specification];
    v26 = [v25 subtitleFont];
    [(UILabel *)v24 setFont:v26];

    v27 = v3->_subtitleLabel;
    v28 = [(TFBetaAppLaunchScreenView *)v3 specification];
    v29 = [v28 textColor];
    [(UILabel *)v27 setTextColor:v29];

    [(UILabel *)v3->_subtitleLabel setTextAlignment:1];
    [(UILabel *)v3->_subtitleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:5];
    [(UIScrollView *)v3->_scrollView addSubview:v3->_subtitleLabel];
    v30 = -[TFAppLockupView initWithFrame:]([TFAppLockupView alloc], "initWithFrame:", v9, v10, v11, v12);
    lockupView = v3->_lockupView;
    v3->_lockupView = v30;

    [(UIScrollView *)v3->_scrollView addSubview:v3->_lockupView];
    uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
    bodyTitleLabel = v3->_bodyTitleLabel;
    v3->_bodyTitleLabel = (UILabel *)v32;

    v34 = v3->_bodyTitleLabel;
    v35 = [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification bodyTitleFont];
    [(UILabel *)v34 setFont:v35];

    v36 = v3->_bodyTitleLabel;
    v37 = [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification textColor];
    [(UILabel *)v36 setTextColor:v37];

    [(UIScrollView *)v3->_scrollView addSubview:v3->_bodyTitleLabel];
    uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
    bodyTextLabel = v3->_bodyTextLabel;
    v3->_bodyTextLabel = (UILabel *)v38;

    v40 = v3->_bodyTextLabel;
    v41 = [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification bodyTextFont];
    [(UILabel *)v40 setFont:v41];

    v42 = v3->_bodyTextLabel;
    v43 = [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification textColor];
    [(UILabel *)v42 setTextColor:v43];

    [(UILabel *)v3->_bodyTextLabel setNumberOfLines:0];
    [(UIScrollView *)v3->_scrollView addSubview:v3->_bodyTextLabel];
    v44 = -[TFDeviceInstructionView initWithFrame:]([TFDeviceInstructionView alloc], "initWithFrame:", v9, v10, v11, v12);
    instructionView = v3->_instructionView;
    v3->_instructionView = v44;

    [(UIScrollView *)v3->_scrollView addSubview:v3->_instructionView];
    v46 = [MEMORY[0x263F1C480] effectWithStyle:4];
    uint64_t v47 = [objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v46];
    buttonBackgroundEffectView = v3->_buttonBackgroundEffectView;
    v3->_buttonBackgroundEffectView = (UIVisualEffectView *)v47;

    [(TFBetaAppLaunchScreenView *)v3 addSubview:v3->_buttonBackgroundEffectView];
    uint64_t v49 = [MEMORY[0x263F1C488] buttonWithType:1];
    primaryButton = v3->_primaryButton;
    v3->_primaryButton = (UIButton *)v49;

    v51 = v3->_primaryButton;
    v52 = [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification buttonTintColor];
    [(UIButton *)v51 setBackgroundColor:v52];

    v53 = [(UIButton *)v3->_primaryButton layer];
    [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification primaryButtonCornerRadius];
    objc_msgSend(v53, "setCornerRadius:");

    v54 = v3->_primaryButton;
    v55 = [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification overButtonTintTextColor];
    [(UIButton *)v54 setTitleColor:v55 forState:0];

    [(TFBetaAppLaunchScreenView *)v3 addSubview:v3->_primaryButton];
    uint64_t v56 = [MEMORY[0x263F1C488] buttonWithType:1];
    secondaryButton = v3->_secondaryButton;
    v3->_secondaryButton = (UIButton *)v56;

    v58 = v3->_secondaryButton;
    v59 = [(TFBetaAppLaunchScreenViewSpecification *)v3->_specification buttonTintColor];
    [(UIButton *)v58 setTitleColor:v59 forState:0];

    [(TFBetaAppLaunchScreenView *)v3 addSubview:v3->_secondaryButton];
  }
  return v3;
}

- (void)snapshotCurrentView
{
  v3 = [(TFBetaAppLaunchScreenView *)self snapshotViewAfterScreenUpdates:1];
  [(TFBetaAppLaunchScreenView *)self setSnapshot:v3];

  v4 = [(TFBetaAppLaunchScreenView *)self snapshot];
  [(TFBetaAppLaunchScreenView *)self bounds];
  objc_msgSend(v4, "setFrame:");

  id v5 = [(TFBetaAppLaunchScreenView *)self snapshot];
  [(TFBetaAppLaunchScreenView *)self addSubview:v5];
}

- (void)cleanupSnapshot
{
  v3 = [(TFBetaAppLaunchScreenView *)self snapshot];
  [v3 removeFromSuperview];

  [(TFBetaAppLaunchScreenView *)self setSnapshot:0];
}

- (void)prepareForState:(unint64_t)a3
{
  [(TFBetaAppLaunchScreenView *)self setHidden:a3 == 0];
  id v5 = [(TFBetaAppLaunchScreenView *)self lockupView];
  [v5 setHidden:a3 != 1];

  uint64_t v6 = [(TFBetaAppLaunchScreenView *)self bodyTitleLabel];
  [v6 setHidden:a3 != 1];

  v7 = [(TFBetaAppLaunchScreenView *)self bodyTextLabel];
  [v7 setHidden:a3 != 1];

  BOOL v8 = a3 != 2;
  double v9 = [(TFBetaAppLaunchScreenView *)self subtitleLabel];
  [v9 setHidden:v8];

  double v10 = [(TFBetaAppLaunchScreenView *)self instructionView];
  [v10 setHidden:v8];

  double v11 = [(TFBetaAppLaunchScreenView *)self secondaryButton];
  [v11 setHidden:v8];

  [(TFBetaAppLaunchScreenView *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(TFBetaAppLaunchScreenView *)self titleLabel];
  [v5 setText:v4];

  [(TFBetaAppLaunchScreenView *)self setNeedsLayout];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(TFBetaAppLaunchScreenView *)self subtitleLabel];
  [v5 setText:v4];

  [(TFBetaAppLaunchScreenView *)self setNeedsLayout];
}

- (void)setLockup:(id)a3
{
  id v21 = a3;
  id v4 = [(TFBetaAppLaunchScreenView *)self lockupView];
  id v5 = [v4 titleLabel];
  uint64_t v6 = [v21 title];
  [v5 setText:v6];

  v7 = [v21 subtitles];
  unint64_t v8 = [v7 count];

  double v9 = [v21 subtitles];
  double v10 = v9;
  if (v8 >= 2)
  {
    double v11 = [v9 objectAtIndexedSubscript:0];

    double v12 = [v21 subtitles];
    uint64_t v13 = [v12 objectAtIndexedSubscript:1];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v14 = [v9 count];

  if (v14 == 1)
  {
    double v12 = [v21 subtitles];
    double v11 = [v12 objectAtIndexedSubscript:0];
    uint64_t v13 = 0;
    goto LABEL_5;
  }
  double v11 = 0;
  uint64_t v13 = 0;
LABEL_7:
  v15 = [(TFBetaAppLaunchScreenView *)self lockupView];
  uint64_t v16 = [v15 primarySubtitleLabel];
  [v16 setText:v11];

  v17 = [(TFBetaAppLaunchScreenView *)self lockupView];
  v18 = [v17 secondarySubtitleLabel];
  [v18 setText:v13];

  v19 = [(TFBetaAppLaunchScreenView *)self lockupView];
  v20 = [v19 iconView];
  [v20 setImage:0];

  [(TFBetaAppLaunchScreenView *)self setNeedsLayout];
}

- (void)setBodyTitle:(id)a3 bodyText:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x263F089B8];
  id v7 = a4;
  id v8 = a3;
  id v11 = (id)[[v6 alloc] initWithString:v7];

  objc_msgSend(v11, "tf_addLanguageAwareness:", 0);
  double v9 = [(TFBetaAppLaunchScreenView *)self bodyTitleLabel];
  [v9 setText:v8];

  double v10 = [(TFBetaAppLaunchScreenView *)self bodyTextLabel];
  [v10 setAttributedText:v11];

  [(TFBetaAppLaunchScreenView *)self setNeedsLayout];
}

- (void)setDeviceImage:(id)a3 withOrientation:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TFBetaAppLaunchScreenView *)self instructionView];
  [v7 displayDeviceImage:v6 inOrientation:a4];
}

- (void)setDeviceImageVisibility:(BOOL)a3
{
  if (a3) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v5 = [(TFBetaAppLaunchScreenView *)self instructionView];
  id v4 = [v5 deviceImageView];
  [v4 setAlpha:v3];
}

- (void)setDeviceImageOrientation:(int64_t)a3
{
  id v4 = [(TFBetaAppLaunchScreenView *)self instructionView];
  [v4 updateCurrentDeviceImageToOrientation:a3];
}

- (void)setPrimaryButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  double v10 = [(TFBetaAppLaunchScreenView *)self primaryButton];
  [v10 setTitle:v9 forState:0];

  id v11 = [(TFBetaAppLaunchScreenView *)self primaryButton];
  [v11 removeTarget:0 action:0 forControlEvents:64];

  double v12 = [(TFBetaAppLaunchScreenView *)self primaryButton];
  [v12 addTarget:v8 action:a5 forControlEvents:64];

  [(TFBetaAppLaunchScreenView *)self setNeedsLayout];
}

- (void)setSecondaryButtonTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  double v10 = [(TFBetaAppLaunchScreenView *)self secondaryButton];
  [v10 setTitle:v9 forState:0];

  id v11 = [(TFBetaAppLaunchScreenView *)self secondaryButton];
  [v11 removeTarget:0 action:0 forControlEvents:64];

  double v12 = [(TFBetaAppLaunchScreenView *)self secondaryButton];
  [v12 addTarget:v8 action:a5 forControlEvents:64];

  [(TFBetaAppLaunchScreenView *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TFBetaAppLaunchScreenView;
  [(TFBetaAppLaunchScreenView *)&v5 traitCollectionDidChange:a3];
  id v4 = [(TFBetaAppLaunchScreenView *)self traitCollection];
  [(TFBetaAppLaunchScreenView *)self _prepareForDisplayWithTraitCollection:v4];

  [(TFBetaAppLaunchScreenView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)TFBetaAppLaunchScreenView;
  [(TFBetaAppLaunchScreenView *)&v6 layoutSubviews];
  double v3 = [(TFBetaAppLaunchScreenView *)self specification];
  [(TFBetaAppLaunchScreenView *)self _layoutButtonModuleWithLayoutMetrics:v3];

  id v4 = [(TFBetaAppLaunchScreenView *)self specification];
  objc_super v5 = [(TFBetaAppLaunchScreenView *)self buttonBackgroundEffectView];
  [(TFBetaAppLaunchScreenView *)self _layoutScrollViewWithLayoutMetrics:v4 accomodatingPinnedBottomView:v5];
}

- (void)_prepareForDisplayWithTraitCollection:(id)a3
{
  id v4 = [TFBetaAppLaunchScreenViewSpecification alloc];
  objc_super v5 = [(TFBetaAppLaunchScreenView *)self traitCollection];
  objc_super v6 = [(TFBetaAppLaunchScreenViewSpecification *)v4 initWithTraitCollection:v5];
  [(TFBetaAppLaunchScreenView *)self setSpecification:v6];

  id v7 = [(TFBetaAppLaunchScreenView *)self titleLabel];
  id v8 = [(TFBetaAppLaunchScreenView *)self specification];
  id v9 = [v8 titleFont];
  [v7 setFont:v9];

  double v10 = [(TFBetaAppLaunchScreenView *)self subtitleLabel];
  id v11 = [(TFBetaAppLaunchScreenView *)self specification];
  double v12 = [v11 subtitleFont];
  [v10 setFont:v12];

  uint64_t v13 = [(TFBetaAppLaunchScreenView *)self bodyTitleLabel];
  uint64_t v14 = [(TFBetaAppLaunchScreenView *)self specification];
  v15 = [v14 bodyTitleFont];
  [v13 setFont:v15];

  id v18 = [(TFBetaAppLaunchScreenView *)self bodyTextLabel];
  uint64_t v16 = [(TFBetaAppLaunchScreenView *)self specification];
  v17 = [v16 bodyTextFont];
  [v18 setFont:v17];
}

- (void)_layoutButtonModuleWithLayoutMetrics:(id)a3
{
  id v4 = a3;
  [(TFBetaAppLaunchScreenView *)self safeAreaInsets];
  objc_super v5 = [(TFBetaAppLaunchScreenView *)self specification];
  [v5 buttonModuleContentLayoutInsets];
  UIEdgeInsetsMax();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [(TFBetaAppLaunchScreenView *)self bounds];
  CGFloat v15 = v9 + v14;
  CGFloat v17 = v7 + v16;
  CGFloat v19 = v18 - (v9 + v13);
  CGFloat v21 = v20 - (v7 + v11);
  uint64_t v22 = [(TFBetaAppLaunchScreenView *)self secondaryButton];
  objc_msgSend(v22, "sizeThatFits:", v19, v21);
  double v24 = v23;

  v47.origin.x = v15;
  v47.origin.y = v17;
  v47.size.width = v19;
  v47.size.height = v21;
  double MinX = CGRectGetMinX(v47);
  v48.origin.x = v15;
  v48.origin.y = v17;
  v48.size.width = v19;
  v48.size.height = v21;
  double v26 = MinX + (CGRectGetWidth(v48) - v24) * 0.5;
  v49.origin.x = v15;
  v49.origin.y = v17;
  v49.size.width = v19;
  v49.size.height = v21;
  double MaxY = CGRectGetMaxY(v49);
  [v4 buttonHeight];
  double v29 = MaxY - v28;
  v30 = [(TFBetaAppLaunchScreenView *)self secondaryButton];
  [v4 buttonHeight];
  objc_msgSend(v30, "setFrame:", v26, v29, v24, v31);

  v50.origin.x = v15;
  v50.origin.y = v17;
  v50.size.width = v19;
  v50.size.height = v21;
  double v32 = CGRectGetMinX(v50);
  [v4 interButtonPadding];
  double v34 = v29 - v33;
  [v4 buttonHeight];
  double v36 = v34 - v35;
  v51.origin.x = v15;
  v51.origin.y = v17;
  v51.size.width = v19;
  v51.size.height = v21;
  double Width = CGRectGetWidth(v51);
  uint64_t v38 = [(TFBetaAppLaunchScreenView *)self primaryButton];
  [v4 buttonHeight];
  objc_msgSend(v38, "setFrame:", v32, v36, Width, v39);

  [v4 buttonBackgroundTopEdgeToPrimaryButtonTopEdge];
  double v41 = v40;

  double v42 = v36 - v41;
  [(TFBetaAppLaunchScreenView *)self bounds];
  double v43 = CGRectGetWidth(v52);
  [(TFBetaAppLaunchScreenView *)self bounds];
  CGFloat v44 = CGRectGetHeight(v53) - v42;
  id v45 = [(TFBetaAppLaunchScreenView *)self buttonBackgroundEffectView];
  objc_msgSend(v45, "setFrame:", 0.0, v42, v43, v44);
}

- (void)_layoutScrollViewWithLayoutMetrics:(id)a3 accomodatingPinnedBottomView:(id)a4
{
  id v109 = a3;
  id v6 = a4;
  double v7 = [(TFBetaAppLaunchScreenView *)self scrollView];
  [(TFBetaAppLaunchScreenView *)self bounds];
  objc_msgSend(v7, "setFrame:");

  [(TFBetaAppLaunchScreenView *)self safeAreaInsets];
  [v109 scrollViewContentLayoutInsets];
  UIEdgeInsetsMax();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(TFBetaAppLaunchScreenView *)self scrollView];
  [v16 bounds];
  CGFloat v18 = v11 + v17;
  CGFloat v20 = v9 + v19;
  double v22 = v21 - (v11 + v15);
  double v24 = v23 - (v9 + v13);

  v111.origin.x = v18;
  v111.origin.y = v20;
  v111.size.width = v22;
  v111.size.height = v24;
  double MinX = CGRectGetMinX(v111);
  v112.origin.x = v18;
  v112.origin.y = v20;
  v112.size.width = v22;
  v112.size.height = v24;
  double Width = CGRectGetWidth(v112);
  [v109 viewTopMarginAdditionalPaddingAsFractionOfTotalHeight];
  double v28 = v27;
  v113.origin.x = v18;
  v113.origin.y = v20;
  v113.size.width = v22;
  v113.size.height = v24;
  double v29 = v28 * CGRectGetHeight(v113);
  v30 = [(TFBetaAppLaunchScreenView *)self titleLabel];
  objc_msgSend(v30, "sizeThatFits:", v22, v24);
  double v32 = v31;

  v114.origin.x = v18;
  v114.origin.y = v20;
  v114.size.width = v22;
  v114.size.height = v24;
  double v33 = v29 + CGRectGetMinY(v114);
  [v109 viewTopMarginToTitleLabelFirstBaseline];
  double v35 = v33 + v34;
  double v36 = [(TFBetaAppLaunchScreenView *)self titleLabel];
  [v36 _firstBaselineOffsetFromTop];
  double v38 = v35 - v37;

  double v39 = [(TFBetaAppLaunchScreenView *)self titleLabel];
  objc_msgSend(v39, "setFrame:", MinX, v38, Width, v32);

  double v40 = [(TFBetaAppLaunchScreenView *)self titleLabel];
  [v40 frame];
  double MaxY = CGRectGetMaxY(v115);
  uint64_t v42 = [(TFBetaAppLaunchScreenView *)self titleLabel];
  [(id)v42 _baselineOffsetFromBottom];
  double v44 = MaxY - v43;

  id v45 = [(TFBetaAppLaunchScreenView *)self subtitleLabel];
  LOBYTE(v42) = [v45 isHidden];

  if ((v42 & 1) == 0)
  {
    v46 = [(TFBetaAppLaunchScreenView *)self subtitleLabel];
    objc_msgSend(v46, "sizeThatFits:", v22, v24);
    double v48 = v47;

    [v109 titleLabelLastBaselineToSubtitleLabelFirstBaseline];
    double v50 = v44 + v49;
    CGRect v51 = [(TFBetaAppLaunchScreenView *)self subtitleLabel];
    [v51 _firstBaselineOffsetFromTop];
    double v53 = v50 - v52;

    v54 = [(TFBetaAppLaunchScreenView *)self subtitleLabel];
    objc_msgSend(v54, "setFrame:", MinX, v53, Width, v48);

    v55 = [(TFBetaAppLaunchScreenView *)self subtitleLabel];
    [v55 frame];
    double v56 = CGRectGetMaxY(v116);
    v57 = [(TFBetaAppLaunchScreenView *)self subtitleLabel];
    [v57 _baselineOffsetFromBottom];
    double v44 = v56 - v58;
  }
  v59 = [(TFBetaAppLaunchScreenView *)self lockupView];
  char v60 = [v59 isHidden];

  if ((v60 & 1) == 0)
  {
    objc_super v61 = [(TFBetaAppLaunchScreenView *)self lockupView];
    objc_msgSend(v61, "sizeThatFits:", v22, v24);
    double v63 = v62;

    [v109 bottommostLabelLastBaselineToLockupTopEdge];
    double v65 = v44 + v64;
    v66 = [(TFBetaAppLaunchScreenView *)self lockupView];
    objc_msgSend(v66, "setFrame:", MinX, v65, Width, v63);
  }
  v67 = [(TFBetaAppLaunchScreenView *)self bodyTitleLabel];
  char v68 = [v67 isHidden];

  if ((v68 & 1) == 0)
  {
    v69 = [(TFBetaAppLaunchScreenView *)self bodyTitleLabel];
    objc_msgSend(v69, "sizeThatFits:", v22, v24);
    double v71 = v70;

    v72 = [(TFBetaAppLaunchScreenView *)self lockupView];
    [v72 frame];
    double v73 = CGRectGetMaxY(v117);
    [v109 lockupBottomEdgeToBodyTitleLabelFirstBaseline];
    double v75 = v73 + v74;
    v76 = [(TFBetaAppLaunchScreenView *)self bodyTitleLabel];
    [v76 _firstBaselineOffsetFromTop];
    double v78 = v75 - v77;

    v79 = [(TFBetaAppLaunchScreenView *)self bodyTitleLabel];
    objc_msgSend(v79, "setFrame:", MinX, v78, Width, v71);
  }
  v80 = [(TFBetaAppLaunchScreenView *)self bodyTextLabel];
  char v81 = [v80 isHidden];

  if ((v81 & 1) == 0)
  {
    v82 = [(TFBetaAppLaunchScreenView *)self bodyTextLabel];
    objc_msgSend(v82, "sizeThatFits:", v22, v24);
    double v84 = v83;

    v85 = [(TFBetaAppLaunchScreenView *)self bodyTitleLabel];
    [v85 frame];
    double v86 = CGRectGetMaxY(v118);
    [v109 bodyTitleLabelLastBaselineToBodyTextLabelFirstBaseline];
    double v88 = v86 + v87;
    v89 = [(TFBetaAppLaunchScreenView *)self bodyTextLabel];
    [v89 _firstBaselineOffsetFromTop];
    double v91 = v88 - v90;

    v92 = [(TFBetaAppLaunchScreenView *)self bodyTextLabel];
    objc_msgSend(v92, "setFrame:", MinX, v91, Width, v84);
  }
  v93 = [(TFBetaAppLaunchScreenView *)self instructionView];
  char v94 = [v93 isHidden];

  if ((v94 & 1) == 0)
  {
    [v109 bottommostLabelLastBaselineToImageTopEdge];
    double v96 = v44 + v95;
    v97 = [(TFBetaAppLaunchScreenView *)self scrollView];
    [v97 bounds];
    CGFloat v98 = CGRectGetMaxY(v119) - v96;
    [v6 frame];
    CGFloat v99 = v98 - CGRectGetHeight(v120);

    v100 = [(TFBetaAppLaunchScreenView *)self instructionView];
    objc_msgSend(v100, "setFrame:", MinX, v96, Width, v99);
  }
  v101 = [(TFBetaAppLaunchScreenView *)self instructionView];
  if ([v101 isHidden]) {
    [(TFBetaAppLaunchScreenView *)self bodyTextLabel];
  }
  else {
  v102 = [(TFBetaAppLaunchScreenView *)self instructionView];
  }
  [v102 frame];
  double v103 = CGRectGetMaxY(v121);

  [v6 frame];
  if (v103 >= CGRectGetMinY(v122))
  {
    [v6 frame];
    double Height = v103 + CGRectGetHeight(v124);
  }
  else
  {
    v104 = [(TFBetaAppLaunchScreenView *)self scrollView];
    [v104 frame];
    double Height = CGRectGetHeight(v123);
  }
  v106 = [(TFBetaAppLaunchScreenView *)self scrollView];
  [v106 frame];
  double v107 = CGRectGetWidth(v125);

  v108 = [(TFBetaAppLaunchScreenView *)self scrollView];
  objc_msgSend(v108, "setContentSize:", v107, Height);
}

- (TFAppLockupView)lockupView
{
  return self->_lockupView;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)bodyTitleLabel
{
  return self->_bodyTitleLabel;
}

- (UILabel)bodyTextLabel
{
  return self->_bodyTextLabel;
}

- (TFDeviceInstructionView)instructionView
{
  return self->_instructionView;
}

- (UIButton)primaryButton
{
  return self->_primaryButton;
}

- (UIButton)secondaryButton
{
  return self->_secondaryButton;
}

- (UIVisualEffectView)buttonBackgroundEffectView
{
  return self->_buttonBackgroundEffectView;
}

- (UIView)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (TFBetaAppLaunchScreenViewSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundEffectView, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);
  objc_storeStrong((id *)&self->_bodyTextLabel, 0);
  objc_storeStrong((id *)&self->_bodyTitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end