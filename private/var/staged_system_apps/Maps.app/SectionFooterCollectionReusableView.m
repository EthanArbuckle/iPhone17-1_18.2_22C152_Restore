@interface SectionFooterCollectionReusableView
+ (double)heightForFooterViewWithTraitCollection:(id)a3;
+ (id)_effectiveTraitCollectionWithTraitCollection:(id)a3;
+ (id)_fontWithTraitCollection:(id)a3;
+ (id)_maximumContentSizeCategory;
+ (id)reuseIdentifier;
- (MapsThemeButton)actionButton;
- (NSString)actionTitle;
- (SectionFooterCollectionReusableView)initWithFrame:(CGRect)a3;
- (id)actionHandler;
- (void)_didTapActionButton;
- (void)_updateFonts;
- (void)prepareForReuse;
- (void)setAccessibilityIdentifiersWithBaseString:(id)a3;
- (void)setActionButton:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setActionTitle:(id)a3 completionHandler:(id)a4;
@end

@implementation SectionFooterCollectionReusableView

- (SectionFooterCollectionReusableView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)SectionFooterCollectionReusableView;
  v3 = -[SectionFooterCollectionReusableView initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(SectionFooterCollectionReusableView *)v3 setBackgroundColor:v4];

    uint64_t v5 = +[MapsThemeButton buttonWithType:0];
    actionButton = v3->_actionButton;
    v3->_actionButton = (MapsThemeButton *)v5;

    [(MapsThemeButton *)v3->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsThemeButton *)v3->_actionButton setTitleColorProvider:&stru_1012E8C80];
    [(SectionFooterCollectionReusableView *)v3 _updateFonts];
    v7 = [(SectionFooterCollectionReusableView *)v3 actionButton];
    [v7 addTarget:v3 action:"_didTapActionButton" forControlEvents:64];

    [(SectionFooterCollectionReusableView *)v3 addSubview:v3->_actionButton];
    v18 = [(MapsThemeButton *)v3->_actionButton leadingAnchor];
    v8 = [(SectionFooterCollectionReusableView *)v3 leadingAnchor];
    v9 = [v18 constraintEqualToAnchor:v8 constant:16.0];
    v20[0] = v9;
    v10 = [(MapsThemeButton *)v3->_actionButton topAnchor];
    v11 = [(SectionFooterCollectionReusableView *)v3 topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v20[1] = v12;
    v13 = [(MapsThemeButton *)v3->_actionButton bottomAnchor];
    v14 = [(SectionFooterCollectionReusableView *)v3 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v20[2] = v15;
    v16 = +[NSArray arrayWithObjects:v20 count:3];
    +[NSLayoutConstraint activateConstraints:v16];
  }
  return v3;
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SectionFooterCollectionReusableView;
  [(SectionFooterCollectionReusableView *)&v4 prepareForReuse];
  v3 = [(SectionFooterCollectionReusableView *)self actionButton];
  [v3 setTitle:&stru_101324E70 forState:0];
}

- (void)_didTapActionButton
{
  v3 = [(SectionFooterCollectionReusableView *)self actionHandler];

  if (v3)
  {
    objc_super v4 = [(SectionFooterCollectionReusableView *)self actionHandler];
    v4[2]();
  }
}

- (void)_updateFonts
{
  v3 = objc_opt_class();
  objc_super v4 = [(SectionFooterCollectionReusableView *)self traitCollection];
  id v8 = [v3 _effectiveTraitCollectionWithTraitCollection:v4];

  uint64_t v5 = [(id)objc_opt_class() _fontWithTraitCollection:v8];
  v6 = [(SectionFooterCollectionReusableView *)self actionButton];
  v7 = [v6 titleLabel];
  [v7 setFont:v5];
}

+ (id)_effectiveTraitCollectionWithTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _maximumContentSizeCategory];
  v6 = [v4 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:0 maximumContentSizeCategory:v5];

  return v6;
}

+ (id)_fontWithTraitCollection:(id)a3
{
  return +[UIFont system15CompatibleWithTraitCollection:a3];
}

+ (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityLarge;
}

- (void)setAccessibilityIdentifiersWithBaseString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 stringByAppendingString:@"Section"];
  [(SectionFooterCollectionReusableView *)self setAccessibilityIdentifier:v5];

  id v7 = [v4 stringByAppendingString:@"Action"];

  v6 = [(SectionFooterCollectionReusableView *)self actionButton];
  [v6 setAccessibilityIdentifier:v7];
}

- (void)setActionTitle:(id)a3 completionHandler:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(SectionFooterCollectionReusableView *)self actionButton];
  [v7 setTitle:v6 forState:0];

  [(SectionFooterCollectionReusableView *)self setActionHandler:v8];
}

+ (double)heightForFooterViewWithTraitCollection:(id)a3
{
  v3 = [a3 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:0 maximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  id v4 = [(id)objc_opt_class() _fontWithTraitCollection:v3];
  [v3 _maps_displayScaleOrMainScreenScale];
  +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v4, 1);
  double v6 = v5 + 16.0;

  return v6;
}

- (MapsThemeButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);

  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end