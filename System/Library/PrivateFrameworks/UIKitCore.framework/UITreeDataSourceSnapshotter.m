@interface UITreeDataSourceSnapshotter
@end

@implementation UITreeDataSourceSnapshotter

void __64___UITreeDataSourceSnapshotter_deleteIndexes_orphanDisposition___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) _nodeIndexForGlobalIndex:a2];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"_UITreeDataSourceSnapshotter.mm", 187, @"Invalid parameter not satisfying: %@", @"nodeIndex != NSNotFound" object file lineNumber description];
  }
  v5 = *(void **)(a1 + 32);
  v6 = (uint64_t *)(v5[1] + 24 * v4);
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  if (!v7)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"_UITreeDataSourceSnapshotter.mm", 190, @"Invalid parameter not satisfying: %@", @"range.length > 0" object file lineNumber description];

    uint64_t v9 = -1;
    goto LABEL_5;
  }
  uint64_t v9 = v7 - 1;
  if (v9)
  {
LABEL_5:
    uint64_t *v6 = v8;
    v6[1] = v9;
    --*(void *)(*(void *)(a1 + 32) + 32);
    return;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v24 = [v5 _deleteChildNodesForParentNodeIndex:v4];
    objc_msgSend(*(id *)(a1 + 40), "addIndexes:");
    *(void *)(*(void *)(a1 + 32) + 32) += ~[v24 count];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 16);
    uint64_t v12 = *(void *)(v10 + 8) + 24 * v4;
    uint64_t v13 = v11 - (v12 + 24);
    if (v11 != v12 + 24) {
      memmove((void *)v12, (const void *)(v12 + 24), v11 - (v12 + 24));
    }
    *(void *)(v10 + 16) = v12 + v13;
  }
  else if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v14 = [v5 childrenForParentAtIndex:a2 recursive:1];
    v15 = (void *)v14;
    v16 = *(void **)(a1 + 32);
    id v25 = (id)v14;
    if (v4 + 1 < (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16[2] - v16[1]) >> 3)))
    {
      uint64_t v17 = ~v4 - 0x5555555555555555 * ((uint64_t)(v16[2] - v16[1]) >> 3);
      uint64_t v18 = 24 * v4;
      do
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v14 = objc_msgSend(v15, "containsIndexesInRange:", *(void *)(v19 + v18 + 24), *(void *)(v19 + v18 + 32));
        v15 = v25;
        if (!v14) {
          break;
        }
        --*(void *)(v19 + v18 + 40);
        v18 += 24;
        --v17;
      }
      while (v17);
      v16 = *(void **)(a1 + 32);
    }
    --v16[4];
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void *)(v20 + 16);
    uint64_t v22 = *(void *)(v20 + 8) + 24 * v4;
    uint64_t v23 = v21 - (v22 + 24);
    if (v21 != v22 + 24) {
      uint64_t v14 = (uint64_t)memmove((void *)v22, (const void *)(v22 + 24), v21 - (v22 + 24));
    }
    *(void *)(v20 + 16) = v22 + v23;
    MEMORY[0x1F4181878](v14);
  }
}

void __67___UITreeDataSourceSnapshotter_childrenForParentAtIndex_recursive___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) childrenForParentAtIndex:a2 recursive:1];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addIndexes:");
}

uint64_t __87___UITreeDataSourceSnapshotter_snapshotterRepresentingSubtreeForIndex_includingParent___block_invoke()
{
  return 1;
}

uint64_t __80___UITreeDataSourceSnapshotter_replaceChildItemsFromSnapshotter_forParentIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addIndex:*(void *)(a1 + 40) + a2];
}

void *__68___UITreeDataSourceSnapshotter__deleteChildNodesForParentNodeIndex___block_invoke(void *result, uint64_t a2)
{
  *(void *)(*(void *)(result[5] + 8) + 24) += *(void *)(*(void *)(result[4] + 8) + 24 * a2 + 8);
  uint64_t v2 = result[4];
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 8) + 24 * a2;
  uint64_t v5 = v3 - (v4 + 24);
  if (v3 != v4 + 24) {
    result = memmove((void *)v4, (const void *)(v4 + 24), v3 - (v4 + 24));
  }
  *(void *)(v2 + 16) = v4 + v5;
  return result;
}

uint64_t __75___UITreeDataSourceSnapshotter__recomputeExpandedIndexesForDeletedIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  if (a2)
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "countOfIndexesInRange:", 0, a2);
    if (v6 >= 1) {
      uint64_t v4 = (v4 - v6) & ~((v4 - v6) >> 63);
    }
  }
  uint64_t v7 = *(void **)(a1 + 40);
  return objc_msgSend(v7, "addIndexesInRange:", v4, a3);
}

@end