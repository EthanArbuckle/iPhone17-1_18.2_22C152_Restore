@interface FCIssueListRecordSource
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

@implementation FCIssueListRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8C70;
}

- (id)recordType
{
  return @"IssueList";
}

- (int)pbRecordType
{
  return 11;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D1A30 != -1) {
    dispatch_once(&qword_1EB5D1A30, &__block_literal_global_4_11);
  }
  v2 = (void *)_MergedGlobals_208;
  return v2;
}

uint64_t __45__FCIssueListRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"issueIDs", 0);
  uint64_t v1 = _MergedGlobals_208;
  _MergedGlobals_208 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)storeFilename
{
  return @"issue-list-record-source";
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
  v5 = (objc_class *)MEMORY[0x1E4F82A68];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"issueIDs"];

  v10 = (void *)[v9 mutableCopy];
  [v8 setIssueIDs:v10];

  return v8;
}

@end