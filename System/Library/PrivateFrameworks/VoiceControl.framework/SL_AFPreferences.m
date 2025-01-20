@interface SL_AFPreferences
+ (id)sharedPreferences;
- (AFPreferences)afPrefs;
- (SL_AFPreferences)init;
- (id)languageCode;
- (void)setAfPrefs:(id)a3;
@end

@implementation SL_AFPreferences

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedPreferences_sPreferences;

  return v2;
}

- (SL_AFPreferences)init
{
  v8.receiver = self;
  v8.super_class = (Class)SL_AFPreferences;
  v2 = [(SL_AFPreferences *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getAFPreferencesClass_softClass;
    uint64_t v13 = getAFPreferencesClass_softClass;
    if (!getAFPreferencesClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getAFPreferencesClass_block_invoke;
      v9[3] = &unk_265582688;
      v9[4] = &v10;
      __getAFPreferencesClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = [v4 sharedPreferences];
    afPrefs = v2->_afPrefs;
    v2->_afPrefs = (AFPreferences *)v5;
  }
  return v2;
}

- (id)languageCode
{
  v2 = [(SL_AFPreferences *)self afPrefs];
  v3 = [v2 languageCode];

  return v3;
}

- (AFPreferences)afPrefs
{
  return self->_afPrefs;
}

- (void)setAfPrefs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end