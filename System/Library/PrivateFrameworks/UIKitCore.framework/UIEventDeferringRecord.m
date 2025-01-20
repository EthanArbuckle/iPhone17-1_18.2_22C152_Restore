@interface UIEventDeferringRecord
@end

@implementation UIEventDeferringRecord

void __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  int8x16_t v5 = a1[2];
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

id __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    v3 = *(void **)(a1 + 40);
    id v4 = [v3 activeMultilinePrefix];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v15 = &unk_1E52D9F98;
    int8x16_t v5 = *(void **)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = v5;
    [v3 appendBodySectionWithName:@"recreationReasons" multilinePrefix:v4 block:&v12];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(void *)(v2 + 16), @"descriptor", v12, v13, v14, v15, v16);
  id v7 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 24) withName:@"invalidationToken"];
  v8 = *(void **)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  id v10 = (id)[v8 appendObject:WeakRetained withName:@"deferringToken"];

  return (id)[*(id *)(a1 + 40) appendPointer:*(void *)(*(void *)(a1 + 32) + 40) withName:@"recordingManagerPointer"];
}

void __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(a1 + 40);
        v9 = _UIEventDeferringShorterRecreationReasonStringForReason(*(void **)(*((void *)&v11 + 1) + 8 * v7));
        id v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, 0, (void)v11);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

@end