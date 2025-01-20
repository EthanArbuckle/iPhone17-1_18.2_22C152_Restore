@interface UIGestureEnvironmentUpdateGestureGraph
@end

@implementation UIGestureEnvironmentUpdateGestureGraph

void ___UIGestureEnvironmentUpdateGestureGraph_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("GestureEnvironment", &kUIGestureRecognizerUpdateInfo_block_invoke___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v20 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      v22 = [a2 valueForKeyPath:@"_briefDescription"];
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "resetting gesture subgraph %@", buf, 0xCu);
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = a2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
        v11 = -[UIGestureEnvironment _nodeForGestureRecognizer:](*(id **)(a1 + 32), v10);
        [v11 removePropertyForKey:@"updateInfo"];
        v12 = *(void **)(a1 + 40);
        v13 = [v11 edgesForLabel:@"dynamicFailureRequirement"];
        [v12 removeEdges:v13];

        -[UIGestureEnvironment _clearGestureNeedsUpdate:](*(void *)(a1 + 32), v10);
        uint64_t v14 = *(void *)(a1 + 32);
        if (v14)
        {
          if (!v10)
          {
            v18 = [MEMORY[0x1E4F28B00] currentHandler];
            [v18 handleFailureInMethod:sel__clearGestureBlockedFromReset_, v14, @"UIGestureEnvironment.m", 1031, @"Invalid parameter not satisfying: %@", @"gestureRecognizer" object file lineNumber description];

LABEL_25:
            int v15 = 1;
            goto LABEL_13;
          }
          if ((*(unsigned char *)(v10 + 16) & 0x10) != 0) {
            [*(id *)(v14 + 48) removeObject:v10];
          }
        }
        else if (!v10)
        {
          goto LABEL_25;
        }
        if ((*(void *)(v10 + 8) & 0x200000000) != 0)
        {
          uint64_t v16 = *(void *)(a1 + 32);
          if (v16) {
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        int v15 = 0;
LABEL_13:
        if (![(id)v10 state]) {
          goto LABEL_20;
        }
        uint64_t v16 = *(void *)(a1 + 32);
        if (v16)
        {
          if (v15)
          {
            v17 = [MEMORY[0x1E4F28B00] currentHandler];
            [v17 handleFailureInMethod:sel__clearGestureIsDirty_, v16, @"UIGestureEnvironment.m", 1026, @"Invalid parameter not satisfying: %@", @"gestureRecognizer" object file lineNumber description];
          }
LABEL_18:
          [*(id *)(v16 + 40) removeObject:v10];
        }
LABEL_19:
        [(id)v10 _resetGestureRecognizer];
LABEL_20:
        if ([*(id *)(a1 + 48) containsObject:v10]) {
          -[UIGestureEnvironment _removeNodeFromGestureGraph:](*(id **)(a1 + 32), v11);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v19 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v7 = v19;
    }
    while (v19);
  }
}

@end