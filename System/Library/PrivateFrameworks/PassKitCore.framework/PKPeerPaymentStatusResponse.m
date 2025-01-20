@interface PKPeerPaymentStatusResponse
- (BOOL)amountHashIsValidForAmount:(id)a3 andCurrency:(id)a4;
- (NSArray)actions;
- (NSData)amountHash;
- (NSString)paymentIdentifier;
- (NSString)recurringPaymentIdentifier;
- (NSString)signature;
- (NSString)transactionIdentifier;
- (PKPeerPaymentStatusResponse)initWithData:(id)a3;
- (int64_t)status;
@end

@implementation PKPeerPaymentStatusResponse

- (PKPeerPaymentStatusResponse)initWithData:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)PKPeerPaymentStatusResponse;
  v3 = [(PKWebServiceResponse *)&v28 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v7 = [v6 PKStringForKey:@"status"];
      uint64_t v8 = PKPaymentTransactionStatusFromString(v7);
      if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2) {
        uint64_t v9 = -1;
      }
      else {
        uint64_t v9 = v8;
      }
      v4->_status = v9;

      uint64_t v10 = [v6 PKStringForKey:@"paymentIdentifier"];
      paymentIdentifier = v4->_paymentIdentifier;
      v4->_paymentIdentifier = (NSString *)v10;

      uint64_t v12 = [v6 PKStringForKey:@"transactionIdentifier"];
      transactionIdentifier = v4->_transactionIdentifier;
      v4->_transactionIdentifier = (NSString *)v12;

      uint64_t v14 = [v6 PKStringForKey:@"recurringPaymentIdentifier"];
      recurringPaymentIdentifier = v4->_recurringPaymentIdentifier;
      v4->_recurringPaymentIdentifier = (NSString *)v14;

      uint64_t v16 = [v6 PKArrayForKey:@"actions"];
      actions = v4->_actions;
      v4->_actions = (NSArray *)v16;

      v18 = [v6 PKStringForKey:@"amountHash"];
      uint64_t v19 = objc_msgSend(v18, "pk_decodeHexadecimal");
      amountHash = v4->_amountHash;
      v4->_amountHash = (NSData *)v19;

      uint64_t v21 = [v6 PKStringForKey:@"signature"];

      signature = v4->_signature;
      v4->_signature = (NSString *)v21;
    }
    else
    {
      signature = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(signature, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138543618;
        v30 = v24;
        __int16 v31 = 2114;
        v32 = v26;
        _os_log_impl(&dword_190E10000, signature, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (BOOL)amountHashIsValidForAmount:(id)a3 andCurrency:(id)a4
{
  if (!self->_amountHash) {
    return 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = PKMutableNumberFormatterForCurrencyCodeExcludingCurrencySymbols(v6);
  uint64_t v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v8 setLocale:v9];

  uint64_t v10 = [v8 stringFromNumber:v7];

  v11 = [NSString stringWithFormat:@"%@%@%@", self->_transactionIdentifier, v10, v6];

  uint64_t v12 = [v11 dataUsingEncoding:4];
  v13 = [v12 SHA256Hash];

  if (v13) {
    BOOL v14 = [(NSData *)self->_amountHash isEqualToData:v13];
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSString)recurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSData)amountHash
{
  return self->_amountHash;
}

- (NSString)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_amountHash, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
}

@end