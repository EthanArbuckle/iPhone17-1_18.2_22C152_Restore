@interface MicroPaymentProductsResponse
- (BOOL)loadFromDictionary:(id)a3 error:(id *)a4;
- (NSArray)expectedIdentifiers;
- (NSArray)invalidIdentifiers;
- (NSArray)products;
- (void)dealloc;
- (void)setExpectedIdentifiers:(id)a3;
@end

@implementation MicroPaymentProductsResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MicroPaymentProductsResponse;
  [(MicroPaymentProductsResponse *)&v3 dealloc];
}

- (BOOL)loadFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = objc_alloc_init((Class)NSMutableArray);
  if (self->_expectedIdentifiers) {
    id v8 = [objc_alloc((Class)NSMutableSet) initWithArray:self->_expectedIdentifiers];
  }
  else {
    id v8 = 0;
  }
  id v9 = [a3 objectForKey:@"available-subproducts"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [[MicroPaymentProduct alloc] initWithDictionary:*(void *)(*((void *)&v18 + 1) + 8 * (void)v13)];
          if (v14)
          {
            v15 = v14;
            [v7 addObject:v14];
            objc_msgSend(v8, "removeObject:", -[MicroPaymentProduct productIdentifier](v15, "productIdentifier"));
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  if ([v8 count]) {
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v8, "allObjects"));
  }

  self->_invalidIdentifiers = (NSArray *)[v6 copy];
  self->_products = (NSArray *)[v7 copy];

  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (NSArray)expectedIdentifiers
{
  return self->_expectedIdentifiers;
}

- (void)setExpectedIdentifiers:(id)a3
{
}

- (NSArray)invalidIdentifiers
{
  return self->_invalidIdentifiers;
}

- (NSArray)products
{
  return self->_products;
}

@end