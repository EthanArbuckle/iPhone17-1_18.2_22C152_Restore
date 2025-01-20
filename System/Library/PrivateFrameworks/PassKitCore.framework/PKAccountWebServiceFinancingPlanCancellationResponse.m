@interface PKAccountWebServiceFinancingPlanCancellationResponse
+ (BOOL)jsonDataOptional;
- (PKAccount)account;
- (PKAccountWebServiceFinancingPlanCancellationResponse)initWithData:(id)a3;
- (PKPayLaterFinancingPlan)financingPlan;
@end

@implementation PKAccountWebServiceFinancingPlanCancellationResponse

- (PKAccountWebServiceFinancingPlanCancellationResponse)initWithData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PKAccountWebServiceFinancingPlanCancellationResponse;
  v3 = [(PKWebServiceResponse *)&v19 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_8:
    v12 = v4;
    goto LABEL_12;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 objectForKey:@"financingPlan"];
    if ([v6 count])
    {
      v7 = [[PKPayLaterFinancingPlan alloc] initWithDictionary:v6];
      financingPlan = v4->_financingPlan;
      v4->_financingPlan = v7;
    }
    v9 = [v5 objectForKey:@"account"];
    if ([v9 count])
    {
      v10 = [[PKAccount alloc] initWithDictionary:v9];
      account = v4->_account;
      v4->_account = v10;
    }
    goto LABEL_8;
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
LABEL_12:

  return v12;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

- (PKAccount)account
{
  return self->_account;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end