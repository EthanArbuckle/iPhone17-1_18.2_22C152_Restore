@interface FCFeedTransformationEndOfArticle
+ (id)transformationWithConfiguration:(id)a3 context:(id)a4 isPaywallAvailable:(BOOL)a5;
- (BOOL)isPaywallAvailable;
- (FCPurchaseProviderType)purchaseProvider;
- (double)paidHeadlineRatio;
- (id)transformFeedItems:(id)a3;
- (id)transformHeadlines:(id)a3;
- (id)transformItems:(id)a3 isPaidBlock:(id)a4 sourceChannelIDProvider:(id)a5;
- (unint64_t)expireArticlesAfter;
- (unint64_t)maxiumInaccessibleHeadlineCount;
- (unint64_t)minimumResultHeadlineCount;
- (void)setExpireArticlesAfter:(unint64_t)a3;
- (void)setIsPaywallAvailable:(BOOL)a3;
- (void)setMaxiumInaccessibleHeadlineCount:(unint64_t)a3;
- (void)setMinimumResultHeadlineCount:(unint64_t)a3;
- (void)setPaidHeadlineRatio:(double)a3;
- (void)setPurchaseProvider:(id)a3;
@end

@implementation FCFeedTransformationEndOfArticle

+ (id)transformationWithConfiguration:(id)a3 context:(id)a4 isPaywallAvailable:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_new();
  [v8 endOfArticleMinPaidHeadlineRatio];
  objc_msgSend(v9, "setPaidHeadlineRatio:");
  objc_msgSend(v9, "setMaxiumInaccessibleHeadlineCount:", objc_msgSend(v8, "endOfArticleMaxInaccessiblePaidArticleCount"));
  uint64_t v10 = [v8 endOfArticleExpireArticlesAfter];

  [v9 setExpireArticlesAfter:v10];
  [v9 setMinimumResultHeadlineCount:4];
  [v9 setIsPaywallAvailable:v5];
  v11 = [v7 purchaseProvider];

  [v9 setPurchaseProvider:v11];
  return v9;
}

- (id)transformItems:(id)a3 isPaidBlock:(id)a4 sourceChannelIDProvider:(id)a5
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v74 = a4;
  id v73 = a5;
  id v8 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "Transforming items: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__35;
  v122 = __Block_byref_object_dispose__35;
  id v123 = (id)objc_msgSend(v7, "mutableCopy", v7);
  v9 = self;
  unint64_t v10 = [*(id *)(*((void *)&buf + 1) + 40) count];
  if (v10 > [(FCFeedTransformationEndOfArticle *)self minimumResultHeadlineCount])
  {
    *(void *)&long long v114 = 0;
    *((void *)&v114 + 1) = &v114;
    uint64_t v115 = 0x3032000000;
    v116 = __Block_byref_object_copy__35;
    v117 = __Block_byref_object_dispose__35;
    id v118 = 0;
    v11 = *(void **)(*((void *)&buf + 1) + 40);
    unint64_t v12 = [(FCFeedTransformationEndOfArticle *)self minimumResultHeadlineCount];
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke;
    v109[3] = &unk_1E5B50690;
    v109[4] = &buf;
    v109[5] = &v114;
    objc_msgSend(v11, "fc_subarrayWithCount:result:", v12, v109);
    [(FCFeedTransformationEndOfArticle *)self paidHeadlineRatio];
    double v14 = 0.0;
    if (v13 != 0.0)
    {
      unint64_t v15 = [(FCFeedTransformationEndOfArticle *)self minimumResultHeadlineCount];
      [(FCFeedTransformationEndOfArticle *)self paidHeadlineRatio];
      double v17 = floor(v16 * (double)v15);
      double v14 = 1.0;
      if (v17 >= 1.0) {
        double v14 = v17;
      }
    }
    unint64_t v18 = (unint64_t)v14;
    if ((unint64_t)v14)
    {
      v19 = *(void **)(*((void *)&buf + 1) + 40);
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_2;
      v107[3] = &unk_1E5B555A8;
      id v20 = v74;
      id v108 = v20;
      unint64_t v21 = objc_msgSend(v19, "fc_countOfObjectsPassingTest:", v107);
      BOOL v22 = v18 > v21;
      unint64_t v23 = v18 - v21;
      if (v22)
      {
        v24 = objc_opt_new();
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        v25 = (void *)[*(id *)(*((void *)&v114 + 1) + 40) copy];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v103 objects:v113 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v104;
LABEL_12:
          uint64_t v28 = 0;
          while (1)
          {
            if (*(void *)v104 != v27) {
              objc_enumerationMutation(v25);
            }
            uint64_t v29 = *(void *)(*((void *)&v103 + 1) + 8 * v28);
            if ((*((unsigned int (**)(id, uint64_t))v20 + 2))(v20, v29))
            {
              [v24 addObject:v29];
              [*(id *)(*((void *)&v114 + 1) + 40) removeObject:v29];
            }
            if ([v24 count] >= v23) {
              break;
            }
            if (v26 == ++v28)
            {
              uint64_t v26 = [v25 countByEnumeratingWithState:&v103 objects:v113 count:16];
              if (v26) {
                goto LABEL_12;
              }
              break;
            }
          }
        }

        v30 = objc_opt_new();
        v31 = *(void **)(*((void *)&buf + 1) + 40);
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_3;
        v98[3] = &unk_1E5B555D0;
        id v32 = v30;
        id v99 = v32;
        id v33 = v24;
        id v100 = v33;
        p_long long buf = &buf;
        id v101 = v20;
        [v31 enumerateObjectsWithOptions:2 usingBlock:v98];
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v34 = v32;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v94 objects:v112 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v95;
LABEL_22:
          uint64_t v37 = 0;
          while (1)
          {
            if (*(void *)v95 != v36) {
              objc_enumerationMutation(v34);
            }
            v38 = *(void **)(*((void *)&v94 + 1) + 8 * v37);
            if (![v33 count]) {
              break;
            }
            v39 = objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "objectAtIndex:", objc_msgSend(v38, "unsignedIntegerValue"));
            [*(id *)(*((void *)&v114 + 1) + 40) insertObject:v39 atIndex:0];
            v40 = *(void **)(*((void *)&buf + 1) + 40);
            uint64_t v41 = [v38 unsignedIntegerValue];
            v42 = [v33 firstObject];
            [v40 replaceObjectAtIndex:v41 withObject:v42];

            [v33 removeObjectAtIndex:0];
            if (v35 == ++v37)
            {
              uint64_t v35 = [v34 countByEnumeratingWithState:&v94 objects:v112 count:16];
              if (v35) {
                goto LABEL_22;
              }
              break;
            }
          }
        }
      }
      v9 = self;
    }
    if ([(FCFeedTransformationEndOfArticle *)v9 isPaywallAvailable]) {
      unint64_t v43 = [(FCFeedTransformationEndOfArticle *)self maxiumInaccessibleHeadlineCount];
    }
    else {
      unint64_t v43 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_4;
    aBlock[3] = &unk_1E5B555F8;
    aBlock[4] = self;
    id v92 = v74;
    id v93 = v73;
    v44 = _Block_copy(aBlock);
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_5;
    v89[3] = &unk_1E5B55620;
    id v45 = v44;
    id v90 = v45;
    v46 = _Block_copy(v89);
    unint64_t v47 = objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "fc_countOfObjectsPassingTest:", v46);
    unint64_t v48 = v47 - v43;
    if (v47 > v43)
    {
      v49 = objc_opt_new();
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v50 = *(id *)(*((void *)&v114 + 1) + 40);
      uint64_t v51 = [v50 countByEnumeratingWithState:&v85 objects:v111 count:16];
      if (v51)
      {
        uint64_t v52 = *(void *)v86;
LABEL_36:
        uint64_t v53 = 0;
        while (1)
        {
          if (*(void *)v86 != v52) {
            objc_enumerationMutation(v50);
          }
          uint64_t v54 = *(void *)(*((void *)&v85 + 1) + 8 * v53);
          if ((*((unsigned int (**)(id, uint64_t))v45 + 2))(v45, v54)) {
            [v49 addObject:v54];
          }
          if ([v49 count] >= v48) {
            break;
          }
          if (v51 == ++v53)
          {
            uint64_t v51 = [v50 countByEnumeratingWithState:&v85 objects:v111 count:16];
            if (v51) {
              goto LABEL_36;
            }
            break;
          }
        }
      }

      v55 = objc_opt_new();
      v56 = *(void **)(*((void *)&buf + 1) + 40);
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_6;
      v80[3] = &unk_1E5B55648;
      id v57 = v55;
      id v81 = v57;
      unint64_t v84 = v48;
      id v82 = v46;
      v83 = &buf;
      [v56 enumerateObjectsWithOptions:2 usingBlock:v80];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v58 = v57;
      uint64_t v59 = [v58 countByEnumeratingWithState:&v76 objects:v110 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v59; ++i)
          {
            if (*(void *)v77 != v60) {
              objc_enumerationMutation(v58);
            }
            v62 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            if ([v49 count])
            {
              v63 = *(void **)(*((void *)&buf + 1) + 40);
              uint64_t v64 = [v62 unsignedIntegerValue];
              v65 = [v49 firstObject];
              [v63 replaceObjectAtIndex:v64 withObject:v65];

              uint64_t v66 = 0;
              v67 = v49;
            }
            else
            {
              if ([(FCFeedTransformationEndOfArticle *)self isPaywallAvailable]) {
                goto LABEL_55;
              }
              v67 = *(void **)(*((void *)&buf + 1) + 40);
              uint64_t v66 = [v62 unsignedIntegerValue];
            }
            [v67 removeObjectAtIndex:v66];
          }
          uint64_t v59 = [v58 countByEnumeratingWithState:&v76 objects:v110 count:16];
        }
        while (v59);
      }
LABEL_55:
    }
    _Block_object_dispose(&v114, 8);
  }
  v68 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v69 = *(void *)(*((void *)&buf + 1) + 40);
    LODWORD(v114) = 138412290;
    *(void *)((char *)&v114 + 4) = v69;
    _os_log_impl(&dword_1A460D000, v68, OS_LOG_TYPE_DEFAULT, "Transformed items: %@", (uint8_t *)&v114, 0xCu);
  }
  id v70 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v70;
}

void __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 mutableCopy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 mutableCopy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = [*(id *)(a1 + 32) count];
  if (v7 >= [*(id *)(a1 + 40) count])
  {
    *a4 = 1;
  }
  else
  {
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:a3];
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0)
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
      [v8 addObject:v9];
    }
  }
}

uint64_t __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    v4 = [*(id *)(a1 + 32) purchaseProvider];
    id v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v6 = [v4 purchasedTagIDs];
    uint64_t v7 = [v6 containsObject:v5];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_5(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

void __87__FCFeedTransformationEndOfArticle_transformItems_isPaidBlock_sourceChannelIDProvider___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 56))
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:a3];
    LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    if (v7)
    {
      uint64_t v9 = *(void **)(a1 + 32);
      id v10 = [NSNumber numberWithUnsignedInteger:a3];
      [v9 addObject:v10];
    }
  }
}

- (id)transformFeedItems:(id)a3
{
  return [(FCFeedTransformationEndOfArticle *)self transformItems:a3 isPaidBlock:&__block_literal_global_77 sourceChannelIDProvider:&__block_literal_global_8_1];
}

uint64_t __55__FCFeedTransformationEndOfArticle_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPaid];
}

uint64_t __55__FCFeedTransformationEndOfArticle_transformFeedItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sourceChannelID];
}

- (id)transformHeadlines:(id)a3
{
  return [(FCFeedTransformationEndOfArticle *)self transformItems:a3 isPaidBlock:&__block_literal_global_11_1 sourceChannelIDProvider:&__block_literal_global_14];
}

uint64_t __55__FCFeedTransformationEndOfArticle_transformHeadlines___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPaid];
}

id __55__FCFeedTransformationEndOfArticle_transformHeadlines___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 sourceChannel];
  id v3 = [v2 identifier];

  return v3;
}

- (unint64_t)minimumResultHeadlineCount
{
  return self->_minimumResultHeadlineCount;
}

- (void)setMinimumResultHeadlineCount:(unint64_t)a3
{
  self->_minimumResultHeadlineCount = a3;
}

- (double)paidHeadlineRatio
{
  return self->_paidHeadlineRatio;
}

- (void)setPaidHeadlineRatio:(double)a3
{
  self->_paidHeadlineRatio = a3;
}

- (unint64_t)maxiumInaccessibleHeadlineCount
{
  return self->_maxiumInaccessibleHeadlineCount;
}

- (void)setMaxiumInaccessibleHeadlineCount:(unint64_t)a3
{
  self->_maxiumInaccessibleHeadlineCount = a3;
}

- (unint64_t)expireArticlesAfter
{
  return self->_expireArticlesAfter;
}

- (void)setExpireArticlesAfter:(unint64_t)a3
{
  self->_expireArticlesAfter = a3;
}

- (BOOL)isPaywallAvailable
{
  return self->_isPaywallAvailable;
}

- (void)setIsPaywallAvailable:(BOOL)a3
{
  self->_isPaywallAvailable = a3;
}

- (FCPurchaseProviderType)purchaseProvider
{
  return self->_purchaseProvider;
}

- (void)setPurchaseProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end