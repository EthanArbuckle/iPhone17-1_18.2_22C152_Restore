@interface UIActiveViewServiceSessionTracker
@end

@implementation UIActiveViewServiceSessionTracker

void __51___UIActiveViewServiceSessionTracker_sharedTracker__block_invoke()
{
  v0 = [_UIActiveViewServiceSessionTracker alloc];
  if (v0
    && (v6.receiver = v0,
        v6.super_class = (Class)_UIActiveViewServiceSessionTracker,
        (id v1 = objc_msgSendSuper2(&v6, sel_init)) != 0))
  {
    v2 = v1;
    uint64_t v3 = BSLogAddStateCaptureBlockWithTitle();
    v4 = (void *)v2[2];
    v2[2] = v3;
  }
  else
  {
    v2 = 0;
  }
  v5 = (void *)qword_1EB25EFA0;
  qword_1EB25EFA0 = (uint64_t)v2;
}

id __43___UIActiveViewServiceSessionTracker__init__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) descriptionBuilderWithMultilinePrefix:&stru_1ED0E84C0];
  v2 = [v1 build];

  return v2;
}

uint64_t __65___UIActiveViewServiceSessionTracker__createEvaluatedObjectCache__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v4 = *(void *)(a2 + 40);
      uint64_t v5 = [*(id *)(a2 + 8) count];
      BOOL v6 = *(void *)(a2 + 40) == 2;
      int v7 = *(_DWORD *)(a2 + 20);
      if (v4) {
        BOOL v8 = v5 == 0;
      }
      else {
        BOOL v8 = 1;
      }
      int v9 = !v8;
    }
    else
    {
      BOOL v6 = 0;
      int v9 = 0;
      int v7 = 0;
    }
    if (v7 != 3 && v7 != 0) {
      BOOL v6 = 0;
    }
    uint64_t v11 = v9 & !v6;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __78___UIActiveViewServiceSessionTracker__removeViewServiceSessionActivityRecord___block_invoke(uint64_t a1)
{
  -[_UIEvaluatedObjectCache removeObject:](*(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    objc_storeWeak((id *)(v2 + 24), 0);
  }
}

void __117___UIActiveViewServiceSessionTracker_handleViewServiceActivity_inHostedWindow_fromProvider_forSessionActivityRecord___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2) {
      objc_storeWeak((id *)(v2 + 24), *(id *)(a1 + 48));
    }
  }
  uint64_t v3 = -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 56));
  [v3 containsObject:*(void *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 80) && !*(unsigned char *)(a1 + 81))
  {
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 40);
    -[_UIEvaluatedObjectCache demoteObject:](v6, v7);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 40);
    -[_UIEvaluatedObjectCache promoteObject:](v4, v5);
  }
}

void __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  uint64_t v2 = (void *)a1[2].i64[0];
  uint64_t v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  int8x16_t v5 = a1[2];
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 appendBodySectionWithName:@"sortedActivityRecordsByIdiom" multilinePrefix:v3 block:v6];
}

void __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        int8x16_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v7];
        int v9 = (void *)v8;
        if (v8 && [*(id *)(v8 + 24) count])
        {
          uint64_t v10 = [v7 integerValue];
          uint64_t v11 = *(void **)(a1 + 40);
          v12 = _NSStringFromUIUserInterfaceIdiom(v10);
          v13 = [*(id *)(a1 + 40) activeMultilinePrefix];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke_3;
          v14[3] = &unk_1E52D9F98;
          id v15 = v9;
          id v16 = *(id *)(a1 + 40);
          [v11 appendBodySectionWithName:v12 multilinePrefix:v13 block:v14];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

void __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 32));
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), 0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

@end