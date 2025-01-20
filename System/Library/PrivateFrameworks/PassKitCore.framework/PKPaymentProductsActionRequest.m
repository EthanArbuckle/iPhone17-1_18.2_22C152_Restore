@interface PKPaymentProductsActionRequest
+ (BOOL)supportsSecureCoding;
- (NSString)action;
- (NSString)productIdentifier;
- (PKPaymentProductsActionRequest)initWithCoder:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
- (void)setProductIdentifier:(id)a3;
@end

@implementation PKPaymentProductsActionRequest

- (PKPaymentProductsActionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentProductsActionRequest;
  v5 = [(PKOverlayableWebServiceRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productIdentifier"];
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProductsActionRequest;
  id v4 = a3;
  [(PKOverlayableWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_action, @"action", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_productIdentifier forKey:@"productIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  productIdentifier = self->_productIdentifier;
  if (productIdentifier && v9 && self->_action)
  {
    v23[0] = @"devices";
    v23[1] = v9;
    v23[2] = @"products";
    v23[3] = productIdentifier;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    v13 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v8 endpointComponents:v12 queryParameters:0 appleAccountInformation:v10];

    [v13 setHTTPMethod:@"POST"];
    v14 = objc_opt_class();
    action = self->_action;
    v21 = @"action";
    v22 = action;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v17 = [v14 _HTTPBodyWithDictionary:v16];
    [v13 setHTTPBody:v17];
  }
  else
  {
    v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Missing values requied for request: %@", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end