@interface FCForYouConfigRecordSource
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

@implementation FCForYouConfigRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8BC8;
}

- (id)recordType
{
  return @"ForYouConfig";
}

- (int)pbRecordType
{
  return 7;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

- (unint64_t)storeVersion
{
  return 5;
}

- (id)storeFilename
{
  return @"for-you-config-record-source";
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D18A8 != -1) {
    dispatch_once(&qword_1EB5D18A8, &__block_literal_global_4_9);
  }
  v2 = (void *)_MergedGlobals_196;
  return v2;
}

uint64_t __48__FCForYouConfigRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"configuration", @"todayFeedConfiguration", @"editorialArticleListIDs", @"todayFeedTopStoriesArticleIDs", @"trendingArticleListID", @"editorialSectionTagIDs", @"spotlightArticleID", 0);
  uint64_t v1 = _MergedGlobals_196;
  _MergedGlobals_196 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F82A60];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"configuration"];
  [v8 setConfiguration:v9];

  v10 = [v7 objectForKeyedSubscript:@"todayFeedConfiguration"];
  [v8 setTodayFeedConfiguration:v10];

  v11 = [v7 objectForKeyedSubscript:@"todayFeedTopStoriesArticleIDs"];
  [v8 setTodayFeedTopStoriesArticleIDs:v11];

  v12 = [v7 objectForKeyedSubscript:@"trendingArticleListID"];
  [v8 setTrendingArticleListID:v12];

  v13 = [v7 objectForKeyedSubscript:@"editorialArticleListIDs"];
  [v8 setEditorialArticleListIDs:v13];

  v14 = [v7 objectForKeyedSubscript:@"editorialSectionTagIDs"];
  [v8 setEditorialSectionTagIDs:v14];

  v15 = [v7 objectForKeyedSubscript:@"spotlightArticleID"];

  [v8 setSpotlightArticleID:v15];
  return v8;
}

@end