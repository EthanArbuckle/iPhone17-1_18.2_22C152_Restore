@interface PKPeerPaymentTermsAcceptanceResponse
- (BOOL)hasTermsData;
- (NSString)termsIdentifier;
- (NSURL)termsURL;
- (PKPeerPaymentTermsAcceptanceResponse)initWithData:(id)a3;
@end

@implementation PKPeerPaymentTermsAcceptanceResponse

- (PKPeerPaymentTermsAcceptanceResponse)initWithData:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentTermsAcceptanceResponse;
  v3 = [(PKWebServiceResponse *)&v12 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      uint64_t v7 = [v6 PKStringForKey:@"termsIdentifier"];
      termsIdentifier = v4->_termsIdentifier;
      v4->_termsIdentifier = (NSString *)v7;

      uint64_t v9 = [v6 PKURLForKey:@"termsURL"];

      termsURL = v4->_termsURL;
      v4->_termsURL = (NSURL *)v9;
    }
  }
  return v4;
}

- (BOOL)hasTermsData
{
  NSUInteger v3 = [(NSString *)self->_termsIdentifier length];
  if (v3) {
    LOBYTE(v3) = self->_termsURL != 0;
  }
  return v3;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
}

@end