@interface PKPaymentPrepareTransactionDetailsResponse
- (NSDecimalNumber)amount;
- (NSDictionary)instructionsDictionary;
- (NSString)secureElementIdentifier;
- (PKPaymentPrepareTransactionDetailsResponse)initWithData:(id)a3;
@end

@implementation PKPaymentPrepareTransactionDetailsResponse

- (PKPaymentPrepareTransactionDetailsResponse)initWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentPrepareTransactionDetailsResponse;
  v3 = [(PKWebServiceResponse *)&v16 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v4->_instructionsDictionary, v5);
      uint64_t v6 = [(NSDictionary *)v4->_instructionsDictionary PKDecimalNumberFromStringForKey:@"amount"];
      amount = v4->_amount;
      v4->_amount = (NSDecimalNumber *)v6;

      uint64_t v8 = [(NSDictionary *)v4->_instructionsDictionary objectForKey:@"seId"];
      secureElementIdentifier = (PKPaymentPrepareTransactionDetailsResponse *)v4->_secureElementIdentifier;
      v4->_secureElementIdentifier = (NSString *)v8;
    }
    else
    {
      v10 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        __int16 v19 = 2112;
        v20 = v13;
        id v14 = v13;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      secureElementIdentifier = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (NSDictionary)instructionsDictionary
{
  return self->_instructionsDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsDictionary, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end