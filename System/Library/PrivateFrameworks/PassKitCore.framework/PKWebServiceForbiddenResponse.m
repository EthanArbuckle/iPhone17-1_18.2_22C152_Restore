@interface PKWebServiceForbiddenResponse
- (NSNumber)errorCode;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (PKWebServiceForbiddenResponse)initWithData:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation PKWebServiceForbiddenResponse

- (PKWebServiceForbiddenResponse)initWithData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PKWebServiceForbiddenResponse;
  v3 = [(PKWebServiceResponse *)&v18 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 PKStringForKey:@"errorCode"];
      v7 = v6;
      if (v6) {
        objc_msgSend(NSNumber, "numberWithInteger:", -[PKWebServiceForbiddenResponse integerValue](v6, "integerValue"));
      }
      else {
      v13 = [v5 PKNumberForKey:@"errorCode"];
      }
      objc_storeStrong((id *)&v4->_errorCode, v13);

      uint64_t v14 = [v5 PKStringForKey:@"localizedTitle"];
      localizedTitle = v4->_localizedTitle;
      v4->_localizedTitle = (NSString *)v14;

      uint64_t v16 = [v5 PKStringForKey:@"localizedDescription"];
      localizedDescription = v4->_localizedDescription;
      v4->_localizedDescription = (NSString *)v16;
    }
    else
    {
      localizedDescription = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(localizedDescription, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v11 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v10;
        __int16 v21 = 2112;
        v22 = v11;
        id v12 = v11;
        _os_log_impl(&dword_190E10000, localizedDescription, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v7 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end