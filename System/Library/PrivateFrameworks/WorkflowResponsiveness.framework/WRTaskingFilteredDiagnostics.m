@interface WRTaskingFilteredDiagnostics
@end

@implementation WRTaskingFilteredDiagnostics

void ___WRTaskingFilteredDiagnostics_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!v6 || ([v5 isEqual:v6] & 1) == 0) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v7];
  }
}

void ___WRTaskingFilteredDiagnostics_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (!v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (__CFString *)&unk_270D99AD8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_7;
      }
      id v7 = &stru_270D96DE8;
    }
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
  }
LABEL_7:
}

@end