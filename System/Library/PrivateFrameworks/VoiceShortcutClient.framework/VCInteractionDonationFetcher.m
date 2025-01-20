@interface VCInteractionDonationFetcher
+ (id)donationWithInteractionIdentifier:(id)a3 applicationBundleIdentifier:(id)a4;
+ (id)streams;
@end

@implementation VCInteractionDonationFetcher

+ (id)donationWithInteractionIdentifier:(id)a3 applicationBundleIdentifier:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    v8 = (void *)MEMORY[0x1E4F5B5D0];
    v9 = [MEMORY[0x1E4F5B5F0] intentsSourceID];
    v15[0] = v6;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v11 = [v8 predicateForEventsWithSourceID:v9 bundleID:v7 itemIDs:v10];

    v12 = [a1 fetchDonationsWithPredicate:v11 limit:1 filteringForTopLevel:0];
    v13 = [v12 firstObject];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)streams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end