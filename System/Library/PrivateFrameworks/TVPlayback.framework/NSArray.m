@interface NSArray
@end

@implementation NSArray

void __68__NSArray_TVPlaybackAdditions__tvp_arrayByMappingObjectsUsingBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

@end