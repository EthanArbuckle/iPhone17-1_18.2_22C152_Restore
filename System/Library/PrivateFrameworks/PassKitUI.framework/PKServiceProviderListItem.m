@interface PKServiceProviderListItem
- (NSCopying)identifier;
- (PKPaymentSetupServiceProviderProductWithItem)itemPair;
- (void)setItemPair:(id)a3;
@end

@implementation PKServiceProviderListItem

- (NSCopying)identifier
{
  v2 = [(PKPaymentSetupServiceProviderProductWithItem *)self->_itemPair item];
  v3 = [v2 identifier];

  return (NSCopying *)v3;
}

- (PKPaymentSetupServiceProviderProductWithItem)itemPair
{
  return self->_itemPair;
}

- (void)setItemPair:(id)a3
{
}

- (void).cxx_destruct
{
}

@end