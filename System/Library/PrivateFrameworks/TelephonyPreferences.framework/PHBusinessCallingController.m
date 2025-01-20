@interface PHBusinessCallingController
- (PHBrandedCallingController)brandedCallingController;
- (PHBusinessCallingController)initWithCoreTelephonyClient:(id)a3;
- (PHBusinessConnectCallingController)businessConnectCallingController;
- (id)groupFooterTextFor:(id)a3;
- (id)isBusinessCallingEnabled;
- (id)specifiers;
- (void)updateBusinessCallingState;
@end

@implementation PHBusinessCallingController

- (PHBusinessCallingController)initWithCoreTelephonyClient:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHBusinessCallingController;
  v5 = [(PHBusinessCallingController *)&v11 init];
  if (v5)
  {
    v6 = [[PHBrandedCallingController alloc] initWithCoreTelephonyClient:v4 parentListController:v5];
    brandedCallingController = v5->_brandedCallingController;
    v5->_brandedCallingController = v6;

    v8 = objc_alloc_init(PHBusinessConnectCallingController);
    businessConnectCallingController = v5->_businessConnectCallingController;
    v5->_businessConnectCallingController = v8;
  }
  return v5;
}

- (void)updateBusinessCallingState
{
}

- (id)specifiers
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PHBrandedCallingController *)self->_brandedCallingController activeContextsSupportingBrandedCalling];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"BusinessCallingGroup" name:&stru_1F40BEF98];
    v7 = (void *)MEMORY[0x1E4F92E70];
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"BUSINESS_CALLING_SPECIFIER_TITLE" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:sel_isBusinessCallingEnabled detail:objc_opt_class() cell:2 edit:0];

    [v10 setProperty:self->_brandedCallingController forKey:@"PHBrandedCallingControllerKey"];
    objc_super v11 = [(PHBrandedCallingController *)self->_brandedCallingController activeContextsSupportingBrandedCalling];
    v12 = [(PHBusinessCallingController *)self groupFooterTextFor:v11];
    [v6 setProperty:v12 forKey:*MEMORY[0x1E4F93170]];

    v15[0] = v6;
    v15[1] = v10;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    [v3 addObjectsFromArray:v13];
  }
  else
  {
    v6 = [(PHBusinessConnectCallingController *)self->_businessConnectCallingController specifiers];
    [v3 addObjectsFromArray:v6];
  }

  return v3;
}

- (id)isBusinessCallingEnabled
{
  id v3 = [(PHBusinessConnectCallingController *)self->_businessConnectCallingController getBusinessConnectCallingEnabled];
  if ([v3 BOOLValue])
  {

LABEL_4:
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = v5;
    v7 = @"BUSINESS_CALLING_ON";
    goto LABEL_6;
  }
  BOOL v4 = [(PHBrandedCallingController *)self->_brandedCallingController featureEnabledForAtLeastOneContext];

  if (v4) {
    goto LABEL_4;
  }
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = v5;
  v7 = @"BUSINESS_CALLING_OFF";
LABEL_6:
  v8 = [v5 localizedStringForKey:v7 value:&stru_1F40BEF98 table:@"CallDirectorySettings"];

  return v8;
}

- (id)groupFooterTextFor:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    BOOL v4 = NSString;
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"BUSINESS_CALLING_SINGLE_CARRIER_FOOTER_TEXT" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    v7 = [v3 objectAtIndexedSubscript:0];
    v8 = [v7 carrierName];
    objc_msgSend(v4, "stringWithFormat:", v6, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_7;
  }
  if ([v3 count] == 2)
  {
    v10 = NSString;
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"BUSINESS_CALLING_TWO_CARRIER_FOOTER_TEXT" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    v7 = [v3 objectAtIndexedSubscript:0];
    v8 = [v7 carrierName];
    objc_super v11 = [v3 objectAtIndexedSubscript:1];
    v12 = [v11 carrierName];
    objc_msgSend(v10, "stringWithFormat:", v6, v8, v12);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  v9 = &stru_1F40BEF98;
LABEL_7:

  return v9;
}

- (PHBrandedCallingController)brandedCallingController
{
  return self->_brandedCallingController;
}

- (PHBusinessConnectCallingController)businessConnectCallingController
{
  return self->_businessConnectCallingController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessConnectCallingController, 0);
  objc_storeStrong((id *)&self->_brandedCallingController, 0);
}

@end