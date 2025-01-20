@interface MDPlistContainerAddPlistObject
@end

@implementation MDPlistContainerAddPlistObject

uint64_t ___MDPlistContainerAddPlistObject_block_invoke(uint64_t a1, long long *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  return _MDPlistContainerAddPlistObject(v2, &v4);
}

uint64_t ___MDPlistContainerAddPlistObject_block_invoke_2(uint64_t a1, char *a2, uint64_t a3, long long *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  _MDPlistContainerAddCString(*(void *)(a1 + 32), a2, a3, 0, a5, a6, a7, a8);
  uint64_t v10 = *(void *)(a1 + 32);
  long long v12 = *a4;
  uint64_t v13 = *((void *)a4 + 2);
  return _MDPlistContainerAddPlistObject(v10, &v12);
}

@end