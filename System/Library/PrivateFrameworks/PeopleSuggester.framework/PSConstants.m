@interface PSConstants
@end

@implementation PSConstants

void __41___PSConstants_eligibleShareSheetTargets__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A6243860]();
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [*(id *)(a1 + 32) mobileMailBundleId];
  v5 = [*(id *)(a1 + 32) mobileMessagesBundleId];
  uint64_t v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v7 = (void *)eligibleShareSheetTargets__pasExprOnceResult;
  eligibleShareSheetTargets__pasExprOnceResult = v6;
}

void __33___PSConstants_messagesBundleIds__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v2 = +[_PSConstants mobileMessagesBundleId];
  v3 = +[_PSConstants shareSheetTargetBundleIdMessages];
  uint64_t v4 = objc_msgSend(v1, "initWithObjects:", v2, v3, 0);
  v5 = (void *)messagesBundleIds__pasExprOnceResult;
  messagesBundleIds__pasExprOnceResult = v4;
}

void __29___PSConstants_mailBundleIds__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v2 = +[_PSConstants mobileMailBundleId];
  v3 = +[_PSConstants shareSheetTargetBundleIdMail];
  uint64_t v4 = +[_PSConstants macMailBundleId];
  uint64_t v5 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, 0);
  uint64_t v6 = (void *)mailBundleIds__pasExprOnceResult;
  mailBundleIds__pasExprOnceResult = v5;
}

void __34___PSConstants_shareplayBundleIds__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v2 = +[_PSConstants sharePlayBundleId];
  v3 = +[_PSConstants collaborationSuggestionBundleId];
  uint64_t v4 = objc_msgSend(v1, "initWithObjects:", v2, v3, 0);
  uint64_t v5 = (void *)shareplayBundleIds__pasExprOnceResult;
  shareplayBundleIds__pasExprOnceResult = v4;
}

void __31___PSConstants_systemBundleIds__block_invoke()
{
  id v5 = +[_PSConstants messagesBundleIds];
  v0 = +[_PSConstants mailBundleIds];
  id v1 = +[_PSConstants shareplayBundleIds];
  v2 = objc_opt_new();
  [v2 unionSet:v0];
  [v2 unionSet:v5];
  [v2 unionSet:v1];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = (void *)systemBundleIds_systemBundleIds;
  systemBundleIds_systemBundleIds = v3;
}

@end