@interface WBSPasswordImportCSVHeaderChecker
- (id)columnIndicesForHeaderFields:(id)a3;
@end

@implementation WBSPasswordImportCSVHeaderChecker

- (id)columnIndicesForHeaderFields:(id)a3
{
  id v3 = a3;
  if (columnIndicesForHeaderFields__onceToken != -1) {
    dispatch_once(&columnIndicesForHeaderFields__onceToken, &__block_literal_global_90);
  }
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__WBSPasswordImportCSVHeaderChecker_columnIndicesForHeaderFields___block_invoke_2;
  v11[3] = &unk_1E5C9E820;
  v11[4] = &v32;
  v11[5] = &v28;
  v11[6] = &v24;
  v11[7] = &v20;
  v11[8] = &v16;
  v11[9] = &v12;
  [v3 enumerateObjectsUsingBlock:v11];
  if (v33[3] == 0x7FFFFFFFFFFFFFFFLL || v29[3] == 0x7FFFFFFFFFFFFFFFLL || v25[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = [NSNumber numberWithUnsignedInteger:v21[3]];
    [v6 setObject:v7 forKeyedSubscript:@"otpAuthURLIndex"];

    v8 = [NSNumber numberWithUnsignedInteger:v17[3]];
    [v6 setObject:v8 forKeyedSubscript:@"notesEntryIndex"];

    v9 = [NSNumber numberWithUnsignedInteger:v13[3]];
    [v6 setObject:v9 forKeyedSubscript:@"titleIndex"];

    v10 = [WBSPasswordImportCSVColumnIndices alloc];
    v4 = [(WBSPasswordImportCSVColumnIndices *)v10 initWithURLIndex:v33[3] usernameIndex:v29[3] passwordIndex:v25[3] sidecarDataIndices:v6];
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v4;
}

void __66__WBSPasswordImportCSVHeaderChecker_columnIndicesForHeaderFields___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFC22220];
  v1 = (void *)columnIndicesForHeaderFields__urlKeywords;
  columnIndicesForHeaderFields__urlKeywords = v0;

  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFC22238];
  id v3 = (void *)columnIndicesForHeaderFields__usernameKeywords;
  columnIndicesForHeaderFields__usernameKeywords = v2;

  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFC22250];
  v5 = (void *)columnIndicesForHeaderFields__passwordKeywords;
  columnIndicesForHeaderFields__passwordKeywords = v4;

  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFC22268];
  v7 = (void *)columnIndicesForHeaderFields__otpAuthURLKeywords;
  columnIndicesForHeaderFields__otpAuthURLKeywords = v6;

  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFC22280];
  v9 = (void *)columnIndicesForHeaderFields__notesEntryKeywords;
  columnIndicesForHeaderFields__notesEntryKeywords = v8;

  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFC22298];
  v11 = (void *)columnIndicesForHeaderFields__titleKeywords;
  columnIndicesForHeaderFields__titleKeywords = v10;
}

void __66__WBSPasswordImportCSVHeaderChecker_columnIndicesForHeaderFields___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  v5 = [a2 lowercaseString];
  v13 = v5;
  if (*(void *)(*(void *)(a1[4] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v6 = [(id)columnIndicesForHeaderFields__urlKeywords containsObject:v5];
    v5 = v13;
    if (v6)
    {
      uint64_t v7 = a1[4];
LABEL_19:
      *(void *)(*(void *)(v7 + 8) + 24) = a3;
      goto LABEL_20;
    }
  }
  if (*(void *)(*(void *)(a1[5] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = [(id)columnIndicesForHeaderFields__usernameKeywords containsObject:v13];
    v5 = v13;
    if (v8)
    {
      uint64_t v7 = a1[5];
      goto LABEL_19;
    }
  }
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = [(id)columnIndicesForHeaderFields__passwordKeywords containsObject:v13];
    v5 = v13;
    if (v9)
    {
      uint64_t v7 = a1[6];
      goto LABEL_19;
    }
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v10 = [(id)columnIndicesForHeaderFields__otpAuthURLKeywords containsObject:v13];
    v5 = v13;
    if (v10)
    {
      uint64_t v7 = a1[7];
      goto LABEL_19;
    }
  }
  if (*(void *)(*(void *)(a1[8] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v11 = [(id)columnIndicesForHeaderFields__notesEntryKeywords containsObject:v13];
    v5 = v13;
    if (v11)
    {
      uint64_t v7 = a1[8];
      goto LABEL_19;
    }
  }
  if (*(void *)(*(void *)(a1[9] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v12 = [(id)columnIndicesForHeaderFields__titleKeywords containsObject:v13];
    v5 = v13;
    if (v12)
    {
      uint64_t v7 = a1[9];
      goto LABEL_19;
    }
  }
LABEL_20:
}

@end