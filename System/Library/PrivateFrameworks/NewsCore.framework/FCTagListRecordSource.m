@interface FCTagListRecordSource
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

@implementation FCTagListRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8BE0;
}

- (id)recordType
{
  return @"TagList";
}

- (int)pbRecordType
{
  return 12;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 100000;
}

- (unint64_t)storeVersion
{
  return 1;
}

- (id)storeFilename
{
  return @"tag-list-record-source";
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D18B8 != -1) {
    dispatch_once(&qword_1EB5D18B8, &__block_literal_global_4_10);
  }
  v2 = (void *)_MergedGlobals_197;
  return v2;
}

uint64_t __43__FCTagListRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"tagIDs", 0);
  uint64_t v1 = _MergedGlobals_197;
  _MergedGlobals_197 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F82BD8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"tagIDs"];

  v10 = (void *)[v9 mutableCopy];
  [v8 setTagIDs:v10];

  return v8;
}

@end