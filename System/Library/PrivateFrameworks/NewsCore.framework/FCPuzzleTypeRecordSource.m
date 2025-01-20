@interface FCPuzzleTypeRecordSource
+ (BOOL)recognizesRecordID:(id)a3;
+ (id)defaultCachePolicy;
+ (id)recordIDPrefixes;
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

@implementation FCPuzzleTypeRecordSource

+ (id)recordIDPrefixes
{
  return &unk_1EF8D8B08;
}

- (id)recordIDPrefixes
{
  return +[FCPuzzleTypeRecordSource recordIDPrefixes];
}

+ (BOOL)recognizesRecordID:(id)a3
{
  id v3 = a3;
  v4 = +[FCPuzzleTypeRecordSource recordIDPrefixes];
  BOOL v5 = +[FCRecordSource recognizesRecordID:v3 inRecordIDPrefixes:v4];

  return v5;
}

- (id)recordType
{
  return @"PuzzleType";
}

- (int)pbRecordType
{
  return 16;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D13C0 != -1) {
    dispatch_once(&qword_1EB5D13C0, &__block_literal_global_4_4);
  }
  v2 = (void *)_MergedGlobals_167;
  return v2;
}

uint64_t __46__FCPuzzleTypeRecordSource_nonLocalizableKeys__block_invoke_2()
{
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"name", @"nameCompact", @"kind", @"behaviorFlags", @"engineResourceID", @"superfeedConfigResourceID", @"latestPuzzleIDs", @"promotedPuzzleIDs", @"nameImage", @"nameImageForDarkBackground", @"coverImage", @"feedNavImage", @"navigationChromeBackgroundImage", @"navigationChromeBackgroundImageCompact", @"navigationChromeBackgroundImageLarge", @"navigationChromeBackgroundDarkModeImage", @"navigationChromeBackgroundDarkModeImageCompact",
    @"navigationChromeBackgroundDarkModeImageLarge",
    @"language",
    @"blockedStorefrontIDs",
    @"allowedStorefrontIDs",
    @"minNewsVersion",
    @"exploreTileImage",
    @"themeConfiguration",
    @"imagesResourceID",
    @"isPublic",
  uint64_t v0 = 0);
  uint64_t v1 = _MergedGlobals_167;
  _MergedGlobals_167 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)storeFilename
{
  return @"puzzle-type-record-source";
}

- (unint64_t)storeVersion
{
  return 3;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  BOOL v5 = (objc_class *)MEMORY[0x1E4F82B80];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"name"];
  [v8 setName:v9];

  v10 = [v7 objectForKeyedSubscript:@"nameCompact"];
  [v8 setNameCompact:v10];

  v11 = [v7 objectForKeyedSubscript:@"kind"];
  [v8 setKind:v11];

  v12 = [v7 objectForKeyedSubscript:@"behaviorFlags"];
  objc_msgSend(v8, "setBehaviorFlags:", objc_msgSend(v12, "unsignedLongLongValue"));

  v13 = [v7 objectForKeyedSubscript:@"engineResourceID"];
  [v8 setEngineResourceID:v13];

  v14 = [v7 objectForKeyedSubscript:@"superfeedConfigResourceID"];
  [v8 setSuperfeedConfigResourceID:v14];

  v15 = [v7 objectForKeyedSubscript:@"latestPuzzleIDs"];
  [v8 setLatestPuzzleIDs:v15];

  v16 = [v7 objectForKeyedSubscript:@"promotedPuzzleIDs"];
  [v8 setPromotedPuzzleIDs:v16];

  v17 = [v7 objectForKeyedSubscript:@"coverImage"];
  [v8 setCoverImageURL:v17];

  v18 = [v7 objectForKeyedSubscript:@"nameImage"];
  [v8 setNameImageURL:v18];

  v19 = [v7 objectForKeyedSubscript:@"nameImageForDarkBackground"];
  [v8 setNameImageForDarkBackgroundURL:v19];

  v20 = [v7 objectForKeyedSubscript:@"feedNavImage"];
  [v8 setFeedNavImageURL:v20];

  v21 = [v7 objectForKeyedSubscript:@"navigationChromeBackgroundImage"];
  [v8 setNavigationChromeBackgroundImageURL:v21];

  v22 = [v7 objectForKeyedSubscript:@"navigationChromeBackgroundImageCompact"];
  [v8 setNavigationChromeBackgroundImageCompactURL:v22];

  v23 = [v7 objectForKeyedSubscript:@"navigationChromeBackgroundImageLarge"];
  [v8 setNavigationChromeBackgroundImageLargeURL:v23];

  v24 = [v7 objectForKeyedSubscript:@"navigationChromeBackgroundDarkModeImage"];
  [v8 setNavigationChromeBackgroundDarkModeImageURL:v24];

  v25 = [v7 objectForKeyedSubscript:@"navigationChromeBackgroundDarkModeImageCompact"];
  [v8 setNavigationChromeBackgroundDarkModeImageCompactURL:v25];

  v26 = [v7 objectForKeyedSubscript:@"navigationChromeBackgroundDarkModeImageLarge"];
  [v8 setNavigationChromeBackgroundDarkModeImageLargeURL:v26];

  v27 = [v7 objectForKeyedSubscript:@"language"];
  [v8 setLanguage:v27];

  v28 = [v7 objectForKeyedSubscript:@"blockedStorefrontIDs"];
  v29 = (void *)[v28 mutableCopy];
  [v8 setBlockedStorefrontIDs:v29];

  v30 = [v7 objectForKeyedSubscript:@"allowedStorefrontIDs"];
  v31 = (void *)[v30 mutableCopy];
  [v8 setAllowedStorefrontIDs:v31];

  v32 = [v7 objectForKeyedSubscript:@"minNewsVersion"];
  objc_msgSend(v8, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v32));

  v33 = [v7 objectForKeyedSubscript:@"exploreTileImage"];
  [v8 setExploreTileImageURL:v33];

  v34 = [v7 objectForKeyedSubscript:@"themeConfiguration"];
  [v8 setThemeConfiguration:v34];

  v35 = [v7 objectForKeyedSubscript:@"imagesResourceID"];
  [v8 setImagesResourceID:v35];

  v36 = [v7 objectForKeyedSubscript:@"isPublic"];

  objc_msgSend(v8, "setIsPublic:", objc_msgSend(v36, "BOOLValue"));
  return v8;
}

+ (id)defaultCachePolicy
{
  if (qword_1EB5D13D0 != -1) {
    dispatch_once(&qword_1EB5D13D0, &__block_literal_global_13_0);
  }
  v2 = (void *)qword_1EB5D13C8;
  return v2;
}

uint64_t __46__FCPuzzleTypeRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1EB5D13C8;
  qword_1EB5D13C8 = v0;

  [(id)qword_1EB5D13C8 setCachePolicy:4];
  v2 = (void *)qword_1EB5D13C8;
  return [v2 setMaximumCachedAge:28800.0];
}

@end