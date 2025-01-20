@interface NSIndexSet(FCAdditions)
- (BOOL)fc_isContiguous;
- (id)fc_indexSetWithGapsInRange:()FCAdditions;
- (uint64_t)fc_countOfContiguousIndexesGreaterThanOrEqualToIndex:()FCAdditions;
- (uint64_t)fc_countOfContiguousIndexesLessThanIndex:()FCAdditions;
- (uint64_t)fc_enclosingRange;
- (void)fc_enumerateGapsInRange:()FCAdditions usingBlock:;
@end

@implementation NSIndexSet(FCAdditions)

- (uint64_t)fc_countOfContiguousIndexesGreaterThanOrEqualToIndex:()FCAdditions
{
  uint64_t v5 = 0;
  if (objc_msgSend(a1, "containsIndex:"))
  {
    uint64_t v6 = a3 + 1;
    do
      uint64_t v7 = v6 + v5++;
    while (([a1 containsIndex:v7] & 1) != 0);
  }
  return v5;
}

- (uint64_t)fc_countOfContiguousIndexesLessThanIndex:()FCAdditions
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = 1;
  do
    char v6 = [a1 containsIndex:a3 + v5-- - 2];
  while ((v6 & 1) != 0);
  return -v5;
}

- (uint64_t)fc_enclosingRange
{
  if ([a1 firstIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = [a1 firstIndex];
  }
  if ([a1 lastIndex] != 0x7FFFFFFFFFFFFFFFLL) {
    [a1 lastIndex];
  }
  return v2;
}

- (BOOL)fc_isContiguous
{
  unint64_t v2 = [a1 firstIndex];
  do
  {
    unint64_t v3 = v2;
    if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    unint64_t v2 = [a1 indexGreaterThanIndex:v2];
  }
  while (v2 == 0x7FFFFFFFFFFFFFFFLL || v2 <= v3 + 1);
  return v3 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)fc_indexSetWithGapsInRange:()FCAdditions
{
  uint64_t v7 = [MEMORY[0x1E4F28E60] indexSet];
  if (a3 < a3 + a4)
  {
    do
    {
      if (([a1 containsIndex:a3] & 1) == 0) {
        [v7 addIndex:a3];
      }
      ++a3;
      --a4;
    }
    while (a4);
  }
  return v7;
}

- (void)fc_enumerateGapsInRange:()FCAdditions usingBlock:
{
  id v8 = a5;
  objc_msgSend(a1, "fc_indexSetWithGapsInRange:", a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 enumerateRangesUsingBlock:v8];
}

@end