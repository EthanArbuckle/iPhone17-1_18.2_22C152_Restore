@interface SFBannerMessageAndButtonsCell
+ (NSString)reuseIdentifier;
- (SFBannerMessageAndButtonsCell)initWithFrame:(CGRect)a3;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)_primaryButtonSelected;
- (void)_secondaryButtonSelected;
- (void)configureUsingBanner:(id)a3;
@end

@implementation SFBannerMessageAndButtonsCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"SFBannerMessageAndButtonsCell";
}

- (SFBannerMessageAndButtonsCell)initWithFrame:(CGRect)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)SFBannerMessageAndButtonsCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SFStartPageFilledBackgroundCell *)v3 defaultBackgroundConfiguration];
    [v5 setCornerRadius:10.0];
    [(SFBannerMessageAndButtonsCell *)v4 setBackgroundConfiguration:v5];
    v32 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2998] weight:*MEMORY[0x1E4FB09E0]];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1930], "sf_startPageBannerTitleLabelWithFont:", v32);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v6;

    v8 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    messageTextView = v4->_messageTextView;
    v4->_messageTextView = v8;

    [(UITextView *)v4->_messageTextView setDelegate:v4];
    [(UITextView *)v4->_messageTextView setScrollEnabled:0];
    [(UITextView *)v4->_messageTextView setEditable:0];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v4->_messageTextView setBackgroundColor:v10];

    uint64_t v36 = *MEMORY[0x1E4FB0700];
    v11 = [MEMORY[0x1E4FB1618] linkColor];
    v37[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    [(UITextView *)v4->_messageTextView setLinkTextAttributes:v12];

    v13 = [MEMORY[0x1E4FB14D8] borderedProminentButtonConfiguration];
    [v13 setCornerStyle:3];
    uint64_t v14 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v13 primaryAction:0];
    primaryButton = v4->_primaryButton;
    v4->_primaryButton = (UIButton *)v14;

    v16 = [MEMORY[0x1E4FB14D8] borderedButtonConfiguration];
    v17 = [MEMORY[0x1E4FB1618] labelColor];
    [v16 setBaseForegroundColor:v17];

    [v16 setCornerStyle:3];
    uint64_t v18 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v16 primaryAction:0];
    secondaryButton = v4->_secondaryButton;
    v4->_secondaryButton = (UIButton *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v35[0] = v4->_secondaryButton;
    v35[1] = v4->_primaryButton;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    v22 = (void *)[v20 initWithArrangedSubviews:v21];

    [v22 setSpacing:10.0];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v22 setAlignment:3];
    id v23 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v34[0] = v4->_titleLabel;
    v34[1] = v4->_messageTextView;
    v34[2] = v22;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
    v25 = (void *)[v23 initWithArrangedSubviews:v24];

    [v25 setSpacing:10.0];
    [v25 setAxis:1];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v25 setAlignment:3];
    v26 = [(SFBannerMessageAndButtonsCell *)v4 contentView];
    [v26 addSubview:v25];

    v27 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [(SFBannerMessageAndButtonsCell *)v4 contentView];
    v29 = objc_msgSend(v27, "safari_constraintsMatchingFrameOfView:withFrameOfView:edgeInsets:", v25, v28, 10.0, 10.0, 10.0, 10.0);
    [v27 activateConstraints:v29];

    v30 = v4;
  }

  return v4;
}

- (void)configureUsingBanner:(id)a3
{
  objc_storeStrong((id *)&self->_banner, a3);
  id v11 = a3;
  v5 = [v11 title];
  [(UILabel *)self->_titleLabel setText:v5];

  uint64_t v6 = [v11 attributedMessage];
  [(UITextView *)self->_messageTextView setAttributedText:v6];

  primaryButton = self->_primaryButton;
  v8 = [v11 primaryButtonTitle];
  [(UIButton *)primaryButton setTitle:v8 forState:0];

  secondaryButton = self->_secondaryButton;
  v10 = [v11 secondaryButtonTitle];
  [(UIButton *)secondaryButton setTitle:v10 forState:0];

  [(UIButton *)self->_primaryButton addTarget:self action:sel__primaryButtonSelected forControlEvents:64];
  [(UIButton *)self->_secondaryButton addTarget:self action:sel__secondaryButtonSelected forControlEvents:64];
}

- (void)_primaryButtonSelected
{
  v2 = [(WBSStartPageBanner *)self->_banner primaryButtonHandler];
  v2[2]();
}

- (void)_secondaryButtonSelected
{
  v2 = [(WBSStartPageBanner *)self->_banner secondaryButtonHandler];
  v2[2]();
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  banner = self->_banner;
  id v7 = a5;
  id v8 = a4;
  v9 = [(WBSStartPageBanner *)banner messageTextItemHandler];
  v10 = ((void (**)(void, id))v9)[2](v9, v8);

  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = v7;
  }
  id v12 = v11;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_banner, 0);
}

@end