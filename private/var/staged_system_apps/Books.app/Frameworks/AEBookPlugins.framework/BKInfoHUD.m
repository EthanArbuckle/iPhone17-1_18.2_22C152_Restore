@interface BKInfoHUD
- (BKInfoHUD)initWithFrame:(CGRect)a3;
- (BKInfoHUDDelegate)delegate;
- (BOOL)accessibilityActivate;
- (BOOL)isInterfaceRTL;
- (BOOL)usesMonospacedDigitFont;
- (NSLayoutConstraint)iconImageViewWidthAnchor;
- (NSLayoutConstraint)textLabelTrailingAnchor;
- (NSString)currentSymbolName;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (id)_compositingFilterToUse;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)infoText;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateImageAndTextConstraints;
- (void)constructViews;
- (void)forceReflowText;
- (void)setCurrentSymbolName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconImageViewWidthAnchor:(id)a3;
- (void)setIconSymbol:(id)a3;
- (void)setInfoText:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTextLabelTrailingAnchor:(id)a3;
- (void)setUsesMonospacedDigitFont:(BOOL)a3;
- (void)tapGestureHandler:(id)a3;
- (void)updateLabelFont;
@end

@implementation BKInfoHUD

- (BKInfoHUD)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKInfoHUD;
  v3 = -[BKInfoHUD initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = v3;
  if (v3)
  {
    [(BKInfoHUD *)v3 constructViews];
    v5 = +[UITraitCollection bc_allAPITraits];
    id v6 = [(BKInfoHUD *)v4 registerForTraitChanges:v5 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (self->_textLabel)
  {
    v7 = [(BKInfoHUD *)self _compositingFilterToUse];
    objc_super v8 = +[CAFilter filterWithType:v7];
    v9 = [(UILabel *)self->_textLabel layer];
    [v9 setCompositingFilter:v8];
  }
  if (self->_iconImageView)
  {
    v10 = [(BKInfoHUD *)self _compositingFilterToUse];
    v11 = +[CAFilter filterWithType:v10];
    v12 = [(UIImageView *)self->_iconImageView layer];
    [v12 setCompositingFilter:v11];
  }
  v13 = [(BKInfoHUD *)self currentSymbolName];
  id v14 = [v13 length];

  if (v14)
  {
    v15 = [(BKInfoHUD *)self currentSymbolName];
    [(BKInfoHUD *)self setIconSymbol:v15];
  }
}

- (void)setInfoText:(id)a3
{
  textLabel = self->_textLabel;
  id v5 = a3;
  [(UILabel *)textLabel setText:v5];
  [(UILabel *)self->_textLabel setAccessibilityValue:v5];

  [(BKInfoHUD *)self setNeedsUpdateConstraints];
}

- (id)infoText
{
  return [(UILabel *)self->_textLabel text];
}

- (void)forceReflowText
{
  id v3 = [(UILabel *)self->_textLabel text];
  [(UILabel *)self->_textLabel setText:&stru_1DF0D8];
  [(UILabel *)self->_textLabel setText:v3];
  [(BKInfoHUD *)self setNeedsUpdateConstraints];
}

- (void)setIconSymbol:(id)a3
{
  id v10 = a3;
  [(BKInfoHUD *)self setCurrentSymbolName:v10];
  v4 = +[UIFont systemFontOfSize:15.0 weight:UIFontWeightSemibold];
  id v5 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleHeadline];
  iconImageView = self->_iconImageView;
  if (v10)
  {
    v7 = [v5 scaledFontForFont:v4];
    objc_super v8 = +[UIImageSymbolConfiguration configurationWithFont:v7];
    v9 = +[UIImage systemImageNamed:v10 withConfiguration:v8];
    [(UIImageView *)iconImageView setImage:v9];
  }
  else
  {
    [(UIImageView *)iconImageView setImage:0];
  }
  [(BKInfoHUD *)self _updateImageAndTextConstraints];
  [(BKInfoHUD *)self setNeedsUpdateConstraints];
}

- (void)updateLabelFont
{
  id v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [v4 _scaledValueForValue:15.0];
  if (self->_usesMonospacedDigitFont) {
    +[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:");
  }
  else {
  id v3 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  }
  [(UILabel *)self->_textLabel setFont:v3];
}

- (id)_compositingFilterToUse
{
  v2 = [(BKInfoHUD *)self traitCollection];
  id v3 = (char *)[v2 userInterfaceStyle];
  id v4 = (id *)&kCAFilterPlusL;
  if (v3 != (unsigned char *)&dword_0 + 2) {
    id v4 = (id *)&kCAFilterPlusD;
  }
  id v5 = *v4;

  return v5;
}

- (void)constructViews
{
  if (!self->_backgroundView)
  {
    id v3 = +[UIBlurEffect effectWithStyle:7];
    id v4 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v3];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    [(UIVisualEffectView *)self->_backgroundView setContentMode:0];
    [(UIVisualEffectView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [(UIVisualEffectView *)self->_backgroundView layer];
    [v6 setCornerRadius:8.0];

    v7 = [(UIVisualEffectView *)self->_backgroundView layer];
    [v7 setMasksToBounds:1];

    [(BKInfoHUD *)self insertSubview:self->_backgroundView atIndex:0];
    objc_super v8 = [(UIVisualEffectView *)self->_backgroundView centerXAnchor];
    v9 = [(BKInfoHUD *)self centerXAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    v11 = [(UIVisualEffectView *)self->_backgroundView centerYAnchor];
    v12 = [(BKInfoHUD *)self centerYAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    id v14 = [(UIVisualEffectView *)self->_backgroundView widthAnchor];
    v15 = [(BKInfoHUD *)self widthAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(UIVisualEffectView *)self->_backgroundView heightAnchor];
    v18 = [(BKInfoHUD *)self heightAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];
  }
  if (!self->_iconImageView)
  {
    v20 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    iconImageView = self->_iconImageView;
    self->_iconImageView = v20;

    [(UIImageView *)self->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = +[UIColor bc_booksSecondaryLabelColor];
    [(UIImageView *)self->_iconImageView setTintColor:v22];

    v23 = AEBundle();
    v24 = [v23 localizedStringForKey:@"Toggle page chooser" value:&stru_1DF0D8 table:0];
    [(UIImageView *)self->_iconImageView setAccessibilityLabel:v24];

    v25 = self->_iconImageView;
    unint64_t v26 = (unint64_t)[(UIImageView *)v25 accessibilityTraits];
    [(UIImageView *)v25 setAccessibilityTraits:UIAccessibilityTraitButton | v26];
    [(UIImageView *)self->_iconImageView setIsAccessibilityElement:1];
    [(UIImageView *)self->_iconImageView setOpaque:0];
    v27 = [(BKInfoHUD *)self _compositingFilterToUse];
    v28 = +[CAFilter filterWithType:v27];
    v29 = [(UIImageView *)self->_iconImageView layer];
    [v29 setCompositingFilter:v28];

    [(UIImageView *)self->_iconImageView setContentMode:1];
    [(BKInfoHUD *)self addSubview:self->_iconImageView];
    v30 = [(UIImageView *)self->_iconImageView trailingAnchor];
    v31 = [(UIVisualEffectView *)self->_backgroundView trailingAnchor];
    v32 = [v30 constraintEqualToAnchor:v31 constant:-12.0];
    [v32 setActive:1];

    v33 = [(UIImageView *)self->_iconImageView centerYAnchor];
    v34 = [(UIVisualEffectView *)self->_backgroundView centerYAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v35 setActive:1];
  }
  if (!self->_textLabel)
  {
    v36 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    textLabel = self->_textLabel;
    self->_textLabel = v36;

    [(UILabel *)self->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BKInfoHUD *)self updateLabelFont];
    if ([(BKInfoHUD *)self isInterfaceRTL]) {
      uint64_t v38 = 0;
    }
    else {
      uint64_t v38 = 2;
    }
    [(UILabel *)self->_textLabel setTextAlignment:v38];
    v39 = +[UIColor bc_booksSecondaryLabelColor];
    [(UILabel *)self->_textLabel setTextColor:v39];

    [(UILabel *)self->_textLabel setOpaque:0];
    v40 = [(BKInfoHUD *)self _compositingFilterToUse];
    v41 = +[CAFilter filterWithType:v40];
    v42 = [(UILabel *)self->_textLabel layer];
    [v42 setCompositingFilter:v41];

    v43 = +[UIColor clearColor];
    [(UILabel *)self->_textLabel setBackgroundColor:v43];

    v44 = AEBundle();
    v45 = [v44 localizedStringForKey:@"Page" value:&stru_1DF0D8 table:0];
    [(UILabel *)self->_textLabel setAccessibilityLabel:v45];

    [(UILabel *)self->_textLabel setLineBreakMode:0];
    [(UILabel *)self->_textLabel setNumberOfLines:0];
    [(BKInfoHUD *)self addSubview:self->_textLabel];
    [(BKInfoHUD *)self _updateImageAndTextConstraints];
    v46 = [(UILabel *)self->_textLabel topAnchor];
    v47 = [(UIVisualEffectView *)self->_backgroundView topAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    [v48 setActive:1];

    v49 = [(UILabel *)self->_textLabel bottomAnchor];
    v50 = [(UIVisualEffectView *)self->_backgroundView bottomAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v51 setActive:1];
  }
  v52 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapGestureHandler:"];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v52;

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setCancelsTouchesInView:1];
  v54 = self->_tapGestureRecognizer;

  [(BKInfoHUD *)self addGestureRecognizer:v54];
}

- (void)_updateImageAndTextConstraints
{
  id v3 = [(UILabel *)self->_textLabel leadingAnchor];
  id v4 = [(UIVisualEffectView *)self->_backgroundView leadingAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4 constant:12.0];
  [v5 setActive:1];

  id v6 = [(BKInfoHUD *)self textLabelTrailingAnchor];

  if (!v6)
  {
    v7 = [(UILabel *)self->_textLabel trailingAnchor];
    objc_super v8 = [(UIImageView *)self->_iconImageView leadingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    [(BKInfoHUD *)self setTextLabelTrailingAnchor:v9];
  }
  id v10 = [(BKInfoHUD *)self iconImageViewWidthAnchor];

  if (!v10)
  {
    v11 = +[NSLayoutConstraint constraintWithItem:self->_iconImageView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    [(BKInfoHUD *)self setIconImageViewWidthAnchor:v11];
  }
  v12 = [(UIImageView *)self->_iconImageView image];
  if (v12) {
    double v13 = -5.0;
  }
  else {
    double v13 = 0.0;
  }
  id v14 = [(BKInfoHUD *)self textLabelTrailingAnchor];
  [v14 setConstant:v13];

  v15 = [(UIImageView *)self->_iconImageView image];
  [v15 size];
  double v17 = v16;
  v18 = [(BKInfoHUD *)self iconImageViewWidthAnchor];
  [v18 setConstant:v17];

  v19 = [(BKInfoHUD *)self textLabelTrailingAnchor];
  [v19 setActive:1];

  id v20 = [(BKInfoHUD *)self iconImageViewWidthAnchor];
  [v20 setActive:1];
}

- (void)tapGestureHandler:(id)a3
{
  id v4 = [(BKInfoHUD *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(BKInfoHUD *)self delegate];
    [v6 infoHUDTapped:self];
  }
}

- (void)setUsesMonospacedDigitFont:(BOOL)a3
{
  if (self->_usesMonospacedDigitFont != a3)
  {
    self->_usesMonospacedDigitFont = a3;
    [(BKInfoHUD *)self updateLabelFont];
  }
}

- (BOOL)isInterfaceRTL
{
  return (char *)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(BKInfoHUD *)self semanticContentAttribute]] == (char *)&dword_0 + 1;
}

- (id)accessibilityLabel
{
  return [(UILabel *)self->_textLabel accessibilityLabel];
}

- (id)accessibilityValue
{
  return [(UILabel *)self->_textLabel accessibilityValue];
}

- (id)accessibilityHint
{
  unsigned int v2 = [(BKInfoHUD *)self isUserInteractionEnabled];
  id v3 = AEBundle();
  id v4 = v3;
  if (v2) {
    CFStringRef v5 = @"Double tap to toggle page chooser";
  }
  else {
    CFStringRef v5 = @"Double tap to turn page";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1DF0D8 table:0];

  return v6;
}

- (BOOL)accessibilityActivate
{
  id v3 = [(BKInfoHUD *)self delegate];
  char v4 = objc_opt_respondsToSelector();
  if (v4)
  {
    unsigned int v5 = [(BKInfoHUD *)self isUserInteractionEnabled];

    if (!v5)
    {
      char v4 = 0;
      return v4 & 1;
    }
    id v3 = [(BKInfoHUD *)self delegate];
    [v3 infoHUDTapped:self];
  }

  return v4 & 1;
}

- (BOOL)usesMonospacedDigitFont
{
  return self->_usesMonospacedDigitFont;
}

- (BKInfoHUDDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKInfoHUDDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (NSLayoutConstraint)textLabelTrailingAnchor
{
  return self->_textLabelTrailingAnchor;
}

- (void)setTextLabelTrailingAnchor:(id)a3
{
}

- (NSLayoutConstraint)iconImageViewWidthAnchor
{
  return self->_iconImageViewWidthAnchor;
}

- (void)setIconImageViewWidthAnchor:(id)a3
{
}

- (NSString)currentSymbolName
{
  return self->_currentSymbolName;
}

- (void)setCurrentSymbolName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSymbolName, 0);
  objc_storeStrong((id *)&self->_iconImageViewWidthAnchor, 0);
  objc_storeStrong((id *)&self->_textLabelTrailingAnchor, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end