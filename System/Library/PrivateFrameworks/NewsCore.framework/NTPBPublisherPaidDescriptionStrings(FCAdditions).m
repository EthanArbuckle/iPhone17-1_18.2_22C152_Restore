@interface NTPBPublisherPaidDescriptionStrings(FCAdditions)
+ (id)publisherPaidDescriptionStringsFromJSON:()FCAdditions;
@end

@implementation NTPBPublisherPaidDescriptionStrings(FCAdditions)

+ (id)publisherPaidDescriptionStringsFromJSON:()FCAdditions
{
  v0 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionaryFromJSON:");
  if ([v0 count])
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F82B50]);
    v2 = [v0 objectForKeyedSubscript:@"paywallDescription"];
    v3 = v2;
    if (v2)
    {
      v4 = [v2 objectForKey:@"channelPaywall"];
      v5 = [v3 objectForKey:@"promotionalPaywall"];
      v6 = [v3 objectForKey:@"leakyPaywall"];
      uint64_t v7 = [v3 objectForKey:@"hardPaywall"];
      v8 = (void *)v7;
      if (v4) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = v5 == 0;
      }
      if (!v9 || v6 != 0 || v7 != 0)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F82AF8]);
        [v12 setChannelPaywall:v4];
        [v12 setPromotionalPaywall:v5];
        [v12 setLeakyPaywall:v6];
        [v12 setHardPaywall:v8];
        [v1 setPaywallDescription:v12];
      }
    }
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

@end