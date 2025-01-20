@interface UIStoryboardUnwindChain
@end

@implementation UIStoryboardUnwindChain

void __44___UIStoryboardUnwindChain_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = a2;
  if (v4) {
    v6 = @", ";
  }
  else {
    v6 = @" ";
  }
  [v3 appendString:v6];
  [*(id *)(a1 + 32) appendString:v5];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

@end