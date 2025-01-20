@interface UIDeallocInvalidatable
@end

@implementation UIDeallocInvalidatable

id __53___UIDeallocInvalidatable_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"identifier"];
  v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v5 = [*(id *)(v3 + 16) hasBeenSignalled] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  return (id)[v4 appendBool:v5 withName:@"isValid"];
}

@end