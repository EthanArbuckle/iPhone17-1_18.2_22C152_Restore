@interface SVXBundleUtils
+ (id)sharedInstance;
- (SVXBundleUtils)init;
- (SVXBundleUtils)initWithLocalization:(id)a3;
- (id)_getSystemFrameworkWithName:(id)a3;
- (id)getLocalizedStringWithBundle:(id)a3 table:(id)a4 key:(id)a5 languageCode:(id)a6 gender:(int64_t)a7;
- (id)getSiriVOXFramework;
@end

@implementation SVXBundleUtils

- (void).cxx_destruct
{
}

- (id)_getSystemFrameworkWithName:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F086E0];
  v5 = (void *)[[NSString alloc] initWithFormat:@"com.apple.%@", v3];
  v6 = [v4 bundleWithIdentifier:v5];

  if (!v6)
  {
    v7 = (void *)MEMORY[0x263F086E0];
    v8 = (void *)[[NSString alloc] initWithFormat:@"/System/Library/PrivateFrameworks/%@.framework", v3];
    v6 = [v7 bundleWithPath:v8];

    if (!v6)
    {
      v9 = (void *)MEMORY[0x263F086E0];
      v10 = (void *)[[NSString alloc] initWithFormat:@"/System/Library/Frameworks/%@.framework", v3];
      v6 = [v9 bundleWithPath:v10];
    }
  }

  return v6;
}

- (id)getLocalizedStringWithBundle:(id)a3 table:(id)a4 key:(id)a5 languageCode:(id)a6 gender:(int64_t)a7
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v43 = a5;
  id v42 = a6;
  v14 = (os_log_t *)MEMORY[0x263F28348];
  v15 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    v17 = [v12 bundleIdentifier];
    if ((unint64_t)a7 > 3) {
      v18 = @"(unknown)";
    }
    else {
      v18 = off_264552568[a7];
    }
    v19 = v18;
    *(_DWORD *)buf = 136316418;
    v50 = "-[SVXBundleUtils getLocalizedStringWithBundle:table:key:languageCode:gender:]";
    __int16 v51 = 2112;
    v52 = v17;
    __int16 v53 = 2112;
    id v54 = v13;
    __int16 v55 = 2112;
    id v56 = v43;
    __int16 v57 = 2112;
    id v58 = v42;
    __int16 v59 = 2112;
    v60 = v19;
    _os_log_impl(&dword_220062000, v16, OS_LOG_TYPE_INFO, "%s Getting localized string with bundleIdentifier: %@, table: %@, key: %@, languageCode: %@, gender: %@", buf, 0x3Eu);
  }
  id v20 = v13;
  if (v20)
  {
    afLocalization = self->_afLocalization;
    if (v12)
    {
      v22 = [(AFLocalization *)self->_afLocalization localizedStringForKey:v43 gender:a7 table:v20 bundle:v12 languageCode:v42];
    }
    else
    {
      v37 = [(SVXBundleUtils *)self getSiriVOXFramework];
      v22 = [(AFLocalization *)afLocalization localizedStringForKey:v43 gender:a7 table:v20 bundle:v37 languageCode:v42];
    }
    id v36 = v20;
  }
  else
  {
    if (!v12) {
      goto LABEL_11;
    }
    v23 = [v12 bundleIdentifier];
    v24 = [(SVXBundleUtils *)self getSiriVOXFramework];
    v25 = [v24 bundleIdentifier];
    int v26 = [v23 isEqualToString:v25];

    if (!v26)
    {
      v22 = [(AFLocalization *)self->_afLocalization localizedStringForKey:v43 gender:a7 table:0 bundle:v12 languageCode:v42];
      id v36 = 0;
    }
    else
    {
LABEL_11:
      v27 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[SVXBundleUtils getLocalizedStringWithBundle:table:key:languageCode:gender:]";
        _os_log_impl(&dword_220062000, v27, OS_LOG_TYPE_INFO, "%s No table provided. Checking standard localization tables for result.", buf, 0xCu);
      }
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v28 = SVXLocalizationGetAllTables();
      uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v45 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            v34 = self->_afLocalization;
            if (v12)
            {
              v22 = [(AFLocalization *)self->_afLocalization localizedStringForKey:v43 gender:a7 table:*(void *)(*((void *)&v44 + 1) + 8 * i) bundle:v12 languageCode:v42];
              if (v22) {
                goto LABEL_27;
              }
            }
            else
            {
              v35 = [(SVXBundleUtils *)self getSiriVOXFramework];
              v22 = [(AFLocalization *)v34 localizedStringForKey:v43 gender:a7 table:v33 bundle:v35 languageCode:v42];

              if (v22)
              {
LABEL_27:
                id v36 = v33;
                goto LABEL_28;
              }
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v30) {
            continue;
          }
          break;
        }
        id v36 = 0;
        v22 = 0;
LABEL_28:
        v14 = (os_log_t *)MEMORY[0x263F28348];
      }
      else
      {
        id v36 = 0;
        v22 = 0;
      }

      id v20 = 0;
    }
  }
  v38 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
  {
    v39 = @"true";
    *(_DWORD *)buf = 136316162;
    v50 = "-[SVXBundleUtils getLocalizedStringWithBundle:table:key:languageCode:gender:]";
    __int16 v51 = 2112;
    if (!v22) {
      v39 = @"false";
    }
    v52 = v39;
    __int16 v53 = 2112;
    id v54 = v36;
    __int16 v55 = 2112;
    id v56 = v43;
    __int16 v57 = 2112;
    id v58 = v42;
    _os_log_impl(&dword_220062000, v38, OS_LOG_TYPE_INFO, "%s Localized string found (%@) for table %@, key %@, and languageCode %@", buf, 0x34u);
  }
  v40 = [v22 stringByReplacingOccurrencesOfString:@"\\ESC" withString:@"\x1B"];

  return v40;
}

- (id)getSiriVOXFramework
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SVXBundleUtils_getSiriVOXFramework__block_invoke;
  block[3] = &unk_2645548A0;
  block[4] = self;
  if (getSiriVOXFramework_onceToken != -1) {
    dispatch_once(&getSiriVOXFramework_onceToken, block);
  }
  return (id)getSiriVOXFramework_bundle;
}

uint64_t __37__SVXBundleUtils_getSiriVOXFramework__block_invoke(uint64_t a1)
{
  getSiriVOXFramework_bundle = [*(id *)(a1 + 32) _getSystemFrameworkWithName:@"SiriVOX"];

  return MEMORY[0x270F9A758]();
}

- (SVXBundleUtils)initWithLocalization:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXBundleUtils;
  v6 = [(SVXBundleUtils *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_afLocalization, a3);
  }

  return v7;
}

- (SVXBundleUtils)init
{
  id v3 = [MEMORY[0x263F28530] sharedInstance];
  v4 = [(SVXBundleUtils *)self initWithLocalization:v3];

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_9555);
  }
  v2 = (void *)sharedInstance_singleton;

  return v2;
}

uint64_t __32__SVXBundleUtils_sharedInstance__block_invoke()
{
  sharedInstance_singleton = objc_alloc_init(SVXBundleUtils);

  return MEMORY[0x270F9A758]();
}

@end