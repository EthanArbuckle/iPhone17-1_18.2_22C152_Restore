@interface PKPaymentAvailableProductsRequest
+ (BOOL)supportsSecureCoding;
- (NSString)preferredLanguage;
- (PKPaymentAvailableProductsRequest)initWithCoder:(id)a3;
- (PKPaymentAvailableProductsRequest)initWithPreferredLanguage:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (int64_t)context;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(int64_t)a3;
@end

@implementation PKPaymentAvailableProductsRequest

- (PKPaymentAvailableProductsRequest)initWithPreferredLanguage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAvailableProductsRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_preferredLanguage, a3);
  }

  return v7;
}

- (PKPaymentAvailableProductsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAvailableProductsRequest;
  id v5 = [(PKOverlayableWebServiceRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredLanguage"];
    preferredLanguage = v5->_preferredLanguage;
    v5->_preferredLanguage = (NSString *)v6;

    v5->_context = [v4 decodeIntegerForKey:@"context"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAvailableProductsRequest;
  id v4 = a3;
  [(PKOverlayableWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredLanguage, @"preferredLanguage", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_context forKey:@"context"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  unint64_t v11 = [(PKWebServiceRequest *)self cachePolicyOverride];
  if (v11 == 4 || v11 == 1) {
    [(PKWebServiceRequest *)self addDiagnosticReason:@"Ignoring cache"];
  }
  v26[0] = @"devices";
  v26[1] = v8;
  v26[2] = @"products";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  v13 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v10 version:@"4" endpointComponents:v12 queryParameters:0 appleAccountInformation:v9];

  if (self->_preferredLanguage)
  {
    v14 = [v13 valueForHTTPHeaderField:@"Accept-Language"];
    preferredLanguage = self->_preferredLanguage;
    v16 = v14;
    v17 = preferredLanguage;
    if (v16 == v17)
    {
    }
    else
    {
      v18 = v17;
      if (v16 && v17)
      {
        BOOL v19 = [(NSString *)v16 isEqualToString:v17];

        if (v19) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      [v13 setValue:self->_preferredLanguage forHTTPHeaderField:@"Accept-Language"];
    }
LABEL_13:
  }
  int64_t context = self->_context;
  if (PKPreferenceBOOLforKey(@"PKDoNotSendProductsContextKey"))
  {
    v21 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v25[0] = 0;
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "PKDoNotSendProductsContextKey set so skipping passed in context value", (uint8_t *)v25, 2u);
    }

LABEL_20:
    [v13 setHTTPMethod:@"GET"];
    goto LABEL_21;
  }
  if (context != 1)
  {
    if (context) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  [v13 setHTTPMethod:@"POST"];
  v24 = [(id)objc_opt_class() _HTTPBodyWithDictionary:&unk_1EE22DBE0];
  [v13 setHTTPBody:v24];

LABEL_21:
  v22 = (void *)[v13 copy];

  return v22;
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_int64_t context = a3;
}

- (void).cxx_destruct
{
}

@end