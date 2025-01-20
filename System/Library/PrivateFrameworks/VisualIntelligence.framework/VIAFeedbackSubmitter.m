@interface VIAFeedbackSubmitter
- (PARSession)parSession;
- (VIAFeedbackSubmitter)initWithPARSession:(id)a3;
- (VIAnalyticsTestingDelegate)testingDelegate;
- (void)didHitCacheForQueryId:(unint64_t)a3;
- (void)reportFeedback:(id)a3 queryId:(int64_t)a4;
- (void)setTestingDelegate:(id)a3;
@end

@implementation VIAFeedbackSubmitter

- (VIAFeedbackSubmitter)initWithPARSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIAFeedbackSubmitter;
  v6 = [(VIAFeedbackSubmitter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_parSession, a3);
  }

  return v7;
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v6 && (isKindOfClass & 1) != 0) {
    a4 = [v6 queryId];
  }
  [(PARSession *)self->_parSession reportFeedback:v6 queryId:a4];
  p_testingDelegate = &self->_testingDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_testingDelegate);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)p_testingDelegate);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = [v6 timestamp];
    id v14 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;
    v17 = v16;
    if (v16)
    {
      v79 = @"viewAppearEvent";
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "viewAppearEvent"));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v81 = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v79 count:1];
LABEL_56:

      [v10 didLogEventName:v12 queryID:a4 timestamp:v13 metadata:v19];
      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v14;
    }
    else {
      v20 = 0;
    }
    v21 = v20;
    v18 = v21;
    uint64_t v61 = v13;
    if (v21)
    {
      v22 = [(__CFString *)v21 suggestions];
      v23 = (__CFString *)VICompactMapArray(v22, &__block_literal_global_1);

      v24 = [(__CFString *)v18 suggestions];
      v25 = (__CFString *)VICompactMapArray(v24, &__block_literal_global_29);

      v79 = @"identifierList";
      v80 = @"topicIdentifier";
      v81 = v23;
      v82 = v25;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v79 count:2];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v26 = v14;
      }
      else {
        v26 = 0;
      }
      v27 = v26;
      if (v27)
      {
        id v60 = v14;
        v59 = v27;
        v28 = [(__CFString *)v27 suggestion];
        v79 = @"identifier";
        uint64_t v29 = [(__CFString *)v28 identifier];
        id v30 = (id)v29;
        v31 = @"missing-identifier";
        if (v29) {
          v31 = (__CFString *)v29;
        }
        v81 = v31;
        v80 = @"suggestion";
        v58 = v28;
        uint64_t v32 = [(__CFString *)v28 suggestion];
        v33 = (void *)v32;
        v34 = @"missing-suggestion";
        if (v32) {
          v34 = (__CFString *)v32;
        }
        v82 = v34;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v79 count:2];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v35 = v14;
        }
        else {
          v35 = 0;
        }
        v25 = v35;
        if (!v25)
        {
          v23 = 0;
          v19 = (void *)MEMORY[0x1E4F1CC08];
          v18 = 0;
          goto LABEL_55;
        }
        v59 = 0;
        id v60 = v14;
        v54 = v12;
        id v55 = v10;
        int64_t v56 = a4;
        id v57 = v6;
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        v58 = v25;
        obuint64_t j = [(__CFString *)v25 sections];
        uint64_t v36 = [obj countByEnumeratingWithState:&v72 objects:&v81 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v63 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v73 != v63) {
                objc_enumerationMutation(obj);
              }
              v39 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              long long v68 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              v40 = objc_msgSend(v39, "results", v54, v55, v56, v57);
              uint64_t v41 = [v40 countByEnumeratingWithState:&v68 objects:&v79 count:16];
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v43 = *(void *)v69;
                do
                {
                  for (uint64_t j = 0; j != v42; ++j)
                  {
                    if (*(void *)v69 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    v45 = [*(id *)(*((void *)&v68 + 1) + 8 * j) result];
                    v46 = [v45 fbr];

                    if (v46) {
                      [v30 addObject:v46];
                    }
                  }
                  uint64_t v42 = [v40 countByEnumeratingWithState:&v68 objects:&v79 count:16];
                }
                while (v42);
              }

              long long v66 = 0u;
              long long v67 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              v47 = [v39 section];
              v48 = [v47 results];

              uint64_t v49 = [v48 countByEnumeratingWithState:&v64 objects:v78 count:16];
              if (v49)
              {
                uint64_t v50 = v49;
                uint64_t v51 = *(void *)v65;
                do
                {
                  for (uint64_t k = 0; k != v50; ++k)
                  {
                    if (*(void *)v65 != v51) {
                      objc_enumerationMutation(v48);
                    }
                    v53 = [*(id *)(*((void *)&v64 + 1) + 8 * k) fbr];
                    if (v53) {
                      [v30 addObject:v53];
                    }
                  }
                  uint64_t v50 = [v48 countByEnumeratingWithState:&v64 objects:v78 count:16];
                }
                while (v50);
              }
            }
            uint64_t v37 = [obj countByEnumeratingWithState:&v72 objects:&v81 count:16];
          }
          while (v37);
        }

        v76 = @"feedbackResponseList";
        id v77 = v30;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        a4 = v56;
        id v6 = v57;
        v12 = v54;
        id v10 = v55;
      }

      v17 = 0;
      id v14 = v60;
      v18 = 0;
      v25 = v58;
      v23 = v59;
    }
LABEL_55:

    uint64_t v13 = v61;
    goto LABEL_56;
  }
LABEL_57:
}

- (void)didHitCacheForQueryId:(unint64_t)a3
{
  [(PARSession *)self->_parSession didSkipSearch:4 forInput:0 queryId:a3];
  p_testingDelegate = &self->_testingDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_testingDelegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_testingDelegate);
    [v7 didLogEventName:@"SFSkipSearchFeedback" queryID:a3 timestamp:mach_absolute_time() metadata:MEMORY[0x1E4F1CC08]];
  }
}

- (PARSession)parSession
{
  return self->_parSession;
}

- (VIAnalyticsTestingDelegate)testingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
  return (VIAnalyticsTestingDelegate *)WeakRetained;
}

- (void)setTestingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_parSession, 0);
}

@end