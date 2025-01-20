@interface ICQUpgradeOfferView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (ICQLink)bottomLink;
- (ICQLink)purchase2Link;
- (ICQLink)purchaseLink;
- (ICQPageDelegate)delegate;
- (ICQUpgradeOfferView)initWithFrame:(CGRect)a3;
- (NSArray)activeConstraints;
- (UIActivityIndicatorView)spinner;
- (UIButton)bottomButton;
- (UIButton)purchase2Button;
- (UIButton)purchaseButton;
- (UIColor)buttonTintColor;
- (UIColor)fineprintColor;
- (UIFont)fineprintFont;
- (UIFont)linkButtonFont;
- (UIFont)messageFont;
- (UIFont)purchaseButtonFont;
- (UIFont)titleFont;
- (UIImageView)iconView;
- (UILabel)titleLabel;
- (UILayoutGuide)aboveSpinnerLayoutGuide;
- (UILayoutGuide)belowSpinnerLayoutGuide;
- (UILayoutGuide)scrollVisibleLayoutGuide;
- (UIScrollView)scrollView;
- (UIView)contentView;
- (UIView)footerView;
- (UIView)headerView;
- (UIView)trayView;
- (UIVisualEffectView)blurBackdrop;
- (_ICQTextView)fineprintView;
- (_ICQTextView)messageView;
- (_ICQUpgradeOfferPageSpecification)upgradeOfferPageSpecification;
- (double)_marginForButton:(id)a3;
- (double)_spacingFromUpperView:(id)a3 toLowerView:(id)a4;
- (id)_anchorForLowerView:(id)a3;
- (id)_anchorForUpperView:(id)a3;
- (id)_buttons;
- (id)_constraintsForView:(id)a3 equalToView:(id)a4;
- (id)_imageForBundleIdentifier:(id)a3;
- (id)_imageForGenericCloud;
- (id)_makeLinkButton;
- (id)_makePurchaseButton;
- (id)defaultButtonColor;
- (id)fineprintAttributes;
- (id)fineprintParagraphStyle;
- (id)horizontalConstraintsForView:(id)a3 margin:(double)a4;
- (id)messageAttributes;
- (id)messageParagraphStyle;
- (id)messageTextColor;
- (int64_t)_styleOfView:(id)a3;
- (int64_t)upgradeMode;
- (void)_setButton:(id)a3 backgroundColor:(id)a4;
- (void)_setButtonTintColor:(id)a3;
- (void)_setLinkTextColor:(id)a3;
- (void)_updateTrayVisibility;
- (void)bottomButtonTapped:(id)a3;
- (void)flashScrollIndicatorsIfNeeded;
- (void)layoutSubviews;
- (void)purchase2ButtonTapped:(id)a3;
- (void)purchaseButtonTapped:(id)a3;
- (void)setActiveConstraints:(id)a3;
- (void)setBottomButton:(id)a3;
- (void)setButtonTintColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFineprintView:(id)a3;
- (void)setIconView:(id)a3;
- (void)setMessageView:(id)a3;
- (void)setPurchase2Button:(id)a3;
- (void)setPurchaseButton:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpgradeMode:(int64_t)a3;
- (void)setUpgradeOfferPageSpecification:(id)a3;
- (void)updateConstraints;
@end

@implementation ICQUpgradeOfferView

- (UIFont)titleFont
{
  return (UIFont *)_DynamicFontWithStyleTraits(*MEMORY[0x263F835E0], 32770);
}

- (UIFont)messageFont
{
  return (UIFont *)_DynamicFontWithStyleTraits(*MEMORY[0x263F83570], 0);
}

- (UIFont)purchaseButtonFont
{
  return (UIFont *)_DynamicFontWithStyleTraits(*MEMORY[0x263F835D0], 0x8000);
}

- (UIFont)linkButtonFont
{
  return (UIFont *)_DynamicFontWithStyleTraits(*MEMORY[0x263F83570], 0x8000);
}

- (UIFont)fineprintFont
{
  return (UIFont *)_DynamicFontWithStyleTraits(*MEMORY[0x263F83590], 0);
}

- (id)defaultButtonColor
{
  return (id)[MEMORY[0x263F825C8] systemBlueColor];
}

- (UIColor)fineprintColor
{
  return (UIColor *)[MEMORY[0x263F825C8] labelColor];
}

- (id)messageTextColor
{
  return (id)[MEMORY[0x263F825C8] labelColor];
}

- (int64_t)_styleOfView:(id)a3
{
  v4 = (_ICQTextView *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(_ICQTextView *)v4 buttonType] == 1) {
      int64_t v5 = 3;
    }
    else {
      int64_t v5 = 2;
    }
  }
  else
  {
    int64_t v5 = self->_fineprintView == v4;
  }

  return v5;
}

- (id)_anchorForUpperView:(id)a3
{
  v4 = (UIView *)a3;
  int64_t v5 = v4;
  if (self->_trayView == v4)
  {
    uint64_t v6 = [(UIView *)v4 topAnchor];
  }
  else if ([(ICQUpgradeOfferView *)self _styleOfView:v4] == 3 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  }
  {
    uint64_t v6 = [(UIView *)v5 lastBaselineAnchor];
  }
  else
  {
    uint64_t v6 = [(UIView *)v5 bottomAnchor];
  }
  v7 = (void *)v6;

  return v7;
}

- (id)_anchorForLowerView:(id)a3
{
  id v4 = a3;
  if ([(ICQUpgradeOfferView *)self _styleOfView:v4] == 3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [v4 firstBaselineAnchor];
  }
  else
  {
    uint64_t v5 = [v4 topAnchor];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (double)_spacingFromUpperView:(id)a3 toLowerView:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(ICQUpgradeOfferView *)self _styleOfView:a3];
  int64_t v8 = [(ICQUpgradeOfferView *)self _styleOfView:v6];

  double v9 = kViewStyleSpacing[4 * v7 + v8];
  if (v9 < 0.0)
  {
    v10 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
    [v10 scaledValueForValue:-v9];
    double v9 = v11;
  }
  return v9;
}

- (double)_marginForButton:(id)a3
{
  return 24.0;
}

- (id)_buttons
{
  v3 = [(ICQUpgradeOfferView *)self upgradeOfferPageSpecification];
  id v4 = [v3 purchaseLink];
  uint64_t v5 = [v4 text];
  uint64_t v6 = [v5 length];

  int64_t v7 = [(ICQUpgradeOfferView *)self upgradeOfferPageSpecification];
  int64_t v8 = [v7 purchase2Link];
  double v9 = [v8 text];
  uint64_t v10 = [v9 length];

  double v11 = [(ICQUpgradeOfferView *)self upgradeOfferPageSpecification];
  v12 = [v11 bottomLink];
  v13 = [v12 text];
  uint64_t v14 = [v13 length];

  v15 = [MEMORY[0x263EFF980] array];
  v16 = v15;
  if (v6) {
    [v15 addObject:self->_purchaseButton];
  }
  if (v10) {
    [v16 addObject:self->_purchase2Button];
  }
  if (v14) {
    [v16 addObject:self->_bottomButton];
  }
  v17 = (void *)[v16 copy];

  return v17;
}

- (id)_makePurchaseButton
{
  v3 = [MEMORY[0x263F824E8] buttonWithType:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [(ICQUpgradeOfferView *)self purchaseButtonFont];
  uint64_t v5 = [v3 titleLabel];
  [v5 setFont:v4];

  uint64_t v6 = [v3 titleLabel];
  [v6 setNumberOfLines:0];

  int64_t v7 = [v3 titleLabel];
  [v7 setLineBreakMode:0];

  int64_t v8 = [v3 titleLabel];
  [v8 setTextAlignment:1];

  double v9 = [v3 titleColorForState:0];
  uint64_t v10 = [v9 colorWithAlphaComponent:0.25];
  [v3 setTitleColor:v10 forState:1];
  [v3 setClipsToBounds:1];
  [v3 _setCornerRadius:14.0];

  return v3;
}

- (id)_makeLinkButton
{
  v3 = [MEMORY[0x263F824E8] buttonWithType:1];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [(ICQUpgradeOfferView *)self linkButtonFont];
  uint64_t v5 = [v3 titleLabel];
  [v5 setFont:v4];

  uint64_t v6 = [v3 titleLabel];
  [v6 setNumberOfLines:0];

  int64_t v7 = [v3 titleLabel];
  [v7 setLineBreakMode:0];

  int64_t v8 = [v3 titleLabel];
  [v8 setTextAlignment:1];

  return v3;
}

- (ICQUpgradeOfferView)initWithFrame:(CGRect)a3
{
  v54.receiver = self;
  v54.super_class = (Class)ICQUpgradeOfferView;
  v3 = -[ICQUpgradeOfferView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(ICQUpgradeOfferView *)v3 setBackgroundColor:v4];

    uint64_t v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F82908]);
    scrollVisibleLayoutGuide = v3->_scrollVisibleLayoutGuide;
    v3->_scrollVisibleLayoutGuide = v5;

    int64_t v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F82908]);
    aboveSpinnerLayoutGuide = v3->_aboveSpinnerLayoutGuide;
    v3->_aboveSpinnerLayoutGuide = v7;

    double v9 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F82908]);
    belowSpinnerLayoutGuide = v3->_belowSpinnerLayoutGuide;
    v3->_belowSpinnerLayoutGuide = v9;

    double v11 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activeConstraints = v3->_activeConstraints;
    v3->_activeConstraints = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
    iconView = v3->_iconView;
    v3->_iconView = (UIImageView *)v13;

    [(UIImageView *)v3->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_iconView setHidden:1];
    id v15 = objc_alloc(MEMORY[0x263F828E0]);
    double v16 = *MEMORY[0x263F001A8];
    double v17 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v20 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x263F001A8], v17, v18, v19);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v20;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [(ICQUpgradeOfferView *)v3 titleFont];
    [(UILabel *)v3->_titleLabel setFont:v22];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v23 = -[_ICQTextView initWithFrame:]([_ICQTextView alloc], "initWithFrame:", v16, v17, v18, v19);
    messageView = v3->_messageView;
    v3->_messageView = v23;

    [(_ICQTextView *)v3->_messageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [(ICQUpgradeOfferView *)v3 messageFont];
    [(_ICQTextView *)v3->_messageView setFont:v25];

    v26 = [MEMORY[0x263F825C8] clearColor];
    [(_ICQTextView *)v3->_messageView setBackgroundColor:v26];

    [(_ICQTextView *)v3->_messageView setDelegate:v3];
    uint64_t v27 = [(ICQUpgradeOfferView *)v3 _makePurchaseButton];
    purchaseButton = v3->_purchaseButton;
    v3->_purchaseButton = (UIButton *)v27;

    [(UIButton *)v3->_purchaseButton addTarget:v3 action:sel_purchaseButtonTapped_ forControlEvents:0x2000];
    uint64_t v29 = [(ICQUpgradeOfferView *)v3 _makeLinkButton];
    purchase2Button = v3->_purchase2Button;
    v3->_purchase2Button = (UIButton *)v29;

    [(UIButton *)v3->_purchase2Button addTarget:v3 action:sel_purchase2ButtonTapped_ forControlEvents:0x2000];
    uint64_t v31 = [(ICQUpgradeOfferView *)v3 _makeLinkButton];
    bottomButton = v3->_bottomButton;
    v3->_bottomButton = (UIButton *)v31;

    [(UIButton *)v3->_bottomButton addTarget:v3 action:sel_bottomButtonTapped_ forControlEvents:0x2000];
    uint64_t v33 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:101];
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v33;

    [(UIActivityIndicatorView *)v3->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v3->_spinner setHidden:1];
    v35 = -[_ICQTextView initWithFrame:]([_ICQTextView alloc], "initWithFrame:", v16, v17, v18, v19);
    fineprintView = v3->_fineprintView;
    v3->_fineprintView = v35;

    [(_ICQTextView *)v3->_fineprintView setTranslatesAutoresizingMaskIntoConstraints:0];
    v37 = [(ICQUpgradeOfferView *)v3 fineprintFont];
    [(_ICQTextView *)v3->_fineprintView setFont:v37];

    v38 = [(ICQUpgradeOfferView *)v3 fineprintColor];
    [(_ICQTextView *)v3->_fineprintView setTextColor:v38];

    v39 = [MEMORY[0x263F825C8] clearColor];
    [(_ICQTextView *)v3->_fineprintView setBackgroundColor:v39];

    [(_ICQTextView *)v3->_fineprintView setDelegate:v3];
    [(ICQUpgradeOfferView *)v3 _setButtonTintColor:0];
    v40 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F82B88]);
    scrollView = v3->_scrollView;
    v3->_scrollView = v40;

    [(UIScrollView *)v3->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)v3->_scrollView setAlwaysBounceVertical:1];
    [(UIScrollView *)v3->_scrollView setDelegate:v3];
    v42 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    headerView = v3->_headerView;
    v3->_headerView = v42;

    [(UIView *)v3->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v44 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    footerView = v3->_footerView;
    v3->_footerView = v44;

    [(UIView *)v3->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v46 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    contentView = v3->_contentView;
    v3->_contentView = v46;

    [(UIView *)v3->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v48 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    trayView = v3->_trayView;
    v3->_trayView = v48;

    [(UIView *)v3->_trayView setTranslatesAutoresizingMaskIntoConstraints:0];
    v50 = [MEMORY[0x263F824D8] effectWithStyle:1100];
    uint64_t v51 = [objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v50];
    blurBackdrop = v3->_blurBackdrop;
    v3->_blurBackdrop = (UIVisualEffectView *)v51;

    [(UIVisualEffectView *)v3->_blurBackdrop setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_contentView addSubview:v3->_headerView];
    [(UIView *)v3->_contentView addSubview:v3->_iconView];
    [(UIView *)v3->_contentView addSubview:v3->_titleLabel];
    [(UIView *)v3->_contentView addSubview:v3->_messageView];
    [(UIView *)v3->_contentView addSubview:v3->_footerView];
    [(UIScrollView *)v3->_scrollView addSubview:v3->_contentView];
    [(ICQUpgradeOfferView *)v3 addSubview:v3->_scrollView];
    [(ICQUpgradeOfferView *)v3 addSubview:v3->_blurBackdrop];
    [(UIView *)v3->_trayView addSubview:v3->_purchaseButton];
    [(UIView *)v3->_trayView addSubview:v3->_purchase2Button];
    [(UIView *)v3->_trayView addSubview:v3->_bottomButton];
    [(UIView *)v3->_trayView addSubview:v3->_fineprintView];
    [(UIView *)v3->_trayView addLayoutGuide:v3->_aboveSpinnerLayoutGuide];
    [(UIView *)v3->_trayView addLayoutGuide:v3->_belowSpinnerLayoutGuide];
    [(UIView *)v3->_trayView addSubview:v3->_spinner];
    [(ICQUpgradeOfferView *)v3 addSubview:v3->_trayView];
    [(ICQUpgradeOfferView *)v3 addLayoutGuide:v3->_scrollVisibleLayoutGuide];
  }
  return v3;
}

- (void)_setButton:(id)a3 backgroundColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = [v5 colorWithAlphaComponent:0.5];
  int64_t v7 = _PointImageOfColor(v5);

  [v6 setBackgroundImage:v7 forState:0];
  int64_t v8 = _PointImageOfColor(v9);
  [v6 setBackgroundImage:v8 forState:1];
}

- (void)_setLinkTextColor:(id)a3
{
  messageView = self->_messageView;
  id v5 = a3;
  id v6 = [(_ICQTextView *)messageView linkTextAttributes];
  int64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = *MEMORY[0x263F81500];
  [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x263F81500]];
  id v9 = (void *)[v7 copy];
  [(_ICQTextView *)self->_messageView setLinkTextAttributes:v9];

  uint64_t v10 = [(_ICQTextView *)self->_fineprintView linkTextAttributes];
  id v12 = (id)[v10 mutableCopy];

  [v12 setObject:v5 forKeyedSubscript:v8];
  double v11 = (void *)[v12 copy];
  [(_ICQTextView *)self->_fineprintView setLinkTextAttributes:v11];
}

- (void)_setButtonTintColor:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_buttonTintColor, a3);
  if (!v5)
  {
    id v5 = [(ICQUpgradeOfferView *)self defaultButtonColor];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(ICQUpgradeOfferView *)self _buttons];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v11 setTintColor:v5];
        if ([(ICQUpgradeOfferView *)self _styleOfView:v11] == 2) {
          [(ICQUpgradeOfferView *)self _setButton:v11 backgroundColor:v5];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(ICQUpgradeOfferView *)self _setLinkTextColor:v5];
}

- (void)setButtonTintColor:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  buttonTintColor = self->_buttonTintColor;
  if (v4 | (unint64_t)buttonTintColor)
  {
    id v7 = (id)v4;
    char v6 = [(UIColor *)buttonTintColor isEqual:v4];
    unint64_t v4 = (unint64_t)v7;
    if ((v6 & 1) == 0)
    {
      [(ICQUpgradeOfferView *)self _setButtonTintColor:v7];
      unint64_t v4 = (unint64_t)v7;
    }
  }
}

- (void)purchaseButtonTapped:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "ICQUpgradeOfferView main button tapped", (uint8_t *)&v20, 2u);
  }

  id v5 = [(ICQUpgradeOfferView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(ICQUpgradeOfferView *)self delegate];
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      double v11 = [(ICQUpgradeOfferView *)self purchaseLink];
      [v11 action];
      long long v12 = _ICQStringForAction();
      long long v13 = [(ICQUpgradeOfferView *)self purchaseLink];
      long long v14 = [v13 parameters];
      int v20 = 138412802;
      v21 = v10;
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "delegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v20, 0x20u);
    }
    long long v15 = [(ICQUpgradeOfferView *)self delegate];
    double v16 = [(ICQUpgradeOfferView *)self purchaseLink];
    uint64_t v17 = [v16 action];
    double v18 = [(ICQUpgradeOfferView *)self purchaseLink];
    double v19 = [v18 parameters];
    [v15 sender:self action:v17 parameters:v19];
  }
}

- (void)purchase2ButtonTapped:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "ICQUpgradeOfferView second button tapped", (uint8_t *)&v20, 2u);
  }

  id v5 = [(ICQUpgradeOfferView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(ICQUpgradeOfferView *)self delegate];
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      double v11 = [(ICQUpgradeOfferView *)self purchase2Link];
      [v11 action];
      long long v12 = _ICQStringForAction();
      long long v13 = [(ICQUpgradeOfferView *)self purchase2Link];
      long long v14 = [v13 parameters];
      int v20 = 138412802;
      v21 = v10;
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "delegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v20, 0x20u);
    }
    long long v15 = [(ICQUpgradeOfferView *)self delegate];
    double v16 = [(ICQUpgradeOfferView *)self purchase2Link];
    uint64_t v17 = [v16 action];
    double v18 = [(ICQUpgradeOfferView *)self purchase2Link];
    double v19 = [v18 parameters];
    [v15 sender:self action:v17 parameters:v19];
  }
}

- (void)bottomButtonTapped:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "ICQUpgradeOfferView bottom button tapped", (uint8_t *)&v20, 2u);
  }

  id v5 = [(ICQUpgradeOfferView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(ICQUpgradeOfferView *)self delegate];
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      double v11 = [(ICQUpgradeOfferView *)self bottomLink];
      [v11 action];
      long long v12 = _ICQStringForAction();
      long long v13 = [(ICQUpgradeOfferView *)self bottomLink];
      long long v14 = [v13 parameters];
      int v20 = 138412802;
      v21 = v10;
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "delegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v20, 0x20u);
    }
    long long v15 = [(ICQUpgradeOfferView *)self delegate];
    double v16 = [(ICQUpgradeOfferView *)self bottomLink];
    uint64_t v17 = [v16 action];
    double v18 = [(ICQUpgradeOfferView *)self bottomLink];
    double v19 = [v18 parameters];
    [v15 sender:self action:v17 parameters:v19];
  }
}

- (id)messageParagraphStyle
{
  v2 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  v3 = [MEMORY[0x263F81658] defaultParagraphStyle];
  unint64_t v4 = (void *)[v3 mutableCopy];

  [v4 setAlignment:1];
  [v2 scaledValueForValue:8.0];
  objc_msgSend(v4, "setParagraphSpacing:");
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)messageAttributes
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = *MEMORY[0x263F814F0];
  v3 = [(ICQUpgradeOfferView *)self messageFont];
  v9[0] = v3;
  v8[1] = *MEMORY[0x263F81500];
  unint64_t v4 = [(ICQUpgradeOfferView *)self messageTextColor];
  v9[1] = v4;
  v8[2] = *MEMORY[0x263F81540];
  id v5 = [(ICQUpgradeOfferView *)self messageParagraphStyle];
  v9[2] = v5;
  char v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)fineprintParagraphStyle
{
  v2 = [MEMORY[0x263F81658] defaultParagraphStyle];
  v3 = (void *)[v2 mutableCopy];

  [v3 setAlignment:1];
  [v3 setLineSpacing:0.0];
  unint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (id)fineprintAttributes
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = *MEMORY[0x263F814F0];
  v3 = [(ICQUpgradeOfferView *)self fineprintFont];
  v9[0] = v3;
  v8[1] = *MEMORY[0x263F81500];
  unint64_t v4 = [(ICQUpgradeOfferView *)self fineprintColor];
  v9[1] = v4;
  v8[2] = *MEMORY[0x263F81540];
  id v5 = [(ICQUpgradeOfferView *)self fineprintParagraphStyle];
  v9[2] = v5;
  char v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (_ICQUpgradeOfferPageSpecification)upgradeOfferPageSpecification
{
  return self->_upgradeOfferPageSpecification;
}

- (id)_imageForGenericCloud
{
  v2 = [MEMORY[0x263F827E8] icqBundleImageNamed:@"iCloudImage"];
  v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 scale];
  unint64_t v4 = objc_msgSend(v2, "_applicationIconImageForFormat:precomposed:scale:", 2, 0);

  return v4;
}

- (id)_imageForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 length]
    || ([v4 isEqualToString:@"com.apple.iCloudDriveApp"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.DocumentsApp"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.__mobilebackup__"] & 1) != 0
    || [v4 isEqualToString:@"com.apple.Preferences"])
  {
    id v5 = [(ICQUpgradeOfferView *)self _imageForGenericCloud];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F827E8];
    uint64_t v8 = [MEMORY[0x263F82B60] mainScreen];
    [v8 scale];
    id v5 = objc_msgSend(v7, "_applicationIconImageForBundleIdentifier:format:scale:", v4, 2);
  }
  return v5;
}

- (void)setUpgradeOfferPageSpecification:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = (_ICQUpgradeOfferPageSpecification *)a3;
  p_upgradeOfferPageSpecification = &self->_upgradeOfferPageSpecification;
  if (self->_upgradeOfferPageSpecification != v5)
  {
    objc_storeStrong((id *)&self->_upgradeOfferPageSpecification, a3);
    id v7 = [(_ICQUpgradeOfferPageSpecification *)v5 iconBundleIdentifier];
    uint64_t v8 = [(ICQUpgradeOfferView *)self _imageForBundleIdentifier:v7];
    [(UIImageView *)self->_iconView setImage:v8];

    uint64_t v9 = [(UIImageView *)self->_iconView image];

    if (v9)
    {
      iconView = self->_iconView;
      uint64_t v11 = 0;
    }
    else
    {
      long long v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = [(_ICQUpgradeOfferPageSpecification *)v5 iconBundleIdentifier];
        int v40 = 138412290;
        v41 = v13;
        _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "no image available for bundle id %@", (uint8_t *)&v40, 0xCu);
      }
      iconView = self->_iconView;
      uint64_t v11 = 1;
    }
    [(UIImageView *)iconView setHidden:v11];
    long long v14 = [(_ICQUpgradeOfferPageSpecification *)v5 title];
    [(UILabel *)self->_titleLabel setText:v14];

    long long v15 = [(ICQUpgradeOfferView *)self messageAttributes];
    [(_ICQTextView *)self->_messageView setAttributes:v15];

    double v16 = (void *)MEMORY[0x263F88928];
    uint64_t v17 = [(_ICQUpgradeOfferPageSpecification *)*p_upgradeOfferPageSpecification message];
    double v18 = [(_ICQUpgradeOfferPageSpecification *)*p_upgradeOfferPageSpecification altMessage];
    double v19 = [v16 stringWithPlaceholderFormat:v17 alternateString:v18];
    [(_ICQTextView *)self->_messageView setFormat:v19];

    int v20 = [(_ICQTextView *)self->_messageView format];
    v21 = [(_ICQUpgradeOfferPageSpecification *)*p_upgradeOfferPageSpecification altMessage];
    LODWORD(v18) = [v20 isEqualToString:v21];

    __int16 v22 = *p_upgradeOfferPageSpecification;
    if (v18) {
      [(_ICQUpgradeOfferPageSpecification *)v22 altMessageLinks];
    }
    else {
    v23 = [(_ICQUpgradeOfferPageSpecification *)v22 messageLinks];
    }
    [(_ICQTextView *)self->_messageView setLinks:v23];

    [(_ICQTextView *)self->_messageView setAttributedText];
    [(_ICQTextView *)self->_messageView layoutIfNeeded];
    __int16 v24 = [(_ICQUpgradeOfferPageSpecification *)v5 purchaseLink];
    purchaseLink = self->_purchaseLink;
    self->_purchaseLink = v24;

    uint64_t v26 = [(_ICQUpgradeOfferPageSpecification *)v5 purchase2Link];
    purchase2Link = self->_purchase2Link;
    self->_purchase2Link = v26;

    v28 = [(_ICQUpgradeOfferPageSpecification *)v5 bottomLink];
    bottomLink = self->_bottomLink;
    self->_bottomLink = v28;

    purchaseButton = self->_purchaseButton;
    uint64_t v31 = [(ICQLink *)self->_purchaseLink text];
    [(UIButton *)purchaseButton setTitle:v31 forState:0];

    purchase2Button = self->_purchase2Button;
    uint64_t v33 = [(ICQLink *)self->_purchase2Link text];
    [(UIButton *)purchase2Button setTitle:v33 forState:0];

    bottomButton = self->_bottomButton;
    v35 = [(ICQLink *)self->_bottomLink text];
    [(UIButton *)bottomButton setTitle:v35 forState:0];

    v36 = [(ICQUpgradeOfferView *)self fineprintAttributes];
    [(_ICQTextView *)self->_fineprintView setAttributes:v36];

    v37 = [(_ICQUpgradeOfferPageSpecification *)*p_upgradeOfferPageSpecification fineprintFormat];
    [(_ICQTextView *)self->_fineprintView setFormat:v37];

    v38 = [(_ICQUpgradeOfferPageSpecification *)*p_upgradeOfferPageSpecification fineprintLinks];
    [(_ICQTextView *)self->_fineprintView setLinks:v38];

    [(_ICQTextView *)self->_fineprintView setAttributedText];
    [(_ICQTextView *)self->_fineprintView layoutIfNeeded];
    v39 = [(ICQUpgradeOfferView *)self buttonTintColor];
    [(ICQUpgradeOfferView *)self _setButtonTintColor:v39];

    [(ICQUpgradeOfferView *)self setNeedsUpdateConstraints];
  }
}

- (void)setUpgradeMode:(int64_t)a3
{
  if (self->_upgradeMode != a3)
  {
    self->_upgradeMode = a3;
    if (a3 == 1)
    {
      -[UIButton setHidden:](self->_purchaseButton, "setHidden:");
      [(UIButton *)self->_purchase2Button setHidden:1];
      [(UIButton *)self->_bottomButton setHidden:1];
      [(UIActivityIndicatorView *)self->_spinner setHidden:0];
      [(UIActivityIndicatorView *)self->_spinner startAnimating];
    }
    else if (!a3)
    {
      -[UIButton setHidden:](self->_purchaseButton, "setHidden:");
      [(UIButton *)self->_purchase2Button setHidden:0];
      [(UIButton *)self->_bottomButton setHidden:0];
      [(UIActivityIndicatorView *)self->_spinner setHidden:1];
      [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    }
    [(ICQUpgradeOfferView *)self setNeedsUpdateConstraints];
  }
}

- (id)horizontalConstraintsForView:(id)a3 margin:(double)a4
{
  v25[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 isHidden])
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v23 = [v6 centerXAnchor];
    __int16 v24 = [v6 superview];
    __int16 v22 = [v24 centerXAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v25[0] = v21;
    double v19 = [v6 widthAnchor];
    int v20 = [(ICQUpgradeOfferView *)self readableContentGuide];
    double v18 = [v20 widthAnchor];
    uint64_t v17 = [v19 constraintLessThanOrEqualToAnchor:v18];
    v25[1] = v17;
    uint64_t v8 = [v6 leftAnchor];
    uint64_t v9 = [v6 superview];
    uint64_t v10 = [v9 leftAnchor];
    uint64_t v11 = [v8 constraintGreaterThanOrEqualToAnchor:v10 constant:a4];
    v25[2] = v11;
    long long v12 = [v6 rightAnchor];
    long long v13 = [v6 superview];
    long long v14 = [v13 rightAnchor];
    long long v15 = [v12 constraintLessThanOrEqualToAnchor:v14 constant:-a4];
    v25[3] = v15;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  }
  return v7;
}

- (id)_constraintsForView:(id)a3 equalToView:(id)a4
{
  v21[4] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  int v20 = [v6 centerXAnchor];
  double v19 = [v5 centerXAnchor];
  double v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  id v7 = [v6 widthAnchor];
  uint64_t v8 = [v5 widthAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  v21[1] = v9;
  uint64_t v10 = [v6 centerYAnchor];
  uint64_t v11 = [v5 centerYAnchor];
  long long v12 = [v10 constraintEqualToAnchor:v11];
  v21[2] = v12;
  long long v13 = [v6 heightAnchor];

  long long v14 = [v5 heightAnchor];

  long long v15 = [v13 constraintEqualToAnchor:v14];
  v21[3] = v15;
  double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];

  return v16;
}

- (void)updateConstraints
{
  uint64_t v148 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F08938] deactivateConstraints:self->_activeConstraints];
  v3 = [MEMORY[0x263EFF980] array];
  char v4 = [(UIImageView *)self->_iconView isHidden];
  id v5 = [(ICQUpgradeOfferView *)self _constraintsForView:self->_scrollView equalToView:self];
  [v3 addObjectsFromArray:v5];

  id v6 = [(ICQUpgradeOfferView *)self _constraintsForView:self->_blurBackdrop equalToView:self->_trayView];
  [v3 addObjectsFromArray:v6];

  id v7 = [(UIView *)self->_trayView centerXAnchor];
  uint64_t v8 = [(ICQUpgradeOfferView *)self centerXAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  [v3 addObject:v9];

  uint64_t v10 = [(UIView *)self->_trayView widthAnchor];
  uint64_t v11 = [(ICQUpgradeOfferView *)self widthAnchor];
  long long v12 = [v10 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  long long v13 = [(UIView *)self->_trayView bottomAnchor];
  long long v14 = [(ICQUpgradeOfferView *)self bottomAnchor];
  long long v15 = [v13 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  double v16 = [(UIView *)self->_contentView centerXAnchor];
  uint64_t v17 = [(UIScrollView *)self->_scrollView centerXAnchor];
  double v18 = [v16 constraintEqualToAnchor:v17];
  [v3 addObject:v18];

  double v19 = [(UIView *)self->_contentView widthAnchor];
  int v20 = [(UIScrollView *)self->_scrollView widthAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v3 addObject:v21];

  char v135 = v4;
  if ((v4 & 1) == 0)
  {
    __int16 v22 = [(UIImageView *)self->_iconView centerXAnchor];
    v23 = [(UIView *)self->_contentView centerXAnchor];
    __int16 v24 = [v22 constraintEqualToAnchor:v23];
    [v3 addObject:v24];
  }
  v25 = -[ICQUpgradeOfferView horizontalConstraintsForView:margin:](self, "horizontalConstraintsForView:margin:", self->_titleLabel, 24.0, 440);
  [v3 addObjectsFromArray:v25];

  uint64_t v26 = [(ICQUpgradeOfferView *)self horizontalConstraintsForView:self->_messageView margin:24.0];
  [v3 addObjectsFromArray:v26];

  uint64_t v27 = [(ICQUpgradeOfferView *)self horizontalConstraintsForView:self->_fineprintView margin:24.0];
  [v3 addObjectsFromArray:v27];

  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  v28 = [(ICQUpgradeOfferView *)self _buttons];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v142 objects:v147 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v143;
    double v32 = *MEMORY[0x263F83818];
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v143 != v31) {
          objc_enumerationMutation(v28);
        }
        v34 = *(void **)(*((void *)&v142 + 1) + 8 * i);
        [(ICQUpgradeOfferView *)self _marginForButton:v34];
        v35 = -[ICQUpgradeOfferView horizontalConstraintsForView:margin:](self, "horizontalConstraintsForView:margin:", v34);
        [v3 addObjectsFromArray:v35];

        v36 = [v34 widthAnchor];
        v37 = [v36 constraintEqualToConstant:v32];
        [v3 addObject:v37];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v142 objects:v147 count:16];
    }
    while (v30);
  }

  v38 = [(UILayoutGuide *)self->_scrollVisibleLayoutGuide topAnchor];
  v39 = [(ICQUpgradeOfferView *)self safeAreaLayoutGuide];
  int v40 = [v39 topAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v3 addObject:v41];

  uint64_t v42 = [(UILayoutGuide *)self->_scrollVisibleLayoutGuide bottomAnchor];
  v43 = [(UIView *)self->_trayView topAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [v3 addObject:v44];

  v45 = [(UIView *)self->_contentView heightAnchor];
  v46 = [(UILayoutGuide *)self->_scrollVisibleLayoutGuide heightAnchor];
  v47 = [v45 constraintGreaterThanOrEqualToAnchor:v46];
  [v3 addObject:v47];

  v48 = [(UIView *)self->_headerView topAnchor];
  v49 = [(UIView *)self->_contentView topAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  [v3 addObject:v50];

  uint64_t v51 = [(UIView *)self->_footerView bottomAnchor];
  v52 = [(UIView *)self->_contentView bottomAnchor];
  v53 = [v51 constraintEqualToAnchor:v52];
  [v3 addObject:v53];

  objc_super v54 = [(UIView *)self->_headerView heightAnchor];
  v55 = [(UIView *)self->_footerView heightAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  [v3 addObject:v56];

  if (v135)
  {
    v57 = [(UILabel *)self->_titleLabel topAnchor];
    v58 = [(UIView *)self->_headerView bottomAnchor];
    double v59 = 36.0;
  }
  else
  {
    v60 = [*(id *)((char *)&self->super.super.super.super.isa + v133) topAnchor];
    v61 = [(UIView *)self->_headerView bottomAnchor];
    v62 = [v60 constraintEqualToAnchor:v61 constant:12.0];
    [v3 addObject:v62];

    v57 = [(UILabel *)self->_titleLabel topAnchor];
    v58 = [*(id *)((char *)&self->super.super.super.super.isa + v133) bottomAnchor];
    double v59 = 20.0;
  }
  v63 = [v57 constraintEqualToAnchor:v58 constant:v59];
  [v3 addObject:v63];

  v64 = [(_ICQTextView *)self->_messageView topAnchor];
  v65 = [(UILabel *)self->_titleLabel bottomAnchor];
  v66 = [v64 constraintEqualToAnchor:v65 constant:15.0];
  [v3 addObject:v66];

  v67 = [(UIView *)self->_footerView topAnchor];
  v68 = [(_ICQTextView *)self->_messageView bottomAnchor];
  v69 = [v67 constraintEqualToAnchor:v68 constant:15.0];
  [v3 addObject:v69];

  v70 = [(_ICQTextView *)self->_fineprintView text];
  uint64_t v71 = [v70 length];

  p_super = self->_trayView;
  if (v71)
  {
    v73 = [(_ICQTextView *)self->_fineprintView topAnchor];
    v74 = [(UIView *)self->_trayView topAnchor];
    v75 = [v73 constraintEqualToAnchor:v74 constant:11.0];
    [v3 addObject:v75];

    v76 = self->_fineprintView;
    p_super = &v76->super.super.super;
  }
  v77 = [(ICQUpgradeOfferView *)self _buttons];
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  uint64_t v78 = [v77 countByEnumeratingWithState:&v138 objects:v146 count:16];
  v134 = v77;
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v136 = *(void *)v139;
    do
    {
      uint64_t v80 = 0;
      v81 = p_super;
      do
      {
        if (*(void *)v139 != v136) {
          objc_enumerationMutation(v77);
        }
        v82 = *(void **)(*((void *)&v138 + 1) + 8 * v80);
        v83 = [(ICQUpgradeOfferView *)self _anchorForLowerView:v82];
        v84 = [(ICQUpgradeOfferView *)self _anchorForUpperView:v81];
        [(ICQUpgradeOfferView *)self _spacingFromUpperView:v81 toLowerView:v82];
        v85 = objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84);
        [v3 addObject:v85];

        if ([(ICQUpgradeOfferView *)self _styleOfView:v82] == 2)
        {
          v86 = [v82 heightAnchor];
          v87 = [v86 constraintGreaterThanOrEqualToConstant:50.0];
          [v3 addObject:v87];

          v88 = [v82 titleLabel];
          v89 = [v88 topAnchor];
          v90 = [v82 topAnchor];
          v91 = [v89 constraintGreaterThanOrEqualToAnchor:v90 constant:14.0];
          [v3 addObject:v91];

          v92 = [v82 bottomAnchor];
          v93 = [v82 titleLabel];
          v94 = [v93 bottomAnchor];
          v95 = [v92 constraintGreaterThanOrEqualToAnchor:v94 constant:14.0];
          [v3 addObject:v95];

          v96 = [v82 titleLabel];
          v97 = [v96 leftAnchor];
          v98 = [v82 leftAnchor];
          v99 = [v97 constraintGreaterThanOrEqualToAnchor:v98 constant:16.0];
          [v3 addObject:v99];

          v100 = [v82 rightAnchor];
          v101 = [v82 titleLabel];
          v102 = [v101 rightAnchor];
          v103 = [v100 constraintGreaterThanOrEqualToAnchor:v102 constant:16.0];
          [v3 addObject:v103];

          v77 = v134;
        }
        p_super = v82;

        ++v80;
        v81 = p_super;
      }
      while (v79 != v80);
      uint64_t v79 = [v77 countByEnumeratingWithState:&v138 objects:v146 count:16];
    }
    while (v79);
  }
  if (p_super != self->_trayView)
  {
    -[ICQUpgradeOfferView _spacingFromUpperView:toLowerView:](self, "_spacingFromUpperView:toLowerView:", p_super);
    double v105 = v104;
    [(ICQUpgradeOfferView *)self safeAreaInsets];
    double v107 = v105 + v106;
    v108 = [(UIView *)self->_trayView bottomAnchor];
    v109 = [(ICQUpgradeOfferView *)self _anchorForUpperView:p_super];
    v110 = [v108 constraintEqualToAnchor:v109 constant:v107];
    [v3 addObject:v110];
  }
  if ((-[UIActivityIndicatorView isHidden](self->_spinner, "isHidden") & 1) == 0 && [v77 count])
  {
    v111 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
    v112 = [(UIView *)self->_trayView centerXAnchor];
    v113 = [v111 constraintEqualToAnchor:v112];
    [v3 addObject:v113];

    v114 = [(UILayoutGuide *)self->_aboveSpinnerLayoutGuide topAnchor];
    v115 = [v77 firstObject];
    v116 = [v115 topAnchor];
    v117 = [v114 constraintEqualToAnchor:v116];
    [v3 addObject:v117];

    v118 = [(UILayoutGuide *)self->_aboveSpinnerLayoutGuide bottomAnchor];
    v119 = [(UIActivityIndicatorView *)self->_spinner topAnchor];
    v120 = [v118 constraintEqualToAnchor:v119];
    [v3 addObject:v120];

    v121 = [(UILayoutGuide *)self->_belowSpinnerLayoutGuide topAnchor];
    v122 = [(UIActivityIndicatorView *)self->_spinner bottomAnchor];
    v123 = [v121 constraintEqualToAnchor:v122];
    [v3 addObject:v123];

    v124 = [(UILayoutGuide *)self->_belowSpinnerLayoutGuide bottomAnchor];
    v125 = [v134 lastObject];
    v126 = [(ICQUpgradeOfferView *)self _anchorForUpperView:v125];
    v127 = [v124 constraintEqualToAnchor:v126];
    [v3 addObject:v127];

    v128 = [(UILayoutGuide *)self->_aboveSpinnerLayoutGuide heightAnchor];
    v77 = v134;
    v129 = [(UILayoutGuide *)self->_belowSpinnerLayoutGuide heightAnchor];
    v130 = [v128 constraintEqualToAnchor:v129];
    [v3 addObject:v130];
  }
  v131 = (NSArray *)[v3 copy];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v131;

  [MEMORY[0x263F08938] activateConstraints:self->_activeConstraints];
  v137.receiver = self;
  v137.super_class = (Class)ICQUpgradeOfferView;
  [(ICQUpgradeOfferView *)&v137 updateConstraints];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)ICQUpgradeOfferView;
  [(ICQUpgradeOfferView *)&v19 layoutSubviews];
  [(UIView *)self->_contentView frame];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v3, v4);
  [(UIScrollView *)self->_scrollView scrollIndicatorInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self->_trayView frame];
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v6, v8, v11, v10);
  [(UIScrollView *)self->_scrollView contentInset];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(UIView *)self->_trayView frame];
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v13, v15, v18, v17);
  [(ICQUpgradeOfferView *)self _updateTrayVisibility];
  [(ICQUpgradeOfferView *)self flashScrollIndicatorsIfNeeded];
}

- (void)flashScrollIndicatorsIfNeeded
{
  [(UIScrollView *)self->_scrollView contentInset];
  double v4 = v3;
  double v6 = v5;
  [(UIScrollView *)self->_scrollView contentSize];
  double v8 = v7;
  [(UIScrollView *)self->_scrollView frame];
  if (v8 > v9 - v6 - v4)
  {
    scrollView = self->_scrollView;
    [(UIScrollView *)scrollView flashScrollIndicators];
  }
}

- (void)_updateTrayVisibility
{
  scrollView = self->_scrollView;
  [(UIView *)self->_trayView bounds];
  -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", self->_trayView);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(_ICQTextView *)self->_messageView frame];
  double MaxY = CGRectGetMaxY(v16);
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  BOOL v13 = MaxY <= CGRectGetMinY(v17);
  blurBackdrop = self->_blurBackdrop;
  [(UIVisualEffectView *)blurBackdrop setHidden:v13];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = [v6 links];
    unint64_t v9 = [v7 icqIndex];
    if (v9 > 0x7FFFFFFFFFFFFFFELL) {
      goto LABEL_23;
    }
    unint64_t v10 = v9;
    if (v9 >= [v8 count]) {
      goto LABEL_23;
    }
    CGFloat v11 = [v8 objectAtIndexedSubscript:v10];
    if ([v11 action] != 6)
    {
      BOOL v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = [v11 text];
        [v11 action];
        CGRect v16 = _ICQStringForAction();
        int v24 = 138412546;
        v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = v16;
        _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "tapped %@, but link action %@ unsupported in ICQTextView", (uint8_t *)&v24, 0x16u);
      }
      goto LABEL_22;
    }
    double v12 = [v11 parameters];
    BOOL v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F88820]];

    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v14 = [NSURL URLWithString:v13];
        if (!v14)
        {
LABEL_19:
          double v14 = _ICQGetLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = [v11 text];
            v21 = (objc_class *)objc_opt_class();
            __int16 v22 = NSStringFromClass(v21);
            int v24 = 138412546;
            v25 = v20;
            __int16 v26 = 2112;
            uint64_t v27 = v22;
            _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "tapped %@, but URL of wrong class %@", (uint8_t *)&v24, 0x16u);
          }
          goto LABEL_21;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_19;
        }
        double v14 = v13;
      }
      double v18 = _ICQGetLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v19 = [v11 text];
        int v24 = 138412546;
        v25 = v19;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        _os_log_impl(&dword_22C821000, v18, OS_LOG_TYPE_DEFAULT, "tapped %@, opening URL %@", (uint8_t *)&v24, 0x16u);
      }
      CGRect v17 = [MEMORY[0x263F82438] sharedApplication];
      [v17 openURL:v14 options:MEMORY[0x263EFFA78] completionHandler:&__block_literal_global_5];
    }
    else
    {
      double v14 = _ICQGetLogSystem();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:

LABEL_22:
LABEL_23:

        goto LABEL_24;
      }
      CGRect v17 = [v11 text];
      int v24 = 138412290;
      v25 = v17;
      _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "tapped %@, but URL missing", (uint8_t *)&v24, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_24:

  return 0;
}

void __62__ICQUpgradeOfferView_textView_shouldInteractWithURL_inRange___block_invoke(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  double v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "openURL success:%d", (uint8_t *)v4, 8u);
  }
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (int64_t)upgradeMode
{
  return self->_upgradeMode;
}

- (ICQPageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQPageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (_ICQTextView)messageView
{
  return self->_messageView;
}

- (void)setMessageView:(id)a3
{
}

- (_ICQTextView)fineprintView
{
  return self->_fineprintView;
}

- (void)setFineprintView:(id)a3
{
}

- (UIButton)purchaseButton
{
  return self->_purchaseButton;
}

- (void)setPurchaseButton:(id)a3
{
}

- (UIButton)purchase2Button
{
  return self->_purchase2Button;
}

- (void)setPurchase2Button:(id)a3
{
}

- (UIButton)bottomButton
{
  return self->_bottomButton;
}

- (void)setBottomButton:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (ICQLink)purchaseLink
{
  return self->_purchaseLink;
}

- (ICQLink)purchase2Link
{
  return self->_purchase2Link;
}

- (ICQLink)bottomLink
{
  return self->_bottomLink;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (UIView)trayView
{
  return self->_trayView;
}

- (UIVisualEffectView)blurBackdrop
{
  return self->_blurBackdrop;
}

- (UILayoutGuide)scrollVisibleLayoutGuide
{
  return self->_scrollVisibleLayoutGuide;
}

- (UILayoutGuide)aboveSpinnerLayoutGuide
{
  return self->_aboveSpinnerLayoutGuide;
}

- (UILayoutGuide)belowSpinnerLayoutGuide
{
  return self->_belowSpinnerLayoutGuide;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_belowSpinnerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_aboveSpinnerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_scrollVisibleLayoutGuide, 0);
  objc_storeStrong((id *)&self->_blurBackdrop, 0);
  objc_storeStrong((id *)&self->_trayView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_bottomLink, 0);
  objc_storeStrong((id *)&self->_purchase2Link, 0);
  objc_storeStrong((id *)&self->_purchaseLink, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_bottomButton, 0);
  objc_storeStrong((id *)&self->_purchase2Button, 0);
  objc_storeStrong((id *)&self->_purchaseButton, 0);
  objc_storeStrong((id *)&self->_fineprintView, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_upgradeOfferPageSpecification, 0);
}

@end