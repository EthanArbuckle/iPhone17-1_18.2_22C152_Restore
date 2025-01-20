@interface PKPaymentCommonAvailableProductsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isStatic;
- (NSString)preferredLanguage;
- (NSURL)contentURL;
- (PKPaymentCommonAvailableProductsRequest)initWithCoder:(id)a3;
- (PKPaymentCommonAvailableProductsRequest)initWithContentURL:(id)a3;
- (PKPaymentCommonAvailableProductsRequest)initWithContentURL:(id)a3 preferredLanguage:(id)a4;
- (id)_urlRequest;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentCommonAvailableProductsRequest

- (PKPaymentCommonAvailableProductsRequest)initWithContentURL:(id)a3
{
  return [(PKPaymentCommonAvailableProductsRequest *)self initWithContentURL:a3 preferredLanguage:0];
}

- (PKPaymentCommonAvailableProductsRequest)initWithContentURL:(id)a3 preferredLanguage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentCommonAvailableProductsRequest;
  v9 = [(PKOverlayableWebServiceRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentURL, a3);
    objc_storeStrong((id *)&v10->_preferredLanguage, a4);
  }

  return v10;
}

- (BOOL)isStatic
{
  return 1;
}

- (id)_urlRequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PKPaymentWebServiceRequest *)self targetDevice];
  v5 = [v4 deviceRegion];
  [v3 setObject:v5 forKeyedSubscript:@"region"];

  v6 = [(PKPaymentCommonAvailableProductsRequest *)self preferredLanguage];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA20], "pk_deviceLanguage");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  [v3 setObject:v9 forKeyedSubscript:@"locale"];
  v10 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:self->_contentURL version:@"4" endpointComponents:&unk_1EE22B1C8 queryParameters:v3 appleAccountInformation:0];
  [v10 setHTTPMethod:@"GET"];
  [v10 setValue:v9 forHTTPHeaderField:@"Accept-Language"];
  v11 = (void *)[v10 copy];

  return v11;
}

- (PKPaymentCommonAvailableProductsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentURL"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredLanguage"];

  if (v5)
  {
    self = [(PKPaymentCommonAvailableProductsRequest *)self initWithContentURL:v5 preferredLanguage:v6];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentCommonAvailableProductsRequest;
  id v4 = a3;
  [(PKOverlayableWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredLanguage, @"preferredLanguage", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_contentURL forKey:@"contentURL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
}

@end