@interface WRTaskingDictAddSignposts
@end

@implementation WRTaskingDictAddSignposts

void ___WRTaskingDictAddSignposts_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isEqualToString:@"diagnostics"])
  {
    _WRTaskingDictAddDiagnostics(*(void **)(a1 + 32), v5, *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else if (![v7 isEqualToString:@"name"] {
         || ([v5 isEqualToString:*(void *)(a1 + 48)] & 1) == 0)
  }
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"%@%@", *(void *)(a1 + 56), v7];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

@end