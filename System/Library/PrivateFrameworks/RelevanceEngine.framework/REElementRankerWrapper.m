@interface REElementRankerWrapper
@end

@implementation REElementRankerWrapper

void __45___REElementRankerWrapper_shouldHideElement___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [REMLElement alloc];
  v3 = [*(id *)(a1 + 40) identifier];
  v4 = [(REMLElement *)v2 initWithIdentifier:v3 featureMap:v5];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) shouldHideElement:v4];
}

@end