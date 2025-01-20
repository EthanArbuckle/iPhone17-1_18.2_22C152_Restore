@interface FCChannelMembershipRecordSource
- (id)nonLocalizableKeys;
- (id)recordFromCKRecord:(id)a3 base:(id)a4;
- (id)recordType;
- (id)storeFilename;
- (int)pbRecordType;
- (unint64_t)highThresholdDataSizeLimit;
- (unint64_t)lowThresholdDataSizeLimit;
- (unint64_t)storeVersion;
@end

@implementation FCChannelMembershipRecordSource

- (id)recordType
{
  return @"Membership";
}

- (int)pbRecordType
{
  return 5;
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D1B58 != -1) {
    dispatch_once(&qword_1EB5D1B58, &__block_literal_global_4_13);
  }
  v2 = (void *)_MergedGlobals_222;
  return v2;
}

uint64_t __53__FCChannelMembershipRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"channelTagID", @"canAccessDrafts", @"draftsArticleListID", @"draftsIssueListID", 0);
  uint64_t v1 = _MergedGlobals_222;
  _MergedGlobals_222 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)storeFilename
{
  return @"channel-membership-record-source";
}

- (unint64_t)storeVersion
{
  return 7;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 1000;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 100000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F82A00];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"channelTagID"];
  [v8 setChannelID:v9];

  v10 = [v7 objectForKeyedSubscript:@"canAccessDrafts"];
  objc_msgSend(v8, "setCanAccessDrafts:", objc_msgSend(v10, "BOOLValue"));

  v11 = [v7 objectForKeyedSubscript:@"draftsArticleListID"];
  [v8 setDraftArticleListID:v11];

  v12 = [v7 objectForKeyedSubscript:@"draftsIssueListID"];

  [v8 setDraftIssueListID:v12];
  return v8;
}

@end