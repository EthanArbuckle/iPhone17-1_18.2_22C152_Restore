@interface SUUIInAppPurchase
- (NSMutableDictionary)cacheRepresentation;
- (NSString)formattedPrice;
- (NSString)name;
- (SUUIInAppPurchase)initWithCacheRepresentation:(id)a3;
- (SUUIInAppPurchase)initWithInAppPurchaseDictionary:(id)a3;
@end

@implementation SUUIInAppPurchase

- (SUUIInAppPurchase)initWithInAppPurchaseDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIInAppPurchase;
  v5 = [(SUUIInAppPurchase *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"price"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      formattedPrice = v5->_formattedPrice;
      v5->_formattedPrice = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"name"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      name = v5->_name;
      v5->_name = (NSString *)v10;
    }
  }

  return v5;
}

- (SUUIInAppPurchase)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIInAppPurchase;
  v5 = [(SUUIInAppPurchase *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"price"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      formattedPrice = v5->_formattedPrice;
      v5->_formattedPrice = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"name"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      name = v5->_name;
      v5->_name = (NSString *)v10;
    }
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  formattedPrice = self->_formattedPrice;
  if (formattedPrice) {
    [v3 setObject:formattedPrice forKey:@"price"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  return (NSMutableDictionary *)v4;
}

- (NSString)formattedPrice
{
  return self->_formattedPrice;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_formattedPrice, 0);
}

@end