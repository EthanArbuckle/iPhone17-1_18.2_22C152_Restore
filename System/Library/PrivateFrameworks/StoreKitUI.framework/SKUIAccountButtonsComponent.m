@interface SKUIAccountButtonsComponent
- (BOOL)hidesTermsAndConditions;
- (SKUIAccountButtonsComponent)initWithCustomPageContext:(id)a3;
- (SKUIAccountButtonsComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (SKUIAccountButtonsComponent)initWithViewElement:(id)a3;
- (SKUILink)ECommerceLink;
- (int64_t)componentType;
- (void)setECommerceLink:(id)a3;
- (void)setHidesTermsAndConditions:(BOOL)a3;
@end

@implementation SKUIAccountButtonsComponent

- (SKUIAccountButtonsComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIAccountButtonsComponent initWithCustomPageContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIAccountButtonsComponent;
  v13 = [(SKUIPageComponent *)&v17 initWithCustomPageContext:v4];
  if (v13)
  {
    v14 = [v4 componentDictionary];
    v15 = [v14 objectForKey:@"hideTerms"];
    if (objc_opt_respondsToSelector()) {
      v13->_hidesTermsAndConditions = [v15 BOOLValue];
    }
  }
  return v13;
}

- (SKUIAccountButtonsComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIAccountButtonsComponent initWithFeaturedContentContext:kind:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIAccountButtonsComponent;
  v15 = [(SKUIPageComponent *)&v21 initWithFeaturedContentContext:v6 kind:a4];
  if (v15)
  {
    v16 = [v6 componentDictionary];
    objc_super v17 = [v16 objectForKey:@"ecommerceLink"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[SKUILink alloc] initWithLinkDictionary:v17];
      ecommerceLink = v15->_ecommerceLink;
      v15->_ecommerceLink = v18;
    }
  }

  return v15;
}

- (SKUIAccountButtonsComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIAccountButtonsComponent initWithViewElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIAccountButtonsComponent;
  uint64_t v13 = [(SKUIPageComponent *)&v15 initWithViewElement:v4];

  return v13;
}

- (int64_t)componentType
{
  return 1;
}

- (SKUILink)ECommerceLink
{
  return self->_ecommerceLink;
}

- (void)setECommerceLink:(id)a3
{
}

- (BOOL)hidesTermsAndConditions
{
  return self->_hidesTermsAndConditions;
}

- (void)setHidesTermsAndConditions:(BOOL)a3
{
  self->_hidesTermsAndConditions = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFeaturedContentContext:(uint64_t)a3 kind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end