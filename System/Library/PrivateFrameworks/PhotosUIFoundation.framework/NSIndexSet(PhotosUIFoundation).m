@interface NSIndexSet(PhotosUIFoundation)
- (BOOL)px_isSingleRangeWithMax:()PhotosUIFoundation;
- (id)px_indexSetAdjustedForDeletions:()PhotosUIFoundation;
- (id)px_indexSetAdjustedForInsertions:()PhotosUIFoundation;
- (id)px_intersectionWithIndexSet:()PhotosUIFoundation;
- (id)px_map:()PhotosUIFoundation;
- (id)px_shortDescription;
- (uint64_t)px_coveringRange;
- (uint64_t)px_indexAtPosition:()PhotosUIFoundation;
- (uint64_t)px_intersectsWithIndexSet:()PhotosUIFoundation;
- (void)px_enumerateMap:()PhotosUIFoundation usingBlock:;
@end

@implementation NSIndexSet(PhotosUIFoundation)

- (id)px_intersectionWithIndexSet:()PhotosUIFoundation
{
  id v4 = a3;
  if ([a1 count] && objc_msgSend(v4, "count"))
  {
    v5 = (void *)[a1 mutableCopy];
    v6 = (void *)[v4 mutableCopy];
    [v5 removeIndexes:v6];
    [v6 removeIndexes:a1];
    [v5 addIndexes:v6];
    v7 = (void *)[a1 mutableCopy];
    [v7 addIndexes:v4];
    [v7 removeIndexes:v5];
    v8 = (void *)[v7 copy];
  }
  else
  {
    v8 = [MEMORY[0x263F088D0] indexSet];
  }

  return v8;
}

- (uint64_t)px_coveringRange
{
  uint64_t v2 = [a1 firstIndex];
  if (((v2 != 0x7FFFFFFFFFFFFFFFLL) & ([a1 lastIndex] != 0x7FFFFFFFFFFFFFFFLL)) != 0) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)px_indexSetAdjustedForInsertions:()PhotosUIFoundation
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)[a1 mutableCopy];
    objc_msgSend(v5, "px_adjustIndexesForInsertions:", v4);
  }
  else
  {
    v5 = (void *)[a1 copy];
  }

  return v5;
}

- (id)px_indexSetAdjustedForDeletions:()PhotosUIFoundation
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)[a1 mutableCopy];
    objc_msgSend(v5, "px_adjustIndexesForDeletions:", v4);
  }
  else
  {
    v5 = (void *)[a1 copy];
  }

  return v5;
}

- (BOOL)px_isSingleRangeWithMax:()PhotosUIFoundation
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3010000000;
  v11 = &unk_259D809E3;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__NSIndexSet_PhotosUIFoundation__px_isSingleRangeWithMax___block_invoke;
  v7[3] = &unk_26545B4E8;
  v7[4] = &v8;
  [a1 enumerateRangesUsingBlock:v7];
  uint64_t v4 = v9[5];
  if (v4) {
    BOOL v5 = v9[4] + v4 == a3;
  }
  else {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)px_enumerateMap:()PhotosUIFoundation usingBlock:
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__NSIndexSet_PhotosUIFoundation__px_enumerateMap_usingBlock___block_invoke;
  v11[3] = &unk_26545B4C0;
  v11[4] = a1;
  id v12 = v7;
  id v13 = v8;
  uint64_t v14 = a2;
  id v9 = v8;
  id v10 = v7;
  [a1 enumerateRangesUsingBlock:v11];
}

- (id)px_map:()PhotosUIFoundation
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F089C8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__NSIndexSet_PhotosUIFoundation__px_map___block_invoke;
  v10[3] = &unk_26545B470;
  id v11 = v6;
  id v7 = v6;
  objc_msgSend(a1, "px_enumerateMap:usingBlock:", v5, v10);

  id v8 = (void *)[v7 copy];

  return v8;
}

- (uint64_t)px_intersectsWithIndexSet:()PhotosUIFoundation
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__NSIndexSet_PhotosUIFoundation__px_intersectsWithIndexSet___block_invoke;
  v7[3] = &unk_26545B498;
  v7[4] = a1;
  void v7[5] = &v8;
  [v4 enumerateRangesUsingBlock:v7];
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (uint64_t)px_indexAtPosition:()PhotosUIFoundation
{
  for (uint64_t i = [a1 firstIndex]; a3; --a3)
    uint64_t i = [a1 indexGreaterThanIndex:i];
  return i;
}

- (id)px_shortDescription
{
  uint64_t v2 = (void *)MEMORY[0x25A2EA3A0]();
  v3 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __53__NSIndexSet_PhotosUIFoundation__px_shortDescription__block_invoke;
  char v11 = &unk_26545B470;
  id v12 = v3;
  id v4 = v3;
  [a1 enumerateRangesUsingBlock:&v8];
  uint64_t v5 = [v4 componentsJoinedByString:@", "];
  id v6 = [NSString stringWithFormat:@"[%@]", v5, v8, v9, v10, v11];

  return v6;
}

@end