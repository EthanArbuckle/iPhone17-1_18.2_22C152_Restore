@interface VSStorefrontFilter
+ (id)keyPathsForValuesAffectingFilteredStorefronts;
- (NSArray)filteredStorefronts;
- (NSArray)storefronts;
- (NSString)searchQuery;
- (VSStorefrontFilter)init;
- (void)setSearchQuery:(id)a3;
- (void)setStorefronts:(id)a3;
@end

@implementation VSStorefrontFilter

- (VSStorefrontFilter)init
{
  v7.receiver = self;
  v7.super_class = (Class)VSStorefrontFilter;
  v2 = [(VSStorefrontFilter *)&v7 init];
  v3 = v2;
  if (v2)
  {
    storefronts = v2->_storefronts;
    v2->_storefronts = (NSArray *)MEMORY[0x263EFFA68];

    searchQuery = v3->_searchQuery;
    v3->_searchQuery = (NSString *)&stru_26F361E90;
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingFilteredStorefronts
{
  if (keyPathsForValuesAffectingFilteredStorefronts___vs_lazy_init_predicate != -1) {
    dispatch_once(&keyPathsForValuesAffectingFilteredStorefronts___vs_lazy_init_predicate, &__block_literal_global_3);
  }
  v2 = (void *)keyPathsForValuesAffectingFilteredStorefronts___vs_lazy_init_variable;
  return v2;
}

uint64_t __67__VSStorefrontFilter_keyPathsForValuesAffectingFilteredStorefronts__block_invoke()
{
  uint64_t v0 = __67__VSStorefrontFilter_keyPathsForValuesAffectingFilteredStorefronts__block_invoke_2();
  uint64_t v1 = keyPathsForValuesAffectingFilteredStorefronts___vs_lazy_init_variable;
  keyPathsForValuesAffectingFilteredStorefronts___vs_lazy_init_variable = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id __67__VSStorefrontFilter_keyPathsForValuesAffectingFilteredStorefronts__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v0 addObject:@"searchQuery"];
  [v0 addObject:@"storefronts"];
  uint64_t v1 = (void *)[v0 copy];

  return v1;
}

- (void)setStorefronts:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F08B30];
  id v5 = a3;
  v6 = [v4 sortDescriptorWithKey:@"displayName" ascending:1];
  v15[0] = v6;
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v8 = [v5 sortedArrayUsingDescriptors:v7];

  v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = [v9 indexOfObjectPassingTest:&__block_literal_global_18];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v10;
    v12 = [v9 objectAtIndex:v10];
    [v9 removeObjectAtIndex:v11];
    [v9 addObject:v12];
  }
  v13 = (NSArray *)[v9 copy];
  storefronts = self->_storefronts;
  self->_storefronts = v13;
}

uint64_t __37__VSStorefrontFilter_setStorefronts___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = [a2 identitifer];
  uint64_t v6 = [v5 isEqualToString:@"__"];

  if (v6) {
    *a4 = 1;
  }
  return v6;
}

- (NSArray)filteredStorefronts
{
  v3 = [(VSStorefrontFilter *)self storefronts];
  v4 = [(VSStorefrontFilter *)self searchQuery];
  if ([v4 length])
  {
    id v5 = [MEMORY[0x263F087F0] expressionForKeyPath:@"displayName"];
    uint64_t v6 = [MEMORY[0x263F087F0] expressionForConstantValue:v4];
    objc_super v7 = [MEMORY[0x263F08720] predicateWithLeftExpression:v5 rightExpression:v6 modifier:0 type:99 options:3];
    uint64_t v8 = [v3 filteredArrayUsingPredicate:v7];

    v3 = (void *)v8;
  }

  return (NSArray *)v3;
}

- (NSArray)storefronts
{
  return self->_storefronts;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_storefronts, 0);
}

@end