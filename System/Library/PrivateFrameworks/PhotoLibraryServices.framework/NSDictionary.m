@interface NSDictionary
@end

@implementation NSDictionary

id __70__NSDictionary_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allKeys];
  v3 = [v2 objectAtIndexedSubscript:0];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [v2 sortedArrayUsingSelector:sel_compare_];

    v2 = (void *)v5;
  }
  v6 = [MEMORY[0x1E4F28E78] string];
  v7 = PLIndentToString();
  [v6 appendFormat:@"<%@: %p> count=%lu {", objc_opt_class(), *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "count")];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__NSDictionary_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2;
  v14[3] = &unk_1E58690A0;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  v14[4] = v8;
  id v9 = v6;
  id v15 = v9;
  v16 = v7;
  id v10 = v7;
  [v2 enumerateObjectsUsingBlock:v14];
  [v9 appendFormat:@"\n%@}", v10];
  v11 = v16;
  id v12 = v9;

  return v12;
}

void __70__NSDictionary_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 56) + 1;
  id v4 = a2;
  objc_msgSend(v4, "_pl_prettyDescriptionWithIndent:", v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [*(id *)(a1 + 32) objectForKey:v4];

  v6 = objc_msgSend(v5, "_pl_prettyDescriptionWithIndent:", *(void *)(a1 + 56) + 1);
  [*(id *)(a1 + 40) appendFormat:@"\n%@%@%@: %@", *(void *)(a1 + 48), *MEMORY[0x1E4F8C4B8], v7, v6];
}

@end