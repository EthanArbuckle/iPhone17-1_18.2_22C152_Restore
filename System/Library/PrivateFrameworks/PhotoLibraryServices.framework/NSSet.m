@interface NSSet
@end

@implementation NSSet

id __39__NSSet_PhotoLibraryServices___pl_map___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allObjects];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = objc_msgSend(v2, "_pl_map:", *(void *)(a1 + 40));
  v5 = [v3 setWithArray:v4];

  return v5;
}

uint64_t __51__NSSet_PLAdditions__pl_countOfObjectsPassingTest___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

id __63__NSSet_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allObjects];
  v3 = [v2 objectAtIndexedSubscript:0];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [v2 sortedArrayUsingSelector:sel_compare_];

    v2 = (void *)v5;
  }
  v6 = [MEMORY[0x1E4F28E78] string];
  v7 = PLIndentToString();
  [v6 appendFormat:@"<%@: %p> count=%lu [", objc_opt_class(), *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "count")];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__NSSet_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2;
  v13[3] = &unk_1E5870F10;
  uint64_t v16 = *(void *)(a1 + 40);
  id v8 = v6;
  id v14 = v8;
  v15 = v7;
  id v9 = v7;
  [v2 enumerateObjectsUsingBlock:v13];
  [v8 appendFormat:@"\n%@]", v9];
  v10 = v15;
  id v11 = v8;

  return v11;
}

void __63__NSSet_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_pl_prettyDescriptionWithIndent:", *(void *)(a1 + 48) + 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) appendFormat:@"\n%@%@%@", *(void *)(a1 + 40), *MEMORY[0x1E4F8C4B8], v3];
}

uint64_t __42__NSSet_PhotoLibraryServices___pl_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end