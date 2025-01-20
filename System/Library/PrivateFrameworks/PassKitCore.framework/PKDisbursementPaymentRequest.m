@interface PKDisbursementPaymentRequest
- (PKDisbursementPaymentRequest)initWithDisbursementRequest:(id)a3;
@end

@implementation PKDisbursementPaymentRequest

- (PKDisbursementPaymentRequest)initWithDisbursementRequest:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKDisbursementPaymentRequest;
  v5 = [(PKPaymentRequest *)&v27 init];
  if (v5)
  {
    v6 = [v4 merchantIdentifier];
    [(PKPaymentRequest *)v5 setMerchantIdentifier:v6];

    v7 = [v4 regionCode];
    [(PKPaymentRequest *)v5 setCountryCode:v7];

    v8 = [v4 supportedNetworks];
    [(PKPaymentRequest *)v5 setSupportedNetworks:v8];

    -[PKPaymentRequest setMerchantCapabilities:](v5, "setMerchantCapabilities:", [v4 merchantCapabilities]);
    v9 = [v4 summaryItems];
    [(PKPaymentRequest *)v5 setPaymentSummaryItems:v9];

    v10 = [v4 currencyCode];
    [(PKPaymentRequest *)v5 setCurrencyCode:v10];

    v11 = [v4 recipientContact];
    [(PKPaymentRequest *)v5 setBillingContact:v11];

    v12 = [v4 recipientContact];
    [(PKPaymentRequest *)v5 setShippingContact:v12];

    v13 = [v4 applicationData];
    [(PKPaymentRequest *)v5 setApplicationData:v13];

    v14 = [v4 supportedRegions];

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E4F1CAD0];
      v16 = [v4 supportedRegions];
      v17 = [v15 setWithArray:v16];
      [(PKPaymentRequest *)v5 setSupportedCountries:v17];
    }
    [(PKPaymentRequest *)v5 setRequestType:10];
    [(PKPaymentRequest *)v5 setConfirmationStyle:1];
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = [v4 requiredRecipientContactFields];
    v20 = (void *)v19;
    if (v19) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = MEMORY[0x1E4F1CBF0];
    }
    v22 = [v18 setWithArray:v21];

    v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v22];
    [v23 removeObject:@"post"];
    if ([v22 containsObject:@"post"])
    {
      [v23 removeObject:@"name"];
      [v23 removeObject:@"phoneticName"];
    }
    v24 = (void *)[v22 copy];
    [(PKPaymentRequest *)v5 setRequiredBillingContactFields:v24];

    v25 = (void *)[v23 copy];
    [(PKPaymentRequest *)v5 setRequiredShippingContactFields:v25];
  }
  return v5;
}

@end