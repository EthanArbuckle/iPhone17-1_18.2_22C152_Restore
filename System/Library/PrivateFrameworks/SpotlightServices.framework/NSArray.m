@interface NSArray
@end

@implementation NSArray

void __42__NSArray_Tokenize__tokenizedStringArray___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 length])
  {
    v3 = *(void **)(a1 + 32);
    v4 = [SSTokenizedString alloc];
    v5 = [v7 lowercaseString];
    v6 = [(SSTokenizedString *)v4 initWithString:v5 locale:*(void *)(a1 + 40)];
    [v3 addObject:v6];
  }
}

void __35__NSArray_QueryUtils__mapNonEmpty___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 length])
  {
    v3 = *(void **)(a1 + 32);
    v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [v3 addObject:v4];
  }
}

@end