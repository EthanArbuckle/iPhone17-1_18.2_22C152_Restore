@interface WFOutOfProcessWorkflowController
@end

@implementation WFOutOfProcessWorkflowController

uint64_t __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stop];
}

void __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_170(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__14907;
    v22 = __Block_byref_object_dispose__14908;
    id v23 = (id)objc_opt_new();
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_2;
    v14 = &unk_1E654F350;
    id v7 = *(id *)(a1 + 32);
    long long v17 = *(_OWORD *)(a1 + 56);
    id v15 = v7;
    v16 = &v18;
    [v5 enumerateKeysAndObjectsUsingBlock:&v11];
    uint64_t v8 = objc_msgSend((id)v19[5], "copy", v11, v12, v13, v14);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

void __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)a1[4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_3;
  v11[3] = &unk_1E654F328;
  id v8 = v5;
  id v12 = v8;
  uint64_t v9 = objc_msgSend(v7, "if_firstObjectPassingTest:", v11);
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a1[6], a1[7], @"WFOutOfProcessWorkflowController+ContextualActions.m", 44, @"can't find size descriptor matching the service's response (%@, %@)", a1[4], v8 object file lineNumber description];
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:v6 forKeyedSubscript:v9];
}

uint64_t __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

@end