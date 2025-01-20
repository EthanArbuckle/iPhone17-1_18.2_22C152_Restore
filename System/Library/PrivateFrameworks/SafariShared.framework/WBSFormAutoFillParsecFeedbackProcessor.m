@interface WBSFormAutoFillParsecFeedbackProcessor
- (WBSFormAutoFillFeedbackDomainPolicyProvider)domainPolicyProvider;
- (WBSFormAutoFillParsecFeedbackProcessor)init;
- (WBSFormAutoFillParsecFeedbackProcessor)initWithGlobalFeedbackDispatcher:(id)a3 domainPolicyProvider:(id)a4 autoFillVersion:(unint64_t)a5;
- (id)_feedbackWithCorrectionSet:(id)a3 includeOrigin:(BOOL)a4;
- (void)_getFeedbackWithCorrectionSet:(id)a3 completionHandler:(id)a4;
- (void)sendFeedbackWithCorrectionSet:(id)a3;
- (void)setDomainPolicyProvider:(id)a3;
@end

@implementation WBSFormAutoFillParsecFeedbackProcessor

- (WBSFormAutoFillParsecFeedbackProcessor)init
{
  return 0;
}

- (WBSFormAutoFillParsecFeedbackProcessor)initWithGlobalFeedbackDispatcher:(id)a3 domainPolicyProvider:(id)a4 autoFillVersion:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSFormAutoFillParsecFeedbackProcessor;
  v11 = [(WBSFormAutoFillParsecFeedbackProcessor *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_globalFeedbackDispatcher, a3);
    v12->_autoFillVersion = a5;
    objc_storeStrong((id *)&v12->_domainPolicyProvider, a4);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.SafariShared.WBSFormAutoFillParsecFeedbackProcessor", 0);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v13;

    v15 = v12;
  }

  return v12;
}

- (void)sendFeedbackWithCorrectionSet:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[WBSCompletionQuery currentQueryID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke;
  v7[3] = &unk_1E5C9B308;
  id v6 = v4;
  id v8 = v6;
  id v9 = self;
  int64_t v10 = v5;
  [(WBSFormAutoFillParsecFeedbackProcessor *)self _getFeedbackWithCorrectionSet:v6 completionHandler:v7];
}

void __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke_1;
    block[3] = &unk_1E5C8D6E0;
    block[4] = a1[5];
    id v4 = v3;
    uint64_t v5 = a1[6];
    id v10 = v4;
    uint64_t v11 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (void *)a1[4];
      id v8 = [v7 domain];
      __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke_cold_1((uint64_t)v7, v8, buf, v6);
    }
  }
}

uint64_t __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke_1(void *a1)
{
  return [*(id *)(a1[4] + 8) sendCrowdsourcedAutoFillFeedback:a1[5] forQueryID:a1[6]];
}

- (void)_getFeedbackWithCorrectionSet:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_domainPolicyProvider)
  {
    id v9 = [v6 domain];
    domainPolicyProvider = self->_domainPolicyProvider;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5C9B358;
    id v14 = v8;
    v12[4] = self;
    id v13 = v6;
    [(WBSFormAutoFillFeedbackDomainPolicyProvider *)domainPolicyProvider autoFillFeedbackProcessor:self determineWhetherToSendFeedbackForDomain:v9 resultHandler:v12];
  }
  else
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke;
    block[3] = &unk_1E5C8D578;
    id v17 = v7;
    block[4] = self;
    id v16 = v6;
    dispatch_async(internalQueue, block);

    id v9 = v17;
  }
}

void __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) _feedbackWithCorrectionSet:*(void *)(a1 + 40) includeOrigin:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    BOOL v3 = a2 == 1;
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5C9B330;
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v11 = v5;
    v9[4] = v6;
    id v10 = v7;
    BOOL v12 = v3;
    dispatch_async(v4, v9);
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v8();
  }
}

void __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) _feedbackWithCorrectionSet:*(void *)(a1 + 40) includeOrigin:*(unsigned __int8 *)(a1 + 56)];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (id)_feedbackWithCorrectionSet:(id)a3 includeOrigin:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 domain];
  if ([v7 length])
  {
    id v8 = [v6 fingerprintsToCorrections];
    if ([v8 count])
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionary];
      [v9 setObject:@"autofill" forKeyedSubscript:@"type"];
      id v10 = [NSNumber numberWithUnsignedInteger:self->_autoFillVersion];
      [v9 setObject:v10 forKeyedSubscript:@"version"];

      id v11 = [MEMORY[0x1E4F1CA48] array];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __83__WBSFormAutoFillParsecFeedbackProcessor__feedbackWithCorrectionSet_includeOrigin___block_invoke;
      v22[3] = &unk_1E5C9B380;
      id v12 = v11;
      id v23 = v12;
      [v8 enumerateKeysAndObjectsUsingBlock:v22];
      [v9 setObject:v12 forKeyedSubscript:@"correctionsForOrigin"];
      if (v4)
      {
        domainNormalizer = self->_domainNormalizer;
        if (!domainNormalizer)
        {
          id v14 = objc_alloc_init(WBSCrowdsourcedFeedbackDomainNormalizer);
          id v16 = self->_domainNormalizer;
          p_domainNormalizer = &self->_domainNormalizer;
          *p_domainNormalizer = v14;

          domainNormalizer = *p_domainNormalizer;
        }
        id v17 = [(WBSCrowdsourcedFeedbackDomainNormalizer *)domainNormalizer transformedValue:v7];
        [v9 setObject:v17 forKeyedSubscript:@"origin"];
      }
      v18 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v25 = v7;
        __int16 v26 = 2112;
        id v27 = v12;
        __int16 v28 = 1024;
        BOOL v29 = v4;
        _os_log_debug_impl(&dword_1A6B5F000, v18, OS_LOG_TYPE_DEBUG, "Generating AutoFill feedback for %@: %@; submitting origin: %d",
          buf,
          0x1Cu);
      }
    }
    else
    {
      v20 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[WBSFormAutoFillParsecFeedbackProcessor _feedbackWithCorrectionSet:includeOrigin:](v20);
      }
      id v9 = 0;
    }
  }
  else
  {
    v19 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[WBSFormAutoFillParsecFeedbackProcessor _feedbackWithCorrectionSet:includeOrigin:](v19);
    }
    id v9 = 0;
  }

  return v9;
}

void __83__WBSFormAutoFillParsecFeedbackProcessor__feedbackWithCorrectionSet_includeOrigin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:v9 forKeyedSubscript:@"fingerprint"];
  uint64_t v7 = [v5 count];
  id v8 = [NSNumber numberWithBool:v7 == 0];
  [v6 setObject:v8 forKeyedSubscript:@"correct"];

  if (v7) {
    [v6 setObject:v5 forKeyedSubscript:@"corrections"];
  }
  [*(id *)(a1 + 32) addObject:v6];
}

- (WBSFormAutoFillFeedbackDomainPolicyProvider)domainPolicyProvider
{
  return self->_domainPolicyProvider;
}

- (void)setDomainPolicyProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainPolicyProvider, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_domainNormalizer, 0);
  objc_storeStrong((id *)&self->_globalFeedbackDispatcher, 0);
}

void __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Not sending AutoFill correctionSet %@ on %@ since generated feedback was nil", buf, 0x16u);
}

- (void)_feedbackWithCorrectionSet:(os_log_t)log includeOrigin:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Skipping AutoFill feedback generation due to missing domain", v1, 2u);
}

- (void)_feedbackWithCorrectionSet:(os_log_t)log includeOrigin:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Skipping AutoFill feedback generation due to missing fingerprintsToCorrections", v1, 2u);
}

@end