@interface UITraitChangeRegistry
@end

@implementation UITraitChangeRegistry

void __90___UITraitChangeRegistry_traitsDidChange_forTraitEnvironment_withPreviousTraitCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  v5 = [v3 objectForKey:v4];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        __UIInlinePointerSetInsertElement(*(uint64_t **)(a1 + 40), *(void *)(*((void *)&v10 + 1) + 8 * v9++), 1);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __103___UITraitChangeRegistry__performTraitChangeCallbacks_forTraitEnvironment_withPreviousTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  long long v11 = v3;
  if (v3)
  {
    id v4 = v3[2];
    if (v4)
    {
      v5 = v4;
      (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 32), *(void *)(a1 + 40));
      goto LABEL_15;
    }
    if (*((unsigned char *)v11 + 8)) {
      id WeakRetained = *(id *)(a1 + 32);
    }
    else {
      id WeakRetained = objc_loadWeakRetained(v11 + 3);
    }
    uint64_t v7 = WeakRetained;
    if (WeakRetained)
    {
      if (v11[4]) {
        uint64_t v8 = (const char *)v11[4];
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      if (dyld_program_sdk_at_least()) {
        objc_msgSend(v7, v8, v10, v9);
      }
      else {
        objc_msgSend(v7, sel_performSelector_withObject_withObject_, v8, v10, v9);
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  v5 = 0;
LABEL_15:
}

void __108___UITraitChangeRegistry__performTrackedTraitInvalidations_forTraitEnvironment_withPreviousTraitCollection___block_invoke(uint64_t a1, const char *a2)
{
  id v4 = *(void **)(a1 + 32);
  if (dyld_program_sdk_at_least()) {
    [v4 a2];
  }
  else {
    objc_msgSend(v4, sel_performSelector_, a2);
  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    id v6 = NSString;
    NSStringFromSelector(a2);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 stringWithFormat:@"-%@", v8];
    [v5 addObject:v7];
  }
}

uint64_t __52___UITraitChangeRegistry_unregisterForTraitChanges___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:a2];
}

void __52___UITraitChangeRegistry_unregisterForTraitChanges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id pointer = a2;
  id v5 = a3;
  [v5 removeObject:*(void *)(a1 + 32)];
  if (![v5 count]) {
    __UIInlinePointerSetInsertElement(*(uint64_t **)(a1 + 40), (unint64_t)pointer, 0);
  }
}

void __99___UITraitChangeRegistry_recordTraitUsage_forTraitEnvironment_insideMethod_withInvalidationAction___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  CFNumberRef v4 = [NSNumber numberWithUnsignedInteger:a2];
  self;
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  _UIGetTraitMetadata(v4, 0, (uint64_t)&v5);
  id v3 = (id)v6;
  [v2 addObject:v3];
}

@end