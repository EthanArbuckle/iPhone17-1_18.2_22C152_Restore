@interface UIPhysicalButtonInteraction
@end

@implementation UIPhysicalButtonInteraction

void __61___UIPhysicalButtonInteraction__geometryChanged_forAncestor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
}

void __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52DC3D0;
  int8x16_t v5 = a1[2];
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  __int8 v8 = a1[3].i8[0];
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 72) length]) {
    [*(id *)(a1 + 40) appendString:*(void *)(*(void *)(a1 + 32) + 72) withName:@"name"];
  }
  id v2 = (id)[*(id *)(a1 + 40) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 36) withName:@"enabled"];
  v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 80);
  if (*(unsigned char *)(a1 + 48)) {
    id v5 = (id)[v3 appendObject:v4 withName:@"registrationToken"];
  }
  else {
    id v6 = (id)[v3 appendBool:v4 != 0 withName:@"hasRegistered"];
  }
  id v7 = (id)[*(id *)(a1 + 40) appendBool:*(unsigned char *)(*(void *)(a1 + 32) + 32) & 1 withName:@"registrationPendingDidMoveToWindow"];
  id v8 = (id)[*(id *)(a1 + 40) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 32) + 32) >> 1) & 1 withName:@"registrationPendingWindowMoveToScene"];
  id v9 = (id)[*(id *)(a1 + 40) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 32) + 32) >> 2) & 1 withName:@"wantsRelaxedVisibilityRequirement" ifEqualTo:1];
  id v10 = (id)[*(id *)(a1 + 40) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 32) + 32) >> 3) & 1 withName:@"wantsSystemShellExclusivePriority" ifEqualTo:1];
  if (*(unsigned char *)(a1 + 48))
  {
    id v11 = (id)[*(id *)(a1 + 40) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 32) + 32) >> 4) & 1 withName:@"hasExclusiveBehaviorConfiguration"];
    id v12 = (id)[*(id *)(a1 + 40) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 32) + 32) >> 5) & 1 withName:@"isWithinSceneBounds"];
  }
  id v13 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 48) withName:@"configurations"];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 24) count];
    v15 = *(void **)(a1 + 40);
    if (v14)
    {
      v16 = [*(id *)(a1 + 40) activeMultilinePrefix];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_3;
      v23[3] = &unk_1E52D9F98;
      v17 = *(void **)(a1 + 40);
      v23[4] = *(void *)(a1 + 32);
      id v24 = v17;
      [v15 appendBodySectionWithName:@"activeActions" multilinePrefix:v16 block:v23];
    }
    else
    {
      id v22 = (id)[*(id *)(a1 + 40) appendObject:0 withName:@"activeActions"];
    }
  }
  else
  {
    v18 = *(void **)(a1 + 40);
    v19 = _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(*(void **)(*(void *)(a1 + 32) + 48));
    id v20 = (id)[v18 appendObject:v19 withName:@"configurations"];

    id v21 = (id)objc_msgSend(*(id *)(a1 + 40), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "count"), @"activeActions");
  }
}

void __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
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