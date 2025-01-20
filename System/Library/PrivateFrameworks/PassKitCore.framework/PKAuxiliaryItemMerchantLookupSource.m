@interface PKAuxiliaryItemMerchantLookupSource
- (BOOL)containsSensitiveData;
- (BOOL)isRefund;
- (BOOL)isSettlement;
- (PKAuxiliaryItemMerchantLookupSource)initWithAuxiliaryItem:(id)a3;
- (id)identifier;
- (id)mapsMerchantLookupRequest;
- (id)mapsURL;
- (int64_t)type;
@end

@implementation PKAuxiliaryItemMerchantLookupSource

- (PKAuxiliaryItemMerchantLookupSource)initWithAuxiliaryItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAuxiliaryItemMerchantLookupSource;
  v6 = [(PKAuxiliaryItemMerchantLookupSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (id)mapsMerchantLookupRequest
{
  return 0;
}

- (id)mapsURL
{
  return [(PKPassAuxiliaryPassInformationItem *)self->_item mapsURL];
}

- (BOOL)isRefund
{
  return 0;
}

- (BOOL)isSettlement
{
  return 0;
}

- (BOOL)containsSensitiveData
{
  return 0;
}

- (id)identifier
{
  return [(PKPassAuxiliaryPassInformationItem *)self->_item identifier];
}

- (int64_t)type
{
  return 3;
}

- (void).cxx_destruct
{
}

@end