@interface NTPBRecordBase
- (BOOL)hasExpiredAssetURLs;
- (BOOL)needsAssetURLRefresh;
@end

@implementation NTPBRecordBase

- (BOOL)needsAssetURLRefresh
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    v2 = [a1 assetURLsDate];
    if (v2)
    {
      v3 = (void *)MEMORY[0x1E4F1C9C8];
      v4 = [(id)v1 assetURLsDate];
      v5 = [v3 dateWithPBDate:v4];
      objc_msgSend(v5, "fc_timeIntervalUntilNow");
      BOOL v1 = v6 >= 604800.0;
    }
    else
    {
      BOOL v1 = 1;
    }
  }
  return v1;
}

- (BOOL)hasExpiredAssetURLs
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    v2 = [a1 assetURLsDate];
    if (v2)
    {
      v3 = (void *)MEMORY[0x1E4F1C9C8];
      v4 = [(id)v1 assetURLsDate];
      v5 = [v3 dateWithPBDate:v4];
      objc_msgSend(v5, "fc_timeIntervalUntilNow");
      BOOL v1 = v6 >= 2592000.0;
    }
    else
    {
      BOOL v1 = 1;
    }
  }
  return v1;
}

@end