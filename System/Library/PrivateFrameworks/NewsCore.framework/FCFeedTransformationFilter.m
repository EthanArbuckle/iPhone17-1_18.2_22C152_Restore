@interface FCFeedTransformationFilter
+ (id)transformationWithFilterOptions:(unint64_t)a3 configuration:(id)a4 context:(id)a5;
+ (id)transformationWithFilterOptions:(unint64_t)a3 configuration:(id)a4 context:(id)a5 ignoreMutedTagIDs:(id)a6;
+ (id)transformationWithFilterOptions:(unint64_t)a3 configuration:(id)a4 context:(id)a5 otherArticleIDs:(id)a6;
+ (id)transformationWithFilterOptions:(unint64_t)a3 otherArticleIDs:(id)a4 otherClusterIDs:(id)a5 subscribedTagIDs:(id)a6 mutedTagIDs:(id)a7 readingHistoryItems:(id)a8 playlistArticleIDs:(id)a9 downloadedArticleIDs:(id)a10 briefingsTagID:(id)a11 paidAccessChecker:(id)a12 bundleSubscription:(id)a13 paywalledArticlesMaxCount:(unint64_t)a14;
- (id)transformFeedItems:(id)a3;
- (id)transformFeedItemsWithResults:(id)a3;
- (id)transformHeadline:(id)a3;
@end

@implementation FCFeedTransformationFilter

+ (id)transformationWithFilterOptions:(unint64_t)a3 otherArticleIDs:(id)a4 otherClusterIDs:(id)a5 subscribedTagIDs:(id)a6 mutedTagIDs:(id)a7 readingHistoryItems:(id)a8 playlistArticleIDs:(id)a9 downloadedArticleIDs:(id)a10 briefingsTagID:(id)a11 paidAccessChecker:(id)a12 bundleSubscription:(id)a13 paywalledArticlesMaxCount:(unint64_t)a14
{
  id v40 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v42 = a13;
  id v41 = a12;
  v25 = (id *)objc_opt_new();
  v27 = v25;
  if (v25)
  {
    v25[1] = (id)a3;
    objc_setProperty_nonatomic_copy(v25, v26, v40, 16);
    objc_setProperty_nonatomic_copy(v27, v28, v18, 24);
    objc_setProperty_nonatomic_copy(v27, v29, v19, 40);
    objc_setProperty_nonatomic_copy(v27, v30, v20, 32);
    objc_setProperty_nonatomic_copy(v27, v31, v21, 48);
  }
  if (v22) {
    id v32 = v22;
  }
  else {
    id v32 = (id)MEMORY[0x1E4F1CBF0];
  }
  v33 = [MEMORY[0x1E4F1CAD0] setWithArray:v32];
  v35 = v33;
  if (v27)
  {
    objc_setProperty_nonatomic_copy(v27, v34, v33, 56);

    objc_setProperty_nonatomic_copy(v27, v36, v23, 64);
    objc_setProperty_nonatomic_copy(v27, v37, v24, 72);
    objc_storeStrong(v27 + 10, a12);

    objc_storeStrong(v27 + 11, a13);
    v27[12] = (id)a14;
  }
  else
  {
  }
  return v27;
}

+ (id)transformationWithFilterOptions:(unint64_t)a3 configuration:(id)a4 context:(id)a5 otherArticleIDs:(id)a6
{
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 setWithArray:a6];
  SEL v29 = [v10 subscriptionList];
  id v23 = [v29 subscribedTagIDs];
  SEL v28 = [v10 subscriptionList];
  id v22 = [v28 mutedTagIDs];
  v27 = [v10 readingHistory];
  id v20 = [v27 readingHistoryItemsByArticleID];
  v26 = [v10 audioPlaylist];
  v13 = [v26 articleIDs];
  id v21 = [v10 offlineArticleManager];
  v14 = [v21 readableArticleIDs];
  v15 = [v11 briefingsTagID];

  v16 = [v10 paidAccessChecker];
  v17 = [v10 bundleSubscriptionManager];

  id v18 = [v17 cachedSubscription];
  id v25 = [a1 transformationWithFilterOptions:a3 otherArticleIDs:v12 otherClusterIDs:0 subscribedTagIDs:v23 mutedTagIDs:v22 readingHistoryItems:v20 playlistArticleIDs:v13 downloadedArticleIDs:v14 briefingsTagID:v15 paidAccessChecker:v16 bundleSubscription:v18 paywalledArticlesMaxCount:0];

  return v25;
}

+ (id)transformationWithFilterOptions:(unint64_t)a3 configuration:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v25 = [v7 subscriptionList];
  v9 = [v25 subscribedTagIDs];
  id v24 = [v7 subscriptionList];
  id v10 = [v24 mutedTagIDs];
  id v23 = [v7 readingHistory];
  id v19 = [v23 readingHistoryItemsByArticleID];
  id v20 = [v7 audioPlaylist];
  id v11 = [v20 articleIDs];
  v12 = [v7 offlineArticleManager];
  v13 = [v12 readableArticleIDs];
  v14 = [v8 briefingsTagID];

  v15 = [v7 paidAccessChecker];
  v16 = [v7 bundleSubscriptionManager];

  v17 = [v16 cachedSubscription];
  id v22 = [a1 transformationWithFilterOptions:a3 otherArticleIDs:0 otherClusterIDs:0 subscribedTagIDs:v9 mutedTagIDs:v10 readingHistoryItems:v19 playlistArticleIDs:v11 downloadedArticleIDs:v13 briefingsTagID:v14 paidAccessChecker:v15 bundleSubscription:v17 paywalledArticlesMaxCount:0];

  return v22;
}

+ (id)transformationWithFilterOptions:(unint64_t)a3 configuration:(id)a4 context:(id)a5 ignoreMutedTagIDs:(id)a6
{
  id v8 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [v8 alloc];
  v13 = [v10 subscriptionList];
  v14 = [v13 mutedTagIDs];
  v15 = (void *)[v12 initWithSet:v14];

  v27 = v15;
  objc_msgSend(v15, "fc_safelyMinusSet:", v9);

  SEL v31 = [v10 subscriptionList];
  v16 = [v31 subscribedTagIDs];
  SEL v29 = [v10 readingHistory];
  v17 = [v29 readingHistoryItemsByArticleID];
  SEL v28 = [v10 audioPlaylist];
  id v18 = [v28 articleIDs];
  id v19 = [v10 offlineArticleManager];
  id v20 = [v19 readableArticleIDs];
  id v21 = [v11 briefingsTagID];

  id v22 = [v10 paidAccessChecker];
  id v23 = [v10 bundleSubscriptionManager];

  id v24 = [v23 cachedSubscription];
  id v25 = [a1 transformationWithFilterOptions:a3 otherArticleIDs:0 otherClusterIDs:0 subscribedTagIDs:v16 mutedTagIDs:v15 readingHistoryItems:v17 playlistArticleIDs:v18 downloadedArticleIDs:v20 briefingsTagID:v21 paidAccessChecker:v22 bundleSubscription:v24 paywalledArticlesMaxCount:0];

  return v25;
}

- (id)transformFeedItems:(id)a3
{
  v3 = [(FCFeedTransformationFilter *)self transformFeedItemsWithResults:a3];
  v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_138);

  return v4;
}

id __49__FCFeedTransformationFilter_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isFiltered])
  {
    v3 = 0;
  }
  else
  {
    v3 = [v2 item];
  }

  return v3;
}

- (id)transformHeadline:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v10 = a3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v10 count:1];

    id v7 = -[FCFeedTransformationFilter transformFeedItems:](self, "transformFeedItems:", v6, v10, v11);
    id v8 = [v7 firstObject];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)transformFeedItemsWithResults:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    otherArticleIDs = 0;
    goto LABEL_5;
  }
  if (self->_filterOptions != 1)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    otherArticleIDs = self->_otherArticleIDs;
LABEL_5:
    id v10 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v11 = otherArticleIDs;
    id v12 = [v10 setWithSet:v11];

    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v14 = (void *)MEMORY[0x1E4F1CA80];
    if (self) {
      otherClusterIDs = self->_otherClusterIDs;
    }
    else {
      otherClusterIDs = 0;
    }
    v16 = otherClusterIDs;
    v17 = [v14 setWithSet:v16];

    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    id v18 = +[FCRestrictions sharedInstance];
    LOBYTE(v16) = [v18 isExplicitContentAllowed];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__FCFeedTransformationFilter_transformFeedItemsWithResults___block_invoke_3;
    v24[3] = &unk_1E5B59048;
    v24[4] = self;
    id v7 = v12;
    id v25 = v7;
    id v19 = v13;
    id v26 = v19;
    id v20 = v17;
    char v30 = (char)v16;
    id v27 = v20;
    SEL v29 = v31;
    id v21 = v8;
    id v28 = v21;
    [v5 enumerateObjectsUsingBlock:v24];
    id v22 = v28;
    id v6 = v21;

    _Block_object_dispose(v31, 8);
    goto LABEL_8;
  }
  v31[4] = MEMORY[0x1E4F143A8];
  v31[5] = 3221225472;
  v31[6] = __60__FCFeedTransformationFilter_transformFeedItemsWithResults___block_invoke;
  v31[7] = &unk_1E5B505B0;
  id v32 = v4;
  objc_msgSend(v32, "fc_arrayByTransformingWithBlock:", &__block_literal_global_35_0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v32;
LABEL_8:

  return v6;
}

uint64_t __60__FCFeedTransformationFilter_transformFeedItemsWithResults___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_arrayByTransformingWithBlock:", &__block_literal_global_35_0);
}

FCFeedTransformationFilterItemResult *__60__FCFeedTransformationFilter_transformFeedItemsWithResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FCFeedTransformationFilterItemResult alloc] initWithItem:v2 filtered:0 filteredReasons:0];

  return v3;
}

void __60__FCFeedTransformationFilter_transformFeedItemsWithResults___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5)
  {
    uint64_t v7 = 0;
    uint64_t v25 = 0;
    goto LABEL_179;
  }
  if ((*(unsigned char *)(v5 + 8) & 2) == 0) {
    goto LABEL_24;
  }
  id v6 = [v3 articleID];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    uint64_t v25 = 0;
    goto LABEL_25;
  }
  id v8 = *(void **)(a1 + 40);
  id v9 = [v4 articleID];
  int v10 = [v8 containsObject:v9];

  uint64_t v11 = *(void *)(a1 + 32);
  if (!v11 || (*(unsigned char *)(v11 + 8) & 0x40) == 0)
  {
    id v12 = *(void **)(a1 + 40);
    v13 = [v4 articleID];
    [v12 addObject:v13];

    v14 = *(void **)(a1 + 48);
    v15 = [v4 articleID];
    v16 = [v14 objectForKeyedSubscript:v15];

    if (!v16)
    {
      id v26 = *(void **)(a1 + 48);
      id v27 = [v4 articleID];
      [v26 setObject:v4 forKeyedSubscript:v27];

      if (v10) {
        goto LABEL_8;
      }
LABEL_24:
      uint64_t v25 = 0;
      uint64_t v7 = 0;
      goto LABEL_25;
    }
  }
  if (!v10) {
    goto LABEL_24;
  }
LABEL_8:
  v17 = *(void **)(a1 + 48);
  id v18 = [v4 articleID];
  id v19 = [v17 objectForKeyedSubscript:v18];

  if (v19)
  {
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v20 = objc_msgSend(v4, "surfacedByArticleListIDs", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v149 objects:v153 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v150;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v150 != v23) {
            objc_enumerationMutation(v20);
          }
          [v19 addSurfacedByArticleListID:*(void *)(*((void *)&v149 + 1) + 8 * i)];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v149 objects:v153 count:16];
      }
      while (v22);
    }

    if (objc_opt_respondsToSelector())
    {
      [v4 conditionalScore];
      objc_msgSend(v19, "applyConditionalScore:");
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 isEvergreen]) {
      [v19 markAsEvergreen];
    }
  }

  uint64_t v7 = 1;
  uint64_t v25 = 2;
LABEL_25:
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_179;
  }
  if ((*(unsigned char *)(v5 + 8) & 4) != 0)
  {
    id v28 = [v4 clusterID];
    uint64_t v29 = [v28 length];

    if (v29)
    {
      char v30 = *(void **)(a1 + 56);
      SEL v31 = [v4 clusterID];
      int v32 = [v30 containsObject:v31];

      uint64_t v7 = v7 | v32;
      uint64_t v33 = *(void *)(a1 + 32);
      if (!v33 || (*(unsigned char *)(v33 + 8) & 0x80) == 0)
      {
        v34 = *(void **)(a1 + 56);
        v35 = [v4 clusterID];
        [v34 addObject:v35];
      }
      if (v32) {
        v25 |= 4uLL;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_179;
  }
  uint64_t v36 = *(void *)(v5 + 8);
  if ((v36 & 8) != 0)
  {
    int v37 = [v4 isFromBlockedStorefront];
    if (v37) {
      v25 |= 8uLL;
    }
    uint64_t v7 = v37 | v7;
    uint64_t v5 = *(void *)(a1 + 32);
    if (!v5) {
      goto LABEL_179;
    }
    uint64_t v36 = *(void *)(v5 + 8);
  }
  if ((v36 & 0x10) != 0 && !*(unsigned char *)(a1 + 80))
  {
    int v43 = [v4 isExplicitContent];
    if (v43) {
      v25 |= 0x10uLL;
    }
    uint64_t v7 = v43 | v7;
    uint64_t v5 = *(void *)(a1 + 32);
    if (!v5) {
      goto LABEL_179;
    }
    if ((*(void *)(v5 + 8) & 0x20) == 0) {
      goto LABEL_54;
    }
  }
  else if ((v36 & 0x20) == 0)
  {
LABEL_54:
    int v42 = 0;
    goto LABEL_55;
  }
  id v38 = *(id *)(v5 + 32);
  if (![v38 count])
  {

    goto LABEL_54;
  }
  v39 = *(void **)(a1 + 32);
  if (v39) {
    v39 = (void *)v39[4];
  }
  id v40 = v39;
  id v41 = [v4 sourceChannelID];
  int v42 = [v40 containsObject:v41];

  if (v42) {
    v25 |= 0x20uLL;
  }
LABEL_55:
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v7 = v42 | v7;
  if (!v5) {
    goto LABEL_179;
  }
  if ((*(unsigned char *)(v5 + 11) & 4) == 0 || (objc_opt_respondsToSelector() & 1) == 0 || [v4 role] == 8) {
    goto LABEL_68;
  }
  v44 = *(void **)(a1 + 32);
  if (v44) {
    v44 = (void *)v44[4];
  }
  v45 = v44;
  if (![v45 count])
  {

LABEL_68:
    int v49 = 0;
    goto LABEL_69;
  }
  v46 = *(void **)(a1 + 32);
  if (v46) {
    v46 = (void *)v46[4];
  }
  v47 = v46;
  v48 = [v4 sourceChannelID];
  int v49 = [v47 containsObject:v48];

  if (v49) {
    v25 |= 0x4000000uLL;
  }
LABEL_69:
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v7 = v49 | v7;
  if (!v5) {
    goto LABEL_179;
  }
  uint64_t v50 = *(void *)(v5 + 8);
  if ((v50 & 0x100) == 0)
  {
    if ((v50 & 0x200) == 0) {
      goto LABEL_77;
    }
    goto LABEL_72;
  }
  v67 = +[FCRestrictions sharedInstance];
  int v68 = objc_msgSend(v67, "isNewsVersionAllowed:", objc_msgSend(v4, "minimumNewsVersion"));

  if (!v68) {
    v25 |= 0x100uLL;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v7 = v68 ^ 1 | v7;
  if (!v5) {
    goto LABEL_179;
  }
  uint64_t v50 = *(void *)(v5 + 8);
  if ((v50 & 0x200) != 0)
  {
LABEL_72:
    if ([v4 contentType] == 2)
    {
      uint64_t v7 = v7;
    }
    else
    {
      v25 |= 0x200uLL;
      uint64_t v7 = 1;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (!v5) {
      goto LABEL_179;
    }
    uint64_t v50 = *(void *)(v5 + 8);
  }
LABEL_77:
  if ((v50 & 0x400000000) != 0)
  {
    v51 = (char *)*(id *)(v5 + 88);
    v52 = v51 + 1;
    v53 = v51;
    v54 = objc_getAssociatedObject(v53, v52);
    uint64_t v55 = [v54 unsignedIntegerValue];
    char v56 = v55;
    v57 = objc_getAssociatedObject(v53, (const void *)~v55);

    char v58 = ([v57 unsignedIntegerValue] + 1) ^ (v56 + 1);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v58)
    {
      if (v5) {
        uint64_t v5 = *(void *)(v5 + 80);
      }
      id v59 = (id)v5;
      int v60 = [v4 isPaid];
      int v61 = [v4 isBundlePaid];
      v62 = [v4 sourceChannelID];
      int HasAccessToItemInline = FCPaidAccessCheckerHasAccessToItemInline(v59, v60, v61, v62, 50);

      if (!HasAccessToItemInline) {
        v25 |= 0x400000000uLL;
      }
      uint64_t v7 = HasAccessToItemInline ^ 1 | v7;
      uint64_t v5 = *(void *)(a1 + 32);
    }
    if (!v5) {
      goto LABEL_179;
    }
    uint64_t v50 = *(void *)(v5 + 8);
  }
  if ((v50 & 0x1000) != 0)
  {
    v64 = [v4 topicIDs];
    v65 = *(void **)(a1 + 32);
    if (v65) {
      v65 = (void *)v65[9];
    }
    v66 = v65;
    if ([v64 containsObject:v66])
    {
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        goto LABEL_101;
      }
      uint64_t v69 = [v4 role];

      if (v69 != 8) {
        goto LABEL_101;
      }
    }
    v25 |= 0x1000uLL;
    uint64_t v7 = 1;
  }
LABEL_101:
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_179;
  }
  if ((*(unsigned char *)(v5 + 9) & 4) != 0 && ([v4 isPaid] & 1) == 0)
  {
    int v70 = [v4 isBundlePaid];
    if (!v70) {
      v25 |= 0x400uLL;
    }
    uint64_t v7 = v70 ^ 1 | v7;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_179;
  }
  if ((*(unsigned char *)(v5 + 10) & 1) != 0
    && [v4 isBundlePaid]
    && ([v4 sourceChannelID], (uint64_t v71 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v72 = (void *)v71;
    v73 = *(void **)(a1 + 32);
    if (v73) {
      v73 = (void *)v73[11];
    }
    v74 = v73;
    v75 = [v4 sourceChannelID];
    int v76 = [v74 containsTagID:v75];

    if (v76) {
      v25 |= 0x10000uLL;
    }
  }
  else
  {
    int v76 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v7 = v76 | v7;
  if (!v5) {
    goto LABEL_179;
  }
  uint64_t v77 = *(void *)(v5 + 8);
  if ((v77 & 0x2000) != 0)
  {
    char v78 = objc_opt_respondsToSelector();
    uint64_t v5 = *(void *)(a1 + 32);
    if (v78)
    {
      if (v5) {
        uint64_t v5 = *(void *)(v5 + 80);
      }
      id v79 = (id)v5;
      uint64_t v80 = [v4 isPaid];
      uint64_t v81 = [v4 isBundlePaid];
      v82 = [v4 sourceChannel];
      int v83 = [v79 canGetAccessToItemPaid:v80 bundlePaid:v81 channel:v82];

      if (!v83) {
        v25 |= 0x2000uLL;
      }
      uint64_t v7 = v83 ^ 1 | v7;
      uint64_t v5 = *(void *)(a1 + 32);
    }
    if (!v5) {
      goto LABEL_179;
    }
    uint64_t v77 = *(void *)(v5 + 8);
  }
  if ((v77 & 0x4000) != 0)
  {
    id v88 = *(id *)(v5 + 40);
    v89 = [v4 sourceChannelID];
    int v90 = [v88 containsObject:v89];

    if (!v90) {
      v25 |= 0x4000uLL;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v7 = v90 ^ 1 | v7;
    if (!v5) {
      goto LABEL_179;
    }
    if ((*(void *)(v5 + 8) & 0x20000000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_129;
  }
  if ((v77 & 0x20000000) != 0)
  {
LABEL_129:
    id v84 = *(id *)(v5 + 40);
    v85 = [v4 sourceChannelID];
    char v86 = [v84 containsObject:v85];

    if ((v86 & 1) == 0)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v87 = [v4 storyType];
      }
      else {
        uint64_t v87 = 0;
      }
      if (v87 == 5)
      {
        uint64_t v7 = v7;
      }
      else
      {
        v25 |= 0x20000000uLL;
        uint64_t v7 = 1;
      }
    }
  }
LABEL_141:
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    goto LABEL_179;
  }
  uint64_t v91 = *(void *)(v5 + 8);
  if ((v91 & 0x8000) == 0)
  {
LABEL_147:
    if ((v91 & 0x20000) != 0)
    {
      id v93 = *(id *)(v5 + 32);
      if ([v93 count])
      {
        v94 = *(void **)(a1 + 32);
        if (v94) {
          v94 = (void *)v94[4];
        }
        v95 = v94;
        v96 = [v4 topicIDs];
        int v97 = objc_msgSend(v95, "fc_containsAnyObjectInArray:", v96);

        if (v97) {
          v25 |= 0x20000uLL;
        }
LABEL_156:
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v7 = v97 | v7;
        if (!v5) {
          goto LABEL_179;
        }
        if ((*(unsigned char *)(v5 + 10) & 4) == 0) {
          goto LABEL_171;
        }
        id v98 = *(id *)(v5 + 32);
        if ([v98 count])
        {
          v99 = *(void **)(a1 + 32);
          if (v99) {
            v99 = (void *)v99[4];
          }
          v100 = v99;
          v101 = [v4 topicIDs];
          int v102 = objc_msgSend(v100, "fc_containsAnyObjectInArray:", v101);

          if (!v102) {
            goto LABEL_171;
          }
          v103 = [v4 sourceFeedID];
          v104 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"@$"];
          v105 = [v103 componentsSeparatedByCharactersInSet:v104];
          id v98 = [v105 objectAtIndexedSubscript:0];

          if (v98)
          {
            v106 = *(void **)(a1 + 32);
            if (v106) {
              v106 = (void *)v106[4];
            }
            v107 = v106;
            int v108 = [v107 containsObject:v98];
            int v109 = v108 ^ 1;

            if (!v108) {
              v25 |= 0x40000uLL;
            }
          }
          else
          {
            int v109 = 0;
          }
          uint64_t v7 = v109 | v7;
        }

LABEL_171:
        uint64_t v5 = *(void *)(a1 + 32);
        if (v5)
        {
          if (*(unsigned char *)(v5 + 10) & 8) != 0 && (objc_opt_respondsToSelector())
          {
            int v110 = [v4 isEvergreen];
            if (v110) {
              v25 |= 0x80000uLL;
            }
            uint64_t v7 = v110 | v7;
          }
          uint64_t v5 = *(void *)(a1 + 32);
          if (v5) {
            uint64_t v5 = *(void *)(v5 + 48);
          }
        }
        goto LABEL_179;
      }
    }
    int v97 = 0;
    goto LABEL_156;
  }
  int v92 = [v4 hasVideo];
  if (!v92) {
    v25 |= 0x8000uLL;
  }
  uint64_t v7 = v92 ^ 1 | v7;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v91 = *(void *)(v5 + 8);
    goto LABEL_147;
  }
LABEL_179:
  id v111 = (id)v5;
  v112 = [v4 articleID];
  v113 = [v111 objectForKey:v112];

  uint64_t v114 = *(void *)(a1 + 32);
  if (!v114) {
    goto LABEL_258;
  }
  uint64_t v115 = *(void *)(v114 + 8);
  if ((v115 & 0x100000) != 0)
  {
    int v116 = [v113 hasArticleBeenSeen];
    if (v116) {
      v25 |= 0x100000uLL;
    }
    uint64_t v7 = v116 | v7;
    uint64_t v114 = *(void *)(a1 + 32);
    if (!v114) {
      goto LABEL_258;
    }
    uint64_t v115 = *(void *)(v114 + 8);
  }
  if ((v115 & 0x200000) != 0)
  {
    int v117 = [v113 hasArticleBeenRead];
    if (v117) {
      v25 |= 0x200000uLL;
    }
    uint64_t v7 = v117 | v7;
    uint64_t v114 = *(void *)(a1 + 32);
    if (!v114) {
      goto LABEL_258;
    }
    uint64_t v115 = *(void *)(v114 + 8);
  }
  if ((v115 & 0x800000) == 0)
  {
    if ((v115 & 0x400000) == 0) {
      goto LABEL_196;
    }
    goto LABEL_192;
  }
  v136 = [v113 lastListenedAt];

  if (v136) {
    v25 |= 0x800000uLL;
  }
  uint64_t v114 = *(void *)(a1 + 32);
  if (v136) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v7;
  }
  if (!v114) {
    goto LABEL_258;
  }
  uint64_t v115 = *(void *)(v114 + 8);
  if ((v115 & 0x400000) != 0)
  {
LABEL_192:
    int v118 = [v113 hasArticleCompletedReading];
    if (v118) {
      v25 |= 0x400000uLL;
    }
    uint64_t v7 = v118 | v7;
    uint64_t v114 = *(void *)(a1 + 32);
    if (!v114) {
      goto LABEL_258;
    }
    uint64_t v115 = *(void *)(v114 + 8);
  }
LABEL_196:
  if ((v115 & 0x1000000) != 0)
  {
    int v119 = [v113 hasArticleCompletedListening];
    if (v119) {
      v25 |= 0x1000000uLL;
    }
    uint64_t v7 = v119 | v7;
    uint64_t v114 = *(void *)(a1 + 32);
    if (!v114) {
      goto LABEL_258;
    }
    uint64_t v115 = *(void *)(v114 + 8);
  }
  if ((v115 & 0x8000000) != 0)
  {
    int v120 = [v113 hasArticleBeenRemovedFromAudio];
    if (v120) {
      v25 |= 0x8000000uLL;
    }
    uint64_t v7 = v120 | v7;
    uint64_t v114 = *(void *)(a1 + 32);
    if (!v114) {
      goto LABEL_258;
    }
    uint64_t v115 = *(void *)(v114 + 8);
  }
  if ((v115 & 0x40000000) != 0)
  {
    if ([v113 articleLikingStatus] == 2)
    {
      v25 |= 0x40000000uLL;
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = v7;
    }
    uint64_t v114 = *(void *)(a1 + 32);
    if (!v114) {
      goto LABEL_258;
    }
    uint64_t v115 = *(void *)(v114 + 8);
  }
  if ((v115 & 0x80000000) != 0)
  {
    int v121 = [v4 isSponsored];
    if (v121) {
      v25 |= 0x80000000uLL;
    }
    uint64_t v7 = v121 | v7;
    uint64_t v114 = *(void *)(a1 + 32);
    if (!v114) {
      goto LABEL_258;
    }
    uint64_t v115 = *(void *)(v114 + 8);
  }
  if ((v115 & 0x2000000) == 0)
  {
    if ((v115 & 0x10000000) == 0) {
      goto LABEL_219;
    }
LABEL_247:
    id v140 = *(id *)(v114 + 64);
    v141 = [v4 articleID];
    int v142 = [v140 containsObject:v141];

    if (!v142) {
      v25 |= 0x10000000uLL;
    }
    uint64_t v7 = v142 ^ 1 | v7;
    uint64_t v114 = *(void *)(a1 + 32);
    if (!v114) {
      goto LABEL_258;
    }
    if ((*(void *)(v114 + 8) & 0x100000000) == 0) {
      goto LABEL_220;
    }
    goto LABEL_251;
  }
  id v137 = *(id *)(v114 + 56);
  v138 = [v4 articleID];
  int v139 = [v137 containsObject:v138];

  if (v139) {
    v25 |= 0x2000000uLL;
  }
  uint64_t v7 = v139 | v7;
  uint64_t v114 = *(void *)(a1 + 32);
  if (!v114) {
    goto LABEL_258;
  }
  uint64_t v115 = *(void *)(v114 + 8);
  if ((v115 & 0x10000000) != 0) {
    goto LABEL_247;
  }
LABEL_219:
  if ((v115 & 0x100000000) != 0)
  {
LABEL_251:
    uint64_t v143 = [v4 sourceChannelID];
    uint64_t v114 = *(void *)(a1 + 32);
    if (v143)
    {
      v144 = (void *)v143;
      if (v114) {
        uint64_t v114 = *(void *)(v114 + 88);
      }
      id v145 = (id)v114;
      v146 = [v4 sourceChannelID];
      int v147 = [v145 containsTagID:v146];

      if (!v147) {
        v25 |= 0x100000000uLL;
      }
      uint64_t v7 = v147 ^ 1 | v7;
      uint64_t v114 = *(void *)(a1 + 32);
    }
    if (!v114) {
      goto LABEL_258;
    }
  }
LABEL_220:
  if ((*(unsigned char *)(v114 + 12) & 2) != 0)
  {
    if ([v4 reduceVisibilityForNonFollowers])
    {
      uint64_t v122 = [v4 sourceChannelID];
      if (v122)
      {
        v123 = (void *)v122;
        v124 = *(void **)(a1 + 32);
        if (v124) {
          v124 = (void *)v124[5];
        }
        v125 = v124;
        v126 = [v4 sourceChannelID];
        int v127 = [v125 containsObject:v126];

        if (!v127) {
          v25 |= 0x200000000uLL;
        }
        uint64_t v7 = v127 ^ 1 | v7;
      }
    }
  }
  uint64_t v128 = *(void *)(a1 + 32);
  if (v128)
  {
    if ((*(unsigned char *)(v128 + 9) & 8) != 0)
    {
      id v129 = *(id *)(v128 + 80);
      int v130 = [v4 isPaid];
      int v131 = [v4 isBundlePaid];
      v132 = [v4 sourceChannelID];
      LOBYTE(v130) = FCPaidAccessCheckerHasAccessToItemInline(v129, v130, v131, v132, 203);

      if ((v130 & 1) == 0)
      {
        uint64_t v133 = *(void *)(a1 + 32);
        if (v133
          && (uint64_t v134 = *(void *)(*(void *)(a1 + 72) + 8),
              unint64_t v135 = *(void *)(v134 + 24),
              v135 < *(void *)(v133 + 96)))
        {
          if ((v7 & 1) == 0)
          {
            uint64_t v7 = 0;
            *(void *)(v134 + 24) = v135 + 1;
            goto LABEL_258;
          }
        }
        else
        {
          v25 |= 0x800uLL;
        }
        uint64_t v7 = 1;
      }
    }
  }
LABEL_258:
  v148 = [[FCFeedTransformationFilterItemResult alloc] initWithItem:v4 filtered:v7 filteredReasons:v25];
  [*(id *)(a1 + 64) addObject:v148];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleSubscription, 0);
  objc_storeStrong((id *)&self->_paidAccessChecker, 0);
  objc_storeStrong((id *)&self->_briefingsTagID, 0);
  objc_storeStrong((id *)&self->_downloadedArticleIDs, 0);
  objc_storeStrong((id *)&self->_playlistArticleIDs, 0);
  objc_storeStrong((id *)&self->_readingHistoryItems, 0);
  objc_storeStrong((id *)&self->_subscribedTagIDs, 0);
  objc_storeStrong((id *)&self->_mutedTagIDs, 0);
  objc_storeStrong((id *)&self->_otherClusterIDs, 0);
  objc_storeStrong((id *)&self->_otherArticleIDs, 0);
}

@end