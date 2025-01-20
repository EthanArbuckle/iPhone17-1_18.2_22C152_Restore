@interface SFCrashBanner
- (BOOL)_shouldUseManuallyWrappedCrashMessageForWidth:(double)a3;
- (CGSize)_labelLayoutSizeForWidth:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)backdropGroupName;
- (NSString)bannerText;
- (NSString)manuallyWrappedBannerText;
- (SFCrashBanner)initWithFrame:(CGRect)a3;
- (UIButton)closeButton;
- (unint64_t)messageType;
- (void)layoutSubviews;
- (void)setBackdropGroupName:(id)a3;
- (void)setBannerText:(id)a3 manuallyWrappedBannerText:(id)a4;
- (void)setCloseButton:(id)a3;
- (void)setMessageType:(unint64_t)a3;
- (void)themeDidChange;
@end

@implementation SFCrashBanner

- (SFCrashBanner)initWithFrame:(CGRect)a3
{
  v47[4] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)SFCrashBanner;
  v3 = -[SFPinnableBanner initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFCrashBanner *)v3 setClipsToBounds:0];
    v5 = [(SFCrashBanner *)v4 layer];
    [v5 setAllowsGroupBlending:0];

    uint64_t v6 = _WBSLocalizedString();
    bannerText = v4->_bannerText;
    v4->_bannerText = (NSString *)v6;

    uint64_t v8 = _WBSLocalizedString();
    manuallyWrappedBannerText = v4->_manuallyWrappedBannerText;
    v4->_manuallyWrappedBannerText = (NSString *)v8;

    v4->_messageType = 0;
    v10 = [SFThemeColorEffectView alloc];
    v11 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v12 = [(SFThemeColorEffectView *)v10 initWithEffect:v11];
    backdrop = v4->_backdrop;
    v4->_backdrop = (SFThemeColorEffectView *)v12;

    [(SFCrashBanner *)v4 bounds];
    -[SFThemeColorEffectView setFrame:](v4->_backdrop, "setFrame:");
    [(SFThemeColorEffectView *)v4->_backdrop setAutoresizingMask:18];
    [(SFCrashBanner *)v4 addSubview:v4->_backdrop];
    v14 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    closeButton = v4->_closeButton;
    v4->_closeButton = v14;

    v45 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill"];
    v16 = (void *)MEMORY[0x1E4FB1830];
    uint64_t v17 = *MEMORY[0x1E4FB28D8];
    v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    v44 = [v16 configurationWithFont:v18];

    [(UIButton *)v4->_closeButton setImage:v45 forState:0];
    [(UIButton *)v4->_closeButton setPreferredSymbolConfiguration:v44 forImageInState:0];
    id v19 = objc_alloc(MEMORY[0x1E4FB1F00]);
    [(SFCrashBanner *)v4 bounds];
    uint64_t v20 = objc_msgSend(v19, "initWithFrame:");
    contentEffectView = v4->_contentEffectView;
    v4->_contentEffectView = (UIVisualEffectView *)v20;

    [(UIVisualEffectView *)v4->_contentEffectView setAutoresizingMask:18];
    [(SFCrashBanner *)v4 addSubview:v4->_contentEffectView];
    v22 = [(UIVisualEffectView *)v4->_contentEffectView contentView];
    [v22 addSubview:v4->_closeButton];

    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v4->_label;
    v4->_label = v23;

    v25 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v17];
    [(UILabel *)v4->_label setFont:v25];

    [(UILabel *)v4->_label setLineBreakMode:0];
    [(UILabel *)v4->_label setNumberOfLines:0];
    v26 = [(UIVisualEffectView *)v4->_contentEffectView contentView];
    [v26 addSubview:v4->_label];

    [(UIButton *)v4->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v38 = (void *)MEMORY[0x1E4F28DC8];
    v43 = [(UIButton *)v4->_closeButton centerYAnchor];
    v42 = [(SFCrashBanner *)v4 centerYAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v47[0] = v41;
    v40 = [(UILabel *)v4->_label centerYAnchor];
    v39 = [(SFCrashBanner *)v4 centerYAnchor];
    v27 = [v40 constraintEqualToAnchor:v39];
    v47[1] = v27;
    v28 = [(SFCrashBanner *)v4 safeAreaLayoutGuide];
    v29 = [v28 leadingAnchor];
    v30 = [(UIButton *)v4->_closeButton leadingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:-8.0];
    v47[2] = v31;
    v32 = [(UIButton *)v4->_closeButton trailingAnchor];
    v33 = [(UILabel *)v4->_label leadingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 constant:-2.5];
    v47[3] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    [v38 activateConstraints:v35];

    v36 = v4;
  }

  return v4;
}

- (void)themeDidChange
{
  id v15 = [(SFPinnableBanner *)self theme];
  if ([v15 backdropIsDark]) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] blackColor];
  }
  [(UILabel *)self->_label setTextColor:v3];
  v4 = [v15 traitCollection];
  [(SFCrashBanner *)self _setLocalOverrideTraitCollection:v4];

  [(SFThemeColorEffectView *)self->_backdrop setTheme:v15];
  if (v15)
  {
    v5 = (void *)MEMORY[0x1E4FB1EA0];
    uint64_t v6 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    v7 = [v5 effectForBlurEffect:v6];
    [(UIVisualEffectView *)self->_contentEffectView setEffect:v7];
  }
  else
  {
    int v8 = [0 backdropIsTinted];
    v9 = (void *)MEMORY[0x1E4FB1EA0];
    v10 = [0 backdropEffect];
    if (v8)
    {
      v11 = [v9 effectForBlurEffect:v10];
      [(UIVisualEffectView *)self->_contentEffectView setEffect:v11];

      closeButton = self->_closeButton;
      v13 = v3;
    }
    else
    {
      v14 = [v9 effectForBlurEffect:v10 style:4];
      [(UIVisualEffectView *)self->_contentEffectView setEffect:v14];

      closeButton = self->_closeButton;
      v13 = 0;
    }
    [(UIButton *)closeButton setTintColor:v13];
  }
}

- (NSString)backdropGroupName
{
  return [(SFThemeColorEffectView *)self->_backdrop _groupName];
}

- (void)setBackdropGroupName:(id)a3
{
}

- (BOOL)_shouldUseManuallyWrappedCrashMessageForWidth:(double)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  bannerText = self->_bannerText;
  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  v14[0] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  CFAttributedStringRef v9 = (const __CFAttributedString *)[v5 initWithString:bannerText attributes:v8];

  v10 = CTTypesetterCreateWithAttributedString(v9);
  unint64_t v11 = CTTypesetterSuggestLineBreak(v10, 0, a3);
  CFRelease(v10);
  LOBYTE(v10) = v11 < [(__CFAttributedString *)v9 length];

  return (char)v10;
}

- (CGSize)_labelLayoutSizeForWidth:(double)a3
{
  p_cachedLabelLayoutSize = &self->_cachedLabelLayoutSize;
  double width = self->_cachedLabelLayoutSize.width;
  if (width == a3)
  {
    double height = self->_cachedLabelLayoutSize.height;
  }
  else
  {
    double v6 = a3 + -16.0;
    [(UIButton *)self->_closeButton bounds];
    double width = v6 - (v7 + 2.5);
    if (![(SFCrashBanner *)self _shouldUseManuallyWrappedCrashMessageForWidth:width]|| (p_bannerText = &self->_manuallyWrappedBannerText, ![(NSString *)self->_manuallyWrappedBannerText length]))
    {
      p_bannerText = &self->_bannerText;
    }
    [(UILabel *)self->_label setText:*p_bannerText];
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width, 1.79769313e308);
    double height = v9 + 18.0;
    p_cachedLabelLayoutSize->double width = width;
    p_cachedLabelLayoutSize->double height = height;
  }
  double v11 = width;
  result.double height = height;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SFCrashBanner;
  [(SFCrashBanner *)&v6 layoutSubviews];
  v3 = [(SFPinnableBanner *)self theme];
  if ([v3 backdropIsDark])
  {
    v4 = [v3 separatorColor];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  [(SFPinnableBanner *)self setShowsTopSeparator:v5];
  [(SFPinnableBanner *)self setShowsBottomSeparator:v5 ^ 1];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[SFCrashBanner _labelLayoutSizeForWidth:](self, "_labelLayoutSizeForWidth:", a3.width, a3.height);
  double v5 = width;
  result.double height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)setBannerText:(id)a3 manuallyWrappedBannerText:(id)a4
{
  id v6 = a4;
  double v7 = (NSString *)[a3 copy];
  bannerText = self->_bannerText;
  self->_bannerText = v7;

  double v9 = (NSString *)[v6 copy];
  manuallyWrappedBannerText = self->_manuallyWrappedBannerText;
  self->_manuallyWrappedBannerText = v9;

  [(SFCrashBanner *)self setNeedsLayout];
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (NSString)bannerText
{
  return self->_bannerText;
}

- (NSString)manuallyWrappedBannerText
{
  return self->_manuallyWrappedBannerText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manuallyWrappedBannerText, 0);
  objc_storeStrong((id *)&self->_bannerText, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contentEffectView, 0);

  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end