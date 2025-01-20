@interface NSDictionary
@end

@implementation NSDictionary

uint64_t __63__NSDictionary_NAAdditions__na_reduceWithInitialValue_reducer___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return MEMORY[0x1F41817F8]();
}

uint64_t __37__NSDictionary_NAAdditions__na_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__NSDictionary_NAAdditions__na_dictionaryByMappingValues___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKey:v4];
  }
}

void __52__NSDictionary_NAAdditions__na_firstKeyPassingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  v7 = [*(id *)(a1 + 32) objectForKey:v8];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __36__NSDictionary_NAAdditions__na_map___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t __40__NSDictionary_NAAdditions__na_flatMap___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObjectsFromArray:v2];
  }
  return MEMORY[0x1F41817F8]();
}

void __39__NSDictionary_NAAdditions__na_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

uint64_t __36__NSDictionary_NAAdditions__na_any___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __43__NSDictionary_NAAdditions__na_allSatisfy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

@end