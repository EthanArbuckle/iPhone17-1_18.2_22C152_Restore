@interface PKApplyWebServiceAugmentedProductRequest
+ (BOOL)supportsSecureCoding;
- (PKApplyWebServiceAugmentedProductRequest)initWithCoder:(id)a3;
- (PKPaymentInstallmentConfiguration)installmentConfiguration;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setInstallmentConfiguration:(id)a3;
@end

@implementation PKApplyWebServiceAugmentedProductRequest

- (PKApplyWebServiceAugmentedProductRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyWebServiceAugmentedProductRequest;
  v5 = [(PKApplyWebServiceRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentConfiguration"];
    installmentConfiguration = v5->_installmentConfiguration;
    v5->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceAugmentedProductRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentConfiguration, @"installmentConfiguration", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      objc_super v9 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:&unk_1EE22AC40 queryParameters:0 appleAccountInformation:v7];
      [v9 setHTTPMethod:@"POST"];
      [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      v10 = [(PKApplyWebServiceRequest *)self _createMutableBody];
      v11 = v10;
      if (self->_installmentConfiguration)
      {
        [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isInstallment"];
        v12 = PKInstallmentRetailChannelToString([(PKPaymentInstallmentConfiguration *)self->_installmentConfiguration retailChannel]);
        [v11 setObject:v12 forKeyedSubscript:@"installmentChannel"];
      }
      else
      {
        [v10 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"isInstallment"];
      }
      v18 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v11];
      [v9 setHTTPBody:v18];

      v17 = (void *)[v9 copy];
      goto LABEL_13;
    }
    v13 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v16);
      int v20 = 138543618;
      v21 = v15;
      __int16 v22 = 2082;
      v23 = "appleAccountInformation";
      goto LABEL_9;
    }
  }
  else
  {
    v13 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      int v20 = 138543618;
      v21 = v15;
      __int16 v22 = 2082;
      v23 = "url";
LABEL_9:
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v20, 0x16u);
    }
  }

  v17 = 0;
LABEL_13:

  return v17;
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end