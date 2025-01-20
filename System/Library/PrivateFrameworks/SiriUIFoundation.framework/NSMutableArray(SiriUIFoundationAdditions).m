@interface NSMutableArray(SiriUIFoundationAdditions)
- (uint64_t)sruif_isValidIndexSetToInsert:()SiriUIFoundationAdditions;
@end

@implementation NSMutableArray(SiriUIFoundationAdditions)

- (uint64_t)sruif_isValidIndexSetToInsert:()SiriUIFoundationAdditions
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v9 = [a1 count];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__NSMutableArray_SiriUIFoundationAdditions__sruif_isValidIndexSetToInsert___block_invoke;
  v7[3] = &unk_264785D58;
  v7[4] = v8;
  v7[5] = &v10;
  [v4 enumerateIndexesUsingBlock:v7];
  uint64_t v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);

  return v5;
}

@end