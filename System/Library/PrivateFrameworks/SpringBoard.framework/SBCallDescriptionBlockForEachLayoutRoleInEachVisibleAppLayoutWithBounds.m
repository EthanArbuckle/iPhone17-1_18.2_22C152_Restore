@interface SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds
@end

@implementation SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds

void ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    [*(id *)(a1 + 40) frameForIndex:a3];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds_block_invoke_2;
    v16[3] = &unk_1E6B0CB98;
    id v17 = v5;
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 40);
    uint64_t v22 = v7;
    uint64_t v23 = v9;
    uint64_t v24 = v11;
    uint64_t v25 = v13;
    long long v15 = *(_OWORD *)(a1 + 64);
    id v14 = (id)v15;
    long long v21 = v15;
    id v20 = *(id *)(a1 + 56);
    uint64_t v26 = a3;
    SBLayoutRoleEnumerateValidRoles(v16);
  }
}

void ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = a2;
  uint64_t v3 = a1 + 32;
  v4 = [*(id *)(a1 + 32) itemForLayoutRole:a2];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:*(void *)(a1 + 40)];
    [v5 setTarget:*(void *)(a1 + 48)];
    [v5 setSelector:*(void *)(a1 + 72)];
    [v5 setArgument:&v15 atIndex:2];
    [v5 setArgument:v3 atIndex:3];
    [v5 setArgument:a1 + 80 atIndex:4];
    [v5 invoke];
    uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v7 = objc_msgSend(v6, "sb_switcherModifierDebugTimelineDescription");

    uint64_t v8 = *(void **)(a1 + 56);
    uint64_t v9 = NSString;
    uint64_t v10 = *(void *)(a1 + 112);
    uint64_t v11 = [*(id *)(a1 + 32) succinctDescription];
    uint64_t v12 = SBLayoutRoleDescription(v15);
    uint64_t v13 = NSStringFromCGRect(*(CGRect *)(a1 + 80));
    id v14 = [v9 stringWithFormat:@"%lu %@, role: %@, bounds: %@ --> %@", v10, v11, v12, v13, v7];
    [v8 addObject:v14];
  }
}

@end