@interface NSIndexSet(SCRCIndexSetExtras)
- (uint64_t)firstIndexCommonWithIndexSet:()SCRCIndexSetExtras;
@end

@implementation NSIndexSet(SCRCIndexSetExtras)

- (uint64_t)firstIndexCommonWithIndexSet:()SCRCIndexSetExtras
{
  id v4 = a3;
  unint64_t v5 = [a1 count];
  unint64_t v6 = [v4 count];
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 && v6)
  {
    if (v5 >= v6) {
      v8 = a1;
    }
    else {
      v8 = v4;
    }
    if (v5 >= v6) {
      v9 = v4;
    }
    else {
      v9 = a1;
    }
    id v10 = v8;
    id v11 = v9;
    uint64_t v12 = [v11 firstIndex];
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = v12;
      while (([v10 containsIndex:v7] & 1) == 0)
      {
        uint64_t v7 = [v11 indexGreaterThanIndex:v7];
        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
          break;
        }
      }
    }
  }
  return v7;
}

@end