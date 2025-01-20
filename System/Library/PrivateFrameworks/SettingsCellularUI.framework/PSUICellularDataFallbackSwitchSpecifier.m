@interface PSUICellularDataFallbackSwitchSpecifier
- (PSListController)hostController;
- (PSUICellularDataFallbackSwitchSpecifier)initWithHostController:(id)a3;
- (id)isFallbackEnabled:(id)a3;
- (void)setFallbackEnabled:(id)a3 specifier:(id)a4;
- (void)setHostController:(id)a3;
@end

@implementation PSUICellularDataFallbackSwitchSpecifier

- (PSUICellularDataFallbackSwitchSpecifier)initWithHostController:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CELLULAR_DATA_SWITCHING" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  v9.receiver = self;
  v9.super_class = (Class)PSUICellularDataFallbackSwitchSpecifier;
  v7 = [(PSUICellularDataFallbackSwitchSpecifier *)&v9 initWithName:v6 target:self set:sel_setFallbackEnabled_specifier_ get:sel_isFallbackEnabled_ detail:0 cell:6 edit:0];

  if (v7)
  {
    objc_storeWeak((id *)&v7->_hostController, v4);
    [(PSUICellularDataFallbackSwitchSpecifier *)v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  }

  return v7;
}

- (void)setFallbackEnabled:(id)a3 specifier:(id)a4
{
  if (a3) {
    uint64_t v4 = [a3 BOOLValue];
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = +[PSUICoreTelephonyDataCache sharedInstance];
  [v5 setDataFallbackEnabled:v4];
}

- (id)isFallbackEnabled:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = +[PSUICoreTelephonyDataCache sharedInstance];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isDataFallbackEnabled"));

  return v5;
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end