@interface PKAccountWebServiceAccountResponse
- (NSArray)physicalCards;
- (PKAccount)account;
- (PKAccountWebServiceAccountResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceAccountResponse

- (PKAccountWebServiceAccountResponse)initWithData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PKAccountWebServiceAccountResponse;
  v3 = [(PKWebServiceResponse *)&v18 initWithData:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      __int16 v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  v6 = [[PKAccount alloc] initWithDictionary:v5];
  account = v4->_account;
  v4->_account = v6;

  v8 = [v5 objectForKeyedSubscript:@"extendedAccountDetails"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
  }
  v9 = [v8 PKArrayContaining:objc_opt_class() forKey:@"physicalCards"];
  uint64_t v10 = objc_msgSend(v9, "pk_arrayByApplyingBlock:", &__block_literal_global_102);
  physicalCards = v4->_physicalCards;
  v4->_physicalCards = (NSArray *)v10;

LABEL_6:
  v12 = v4;
LABEL_10:

  return v12;
}

PKPhysicalCard *__51__PKAccountWebServiceAccountResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPhysicalCard alloc] initWithDictionary:v2];

  return v3;
}

- (PKAccount)account
{
  return self->_account;
}

- (NSArray)physicalCards
{
  return self->_physicalCards;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end