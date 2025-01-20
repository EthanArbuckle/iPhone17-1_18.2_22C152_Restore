@interface FCPromoteAccessibleHeadline
@end

@implementation FCPromoteAccessibleHeadline

uint64_t ___FCPromoteAccessibleHeadline_block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasThumbnail];
}

uint64_t ___FCPromoteAccessibleHeadline_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasThumbnail])
  {
    id v4 = *(id *)(a1 + 32);
    id v5 = v3;
    char v6 = [v5 isPaid];
    int v7 = [v5 isBundlePaid];
    v8 = [v5 sourceChannel];
    v9 = [v8 identifier];
    id v10 = v4;
    id v11 = v9;
    v12 = [v10 bundleSubscriptionProvider];
    v13 = [v10 purchaseProvider];
    id v14 = v12;
    id v15 = v13;
    id v16 = v11;
    if ((v6 & 1) == 0 && !v7) {
      goto LABEL_8;
    }
    char v17 = v6 ^ 1;
    if (!v15) {
      char v17 = 1;
    }
    if ((v17 & 1) == 0)
    {
      v18 = [v15 purchasedTagIDs];
      char v19 = [v18 containsObject:v16];

      if (v19) {
        goto LABEL_8;
      }
    }
    char v21 = v7 ^ 1;
    if (!v14) {
      char v21 = 1;
    }
    if ((v21 & 1) == 0)
    {
      id v22 = v14;
      id v23 = v16;
      if (!v23) {
        goto LABEL_15;
      }
      [v22 bundleSubscription];
      uint64_t v24 = v34 = v23;
      v32 = objc_getAssociatedObject((id)v24, (const void *)(v24 + 1));
      uint64_t v25 = [v32 unsignedIntegerValue];
      char v26 = v25;
      objc_getAssociatedObject((id)v24, (const void *)~v25);
      v27 = v35 = v22;
      char v28 = [v27 unsignedIntegerValue] ^ v26;

      id v22 = v35;
      id v23 = v34;
      if (v28)
      {
        v30 = [v35 bundleSubscription];
        v31 = [v30 bundleChannelIDs];
        char v33 = [v31 containsObject:v34];

        if (v33)
        {
LABEL_8:
          uint64_t v20 = 1;
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
LABEL_15:
      }
    }
    uint64_t v20 = 0;
    goto LABEL_17;
  }
  uint64_t v20 = 0;
LABEL_18:

  return v20;
}

@end