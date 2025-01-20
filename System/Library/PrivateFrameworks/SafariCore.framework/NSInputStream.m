@interface NSInputStream
@end

@implementation NSInputStream

void __53__NSInputStream_SafariCoreExtras__safari_readAllData__block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 40));
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    [v2 close];
  }
}

@end