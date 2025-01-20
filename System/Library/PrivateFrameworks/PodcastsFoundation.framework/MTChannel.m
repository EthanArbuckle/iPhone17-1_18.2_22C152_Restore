@interface MTChannel
+ (id)createOrFindChannelFromFeedChannelItem:(id)a3 personalizedRequest:(BOOL)a4 context:(id)a5;
+ (id)predicateForChannelStoreIds:(id)a3;
+ (id)predicateForChannelWithStoreId:(int64_t)a3;
+ (id)predicateForFavoritedChannel;
+ (id)predicateForFollowedChannel;
+ (id)predicateForLibraryChannel;
+ (id)predicateForMultiShowChannel;
+ (id)predicateForSingleShowChannel;
+ (id)predicateForSubscribedChannel;
+ (id)sortDescriptorsForLibraryChannelsPage:(BOOL)a3;
- (BOOL)isMultiShow;
- (BOOL)isSingleShow;
- (int64_t)resolvedShowCount;
@end

@implementation MTChannel

+ (id)predicateForLibraryChannel
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28BA0];
  v3 = +[MTChannel predicateForMultiShowChannel];
  v14[0] = v3;
  v4 = (void *)MEMORY[0x1E4F28BA0];
  v5 = +[MTChannel predicateForSubscribedChannel];
  v6 = +[MTChannel predicateForFollowedChannel];
  v13[1] = v6;
  v7 = +[MTChannel predicateForFavoritedChannel];
  v13[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v9 = [v4 orPredicateWithSubpredicates:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v11 = [v2 andPredicateWithSubpredicates:v10];

  return v11;
}

+ (id)predicateForSubscribedChannel
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES", @"subscriptionActive");
}

+ (id)predicateForMultiShowChannel
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 1 || %K > 1", @"availableShowCount", @"showCount");
}

+ (id)predicateForFollowedChannel
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28BA0];
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0", @"followedShowCount");
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [v2 andPredicateWithSubpredicates:v4];

  return v5;
}

+ (id)predicateForFavoritedChannel
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0", @"interest.interestValue");
}

+ (id)predicateForChannelWithStoreId:(int64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  v5 = [v3 predicateWithFormat:@"%K == %@", @"storeId", v4];

  return v5;
}

+ (id)predicateForChannelStoreIds:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"storeId", a3];
}

+ (id)predicateForSingleShowChannel
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 1 || %K == 1", @"availableShowCount", @"showCount");
}

+ (id)createOrFindChannelFromFeedChannelItem:(id)a3 personalizedRequest:(BOOL)a4 context:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 storeId];
  uint64_t v10 = [v9 longLongValue];

  v11 = [v8 channelForStoreId:v10];
  if (!v11)
  {
    v11 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"MTChannel" inManagedObjectContext:v8];
    [v11 setStoreId:v10];
  }
  v12 = [v7 name];
  [v11 setName:v12];

  v13 = [v7 displayType];
  [v11 setDisplayType:v13];

  v14 = [v7 artworkURL];
  [v11 setArtworkURL:v14];

  v15 = [v7 logoImageURL];
  [v11 setLogoImageURL:v15];

  [v7 logoImageWidth];
  objc_msgSend(v11, "setLogoImageWidth:");
  [v7 logoImageHeight];
  objc_msgSend(v11, "setLogoImageHeight:");
  v16 = [v7 backgroundColor];
  [v11 setBackgroundColor:v16];

  v17 = [v7 uberBackgroundJoeColor];
  [v11 setUberBackgroundJoeColor:v17];

  v18 = [v7 uberBackgroundImageURL];
  [v11 setUberBackgroundImageURL:v18];

  v19 = [v7 url];
  [v11 setUrl:v19];

  objc_msgSend(v11, "setShowCount:", objc_msgSend(v7, "showCount"));
  if (v6) {
    objc_msgSend(v11, "setAvailableShowCount:", objc_msgSend(v7, "availableShowCount"));
  }
  v20 = [v7 subscriptionName];
  v21 = v20;
  if (v20 && [v20 length])
  {
    [v11 setSubscriptionName:v21];
  }
  else if (([v11 subscriptionActive] & 1) == 0)
  {
    v22 = [v7 fallbackSubscriptionName];
    [v11 setSubscriptionName:v22];
  }
  return v11;
}

+ (id)sortDescriptorsForLibraryChannelsPage:(BOOL)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"interest.interestValue" ascending:0];
    v9[0] = v3;
    v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1 selector:sel_localizedStandardCompare_];
    v9[1] = v4;
    v5 = v9;
  }
  else
  {
    v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"subscriptionActive" ascending:0];
    v8[0] = v3;
    v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1 selector:sel_localizedStandardCompare_];
    v8[1] = v4;
    v5 = v8;
  }
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v6;
}

- (int64_t)resolvedShowCount
{
  if ([(MTChannel *)self availableShowCount] < 1)
  {
    return [(MTChannel *)self showCount];
  }
  else
  {
    return [(MTChannel *)self availableShowCount];
  }
}

- (BOOL)isMultiShow
{
  return [(MTChannel *)self resolvedShowCount] > 1;
}

- (BOOL)isSingleShow
{
  return [(MTChannel *)self resolvedShowCount] < 2;
}

@end