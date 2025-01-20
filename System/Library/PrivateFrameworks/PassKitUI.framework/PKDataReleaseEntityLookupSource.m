@interface PKDataReleaseEntityLookupSource
- (BOOL)containsSensitiveData;
- (BOOL)isRefund;
- (BOOL)isSettlement;
- (PKDataReleaseEntityLookupSource)initWithEntityIdentifier:(id)a3;
- (id)identifier;
- (id)mapsMerchantLookupRequest;
- (id)mapsURL;
- (int64_t)type;
@end

@implementation PKDataReleaseEntityLookupSource

- (PKDataReleaseEntityLookupSource)initWithEntityIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDataReleaseEntityLookupSource;
  v6 = [(PKDataReleaseEntityLookupSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entity, a3);
  }

  return v7;
}

- (id)mapsMerchantLookupRequest
{
  id v3 = objc_alloc_init(getMKWalletMerchantLookupRequestClass());
  [v3 setTransactionType:6];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setTransactionDate:v4];

  [v3 setRelyingPartyIdentifier:self->_entity];

  return v3;
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
  return 0;
}

- (int64_t)type
{
  return 2;
}

- (id)mapsURL
{
  return 0;
}

- (void).cxx_destruct
{
}

@end