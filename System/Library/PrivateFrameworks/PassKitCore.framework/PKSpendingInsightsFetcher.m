@interface PKSpendingInsightsFetcher
- (BOOL)_validateTrends:(id)a3 againstSummary:(id)a4;
- (PKSpendingInsightsFetcher)init;
- (void)fetchInsightTrendsForSummary:(id)a3 completion:(id)a4;
@end

@implementation PKSpendingInsightsFetcher

- (PKSpendingInsightsFetcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKSpendingInsightsFetcher;
  v2 = [(PKSpendingInsightsFetcher *)&v6 init];
  if (v2)
  {
    v3 = (FHSearchSuggestionController *)objc_alloc_init((Class)getFHSearchSuggestionControllerClass[0]());
    searchSuggestionController = v2->_searchSuggestionController;
    v2->_searchSuggestionController = v3;

    v2->_foundInsightsDiscrepancy = 0;
  }
  return v2;
}

- (void)fetchInsightTrendsForSummary:(id)a3 completion:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (self->_foundInsightsDiscrepancy)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKSpendingInsightErrorDomain" code:3 userInfo:0];
    v7[2](v7, 0, v8);
  }
  else
  {
    uint64_t v9 = [v6 summaryType];
    v10 = [MEMORY[0x1E4F1C9C8] date];
    v20 = [v6 startDate];
    v11 = [v6 endDate];
    if ([v11 compare:v10] == -1) {
      v12 = v11;
    }
    else {
      v12 = v10;
    }
    id v13 = v12;

    objc_initWeak(&location, self);
    searchSuggestionController = self->_searchSuggestionController;
    v15 = _MergedGlobals_186();
    v26[0] = v15;
    v16 = off_1EB402540();
    v26[1] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v18 = 1;
    if (v9 == 1) {
      uint64_t v18 = 2;
    }
    if (v9 == 2) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = v18;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__PKSpendingInsightsFetcher_fetchInsightTrendsForSummary_completion___block_invoke;
    v21[3] = &unk_1E56F7080;
    id v22 = v6;
    objc_copyWeak(&v24, &location);
    v23 = v7;
    [(FHSearchSuggestionController *)searchSuggestionController allFeatureInsightsWithStartDate:v20 endDate:v13 insightTypeItems:v17 trendWindow:v19 completion:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __69__PKSpendingInsightsFetcher_fetchInsightTrendsForSummary_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [*(id *)(a1 + 32) startDate];
    id v6 = [*(id *)(a1 + 32) endDate];
    int v15 = 138412802;
    id v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Received FH insights: %@\n\nfor summary with startDate %@ and endDate %@", (uint8_t *)&v15, 0x20u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      v8 = [[PKSpendingInsightTrendCollection alloc] initWithFHFeatureInsights:v3];
      if ([WeakRetained _validateTrends:v8 againstSummary:*(void *)(a1 + 32)])
      {
        uint64_t v9 = *(void *)(a1 + 40);
        if (v9)
        {
          v10 = [[PKSpendingInsightTrendCollection alloc] initWithFHFeatureInsights:v3];
          (*(void (**)(uint64_t, PKSpendingInsightTrendCollection *, void))(v9 + 16))(v9, v10, 0);
LABEL_15:
        }
      }
      else
      {
        WeakRetained[16] = 1;
        uint64_t v14 = *(void *)(a1 + 40);
        if (v14)
        {
          v10 = (PKSpendingInsightTrendCollection *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKSpendingInsightErrorDomain" code:3 userInfo:0];
          (*(void (**)(uint64_t, void, PKSpendingInsightTrendCollection *))(v14 + 16))(v14, 0, v10);
          goto LABEL_15;
        }
      }
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v13 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v13 = -1;
LABEL_12:
      v8 = (PKSpendingInsightTrendCollection *)[v12 initWithDomain:@"PKSpendingInsightErrorDomain" code:v13 userInfo:0];
      (*(void (**)(uint64_t, void, PKSpendingInsightTrendCollection *))(v11 + 16))(v11, 0, v8);
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (BOOL)_validateTrends:(id)a3 againstSummary:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke_2;
  aBlock[3] = &unk_1E56F70A8;
  aBlock[4] = self;
  id v8 = v7;
  id v64 = v8;
  uint64_t v9 = (void (**)(void *, id))_Block_copy(aBlock);
  v10 = [v6 overallSpendingTrend];
  uint64_t v11 = [v10 totalSpending];
  id v12 = [v11 amount];

  uint64_t v13 = [v8 totalSpending];
  uint64_t v14 = [(id)v13 amount];

  id v62 = 0;
  LOBYTE(v13) = __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke(v12, v14, &v62);
  id v15 = v62;
  if (v13)
  {
    id v16 = [v6 overallSpendingTrend];
    __int16 v17 = [v16 previousTotalSpending];
    uint64_t v18 = [v17 amount];

    __int16 v19 = [v8 previousTotalSpending];
    v20 = [v19 amount];

    if (([v8 isCurrentPeriod] & 1) == 0)
    {
      id v61 = v15;
      uint64_t v21 = v20;
      id v22 = v18;
      v23 = v21;
      BOOL v24 = __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke(v18, v21, &v61);
      id v25 = v61;

      if (!v24)
      {
        v44 = PKLogFacilityTypeGetObject(0xEuLL);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = [v8 startDate];
          [v8 endDate];
          v46 = v52 = v9;
          *(_DWORD *)buf = 138544130;
          v66 = v45;
          __int16 v67 = 2114;
          v68 = v46;
          __int16 v69 = 2112;
          v70 = v22;
          __int16 v71 = 2112;
          v72 = v23;
          _os_log_impl(&dword_190E10000, v44, OS_LOG_TYPE_DEFAULT, "Rejecting trends for dates [%{public}@ to %{public}@]\nbecause previous spending %@\ndoes not match summary previous spending %@. No further insights will be generated for this session.", buf, 0x2Au);

          uint64_t v9 = v52;
        }

        v9[2](v9, v25);
        BOOL v36 = 0;
        id v15 = v25;
        uint64_t v18 = v22;
        v20 = v23;
LABEL_26:

        goto LABEL_27;
      }
      id v15 = v25;
      uint64_t v18 = v22;
      v20 = v23;
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = [v8 orderedSpendingCategories];
    uint64_t v26 = [obj countByEnumeratingWithState:&v57 objects:v75 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      v48 = v20;
      v49 = v18;
      v50 = v8;
      v51 = v9;
      uint64_t v54 = *(void *)v58;
      v55 = v6;
      while (2)
      {
        uint64_t v28 = 0;
        v29 = v15;
        v30 = v14;
        v31 = v12;
        do
        {
          if (*(void *)v58 != v54) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v57 + 1) + 8 * v28);
          v33 = objc_msgSend(v55, "spendingTrendForMerchantCategory:", objc_msgSend(v32, "merchantCategory", v48, v49));
          v34 = [v33 totalSpending];
          id v12 = [v34 amount];

          uint64_t v35 = [v32 totalAmount];
          uint64_t v14 = [(id)v35 amount];

          id v56 = v29;
          LOBYTE(v35) = __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke(v12, v14, &v56);
          id v15 = v56;

          if ((v35 & 1) == 0)
          {
            v40 = PKLogFacilityTypeGetObject(0xEuLL);
            id v8 = v50;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v41 = [v50 startDate];
              v42 = [v50 endDate];
              v43 = PKMerchantCategoryToString([v32 merchantCategory]);
              *(_DWORD *)buf = 138544386;
              v66 = v41;
              __int16 v67 = 2114;
              v68 = v42;
              __int16 v69 = 2112;
              v70 = v43;
              __int16 v71 = 2112;
              v72 = v12;
              __int16 v73 = 2112;
              v74 = v14;
              _os_log_impl(&dword_190E10000, v40, OS_LOG_TYPE_DEFAULT, "Rejecting trends for dates [%{public}@ to %{public}@]\nbecause spending for merchant category %@ %@\ndoes not match summary spending %@. No further insights will be generated for this session.", buf, 0x34u);
            }
            uint64_t v9 = v51;
            v51[2](v51, v15);
            BOOL v36 = 0;
            id v6 = v55;
            goto LABEL_20;
          }
          ++v28;
          v29 = v15;
          v30 = v14;
          v31 = v12;
        }
        while (v27 != v28);
        uint64_t v27 = [obj countByEnumeratingWithState:&v57 objects:v75 count:16];
        if (v27) {
          continue;
        }
        break;
      }
      BOOL v36 = 1;
      id v6 = v55;
      id v8 = v50;
      uint64_t v9 = v51;
LABEL_20:
      v20 = v48;
      uint64_t v18 = v49;
    }
    else
    {
      BOOL v36 = 1;
    }

    goto LABEL_26;
  }
  v37 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = [v8 startDate];
    v39 = [v8 endDate];
    *(_DWORD *)buf = 138544130;
    v66 = v38;
    __int16 v67 = 2114;
    v68 = v39;
    __int16 v69 = 2112;
    v70 = v12;
    __int16 v71 = 2112;
    v72 = v14;
    _os_log_impl(&dword_190E10000, v37, OS_LOG_TYPE_DEFAULT, "Rejecting trends for dates [%{public}@ to %{public}@]\nbecause total spending %@\ndoes not match summary total spending %@. No further insights will be generated for this session.", buf, 0x2Au);
  }
  v9[2](v9, v15);
  BOOL v36 = 0;
LABEL_27:

  return v36;
}

BOOL __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke(void *a1, void *a2, void *a3)
{
  v5 = (void *)MEMORY[0x1E4F28C30];
  id v6 = a2;
  id v7 = a1;
  id v8 = [v5 decimalNumberHandlerWithRoundingMode:0 scale:2 raiseOnExactness:0 raiseOnOverflow:1 raiseOnUnderflow:1 raiseOnDivideByZero:1];
  uint64_t v9 = [v7 decimalNumberByRoundingAccordingToBehavior:v8];

  v10 = [v6 decimalNumberByRoundingAccordingToBehavior:v8];

  uint64_t v11 = [v9 compare:v10];
  uint64_t v12 = v11;
  if (a3 && v11)
  {
    *a3 = [v9 decimalNumberBySubtracting:v10];
  }

  return v12 == 0;
}

void __60__PKSpendingInsightsFetcher__validateTrends_againstSummary___block_invoke_2(uint64_t a1, void *a2)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int has_internal_ui = os_variant_has_internal_ui();
  if (v3 && has_internal_ui && !*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v5 setMaximumFractionDigits:2];
    id v6 = objc_alloc_init(PKAutoBugCaptureReporter);
    v13[0] = @"insightDifferenceFromSummary";
    id v7 = [v5 stringFromNumber:v3];
    v14[0] = v7;
    v13[1] = @"startDate";
    id v8 = [*(id *)(a1 + 40) startDate];
    uint64_t v9 = [v8 description];
    v14[1] = v9;
    v13[2] = @"endDate";
    v10 = [*(id *)(a1 + 40) endDate];
    uint64_t v11 = [v10 description];
    v14[2] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    [(PKAutoBugCaptureReporter *)v6 reportIssueWithDomain:@"Wallet" type:@"PKSpendingInsightsFetcher" subtype:@"SpendingDiscrepancy" subtypeContext:0 payload:v12];
  }
}

- (void).cxx_destruct
{
}

@end