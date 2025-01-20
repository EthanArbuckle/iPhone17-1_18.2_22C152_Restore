@interface VUIBuyButtonLockup
- (BOOL)_isLargeContentSize;
- (BOOL)hasIAP;
- (UIButton)button;
- (VUIBuyButtonLockup)initWithFrame:(CGRect)a3;
- (void)_updateForPreferredContentSize;
- (void)dealloc;
- (void)setButton:(id)a3;
- (void)setHasIAP:(BOOL)a3;
@end

@implementation VUIBuyButtonLockup

- (VUIBuyButtonLockup)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)VUIBuyButtonLockup;
  v3 = -[VUIUIStackView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    v6 = v3->_button;
    v7 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    [(UIButton *)v6 setBackgroundColor:v7];

    v8 = v3->_button;
    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIButton *)v8 setTitleColor:v9 forState:0];

    [(VUIBuyButtonLockup *)v3 addArrangedSubview:v3->_button];
    [(UIButton *)v3->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UIButton setContentEdgeInsets:](v3->_button, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
    v10 = [(UIButton *)v3->_button heightAnchor];
    uint64_t v11 = [v10 constraintEqualToConstant:28.0];
    buttonHeightConstraint = v3->_buttonHeightConstraint;
    v3->_buttonHeightConstraint = (NSLayoutConstraint *)v11;

    [(NSLayoutConstraint *)v3->_buttonHeightConstraint setActive:1];
    v13 = [(UIButton *)v3->_button widthAnchor];
    v14 = [v13 constraintGreaterThanOrEqualToConstant:68.0];
    [v14 setActive:1];

    id v15 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v16 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    iAPLabel = v3->_iAPLabel;
    v3->_iAPLabel = (UILabel *)v16;

    [(VUIBuyButtonLockup *)v3 addArrangedSubview:v3->_iAPLabel];
    [(UILabel *)v3->_iAPLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_iAPLabel setNumberOfLines:0];
    v18 = v3->_iAPLabel;
    v19 = [MEMORY[0x1E4FB08E0] systemFontOfSize:8.0];
    [(UILabel *)v18 setFont:v19];

    v20 = v3->_iAPLabel;
    v21 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UILabel *)v20 setTextColor:v21];

    v22 = v3->_iAPLabel;
    v23 = +[VUILocalizationManager sharedInstance];
    v24 = [v23 localizedStringForKey:@"APP_INSTALL_OFFERS_IN_APP_PURCHASES"];
    [(UILabel *)v22 setText:v24];

    [(UILabel *)v3->_iAPLabel setHidden:1];
    [(VUIBuyButtonLockup *)v3 _updateForPreferredContentSize];
    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v3 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIBuyButtonLockup;
  [(VUIBuyButtonLockup *)&v4 dealloc];
}

- (void)setHasIAP:(BOOL)a3
{
  if (self->_hasIAP != a3)
  {
    [(UILabel *)self->_iAPLabel setHidden:!a3];
    [(VUIBuyButtonLockup *)self invalidateIntrinsicContentSize];
  }
}

- (BOOL)_isLargeContentSize
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  v3 = [v2 preferredContentSizeCategory];

  BOOL v4 = ([v3 isEqualToString:*MEMORY[0x1E4FB27C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4FB27B8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4FB27B0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4FB2798]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4FB2790]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4FB2788]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4FB2780]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x1E4FB2778]];

  return v4;
}

- (void)_updateForPreferredContentSize
{
  BOOL v3 = [(VUIBuyButtonLockup *)self _isLargeContentSize];
  buttonHeightConstraint = self->_buttonHeightConstraint;
  if (v3)
  {
    [(NSLayoutConstraint *)buttonHeightConstraint setConstant:34.0];
    p_button = &self->_button;
    button = self->_button;
    v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", 13, 4, 2, 21.0);
    [(UIButton *)button _setFont:v7];
    double v8 = 17.0;
  }
  else
  {
    [(NSLayoutConstraint *)buttonHeightConstraint setConstant:28.0];
    p_button = &self->_button;
    v9 = self->_button;
    v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", 13, 4, 2, 16.0);
    [(UIButton *)v9 _setFont:v7];
    double v8 = 14.0;
  }

  v10 = *p_button;
  [(UIButton *)v10 _setContinuousCornerRadius:v8];
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (BOOL)hasIAP
{
  return self->_hasIAP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_iAPLabel, 0);
}

@end