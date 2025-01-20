@interface PKPeerPaymentRequestTokenRequest
- (NSDecimalNumber)amount;
- (NSString)currency;
- (NSString)recipientIdentifier;
- (NSString)recipientPhoneOrEmail;
- (NSString)senderAddress;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8;
- (unint64_t)source;
- (void)setAmount:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setRecipientPhoneOrEmail:(id)a3;
- (void)setSenderAddress:(id)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation PKPeerPaymentRequestTokenRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = v19;
  if (!v14)
  {
    v29 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    __int16 v49 = 2082;
    v50 = "url";
LABEL_33:
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_34;
  }
  if (!v15)
  {
    v29 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    v32 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v32);
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    __int16 v49 = 2082;
    v50 = "appleAccountInformation";
    goto LABEL_33;
  }
  if (!v16)
  {
    v29 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    v33 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v33);
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    __int16 v49 = 2082;
    v50 = "deviceIdentifier";
    goto LABEL_33;
  }
  if (!v19)
  {
    v29 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    v34 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v34);
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    __int16 v49 = 2082;
    v50 = "deviceMetadata";
    goto LABEL_33;
  }
  if (!self->_recipientIdentifier)
  {
    v29 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    v35 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v35);
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    __int16 v49 = 2082;
    v50 = "_recipientIdentifier";
    goto LABEL_33;
  }
  if (!self->_amount)
  {
    v29 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    v36 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v36);
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    __int16 v49 = 2082;
    v50 = "_amount";
    goto LABEL_33;
  }
  if (!self->_currency)
  {
    v29 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    v37 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v37);
    *(_DWORD *)buf = 138543618;
    v48 = v31;
    __int16 v49 = 2082;
    v50 = "_currency";
    goto LABEL_33;
  }
  if (!self->_senderAddress)
  {
    v29 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138543618;
      v48 = v31;
      __int16 v49 = 2082;
      v50 = "_senderAddress";
      goto LABEL_33;
    }
LABEL_34:

    v39 = 0;
    goto LABEL_35;
  }
  v21 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v14 endpointComponents:&unk_1EE22B528 queryParameters:0 appleAccountInformation:v15];
  [v21 setHTTPMethod:@"POST"];
  v46 = v21;
  [v21 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v22 = [MEMORY[0x1E4F1CA60] dictionary];
  [v22 setObject:v16 forKey:@"deviceIdentifier"];
  recipientIdentifier = self->_recipientIdentifier;
  if (recipientIdentifier) {
    [v22 setObject:recipientIdentifier forKey:@"recipientIdentifier"];
  }
  amount = self->_amount;
  if (amount)
  {
    v25 = [(NSDecimalNumber *)amount stringValue];
    [v22 setObject:v25 forKey:@"amount"];
  }
  currency = self->_currency;
  if (currency) {
    [v22 setObject:currency forKey:@"currency"];
  }
  unint64_t v27 = self->_source - 1;
  if (v27 > 2) {
    v28 = @"unknown";
  }
  else {
    v28 = off_1E56F5680[v27];
  }
  [v22 setObject:v28 forKey:@"source"];
  senderAddress = self->_senderAddress;
  if (senderAddress)
  {
    v42 = PKIDSNormalizedAddress(senderAddress);
    if (v42) {
      [v22 setObject:v42 forKey:@"senderAddress"];
    }
  }
  if (v17)
  {
    v43 = [v17 hexEncoding];
    [v22 setObject:v43 forKey:@"deviceScore"];
  }
  if (v18) {
    [v22 setObject:v18 forKey:@"odiAssessment"];
  }
  v44 = [v20 dictionaryRepresentation];
  [v22 setObject:v44 forKey:@"deviceMetadata"];

  v45 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v22];
  [v46 setHTTPBody:v45];

  v39 = (void *)[v46 copy];
LABEL_35:

  return v39;
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (NSString)recipientPhoneOrEmail
{
  return self->_recipientPhoneOrEmail;
}

- (void)setRecipientPhoneOrEmail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientPhoneOrEmail, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
}

@end