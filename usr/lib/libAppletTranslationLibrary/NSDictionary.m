@interface NSDictionary
@end

@implementation NSDictionary

void __35__NSDictionary_Functional__filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

uint64_t __32__NSDictionary_Functional__map___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v2) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v2];
  }

  return MEMORY[0x1F41817F8]();
}

@end