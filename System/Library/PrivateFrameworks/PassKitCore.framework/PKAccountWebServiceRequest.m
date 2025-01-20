@interface PKAccountWebServiceRequest
+ (id)currencyAmountFormattedDictionary:(id)a3;
- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6;
@end

@implementation PKAccountWebServiceRequest

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  return [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:a3 version:@"1" endpointComponents:a4 queryParameters:a5 appleAccountInformation:a6];
}

+ (id)currencyAmountFormattedDictionary:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v9[0] = @"currency";
    id v3 = a3;
    v4 = [v3 currency];
    v10[0] = v4;
    v9[1] = @"amount";
    v5 = [v3 amount];
    v10[1] = v5;
    v9[2] = @"formattedAmount";
    v6 = [v3 formattedStringValue];

    v10[2] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end