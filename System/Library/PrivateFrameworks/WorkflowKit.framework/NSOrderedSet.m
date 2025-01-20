@interface NSOrderedSet
@end

@implementation NSOrderedSet

uint64_t __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke(void **a1, void *a2)
{
  return WFIsDeleted(a2, a1[4], a1[5], a1[6]);
}

uint64_t __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_2(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

void __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  if ([v17 count])
  {
    unint64_t v6 = 0;
    while (1)
    {
      v7 = (void *)MEMORY[0x1C87CA430]();
      if (v6 < [v17 count])
      {
        v8 = v17;
        while (1)
        {
          uint64_t v9 = *(void *)(a1 + 48);
          v10 = [v8 objectAtIndex:v6];
          LODWORD(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

          if (!v9) {
            break;
          }
          BOOL v11 = ++v6 >= [v17 count];
          v8 = v17;
          if (v11) {
            goto LABEL_10;
          }
        }
      }
      v8 = v17;
LABEL_10:
      if (v6 == [v8 count]) {
        break;
      }
      v12 = [v17 objectAtIndex:v6];
      unint64_t v13 = v6 + 1;
      do
      {
        unint64_t v6 = v13;
        if (v13 >= [v17 count]) {
          break;
        }
        uint64_t v14 = *(void *)(a1 + 48);
        v15 = [v17 objectAtIndex:v6];
        LOBYTE(v14) = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v15);

        unint64_t v13 = v6 + 1;
      }
      while ((v14 & 1) != 0);
      if (v6 == [v17 count])
      {
        -[WFThreeWayMergingObjectGraph addStandaloneVertex:](*(void *)(a1 + 32), v12);

        break;
      }
      v16 = [v17 objectAtIndex:v6];
      if (WFOrderedSetContainsPath(*(void **)(a1 + 40), v12, v16, *(void **)(a1 + 56))
        && !WFOrderedSetContainsPath(v5, v12, v16, *(void **)(a1 + 56)))
      {
        -[WFThreeWayMergingObjectGraph addStandaloneVertex:](*(void *)(a1 + 32), v12);
        -[WFThreeWayMergingObjectGraph addStandaloneVertex:](*(void *)(a1 + 32), v16);
      }
      else
      {
        -[WFThreeWayMergingObjectGraph addEdgeFromVertex:toVertex:](*(void *)(a1 + 32), v12, v16);
      }

      if (v6 >= [v17 count]) {
        goto LABEL_23;
      }
    }
  }
LABEL_23:
}

void __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v52 = __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_5;
  v53 = &unk_1E65546C0;
  unint64_t v6 = *(void **)(a1 + 56);
  id v54 = *(id *)(a1 + 48);
  id v7 = v3;
  id v8 = v4;
  id v50 = v5;
  uint64_t v9 = v6;
  v10 = v51;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    v37 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFEnumerateConnectedComponentVertexes(NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSComparator  _Nonnull __strong, void (^ _Nonnull __strong)(id<NSObject>  _Nonnull __strong))");
    [v36 handleFailureInFunction:v37, @"NSOrderedSet+WFThreeWayMerging.m", 217, @"Invalid parameter not satisfying: %@", @"componentVertexes" file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v38 = [MEMORY[0x1E4F28B00] currentHandler];
  v39 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFEnumerateConnectedComponentVertexes(NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSComparator  _Nonnull __strong, void (^ _Nonnull __strong)(id<NSObject>  _Nonnull __strong))");
  [v38 handleFailureInFunction:v39, @"NSOrderedSet+WFThreeWayMerging.m", 218, @"Invalid parameter not satisfying: %@", @"firstOrderedSet" file lineNumber description];

LABEL_3:
  if (v50)
  {
    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    v41 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFEnumerateConnectedComponentVertexes(NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSComparator  _Nonnull __strong, void (^ _Nonnull __strong)(id<NSObject>  _Nonnull __strong))");
    [v40 handleFailureInFunction:v41, @"NSOrderedSet+WFThreeWayMerging.m", 219, @"Invalid parameter not satisfying: %@", @"secondOrderedSet" file lineNumber description];

    if (v9) {
      goto LABEL_5;
    }
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  v43 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFEnumerateConnectedComponentVertexes(NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSComparator  _Nonnull __strong, void (^ _Nonnull __strong)(id<NSObject>  _Nonnull __strong))");
  [v42 handleFailureInFunction:v43, @"NSOrderedSet+WFThreeWayMerging.m", 220, @"Invalid parameter not satisfying: %@", @"comparator" file lineNumber description];

LABEL_5:
  if ([v7 count] == 1)
  {
    BOOL v11 = [v7 firstObject];
    v52((uint64_t)v10, (uint64_t)v11);
  }
  else
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v59 count:16];
    id v46 = v7;
    if (v13)
    {
      uint64_t v14 = v13;
      id obj = v12;
      v48 = 0;
      v44 = v10;
      v45 = v9;
      v49 = 0;
      uint64_t v15 = *(void *)v56;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v56 != v15) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1C87CA430]();
          uint64_t v21 = [v8 indexOfObject:v19];
          if (v21 != 0x7FFFFFFFFFFFFFFFLL && v21 < v16)
          {
            uint64_t v23 = v21;
            id v24 = v19;

            v49 = v24;
            uint64_t v16 = v23;
          }
          uint64_t v25 = [v50 indexOfObject:v19];
          if (v25 != 0x7FFFFFFFFFFFFFFFLL && v25 < v17)
          {
            uint64_t v27 = v25;
            id v28 = v19;

            v48 = v28;
            uint64_t v17 = v27;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v14);
      id v12 = obj;

      if (v49 && v48)
      {
        uint64_t v9 = v45;
        if (v45[2](v45, v49, v48) == -1) {
          v29 = v49;
        }
        else {
          v29 = v48;
        }
      }
      else
      {
        if (v49) {
          v29 = v49;
        }
        else {
          v29 = v48;
        }
        uint64_t v9 = v45;
      }
      v10 = v44;
    }
    else
    {

      v29 = 0;
      v48 = 0;
      v49 = 0;
    }
    id v30 = v29;
    uint64_t v31 = [v12 indexOfObject:v30];
    uint64_t v32 = v31;
    do
    {
      v33 = (void *)MEMORY[0x1C87CA430]();
      [v12 objectAtIndexedSubscript:v32];
      v35 = v34 = v12;
      v52((uint64_t)v10, (uint64_t)v35);

      id v12 = v34;
      if (v32 + 1 == [v34 count]) {
        uint64_t v32 = 0;
      }
      else {
        ++v32;
      }
    }
    while (v32 != v31);

    id v7 = v46;
    BOOL v11 = v49;
  }
}

uint64_t __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end