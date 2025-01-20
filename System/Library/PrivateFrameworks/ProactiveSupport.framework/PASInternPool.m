@interface PASInternPool
@end

@implementation PASInternPool

void __36___PASInternPool__intern_copyInput___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 member:*(void *)(a1 + 32)];
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
    goto LABEL_12;
  }
  int v4 = *(unsigned __int8 *)(a1 + 56);
  if (*(unsigned char *)(a1 + 56))
  {
    v5 = (*(void (**)(void, void, uint64_t))(*(void *)(*(void *)(a1 + 40) + 16) + 16))(*(void *)(*(void *)(a1 + 40) + 16), *(void *)(a1 + 32), [*(id *)(a1 + 40) allocationZone]);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  if (v4) {

  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v6 != *(void *)(a1 + 32))
  {
    if (!malloc_size(*(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40))) {
      goto LABEL_12;
    }
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  [v7 addObject:v6];
LABEL_12:
}

id __48___PASInternPool_initWithBehavior_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "copyWithZone:");

  return v2;
}

uint64_t __23___PASInternPool_clear__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

uint64_t __25___PASInternPool_isEmpty__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

uint64_t __29___PASInternPool_isInterned___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end