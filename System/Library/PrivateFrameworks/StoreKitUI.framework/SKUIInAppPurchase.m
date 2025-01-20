@interface SKUIInAppPurchase
- (NSMutableDictionary)cacheRepresentation;
- (NSString)formattedPrice;
- (NSString)name;
- (SKUIInAppPurchase)initWithCacheRepresentation:(id)a3;
- (SKUIInAppPurchase)initWithInAppPurchaseDictionary:(id)a3;
@end

@implementation SKUIInAppPurchase

- (SKUIInAppPurchase)initWithInAppPurchaseDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIInAppPurchase initWithInAppPurchaseDictionary:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIInAppPurchase;
  v5 = [(SKUIInAppPurchase *)&v13 init];
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

- (SKUIInAppPurchase)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIInAppPurchase initWithCacheRepresentation:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIInAppPurchase;
  v5 = [(SKUIInAppPurchase *)&v13 init];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
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

- (void)initWithInAppPurchaseDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIInAppPurchase initWithInAppPurchaseDictionary:]";
}

- (void)initWithCacheRepresentation:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIInAppPurchase initWithCacheRepresentation:]";
}

@end