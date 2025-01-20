@interface SFPrivateBrowsingPrivacyProtectionsBanner
- (BOOL)_shouldUseCompactModeLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SFPrivateBrowsingPrivacyProtectionsBanner)init;
- (UILabel)titleLabel;
- (id)_titleLabelFont:(BOOL)a3;
- (id)accessibilityIdentifier;
- (id)dismissButtonHandler;
- (id)reducePrivacyProtectionsActionHandler;
- (void)_createLayoutConstraints;
- (void)_dismiss;
- (void)_reducePrivacyProtections;
- (void)_updateButtonStackViewAxisIfNeeded;
- (void)invalidateBannerLayout;
- (void)layoutSubviews;
- (void)setDismissButtonHandler:(id)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setReducePrivacyProtectionsActionHandler:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)themeDidChange;
- (void)updateConstraintsForLayoutMode;
@end

@implementation SFPrivateBrowsingPrivacyProtectionsBanner

- (SFPrivateBrowsingPrivacyProtectionsBanner)init
{
  v50[2] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)SFPrivateBrowsingPrivacyProtectionsBanner;
  v2 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)&v48 init];
  v3 = v2;
  if (v2)
  {
    [(SFPrivateBrowsingPrivacyProtectionsBanner *)v2 setMaximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
    v4 = [SFThemeColorEffectView alloc];
    v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v6 = [(SFThemeColorEffectView *)v4 initWithEffect:v5];
    backdrop = v3->_backdrop;
    v3->_backdrop = (SFThemeColorEffectView *)v6;

    [(SFThemeColorEffectView *)v3->_backdrop setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFPrivateBrowsingPrivacyProtectionsBanner *)v3 addSubview:v3->_backdrop];
    [(SFPrivateBrowsingPrivacyProtectionsBanner *)v3 sendSubviewToBack:v3->_backdrop];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28DC8], "safari_constraintsMatchingFrameOfView:withFrameOfView:", v3->_backdrop, v3);
    backdropConstraints = v3->_backdropConstraints;
    v3->_backdropConstraints = (NSArray *)v8;

    [MEMORY[0x1E4F28DC8] activateConstraints:v3->_backdropConstraints];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v10;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v12 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)v3 _titleLabelFont:0];
    [(UILabel *)v3->_titleLabel setFont:v12];

    v13 = _WBSLocalizedString();
    [(UILabel *)v3->_titleLabel setText:v13];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v14];

    LODWORD(v15) = 1148846080;
    [(UILabel *)v3->_titleLabel setContentCompressionResistancePriority:1 forAxis:v15];
    LODWORD(v16) = 1144750080;
    [(UILabel *)v3->_titleLabel setContentHuggingPriority:1 forAxis:v16];
    [(SFPrivateBrowsingPrivacyProtectionsBanner *)v3 addSubview:v3->_titleLabel];
    uint64_t v17 = +[_SFDimmingButton buttonWithType:1];
    dismissButton = v3->_dismissButton;
    v3->_dismissButton = (_SFDimmingButton *)v17;

    [(_SFDimmingButton *)v3->_dismissButton setAccessibilityIdentifier:@"DismissBannerButton"];
    v19 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)v3 _titleLabelFont:1];
    v20 = [(_SFDimmingButton *)v3->_dismissButton titleLabel];
    [v20 setFont:v19];

    v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(_SFDimmingButton *)v3->_dismissButton setTintColor:v21];

    v22 = [MEMORY[0x1E4FB1618] systemGray5Color];
    [(_SFDimmingButton *)v3->_dismissButton setDimmableBackgroundColor:v22];

    v23 = [(_SFDimmingButton *)v3->_dismissButton titleLabel];
    [v23 setLineBreakMode:0];

    v24 = [(_SFDimmingButton *)v3->_dismissButton titleLabel];
    [v24 setTextAlignment:1];

    v25 = [(_SFDimmingButton *)v3->_dismissButton titleLabel];
    [v25 setAdjustsFontForContentSizeCategory:1];

    [(_SFDimmingButton *)v3->_dismissButton setTapTargetSideMargin:&unk_1EDA42528];
    [(_SFDimmingButton *)v3->_dismissButton _setCornerRadius:13.5];
    -[_SFDimmingButton setContentEdgeInsets:](v3->_dismissButton, "setContentEdgeInsets:", 5.0, 13.0, 5.0, 13.0);
    [(_SFDimmingButton *)v3->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = v3->_dismissButton;
    v27 = _WBSLocalizedString();
    [(_SFDimmingButton *)v26 setTitle:v27 forState:0];

    [(_SFDimmingButton *)v3->_dismissButton addTarget:v3 action:sel__dismiss forControlEvents:64];
    LODWORD(v28) = 1148846080;
    [(_SFDimmingButton *)v3->_dismissButton setContentCompressionResistancePriority:1 forAxis:v28];
    uint64_t v29 = +[_SFDimmingButton buttonWithType:1];
    reducePrivacyProtectionsButton = v3->_reducePrivacyProtectionsButton;
    v3->_reducePrivacyProtectionsButton = (_SFDimmingButton *)v29;

    [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton setAccessibilityIdentifier:@"ReducePrivacyProtectionsButton"];
    v31 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)v3 _titleLabelFont:1];
    v32 = [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton titleLabel];
    [v32 setFont:v31];

    v33 = [MEMORY[0x1E4FB1618] labelColor];
    [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton setTintColor:v33];

    v34 = [MEMORY[0x1E4FB1618] systemGray5Color];
    [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton setDimmableBackgroundColor:v34];

    v35 = [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton titleLabel];
    [v35 setLineBreakMode:0];

    v36 = [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton titleLabel];
    [v36 setTextAlignment:1];

    v37 = [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton titleLabel];
    [v37 setAdjustsFontForContentSizeCategory:1];

    [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton setTapTargetSideMargin:&unk_1EDA42528];
    [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton _setCornerRadius:13.5];
    -[_SFDimmingButton setContentEdgeInsets:](v3->_reducePrivacyProtectionsButton, "setContentEdgeInsets:", 5.0, 13.0, 5.0, 13.0);
    [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton addTarget:v3 action:sel__reducePrivacyProtections forControlEvents:64];
    LODWORD(v38) = 1148846080;
    [(_SFDimmingButton *)v3->_reducePrivacyProtectionsButton setContentCompressionResistancePriority:1 forAxis:v38];
    id v39 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v50[0] = v3->_dismissButton;
    v50[1] = v3->_reducePrivacyProtectionsButton;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    uint64_t v41 = [v39 initWithArrangedSubviews:v40];
    buttonStackView = v3->_buttonStackView;
    v3->_buttonStackView = (UIStackView *)v41;

    [(UIStackView *)v3->_buttonStackView setAxis:0];
    [(UIStackView *)v3->_buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_buttonStackView setSpacing:8.0];
    LODWORD(v43) = 1148846080;
    [(UIStackView *)v3->_buttonStackView setContentCompressionResistancePriority:0 forAxis:v43];
    [(SFPrivateBrowsingPrivacyProtectionsBanner *)v3 addSubview:v3->_buttonStackView];
    [(SFPrivateBrowsingPrivacyProtectionsBanner *)v3 _createLayoutConstraints];
    [(SFPrivateBrowsingPrivacyProtectionsBanner *)v3 updateConstraintsForLayoutMode];
    uint64_t v49 = objc_opt_class();
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    id v45 = (id)[(SFPrivateBrowsingPrivacyProtectionsBanner *)v3 registerForTraitChanges:v44 withAction:sel_updateConstraintsForLayoutMode];

    v46 = v3;
  }

  return v3;
}

- (BOOL)_shouldUseCompactModeLayout
{
  v2 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self traitCollection];
  if ([v2 horizontalSizeClass] == 1) {
    LOBYTE(v3) = 1;
  }
  else {
    int v3 = _SFDeviceIsPad() ^ 1;
  }

  return v3;
}

- (void)_createLayoutConstraints
{
  v56[6] = *MEMORY[0x1E4F143B8];
  int v3 = [(UILabel *)self->_titleLabel topAnchor];
  v4 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self topAnchor];
  v5 = [v3 constraintEqualToAnchor:v4 constant:9.0];
  titleTopConstraint = self->_titleTopConstraint;
  self->_titleTopConstraint = v5;

  [(NSLayoutConstraint *)self->_titleTopConstraint setActive:1];
  v7 = [(UIStackView *)self->_buttonStackView widthAnchor];
  [(UILabel *)self->_titleLabel frame];
  v9 = [v7 constraintEqualToConstant:v8];
  compactModeButtonStackViewWidthConstraint = self->_compactModeButtonStackViewWidthConstraint;
  self->_compactModeButtonStackViewWidthConstraint = v9;

  v56[0] = self->_compactModeButtonStackViewWidthConstraint;
  v51 = [(UILabel *)self->_titleLabel leadingAnchor];
  v53 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self layoutMarginsGuide];
  uint64_t v49 = [v53 leadingAnchor];
  v47 = [v51 constraintEqualToAnchor:v49];
  v56[1] = v47;
  id v45 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self layoutMarginsGuide];
  double v43 = [v45 trailingAnchor];
  uint64_t v41 = [(UILabel *)self->_titleLabel trailingAnchor];
  id v39 = [v43 constraintEqualToAnchor:v41];
  v56[2] = v39;
  v37 = [(UIStackView *)self->_buttonStackView topAnchor];
  v11 = [(UILabel *)self->_titleLabel bottomAnchor];
  v12 = [v37 constraintEqualToAnchor:v11 constant:8.0];
  v56[3] = v12;
  v13 = [(UIStackView *)self->_buttonStackView centerXAnchor];
  v14 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self centerXAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  v56[4] = v15;
  double v16 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self bottomAnchor];
  uint64_t v17 = [(UIStackView *)self->_buttonStackView bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:9.0];
  v56[5] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:6];
  compactModeConstraints = self->_compactModeConstraints;
  self->_compactModeConstraints = v19;

  v54 = [(UILabel *)self->_titleLabel leadingAnchor];
  v52 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self leadingAnchor];
  v50 = [v54 constraintEqualToAnchor:v52 constant:20.0];
  v55[0] = v50;
  objc_super v48 = [(UIStackView *)self->_buttonStackView leadingAnchor];
  v46 = [(UILabel *)self->_titleLabel trailingAnchor];
  v44 = [v48 constraintEqualToAnchor:v46 constant:16.0];
  v55[1] = v44;
  v42 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self bottomAnchor];
  v40 = [(UILabel *)self->_titleLabel bottomAnchor];
  double v38 = [v42 constraintEqualToAnchor:v40 constant:9.0];
  v55[2] = v38;
  v36 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self trailingAnchor];
  v35 = [(UIStackView *)self->_buttonStackView trailingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:20.0];
  v55[3] = v34;
  v33 = [(UIStackView *)self->_buttonStackView centerYAnchor];
  v32 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self centerYAnchor];
  v21 = [v33 constraintEqualToAnchor:v32];
  v55[4] = v21;
  v22 = [(UIStackView *)self->_buttonStackView topAnchor];
  v23 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self safeAreaLayoutGuide];
  v24 = [v23 topAnchor];
  v25 = [v22 constraintGreaterThanOrEqualToAnchor:v24 constant:10.0];
  v55[5] = v25;
  v26 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self safeAreaLayoutGuide];
  v27 = [v26 bottomAnchor];
  double v28 = [(UIStackView *)self->_buttonStackView bottomAnchor];
  uint64_t v29 = [v27 constraintGreaterThanOrEqualToAnchor:v28 constant:10.0];
  v55[6] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:7];
  regularModeConstraints = self->_regularModeConstraints;
  self->_regularModeConstraints = v30;
}

- (void)updateConstraintsForLayoutMode
{
  BOOL v3 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self _shouldUseCompactModeLayout];
  titleLabel = self->_titleLabel;
  if (v3)
  {
    uint64_t v5 = 1;
    [(UILabel *)titleLabel setTextAlignment:1];
    reducePrivacyProtectionsButton = self->_reducePrivacyProtectionsButton;
    v7 = _WBSLocalizedString();
    [(_SFDimmingButton *)reducePrivacyProtectionsButton setTitle:v7 forState:0];
    double v8 = &OBJC_IVAR___SFPrivateBrowsingPrivacyProtectionsBanner__compactModeConstraints;
    v9 = &OBJC_IVAR___SFPrivateBrowsingPrivacyProtectionsBanner__regularModeConstraints;
  }
  else
  {
    [(UILabel *)titleLabel setTextAlignment:4];
    v10 = self->_reducePrivacyProtectionsButton;
    v7 = _WBSLocalizedString();
    [(_SFDimmingButton *)v10 setTitle:v7 forState:0];
    double v8 = &OBJC_IVAR___SFPrivateBrowsingPrivacyProtectionsBanner__regularModeConstraints;
    uint64_t v5 = 2;
    v9 = &OBJC_IVAR___SFPrivateBrowsingPrivacyProtectionsBanner__compactModeConstraints;
  }

  [(UIStackView *)self->_buttonStackView setDistribution:v5];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v9)];
  v11 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v12 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v8);

  [v11 activateConstraints:v12];
}

- (id)_titleLabelFont:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  uint64_t v5 = v4;
  if (v3) {
    uint64_t v6 = 32770;
  }
  else {
    uint64_t v6 = 0x8000;
  }
  v7 = [v4 fontDescriptor];
  double v8 = [v7 fontDescriptorWithSymbolicTraits:v6];

  v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SFPrivateBrowsingPrivacyProtectionsBanner systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_reducePrivacyProtections
{
  reducePrivacyProtectionsActionHandler = (void (**)(id, SFPrivateBrowsingPrivacyProtectionsBanner *))self->_reducePrivacyProtectionsActionHandler;
  if (reducePrivacyProtectionsActionHandler) {
    reducePrivacyProtectionsActionHandler[2](reducePrivacyProtectionsActionHandler, self);
  }
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  if (a3.left == 0.0) {
    a3.left = 20.0;
  }
  if (a3.right == 0.0) {
    a3.right = 20.0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SFPrivateBrowsingPrivacyProtectionsBanner;
  -[SFPrivateBrowsingPrivacyProtectionsBanner setLayoutMargins:](&v3, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SFPrivateBrowsingPrivacyProtectionsBanner;
  [(SFPrivateBrowsingPrivacyProtectionsBanner *)&v18 layoutSubviews];
  [(UILabel *)self->_titleLabel bounds];
  double Height = CGRectGetHeight(v19);
  double v4 = _SFRoundFloatToPixels(Height);
  double v5 = [(UILabel *)self->_titleLabel font];
  [v5 lineHeight];
  double v7 = _SFRoundFloatToPixels(v6);

  double v8 = 9.0;
  if (v4 > v7) {
    double v8 = 8.0;
  }
  [(NSLayoutConstraint *)self->_titleTopConstraint setConstant:v8];
  if ([(SFPrivateBrowsingPrivacyProtectionsBanner *)self _shouldUseCompactModeLayout])
  {
    [(UILabel *)self->_titleLabel frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [(UILabel *)self->_titleLabel sizeToFit];
    [(UILabel *)self->_titleLabel frame];
    [(NSLayoutConstraint *)self->_compactModeButtonStackViewWidthConstraint setConstant:v17];
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v10, v12, v14, v16);
    [(SFPrivateBrowsingPrivacyProtectionsBanner *)self _updateButtonStackViewAxisIfNeeded];
  }
  else
  {
    [(UIStackView *)self->_buttonStackView setAxis:0];
  }
}

- (void)_updateButtonStackViewAxisIfNeeded
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v4 = [(_SFDimmingButton *)self->_reducePrivacyProtectionsButton titleLabel];
  double v5 = [v4 text];
  uint64_t v32 = *MEMORY[0x1E4FB06F8];
  uint64_t v6 = v32;
  double v7 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self _titleLabelFont:1];
  v33[0] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
  CFAttributedStringRef v9 = (const __CFAttributedString *)[v3 initWithString:v5 attributes:v8];

  double v10 = CTLineCreateWithAttributedString(v9);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v10, 0);
  double width = BoundsWithOptions.size.width;
  CFRelease(v10);
  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v13 = [(_SFDimmingButton *)self->_dismissButton titleLabel];
  double v14 = [v13 text];
  uint64_t v30 = v6;
  double v15 = [(SFPrivateBrowsingPrivacyProtectionsBanner *)self _titleLabelFont:1];
  v31 = v15;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  CFAttributedStringRef v17 = (const __CFAttributedString *)[v12 initWithString:v14 attributes:v16];

  objc_super v18 = CTLineCreateWithAttributedString(v17);
  CGRect v35 = CTLineGetBoundsWithOptions(v18, 0);
  double v19 = v35.size.width;
  CFRelease(v18);
  [(UIStackView *)self->_buttonStackView frame];
  uint64_t v20 = 0;
  double v22 = (v21 + -8.0 + -52.0) * 0.5;
  if (width <= v22 && v19 <= v22) {
    goto LABEL_9;
  }
  [(_SFDimmingButton *)self->_reducePrivacyProtectionsButton frame];
  double v25 = v24;
  [(_SFDimmingButton *)self->_reducePrivacyProtectionsButton intrinsicContentSize];
  if (v25 <= v26
    || ([(_SFDimmingButton *)self->_dismissButton frame],
        double v28 = v27,
        [(_SFDimmingButton *)self->_dismissButton intrinsicContentSize],
        v28 <= v29))
  {
    uint64_t v20 = 1;
LABEL_9:
    [(UIStackView *)self->_buttonStackView setAxis:v20];
  }
  [(SFPrivateBrowsingPrivacyProtectionsBanner *)self sizeToFit];
}

- (void)invalidateBannerLayout
{
}

- (void)themeDidChange
{
  id v10 = [(SFPinnableBanner *)self theme];
  [(SFThemeColorEffectView *)self->_backdrop setTheme:v10];
  id v3 = [v10 overrideTintColor];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
    p_reducePrivacyProtectionsButton = &self->_reducePrivacyProtectionsButton;
    [(_SFDimmingButton *)self->_reducePrivacyProtectionsButton setDimmableBackgroundColor:v5];
    double v7 = [v10 themeColor];
    uint64_t v8 = 1;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] systemGray5Color];
    p_reducePrivacyProtectionsButton = &self->_reducePrivacyProtectionsButton;
    [(_SFDimmingButton *)self->_reducePrivacyProtectionsButton setDimmableBackgroundColor:v5];
    double v7 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v8 = 0;
  }
  [(_SFDimmingButton *)*p_reducePrivacyProtectionsButton setTintColor:v7];

  [(_SFDimmingButton *)*p_reducePrivacyProtectionsButton setTintAdjustmentMode:v8];
  [(_SFDimmingButton *)self->_dismissButton setDimmableBackgroundColor:v5];
  if (v4) {
    [v10 themeColor];
  }
  else {
  CFAttributedStringRef v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [(_SFDimmingButton *)self->_dismissButton setTintColor:v9];

  [(_SFDimmingButton *)self->_dismissButton setTintAdjustmentMode:v8];
}

- (void)_dismiss
{
  dismissButtonHandler = (void (**)(id, SFPrivateBrowsingPrivacyProtectionsBanner *))self->_dismissButtonHandler;
  if (dismissButtonHandler) {
    dismissButtonHandler[2](dismissButtonHandler, self);
  }
}

- (id)accessibilityIdentifier
{
  return @"PrivacyProtectionsBanner";
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (id)reducePrivacyProtectionsActionHandler
{
  return self->_reducePrivacyProtectionsActionHandler;
}

- (void)setReducePrivacyProtectionsActionHandler:(id)a3
{
}

- (id)dismissButtonHandler
{
  return self->_dismissButtonHandler;
}

- (void)setDismissButtonHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissButtonHandler, 0);
  objc_storeStrong(&self->_reducePrivacyProtectionsActionHandler, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_regularModeConstraints, 0);
  objc_storeStrong((id *)&self->_compactModeConstraints, 0);
  objc_storeStrong((id *)&self->_compactModeButtonStackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_reducePrivacyProtectionsButton, 0);
  objc_storeStrong((id *)&self->_titleTopConstraint, 0);
  objc_storeStrong((id *)&self->_backdropConstraints, 0);

  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end