@interface PKPayLaterMerchantLookupSource
- (BOOL)containsSensitiveData;
- (BOOL)isRefund;
- (BOOL)isSettlement;
- (PKPayLaterMerchantLookupSource)initWithFinancingPlan:(id)a3;
- (id)identifier;
- (id)mapsMerchantLookupRequest;
- (id)mapsURL;
- (int64_t)type;
@end

@implementation PKPayLaterMerchantLookupSource

- (PKPayLaterMerchantLookupSource)initWithFinancingPlan:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterMerchantLookupSource;
  v6 = [(PKPayLaterMerchantLookupSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_financingPlan, a3);
  }

  return v7;
}

- (id)mapsMerchantLookupRequest
{
  unint64_t v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan planChannel];
  if (v3 > 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_191675128[v3];
  }
  id v5 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  v7 = [v6 payments];
  v8 = [v7 firstObject];

  objc_super v9 = [v8 fundingSources];
  v10 = [v9 firstObject];
  v11 = [v10 paymentPassDetails];

  id v12 = objc_alloc_init((Class)getMKWalletMerchantLookupRequestClass_0[0]());
  [v12 setTransactionType:v4];
  v13 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  v14 = [v13 transactionDate];
  [v12 setTransactionDate:v14];

  if (v11)
  {
    v15 = PKPaymentNetworkNameForPaymentCredentialType([v11 cardNetwork]);
    [v12 setPaymentNetwork:v15];
  }
  v16 = [v5 industryCategory];
  [v12 setIndustryCategory:v16];

  v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "industryCode"));
  [v12 setIndustryCode:v17];

  v18 = [v5 city];
  [v12 setMerchantCity:v18];

  v19 = [v5 rawCity];
  [v12 setMerchantRawCity:v19];

  v20 = [v5 state];
  [v12 setMerchantState:v20];

  v21 = [v5 rawState];
  [v12 setMerchantRawState:v21];

  v22 = [v5 zipcode];
  [v12 setMerchantZip:v22];

  v23 = [v5 merchantIdentifier];
  [v12 setMerchantId:v23];

  v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "cleanConfidence"));
  [v12 setMerchantCleanConfidenceLevel:v24];

  v25 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  v26 = [v25 totalAmount];
  v27 = [v26 currency];
  [v12 setTransactionCurrencyCode:v27];

  v28 = [v5 rawCANL];
  [v12 setMerchantCanl:v28];

  v29 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  [v12 setTransactionId:v29];

  v30 = [v5 rawName];
  [v12 setRawMerchantCode:v30];

  v31 = [v5 name];
  [v12 setMerchantCode:v31];

  v32 = [v5 clearingNetworkData];

  if (v32)
  {
    v33 = (void *)MEMORY[0x1E4F28D90];
    v34 = [v5 clearingNetworkData];
  }
  else
  {
    v35 = [v5 authNetworkData];

    if (!v35) {
      goto LABEL_16;
    }
    v33 = (void *)MEMORY[0x1E4F28D90];
    v34 = [v5 authNetworkData];
  }
  v36 = v34;
  v37 = [v34 dataUsingEncoding:4];
  v35 = [v33 JSONObjectWithData:v37 options:0 error:0];

  if (v35)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [v35 objectForKeyedSubscript:@"DE041"];
      [v12 setTerminalId:v38];

      v39 = [v35 objectForKeyedSubscript:@"DE048"];
      if (v39)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v40 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v39 options:0 error:0];
          v41 = (void *)[[NSString alloc] initWithData:v40 encoding:4];
          [v12 setMerchantAdditionalData:v41];
        }
      }
      v42 = [v35 objectForKeyedSubscript:@"DE019"];
      [v12 setMerchantCountryCode:v42];

      v43 = [v35 objectForKeyedSubscript:@"DE018"];
      [v12 setMerchantType:v43];
    }
  }
LABEL_16:
  if (v4 == 3)
  {
    v46 = [v5 webMerchantIdentifier];
    [v12 setWarsawMerchantId:v46];

    v47 = [v5 webMerchantName];
    [v12 setWarsawMerchantName:v47];

    v44 = [v5 originURL];
    v45 = [v44 absoluteString];
    [v12 setWarsawMerchantDomain:v45];
  }
  else
  {
    if (v4 != 2) {
      goto LABEL_21;
    }
    v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "adamIdentifier"));
    v45 = [v44 stringValue];
    [v12 setAdamId:v45];
  }

LABEL_21:
  return v12;
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
  return [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
}

- (int64_t)type
{
  return 1;
}

- (id)mapsURL
{
  return 0;
}

- (void).cxx_destruct
{
}

@end