@interface UICollectionViewDataAttributesMap
@end

@implementation UICollectionViewDataAttributesMap

void __59___UICollectionViewDataAttributesMap_indexesOfItemsInRect___block_invoke(uint64_t *a1, uint64_t *a2, __n128 a3)
{
  uint64_t v3 = *a2;
  if (*a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = *(void *)(a1[5] + 8);
    uint64_t v6 = *(void *)(v5 + 24);
    if (v6 == v3)
    {
      *(void *)(v5 + 24) = v3 + 1;
    }
    else
    {
      uint64_t v7 = *(void *)(a1[6] + 8);
      unint64_t v8 = *(void *)(v7 + 24);
      if (v8 == v3 + 1)
      {
        *(void *)(v7 + 24) = v3;
      }
      else
      {
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[_UIMutableFastIndexSet addIndexesInRange:](a1[4], v8, v6 - v8, a3);
          uint64_t v7 = *(void *)(a1[6] + 8);
        }
        *(void *)(v7 + 24) = v3;
        *(void *)(*(void *)(a1[5] + 8) + 24) = v3 + 1;
      }
    }
  }
}

@end