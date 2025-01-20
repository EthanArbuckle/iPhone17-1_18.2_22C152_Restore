@interface SBUIBiometricOperationAssertion
@end

@implementation SBUIBiometricOperationAssertion

void __89___SBUIBiometricOperationAssertion_initWithIdentifier_forReason_queue_invalidationBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  id v5 = v3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = objc_msgSend(v5, "operations", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) cancel];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [v5 setOperations:0];
}

void __74___SBUIBiometricOperationAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 appendString:v3 withName:@"identifier"];

  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) reason];
  [v4 appendString:v5 withName:@"reason"];

  v6 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) operations];
  uint64_t v7 = [v8 allObjects];
  [v6 appendArraySection:v7 withName:@"operations" skipIfEmpty:0];
}

@end