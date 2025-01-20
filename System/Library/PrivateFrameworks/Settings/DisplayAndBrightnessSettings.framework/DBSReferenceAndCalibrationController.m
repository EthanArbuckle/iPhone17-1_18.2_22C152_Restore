@interface DBSReferenceAndCalibrationController
- (PSSpecifier)fineTuneSpecifier;
- (PSSpecifier)proModeSwitchSpecifier;
- (id)getProModeEnabled;
- (id)specifiers;
- (void)presentModalFineTuneController;
- (void)setProModeEnabled:(BOOL)a3;
- (void)setProModeEnabled:(id)a3 forSpecifier:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DBSReferenceAndCalibrationController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)DBSReferenceAndCalibrationController;
  [(DBSReferenceAndCalibrationController *)&v4 viewDidLoad];
  v3 = DBS_LocalizedStringForDisplays(@"ADVANCED");
  [(DBSReferenceAndCalibrationController *)self setTitle:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DBSReferenceAndCalibrationController;
  [(DBSReferenceAndCalibrationController *)&v3 viewWillAppear:a3];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ADVANCED_DETAIL_GROUP_ID"];
    v7 = DBS_LocalizedStringForDisplays(@"PRO_MODE_FOOTER");
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [v5 addObject:v6];
    v8 = (void *)MEMORY[0x263F5FC40];
    v9 = DBS_LocalizedStringForDisplays(@"PRO_MODE");
    v10 = [v8 preferenceSpecifierNamed:v9 target:self set:sel_setProModeEnabled_forSpecifier_ get:sel_getProModeEnabled_ detail:0 cell:6 edit:0];
    proModeSwitchSpecifier = self->_proModeSwitchSpecifier;
    self->_proModeSwitchSpecifier = v10;

    uint64_t v12 = *MEMORY[0x263F60138];
    [(PSSpecifier *)self->_proModeSwitchSpecifier setObject:@"PRO_MODE_SWITCH" forKeyedSubscript:*MEMORY[0x263F60138]];
    [v5 addObject:self->_proModeSwitchSpecifier];
    v13 = (void *)MEMORY[0x263F5FC40];
    v14 = DBS_LocalizedStringForDisplays(@"FINE_TUNE");
    v15 = [v13 preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:2 edit:0];
    fineTuneSpecifier = self->_fineTuneSpecifier;
    self->_fineTuneSpecifier = v15;

    [(PSSpecifier *)self->_fineTuneSpecifier setButtonAction:sel_presentModalFineTuneController];
    [(PSSpecifier *)self->_fineTuneSpecifier setObject:@"FINE_TUNE" forKeyedSubscript:v12];
    [(PSSpecifier *)self->_fineTuneSpecifier setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
    v17 = [(DBSReferenceAndCalibrationController *)self getProModeEnabled];
    LODWORD(v13) = [v17 BOOLValue];

    if (v13) {
      [v5 addObject:self->_fineTuneSpecifier];
    }
    v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)presentModalFineTuneController
{
  id v7 = objc_alloc_init(MEMORY[0x263F5FC30]);
  uint64_t v3 = (int)*MEMORY[0x263F5FE98];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 setProperty:v6 forKey:*MEMORY[0x263F60228]];

  [v7 setSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + v3)];
  [v7 setParentController:self];
  [v7 setupController];
  [v7 setModalPresentationStyle:2];
  [(DBSReferenceAndCalibrationController *)self presentViewController:v7 animated:1 completion:0];
}

- (id)getProModeEnabled
{
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x263F15778] mainDisplay];
  objc_super v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isReference"));

  return v4;
}

- (void)setProModeEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  [(DBSReferenceAndCalibrationController *)self setProModeEnabled:v5];
}

- (void)setProModeEnabled:(BOOL)a3
{
  int v3 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F15778] mainDisplay];
  int v6 = [v5 isReference];

  if (v6 != v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = objc_msgSend(MEMORY[0x263F15778], "mainDisplay", 0);
    v8 = [v7 availablePresets];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v13 isReference] == v3)
          {
            v14 = [MEMORY[0x263F15778] mainDisplay];
            [v14 setCurrentPreset:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    fineTuneSpecifier = self->_fineTuneSpecifier;
    if (v3) {
      [(DBSReferenceAndCalibrationController *)self insertSpecifier:fineTuneSpecifier afterSpecifier:self->_proModeSwitchSpecifier animated:1];
    }
    else {
      [(DBSReferenceAndCalibrationController *)self removeSpecifier:fineTuneSpecifier animated:1];
    }
  }
}

- (PSSpecifier)proModeSwitchSpecifier
{
  return self->_proModeSwitchSpecifier;
}

- (PSSpecifier)fineTuneSpecifier
{
  return self->_fineTuneSpecifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fineTuneSpecifier, 0);
  objc_storeStrong((id *)&self->_proModeSwitchSpecifier, 0);
}

@end