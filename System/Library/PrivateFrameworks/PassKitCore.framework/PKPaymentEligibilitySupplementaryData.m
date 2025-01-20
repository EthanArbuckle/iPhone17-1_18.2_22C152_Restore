@interface PKPaymentEligibilitySupplementaryData
- (PKAccount)lightweightAccount;
- (PKPaymentEligibilitySupplementaryData)initWithDictionary:(id)a3 accountFeatureIdentifier:(unint64_t)a4;
@end

@implementation PKPaymentEligibilitySupplementaryData

- (PKPaymentEligibilitySupplementaryData)initWithDictionary:(id)a3 accountFeatureIdentifier:(unint64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentEligibilitySupplementaryData;
  v7 = [(PKPaymentEligibilitySupplementaryData *)&v17 init];
  if (v7)
  {
    v8 = [v6 PKStringForKey:@"accountIdentifier"];
    v9 = [v6 PKCurrencyAmountForKey:@"accountBalance"];
    uint64_t v10 = [v6 PKArrayForKey:@"cloudStoreZoneNames"];
    v11 = (void *)v10;
    if (a4 == 4 && v8 && v9 && v10)
    {
      v12 = [PKAccount alloc];
      v13 = PKLightweightAppleBalanceAccountDict(v8, v9, v11);
      uint64_t v14 = [(PKAccount *)v12 initWithDictionary:v13 isCloudAccount:1];
      lightweightAccount = v7->_lightweightAccount;
      v7->_lightweightAccount = (PKAccount *)v14;
    }
  }

  return v7;
}

- (PKAccount)lightweightAccount
{
  return self->_lightweightAccount;
}

- (void).cxx_destruct
{
}

@end