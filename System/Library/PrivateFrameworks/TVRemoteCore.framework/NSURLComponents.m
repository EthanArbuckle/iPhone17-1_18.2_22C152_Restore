@interface NSURLComponents
@end

@implementation NSURLComponents

void __73__NSURLComponents_TVRMSAdditions__rms_componentsByAddingQueryParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  [NSString stringWithFormat:@"%@=%@", a2, a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

@end