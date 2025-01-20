@interface FCPuzzleRecordSource
+ (id)defaultCachePolicy;
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

@implementation FCPuzzleRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8AF0;
}

- (id)recordType
{
  return @"Puzzle";
}

- (int)pbRecordType
{
  return 15;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 2000000;
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D1290 != -1) {
    dispatch_once(&qword_1EB5D1290, &__block_literal_global_4_3);
  }
  v2 = (void *)_MergedGlobals_161;
  return v2;
}

uint64_t __42__FCPuzzleRecordSource_nonLocalizableKeys__block_invoke_2()
{
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"title", @"subtitle", @"description", @"puzzleTypeID", @"dataResourceID", @"authors", @"isPaid", @"publishDate", @"difficulty", @"relatedPuzzleIDs", @"thumbnailSmall", @"thumbnailLarge", @"language", @"blockedStorefrontIDs", @"allowedStorefrontIDs", @"minNewsVersion", @"teaserConfiguration",
    @"behaviorFlags",
    @"isDeprecated",
    @"isDraft",
  uint64_t v0 = 0);
  uint64_t v1 = _MergedGlobals_161;
  _MergedGlobals_161 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)storeFilename
{
  return @"puzzle-record-source";
}

- (unint64_t)storeVersion
{
  return 2;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 1000000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F82B78];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"title"];
  [v8 setTitle:v9];

  v10 = [v7 objectForKeyedSubscript:@"subtitle"];
  [v8 setSubtitle:v10];

  v11 = [v7 objectForKeyedSubscript:@"description"];
  [v8 setPuzzleDescription:v11];

  v12 = [v7 objectForKeyedSubscript:@"dataResourceID"];
  [v8 setDataResourceID:v12];

  v13 = [v7 objectForKeyedSubscript:@"puzzleTypeID"];
  [v8 setPuzzleTypeID:v13];

  v14 = [v7 objectForKeyedSubscript:@"authors"];
  v15 = (void *)[v14 mutableCopy];
  [v8 setAuthors:v15];

  v16 = [v7 objectForKeyedSubscript:@"isPaid"];
  objc_msgSend(v8, "setIsPaid:", objc_msgSend(v16, "BOOLValue"));

  v17 = [v7 objectForKeyedSubscript:@"publishDate"];
  v18 = [v17 pbDate];
  [v8 setPublishedDate:v18];

  v19 = [v7 objectForKeyedSubscript:@"difficulty"];
  objc_msgSend(v8, "setDifficultyLevel:", objc_msgSend(v19, "unsignedLongLongValue"));

  v20 = [v7 objectForKeyedSubscript:@"relatedPuzzleIDs"];
  v21 = (void *)[v20 mutableCopy];
  [v8 setRelatedPuzzleIDs:v21];

  v22 = [v7 objectForKeyedSubscript:@"thumbnailSmall"];
  [v8 setThumbnailImageCompactURL:v22];

  v23 = [v7 objectForKeyedSubscript:@"thumbnailLarge"];
  [v8 setThumbnailImageLargeURL:v23];

  v24 = [v7 objectForKeyedSubscript:@"language"];
  [v8 setLanguage:v24];

  v25 = [v7 objectForKeyedSubscript:@"blockedStorefrontIDs"];
  v26 = (void *)[v25 mutableCopy];
  [v8 setBlockedStorefrontIDs:v26];

  v27 = [v7 objectForKeyedSubscript:@"allowedStorefrontIDs"];
  v28 = (void *)[v27 mutableCopy];
  [v8 setAllowedStorefrontIDs:v28];

  v29 = [v7 objectForKeyedSubscript:@"minNewsVersion"];
  objc_msgSend(v8, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v29));

  v30 = [v7 objectForKeyedSubscript:@"teaserConfiguration"];
  [v8 setTeaserConfiguration:v30];

  v31 = [v7 objectForKey:@"behaviorFlags"];
  objc_msgSend(v8, "setBehaviorFlags:", objc_msgSend(v31, "unsignedLongLongValue"));

  v32 = [v7 objectForKeyedSubscript:@"isDeprecated"];
  objc_msgSend(v8, "setIsDeprecated:", objc_msgSend(v32, "BOOLValue"));

  v33 = [v7 objectForKeyedSubscript:@"isDraft"];

  objc_msgSend(v8, "setIsDraft:", objc_msgSend(v33, "BOOLValue"));
  return v8;
}

+ (id)defaultCachePolicy
{
  if (qword_1EB5D12A0 != -1) {
    dispatch_once(&qword_1EB5D12A0, &__block_literal_global_11);
  }
  v2 = (void *)qword_1EB5D1298;
  return v2;
}

uint64_t __42__FCPuzzleRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1EB5D1298;
  qword_1EB5D1298 = v0;

  [(id)qword_1EB5D1298 setCachePolicy:4];
  v2 = (void *)qword_1EB5D1298;
  return [v2 setMaximumCachedAge:86400.0];
}

@end