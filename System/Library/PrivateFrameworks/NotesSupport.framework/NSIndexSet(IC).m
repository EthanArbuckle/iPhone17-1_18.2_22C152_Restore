@interface NSIndexSet(IC)
- (id)ic_rangeArray;
@end

@implementation NSIndexSet(IC)

- (id)ic_rangeArray
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__NSIndexSet_IC__ic_rangeArray__block_invoke;
  v6[3] = &unk_2640CE120;
  id v7 = v2;
  id v3 = v2;
  [a1 enumerateRangesUsingBlock:v6];
  v4 = (void *)[v3 copy];

  return v4;
}

@end