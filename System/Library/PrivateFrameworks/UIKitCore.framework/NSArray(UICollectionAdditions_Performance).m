@interface NSArray(UICollectionAdditions_Performance)
- (id)_makeObjectsPerformSelector:()UICollectionAdditions_Performance object:range:;
@end

@implementation NSArray(UICollectionAdditions_Performance)

- (id)_makeObjectsPerformSelector:()UICollectionAdditions_Performance object:range:
{
  v15[128] = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    unint64_t v6 = a5;
    unint64_t v7 = a5 + a6;
    if (a5 < a5 + a6)
    {
      v10 = result;
      do
      {
        if (v7 - v6 >= 0x80) {
          uint64_t v11 = 128;
        }
        else {
          uint64_t v11 = v7 - v6;
        }
        result = (id)objc_msgSend(v10, "getObjects:range:", v15, v6, v11);
        if (v11)
        {
          v12 = (void **)v15;
          uint64_t v13 = v11;
          do
          {
            v14 = *v12;
            if (dyld_program_sdk_at_least()) {
              result = objc_msgSend(v14, a3, a4);
            }
            else {
              result = objc_msgSend(v14, sel_performSelector_withObject_, a3, a4);
            }
            ++v12;
            --v13;
          }
          while (v13);
        }
        v6 += v11;
      }
      while (v6 < v7);
    }
  }
  return result;
}

@end