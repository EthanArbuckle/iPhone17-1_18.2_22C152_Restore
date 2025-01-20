@interface SRUIFLocalization
- (SRUIFLocalization)init;
- (SRUIFLocalization)initWithBundle:(id)a3 tableName:(id)a4;
- (id)localizedStringForLanguageCode:(id)a3 key:(id)a4;
- (id)localizedStringWithSiriLanguageForKey:(id)a3;
@end

@implementation SRUIFLocalization

- (SRUIFLocalization)initWithBundle:(id)a3 tableName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SRUIFLocalization;
  v8 = [(SRUIFLocalization *)&v16 init];
  if (v8)
  {
    if (v6)
    {
      v9 = (NSBundle *)v6;
    }
    else
    {
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    }
    bundle = v8->_bundle;
    v8->_bundle = v9;

    if (v7) {
      v11 = (__CFString *)v7;
    }
    else {
      v11 = @"Localizable";
    }
    tableName = v8->_tableName;
    v8->_tableName = &v11->isa;

    uint64_t v13 = [MEMORY[0x263F28530] sharedInstance];
    localization = v8->_localization;
    v8->_localization = (AFLocalization *)v13;
  }
  return v8;
}

- (SRUIFLocalization)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [(SRUIFLocalization *)self initWithBundle:v3 tableName:@"Localizable"];

  return v4;
}

- (id)localizedStringWithSiriLanguageForKey:(id)a3
{
  v4 = (void *)MEMORY[0x263F285A0];
  id v5 = a3;
  id v6 = [v4 sharedPreferences];
  id v7 = [v6 languageCode];

  v8 = [(SRUIFLocalization *)self localizedStringForLanguageCode:v7 key:v5];

  return v8;
}

- (id)localizedStringForLanguageCode:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(AFLocalization *)self->_localization localizedStringForKey:v7 table:self->_tableName bundle:self->_bundle languageCode:v6];
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFLocalization localizedStringForLanguageCode:key:](v9);
    }
  }
  id v8 = v7;
LABEL_7:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localization, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

- (void)localizedStringForLanguageCode:(os_log_t)log key:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SRUIFLocalization localizedStringForLanguageCode:key:]";
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s Language code not provided", (uint8_t *)&v1, 0xCu);
}

@end