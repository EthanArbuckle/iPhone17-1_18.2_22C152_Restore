@interface NSKeyedArchiver
@end

@implementation NSKeyedArchiver

void __107__NSKeyedArchiver_ICUserIdentity__ic_archivedDataWithRootUserIdentity_inStore_requiringSecureCoding_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 archivedDataWithRootObject:v2 requiringSecureCoding:v3 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

@end