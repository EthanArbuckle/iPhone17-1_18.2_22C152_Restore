@interface PKPaymentAvailableProductsResponse
- (BOOL)supportsSecureCoding;
- (NSArray)availableProducts;
- (NSDate)expiry;
- (NSNumber)timestamp;
@end

@implementation PKPaymentAvailableProductsResponse

- (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)expiry
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [(PKWebServiceResponse *)self headers];
  v5 = [v4 PKStringForKey:@"Cache-Control"];
  v6 = [v5 componentsSeparatedByString:@"="];

  if ([v6 count] == 2
    && ([v6 objectAtIndex:0],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 hasPrefix:@"max-age"],
        v7,
        v8))
  {
    v9 = [v6 objectAtIndex:1];
    [v9 doubleValue];
    double v11 = v10;

    v12 = [v3 dateByAddingTimeInterval:v11];
  }
  else
  {
    v13 = [v4 PKDateForKey:@"Expires"];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v3 dateByAddingTimeInterval:86400.0];
    }
    v12 = v15;
  }
  return (NSDate *)v12;
}

- (NSNumber)timestamp
{
  v2 = [(PKWebServiceResponse *)self JSONObject];
  v3 = [v2 PKNumberForKey:@"timestamp"];

  return (NSNumber *)v3;
}

- (NSArray)availableProducts
{
  return self->_availableProducts;
}

- (void).cxx_destruct
{
}

@end