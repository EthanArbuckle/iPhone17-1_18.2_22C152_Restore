@interface SHSDualSIMListController
- (BOOL)hasDifferentTones;
- (id)detailTextForToneWithSpecifier:(id)a3;
- (id)specifiers;
- (int64_t)alertType;
- (void)reloadSpecifiers;
- (void)setAlertType:(int64_t)a3;
- (void)setHasDifferentTones:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)updateDifferentTonesState;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SHSDualSIMListController

- (void)reloadSpecifiers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SHSDualSIMListController *)self hasDifferentTones];
  v8.receiver = self;
  v8.super_class = (Class)SHSDualSIMListController;
  [(SHSDualSIMListController *)&v8 reloadSpecifiers];
  v4 = SHSLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SHSDualSIMListController hasDifferentTones](self, "hasDifferentTones"));
    v6 = [NSNumber numberWithBool:v3];
    *(_DWORD *)buf = 136315650;
    v10 = "-[SHSDualSIMListController reloadSpecifiers]";
    __int16 v11 = 2112;
    v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_237305000, v4, OS_LOG_TYPE_DEFAULT, "%s self.hasDifferentTones: %@ differentTonesBeforeUpdate: %@", buf, 0x20u);
  }
  if (v3 != [(SHSDualSIMListController *)self hasDifferentTones])
  {
    [(SHSDualSIMListController *)self alertType];
    v7 = NSStringFromTLAlertType();
    +[SHSAnalytics trackingDualSIMToneValueChanged:v7 didSelectDifferentTones:[(SHSDualSIMListController *)self hasDifferentTones]];
  }
}

- (void)setSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SHSDualSIMListController;
  id v4 = a3;
  [(SHSDualSIMListController *)&v6 setSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"alertType", v6.receiver, v6.super_class);

  if (v5) {
    [(SHSDualSIMListController *)self setAlertType:TLAlertTypeFromString()];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)SHSDualSIMListController;
  [(SHSDualSIMListController *)&v15 viewDidAppear:a3];
  id v4 = NSURL;
  v5 = NSString;
  objc_super v6 = [(SHSDualSIMListController *)self specifier];
  v7 = [v6 identifier];
  objc_super v8 = [v5 stringWithFormat:@"settings-navigation://com.apple.Settings.Sounds/%@", v7];
  v9 = [v4 URLWithString:v8];

  v10 = (void *)MEMORY[0x263F08DB0];
  __int16 v11 = [(SHSDualSIMListController *)self specifier];
  v12 = objc_msgSend(v10, "shs_localizedPathComponentForTonePickerSpecifier:", v11);

  if (v12)
  {
    __int16 v13 = objc_msgSend(MEMORY[0x263F08DB0], "shs_rootPaneComponent");
    v16[0] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [(SHSDualSIMListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.sound" title:v12 localizedNavigationComponents:v14 deepLink:v9];
  }
  else
  {
    __int16 v13 = SHSLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SHSDualSIMListController viewDidAppear:](self, v13);
    }
  }
}

- (id)specifiers
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v21 = (int)*MEMORY[0x263F5FDB8];
    id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v4 = +[SHSDualSIMToneHelper fetchCTSubscriptionsInUse];
    v5 = SHSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[SHSDualSIMListController specifiers]";
      __int16 v34 = 2112;
      v35 = v4;
      _os_log_impl(&dword_237305000, v5, OS_LOG_TYPE_DEFAULT, "%s fetchCTSubscriptionsInUse returned contexts: %@", buf, 0x16u);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v25 = *(void *)v28;
      uint64_t v24 = *MEMORY[0x263F60290];
      uint64_t v23 = *MEMORY[0x263F5FFE0];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v10 = [v9 label];
          __int16 v11 = [v9 labelID];
          v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v10 target:self set:0 get:sel_detailTextForToneWithSpecifier_ detail:objc_opt_class() cell:2 edit:0];
          [v12 setProperty:v9 forKey:v24];
          [(SHSDualSIMListController *)self alertType];
          __int16 v13 = NSStringFromTLAlertType();
          [v12 setProperty:v13 forKey:@"alertType"];

          [v12 setProperty:objc_opt_class() forKey:v23];
          v14 = +[SHSDualSIMToneHelper fetchShortLabelForContext:v9];
          [v12 setProperty:v14 forKey:@"contextShortLabel"];

          if (v11)
          {
            objc_super v15 = [@"TLAlertTopicIncomingCall" stringByAppendingString:v11];
            [v12 setProperty:v15 forKey:@"accountIdentifier"];
          }
          v16 = [v9 userDefaultVoice];
          int v17 = [v16 BOOLValue];

          if (v17) {
            [v26 insertObject:v12 atIndex:0];
          }
          else {
            [v26 addObject:v12];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v7);
    }

    v18 = [MEMORY[0x263EFF8C0] arrayWithArray:v26];
    v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v21);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v21) = v18;

    [(SHSDualSIMListController *)self updateDifferentTonesState];
    BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v21);
  }
  return v3;
}

- (id)detailTextForToneWithSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 propertyForKey:@"alertType"];
  uint64_t v5 = TLAlertTypeFromString();

  uint64_t v6 = [v3 propertyForKey:@"accountIdentifier"];

  uint64_t v7 = [MEMORY[0x263F7FC90] sharedToneManager];
  objc_super v8 = [v7 currentToneIdentifierForAlertType:v5 topic:v6];

  v9 = [MEMORY[0x263F7FC90] sharedToneManager];
  [v9 setCurrentToneIdentifier:v8 forAlertType:v5 topic:v6];

  if ((PSGetCapabilityBoolAnswer() & 1) != 0 || !PSGetCapabilityBoolAnswer()) {
    goto LABEL_6;
  }
  v10 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
  __int16 v11 = [v10 currentVibrationIdentifierForAlertType:v5 topic:v6];

  v12 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
  [v12 setCurrentVibrationIdentifier:v11 forAlertType:v5 topic:v6];

  if (![v8 isEqualToString:*MEMORY[0x263F7FD70]]
    || [v11 isEqualToString:*MEMORY[0x263F7FD78]])
  {

LABEL_6:
    __int16 v13 = [MEMORY[0x263F7FC90] sharedToneManager];
    v14 = [v13 nameForToneIdentifier:v8];

    goto LABEL_7;
  }
  v14 = SHS_LocalizedStringForSounds(@"VIBRATE_ONLY");

  if (!v14) {
    goto LABEL_6;
  }
LABEL_7:

  return v14;
}

- (void)updateDifferentTonesState
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) objectAtIndex:0];
  uint64_t v5 = [(SHSDualSIMListController *)self detailTextForToneWithSpecifier:v4];
  uint64_t v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) objectAtIndex:1];
  uint64_t v7 = [(SHSDualSIMListController *)self detailTextForToneWithSpecifier:v6];
  int v8 = [v5 isEqualToString:v7];

  [(SHSDualSIMListController *)self setHasDifferentTones:v8 ^ 1u];
  v9 = SHSLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[SHSDualSIMListController hasDifferentTones](self, "hasDifferentTones"));
    int v11 = 136315394;
    v12 = "-[SHSDualSIMListController updateDifferentTonesState]";
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_237305000, v9, OS_LOG_TYPE_DEFAULT, "%s self.hasDifferentTones: %@", (uint8_t *)&v11, 0x16u);
  }
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(int64_t)a3
{
  self->_alertType = a3;
}

- (BOOL)hasDifferentTones
{
  return self->_hasDifferentTones;
}

- (void)setHasDifferentTones:(BOOL)a3
{
  self->_hasDifferentTones = a3;
}

- (void)viewDidAppear:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 specifier];
  int v4 = 136315394;
  uint64_t v5 = "-[SHSDualSIMListController viewDidAppear:]";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_237305000, a2, OS_LOG_TYPE_ERROR, "%s shs_localizedPathComponentForTonePickerSpecifier returned nil for specifier: %@", (uint8_t *)&v4, 0x16u);
}

@end