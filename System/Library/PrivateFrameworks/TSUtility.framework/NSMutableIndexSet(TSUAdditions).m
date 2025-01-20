@interface NSMutableIndexSet(TSUAdditions)
- (void)tsu_intersectionWithIndexSet:()TSUAdditions;
- (void)tsu_moveIndexesInRange:()TSUAdditions toOffset:;
@end

@implementation NSMutableIndexSet(TSUAdditions)

- (void)tsu_moveIndexesInRange:()TSUAdditions toOffset:
{
  if (a5 < a3 || a5 - a3 >= a4)
  {
    unint64_t v9 = a3 + a4;
    if (a3 + a4 != a5 && [a1 firstIndex] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9 >= a5) {
        unint64_t v10 = 0;
      }
      else {
        unint64_t v10 = a4;
      }
      uint64_t v11 = a5 - v10;
      id v12 = objc_alloc_init(MEMORY[0x263F089C8]);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __67__NSMutableIndexSet_TSUAdditions__tsu_moveIndexesInRange_toOffset___block_invoke;
      v13[3] = &unk_26462A430;
      v13[4] = v12;
      v13[5] = a3;
      v13[6] = a4;
      v13[7] = v11;
      objc_msgSend(a1, "enumerateRangesInRange:options:usingBlock:", a3, a4, 0, v13);
      [a1 shiftIndexesStartingAtIndex:a3 + a4 by:-(uint64_t)a4];
      [a1 shiftIndexesStartingAtIndex:v11 by:a4];
      [a1 addIndexes:v12];
    }
  }
}

- (void)tsu_intersectionWithIndexSet:()TSUAdditions
{
  id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F089C8]), "initWithIndexesInRange:", objc_msgSend(a1, "firstIndex"), objc_msgSend(a1, "lastIndex") - objc_msgSend(a1, "firstIndex") + 1);
  [v5 removeIndexes:a3];
  [a1 removeIndexes:v5];
}

@end