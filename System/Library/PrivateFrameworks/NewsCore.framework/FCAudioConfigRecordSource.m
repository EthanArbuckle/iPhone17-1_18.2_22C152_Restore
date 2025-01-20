@interface FCAudioConfigRecordSource
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

@implementation FCAudioConfigRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D88C8;
}

- (id)recordType
{
  return @"AudioConfig";
}

- (int)pbRecordType
{
  return 13;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D10A8 != -1) {
    dispatch_once(&qword_1EB5D10A8, &__block_literal_global_4_1);
  }
  v2 = (void *)_MergedGlobals_146;
  return v2;
}

uint64_t __47__FCAudioConfigRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"configuration", @"curatedArticleIDs", @"dailyBriefingArticleID", @"featuredAudioArticleListID", @"feedConfiguration", @"heroArticleIDs", @"latestAudioArticleListID", 0);
  uint64_t v1 = _MergedGlobals_146;
  _MergedGlobals_146 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)storeFilename
{
  return @"audio-config-record-source";
}

- (unint64_t)storeVersion
{
  return 1;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F829C8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"configuration"];
  [v8 setConfiguration:v9];

  v10 = [v7 objectForKeyedSubscript:@"curatedArticleIDs"];
  [v8 setCuratedArticleIDs:v10];

  v11 = [v7 objectForKeyedSubscript:@"dailyBriefingArticleID"];
  [v8 setDailyBriefingArticleID:v11];

  v12 = [v7 objectForKeyedSubscript:@"featuredAudioArticleListID"];
  [v8 setFeaturedAudioArticleListID:v12];

  v13 = [v7 objectForKeyedSubscript:@"feedConfiguration"];
  [v8 setFeedConfiguration:v13];

  v14 = [v7 objectForKeyedSubscript:@"heroArticleIDs"];
  [v8 setHeroArticleIDs:v14];

  v15 = [v7 objectForKeyedSubscript:@"latestAudioArticleListID"];

  [v8 setLatestAudioArticleListID:v15];
  return v8;
}

@end