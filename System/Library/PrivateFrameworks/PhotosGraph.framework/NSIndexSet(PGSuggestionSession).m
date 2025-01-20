@interface NSIndexSet(PGSuggestionSession)
- (uint64_t)pg_intersectsIndexSet:()PGSuggestionSession;
@end

@implementation NSIndexSet(PGSuggestionSession)

- (uint64_t)pg_intersectsIndexSet:()PGSuggestionSession
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__NSIndexSet_PGSuggestionSession__pg_intersectsIndexSet___block_invoke;
  v8[3] = &unk_1E68ECC38;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateIndexesUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end