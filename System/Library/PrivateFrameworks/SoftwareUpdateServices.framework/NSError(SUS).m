@interface NSError(SUS)
- (BOOL)isCatalogNotFound;
- (BOOL)isUpToDate;
- (uint64_t)noMatchingUpdateFound;
@end

@implementation NSError(SUS)

- (BOOL)isUpToDate
{
  v2 = [a1 domain];
  char v3 = [v2 isEqualToString:@"com.apple.softwareupdateservices.errors"];

  if (v3)
  {
    uint64_t v4 = 3;
    return [a1 code] == v4;
  }
  v5 = [a1 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F78050]];

  if (v6)
  {
    uint64_t v4 = 8406;
    return [a1 code] == v4;
  }
  return 0;
}

- (BOOL)isCatalogNotFound
{
  id v1 = a1;
  v2 = [v1 domain];
  int v3 = [v2 isEqualToString:@"com.apple.softwareupdateservices.errors"];

  if (!v3) {
    goto LABEL_4;
  }
  if ([v1 code] != 57) {
    goto LABEL_10;
  }
  uint64_t v4 = [v1 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  id v1 = (id)v5;
  if (v5)
  {
LABEL_4:
    int v6 = [v1 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x263F78050]];

    if (!v7) {
      goto LABEL_7;
    }
    if ([v1 code] != 8400) {
      goto LABEL_10;
    }
    v8 = [v1 userInfo];
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    id v1 = (id)v9;
    if (v9)
    {
LABEL_7:
      v10 = [v1 domain];
      int v11 = [v10 isEqualToString:@"com.apple.MobileAssetError.Download"];

      if (v11)
      {
        if ([v1 code] != 44)
        {
          BOOL v12 = [v1 code] == 40;
          goto LABEL_11;
        }
        goto LABEL_9;
      }
LABEL_10:
      BOOL v12 = 0;
      goto LABEL_11;
    }
  }
LABEL_9:
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (uint64_t)noMatchingUpdateFound
{
  if ([a1 shouldFallbackToCustomerScan]) {
    return 1;
  }
  int v3 = [a1 domain];
  if ([v3 isEqualToString:@"com.apple.softwareupdateservices.errors"]) {
    BOOL v2 = [a1 code] == 105;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

@end