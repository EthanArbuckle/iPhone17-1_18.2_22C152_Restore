@interface UIHomeAffordanceSceneNotifierProxy
@end

@implementation UIHomeAffordanceSceneNotifierProxy

id __53___UIHomeAffordanceSceneNotifierProxy_initWithScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained debugDescription];

  return v2;
}

uint64_t __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) hasSuccinctStyle];
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) hasDebugStyle];
    if (result) {
      return result;
    }
    v3 = *(void **)(a1 + 32);
  }
  return (uint64_t)(id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "count"), @"observers.count");
}

void __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", @"lastReceivedHomeAffordanceSceneReferenceFrame", *(double *)(*(void *)(a1 + 40) + 56), *(double *)(*(void *)(a1 + 40) + 64), *(double *)(*(void *)(a1 + 40) + 72), *(double *)(*(void *)(a1 + 40) + 80));
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 32) count];
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_3;
    v11[3] = &unk_1E52D9F98;
    v11[4] = *(void *)(a1 + 40);
    v11[5] = v4;
    [v4 appendBodySectionWithName:@"observers" block:v11];
  }
  else
  {
    id v5 = (id)[v4 appendObject:0 withName:@"observers"];
  }
  id v6 = *(id *)(*(void *)(a1 + 40) + 48);
  v7 = *(void **)(a1 + 32);
  v8 = [v6 succinctDescription];
  id v9 = (id)[v7 appendObject:v8 withName:@"targetNotifier" skipIfNil:1];

  id v10 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"targetNotifierRegistrationToken" skipIfNil:1];
}

void __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * v5);
        v7 = *(void **)(a1 + 40);
        if (v6 && (id v8 = objc_loadWeakRetained((id *)(v6 + 8))) != 0)
        {
          id v9 = v8;
          id v10 = NSString;
          v11 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v11);
          v13 = [v10 stringWithFormat:@"<%@: %p>", v12, v9];
        }
        else
        {
          v13 = @"(nil)";
        }
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_4;
        v15[3] = &unk_1E52D9F98;
        v15[4] = *(void *)(a1 + 40);
        v15[5] = v6;
        [v7 appendBodySectionWithName:v13 block:v15];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

id __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_4(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(a1 + 40) withName:@"observationRecord"];
}

@end