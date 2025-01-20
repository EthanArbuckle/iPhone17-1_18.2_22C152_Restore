@interface TUIWelcomeSplashScreenModel
- (TUIWelcomeSplashScreenModel)init;
- (id)detailText;
- (id)helpLinkTitle;
- (id)helpLinkURL;
- (id)primaryButton;
- (id)secondaryButton;
- (id)symbolName;
- (id)title;
- (void)setDetailText:(id)a3;
- (void)setHelpLinkTitle:(id)a3;
- (void)setHelpLinkURL:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TUIWelcomeSplashScreenModel

- (TUIWelcomeSplashScreenModel)init
{
  v21.receiver = self;
  v21.super_class = (Class)TUIWelcomeSplashScreenModel;
  v2 = [(TUIWelcomeSplashScreenModel *)&v21 init];
  v3 = v2;
  if (v2)
  {
    symbolName = v2->_symbolName;
    v2->_symbolName = (NSString *)@"person.crop.circle.badge.checkmark";

    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"DEVICE_VERIFICATION_SPECIFIER_TITLE" value:&stru_270C3F140 table:@"Localizable"];
    title = v3->_title;
    v3->_title = (NSString *)v6;

    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"DEVICE_VERIFICATION_WELCOME_FOOTER" value:&stru_270C3F140 table:@"Localizable"];
    detailText = v3->_detailText;
    v3->_detailText = (NSString *)v9;

    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = [v11 localizedStringForKey:@"CONTINUE" value:&stru_270C3F140 table:@"Localizable"];
    primaryButton = v3->_primaryButton;
    v3->_primaryButton = (NSString *)v12;

    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"SETUP_LATER" value:&stru_270C3F140 table:@"Localizable"];
    secondaryButton = v3->_secondaryButton;
    v3->_secondaryButton = (NSString *)v15;

    objc_storeStrong((id *)&v3->_helpLinkURL, @"https://support.apple.com/ht213465");
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"LEARN_MORE" value:&stru_270C3F140 table:@"Localizable"];
    helpLinkTitle = v3->_helpLinkTitle;
    v3->_helpLinkTitle = (NSString *)v18;
  }
  return v3;
}

- (id)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (id)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (id)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (id)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (id)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
}

- (id)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end