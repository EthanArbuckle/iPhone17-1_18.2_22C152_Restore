@interface NTPBPersonalizationProfile(FCAdditions)
- (id)aggregatesByFeatureKey;
- (id)historiesByInstanceIdentifier;
- (id)historyForInstanceIdentifier:()FCAdditions;
- (uint64_t)lastChangeNumberForInstanceIdentifier:()FCAdditions;
@end

@implementation NTPBPersonalizationProfile(FCAdditions)

- (id)aggregatesByFeatureKey
{
  v1 = [a1 aggregates];
  v2 = objc_msgSend(v1, "fc_dictionaryWithKeyBlock:", &__block_literal_global_122);
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v4 = v2;

  return v4;
}

- (id)historiesByInstanceIdentifier
{
  v1 = [a1 histories];
  v2 = objc_msgSend(v1, "fc_dictionaryWithKeyBlock:", &__block_literal_global_3_0);
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v4 = v2;

  return v4;
}

- (id)historyForInstanceIdentifier:()FCAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a1, "histories", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 instanceIdentifier];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (uint64_t)lastChangeNumberForInstanceIdentifier:()FCAdditions
{
  v1 = objc_msgSend(a1, "historyForInstanceIdentifier:");
  uint64_t v2 = [v1 lastChangeNumber];

  return v2;
}

@end