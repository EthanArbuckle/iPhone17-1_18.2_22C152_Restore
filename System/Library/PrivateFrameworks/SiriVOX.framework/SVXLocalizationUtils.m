@interface SVXLocalizationUtils
- (SVXLocalizationUtils)init;
- (SVXLocalizationUtils)initWithBundleUtils:(id)a3;
- (id)getLocalizedStringWithLanguageCode:(id)a3 gender:(int64_t)a4 key:(id)a5;
@end

@implementation SVXLocalizationUtils

- (void).cxx_destruct
{
}

- (id)getLocalizedStringWithLanguageCode:(id)a3 gender:(int64_t)a4 key:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    if ((unint64_t)a4 > 3) {
      v12 = @"(unknown)";
    }
    else {
      v12 = off_264552568[a4];
    }
    v13 = v12;
    int v16 = 136315906;
    v17 = "-[SVXLocalizationUtils getLocalizedStringWithLanguageCode:gender:key:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s getLocalizedStringWith (languageCode: %@, gender: %@, key: %@)", (uint8_t *)&v16, 0x2Au);
  }
  v14 = [(SVXBundleUtilsProtocol *)self->_bundleUtils getLocalizedStringWithBundle:0 table:0 key:v9 languageCode:v8 gender:a4];

  return v14;
}

- (SVXLocalizationUtils)initWithBundleUtils:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXLocalizationUtils;
  v6 = [(SVXLocalizationUtils *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleUtils, a3);
  }

  return v7;
}

- (SVXLocalizationUtils)init
{
  v3 = +[SVXBundleUtils sharedInstance];
  v4 = [(SVXLocalizationUtils *)self initWithBundleUtils:v3];

  return v4;
}

@end