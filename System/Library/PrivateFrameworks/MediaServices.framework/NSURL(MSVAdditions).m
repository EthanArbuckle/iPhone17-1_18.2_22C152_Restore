@interface NSURL(MSVAdditions)
+ (id)msv_urlForMediaAssetWithPersistentID:()MSVAdditions pathExtension:;
- (BOOL)msv_isValidMediaAssetURL;
- (uint64_t)msv_mediaAssetPersistentID;
@end

@implementation NSURL(MSVAdditions)

- (uint64_t)msv_mediaAssetPersistentID
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  v2 = [a1 scheme];
  if (([v2 isEqualToString:@"ipod-library"] & 1) == 0)
  {

    return 0;
  }
  v3 = [a1 host];
  int v4 = [v3 isEqualToString:@"item"];

  if (!v4) {
    return 0;
  }
  v5 = [a1 query];
  v6 = [v5 componentsSeparatedByString:@"&"];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "componentsSeparatedByString:", @"=", (void)v18);
        if ((unint64_t)[v12 count] >= 2)
        {
          v13 = [v12 objectAtIndex:0];
          if ([v13 isEqualToString:@"id"])
          {
            v14 = [v12 objectAtIndex:1];
            v15 = [MEMORY[0x1E4F28FE8] scannerWithString:v14];
            [v15 scanLongLong:&v22];

            uint64_t v16 = v22;
            if (v16)
            {

              goto LABEL_18;
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v22;
}

- (BOOL)msv_isValidMediaAssetURL
{
  return objc_msgSend(a1, "msv_mediaAssetPersistentID") != 0;
}

+ (id)msv_urlForMediaAssetWithPersistentID:()MSVAdditions pathExtension:
{
  int v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [NSString stringWithFormat:@"%@://%@/%@.%@?%@=%lli", @"ipod-library", @"item", @"item", a4, @"id", a3];
  v6 = [v4 URLWithString:v5];

  return v6;
}

@end