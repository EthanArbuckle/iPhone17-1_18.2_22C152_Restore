@interface SPBucketSet
@end

@implementation SPBucketSet

CFIndex __22___SPBucketSet_decay___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 8));
  if (Count)
  {
    uint64_t v3 = Count;
    unint64_t v4 = *(void *)(a1 + 40);
    if (Count >= 3) {
      unint64_t v4 = (uint64_t)v4 / (Count - 1);
    }
    if (v4 <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v4;
    }
    size_t v6 = 8 * Count;
    v7 = (const void **)((char *)v13 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v7, 8 * Count);
    v8 = v7;
    bzero(v7, v6);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 8), v7, v7);
    if (v3 >= 1)
    {
      do
      {
        v9 = *(__CFDictionary **)(*(void *)(a1 + 32) + 8);
        v10 = *v7;
        v11 = (char *)*v8 - v5;
        *v8 = v11;
        if ((uint64_t)v11 < 0) {
          CFDictionaryRemoveValue(v9, v10);
        }
        else {
          CFDictionarySetValue(v9, v10, v11);
        }
        ++v7;
        ++v8;
        --v3;
      }
      while (v3);
    }
  }
  CFIndex result = CFDictionaryGetCount(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

const void *__28___SPBucketSet_valueForKey___block_invoke(uint64_t a1)
{
  CFIndex result = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

CFIndex __32___SPBucketSet_addValue_forKey___block_invoke(uint64_t a1)
{
  Value = (char *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 40), &Value[*(void *)(a1 + 48)]);
  CFIndex result = CFDictionaryGetCount(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

CFIndex __34___SPBucketSet_removeValueForKey___block_invoke(uint64_t a1)
{
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  CFIndex result = CFDictionaryGetCount(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

@end