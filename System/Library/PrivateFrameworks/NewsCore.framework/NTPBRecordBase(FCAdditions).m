@interface NTPBRecordBase(FCAdditions)
- (BOOL)fc_isCachedAgeGreaterThan:()FCAdditions;
- (BOOL)fc_isCachedAgeLessThan:()FCAdditions;
- (BOOL)fc_isNewerThan:()FCAdditions;
- (FCContentManifest)contentManifest;
@end

@implementation NTPBRecordBase(FCAdditions)

- (BOOL)fc_isCachedAgeLessThan:()FCAdditions
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  v4 = [a1 fetchDate];
  v5 = [v3 dateWithPBDate:v4];
  objc_msgSend(v5, "fc_timeIntervalUntilNow");
  BOOL v7 = v6 < a2;

  return v7;
}

- (BOOL)fc_isCachedAgeGreaterThan:()FCAdditions
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  v4 = [a1 fetchDate];
  v5 = [v3 dateWithPBDate:v4];
  objc_msgSend(v5, "fc_timeIntervalUntilNow");
  BOOL v7 = v6 > a2;

  return v7;
}

- (FCContentManifest)contentManifest
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [FCContentManifest alloc];
  v3 = [a1 identifier];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [(FCContentManifest *)v2 initWithRecordIDs:v4];

  return v5;
}

- (BOOL)fc_isNewerThan:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 modificationDate];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  v8 = [v4 modificationDate];

  [v8 timeIntervalSince1970];
  double v10 = v9;

  return v7 > v10 + 0.001;
}

@end