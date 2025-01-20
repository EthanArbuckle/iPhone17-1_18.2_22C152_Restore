@interface UITraitCollectionInlinePointerSetForTraitEnvironment
@end

@implementation UITraitCollectionInlinePointerSetForTraitEnvironment

void ___UITraitCollectionInlinePointerSetForTraitEnvironment_block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!_UIInlinePointerSetContainsElement((uint64_t *)v3, a2))
  {
    uint64_t v4 = *(void *)v3;
    if (*(void *)v3 > 0xCuLL)
    {
      v5 = *(NSHashTable **)(v3 + 16);
      if (!v5)
      {
        *(void *)(v3 + 16) = __UIInlinePointerSetCreateHashTableWithCapacity(26);
        v6 = (const void **)(v3 + 24);
        do
        {
          v7 = *v6++;
          NSHashInsert(*(NSHashTable **)(v3 + 16), v7);
          --v4;
        }
        while (v4);
        v5 = *(NSHashTable **)(v3 + 16);
      }
      NSHashInsert(v5, (const void *)a2);
      uint64_t v4 = *(void *)v3;
    }
    else
    {
      *(void *)(v3 + 8 * v4 + 24) = a2;
    }
    uint64_t v8 = (1 << (a2 >> 4)) | (1 << (a2 >> 10)) | (1 << SBYTE2(a2)) | *(void *)(v3 + 8);
    *(void *)uint64_t v3 = v4 + 1;
    *(void *)(v3 + 8) = v8;
  }
}

@end