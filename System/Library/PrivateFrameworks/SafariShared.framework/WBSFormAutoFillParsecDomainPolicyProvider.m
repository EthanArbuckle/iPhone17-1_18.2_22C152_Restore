@interface WBSFormAutoFillParsecDomainPolicyProvider
- (WBSFormAutoFillParsecDomainPolicyProvider)initWithFeedbackAllowList:(id)a3;
- (void)autoFillFeedbackProcessor:(id)a3 determineWhetherToSendFeedbackForDomain:(id)a4 resultHandler:(id)a5;
- (void)getLastPolicyRetrievalURLStringWithResultHandler:(id)a3;
- (void)setPoliciesWithJSONData:(id)a3 retrievalURLString:(id)a4;
@end

@implementation WBSFormAutoFillParsecDomainPolicyProvider

- (WBSFormAutoFillParsecDomainPolicyProvider)initWithFeedbackAllowList:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSFormAutoFillParsecDomainPolicyProvider;
  v6 = [(WBSFormAutoFillParsecDomainPolicyProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedbackAllowList, a3);
    v8 = v7;
  }

  return v7;
}

- (void)setPoliciesWithJSONData:(id)a3 retrievalURLString:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a3 copy];
  v8 = (void *)[v6 copy];

  feedbackAllowList = self->_feedbackAllowList;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__WBSFormAutoFillParsecDomainPolicyProvider_setPoliciesWithJSONData_retrievalURLString___block_invoke;
  v12[3] = &unk_1E5C9B2B8;
  id v13 = v8;
  id v14 = v7;
  v15 = self;
  id v10 = v7;
  id v11 = v8;
  [(WBSCrowdsourcedFeedbackAllowList *)feedbackAllowList getLastAllowListRetrievalURLStringWithCompletionHandler:v12];
}

void __88__WBSFormAutoFillParsecDomainPolicyProvider_setPoliciesWithJSONData_retrievalURLString___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
  {
    v3 = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__WBSFormAutoFillParsecDomainPolicyProvider_setPoliciesWithJSONData_retrievalURLString___block_invoke_2;
    block[3] = &unk_1E5C8CD20;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = v4;
    uint64_t v8 = v5;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v3, block);
  }
}

void __88__WBSFormAutoFillParsecDomainPolicyProvider_setPoliciesWithJSONData_retrievalURLString___block_invoke_2(void *a1)
{
  uint64_t v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a1[4] options:0 error:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v3 = v5;
  if (isKindOfClass)
  {
    id v4 = objc_msgSend(v5, "safari_arrayForKey:", @"tlds");
    if (v4) {
      [*(id *)(a1[5] + 8) replaceDomainAllowListWithDomains:v4 retrievalURLString:a1[6] completionHandler:0];
    }

    v3 = v5;
  }
}

- (void)getLastPolicyRetrievalURLStringWithResultHandler:(id)a3
{
  id v4 = a3;
  feedbackAllowList = self->_feedbackAllowList;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__WBSFormAutoFillParsecDomainPolicyProvider_getLastPolicyRetrievalURLStringWithResultHandler___block_invoke;
  v7[3] = &unk_1E5C9B218;
  id v8 = v4;
  id v6 = v4;
  [(WBSCrowdsourcedFeedbackAllowList *)feedbackAllowList getLastAllowListRetrievalURLStringWithCompletionHandler:v7];
}

void __94__WBSFormAutoFillParsecDomainPolicyProvider_getLastPolicyRetrievalURLStringWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__WBSFormAutoFillParsecDomainPolicyProvider_getLastPolicyRetrievalURLStringWithResultHandler___block_invoke_2;
  v6[3] = &unk_1E5C8DDF0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __94__WBSFormAutoFillParsecDomainPolicyProvider_getLastPolicyRetrievalURLStringWithResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)autoFillFeedbackProcessor:(id)a3 determineWhetherToSendFeedbackForDomain:(id)a4 resultHandler:(id)a5
{
  id v7 = a5;
  feedbackAllowList = self->_feedbackAllowList;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __125__WBSFormAutoFillParsecDomainPolicyProvider_autoFillFeedbackProcessor_determineWhetherToSendFeedbackForDomain_resultHandler___block_invoke;
  v10[3] = &unk_1E5C9B2E0;
  id v11 = v7;
  id v9 = v7;
  [(WBSCrowdsourcedFeedbackAllowList *)feedbackAllowList getAllowListStatusForDomain:a4 completionHandler:v10];
}

uint64_t __125__WBSFormAutoFillParsecDomainPolicyProvider_autoFillFeedbackProcessor_determineWhetherToSendFeedbackForDomain_resultHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2 || a2 == 2 || a2 == 1) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end