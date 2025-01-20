@interface NSURL(StoreCacheAdditions)
+ (id)wf_inMemoryAddress;
- (uint64_t)wf_isInMemoryAddress;
@end

@implementation NSURL(StoreCacheAdditions)

+ (id)wf_inMemoryAddress
{
  if (wf_inMemoryAddress_onceToken != -1) {
    dispatch_once(&wf_inMemoryAddress_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)wf__inMemoryAddress;
  return v0;
}

- (uint64_t)wf_isInMemoryAddress
{
  if ((void *)wf__inMemoryAddress == a1) {
    return 1;
  }
  v1 = [a1 scheme];
  uint64_t v2 = [v1 isEqualToString:@"memory"];

  return v2;
}

@end