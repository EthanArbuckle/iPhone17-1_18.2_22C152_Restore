@interface UIPencilEvent
@end

@implementation UIPencilEvent

void __38___UIPencilEvent_registerInteraction___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PencilInteraction", _unregisterInteraction_withRegistrationToken____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v9 = *(id *)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        if (v3)
        {
          v10 = NSString;
          id v11 = (id)v3;
          v12 = (objc_class *)objc_opt_class();
          v13 = NSStringFromClass(v12);
          v14 = [v10 stringWithFormat:@"<%@: %p>", v13, v11];
        }
        else
        {
          v14 = @"(nil)";
        }
        v15 = NSString;
        v16 = WeakRetained;
        v17 = v14;
        v18 = v14;
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        v21 = [v15 stringWithFormat:@"<%@: %p>", v20, v16];

        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unregistering interaction: %@; with event: %@",
          buf,
          0x16u);
      }
    }
    [WeakRetained[21] removeObject:v3];
    v5 = [(id)v3 view];
    v6 = [v5 _window];
    if (!v3
      || (*(char *)(v3 + 8) < 0
        ? (uint64_t v7 = *(void *)(v3 + 32))
        : (uint64_t v7 = [(id)v3 _dispatchBehavior], *(void *)(v3 + 32) = v7),
          v7 != 2))
    {
      v8 = [MEMORY[0x1E4F29238] valueWithPointer:v6];
      [WeakRetained[22] removeObject:v8];
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __61___UIPencilEvent__cancelAndRemoveInteractionFromDescriptors___block_invoke;
    v24 = &unk_1E5304118;
    uint64_t v25 = v3;
    -[_UIPencilEvent _cancelAndRemoveInteractionsInAllDeliveryRecordsFromFilter:]((uint64_t)WeakRetained, (uint64_t)buf);
  }
}

id __61___UIPencilEvent__cancelAndRemoveInteractionFromDescriptors___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 containsObject:*(void *)(a1 + 32)])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

id __63___UIPencilEvent__cancelAndRemoveAllDescriptorsAndInteractions__block_invoke(int a1, id a2)
{
  return a2;
}

uint64_t __89___UIPencilEvent__collectAllActiveInteractionsConstrainedToWindow_consultingInteraction___block_invoke(uint64_t a1, unsigned char *a2)
{
  return -[_UIPencilEvent _shouldCollectInteraction:consultingInteraction:constrainedToWindow:](*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 48), *(void **)(a1 + 40));
}

void __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 152);
  if (v3 > 4) {
    id v4 = @"(unknown)";
  }
  else {
    id v4 = off_1E5304188[v3];
  }
  [v2 appendString:v4 withName:@"phase"];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v6 = *(void *)(a1 + 40);
  if (has_internal_diagnostics)
  {
    id v16 = (id)[*(id *)(a1 + 32) appendFloat:@"normalizedForceVelocity" withName:1 decimalPrecision:*(double *)(v6 + 160)];
    uint64_t v6 = *(void *)(a1 + 40);
  }
  uint64_t v7 = [*(id *)(v6 + 168) count];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v7)
  {
    v9 = [*(id *)(a1 + 32) activeMultilinePrefix];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v21[3] = &unk_1E52D9F98;
    int8x16_t v17 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v17.i64[0];
    int8x16_t v22 = vextq_s8(v17, v17, 8uLL);
    [v8 appendBodySectionWithName:@"registeredInteractions" multilinePrefix:v9 block:v21];

    id v11 = *(void **)(a1 + 32);
    v12 = [v11 activeMultilinePrefix];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_4;
    v19[3] = &unk_1E52D9F98;
    int8x16_t v18 = *(int8x16_t *)(a1 + 32);
    id v13 = (id)v18.i64[0];
    int8x16_t v20 = vextq_s8(v18, v18, 8uLL);
    [v11 appendBodySectionWithName:@"fallbackInteractions" multilinePrefix:v12 block:v19];
  }
  else
  {
    id v14 = (id)[*(id *)(a1 + 32) appendObject:0 withName:@"registeredInteractions"];
    id v15 = (id)[*(id *)(a1 + 32) appendObject:0 withName:@"fallbackInteractions"];
  }
}

void __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 168);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "succinctDescription", (void)v10);
        id v9 = (id)[v7 appendObject:v8 withName:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 168);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        if (v7)
        {
          if (*(char *)(v7 + 8) < 0)
          {
            uint64_t v8 = *(void *)(v7 + 32);
          }
          else
          {
            uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v6), "_dispatchBehavior", (void)v12);
            *(void *)(v7 + 32) = v8;
          }
          if (v8 == 1)
          {
            id v9 = *(void **)(a1 + 40);
            long long v10 = [(id)v7 succinctDescription];
            id v11 = (id)[v9 appendObject:v10 withName:0];
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

id __50___UIPencilEvent__registerForStateCaptureIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained descriptionBuilderWithMultilinePrefix:&stru_1ED0E84C0];
  uint64_t v3 = [v2 build];

  return v3;
}

@end