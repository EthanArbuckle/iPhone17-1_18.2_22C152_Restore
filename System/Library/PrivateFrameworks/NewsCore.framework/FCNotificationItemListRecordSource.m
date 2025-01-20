@interface FCNotificationItemListRecordSource
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

@implementation FCNotificationItemListRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8B38;
}

- (id)recordType
{
  return @"NotificationItemList";
}

- (int)pbRecordType
{
  return 18;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D1570 != -1) {
    dispatch_once(&qword_1EB5D1570, &__block_literal_global_4_5);
  }
  v2 = (void *)_MergedGlobals_170;
  return v2;
}

uint64_t __56__FCNotificationItemListRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"notificationItemIDs", @"notificationSource", @"algoID", 0);
  uint64_t v1 = _MergedGlobals_170;
  _MergedGlobals_170 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)storeFilename
{
  return @"notification-item-list-record-source";
}

- (unint64_t)storeVersion
{
  return 2;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 500000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F82AE8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"notificationItemIDs"];
  [v8 setNotificationItemIDs:v9];

  v10 = [v7 objectForKeyedSubscript:@"notificationSource"];
  [v8 setNotificationSource:FCNotificationSourceFromString(v10)];

  v11 = [v7 objectForKeyedSubscript:@"algoID"];

  [v8 setAlgoID:v11];
  return v8;
}

@end