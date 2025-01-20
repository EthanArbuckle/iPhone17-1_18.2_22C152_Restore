@interface FCArticleListRecordSource
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

@implementation FCArticleListRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8B68;
}

- (unint64_t)storeVersion
{
  return 7;
}

- (id)storeFilename
{
  return @"article-list-record-source";
}

- (id)recordType
{
  return @"ArticleList";
}

- (int)pbRecordType
{
  return 4;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D1650 != -1) {
    dispatch_once(&qword_1EB5D1650, &__block_literal_global_4_7);
  }
  v2 = (void *)_MergedGlobals_176;
  return v2;
}

uint64_t __47__FCArticleListRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"articleIDs", @"type", @"metadata", 0);
  uint64_t v1 = _MergedGlobals_176;
  _MergedGlobals_176 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F829A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"articleIDs"];
  v10 = (void *)[v9 mutableCopy];
  [v8 setArticleIDs:v10];

  v11 = [v7 objectForKeyedSubscript:@"type"];
  [v8 setType:PBArticleListTypeFromString((uint64_t)v11)];

  v12 = [v7 objectForKeyedSubscript:@"metadata"];

  [v8 setMetadata:v12];
  return v8;
}

@end