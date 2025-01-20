@interface RKBundleDataProvider
- (NSBundle)bundle;
- (NSMutableDictionary)displayStringsByPlatformByLanguage;
- (NSMutableDictionary)localizationsByLanguageID;
- (NSMutableDictionary)polarityMapsByLanguageID;
- (NSURL)assetPlistURL;
- (RKAssets)assets;
- (RKBundleDataProvider)init;
- (RKBundleDataProvider)initWithAssetPlist:(id)a3;
- (RKBundleDataProvider)initWithBundle:(id)a3;
- (id)displayStringsForPlatform:(id)a3 languageID:(id)a4;
- (id)stringsFromTable:(id)a3 forLanguageIdentifier:(id)a4;
- (void)setLocalizationsByLanguageID:(id)a3;
@end

@implementation RKBundleDataProvider

- (RKBundleDataProvider)init
{
  return self;
}

- (RKBundleDataProvider)initWithBundle:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RKBundleDataProvider;
  v6 = [(RKBundleDataProvider *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundle, a3);
    v8 = NSURL;
    v9 = [v5 pathForResource:@"RKAssetsConstantClasses" ofType:@"plist"];
    uint64_t v10 = [v8 URLWithString:v9];
    assetPlistURL = v7->_assetPlistURL;
    v7->_assetPlistURL = (NSURL *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    displayStringsByPlatformByLanguage = v7->_displayStringsByPlatformByLanguage;
    v7->_displayStringsByPlatformByLanguage = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    polarityMapsByLanguageID = v7->_polarityMapsByLanguageID;
    v7->_polarityMapsByLanguageID = (NSMutableDictionary *)v14;

    v16 = objc_alloc_init(RKAssets);
    assets = v7->_assets;
    v7->_assets = v16;
  }
  return v7;
}

- (RKBundleDataProvider)initWithAssetPlist:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RKBundleDataProvider;
  v6 = [(RKBundleDataProvider *)&v18 init];
  v7 = v6;
  if (v6)
  {
    bundle = v6->_bundle;
    v6->_bundle = 0;

    objc_storeStrong((id *)&v7->_assetPlistURL, a3);
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    displayStringsByPlatformByLanguage = v7->_displayStringsByPlatformByLanguage;
    v7->_displayStringsByPlatformByLanguage = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    polarityMapsByLanguageID = v7->_polarityMapsByLanguageID;
    v7->_polarityMapsByLanguageID = (NSMutableDictionary *)v11;

    v13 = [RKAssets alloc];
    uint64_t v14 = [v5 path];
    uint64_t v15 = [(RKAssets *)v13 initWithPlistURL:v14];
    assets = v7->_assets;
    v7->_assets = (RKAssets *)v15;
  }
  return v7;
}

- (id)stringsFromTable:(id)a3 forLanguageIdentifier:(id)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = +[RKAssets localizedStrings];
  v8 = (__CFString *)v6;
  uint64_t v9 = (void *)MEMORY[0x263F086E0];
  v30[0] = v8;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  uint64_t v11 = [v9 preferredLocalizationsFromArray:&unk_26C8EC4B8 forPreferences:v10];
  uint64_t v12 = [v11 firstObject];
  int v13 = [&unk_26C8EC4A0 containsObject:v12];

  uint64_t v14 = v8;
  if (v13)
  {
    uint64_t v15 = (void *)MEMORY[0x263F086E0];
    v16 = [MEMORY[0x263EFF960] preferredLanguages];
    v17 = [v15 preferredLocalizationsFromArray:&unk_26C8EC4D0 forPreferences:v16];
    uint64_t v14 = [v17 firstObject];

    if ([(__CFString *)v14 isEqualToString:@"yue"])
    {

      uint64_t v14 = @"zh_HK";
    }
  }
  objc_super v18 = @"zh_CN";
  if (([(__CFString *)v14 hasPrefix:@"zh-Hans"] & 1) == 0
    && ![(__CFString *)v14 hasPrefix:@"zh_Hans"])
  {
    objc_super v18 = v14;
  }
  objc_super v19 = v18;

  v20 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v19];
  v21 = [v20 objectForKey:*MEMORY[0x263EFF508]];
  int v22 = [v21 isEqualToString:@"ko"];

  if (v22)
  {

    objc_super v19 = @"ko";
  }
  v23 = [v7 objectForKeyedSubscript:v19];
  v24 = [v5 stringByAppendingString:@".strings"];
  v25 = [v23 objectForKeyedSubscript:v24];

  if (!v25)
  {
    uint64_t v26 = [(__CFString *)v19 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    v27 = [v7 objectForKeyedSubscript:v26];
    v28 = [v5 stringByAppendingString:@".strings"];
    v25 = [v27 objectForKeyedSubscript:v28];

    objc_super v19 = (__CFString *)v26;
  }

  return v25;
}

- (id)displayStringsForPlatform:(id)a3 languageID:(id)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263EFF960] canonicalLanguageIdentifierFromString:a4];
  v8 = [(RKBundleDataProvider *)self displayStringsByPlatformByLanguage];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v11 = [(RKBundleDataProvider *)self displayStringsByPlatformByLanguage];
    [v11 setObject:v10 forKeyedSubscript:v6];
  }
  uint64_t v12 = [(RKBundleDataProvider *)self displayStringsByPlatformByLanguage];
  int v13 = [v12 objectForKeyedSubscript:v6];
  uint64_t v14 = [v13 objectForKeyedSubscript:v7];

  if (!v14)
  {
    uint64_t v15 = [(RKBundleDataProvider *)self stringsFromTable:v6 forLanguageIdentifier:v7];
    v16 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v7];
    if (([v7 isEqualToString:v16] & 1) != 0 || objc_msgSend(v15, "count"))
    {
      v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF != ''"];
      objc_super v18 = [MEMORY[0x263EFF9A0] dictionary];
      objc_super v19 = [(RKBundleDataProvider *)self displayStringsByPlatformByLanguage];
      v20 = [v19 objectForKeyedSubscript:v6];
      [v20 setObject:v18 forKeyedSubscript:v7];

      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __61__RKBundleDataProvider_displayStringsForPlatform_languageID___block_invoke;
      v31 = &unk_2642D2B90;
      id v32 = v17;
      v33 = self;
      id v34 = v6;
      id v35 = v7;
      id v21 = v17;
      [v15 enumerateKeysAndObjectsUsingBlock:&v28];
    }
    else
    {
      id v21 = [(RKBundleDataProvider *)self displayStringsForPlatform:v6 languageID:v16];
      int v22 = [(RKBundleDataProvider *)self displayStringsByPlatformByLanguage];
      v23 = [v22 objectForKeyedSubscript:v6];
      [v23 setObject:v21 forKeyedSubscript:v7];
    }
  }
  v24 = [(RKBundleDataProvider *)self displayStringsByPlatformByLanguage];
  v25 = [v24 objectForKeyedSubscript:v6];
  uint64_t v26 = [v25 objectForKeyedSubscript:v7];

  return v26;
}

void __61__RKBundleDataProvider_displayStringsForPlatform_languageID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 array];
  uint64_t v9 = [v6 componentsSeparatedByString:@"/"];

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __61__RKBundleDataProvider_displayStringsForPlatform_languageID___block_invoke_2;
  v17 = &unk_2642D1EF0;
  id v18 = *(id *)(a1 + 32);
  id v19 = v8;
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:&v14];

  uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "displayStringsByPlatformByLanguage", v14, v15, v16, v17);
  uint64_t v12 = [v11 objectForKeyedSubscript:*(void *)(a1 + 48)];
  int v13 = [v12 objectForKeyedSubscript:*(void *)(a1 + 56)];
  [v13 setObject:v10 forKeyedSubscript:v7];
}

void __61__RKBundleDataProvider_displayStringsForPlatform_languageID___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a2;
  id v5 = [v3 whitespaceCharacterSet];
  id v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  id v7 = [v6 filteredArrayUsingPredicate:*(void *)(a1 + 32)];
  id v8 = [v7 componentsJoinedByString:@" "];

  [*(id *)(a1 + 40) addObject:v8];
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 8, 1);
}

- (RKAssets)assets
{
  return (RKAssets *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)assetPlistURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)displayStringsByPlatformByLanguage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)polarityMapsByLanguageID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)localizationsByLanguageID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalizationsByLanguageID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationsByLanguageID, 0);
  objc_storeStrong((id *)&self->_polarityMapsByLanguageID, 0);
  objc_storeStrong((id *)&self->_displayStringsByPlatformByLanguage, 0);
  objc_storeStrong((id *)&self->_assetPlistURL, 0);
  objc_storeStrong((id *)&self->_assets, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end