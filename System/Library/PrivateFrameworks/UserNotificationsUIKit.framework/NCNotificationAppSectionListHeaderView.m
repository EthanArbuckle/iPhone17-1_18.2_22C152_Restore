@interface NCNotificationAppSectionListHeaderView
- (BOOL)adjustForContentSizeCategoryChange;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationAppSectionListHeaderViewDelegate)delegate;
- (NSArray)icons;
- (NSString)title;
- (unint64_t)_maximumNumberOfLinesForTitleText;
- (unint64_t)_numberOfLinesForTitleTextInFrame:(CGRect)a3;
- (void)_configureOptionsButtonIfNecessary;
- (void)_layoutIconImageView;
- (void)_layoutOptionsButton;
- (void)_layoutTitleLabel;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForTitleTextLabel;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)didTapOptionsButton:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setIcons:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCNotificationAppSectionListHeaderView

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  v4 = [(UILabel *)self->_titleLabel text];
  char v5 = [v4 isEqualToString:v10];

  if ((v5 & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (!titleLabel)
    {
      v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v8 = self->_titleLabel;
      self->_titleLabel = v7;

      [(NCNotificationAppSectionListHeaderView *)self addSubview:self->_titleLabel];
      titleLabel = self->_titleLabel;
    }
    [(UILabel *)titleLabel setText:v10];
    [(NCNotificationAppSectionListHeaderView *)self _updateTextAttributesForTitleTextLabel];
    v9 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
    [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_titleLabel style:0 visualStylingProvider:v9 outgoingProvider:0];
    [(NCNotificationAppSectionListHeaderView *)self setNeedsLayout];
  }
}

- (void)setIcons:(id)a3
{
  id v17 = a3;
  char v5 = [v17 firstObject];
  if (v5)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
    if (v5 == v3) {
      v6 = 0;
    }
    else {
      v6 = v5;
    }
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong((id *)&self->_lightIcon, v6);
  if (v5) {

  }
  if ((unint64_t)[v17 count] <= 1)
  {

    v8 = 0;
    v9 = 0;
    char v7 = 1;
  }
  else
  {
    char v7 = 1;
    v8 = [v17 objectAtIndexedSubscript:1];

    if (v8)
    {
      char v5 = [MEMORY[0x1E4F1CA98] null];
      char v7 = 0;
      if (v8 == v5) {
        v9 = 0;
      }
      else {
        v9 = v8;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  p_darkIcon = &self->_darkIcon;
  objc_storeStrong((id *)&self->_darkIcon, v9);
  if ((v7 & 1) == 0) {

  }
  v11 = [(NCNotificationAppSectionListHeaderView *)self traitCollection];
  if ([v11 userInterfaceStyle] != 2 || (lightIcon = *p_darkIcon) == 0) {
    lightIcon = self->_lightIcon;
  }
  objc_storeStrong((id *)&self->_icon, lightIcon);

  iconImageView = self->_iconImageView;
  if (!iconImageView)
  {
    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    v15 = self->_iconImageView;
    self->_iconImageView = v14;

    [(UIImageView *)self->_iconImageView setContentMode:1];
    [(NCNotificationAppSectionListHeaderView *)self addSubview:self->_iconImageView];
    iconImageView = self->_iconImageView;
  }
  [(UIImageView *)iconImageView setImage:self->_icon];
  v16 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfImageView:self->_iconImageView ifSymbolImageWithStyle:0 visualStylingProvider:v16 outgoingProvider:v16];
  [(NCNotificationAppSectionListHeaderView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(NCNotificationAppSectionListHeaderOptionsButton *)self->_optionsButton frame];
  double v6 = CGRectGetWidth(v14);
  titleLabel = self->_titleLabel;
  if (titleLabel) {
    -[UILabel unui_measuringHeightWithNumberOfLines:](titleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationAppSectionListHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, width + -22.0 + -6.0 - v6 + -8.0 + -10.0, height));
  }
  [(NCNotificationAppSectionListHeaderOptionsButton *)self->_optionsButton frame];
  CGRectGetHeight(v15);
  v8 = [(NCNotificationAppSectionListHeaderView *)self traitCollection];
  [v8 displayScale];
  UICeilToScale();
  double v10 = v9;

  double v11 = width;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationAppSectionListHeaderView;
  [(NCNotificationAppSectionListHeaderView *)&v3 layoutSubviews];
  [(NCNotificationAppSectionListHeaderView *)self _configureOptionsButtonIfNecessary];
  [(NCNotificationAppSectionListHeaderView *)self _layoutIconImageView];
  [(NCNotificationAppSectionListHeaderView *)self _layoutOptionsButton];
  [(NCNotificationAppSectionListHeaderView *)self _layoutTitleLabel];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationAppSectionListHeaderView;
  [(NCNotificationAppSectionListHeaderView *)&v7 traitCollectionDidChange:a3];
  v4 = [(NCNotificationAppSectionListHeaderView *)self traitCollection];
  int64_t v5 = [v4 userInterfaceStyle];

  if (self->_userInterfaceStyle != v5)
  {
    self->_userInterfaceStyle = v5;
    if (v5 != 2 || (lightIcon = self->_darkIcon) == 0) {
      lightIcon = self->_lightIcon;
    }
    objc_storeStrong((id *)&self->_icon, lightIcon);
    [(UIImageView *)self->_iconImageView setImage:self->_icon];
    [(NCNotificationAppSectionListHeaderView *)self setNeedsLayout];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationAppSectionListHeaderView;
  [(NCNotificationListBaseContentView *)&v5 adjustForContentSizeCategoryChange];
  [(NCNotificationAppSectionListHeaderOptionsButton *)self->_optionsButton removeFromSuperview];
  optionsButton = self->_optionsButton;
  self->_optionsButton = 0;

  [(NCNotificationAppSectionListHeaderView *)self _configureOptionsButtonIfNecessary];
  [(NCNotificationAppSectionListHeaderView *)self setNeedsLayout];
  return 1;
}

- (void)_layoutIconImageView
{
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    [(UIImageView *)iconImageView frame];
    [(NCNotificationAppSectionListHeaderView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    if ([(NCNotificationAppSectionListHeaderView *)self _shouldReverseLayoutDirection])
    {
      v14.origin.x = v5;
      v14.origin.y = v7;
      v14.size.double width = v9;
      v14.size.double height = v11;
      CGRectGetMaxX(v14);
    }
    [(NCNotificationAppSectionListHeaderView *)self bounds];
    UIRectCenteredYInRectScale();
    UIRectIntegralWithScale();
    double v12 = self->_iconImageView;
    -[UIImageView setFrame:](v12, "setFrame:");
  }
}

- (void)_layoutTitleLabel
{
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    [(NCNotificationAppSectionListHeaderView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    [(NCNotificationAppSectionListHeaderOptionsButton *)self->_optionsButton frame];
    double v12 = v9 - (CGRectGetWidth(v29) + 28.0 + 8.0 + 10.0);
    v30.origin.x = v5;
    v30.origin.y = v7;
    v30.size.double width = v9;
    v30.size.double height = v11;
    double Height = CGRectGetHeight(v30);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_titleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationAppSectionListHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v12, Height));
    int v14 = [(NCNotificationAppSectionListHeaderView *)self _shouldReverseLayoutDirection];
    [(UIImageView *)self->_iconImageView frame];
    if (v14) {
      CGRectGetMinX(*(CGRect *)&v15);
    }
    else {
      CGRectGetMaxX(*(CGRect *)&v15);
    }
    UIRectCenteredYInRectScale();
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_titleLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationAppSectionListHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v12, Height, 0));
    v31.origin.x = v20;
    v31.origin.y = v22;
    v31.size.double width = v24;
    v31.size.double height = v26;
    CGRectGetWidth(v31);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    UIRectIntegralWithScale();
    v27 = self->_titleLabel;
    -[UILabel setFrame:](v27, "setFrame:");
  }
}

- (void)_layoutOptionsButton
{
  optionsButton = self->_optionsButton;
  if (optionsButton)
  {
    [(NCNotificationAppSectionListHeaderOptionsButton *)optionsButton frame];
    [(NCNotificationAppSectionListHeaderView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    -[NCNotificationAppSectionListHeaderOptionsButton sizeThatFits:](self->_optionsButton, "sizeThatFits:", v8, v10);
    [(NCNotificationAppSectionListHeaderOptionsButton *)self->_optionsButton _setContinuousCornerRadius:v12 * 0.5];
    if (([(NCNotificationAppSectionListHeaderView *)self _shouldReverseLayoutDirection] & 1) == 0)
    {
      v15.origin.x = v5;
      v15.origin.y = v7;
      v15.size.double width = v9;
      v15.size.double height = v11;
      CGRectGetMaxX(v15);
    }
    [(NCNotificationAppSectionListHeaderView *)self bounds];
    UIRectCenteredYInRectScale();
    UIRectIntegralWithScale();
    v13 = self->_optionsButton;
    -[NCNotificationAppSectionListHeaderOptionsButton setFrame:](v13, "setFrame:");
  }
}

- (void)_configureOptionsButtonIfNecessary
{
  if (!self->_optionsButton)
  {
    objc_super v3 = (void *)MEMORY[0x1E4FB1830];
    double v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    id v11 = [v3 configurationWithFont:v4 scale:2];

    CGFloat v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis" withConfiguration:v11];
    double v6 = +[NCNotificationAppSectionListHeaderOptionsButton systemButtonWithImage:v5 target:self action:sel_didTapOptionsButton_];
    optionsButton = self->_optionsButton;
    self->_optionsButton = v6;

    double v8 = self->_optionsButton;
    CGFloat v9 = [MEMORY[0x1E4FB1618] blackColor];
    [(NCNotificationAppSectionListHeaderOptionsButton *)v8 setTintColor:v9];

    [(NCNotificationAppSectionListHeaderOptionsButton *)self->_optionsButton setAlpha:1.0];
    -[NCNotificationAppSectionListHeaderOptionsButton _setTouchInsets:](self->_optionsButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    double v10 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
    [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_optionsButton style:1 visualStylingProvider:v10 outgoingProvider:0];
    [(NCNotificationAppSectionListHeaderView *)self addSubview:self->_optionsButton];
  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  iconImageView = self->_iconImageView;
  id v8 = a5;
  id v9 = a3;
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfImageView:iconImageView ifSymbolImageWithStyle:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_titleLabel style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_optionsButton style:1 visualStylingProvider:v9 outgoingProvider:v8];
}

- (unint64_t)_maximumNumberOfLinesForTitleText
{
  v2 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v2)) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (unint64_t)_numberOfLinesForTitleTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  titleLabel = self->_titleLabel;
  unint64_t v9 = [(NCNotificationAppSectionListHeaderView *)self _maximumNumberOfLinesForTitleText];

  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", titleLabel, v9, x, y, width, height);
}

- (void)_updateTextAttributes
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationAppSectionListHeaderView;
  [(NCNotificationListBaseContentView *)&v3 _updateTextAttributes];
  [(NCNotificationAppSectionListHeaderView *)self _updateTextAttributesForTitleTextLabel];
}

- (void)_updateTextAttributesForTitleTextLabel
{
  if (self->_titleLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);
    CGFloat v5 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      CGFloat v5 = (id *)MEMORY[0x1E4FB2998];
    }
    id v6 = *v5;

    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:self->_titleLabel withTextStyle:v6 fontWeight:0 additionalTraits:[(NCNotificationAppSectionListHeaderView *)self _maximumNumberOfLinesForTitleText] maximumNumberOfLines:*MEMORY[0x1E4FB09E0]];
    [(NCNotificationAppSectionListHeaderView *)self setNeedsLayout];
  }
}

- (void)didTapOptionsButton:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationAppSectionListHeaderView *)self delegate];
  [v5 appSectionListHeaderView:self didRequestPresentingOptionsMenuFromView:v4];
}

- (NCNotificationAppSectionListHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationAppSectionListHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)icons
{
  return self->_icons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_optionsButton, 0);
  objc_storeStrong((id *)&self->_darkIcon, 0);
  objc_storeStrong((id *)&self->_lightIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end