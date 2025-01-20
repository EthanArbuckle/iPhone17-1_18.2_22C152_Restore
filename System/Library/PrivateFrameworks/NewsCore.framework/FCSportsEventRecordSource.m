@interface FCSportsEventRecordSource
+ (BOOL)recognizesRecordID:(id)a3;
+ (id)defaultCachePolicy;
+ (id)recordIDPrefixes;
- (id)localizableKeys;
- (id)localizableLanguageSpecificKeys;
- (id)nonLocalizableKeys;
- (id)recordFromCKRecord:(id)a3 base:(id)a4;
- (id)recordIDPrefixes;
- (id)recordType;
- (id)storeFilename;
- (int)pbRecordType;
- (unint64_t)highThresholdDataSizeLimit;
- (unint64_t)lowThresholdDataSizeLimit;
- (unint64_t)storeVersion;
@end

@implementation FCSportsEventRecordSource

- (id)recordIDPrefixes
{
  return +[FCSportsEventRecordSource recordIDPrefixes];
}

+ (id)recordIDPrefixes
{
  return &unk_1EF8D8CD0;
}

- (id)recordType
{
  return @"SportsEvent";
}

- (int)pbRecordType
{
  return 14;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 8000000;
}

- (unint64_t)storeVersion
{
  return 1;
}

- (id)storeFilename
{
  return @"sports-event-record-source";
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F82BD0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setBase:v7];

  v10 = [(FCRecordSource *)self localizedLanguageSpecificKeysByOriginalKey];
  v11 = [(FCRecordSource *)self localizedKeysByOriginalKey];
  v12 = [(FCRecordSource *)self valueFromCKRecord:v8 baseKey:@"superfeedConfigResourceID" localizedKeys:v11 localizedLanguageSpecificKeys:v10];
  [v9 setSuperfeedConfigResourceID:v12];

  v13 = [(FCRecordSource *)self valueFromCKRecord:v8 baseKey:@"eventArticleListID" localizedKeys:v11 localizedLanguageSpecificKeys:v10];
  [v9 setEventArticleListID:v13];

  v14 = [(FCRecordSource *)self valueFromCKRecord:v8 baseKey:@"highlightsArticleListID" localizedKeys:v11 localizedLanguageSpecificKeys:v10];
  [v9 setHighlightsArticleListID:v14];

  v15 = [(FCRecordSource *)self valueFromCKRecord:v8 baseKey:@"eventCompetitorTagIDs" localizedKeys:v11 localizedLanguageSpecificKeys:v10];
  [v9 setEventCompetitorTagIDs:v15];

  v16 = [(FCRecordSource *)self valueFromCKRecord:v8 baseKey:@"eventLeagueTagID" localizedKeys:v11 localizedLanguageSpecificKeys:v10];
  [v9 setEventLeagueTagID:v16];

  v17 = [(FCRecordSource *)self valueFromCKRecord:v8 baseKey:@"sportsData" localizedKeys:v11 localizedLanguageSpecificKeys:v10];
  [v9 setSportsData:v17];

  v18 = [v8 objectForKeyedSubscript:@"minNewsVersion"];
  objc_msgSend(v9, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v18));

  v19 = [v8 objectForKeyedSubscript:@"sportsTheme"];
  [v9 setSportsTheme:v19];

  v20 = [v8 objectForKeyedSubscript:@"isDeprecated"];
  objc_msgSend(v9, "setIsDeprecated:", objc_msgSend(v20, "BOOLValue"));

  v21 = [v8 objectForKey:@"blockedStorefrontIDs"];
  v22 = (void *)[v21 mutableCopy];
  [v9 setBlockedStorefrontIDs:v22];

  v23 = [v8 objectForKey:@"allowedStorefrontIDs"];

  v24 = (void *)[v23 mutableCopy];
  [v9 setAllowedStorefrontIDs:v24];

  return v9;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 4000000;
}

+ (BOOL)recognizesRecordID:(id)a3
{
  id v3 = a3;
  v4 = +[FCSportsEventRecordSource recordIDPrefixes];
  BOOL v5 = +[FCRecordSource recognizesRecordID:v3 inRecordIDPrefixes:v4];

  return v5;
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D1B68 != -1) {
    dispatch_once(&qword_1EB5D1B68, &__block_literal_global_10_1);
  }
  v2 = (void *)_MergedGlobals_223;
  return v2;
}

uint64_t __47__FCSportsEventRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"minNewsVersion", @"sportsTheme", @"isDeprecated", @"blockedStorefrontIDs", @"allowedStorefrontIDs", 0);
  uint64_t v1 = _MergedGlobals_223;
  _MergedGlobals_223 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)localizableKeys
{
  if (qword_1EB5D1B78 != -1) {
    dispatch_once(&qword_1EB5D1B78, &__block_literal_global_15_2);
  }
  v2 = (void *)qword_1EB5D1B70;
  return v2;
}

uint64_t __44__FCSportsEventRecordSource_localizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"superfeedConfigResourceID", @"eventCompetitorTagIDs", @"eventLeagueTagID", @"sportsData", @"highlightsArticleListID", @"eventArticleListID", 0);
  uint64_t v1 = qword_1EB5D1B70;
  qword_1EB5D1B70 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)localizableLanguageSpecificKeys
{
  if (qword_1EB5D1B88 != -1) {
    dispatch_once(&qword_1EB5D1B88, &__block_literal_global_19_3);
  }
  v2 = (void *)qword_1EB5D1B80;
  return v2;
}

uint64_t __60__FCSportsEventRecordSource_localizableLanguageSpecificKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"superfeedConfigResourceID", @"eventCompetitorTagIDs", @"eventLeagueTagID", @"sportsData", @"highlightsArticleListID", @"eventArticleListID", 0);
  uint64_t v1 = qword_1EB5D1B80;
  qword_1EB5D1B80 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)defaultCachePolicy
{
  if (qword_1EB5D1B98 != -1) {
    dispatch_once(&qword_1EB5D1B98, &__block_literal_global_21_2);
  }
  v2 = (void *)qword_1EB5D1B90;
  return v2;
}

uint64_t __47__FCSportsEventRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1EB5D1B90;
  qword_1EB5D1B90 = v0;

  [(id)qword_1EB5D1B90 setCachePolicy:4];
  v2 = (void *)qword_1EB5D1B90;
  return [v2 setMaximumCachedAge:1500.0];
}

@end