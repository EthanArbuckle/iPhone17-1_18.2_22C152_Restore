@interface NSArray
@end

@implementation NSArray

uint64_t __56__NSArray_PreferencesAdditions__indexOfSpecifierWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = *(void **)(a1 + 32);
    v5 = [v3 identifier];
    uint64_t v6 = [v4 isEqualToString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end