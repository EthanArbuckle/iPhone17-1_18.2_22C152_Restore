@interface UIDataSourceBatchUpdateDescription
@end

@implementation UIDataSourceBatchUpdateDescription

void ___UIDataSourceBatchUpdateDescription_block_invoke(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = @"s";
  if (*a3 == 1) {
    v6 = &stru_1ED0E84C0;
  }
  [v5 appendFormat:@"Data source %@ updates = { %lu section%@ with item counts: [", a2, *a3, v6];
  if (*a3)
  {
    unsigned int v7 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%lu", (*(unsigned int (**)(void))(*((void *)a3 + 2) + 16))());
      unsigned int v8 = *a3;
      if (v7 < *a3 - 1)
      {
        [*(id *)(a1 + 32) appendString:@", "];
        unsigned int v8 = *a3;
      }
      ++v7;
    }
    while (v7 < v8);
  }
  [*(id *)(a1 + 32) appendString:@"] }\n"];

  v9 = (void *)*((void *)a3 + 2);
}

@end