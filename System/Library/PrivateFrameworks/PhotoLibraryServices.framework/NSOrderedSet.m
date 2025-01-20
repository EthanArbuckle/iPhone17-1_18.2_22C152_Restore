@interface NSOrderedSet
@end

@implementation NSOrderedSet

id __70__NSOrderedSet_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
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
  v4 = [*(id *)(a1 + 32) array];
  v5 = [MEMORY[0x1E4F28E78] string];
  v6 = PLIndentToString();
  [v5 appendFormat:@"<%@: %p> [", objc_opt_class(), *(void *)(a1 + 32)];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__NSOrderedSet_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2;
  v12[3] = &unk_1E5870F60;
  uint64_t v15 = *(void *)(a1 + 40);
  id v7 = v5;
  id v13 = v7;
  v14 = v6;
  int v16 = v3;
  id v8 = v6;
  [v4 enumerateObjectsUsingBlock:v12];
  [v7 appendFormat:@"\n%@]", v8];
  v9 = v14;
  id v10 = v7;

  return v10;
}

void __70__NSOrderedSet_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = objc_msgSend(a2, "_pl_prettyDescriptionWithIndent:", *(void *)(a1 + 48) + 1);
  [*(id *)(a1 + 32) appendFormat:@"\n%@%@[%*lu]: %@", *(void *)(a1 + 40), *MEMORY[0x1E4F8C4B8], *(unsigned int *)(a1 + 56), a3, v5];
}

@end