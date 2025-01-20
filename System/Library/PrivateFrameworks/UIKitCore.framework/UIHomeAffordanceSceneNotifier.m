@interface UIHomeAffordanceSceneNotifier
@end

@implementation UIHomeAffordanceSceneNotifier

id __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_4(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(a1 + 40) withName:@"observationRecord"];
}

id __48___UIHomeAffordanceSceneNotifier_initWithScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained debugDescription];

  return v2;
}

id __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) >> 1) & 1 withName:@"expectsLegacyViewServiceObservers"];
  uint64_t v3 = *(void *)(a1 + 40);
  if ((*(unsigned char *)(v3 + 8) & 2) == 0)
  {
    id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", @"homeAffordanceSceneReferenceFrame", *(double *)(v3 + 72), *(double *)(v3 + 80), *(double *)(v3 + 88), *(double *)(v3 + 96));
    uint64_t v3 = *(void *)(a1 + 40);
  }
  uint64_t v5 = [*(id *)(v3 + 40) count];
  v6 = *(void **)(a1 + 32);
  if (!v5) {
    return (id)[v6 appendObject:0 withName:@"observers"];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_3;
  v8[3] = &unk_1E52D9F98;
  v8[4] = *(void *)(a1 + 40);
  v8[5] = v6;
  return (id)[v6 appendBodySectionWithName:@"observers" block:v8];
}

uint64_t __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasSuccinctStyle];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = a1 + 40;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) hasDebugStyle];
    if (result) {
      return result;
    }
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v4 = a1 + 40;
    id v7 = (id)[*(id *)(v4 - 8) appendBool:(*(unsigned __int8 *)(v6 + 8) >> 1) & 1 withName:@"expectsLegacyViewServiceObservers"];
    uint64_t v3 = *(void **)(v4 - 8);
  }
  return (uint64_t)(id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)v4 + 40), "count"), @"observers.count");
}

void __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 40);
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
        id v7 = *(void **)(a1 + 40);
        if (v6 && (id v8 = objc_loadWeakRetained((id *)(v6 + 8))) != 0)
        {
          v9 = v8;
          v10 = NSString;
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
        v15[2] = __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_4;
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

uint64_t __94___UIHomeAffordanceSceneNotifier__viewServiceWindow_didAssociateWithLegacyViewServiceSession___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 16));
    if (WeakRetained != *(id *)(a1 + 32))
    {
LABEL_3:
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    uint64_t v6 = *(void **)(a2 + 24);
  }
  else
  {
    id WeakRetained = 0;
    if (*(void *)(a1 + 32)) {
      goto LABEL_3;
    }
    uint64_t v6 = 0;
  }
  id v7 = v6;
  id v8 = *(void **)(a1 + 40);
  id v9 = v7;
  id v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
    if (v9 && v10) {
      uint64_t v5 = [v9 isEqual:v10];
    }
  }

LABEL_11:
  return v5;
}

uint64_t __97___UIHomeAffordanceSceneNotifier__viewServiceWindow_didDisassociateFromLegacyViewServiceSession___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 16));
    if (WeakRetained != *(id *)(a1 + 32))
    {
LABEL_3:
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    uint64_t v6 = *(void **)(a2 + 24);
  }
  else
  {
    id WeakRetained = 0;
    if (*(void *)(a1 + 32)) {
      goto LABEL_3;
    }
    uint64_t v6 = 0;
  }
  id v7 = v6;
  id v8 = *(void **)(a1 + 40);
  id v9 = v7;
  id v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
    if (v9 && v10) {
      uint64_t v5 = [v9 isEqual:v10];
    }
  }

LABEL_11:
  return v5;
}

uint64_t __94___UIHomeAffordanceSceneNotifier__homeAffordanceLegacyViewServiceUpdateSource_frameDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void **)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    if (v6 && v7) {
      uint64_t v9 = [v6 isEqual:v7];
    }
  }

  return v9;
}

uint64_t __106___UIHomeAffordanceSceneNotifier__homeAffordanceLegacyViewServiceUpdateSource_doubleTapGestureDidSucceed___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void **)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    if (v6 && v7) {
      uint64_t v9 = [v6 isEqual:v7];
    }
  }

  return v9;
}

@end