@interface UIBADPrettyPrintTextAttributes
@end

@implementation UIBADPrettyPrintTextAttributes

void ___UIBADPrettyPrintTextAttributes_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@", (")];
  }
  [*(id *)(a1 + 32) appendFormat:@"%@=%@", v6, v5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

@end