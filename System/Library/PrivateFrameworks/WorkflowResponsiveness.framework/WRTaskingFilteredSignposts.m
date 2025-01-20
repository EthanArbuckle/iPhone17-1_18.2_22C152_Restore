@interface WRTaskingFilteredSignposts
@end

@implementation WRTaskingFilteredSignposts

void ___WRTaskingFilteredSignposts_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  if ([(__CFString *)v11 isEqualToString:@"diagnostics"])
  {
    v7 = _WRTaskingFilteredDiagnostics(v5, v6);
    v8 = *(void **)(a1 + 40);
    id v9 = v7;
    v10 = @"diagnostics";
LABEL_6:
    [v8 setObject:v9 forKeyedSubscript:v10];
    goto LABEL_7;
  }
  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  if (!v7 || ([v5 isEqual:v7] & 1) == 0)
  {
    v8 = *(void **)(a1 + 40);
    id v9 = v5;
    v10 = v11;
    goto LABEL_6;
  }
LABEL_7:
}

void ___WRTaskingFilteredSignposts_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (!v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (__CFString *)&unk_270D99AD8;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = &stru_270D96DE8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_9;
        }
        v7 = (__CFString *)MEMORY[0x263EFFA68];
      }
    }
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
  }
LABEL_9:
}

@end