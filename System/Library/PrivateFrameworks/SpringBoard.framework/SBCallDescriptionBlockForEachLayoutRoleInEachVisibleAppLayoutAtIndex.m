@interface SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex
@end

@implementation SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex

void ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex_block_invoke_2;
    v8[3] = &unk_1E6B0CBC0;
    id v9 = v5;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    uint64_t v14 = a3;
    long long v7 = *(_OWORD *)(a1 + 64);
    id v6 = (id)v7;
    long long v13 = v7;
    id v12 = *(id *)(a1 + 56);
    SBLayoutRoleEnumerateValidRoles(v8);
  }
}

void ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = a2;
  uint64_t v3 = a1 + 32;
  v4 = [*(id *)(a1 + 32) itemForLayoutRole:a2];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:*(void *)(a1 + 40)];
    [v5 setTarget:*(void *)(a1 + 48)];
    [v5 setSelector:*(void *)(a1 + 72)];
    [v5 setArgument:&v14 atIndex:2];
    [v5 setArgument:v3 atIndex:3];
    [v5 setArgument:a1 + 80 atIndex:4];
    [v5 invoke];
    id v6 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    long long v7 = objc_msgSend(v6, "sb_switcherModifierDebugTimelineDescription");

    v8 = *(void **)(a1 + 56);
    id v9 = NSString;
    uint64_t v10 = *(void *)(a1 + 80);
    id v11 = [*(id *)(a1 + 32) succinctDescription];
    id v12 = SBLayoutRoleDescription(v14);
    long long v13 = [v9 stringWithFormat:@"%lu %@, role: %@ --> %@", v10, v11, v12, v7];
    [v8 addObject:v13];
  }
}

@end