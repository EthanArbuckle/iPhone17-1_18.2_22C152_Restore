@interface SFInteractiveBannerCell
+ (NSString)reuseIdentifier;
- (SFInteractiveBannerCell)initWithFrame:(CGRect)a3;
- (UILabel)captionLabel;
- (UILabel)leadingLabel;
- (_UIVisualEffectBackdropView)backdropCaptureView;
- (void)_actionButtonTapped:(id)a3;
- (void)_removeActionButton;
- (void)_updateActionButtonWithText:(id)a3;
- (void)_updateVibrancy;
- (void)configureUsingBanner:(id)a3;
- (void)setBackdropCaptureView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SFInteractiveBannerCell

- (void)setBackdropCaptureView:(id)a3
{
  id v6 = a3;
  v4 = [(UIVisualEffectView *)self->_backgroundEffectView _captureView];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0) {
    [(UIVisualEffectView *)self->_backgroundEffectView _setCaptureView:v6];
  }
}

- (void)configureUsingBanner:(id)a3
{
  id v4 = a3;
  char v5 = [v4 message];
  [(UILabel *)self->_captionLabel setText:v5];

  id v6 = [v4 action];
  id buttonAction = self->_buttonAction;
  self->_id buttonAction = v6;

  v8 = [v4 title];
  [(SFInteractiveBannerCell *)self _updateActionButtonWithText:v8];

  v9 = (void *)MEMORY[0x1E4FB0870];
  v10 = [v4 image];

  id v13 = [v9 textAttachmentWithImage:v10];

  v11 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v13];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  [v12 appendAttributedString:v11];
  [(UILabel *)self->_leadingLabel setAttributedText:v12];
}

- (UILabel)leadingLabel
{
  return self->_leadingLabel;
}

- (UILabel)captionLabel
{
  return self->_captionLabel;
}

- (void)_removeActionButton
{
  [(UIButton *)self->_actionButton removeFromSuperview];
  actionButton = self->_actionButton;
  self->_actionButton = 0;
}

- (void)_updateActionButtonWithText:(id)a3
{
  v30[4] = *MEMORY[0x1E4F143B8];
  actionButton = self->_actionButton;
  if (actionButton)
  {
    id v4 = a3;
    [(UIButton *)actionButton setTitle:v4 forState:0];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4FB14D8];
    id v7 = a3;
    id v4 = [v6 grayButtonConfiguration];
    objc_msgSend(v4, "setContentInsets:", 6.0, 14.0, 6.0, 14.0);
    v8 = [MEMORY[0x1E4FB1618] labelColor];
    [v4 setBaseForegroundColor:v8];

    [v4 setCornerStyle:4];
    v9 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v4 primaryAction:0];
    v10 = self->_actionButton;
    self->_actionButton = v9;

    [(UIButton *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(UIButton *)self->_actionButton titleLabel];
    [v11 setAdjustsFontForContentSizeCategory:1];

    [(UIButton *)self->_actionButton setTitle:v7 forState:0];
    [(UIButton *)self->_actionButton addTarget:self action:sel__actionButtonTapped_ forControlEvents:0x2000];
    v29 = [(SFInteractiveBannerCell *)self contentView];
    [v29 addSubview:self->_actionButton];
    id v12 = [v29 layoutMarginsGuide];
    v24 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [(UIButton *)self->_actionButton leadingAnchor];
    v27 = [(UILabel *)self->_captionLabel leadingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v30[0] = v26;
    v25 = [(UIButton *)self->_actionButton trailingAnchor];
    id v13 = v12;
    v23 = v12;
    v14 = [v12 trailingAnchor];
    v15 = [v25 constraintLessThanOrEqualToAnchor:v14];
    v30[1] = v15;
    v16 = [(UIButton *)self->_actionButton topAnchor];
    v17 = [(UILayoutGuide *)self->_textLayoutGuide bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 constant:12.0];
    v30[2] = v18;
    v19 = [(UIButton *)self->_actionButton bottomAnchor];
    v20 = [v13 bottomAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v30[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [v24 activateConstraints:v22];
  }
}

- (SFInteractiveBannerCell)initWithFrame:(CGRect)a3
{
  v72[12] = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)SFInteractiveBannerCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v71, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    char v5 = [(SFStartPageFilledBackgroundCell *)v3 defaultBackgroundConfiguration];
    if (([MEMORY[0x1E4F97EA0] is2024PrivacyReportEnabled] & 1) == 0)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1F00], "sf_startPageCellBackgroundEffectViewWithShadow:", 1);
      backgroundEffectView = v4->_backgroundEffectView;
      v4->_backgroundEffectView = (UIVisualEffectView *)v6;

      [v5 setCustomView:v4->_backgroundEffectView];
    }
    [v5 setCornerRadius:10.0];
    [(SFInteractiveBannerCell *)v4 setBackgroundConfiguration:v5];
    v8 = [(SFInteractiveBannerCell *)v4 contentView];
    objc_msgSend(v8, "setLayoutMargins:", 20.0, 20.0, 20.0, 20.0);
    v70 = v5;
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    leadingLabel = v4->_leadingLabel;
    v4->_leadingLabel = v9;

    [(UILabel *)v4->_leadingLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_leadingLabel setAdjustsFontForContentSizeCategory:1];
    v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
    [(UILabel *)v4->_leadingLabel setFont:v11];

    [(UILabel *)v4->_leadingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1148846080;
    [(UILabel *)v4->_leadingLabel setContentCompressionResistancePriority:0 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(UILabel *)v4->_leadingLabel setContentHuggingPriority:0 forAxis:v13];
    [v8 addSubview:v4->_leadingLabel];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    captionLabel = v4->_captionLabel;
    v4->_captionLabel = v14;

    [(UILabel *)v4->_captionLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_captionLabel setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
    v16 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
    v17 = [v16 fontDescriptorWithSymbolicTraits:0];

    v18 = (void *)MEMORY[0x1E4FB08E0];
    [v17 pointSize];
    v19 = objc_msgSend(v18, "fontWithDescriptor:size:", v17);

    [(UILabel *)v4->_captionLabel setFont:v19];
    [(UILabel *)v4->_captionLabel setNumberOfLines:0];
    [(UILabel *)v4->_captionLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_captionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v69 = v8;
    [v8 addSubview:v4->_captionLabel];
    v20 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    textLayoutGuide = v4->_textLayoutGuide;
    v4->_textLayoutGuide = v20;

    [(UILayoutGuide *)v4->_textLayoutGuide setIdentifier:@"SFPrivacyReportBannerText"];
    [v8 addLayoutGuide:v4->_textLayoutGuide];
    v22 = [v8 layoutMarginsGuide];
    v52 = (void *)MEMORY[0x1E4F28DC8];
    v68 = [(UILayoutGuide *)v4->_textLayoutGuide leadingAnchor];
    v67 = [v22 leadingAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v72[0] = v66;
    v65 = [(UILayoutGuide *)v4->_textLayoutGuide widthAnchor];
    v63 = [v22 widthAnchor];
    v62 = [v65 constraintEqualToAnchor:v63];
    v72[1] = v62;
    v61 = [(UILayoutGuide *)v4->_textLayoutGuide topAnchor];
    v60 = [v22 topAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v72[2] = v59;
    v58 = [(UILayoutGuide *)v4->_textLayoutGuide heightAnchor];
    v64 = v22;
    v57 = [v22 heightAnchor];
    v56 = [v58 constraintLessThanOrEqualToAnchor:v57];
    v72[3] = v56;
    v55 = [(UILayoutGuide *)v4->_textLayoutGuide centerYAnchor];
    v54 = [v22 centerYAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    LODWORD(v23) = 1144750080;
    v51 = objc_msgSend(v53, "sf_withPriority:", v23);
    v72[4] = v51;
    v50 = [(UILabel *)v4->_leadingLabel leadingAnchor];
    v49 = [(UILayoutGuide *)v4->_textLayoutGuide leadingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v72[5] = v48;
    v47 = [(UILabel *)v4->_leadingLabel topAnchor];
    v46 = [(UILayoutGuide *)v4->_textLayoutGuide topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v72[6] = v45;
    v44 = [(UILabel *)v4->_leadingLabel heightAnchor];
    v43 = [(UILayoutGuide *)v4->_textLayoutGuide heightAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v72[7] = v42;
    v41 = [(UILabel *)v4->_captionLabel leadingAnchor];
    v40 = [(UILabel *)v4->_leadingLabel trailingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 constant:20.0];
    v72[8] = v39;
    v38 = [(UILabel *)v4->_captionLabel trailingAnchor];
    v24 = [(UILayoutGuide *)v4->_textLayoutGuide trailingAnchor];
    v25 = [v38 constraintEqualToAnchor:v24];
    v72[9] = v25;
    v26 = [(UILabel *)v4->_captionLabel topAnchor];
    v27 = [(UILayoutGuide *)v4->_textLayoutGuide topAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v72[10] = v28;
    v29 = [(UILabel *)v4->_captionLabel heightAnchor];
    v30 = [(UILayoutGuide *)v4->_textLayoutGuide heightAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v72[11] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:12];
    [v52 activateConstraints:v32];

    [(SFInteractiveBannerCell *)v4 _updateVibrancy];
    v33 = v4->_backgroundEffectView;
    v34 = objc_msgSend(MEMORY[0x1E4FB1F00], "sf_startPageBackgroundTraits");
    id v35 = (id)[(UIVisualEffectView *)v33 registerForTraitChanges:v34 withTarget:v4 action:sel__updateVibrancy];

    v36 = v4;
  }

  return v4;
}

- (void)_updateVibrancy
{
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"InteractiveBanner";
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SFInteractiveBannerCell *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)SFInteractiveBannerCell;
  [(SFInteractiveBannerCell *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    backgroundEffectView = self->_backgroundEffectView;
    id v7 = [(SFInteractiveBannerCell *)self configurationState];
    [(UIVisualEffectView *)backgroundEffectView sf_setHighlighted:v3 cellState:v7];
  }
}

- (void)_actionButtonTapped:(id)a3
{
  id buttonAction = (void (**)(void))self->_buttonAction;
  if (buttonAction) {
    buttonAction[2]();
  }
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return (_UIVisualEffectBackdropView *)[(UIVisualEffectView *)self->_backgroundEffectView _captureView];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);

  objc_storeStrong((id *)&self->_leadingLabel, 0);
}

@end