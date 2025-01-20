@interface PKPaymentOfferActionResult
+ (BOOL)supportsSecureCoding;
+ (id)paymentOfferActionResultFromQueryItems:(id)a3;
- (NSString)provisioningCredentialIdentifier;
- (NSString)sessionIdentifier;
- (NSURL)provisioningCardIconURL;
- (PKPaymentOfferActionResult)initWithCoder:(id)a3;
- (PKPaymentOfferActionResult)initWithSessionIdentifier:(id)a3 provisioningCredentialIdentifier:(id)a4 provisioningCardIconURL:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferActionResult

- (PKPaymentOfferActionResult)initWithSessionIdentifier:(id)a3 provisioningCredentialIdentifier:(id)a4 provisioningCardIconURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentOfferActionResult;
  v11 = [(PKPaymentOfferActionResult *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    sessionIdentifier = v11->_sessionIdentifier;
    v11->_sessionIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    provisioningCredentialIdentifier = v11->_provisioningCredentialIdentifier;
    v11->_provisioningCredentialIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    provisioningCardIconURL = v11->_provisioningCardIconURL;
    v11->_provisioningCardIconURL = (NSURL *)v16;
  }
  return v11;
}

+ (id)paymentOfferActionResultFromQueryItems:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_80);
  v6 = [v5 value];

  v7 = objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_21_1);
  id v8 = [v7 value];

  id v9 = objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_23);

  id v10 = [v9 value];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
    if (v6)
    {
LABEL_3:
      uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithSessionIdentifier:v6 provisioningCredentialIdentifier:v8 provisioningCardIconURL:v11];
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:

  return v12;
}

uint64_t __69__PKPaymentOfferActionResult_paymentOfferActionResultFromQueryItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  v3 = v2;
  if (v2 == @"sessionIdentifier")
  {
    uint64_t v4 = 1;
  }
  else if (v2)
  {
    uint64_t v4 = [(__CFString *)v2 isEqualToString:@"sessionIdentifier"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __69__PKPaymentOfferActionResult_paymentOfferActionResultFromQueryItems___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  v3 = v2;
  if (v2 == @"provisioningCredentialIdentifier")
  {
    uint64_t v4 = 1;
  }
  else if (v2)
  {
    uint64_t v4 = [(__CFString *)v2 isEqualToString:@"provisioningCredentialIdentifier"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __69__PKPaymentOfferActionResult_paymentOfferActionResultFromQueryItems___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  v3 = v2;
  if (v2 == @"provisioningCardIconURL")
  {
    uint64_t v4 = 1;
  }
  else if (v2)
  {
    uint64_t v4 = [(__CFString *)v2 isEqualToString:@"provisioningCardIconURL"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferActionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferActionResult;
  v5 = [(PKPaymentOfferActionResult *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningCredentialIdentifier"];
    provisioningCredentialIdentifier = v5->_provisioningCredentialIdentifier;
    v5->_provisioningCredentialIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningCardIconURL"];
    provisioningCardIconURL = v5->_provisioningCardIconURL;
    v5->_provisioningCardIconURL = (NSURL *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:sessionIdentifier forKey:@"sessionIdentifier"];
  [v5 encodeObject:self->_provisioningCredentialIdentifier forKey:@"provisioningCredentialIdentifier"];
  [v5 encodeObject:self->_provisioningCardIconURL forKey:@"provisioningCardIconURL"];
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)provisioningCredentialIdentifier
{
  return self->_provisioningCredentialIdentifier;
}

- (NSURL)provisioningCardIconURL
{
  return self->_provisioningCardIconURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningCardIconURL, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end