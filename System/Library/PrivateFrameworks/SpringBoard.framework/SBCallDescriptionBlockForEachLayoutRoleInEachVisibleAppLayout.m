@interface SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout
@end

@implementation SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout

void ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout_block_invoke_2;
    v8[3] = &unk_1E6B0CBC0;
    id v9 = v5;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    long long v7 = *(_OWORD *)(a1 + 64);
    id v6 = (id)v7;
    long long v13 = v7;
    id v12 = *(id *)(a1 + 56);
    uint64_t v14 = a3;
    SBLayoutRoleEnumerateValidRoles(v8);
  }
}

void ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = a2;
  uint64_t v3 = a1 + 32;
  v4 = [*(id *)(a1 + 32) itemForLayoutRole:a2];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:*(void *)(a1 + 40)];
    [v5 setTarget:*(void *)(a1 + 48)];
    [v5 setSelector:*(void *)(a1 + 72)];
    [v5 setArgument:&v13 atIndex:2];
    [v5 setArgument:v3 atIndex:3];
    [v5 invoke];
    id v6 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

    long long v7 = *(void **)(a1 + 56);
    v8 = NSString;
    uint64_t v9 = *(void *)(a1 + 80);
    id v10 = [*(id *)(a1 + 32) succinctDescription];
    id v11 = SBLayoutRoleDescription(v13);
    id v12 = [v8 stringWithFormat:@"%lu %@, role: %@ --> %@", v9, v10, v11, v6];
    [v7 addObject:v12];
  }
}

@end