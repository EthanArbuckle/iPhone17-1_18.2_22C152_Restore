@interface PUIMotionFitnessController
- (BOOL)isFitnessTrackingEnabledFromTCC;
- (id)_appSpecifiers;
- (id)isFitnessTrackingEnabled:(id)a3;
- (id)loadSensorKitSpecifiersProvider;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (void)provideNavigationDonations;
- (void)setFitnessTrackingEnabled:(id)a3 forSpecifier:(id)a4;
- (void)specifiers;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUIMotionFitnessController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    BOOL v5 = [(PUIMotionFitnessController *)self isFitnessTrackingEnabledFromTCC];
    v6 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    uint64_t v7 = *MEMORY[0x1E4F93188];
    [v6 setProperty:@"FITNESS_TRACKING_GROUP" forKey:*MEMORY[0x1E4F93188]];
    v8 = PUI_LocalizedStringForPrivacy(@"FITNESS_TRACKING_PRIVACY");
    [v6 setProperty:v8 forKey:*MEMORY[0x1E4F93170]];

    v9 = (void *)MEMORY[0x1E4F92E70];
    v10 = PUI_LocalizedStringForPrivacy(@"FITNESS_TRACKING");
    v11 = [v9 preferenceSpecifierNamed:v10 target:self set:sel_setFitnessTrackingEnabled_forSpecifier_ get:sel_isFitnessTrackingEnabled_ detail:0 cell:6 edit:0];

    [v11 setProperty:@"FITNESS_TRACKING_MASTER" forKey:v7];
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
    [v11 setProperty:v12 forKey:*MEMORY[0x1E4F93250]];

    if (v5)
    {
      v22.receiver = self;
      v22.super_class = (Class)PUIMotionFitnessController;
      v13 = [(PUITCCAccessController *)&v22 specifiers];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        -[PUIMotionFitnessController specifiers]();
      }
      [v13 insertObject:v6 atIndex:0];
      [v13 insertObject:v11 atIndex:1];
      v14 = [MEMORY[0x1E4FB16C8] currentDevice];
      int v15 = objc_msgSend(v14, "sf_isiPhone");

      if (v15)
      {
        v16 = [(PUIMotionFitnessController *)self loadSensorKitSpecifiersProvider];
        sensorKitSpecifiersProvider = self->_sensorKitSpecifiersProvider;
        self->_sensorKitSpecifiersProvider = v16;

        v18 = [(SRRelatedSettingsProvider *)self->_sensorKitSpecifiersProvider specifiersForRelatedSettings:@"Motion"];
        if (v18) {
          [v13 addObjectsFromArray:v18];
        }
      }
      v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v13;
    }
    else
    {
      v20 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v6, v11, 0);
      v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v20;
    }

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIMotionFitnessController;
  [(PUITCCAccessController *)&v4 viewDidAppear:a3];
  [(PUIMotionFitnessController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v7 = (void *)[v5 initWithKey:@"MOTION" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/MOTION"];
  [(PUIMotionFitnessController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.motion-and-fitness" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (id)loadSensorKitSpecifiersProvider
{
  v2 = PSBundlePathForPreferenceBundle();
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithPath:v2];
  objc_super v4 = v3;
  if (v3 && (id v5 = (objc_class *)[v3 classNamed:@"SRRelatedSpecifiers"]) != 0)
  {
    id v6 = objc_alloc_init(v5);
    if (objc_opt_respondsToSelector()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x1E4F93250]];
}

- (id)_appSpecifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = (objc_class *)*(id *)((char *)&self->super.super.super.super.super.super.isa + v3);
  id v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = 0;

  v9.receiver = self;
  v9.super_class = (Class)PUIMotionFitnessController;
  id v6 = [(PUITCCAccessController *)&v9 specifiers];
  id v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v4;

  return v6;
}

- (BOOL)isFitnessTrackingEnabledFromTCC
{
  char v7 = 0;
  v2 = [(PUITCCAccessController *)self serviceKey];
  int Override = TCCAccessGetOverride();

  if (!Override)
  {
    objc_super v4 = _PUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1E4AD5000, v4, OS_LOG_TYPE_DEFAULT, "### Failed to get Fitness Tracking override value", v6, 2u);
    }
  }
  return v7 == 0;
}

- (id)isFitnessTrackingEnabled:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x1E4F93250]];
}

- (void)setFitnessTrackingEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F93250];
  objc_super v9 = [v7 propertyForKey:*MEMORY[0x1E4F93250]];
  if (([v6 isEqual:v9] & 1) == 0)
  {
    int v10 = [v6 BOOLValue];
    v11 = _PUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315394;
      v20 = "-[PUIMotionFitnessController setFitnessTrackingEnabled:forSpecifier:]";
      __int16 v21 = 1024;
      int v22 = v10;
      _os_log_impl(&dword_1E4AD5000, v11, OS_LOG_TYPE_DEFAULT, "%s - enable: %d", (uint8_t *)&v19, 0x12u);
    }

    v12 = [(PUITCCAccessController *)self serviceKey];
    int v13 = TCCAccessSetOverride();

    if (v13)
    {
      [v7 setProperty:v6 forKey:v8];
      if (v10)
      {
        v14 = [(PUIMotionFitnessController *)self _appSpecifiers];
        [(PUIMotionFitnessController *)self insertContiguousSpecifiers:v14 afterSpecifier:v7 animated:1];
      }
      else
      {
        uint64_t v18 = [(PUIMotionFitnessController *)self indexOfSpecifier:v7] + 1;
        v14 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]), "subarrayWithRange:", v18, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]), "count")- v18);
        [(PUIMotionFitnessController *)self removeContiguousSpecifiers:v14 animated:1];
      }
      goto LABEL_15;
    }
    int v15 = _PUILoggingFacility();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v16)
      {
        LOWORD(v19) = 0;
        v17 = "### Failed to remove Fitness Tracking override";
LABEL_13:
        _os_log_impl(&dword_1E4AD5000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 2u);
      }
    }
    else if (v16)
    {
      LOWORD(v19) = 0;
      v17 = "### Failed to override Fitness Tracking";
      goto LABEL_13;
    }

    v14 = [v7 propertyForKey:*MEMORY[0x1E4F930F0]];
    objc_msgSend(v14, "setOn:animated:", objc_msgSend(v9, "BOOLValue"), 1);
LABEL_15:
  }
}

- (void).cxx_destruct
{
}

- (void)specifiers
{
}

@end