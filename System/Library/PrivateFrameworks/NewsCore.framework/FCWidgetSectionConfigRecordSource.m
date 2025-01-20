@interface FCWidgetSectionConfigRecordSource
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

@implementation FCWidgetSectionConfigRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8BB0;
}

- (id)recordType
{
  return @"WidgetSectionConfig";
}

- (int)pbRecordType
{
  return 8;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 100000;
}

- (unint64_t)storeVersion
{
  return 4;
}

- (id)storeFilename
{
  return @"widget-section-config-record-source";
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D1790 != -1) {
    dispatch_once(&qword_1EB5D1790, &__block_literal_global_10_0);
  }
  v2 = (void *)_MergedGlobals_186;
  return v2;
}

uint64_t __55__FCWidgetSectionConfigRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"configuration2", @"singleTagConfiguration", @"articleListIDs2", @"articleIDs2", 0);
  uint64_t v1 = _MergedGlobals_186;
  _MergedGlobals_186 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F82C60];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"configuration2"];
  [v8 setConfiguration2:v9];

  v10 = [v7 objectForKeyedSubscript:@"singleTagConfiguration"];
  [v8 setSingleTagConfiguration:v10];

  v11 = [v7 objectForKeyedSubscript:@"articleListIDs2"];
  [v8 setArticleListIDs2s:v11];

  v12 = [v7 objectForKeyedSubscript:@"articleIDs2"];

  [v8 setArticleIDs2s:v12];
  return v8;
}

@end