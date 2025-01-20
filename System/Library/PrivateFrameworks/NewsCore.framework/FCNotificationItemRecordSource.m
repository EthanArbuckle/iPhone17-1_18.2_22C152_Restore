@interface FCNotificationItemRecordSource
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

@implementation FCNotificationItemRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8868;
}

- (id)recordType
{
  return @"NotificationItem";
}

- (int)pbRecordType
{
  return 17;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 5000000;
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D1048 != -1) {
    dispatch_once(&qword_1EB5D1048, &__block_literal_global_4);
  }
  v2 = (void *)_MergedGlobals_142;
  return v2;
}

uint64_t __52__FCNotificationItemRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"notificationID", @"articleID", @"body", @"clusterID", @"notabilityScores", @"targetDeviceTypes", @"targetMinNewsVersion", @"suppressIfFollowingTagIDs", 0);
  uint64_t v1 = _MergedGlobals_142;
  _MergedGlobals_142 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)storeFilename
{
  return @"notification-item-record-source";
}

- (unint64_t)storeVersion
{
  return 1;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 1000000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F82AF0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"notificationID"];
  [v8 setNotificationID:v9];

  v10 = [v7 objectForKeyedSubscript:@"articleID"];
  [v8 setArticleID:v10];

  v11 = [v7 objectForKeyedSubscript:@"body"];
  [v8 setBody:v11];

  v12 = [v7 objectForKeyedSubscript:@"clusterID"];
  [v8 setClusterID:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F82968]);
  v14 = [v7 objectForKeyedSubscript:@"notabilityScores"];
  v15 = (void *)[v13 initWithData:v14];
  [v8 setNotabilityScores:v15];

  v16 = [v7 objectForKeyedSubscript:@"targetDeviceTypes"];
  objc_msgSend(v8, "setTargetDeviceTypes:", objc_msgSend(v16, "unsignedIntValue"));

  v17 = [v7 objectForKey:@"targetMinNewsVersion"];
  objc_msgSend(v8, "setTargetMinNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v17));

  v18 = [v7 objectForKeyedSubscript:@"suppressIfFollowingTagIDs"];

  [v8 setSuppressIfFollowingTagIDs:v18];
  return v8;
}

@end