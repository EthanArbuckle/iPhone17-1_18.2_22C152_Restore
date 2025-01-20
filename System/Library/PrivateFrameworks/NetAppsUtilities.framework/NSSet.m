@interface NSSet
@end

@implementation NSSet

uint64_t __32__NSSet_NAAdditions__na_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __30__NSSet_NAAdditions__na_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__NSSet_NAAdditions__na_setByFlattening__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v4 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v5 = objc_msgSend(v6, "na_setByFlattening");

    [v4 unionSet:v5];
    id v6 = (id)v5;
  }
  else
  {
    [v4 addObject:v6];
  }
}

uint64_t __71__NSSet_NAAdditions__na_dictionaryByBucketingObjectsUsingKeyGenerator___block_invoke()
{
  return [MEMORY[0x1E4F1CA80] set];
}

uint64_t __29__NSSet_NAAdditions__na_map___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
  return MEMORY[0x1F41817F8]();
}

id __45__NSSet_NAAdditions__na_setByDiffingWithSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 member:v3];
  uint64_t v5 = v4;
  if (!v4) {
    v4 = v3;
  }
  id v6 = v4;

  return v6;
}

uint64_t __29__NSSet_NAAdditions__na_any___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __48__NSSet_NAAdditions__na_firstObjectPassingTest___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

uint64_t __29__NSSet_NAAdditions__na_all___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

uint64_t __56__NSSet_NAAdditions__na_reduceWithInitialValue_reducer___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return MEMORY[0x1F41817F8]();
}

uint64_t __44__NSSet_NAAdditions__na_allObjectsPassTest___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

@end