@interface TUIUpdateDevicesModel
- (NSMutableArray)devicesWithIssuesIdentifiers;
- (TUIUpdateDevicesModel)init;
- (id)detailText;
- (id)helpLinkTitle;
- (id)helpLinkURL;
- (id)primaryButton;
- (id)secondaryButton;
- (id)symbolName;
- (id)title;
- (void)setDetailText:(id)a3;
- (void)setDevicesWithIssuesIdentifiers:(id)a3;
- (void)setHelpLinkTitle:(id)a3;
- (void)setHelpLinkURL:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TUIUpdateDevicesModel

- (TUIUpdateDevicesModel)init
{
  v20.receiver = self;
  v20.super_class = (Class)TUIUpdateDevicesModel;
  v2 = [(TUIUpdateDevicesModel *)&v20 init];
  v3 = v2;
  if (v2)
  {
    symbolName = v2->_symbolName;
    v2->_symbolName = (NSString *)@"exclamationmark.triangle";

    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"UPDATE_DEVICES_ERROR_TITLE" value:&stru_270C3F140 table:@"Localizable"];
    title = v3->_title;
    v3->_title = (NSString *)v6;

    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"UPDATE_DEVICES_ERROR_DETAIL" value:&stru_270C3F140 table:@"Localizable"];
    detailText = v3->_detailText;
    v3->_detailText = (NSString *)v9;

    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = [v11 localizedStringForKey:@"UPDATE_DEVICES_ERROR_PRIMARY_BUTTON" value:&stru_270C3F140 table:@"Localizable"];
    primaryButton = v3->_primaryButton;
    v3->_primaryButton = (NSString *)v12;

    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"UPDATE_DEVICES_ERROR_SECONDARY_BUTTON" value:&stru_270C3F140 table:@"Localizable"];
    secondaryButton = v3->_secondaryButton;
    v3->_secondaryButton = (NSString *)v15;

    helpLinkTitle = v3->_helpLinkTitle;
    v3->_helpLinkTitle = 0;

    helpLinkURL = v3->_helpLinkURL;
    v3->_helpLinkURL = 0;
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

- (NSMutableArray)devicesWithIssuesIdentifiers
{
  return self->_devicesWithIssuesIdentifiers;
}

- (void)setDevicesWithIssuesIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end