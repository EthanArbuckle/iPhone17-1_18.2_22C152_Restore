@interface PKAMPCardRegistrationResponse
+ (BOOL)supportsSecureCoding;
- (NSData)cardData;
- (NSError)error;
- (NSURL)brokerURL;
- (NSURL)paymentServicesURL;
- (PKAMPCardRegistrationResponse)initWithCardData:(id)a3 brokerURL:(id)a4 paymentServicesURL:(id)a5 error:(id)a6;
- (PKAMPCardRegistrationResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBrokerURL:(id)a3;
- (void)setCardData:(id)a3;
- (void)setError:(id)a3;
- (void)setPaymentServicesURL:(id)a3;
@end

@implementation PKAMPCardRegistrationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAMPCardRegistrationResponse)initWithCardData:(id)a3 brokerURL:(id)a4 paymentServicesURL:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKAMPCardRegistrationResponse;
  v15 = [(PKAMPCardRegistrationResponse *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_cardData, a3);
    objc_storeStrong((id *)&v16->_brokerURL, a4);
    objc_storeStrong((id *)&v16->_paymentServicesURL, a5);
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (PKAMPCardRegistrationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAMPCardRegistrationResponse;
  v5 = [(PKAMPCardRegistrationResponse *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardDataKey"];
    cardData = v5->_cardData;
    v5->_cardData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brokerURLKey"];
    brokerURL = v5->_brokerURL;
    v5->_brokerURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentServicesURLKey"];
    paymentServicesURL = v5->_paymentServicesURL;
    v5->_paymentServicesURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorKey"];
    error = v5->_error;
    v5->_error = (NSError *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  cardData = self->_cardData;
  id v5 = a3;
  [v5 encodeObject:cardData forKey:@"cardDataKey"];
  [v5 encodeObject:self->_brokerURL forKey:@"brokerURLKey"];
  [v5 encodeObject:self->_paymentServicesURL forKey:@"paymentServicesURLKey"];
  [v5 encodeObject:self->_error forKey:@"errorKey"];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; cardData: %d bytes; brokerURL: %@; paymentServicesURL: %@; error: %@>",
               objc_opt_class(),
               self,
               [(NSData *)self->_cardData length],
               self->_brokerURL,
               self->_paymentServicesURL,
               self->_error);
}

- (NSData)cardData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCardData:(id)a3
{
}

- (NSURL)brokerURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBrokerURL:(id)a3
{
}

- (NSURL)paymentServicesURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPaymentServicesURL:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_paymentServicesURL, 0);
  objc_storeStrong((id *)&self->_brokerURL, 0);
  objc_storeStrong((id *)&self->_cardData, 0);
}

@end