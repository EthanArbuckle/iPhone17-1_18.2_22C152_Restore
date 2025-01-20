@interface NSArray
@end

@implementation NSArray

uint64_t __44__NSArray_PhotoLibraryServices___pl_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__NSArray_Additions__pl_indexOfLastObjectInRange_passingTest___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __63__NSArray_Additions__pl_indexOfFirstObjectInRange_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = [*(id *)(a1 + 32) objectAtIndex:a2];
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2, *(void *)(*(void *)(a1 + 48) + 8) + 24);

  return v6;
}

uint64_t __61__NSArray_Additions__pl_arrayOfUniqueObjectsNotInOrderedSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 > *a3) {
    return 1;
  }
  else {
    return ((uint64_t)(*a2 - *a3) >> 63);
  }
}

id __65__NSArray_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) count] - 1;
  if (v2 <= 0x3B9AC9FF)
  {
    if (v2 <= 0x5F5E0FF)
    {
      if (v2 <= 0x98967F)
      {
        if (v2 <= 0xF423F)
        {
          if (v2 >> 5 <= 0xC34)
          {
            if (v2 >> 4 <= 0x270)
            {
              if (v2 <= 0x3E7)
              {
                if (v2 <= 0x63)
                {
                  if (v2 <= 9) {
                    int v3 = 1;
                  }
                  else {
                    int v3 = 2;
                  }
                }
                else
                {
                  int v3 = 3;
                }
              }
              else
              {
                int v3 = 4;
              }
            }
            else
            {
              int v3 = 5;
            }
          }
          else
          {
            int v3 = 6;
          }
        }
        else
        {
          int v3 = 7;
        }
      }
      else
      {
        int v3 = 8;
      }
    }
    else
    {
      int v3 = 9;
    }
  }
  else
  {
    int v3 = 10;
  }
  uint64_t v4 = [MEMORY[0x1E4F28E78] string];
  v5 = PLIndentToString();
  [v4 appendFormat:@"<%@: %p> [", objc_opt_class(), *(void *)(a1 + 32)];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__NSArray_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2;
  v12[3] = &unk_1E5870F60;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  id v7 = v4;
  id v13 = v7;
  v14 = v5;
  int v16 = v3;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:v12];
  [v7 appendFormat:@"\n%@]", v8];
  v9 = v14;
  id v10 = v7;

  return v10;
}

void __65__NSArray_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = objc_msgSend(a2, "_pl_prettyDescriptionWithIndent:", *(void *)(a1 + 48) + 1);
  [*(id *)(a1 + 32) appendFormat:@"\n%@%@[%*lu]: %@", *(void *)(a1 + 40), *MEMORY[0x1E4F8C4B8], *(unsigned int *)(a1 + 56), a3, v5];
}

void __45__NSArray_PhotoLibraryServices___pl_flatMap___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObjectsFromArray:v2];
}

@end