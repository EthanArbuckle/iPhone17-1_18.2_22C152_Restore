@interface PKServiceProviderProductListItem
- (NSCopying)identifier;
- (PKDigitalIssuanceServiceProviderProduct)product;
- (void)setProduct:(id)a3;
@end

@implementation PKServiceProviderProductListItem

- (NSCopying)identifier
{
  return (NSCopying *)[(PKDigitalIssuanceServiceProviderProduct *)self->_product identifier];
}

- (PKDigitalIssuanceServiceProviderProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (void).cxx_destruct
{
}

@end