@interface VSCuratedViewModel
- (BOOL)isBeginValidationButtonEnabled;
- (BOOL)logoFinishedLoading;
- (BOOL)showFooter;
- (CGSize)preferredLogoSize;
- (NSItemProvider)logoProvider;
- (NSString)beginValidationButtonTitle;
- (NSString)footerText;
- (NSString)logoAccessibilityLabel;
- (NSString)message;
- (NSString)notice;
- (UIImage)logo;
- (VSCuratedViewModel)init;
- (VSOptional)identityProviderDisplayName;
- (void)configureWithRequest:(id)a3;
- (void)setBeginValidationButtonEnabled:(BOOL)a3;
- (void)setBeginValidationButtonTitle:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setIdentityProviderDisplayName:(id)a3;
- (void)setLogo:(id)a3;
- (void)setLogoAccessibilityLabel:(id)a3;
- (void)setLogoFinishedLoading:(BOOL)a3;
- (void)setLogoProvider:(id)a3;
- (void)setMessage:(id)a3;
- (void)setNotice:(id)a3;
- (void)setPreferredLogoSize:(CGSize)a3;
- (void)setShowFooter:(BOOL)a3;
@end

@implementation VSCuratedViewModel

- (VSCuratedViewModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSCuratedViewModel;
  v2 = [(VSViewModel *)&v6 init];
  if (v2)
  {
    v3 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    identityProviderDisplayName = v2->_identityProviderDisplayName;
    v2->_identityProviderDisplayName = v3;
  }
  return v2;
}

- (void)configureWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(VSViewModel *)self identityProvider];
  objc_super v6 = [v5 displayName];
  v7 = [v6 forceUnwrapObject];
  [(VSCuratedViewModel *)self setLogoAccessibilityLabel:v7];

  v8 = [v4 requestingAppDisplayName];
  if (v8)
  {
    v9 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    v10 = [v9 localizedStringForKey:@"APP_PRIVACY_NOTICE_FORMAT" value:0 table:0];

    v11 = objc_msgSend(NSString, "stringWithFormat:", v10, v8);
  }
  else
  {
    v11 = 0;
  }
  [(VSCuratedViewModel *)self setNotice:v11];
  v12.receiver = self;
  v12.super_class = (Class)VSCuratedViewModel;
  [(VSViewModel *)&v12 configureWithRequest:v4];
}

- (NSItemProvider)logoProvider
{
  return self->_logoProvider;
}

- (void)setLogoProvider:(id)a3
{
}

- (UIImage)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
}

- (CGSize)preferredLogoSize
{
  double width = self->preferredLogoSize.width;
  double height = self->preferredLogoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredLogoSize:(CGSize)a3
{
  self->preferredLogoSize = a3;
}

- (BOOL)logoFinishedLoading
{
  return self->logoFinishedLoading;
}

- (void)setLogoFinishedLoading:(BOOL)a3
{
  self->logoFinishedLoading = a3;
}

- (NSString)logoAccessibilityLabel
{
  return self->_logoAccessibilityLabel;
}

- (void)setLogoAccessibilityLabel:(id)a3
{
}

- (BOOL)isBeginValidationButtonEnabled
{
  return self->_beginValidationButtonEnabled;
}

- (void)setBeginValidationButtonEnabled:(BOOL)a3
{
  self->_beginValidationButtonEnabled = a3;
}

- (NSString)beginValidationButtonTitle
{
  return self->_beginValidationButtonTitle;
}

- (void)setBeginValidationButtonTitle:(id)a3
{
}

- (VSOptional)identityProviderDisplayName
{
  return self->_identityProviderDisplayName;
}

- (void)setIdentityProviderDisplayName:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)notice
{
  return self->_notice;
}

- (void)setNotice:(id)a3
{
}

- (BOOL)showFooter
{
  return self->_showFooter;
}

- (void)setShowFooter:(BOOL)a3
{
  self->_showFooter = a3;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_notice, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_identityProviderDisplayName, 0);
  objc_storeStrong((id *)&self->_beginValidationButtonTitle, 0);
  objc_storeStrong((id *)&self->_logoAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_logoProvider, 0);
}

@end