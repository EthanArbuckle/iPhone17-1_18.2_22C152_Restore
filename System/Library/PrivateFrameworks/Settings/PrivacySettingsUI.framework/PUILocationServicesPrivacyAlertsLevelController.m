@interface PUILocationServicesPrivacyAlertsLevelController
- (BOOL)shouldReloadSpecifiersOnResume;
- (id)authorizationPromptMapDisplayEnabled:(id)a3;
- (id)specifiers;
- (void)setAuthorizationPromptMapDisplayEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUILocationServicesPrivacyAlertsLevelController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesPrivacyAlertsLevelController;
  [(PUILocationServicesPrivacyAlertsLevelController *)&v4 viewDidLoad];
  v3 = PUI_LocalizedStringForLocationServices(@"PRIVACY_ALERTS");
  [(PUILocationServicesPrivacyAlertsLevelController *)self setTitle:v3];
}

- (id)authorizationPromptMapDisplayEnabled:(id)a3
{
  authorizationPromptMapDisplayEnabled = self->_authorizationPromptMapDisplayEnabled;
  if (!authorizationPromptMapDisplayEnabled)
  {
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(getCLLocationManagerClass(), "authorizationPromptMapDisplayEnabled"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_authorizationPromptMapDisplayEnabled;
    self->_authorizationPromptMapDisplayEnabled = v5;

    authorizationPromptMapDisplayEnabled = self->_authorizationPromptMapDisplayEnabled;
  }
  return authorizationPromptMapDisplayEnabled;
}

- (void)setAuthorizationPromptMapDisplayEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_storeStrong((id *)&self->_authorizationPromptMapDisplayEnabled, a3);
  uint64_t v7 = [v6 BOOLValue];
  v8 = _PUILoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "-[PUILocationServicesPrivacyAlertsLevelController setAuthorizationPromptMapDisplayEnabled:specifier:]";
    __int16 v13 = 1024;
    int v14 = v7;
    _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "%s - enable: %d", (uint8_t *)&v11, 0x12u);
  }

  if (v7 == [getCLLocationManagerClass() authorizationPromptMapDisplayEnabled])
  {
    v10 = _PUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      v12 = "-[PUILocationServicesPrivacyAlertsLevelController setAuthorizationPromptMapDisplayEnabled:specifier:]";
      _os_log_impl(&dword_1E4AD5000, v10, OS_LOG_TYPE_DEFAULT, "%s - authorization prompt map display already enabled.", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v9 = (id)[getCLLocationManagerClass() setAuthorizationPromptMapDisplayEnabled:v7];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v7 = PUI_LocalizedStringForLocationServices(@"MAP_DISPLAY");
    v8 = [v6 preferenceSpecifierNamed:v7 target:self set:sel_setAuthorizationPromptMapDisplayEnabled_specifier_ get:sel_authorizationPromptMapDisplayEnabled_ detail:0 cell:6 edit:0];

    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
    [v5 addObject:v8];
    id v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (void).cxx_destruct
{
}

@end