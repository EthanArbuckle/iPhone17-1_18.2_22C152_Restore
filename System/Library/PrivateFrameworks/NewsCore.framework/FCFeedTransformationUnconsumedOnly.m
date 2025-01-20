@interface FCFeedTransformationUnconsumedOnly
- (FCFeedTransformationUnconsumedOnly)init;
- (FCFeedTransformationUnconsumedOnly)initWithFilterMethod:(unint64_t)a3 consumedArticleItems:(id)a4 minimumTimeSinceFirstConsumedToFilter:(double)a5 filterDate:(id)a6 articleIDProvider:(id)a7 dateOfArticleIDConsumptionProvider:(id)a8 maxVersionConsumedProvider:(id)a9 dateOfMaxVersionConsumptionProvider:(id)a10;
- (FCFeedTransforming)innerFilter;
- (id)transformFeedItems:(id)a3;
- (void)setInnerFilter:(id)a3;
@end

@implementation FCFeedTransformationUnconsumedOnly

- (FCFeedTransformationUnconsumedOnly)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedTransformationUnconsumedOnly init]";
    __int16 v9 = 2080;
    v10 = "FCFeedTransformationUnconsumedOnly.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFeedTransformationUnconsumedOnly init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCFeedTransformationUnconsumedOnly)initWithFilterMethod:(unint64_t)a3 consumedArticleItems:(id)a4 minimumTimeSinceFirstConsumedToFilter:(double)a5 filterDate:(id)a6 articleIDProvider:(id)a7 dateOfArticleIDConsumptionProvider:(id)a8 maxVersionConsumedProvider:(id)a9 dateOfMaxVersionConsumptionProvider:(id)a10
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v45 = v17;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v34 = v21;
    v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "consumedArticleItems");
    *(_DWORD *)buf = 136315906;
    v56 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    __int16 v57 = 2080;
    v58 = "FCFeedTransformationUnconsumedOnly.m";
    __int16 v59 = 1024;
    int v60 = 36;
    __int16 v61 = 2114;
    v62 = v35;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v21 = v34;
    if (v18) {
      goto LABEL_6;
    }
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v36 = v21;
    v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "filterDate");
    *(_DWORD *)buf = 136315906;
    v56 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    __int16 v57 = 2080;
    v58 = "FCFeedTransformationUnconsumedOnly.m";
    __int16 v59 = 1024;
    int v60 = 37;
    __int16 v61 = 2114;
    v62 = v37;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v21 = v36;
  }
LABEL_6:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v38 = v21;
    v39 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleIDProvider");
    *(_DWORD *)buf = 136315906;
    v56 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    __int16 v57 = 2080;
    v58 = "FCFeedTransformationUnconsumedOnly.m";
    __int16 v59 = 1024;
    int v60 = 38;
    __int16 v61 = 2114;
    v62 = v39;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v21 = v38;
    if (v20) {
      goto LABEL_11;
    }
  }
  else if (v20)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v40 = v21;
    v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dateOfArticleIDConsumptionProvider");
    *(_DWORD *)buf = 136315906;
    v56 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    __int16 v57 = 2080;
    v58 = "FCFeedTransformationUnconsumedOnly.m";
    __int16 v59 = 1024;
    int v60 = 39;
    __int16 v61 = 2114;
    v62 = v41;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v21 = v40;
  }
LABEL_11:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v42 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "maxVersionConsumedProvider");
    *(_DWORD *)buf = 136315906;
    v56 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    __int16 v57 = 2080;
    v58 = "FCFeedTransformationUnconsumedOnly.m";
    __int16 v59 = 1024;
    int v60 = 40;
    __int16 v61 = 2114;
    v62 = v42;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v21 = 0;
    if (v22) {
      goto LABEL_16;
    }
  }
  else if (v22)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v43 = v21;
    v44 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dateOfMaxVersionConsumptionProvider");
    *(_DWORD *)buf = 136315906;
    v56 = "-[FCFeedTransformationUnconsumedOnly initWithFilterMethod:consumedArticleItems:minimumTimeSinceFirstConsumedTo"
          "Filter:filterDate:articleIDProvider:dateOfArticleIDConsumptionProvider:maxVersionConsumedProvider:dateOfMaxVer"
          "sionConsumptionProvider:]";
    __int16 v57 = 2080;
    v58 = "FCFeedTransformationUnconsumedOnly.m";
    __int16 v59 = 1024;
    int v60 = 41;
    __int16 v61 = 2114;
    v62 = v44;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v21 = v43;
  }
LABEL_16:
  v54.receiver = self;
  v54.super_class = (Class)FCFeedTransformationUnconsumedOnly;
  v23 = [(FCFeedTransformationUnconsumedOnly *)&v54 init];
  if (v23)
  {
    if (a3 == 2)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke_3;
      aBlock[3] = &unk_1E5B5AF08;
      id v24 = v21;
      id v53 = v21;
      v25 = _Block_copy(aBlock);
      v26 = _Block_copy(v22);
    }
    else
    {
      id v24 = v21;
      if (a3 == 1)
      {
        v26 = _Block_copy(v20);
        v25 = &__block_literal_global_17_2;
      }
      else
      {
        if (a3) {
          v25 = 0;
        }
        else {
          v25 = &__block_literal_global_169;
        }
        v26 = 0;
      }
    }
    v27 = objc_msgSend(v45, "fc_dictionaryWithKeyBlock:", v19);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke_4;
    v46[3] = &unk_1E5B5AF30;
    id v47 = v27;
    id v49 = v25;
    id v48 = v18;
    id v50 = v26;
    double v51 = a5;
    id v28 = v26;
    id v29 = v25;
    id v30 = v27;
    uint64_t v31 = +[FCFeedTransformationBlockFilter blockFilterWithPredicate:v46];
    innerFilter = v23->_innerFilter;
    v23->_innerFilter = (FCFeedTransforming *)v31;

    id v21 = v24;
  }

  return v23;
}

uint64_t __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke()
{
  return 0;
}

uint64_t __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke_2()
{
  return 1;
}

BOOL __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 16);
  id v6 = a2;
  uint64_t v7 = v5(v4, a3);
  uint64_t v8 = [v6 publisherArticleVersion];

  return v7 >= v8;
}

BOOL __245__FCFeedTransformationUnconsumedOnly_initWithFilterMethod_consumedArticleItems_minimumTimeSinceFirstConsumedToFilter_filterDate_articleIDProvider_dateOfArticleIDConsumptionProvider_maxVersionConsumedProvider_dateOfMaxVersionConsumptionProvider___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v5 = [v3 articleID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6 && (*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    BOOL v11 = v10 < *(double *)(a1 + 64);
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (id)transformFeedItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedItems");
    *(_DWORD *)buf = 136315906;
    double v10 = "-[FCFeedTransformationUnconsumedOnly transformFeedItems:]";
    __int16 v11 = 2080;
    int v12 = "FCFeedTransformationUnconsumedOnly.m";
    __int16 v13 = 1024;
    int v14 = 112;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCFeedTransformationUnconsumedOnly *)self innerFilter];
  id v6 = [v5 transformFeedItems:v4];

  return v6;
}

- (FCFeedTransforming)innerFilter
{
  return self->_innerFilter;
}

- (void)setInnerFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end