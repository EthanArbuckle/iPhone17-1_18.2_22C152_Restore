@interface UserProfilePersonalizationLinkCell
+ (id)reuseIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (UIColor)glyphBackgroundColor;
- (UIColor)glyphTintColor;
- (UIImage)icon;
- (UIImageView)iconImageView;
- (UILabel)titleLabel;
- (UserProfileLink)userProfileLink;
- (UserProfilePersonalizationLinkCell)initWithFrame:(CGRect)a3;
- (id)_convertIconToImageWithBackground:(id)a3;
- (void)_updateConfiguration;
- (void)_updateFromUserProfileLinkModel;
- (void)setGlyphBackgroundColor:(id)a3;
- (void)setGlyphTintColor:(id)a3;
- (void)setIcon:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserProfileLink:(id)a3;
- (void)updateTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
@end

@implementation UserProfilePersonalizationLinkCell

- (UserProfilePersonalizationLinkCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UserProfilePersonalizationLinkCell;
  v3 = -[UserProfilePersonalizationLinkCell initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(UserProfilePersonalizationLinkCell *)v3 setAccessibilityIdentifier:v5];

    if (sub_1000BBB44(v3) == 5)
    {
      v6 = +[UIBackgroundConfiguration clearConfiguration];
      [(UserProfilePersonalizationLinkCell *)v3 setBackgroundConfiguration:v6];
    }
    uint64_t v7 = +[UIListContentConfiguration valueCellConfiguration];
    contentConfig = v3->_contentConfig;
    v3->_contentConfig = (UIListContentConfiguration *)v7;

    uint64_t v9 = +[UIColor systemWhiteColor];
    glyphTintColor = v3->_glyphTintColor;
    v3->_glyphTintColor = (UIColor *)v9;
  }
  return v3;
}

- (void)_updateConfiguration
{
  [(UIListContentConfiguration *)self->_contentConfig setPrefersSideBySideTextAndSecondaryText:1];
  v3 = +[UIColor systemWhiteColor];
  v4 = [(UIListContentConfiguration *)self->_contentConfig imageProperties];
  [v4 setTintColor:v3];

  v5 = [(UIListContentConfiguration *)self->_contentConfig imageProperties];
  [v5 setCornerRadius:15.0];

  [(UIListContentConfiguration *)self->_contentConfig setImageToTextPadding:10.0];
  -[UIListContentConfiguration setDirectionalLayoutMargins:](self->_contentConfig, "setDirectionalLayoutMargins:", 11.0, 16.0, 11.0, 16.0);
  [(UserProfilePersonalizationLinkCell *)self setContentConfiguration:self->_contentConfig];
  if (sub_1000BBB44(self) != 5)
  {
    id v6 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    id v8 = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:&v8 count:1];
    [(UserProfilePersonalizationLinkCell *)self setAccessories:v7];
  }
}

- (id)_convertIconToImageWithBackground:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(ImageIconWithBackgroundConfiguration);
  [(ImageIconWithBackgroundConfiguration *)v5 setBackgroundColor:self->_glyphBackgroundColor];
  id v6 = [(UserProfilePersonalizationLinkCell *)self glyphTintColor];
  [(ImageIconWithBackgroundConfiguration *)v5 setTintColor:v6];

  -[ImageIconWithBackgroundConfiguration setIconSize:](v5, "setIconSize:", 30.0, 30.0);
  uint64_t v7 = [v4 _maps_imageIconWithBackgroundConfiguration:v5];

  return v7;
}

- (void)setUserProfileLink:(id)a3
{
  v5 = (UserProfileLink *)a3;
  if (self->_userProfileLink != v5) {
    objc_storeStrong((id *)&self->_userProfileLink, a3);
  }
  [(UserProfilePersonalizationLinkCell *)self _updateFromUserProfileLinkModel];
}

- (void)setTitle:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_title);
  unsigned __int8 v5 = [WeakRetained isEqualToString:obj];

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_title, obj);
    [(UIListContentConfiguration *)self->_contentConfig setText:obj];
  }
}

- (void)setSubtitle:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_subtitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    [(UIListContentConfiguration *)self->_contentConfig setSecondaryText:v5];
  }
}

- (void)setIcon:(id)a3
{
  id v6 = (UIImage *)a3;
  if (self->_icon != v6)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    id v5 = [(UserProfilePersonalizationLinkCell *)self _convertIconToImageWithBackground:v6];
    [(UIListContentConfiguration *)self->_contentConfig setImage:v5];
  }
}

- (void)updateTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(UserProfilePersonalizationLinkCell *)self setTitle:a3];
  [(UserProfilePersonalizationLinkCell *)self setSubtitle:v9];

  [(UserProfilePersonalizationLinkCell *)self setIcon:v8];

  [(UserProfilePersonalizationLinkCell *)self _updateConfiguration];
}

- (void)_updateFromUserProfileLinkModel
{
  v3 = [(UserProfileLink *)self->_userProfileLink title];
  id v4 = [(UserProfileLink *)self->_userProfileLink subtitle];
  id v5 = [(UserProfileLink *)self->_userProfileLink icon];
  [(UserProfilePersonalizationLinkCell *)self updateTitle:v3 subtitle:v4 icon:v5];

  [(UserProfilePersonalizationLinkCell *)self _updateConfiguration];
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSString)title
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_title);

  return (NSString *)WeakRetained;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)icon
{
  return self->_icon;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (void)setGlyphTintColor:(id)a3
{
}

- (UIColor)glyphBackgroundColor
{
  return self->_glyphBackgroundColor;
}

- (void)setGlyphBackgroundColor:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (UserProfileLink)userProfileLink
{
  return self->_userProfileLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfileLink, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_glyphBackgroundColor, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_destroyWeak((id *)&self->_title);
  objc_storeStrong((id *)&self->_contentConfig, 0);
  objc_storeStrong((id *)&self->_glyphBackgroundView, 0);

  objc_storeStrong((id *)&self->_subtitleLabel, 0);
}

@end