@interface PKPaymentOrderDetails
+ (BOOL)supportsSecureCoding;
- (NSString)authenticationToken;
- (NSString)orderIdentifier;
- (NSString)orderTypeIdentifier;
- (NSURL)webServiceURL;
- (PKPaymentOrderDetails)initWithCoder:(id)a3;
- (PKPaymentOrderDetails)initWithOrderTypeIdentifier:(NSString *)orderTypeIdentifier orderIdentifier:(NSString *)orderIdentifier webServiceURL:(NSURL *)webServiceURL authenticationToken:(NSString *)authenticationToken;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationToken:(NSString *)authenticationToken;
- (void)setOrderIdentifier:(NSString *)orderIdentifier;
- (void)setOrderTypeIdentifier:(NSString *)orderTypeIdentifier;
- (void)setWebServiceURL:(NSURL *)webServiceURL;
@end

@implementation PKPaymentOrderDetails

- (PKPaymentOrderDetails)initWithOrderTypeIdentifier:(NSString *)orderTypeIdentifier orderIdentifier:(NSString *)orderIdentifier webServiceURL:(NSURL *)webServiceURL authenticationToken:(NSString *)authenticationToken
{
  v10 = orderTypeIdentifier;
  v11 = orderIdentifier;
  v12 = webServiceURL;
  v13 = authenticationToken;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentOrderDetails;
  v14 = [(PKPaymentOrderDetails *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [(NSString *)v10 copy];
    v16 = v14->_orderTypeIdentifier;
    v14->_orderTypeIdentifier = (NSString *)v15;

    uint64_t v17 = [(NSString *)v11 copy];
    v18 = v14->_orderIdentifier;
    v14->_orderIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_webServiceURL, webServiceURL);
    uint64_t v19 = [(NSString *)v13 copy];
    v20 = v14->_authenticationToken;
    v14->_authenticationToken = (NSString *)v19;
  }
  return v14;
}

- (PKPaymentOrderDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentOrderDetails;
  v5 = [(PKPaymentOrderDetails *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orderTypeIdentifier"];
    orderTypeIdentifier = v5->_orderTypeIdentifier;
    v5->_orderTypeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orderIdentifier"];
    orderIdentifier = v5->_orderIdentifier;
    v5->_orderIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webServiceURL"];
    webServiceURL = v5->_webServiceURL;
    v5->_webServiceURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationToken"];
    authenticationToken = v5->_authenticationToken;
    v5->_authenticationToken = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  orderTypeIdentifier = self->_orderTypeIdentifier;
  id v5 = a3;
  [v5 encodeObject:orderTypeIdentifier forKey:@"orderTypeIdentifier"];
  [v5 encodeObject:self->_orderIdentifier forKey:@"orderIdentifier"];
  [v5 encodeObject:self->_webServiceURL forKey:@"webServiceURL"];
  [v5 encodeObject:self->_authenticationToken forKey:@"authenticationToken"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)orderTypeIdentifier
{
  return self->_orderTypeIdentifier;
}

- (void)setOrderTypeIdentifier:(NSString *)orderTypeIdentifier
{
}

- (NSString)orderIdentifier
{
  return self->_orderIdentifier;
}

- (void)setOrderIdentifier:(NSString *)orderIdentifier
{
}

- (NSURL)webServiceURL
{
  return self->_webServiceURL;
}

- (void)setWebServiceURL:(NSURL *)webServiceURL
{
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(NSString *)authenticationToken
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_webServiceURL, 0);
  objc_storeStrong((id *)&self->_orderIdentifier, 0);
  objc_storeStrong((id *)&self->_orderTypeIdentifier, 0);
}

@end