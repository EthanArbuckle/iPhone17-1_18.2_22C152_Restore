@interface WRTaskingDictAddDiagnostics
@end

@implementation WRTaskingDictAddDiagnostics

void ___WRTaskingDictAddDiagnostics_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (([v7 isEqualToString:@"is_new"] & 1) == 0
    && (![v7 isEqualToString:@"name"]
     || ([v5 isEqualToString:*(void *)(a1 + 32)] & 1) == 0))
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"%@%@", *(void *)(a1 + 40), v7];
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v6];
  }
}

@end