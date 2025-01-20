@interface FCPurchaseLookupRecordSource
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

@implementation FCPurchaseLookupRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8B80;
}

- (id)recordType
{
  return @"PurchaseLookup";
}

- (unint64_t)storeVersion
{
  return 4;
}

- (id)storeFilename
{
  return @"purchaselookup-record-source";
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F82B60];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setBase:v6];

  v9 = [v7 objectForKeyedSubscript:@"appAdamID"];
  [v8 setAppAdamID:v9];

  v10 = [v7 objectForKeyedSubscript:@"channelTagIDs"];
  v11 = (void *)[v10 mutableCopy];
  [v8 setChannelTagIDs:v11];

  v12 = [v7 objectForKeyedSubscript:@"bundleChannelTagIDs"];
  v13 = (void *)[v12 mutableCopy];
  [v8 setBundleChannelTagIDs:v13];

  v14 = [v7 objectForKeyedSubscript:@"bundleChannelTagIDsVersion"];

  [v8 setBundleChannelTagIDsVersion:v14];
  return v8;
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D1730 != -1) {
    dispatch_once(&qword_1EB5D1730, &__block_literal_global_4_8);
  }
  v2 = (void *)_MergedGlobals_181;
  return v2;
}

- (int)pbRecordType
{
  return 6;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

uint64_t __50__FCPurchaseLookupRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"appAdamID", @"channelTagIDs", @"bundleChannelTagIDs", @"bundleChannelTagIDsVersion", 0);
  uint64_t v1 = _MergedGlobals_181;
  _MergedGlobals_181 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

+ (id)defaultCachePolicy
{
  if (qword_1EB5D1740 != -1) {
    dispatch_once(&qword_1EB5D1740, &__block_literal_global_10);
  }
  v2 = (void *)qword_1EB5D1738;
  return v2;
}

uint64_t __50__FCPurchaseLookupRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1EB5D1738;
  qword_1EB5D1738 = v0;

  [(id)qword_1EB5D1738 setCachePolicy:4];
  v2 = (void *)qword_1EB5D1738;
  return [v2 setMaximumCachedAge:900.0];
}

@end