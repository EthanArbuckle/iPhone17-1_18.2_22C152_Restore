@interface UIGestureEnvironmentSubgraphsBlockedFromResetDescription
@end

@implementation UIGestureEnvironmentSubgraphsBlockedFromResetDescription

void ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v27 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(uint64_t **)(*((void *)&v26 + 1) + 8 * j);
              if (-[UIGestureRecognizer _isActive](v12)) {
                [*(id *)(a1 + 40) addObject:v12];
              }
              if ([*(id *)(a1 + 48) containsObject:v12]) {
                [*(id *)(a1 + 56) addObject:v12];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v9);
        }

        v13 = (void *)[v7 mutableCopy];
        [v13 minusSet:*(void *)(a1 + 40)];
        [v13 minusSet:*(void *)(a1 + 56)];
        v14 = *(void **)(a1 + 64);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_2;
        v20[3] = &unk_1E52DAD48;
        id v15 = v14;
        id v21 = v15;
        id v22 = *(id *)(a1 + 40);
        id v16 = *(id *)(a1 + 56);
        uint64_t v17 = *(void *)(a1 + 72);
        id v24 = v13;
        uint64_t v25 = v17;
        id v23 = v16;
        id v18 = v13;
        [v15 appendBodySectionWithName:@"subgraph" block:v20];
        [*(id *)(a1 + 56) removeAllObjects];
        [*(id *)(a1 + 40) removeAllObjects];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v3);
  }
}

void ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)[*(id *)(a1 + 40) copy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_3;
  v13[3] = &unk_1E52F0E18;
  id v14 = *(id *)(a1 + 32);
  [v2 appendCollection:v3 withName:@"blockingSubgraphResetGestures" itemBlock:v13];

  uint64_t v4 = *(void **)(a1 + 32);
  v5 = (void *)[*(id *)(a1 + 48) copy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_4;
  v10[3] = &unk_1E52F0ED0;
  uint64_t v12 = *(void *)(a1 + 64);
  id v11 = *(id *)(a1 + 32);
  [v4 appendCollection:v5 withName:@"blockedFromResetGestures" itemBlock:v10];

  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_6;
  v8[3] = &unk_1E52F0E18;
  id v9 = v6;
  [v9 appendCollection:v7 withName:@"remainingGestures" itemBlock:v8];
}

void ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 _briefDescription];
  [v2 appendString:v3 withName:0];
}

void ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v4 = *(void *)(a2 + 216);
  }
  else {
    uint64_t v4 = 0;
  }
  double v5 = _UIMediaTimeForMachTime(*(void *)(a1 + 40) - v4);
  v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_5;
  v7[3] = &unk_1E52DA070;
  id v8 = v6;
  uint64_t v9 = a2;
  double v10 = v5;
  [v8 appendProem:a2 block:v7];
}

id ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = _UIGestureRecognizerStateString([*(id *)(a1 + 40) state]);
  [v2 appendString:v3 withName:@"state"];

  return (id)[*(id *)(a1 + 32) appendTimeInterval:@"timeFromEnqueuedReset" withName:0 decomposeUnits:*(double *)(a1 + 48)];
}

void ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 _briefDescription];
  [v2 appendString:v3 withName:0];
}

@end