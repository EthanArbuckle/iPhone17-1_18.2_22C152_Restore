@interface PKAccountWebServiceAccountUsersResponse
- (NSDate)lastUpdated;
- (NSSet)users;
- (PKAccountWebServiceAccountUsersResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceAccountUsersResponse

- (PKAccountWebServiceAccountUsersResponse)initWithData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PKAccountWebServiceAccountUsersResponse;
  v3 = [(PKWebServiceResponse *)&v18 initWithData:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 PKSetContaining:objc_opt_class() forKey:@"users"];
    uint64_t v7 = objc_msgSend(v6, "pk_setByApplyingBlock:", &__block_literal_global_663);
    users = v4->_users;
    v4->_users = (NSSet *)v7;

    uint64_t v9 = [v5 PKDateForKey:@"lastUpdated"];
    lastUpdated = v4->_lastUpdated;
    v4->_lastUpdated = (NSDate *)v9;

LABEL_4:
    v11 = v4;
    goto LABEL_8;
  }
  v12 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

PKAccountUser *__56__PKAccountWebServiceAccountUsersResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKAccountUser alloc] initWithDictionary:v2];

  return v3;
}

- (NSSet)users
{
  return self->_users;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_users, 0);
}

@end