@interface PKTransactionMerchantLookupSource
- (BOOL)containsSensitiveData;
- (BOOL)isClearingAttempt;
- (BOOL)isRefund;
- (BOOL)isSettlement;
- (PKTransactionMerchantLookupSource)initWithTransaction:(id)a3 paymentApplication:(id)a4;
- (id)identifier;
- (id)mapsMerchantLookupRequest;
- (id)mapsURL;
- (int64_t)type;
- (void)setClearingAttempt:(BOOL)a3;
@end

@implementation PKTransactionMerchantLookupSource

- (PKTransactionMerchantLookupSource)initWithTransaction:(id)a3 paymentApplication:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKTransactionMerchantLookupSource;
  v9 = [(PKTransactionMerchantLookupSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transaction, a3);
    objc_storeStrong((id *)&v10->_paymentApplication, a4);
  }

  return v10;
}

- (id)mapsMerchantLookupRequest
{
  unint64_t v3 = [(PKPaymentTransaction *)self->_transaction effectiveTransactionSource];
  [(PKPaymentTransaction *)self->_transaction transactionType];
  if (v3 - 1 > 7) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_1916750D8[v3 - 1];
  }
  v5 = [(PKPaymentTransaction *)self->_transaction merchant];
  id v6 = objc_alloc_init((Class)getMKWalletMerchantLookupRequestClass[0]());
  [v6 setTransactionType:v4];
  id v7 = [(PKPaymentTransaction *)self->_transaction transactionDate];
  [v6 setTransactionDate:v7];

  paymentApplication = self->_paymentApplication;
  if (paymentApplication)
  {
    v9 = PKPaymentNetworkNameForPaymentCredentialType([(PKPaymentApplication *)paymentApplication paymentNetworkIdentifier]);
    [v6 setPaymentNetwork:v9];
  }
  v10 = [v5 industryCategory];
  [v6 setIndustryCategory:v10];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "industryCode"));
  [v6 setIndustryCode:v11];

  objc_super v12 = [v5 city];
  [v6 setMerchantCity:v12];

  v13 = [v5 rawCity];
  [v6 setMerchantRawCity:v13];

  v14 = [v5 state];
  [v6 setMerchantState:v14];

  v15 = [v5 rawState];
  [v6 setMerchantRawState:v15];

  v16 = [v5 zip];
  [v6 setMerchantZip:v16];

  v17 = [v5 merchantIdentifier];
  [v6 setMerchantId:v17];

  v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "cleanConfidenceLevel"));
  [v6 setMerchantCleanConfidenceLevel:v18];

  v19 = [(PKPaymentTransaction *)self->_transaction currencyCode];
  [v6 setTransactionCurrencyCode:v19];

  v20 = [v5 rawCANL];
  [v6 setMerchantCanl:v20];

  v21 = [(PKPaymentTransaction *)self->_transaction identifier];
  [v6 setTransactionId:v21];

  v22 = [v5 rawName];
  [v6 setRawMerchantCode:v22];

  v23 = [v5 name];
  [v6 setMerchantCode:v23];

  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[PKPaymentTransaction isFuzzyMatched](self->_transaction, "isFuzzyMatched"));
  [v6 setFuzzyMatched:v24];

  v25 = [(PKPaymentTransaction *)self->_transaction clearingNetworkData];

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E4F28D90];
    v27 = [(PKPaymentTransaction *)self->_transaction clearingNetworkData];
  }
  else
  {
    v28 = [(PKPaymentTransaction *)self->_transaction authNetworkData];

    if (!v28) {
      goto LABEL_16;
    }
    v26 = (void *)MEMORY[0x1E4F28D90];
    v27 = [(PKPaymentTransaction *)self->_transaction authNetworkData];
  }
  v29 = v27;
  v30 = [v27 dataUsingEncoding:4];
  v28 = [v26 JSONObjectWithData:v30 options:0 error:0];

  if (v28)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [v28 objectForKeyedSubscript:@"DE041"];
      [v6 setTerminalId:v31];

      v32 = [v28 objectForKeyedSubscript:@"DE048"];
      if (v32)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v33 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v32 options:0 error:0];
          v34 = (void *)[[NSString alloc] initWithData:v33 encoding:4];
          [v6 setMerchantAdditionalData:v34];
        }
      }
      v35 = [v28 objectForKeyedSubscript:@"DE019"];
      [v6 setMerchantCountryCode:v35];

      v36 = [v28 objectForKeyedSubscript:@"DE018"];
      [v6 setMerchantType:v36];
    }
  }
LABEL_16:
  switch(v4)
  {
    case 1:
    case 4:
      v37 = [(PKPaymentTransaction *)self->_transaction location];
      v38 = PKGEOLocationFromCLLocation(v37);
      [v6 setLocation:v38];

      v39 = objc_msgSend(NSNumber, "numberWithBool:", -[PKPaymentTransaction isCoarseLocation](self->_transaction, "isCoarseLocation"));
      [v6 setCoarseLocationUsed:v39];
      goto LABEL_21;
    case 2:
      v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "adamIdentifier"));
      v40 = [v39 stringValue];
      [v6 setAdamId:v40];
      goto LABEL_20;
    case 3:
      v41 = [v5 webMerchantIdentifier];
      [v6 setWarsawMerchantId:v41];

      v42 = [v5 webMerchantName];
      [v6 setWarsawMerchantName:v42];

      v39 = [v5 originURL];
      v40 = [v39 absoluteString];
      [v6 setWarsawMerchantDomain:v40];
LABEL_20:

LABEL_21:
      break;
    default:
      break;
  }

  return v6;
}

- (BOOL)isRefund
{
  return [(PKPaymentTransaction *)self->_transaction transactionStatus] == 3
      || [(PKPaymentTransaction *)self->_transaction transactionType] == 1;
}

- (BOOL)isSettlement
{
  return self->_clearingAttempt;
}

- (BOOL)containsSensitiveData
{
  return 0;
}

- (id)identifier
{
  return [(PKPaymentTransaction *)self->_transaction identifier];
}

- (int64_t)type
{
  return 0;
}

- (id)mapsURL
{
  return 0;
}

- (BOOL)isClearingAttempt
{
  return self->_clearingAttempt;
}

- (void)setClearingAttempt:(BOOL)a3
{
  self->_clearingAttempt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end