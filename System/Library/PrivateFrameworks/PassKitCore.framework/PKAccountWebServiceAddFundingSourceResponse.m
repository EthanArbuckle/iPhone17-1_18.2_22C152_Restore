@interface PKAccountWebServiceAddFundingSourceResponse
- (PKAccountPaymentFundingSource)fundingSource;
- (PKAccountWebServiceAddFundingSourceResponse)initWithData:(id)a3;
- (PKApplyVerificationPage)confirmationPage;
@end

@implementation PKAccountWebServiceAddFundingSourceResponse

- (PKAccountWebServiceAddFundingSourceResponse)initWithData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PKAccountWebServiceAddFundingSourceResponse;
  v3 = [(PKWebServiceResponse *)&v19 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_6:
    v12 = v4;
    goto LABEL_10;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 objectForKey:@"confirmationPage"];
    if ([v7 count])
    {
      v8 = [[PKApplyVerificationPage alloc] initWithDictonary:v7];
      confirmationPage = v4->_confirmationPage;
      v4->_confirmationPage = v8;
    }
    v10 = [[PKAccountPaymentFundingSource alloc] initWithDictionary:v6];

    fundingSource = v4->_fundingSource;
    v4->_fundingSource = v10;

    goto LABEL_6;
  }
  v13 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    __int16 v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (PKApplyVerificationPage)confirmationPage
{
  return self->_confirmationPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationPage, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
}

@end