@interface NSMutableIndexSet(Additions)
- (uint64_t)mf_intersectIndexes:()Additions;
@end

@implementation NSMutableIndexSet(Additions)

- (uint64_t)mf_intersectIndexes:()Additions
{
  v10[64] = *MEMORY[0x1E4F143B8];
  uint64_t result = [a1 count];
  if (result)
  {
    unint64_t v6 = [a1 firstIndex];
    unint64_t v7 = [a1 lastIndex];
    if ([a3 firstIndex] <= v7 && objc_msgSend(a3, "lastIndex") >= v6)
    {
      v9[0] = v6;
      v9[1] = v7 - v6 + 1;
      uint64_t result = [a1 getIndexes:v10 maxCount:64 inIndexRange:v9];
      if (result)
      {
        uint64_t v8 = result;
        while (1)
        {
          if (([a3 containsIndex:v10[--v8]] & 1) == 0) {
            [a1 removeIndex:v10[v8]];
          }
          if (!v8)
          {
            uint64_t result = [a1 getIndexes:v10 maxCount:64 inIndexRange:v9];
            uint64_t v8 = result;
            if (!result) {
              break;
            }
          }
        }
      }
    }
    else
    {
      return [a1 removeAllIndexes];
    }
  }
  return result;
}

@end