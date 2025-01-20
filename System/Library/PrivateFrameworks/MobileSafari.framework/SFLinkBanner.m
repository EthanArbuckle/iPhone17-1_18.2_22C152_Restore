@interface SFLinkBanner
+ (double)iconHeight;
- (BOOL)shouldHideIcon;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)messageLabelText;
- (NSString)openButtonTitle;
- (SFLinkBanner)init;
- (UIColor)preferredButtonBackgroundColor;
- (UIColor)preferredButtonTintColor;
- (UIImageView)icon;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (_SFDimmingButton)openButton;
- (double)backdropTopExtension;
- (id)_messageLabelFont;
- (id)_titleLabelFont;
- (id)dismissButtonHandler;
- (id)openActionHandler;
- (void)_dismiss;
- (void)_open;
- (void)_setShowsDismissButton:(BOOL)a3;
- (void)contentSizeCategoryDidChange;
- (void)invalidateBannerLayout;
- (void)layoutSubviews;
- (void)setBackdropTopExtension:(double)a3;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setDismissButtonHandler:(id)a3;
- (void)setIcon:(id)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setMessageLabel:(id)a3;
- (void)setMessageLabelText:(id)a3;
- (void)setOpenActionHandler:(id)a3;
- (void)setOpenButton:(id)a3;
- (void)setOpenButtonTitle:(id)a3;
- (void)setShouldHideIcon:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)themeDidChange;
@end

@implementation SFLinkBanner

+ (double)iconHeight
{
  +[SFClipLink iconHeight];
  return result;
}

- (SFLinkBanner)init
{
  v90[4] = *MEMORY[0x1E4F143B8];
  v86.receiver = self;
  v86.super_class = (Class)SFLinkBanner;
  v2 = [(SFLinkBanner *)&v86 init];
  if (v2)
  {
    v3 = [SFThemeColorEffectView alloc];
    v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v5 = [(SFThemeColorEffectView *)v3 initWithEffect:v4];
    backdrop = v2->_backdrop;
    v2->_backdrop = (SFThemeColorEffectView *)v5;

    [(SFThemeColorEffectView *)v2->_backdrop setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFLinkBanner *)v2 addSubview:v2->_backdrop];
    [(SFLinkBanner *)v2 sendSubviewToBack:v2->_backdrop];
    v7 = [(SFLinkBanner *)v2 topAnchor];
    v8 = [(SFThemeColorEffectView *)v2->_backdrop topAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8];
    backdropTopConstraint = v2->_backdropTopConstraint;
    v2->_backdropTopConstraint = (NSLayoutConstraint *)v9;

    v90[0] = v2->_backdropTopConstraint;
    v84 = [(SFLinkBanner *)v2 bottomAnchor];
    v11 = [(SFThemeColorEffectView *)v2->_backdrop bottomAnchor];
    v12 = [v84 constraintEqualToAnchor:v11];
    v90[1] = v12;
    v13 = [(SFLinkBanner *)v2 leadingAnchor];
    v14 = [(SFThemeColorEffectView *)v2->_backdrop leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v90[2] = v15;
    v16 = [(SFLinkBanner *)v2 trailingAnchor];
    v17 = [(SFThemeColorEffectView *)v2->_backdrop trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v90[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:4];
    [(SFLinkBanner *)v2 addConstraints:v19];

    v20 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    icon = v2->_icon;
    v2->_icon = v20;

    [(UIImageView *)v2->_icon setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v2->_icon setAccessibilityIgnoresInvertColors:1];
    [(UIImageView *)v2->_icon setContentMode:1];
    [(SFLinkBanner *)v2 addSubview:v2->_icon];
    v22 = [(SFLinkBanner *)v2 layoutMarginsGuide];
    v85 = [v22 leadingAnchor];

    v23 = [(UIImageView *)v2->_icon leadingAnchor];
    uint64_t v24 = [v23 constraintEqualToAnchor:v85];
    iconLeadingConstraintToSuperview = v2->_iconLeadingConstraintToSuperview;
    v2->_iconLeadingConstraintToSuperview = (NSLayoutConstraint *)v24;

    v82 = (void *)MEMORY[0x1E4F28DC8];
    v83 = [(UIImageView *)v2->_icon heightAnchor];
    [(id)objc_opt_class() iconHeight];
    v26 = objc_msgSend(v83, "constraintEqualToConstant:");
    v89[0] = v26;
    v27 = [(UIImageView *)v2->_icon widthAnchor];
    v28 = [(UIImageView *)v2->_icon heightAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v89[1] = v29;
    v89[2] = v2->_iconLeadingConstraintToSuperview;
    v30 = [(UIImageView *)v2->_icon centerYAnchor];
    v31 = [(SFLinkBanner *)v2 centerYAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    v89[3] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:4];
    [v82 activateConstraints:v33];

    v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v34;

    [(UILabel *)v2->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v2->_titleLabel setNumberOfLines:3];
    v36 = [(SFLinkBanner *)v2 _titleLabelFont];
    [(UILabel *)v2->_titleLabel setFont:v36];

    [(SFLinkBanner *)v2 addSubview:v2->_titleLabel];
    v37 = [(UILabel *)v2->_titleLabel leadingAnchor];
    v38 = [(UIImageView *)v2->_icon trailingAnchor];
    uint64_t v39 = [v37 constraintEqualToAnchor:v38 constant:8.0];
    titleLeadingConstraint = v2->_titleLeadingConstraint;
    v2->_titleLeadingConstraint = (NSLayoutConstraint *)v39;

    v41 = [(UILabel *)v2->_titleLabel leadingAnchor];
    v42 = [v41 constraintEqualToAnchor:v85];

    LODWORD(v43) = 1144733696;
    [v42 setPriority:v43];
    v44 = [(UILabel *)v2->_titleLabel topAnchor];
    v45 = [(SFLinkBanner *)v2 topAnchor];
    uint64_t v46 = [v44 constraintEqualToAnchor:v45 constant:9.0];
    titleTopConstraint = v2->_titleTopConstraint;
    v2->_titleTopConstraint = (NSLayoutConstraint *)v46;

    v48 = (void *)MEMORY[0x1E4F28DC8];
    v88[0] = v2->_titleTopConstraint;
    v88[1] = v2->_titleLeadingConstraint;
    v88[2] = v42;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
    [v48 activateConstraints:v49];

    LODWORD(v50) = 1144733696;
    [(UILabel *)v2->_titleLabel setContentCompressionResistancePriority:0 forAxis:v50];
    v51 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    messageLabel = v2->_messageLabel;
    v2->_messageLabel = v51;

    [(UILabel *)v2->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v2->_messageLabel setNumberOfLines:3];
    v53 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v2->_messageLabel setTextColor:v53];

    [(SFLinkBanner *)v2 addSubview:v2->_messageLabel];
    v54 = [(UILabel *)v2->_messageLabel topAnchor];
    v55 = [(UILabel *)v2->_titleLabel lastBaselineAnchor];
    uint64_t v56 = [v54 constraintEqualToAnchor:v55 constant:2.0];
    messageTopConstraint = v2->_messageTopConstraint;
    v2->_messageTopConstraint = (NSLayoutConstraint *)v56;

    v58 = [(SFLinkBanner *)v2 bottomAnchor];
    v59 = [(UILabel *)v2->_messageLabel bottomAnchor];
    uint64_t v60 = [v58 constraintEqualToAnchor:v59 constant:9.0];
    messageBottomConstraint = v2->_messageBottomConstraint;
    v2->_messageBottomConstraint = (NSLayoutConstraint *)v60;

    v62 = (void *)MEMORY[0x1E4F28DC8];
    v87[0] = v2->_messageTopConstraint;
    v63 = [(UILabel *)v2->_messageLabel leadingAnchor];
    v64 = [(UILabel *)v2->_titleLabel leadingAnchor];
    v65 = [v63 constraintEqualToAnchor:v64];
    v87[1] = v65;
    v87[2] = v2->_messageBottomConstraint;
    v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
    [v62 activateConstraints:v66];

    LODWORD(v67) = 1132068864;
    [(UILabel *)v2->_messageLabel setContentCompressionResistancePriority:0 forAxis:v67];
    uint64_t v68 = +[_SFDimmingButton buttonWithType:1];
    openButton = v2->_openButton;
    v2->_openButton = (_SFDimmingButton *)v68;

    [(_SFDimmingButton *)v2->_openButton setTapTargetSideMargin:&unk_1EDA422A0];
    v70 = [(SFLinkBanner *)v2 preferredButtonTintColor];
    [(_SFDimmingButton *)v2->_openButton setTintColor:v70];

    v71 = [(SFLinkBanner *)v2 preferredButtonBackgroundColor];
    [(_SFDimmingButton *)v2->_openButton setDimmableBackgroundColor:v71];

    -[_SFDimmingButton setContentEdgeInsets:](v2->_openButton, "setContentEdgeInsets:", 5.0, 13.0, 5.0, 13.0);
    v72 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:1024 maximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
    v73 = [(_SFDimmingButton *)v2->_openButton titleLabel];
    [v73 setFont:v72];

    [(_SFDimmingButton *)v2->_openButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_SFDimmingButton *)v2->_openButton _setCornerRadius:13.5];
    LODWORD(v74) = 1144733696;
    [(_SFDimmingButton *)v2->_openButton setContentHuggingPriority:0 forAxis:v74];
    LODWORD(v75) = 1144733696;
    [(_SFDimmingButton *)v2->_openButton setContentCompressionResistancePriority:0 forAxis:v75];
    [(_SFDimmingButton *)v2->_openButton addTarget:v2 action:sel__open forControlEvents:64];
    [(SFLinkBanner *)v2 addSubview:v2->_openButton];
    v76 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_openButton attribute:6 relatedBy:0 toItem:v2 attribute:18 multiplier:1.0 constant:0.0];
    [(SFLinkBanner *)v2 addConstraint:v76];

    v77 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_openButton attribute:5 relatedBy:1 toItem:v2->_titleLabel attribute:6 multiplier:1.0 constant:12.0];
    [(SFLinkBanner *)v2 addConstraint:v77];

    v78 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_openButton attribute:10 relatedBy:0 toItem:v2 attribute:10 multiplier:1.0 constant:0.0];
    [(SFLinkBanner *)v2 addConstraint:v78];

    v79 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_messageLabel attribute:6 relatedBy:0 toItem:v2->_openButton attribute:5 multiplier:1.0 constant:-12.0];
    [(SFLinkBanner *)v2 addConstraint:v79];

    v80 = v2;
  }

  return v2;
}

- (id)_titleLabelFont
{
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] maximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
  v3 = [v2 fontDescriptor];
  v4 = [v3 fontDescriptorWithSymbolicTraits:32770];

  uint64_t v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (id)_messageLabelFont
{
  v2 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] variant:0 maximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
  v3 = [v2 fontDescriptor];
  v4 = [v3 fontDescriptorWithSymbolicTraits:0x8000];

  uint64_t v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (NSString)messageLabelText
{
  return [(UILabel *)self->_messageLabel text];
}

- (void)setMessageLabelText:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4FB0848];
  id v5 = a3;
  v6 = [v4 defaultParagraphStyle];
  v7 = (void *)[v6 mutableCopy];

  [v7 setLineSpacing:1.5];
  [v7 setLineBreakMode:4];
  id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
  v12[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v9 = [(SFLinkBanner *)self _messageLabelFont];
  v12[1] = *MEMORY[0x1E4FB0738];
  v13[0] = v9;
  v13[1] = v7;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11 = (void *)[v8 initWithString:v5 attributes:v10];

  [(UILabel *)self->_messageLabel setAttributedText:v11];
}

- (void)setOpenButtonTitle:(id)a3
{
  v4 = (NSString *)[a3 copy];
  openButtonTitle = self->_openButtonTitle;
  self->_openButtonTitle = v4;

  id v6 = [(SFLinkBanner *)self openButton];
  [v6 setTitle:self->_openButtonTitle forState:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SFLinkBanner systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_open
{
  openActionHandler = (void (**)(id, SFLinkBanner *))self->_openActionHandler;
  if (openActionHandler) {
    openActionHandler[2](openActionHandler, self);
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
  v3.super_class = (Class)SFLinkBanner;
  -[SFLinkBanner setLayoutMargins:](&v3, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  if (a3.leading == 0.0) {
    a3.leading = 20.0;
  }
  if (a3.trailing == 0.0) {
    a3.trailing = 20.0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SFLinkBanner;
  -[SFLinkBanner setDirectionalLayoutMargins:](&v3, sel_setDirectionalLayoutMargins_, a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SFLinkBanner;
  [(SFLinkBanner *)&v14 layoutSubviews];
  [(_SFDimmingButton *)self->_openButton bounds];
  [(_SFDimmingButton *)self->_openButton _setCornerRadius:CGRectGetHeight(v15) * 0.482142857];
  [(UILabel *)self->_titleLabel bounds];
  float Height = CGRectGetHeight(v16);
  int64_t v4 = llroundf(Height);
  double v5 = [(UILabel *)self->_titleLabel font];
  [v5 lineHeight];
  *(float *)&double v6 = v6;
  if (v4 <= (uint64_t)llroundf(*(float *)&v6))
  {
    [(UILabel *)self->_messageLabel bounds];
    float v7 = CGRectGetHeight(v17);
    int64_t v8 = llroundf(v7);
    uint64_t v9 = [(UILabel *)self->_messageLabel font];
    [v9 lineHeight];
    *(float *)&double v10 = v10;
    int64_t v11 = llroundf(*(float *)&v10);

    if (v8 <= v11)
    {
      double v12 = 9.0;
      double v13 = 2.0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v12 = 8.0;
  double v13 = 4.0;
LABEL_6:
  [(NSLayoutConstraint *)self->_titleTopConstraint setConstant:v12];
  [(NSLayoutConstraint *)self->_messageBottomConstraint setConstant:v12];
  [(NSLayoutConstraint *)self->_messageTopConstraint setConstant:v13];
}

- (void)contentSizeCategoryDidChange
{
  objc_super v3 = [(SFLinkBanner *)self _titleLabelFont];
  [(UILabel *)self->_titleLabel setFont:v3];

  int64_t v4 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:1024 maximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
  double v5 = [(_SFDimmingButton *)self->_openButton titleLabel];
  [v5 setFont:v4];

  id v7 = [(UILabel *)self->_messageLabel attributedText];
  double v6 = [v7 string];
  [(SFLinkBanner *)self setMessageLabelText:v6];
}

- (void)invalidateBannerLayout
{
  [(UILabel *)self->_titleLabel invalidateIntrinsicContentSize];
  messageLabel = self->_messageLabel;

  [(UILabel *)messageLabel invalidateIntrinsicContentSize];
}

- (void)themeDidChange
{
  id v7 = [(SFPinnableBanner *)self theme];
  [(SFThemeColorEffectView *)self->_backdrop setTheme:v7];
  objc_super v3 = [v7 overrideTintColor];
  if (v3)
  {
    p_openButton = &self->_openButton;
    [(_SFDimmingButton *)self->_openButton setDimmableBackgroundColor:v3];
    [v7 themeColor];
  }
  else
  {
    double v5 = [(SFLinkBanner *)self preferredButtonBackgroundColor];
    p_openButton = &self->_openButton;
    [(_SFDimmingButton *)self->_openButton setDimmableBackgroundColor:v5];

    [(SFLinkBanner *)self preferredButtonTintColor];
  double v6 = };
  [(_SFDimmingButton *)*p_openButton setTintColor:v6];

  [(_SFDimmingButton *)*p_openButton setTintAdjustmentMode:v3 != 0];
}

- (void)setShouldHideIcon:(BOOL)a3
{
  if (self->_shouldHideIcon != a3)
  {
    BOOL v3 = a3;
    self->_shouldHideIcon = a3;
    -[UIImageView setHidden:](self->_icon, "setHidden:");
    titleLeadingConstraint = self->_titleLeadingConstraint;
    [(NSLayoutConstraint *)titleLeadingConstraint setActive:!v3];
  }
}

- (UIColor)preferredButtonBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] systemBlueColor];
}

- (UIColor)preferredButtonTintColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] whiteColor];
}

- (void)setDismissButtonHandler:(id)a3
{
  BOOL v4 = a3 != 0;
  id v5 = a3;
  [(SFLinkBanner *)self _setShowsDismissButton:v4];
  double v6 = _Block_copy(v5);

  id dismissButtonHandler = self->_dismissButtonHandler;
  self->_id dismissButtonHandler = v6;
}

- (void)_setShowsDismissButton:(BOOL)a3
{
  v33[5] = *MEMORY[0x1E4F143B8];
  dismissButton = self->_dismissButton;
  if ((((dismissButton == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      uint64_t v30 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
      v29 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark" withConfiguration:v30];
      id v5 = [MEMORY[0x1E4FB14D0] systemButtonWithImage:v29 target:self action:sel__dismiss];
      double v6 = self->_dismissButton;
      self->_dismissButton = v5;

      id v7 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [(UIButton *)self->_dismissButton setTintColor:v7];

      [(UIButton *)self->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(SFLinkBanner *)self addSubview:self->_dismissButton];
      v22 = (void *)MEMORY[0x1E4F28DC8];
      v28 = [(UIButton *)self->_dismissButton widthAnchor];
      v27 = [v28 constraintEqualToConstant:28.0];
      v33[0] = v27;
      v26 = [(UIButton *)self->_dismissButton heightAnchor];
      v25 = [v26 constraintEqualToConstant:28.0];
      v33[1] = v25;
      v23 = [(UIButton *)self->_dismissButton leadingAnchor];
      uint64_t v24 = [(SFLinkBanner *)self layoutMarginsGuide];
      int64_t v8 = [v24 leadingAnchor];
      uint64_t v9 = [v23 constraintEqualToAnchor:v8];
      v33[2] = v9;
      double v10 = [(UIImageView *)self->_icon leadingAnchor];
      int64_t v11 = [(UIButton *)self->_dismissButton trailingAnchor];
      double v12 = [v10 constraintEqualToSystemSpacingAfterAnchor:v11 multiplier:1.0];
      v33[3] = v12;
      double v13 = [(UIButton *)self->_dismissButton centerYAnchor];
      objc_super v14 = [(SFLinkBanner *)self centerYAnchor];
      CGRect v15 = [v13 constraintEqualToAnchor:v14];
      v33[4] = v15;
      CGRect v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:5];
      [v22 activateConstraints:v16];

      CGRect v17 = (void *)MEMORY[0x1E4F28DC8];
      iconLeadingConstraintToSuperview = self->_iconLeadingConstraintToSuperview;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&iconLeadingConstraintToSuperview count:1];
      [v17 deactivateConstraints:v18];

      v19 = (void *)v30;
    }
    else
    {
      [(UIButton *)dismissButton removeFromSuperview];
      v20 = self->_dismissButton;
      self->_dismissButton = 0;

      v21 = (void *)MEMORY[0x1E4F28DC8];
      v31 = self->_iconLeadingConstraintToSuperview;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      [v21 activateConstraints:v19];
    }
  }
}

- (void)_dismiss
{
  id dismissButtonHandler = (void (**)(id, SFLinkBanner *))self->_dismissButtonHandler;
  if (dismissButtonHandler) {
    dismissButtonHandler[2](dismissButtonHandler, self);
  }
}

- (void)setBackdropTopExtension:(double)a3
{
  self->_backdropTopExtension = a3;
  -[NSLayoutConstraint setConstant:](self->_backdropTopConstraint, "setConstant:");
}

- (UIImageView)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (_SFDimmingButton)openButton
{
  return self->_openButton;
}

- (void)setOpenButton:(id)a3
{
}

- (NSString)openButtonTitle
{
  return self->_openButtonTitle;
}

- (id)openActionHandler
{
  return self->_openActionHandler;
}

- (void)setOpenActionHandler:(id)a3
{
}

- (BOOL)shouldHideIcon
{
  return self->_shouldHideIcon;
}

- (id)dismissButtonHandler
{
  return self->_dismissButtonHandler;
}

- (double)backdropTopExtension
{
  return self->_backdropTopExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissButtonHandler, 0);
  objc_storeStrong(&self->_openActionHandler, 0);
  objc_storeStrong((id *)&self->_openButtonTitle, 0);
  objc_storeStrong((id *)&self->_openButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_backdropTopConstraint, 0);
  objc_storeStrong((id *)&self->_iconLeadingConstraintToSuperview, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_messageBottomConstraint, 0);
  objc_storeStrong((id *)&self->_messageTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleTopConstraint, 0);

  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end