@interface SUUIAccountButtonsComponent
- (BOOL)hidesTermsAndConditions;
- (SUUIAccountButtonsComponent)initWithCustomPageContext:(id)a3;
- (SUUIAccountButtonsComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (SUUIAccountButtonsComponent)initWithViewElement:(id)a3;
- (SUUILink)ECommerceLink;
- (int64_t)componentType;
- (void)setECommerceLink:(id)a3;
- (void)setHidesTermsAndConditions:(BOOL)a3;
@end

@implementation SUUIAccountButtonsComponent

- (SUUIAccountButtonsComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIAccountButtonsComponent;
  v5 = [(SUUIPageComponent *)&v9 initWithCustomPageContext:v4];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"hideTerms"];
    if (objc_opt_respondsToSelector()) {
      v5->_hidesTermsAndConditions = [v7 BOOLValue];
    }
  }
  return v5;
}

- (SUUIAccountButtonsComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIAccountButtonsComponent;
  v7 = [(SUUIPageComponent *)&v13 initWithFeaturedContentContext:v6 kind:a4];
  if (v7)
  {
    v8 = [v6 componentDictionary];
    objc_super v9 = [v8 objectForKey:@"ecommerceLink"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[SUUILink alloc] initWithLinkDictionary:v9];
      ecommerceLink = v7->_ecommerceLink;
      v7->_ecommerceLink = v10;
    }
  }

  return v7;
}

- (SUUIAccountButtonsComponent)initWithViewElement:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIAccountButtonsComponent;
  return [(SUUIPageComponent *)&v4 initWithViewElement:a3];
}

- (int64_t)componentType
{
  return 1;
}

- (SUUILink)ECommerceLink
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

@end