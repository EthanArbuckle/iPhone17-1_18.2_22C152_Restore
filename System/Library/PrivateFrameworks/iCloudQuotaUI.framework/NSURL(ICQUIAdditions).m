@interface NSURL(ICQUIAdditions)
+ (id)icqURLForIndex:()ICQUIAdditions;
- (uint64_t)icqIndex;
- (uint64_t)icqui_isJoinOrLeaveFamilySharingURL;
- (uint64_t)icqui_isStopFamilySharingURL;
@end

@implementation NSURL(ICQUIAdditions)

+ (id)icqURLForIndex:()ICQUIAdditions
{
  v0 = NSURL;
  v1 = NSString;
  v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  v3 = [v1 stringWithFormat:@"%@://%@", @"icq", v2];
  v4 = [v0 URLWithString:v3];

  return v4;
}

- (uint64_t)icqIndex
{
  uint64_t v2 = [a1 scheme];
  if (!v2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v3 = (void *)v2;
  v4 = [a1 scheme];
  if (([v4 isEqualToString:@"icq"] & 1) == 0)
  {

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v5 = [a1 host];

  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v6 = [a1 host];
  uint64_t v11 = 0;
  v7 = [MEMORY[0x263F08B08] scannerWithString:v6];
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ([v7 scanInteger:&v11])
  {
    uint64_t v9 = [v7 scanLocation];
    if (v9 == [v6 length]) {
      uint64_t v8 = v11;
    }
  }

  return v8;
}

- (uint64_t)icqui_isStopFamilySharingURL
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v1 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:a1 resolvingAgainstBaseURL:1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = objc_msgSend(v1, "queryItems", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = [v7 name];
        if ([v8 isEqualToString:@"action"])
        {
          uint64_t v9 = [v7 value];
          char v10 = [v9 isEqualToString:@"STOP_FAMILY_SHARING"];

          if (v10)
          {
            uint64_t v11 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  uint64_t v11 = 0;
LABEL_13:

  return v11;
}

- (uint64_t)icqui_isJoinOrLeaveFamilySharingURL
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v1 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:a1 resolvingAgainstBaseURL:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [v1 queryItems];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    long long v13 = v1;
    uint64_t v4 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "name", v13);
        if ([v7 isEqualToString:@"action"])
        {
          uint64_t v8 = [v6 value];
          if ([v8 isEqualToString:@"JOIN_FAMILY"])
          {

LABEL_16:
            uint64_t v11 = 1;
            goto LABEL_17;
          }
          uint64_t v9 = [v6 value];
          char v10 = [v9 isEqualToString:@"LEAVE_FAMILY_SHARING"];

          if (v10) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v3) {
        continue;
      }
      break;
    }
    uint64_t v11 = 0;
LABEL_17:
    v1 = v13;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

@end