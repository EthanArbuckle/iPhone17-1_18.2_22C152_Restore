@interface PASBundleIdResolver
@end

@implementation PASBundleIdResolver

void __54___PASBundleIdResolver_bundleIdentifierOrProcessName___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v5 = v3;
  if (!v3[1])
  {
    [*(id *)(a1 + 32) _populateResultWithLockWitness:v3];
    v3 = v5;
  }
  v4 = *(unsigned char **)(a1 + 48);
  if (v4) {
    unsigned char *v4 = *((unsigned char *)v3 + 16);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3[1]);
}

@end