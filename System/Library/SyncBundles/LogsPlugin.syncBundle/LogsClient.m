@interface LogsClient
- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5;
- (id)currentSyncAnchor;
- (id)installedAssetMetrics;
- (id)outstandingAssetTransfers;
- (id)supportedDataclasses;
@end

@implementation LogsClient

- (id)installedAssetMetrics
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [&off_4300 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(&off_4300);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v8 = ATGetUsageForPath();
        v9 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          int v19 = 0;
          __int16 v20 = 2048;
          uint64_t v21 = v8;
          __int16 v22 = 2114;
          uint64_t v23 = v7;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "found %d files [%lld bytes] of logs in '%{public}@'", buf, 0x1Cu);
        }

        v4 += v8;
      }
      id v3 = [&off_4300 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  v10 = +[NSNumber numberWithUnsignedLongLong:0];
  v11 = +[NSNumber numberWithUnsignedLongLong:v4];
  v12 = +[NSDictionary dictionaryWithObjectsAndKeys:v10, @"_Count", v11, @"_PhysicalSize", 0];

  return v12;
}

- (id)outstandingAssetTransfers
{
  return 0;
}

- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)currentSyncAnchor
{
  return @"0";
}

- (id)supportedDataclasses
{
  return +[NSArray arrayWithObject:@"Logs"];
}

@end