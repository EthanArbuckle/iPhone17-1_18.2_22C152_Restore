@interface SWCServiceDetails
@end

@implementation SWCServiceDetails

void __69___SWCServiceDetails_SWCServiceApproval__setUserApprovalState_error___block_invoke(uint64_t a1, void *a2)
{
}

void __69___SWCServiceDetails_SWCServiceApproval__setUserApprovalState_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(_WORD *)(*(void *)(a1 + 32) + 8) = *(_WORD *)(*(void *)(a1 + 32) + 8) & 0xFFFC | *(unsigned char *)(a1 + 56) & 3;
  }
}

uint64_t __83___SWCServiceDetails_SWCServiceApproval__waitForSiteApprovalWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [[_SWCDomain alloc] initWithString:v7];
  if (v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

void __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
  }
}

void __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

void __72___SWCServiceDetails_Synchronization__synchronizeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
  }
}

void __72___SWCServiceDetails_Synchronization__synchronizeWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

void __59___SWCServiceDetails_DeveloperMode__isDeveloperModeEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 BOOLValue];
    id v3 = v4;
  }
}

void __79___SWCServiceDetails_DeveloperMode__setDeveloperModeEnabled_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
  }
}

void __110___SWCServiceDetails_Private___serviceDetailsWithServiceSpecifier_URLComponents_limit_callerAuditToken_error___block_invoke(uint64_t a1, void *a2)
{
}

void __110___SWCServiceDetails_Private___serviceDetailsWithServiceSpecifier_URLComponents_limit_callerAuditToken_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
  }
  id v8 = v7;
  v9 = *v6;
  *id v6 = v8;
}

@end