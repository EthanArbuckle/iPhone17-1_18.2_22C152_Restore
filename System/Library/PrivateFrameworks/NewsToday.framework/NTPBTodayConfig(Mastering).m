@interface NTPBTodayConfig(Mastering)
- (id)_resolveArticle:()Mastering withPaidAccessChecker:heldArticleRecords:;
- (id)_resolveArticles:()Mastering withPaidAccessChecker:heldArticleRecords:;
- (void)nt_resolveFallbacksWithPaidAccessChecker:()Mastering heldArticleRecords:;
@end

@implementation NTPBTodayConfig(Mastering)

- (void)nt_resolveFallbacksWithPaidAccessChecker:()Mastering heldArticleRecords:
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTPBTodayConfig(Mastering) nt_resolveFallbacksWithPaidAccessChecker:heldArticleRecords:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTPBTodayConfig(Mastering) nt_resolveFallbacksWithPaidAccessChecker:heldArticleRecords:]();
  }
LABEL_6:
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [a1 todayQueueConfigs];
  uint64_t v35 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v51;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v51 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v8;
        v9 = *(void **)(*((void *)&v50 + 1) + 8 * v8);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v40 = [v9 todaySectionConfigs];
        uint64_t v10 = [v40 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v47;
          uint64_t v37 = *(void *)v47;
          do
          {
            uint64_t v13 = 0;
            uint64_t v41 = v11;
            do
            {
              if (*(void *)v47 != v12) {
                objc_enumerationMutation(v40);
              }
              v14 = *(void **)(*((void *)&v46 + 1) + 8 * v13);
              int v15 = [v14 sectionType];
              if (v15 == 5)
              {
                v20 = [v14 itemsTodaySectionConfig];
                long long v42 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                long long v45 = 0u;
                v17 = [v20 items];
                uint64_t v26 = [v17 countByEnumeratingWithState:&v42 objects:v54 count:16];
                if (v26)
                {
                  uint64_t v27 = v26;
                  v38 = v20;
                  uint64_t v39 = v13;
                  uint64_t v28 = *(void *)v43;
                  do
                  {
                    for (uint64_t i = 0; i != v27; ++i)
                    {
                      if (*(void *)v43 != v28) {
                        objc_enumerationMutation(v17);
                      }
                      v30 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                      v31 = [v30 article];
                      if (v31)
                      {
                        v32 = [a1 _resolveArticle:v31 withPaidAccessChecker:v6 heldArticleRecords:v7];
                        [v30 setArticle:v32];
                      }
                    }
                    uint64_t v27 = [v17 countByEnumeratingWithState:&v42 objects:v54 count:16];
                  }
                  while (v27);
                  uint64_t v12 = v37;
                  v20 = v38;
                  uint64_t v11 = v41;
                  uint64_t v13 = v39;
                }
              }
              else
              {
                if (v15 == 4)
                {
                  v21 = [v14 personalizedTodaySectionConfig];
                  v22 = [v21 personalizedArticles];
                  [a1 _resolveArticles:v22 withPaidAccessChecker:v6 heldArticleRecords:v7];
                  v24 = uint64_t v23 = v13;
                  v25 = (void *)[v24 mutableCopy];
                  [v21 setPersonalizedArticles:v25];

                  uint64_t v13 = v23;
                  v17 = [v21 mandatoryArticles];
                  v18 = [a1 _resolveArticles:v17 withPaidAccessChecker:v6 heldArticleRecords:v7];
                  v19 = (void *)[v18 mutableCopy];
                  v20 = v21;
                  [v21 setMandatoryArticles:v19];
                }
                else
                {
                  if (v15 != 3) {
                    goto LABEL_33;
                  }
                  v16 = [v14 articleIDsTodaySectionConfig];
                  v17 = [v16 articles];
                  v18 = [a1 _resolveArticles:v17 withPaidAccessChecker:v6 heldArticleRecords:v7];
                  v19 = (void *)[v18 mutableCopy];
                  v20 = v16;
                  [v16 setArticles:v19];
                }

                uint64_t v11 = v41;
              }

LABEL_33:
              ++v13;
            }
            while (v13 != v11);
            uint64_t v11 = [v40 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }
          while (v11);
        }

        uint64_t v8 = v36 + 1;
      }
      while (v36 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v35);
  }
}

- (id)_resolveArticle:()Mastering withPaidAccessChecker:heldArticleRecords:
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v53 = a4;
  id v54 = a5;
  id v8 = v7;
  v9 = NTSharedLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v56 = v8;
    _os_log_impl(&dword_22592C000, v9, OS_LOG_TYPE_DEBUG, "resolving article %{public}@", buf, 0xCu);
  }

  uint64_t v10 = [v8 paidArticle];
  id v11 = v8;
  if (v10)
  {
    uint64_t v12 = (void *)v10;
    long long v49 = v8;
    while (1)
    {
      uint64_t v13 = NTSharedLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v56 = v12;
        _os_log_impl(&dword_22592C000, v13, OS_LOG_TYPE_DEBUG, "considering paid article %{public}@", buf, 0xCu);
      }

      v14 = [v12 articleID];
      int v15 = [v54 recordWithID:v14];

      if (v15)
      {
        char v16 = [v15 isPaid];
        int v17 = [v15 isBundlePaid];
        v18 = [v15 sourceChannelTagID];
        id v19 = v53;
        id v20 = v18;
        v21 = [v19 bundleSubscriptionProvider];
        v22 = [v19 purchaseProvider];
        id v23 = v21;
        id v24 = v22;
        id v25 = v20;
        if ((v16 & 1) == 0 && !v17) {
          goto LABEL_28;
        }
        char v26 = v16 ^ 1;
        if (!v24) {
          char v26 = 1;
        }
        if ((v26 & 1) == 0)
        {
          uint64_t v27 = [v24 purchasedTagIDs];
          char v28 = [v27 containsObject:v25];

          if (v28)
          {
LABEL_28:

            long long v46 = NTSharedLog();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              long long v47 = [v12 articleID];
              *(_DWORD *)buf = 138543362;
              id v56 = v47;
              _os_log_impl(&dword_22592C000, v46, OS_LOG_TYPE_DEBUG, "user has access to %{public}@", buf, 0xCu);
            }
            id v11 = v12;
            id v8 = v49;

            break;
          }
        }
        char v29 = v17 ^ 1;
        if (!v23) {
          char v29 = 1;
        }
        if ((v29 & 1) == 0)
        {
          id v30 = v23;
          id v31 = v25;
          if (!v31) {
            goto LABEL_19;
          }
          uint64_t v32 = [v30 bundleSubscription];
          objc_getAssociatedObject((id)v32, (const void *)(v32 + 1));
          v33 = long long v51 = v31;
          uint64_t v34 = [v33 unsignedIntegerValue];
          char v35 = v34;
          objc_getAssociatedObject((id)v32, (const void *)~v34);
          id v52 = v19;
          v37 = id v36 = v30;
          char v38 = [v37 unsignedIntegerValue] ^ v35;

          id v30 = v36;
          id v19 = v52;

          id v31 = v51;
          if (v38)
          {
            long long v43 = [v30 bundleSubscription];
            long long v44 = [v43 bundleChannelIDs];
            char v50 = [v44 containsObject:v51];

            if (v50) {
              goto LABEL_28;
            }
          }
          else
          {
LABEL_19:
          }
        }

        uint64_t v39 = NTSharedLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          id v40 = [v12 articleID];
          *(_DWORD *)buf = 138543362;
          id v56 = v40;
          uint64_t v41 = v39;
          long long v42 = "user does not have access to %{public}@";
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v39 = NTSharedLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          id v40 = [v12 articleID];
          *(_DWORD *)buf = 138543362;
          id v56 = v40;
          uint64_t v41 = v39;
          long long v42 = "did not find record for article %{public}@";
LABEL_25:
          _os_log_impl(&dword_22592C000, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0xCu);
        }
      }

      uint64_t v45 = [v12 paidArticle];

      uint64_t v12 = (void *)v45;
      if (!v45)
      {
        id v8 = v49;
        id v11 = v49;
        break;
      }
    }
  }

  return v11;
}

- (id)_resolveArticles:()Mastering withPaidAccessChecker:heldArticleRecords:
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__NTPBTodayConfig_Mastering___resolveArticles_withPaidAccessChecker_heldArticleRecords___block_invoke;
  v14[3] = &unk_26475CF90;
  v14[4] = a1;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", v14);

  return v12;
}

- (void)nt_resolveFallbacksWithPaidAccessChecker:()Mastering heldArticleRecords:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "heldArticleRecords");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTPBTodayConfig(Mastering) nt_resolveFallbacksWithPaidAccessChecker:heldArticleRecords:]";
  __int16 v3 = 2080;
  v4 = "NTTodayConfig+Mastering.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)nt_resolveFallbacksWithPaidAccessChecker:()Mastering heldArticleRecords:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "paidAccessChecker");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTPBTodayConfig(Mastering) nt_resolveFallbacksWithPaidAccessChecker:heldArticleRecords:]";
  __int16 v3 = 2080;
  v4 = "NTTodayConfig+Mastering.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end