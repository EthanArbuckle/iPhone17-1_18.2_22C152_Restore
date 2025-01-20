@interface TUIMissingAppleIDModel
- (TUIMissingAppleIDModel)init;
- (TUIMissingAppleIDModel)initWithFlow:(unint64_t)a3;
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

@implementation TUIMissingAppleIDModel

- (TUIMissingAppleIDModel)init
{
  return [(TUIMissingAppleIDModel *)self initWithFlow:0];
}

- (TUIMissingAppleIDModel)initWithFlow:(unint64_t)a3
{
  v24.receiver = self;
  v24.super_class = (Class)TUIMissingAppleIDModel;
  v4 = [(TUIMissingAppleIDModel *)&v24 init];
  v5 = v4;
  if (v4)
  {
    symbolName = v4->_symbolName;
    v4->_symbolName = (NSString *)@"bubble.left.and.bubble.right";

    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"MISSING_APPLEID_ERROR_TITLE" value:&stru_270C3F140 table:@"Localizable"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (a3 == 2)
    {
      v11 = v10;
      v12 = @"MISSING_APPLEID_OPTOUT_ERROR_DETAIL";
    }
    else
    {
      v11 = v10;
      v12 = @"MISSING_APPLEID_OPTIN_ERROR_DETAIL";
    }
    uint64_t v13 = [v10 localizedStringForKey:v12 value:&stru_270C3F140 table:@"Localizable"];
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v13;

    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"MISSING_APPLEID_ERROR_PRIMARY_BUTTON" value:&stru_270C3F140 table:@"Localizable"];
    primaryButton = v5->_primaryButton;
    v5->_primaryButton = (NSString *)v16;

    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"SETUP_LATER" value:&stru_270C3F140 table:@"Localizable"];
    secondaryButton = v5->_secondaryButton;
    v5->_secondaryButton = (NSString *)v19;

    helpLinkTitle = v5->_helpLinkTitle;
    v5->_helpLinkTitle = 0;

    helpLinkURL = v5->_helpLinkURL;
    v5->_helpLinkURL = 0;
  }
  return v5;
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