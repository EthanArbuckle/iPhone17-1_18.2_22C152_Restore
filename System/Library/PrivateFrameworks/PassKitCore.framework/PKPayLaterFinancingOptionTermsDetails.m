@interface PKPayLaterFinancingOptionTermsDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)installmentAgreementIdentifier;
- (NSString)riskPricingAgreementIdentifier;
- (NSString)termsIdentifier;
- (NSURL)termsURL;
- (PKPayLaterFinancingOptionTermsDetails)initWithCoder:(id)a3;
- (PKPayLaterFinancingOptionTermsDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInstallmentAgreementIdentifier:(id)a3;
- (void)setRiskPricingAgreementIdentifier:(id)a3;
- (void)setTermsIdentifier:(id)a3;
- (void)setTermsURL:(id)a3;
@end

@implementation PKPayLaterFinancingOptionTermsDetails

- (PKPayLaterFinancingOptionTermsDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFinancingOptionTermsDetails;
  v5 = [(PKPayLaterFinancingOptionTermsDetails *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 PKURLForKey:@"termsURL"];
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"installmentAgreementIdentifier"];
    installmentAgreementIdentifier = v5->_installmentAgreementIdentifier;
    v5->_installmentAgreementIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"riskPricingAgreementIdentifier"];
    riskPricingAgreementIdentifier = v5->_riskPricingAgreementIdentifier;
    v5->_riskPricingAgreementIdentifier = (NSString *)v12;
  }
  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_termsIdentifier];
  [v3 safelyAddObject:self->_termsURL];
  [v3 safelyAddObject:self->_installmentAgreementIdentifier];
  [v3 safelyAddObject:self->_riskPricingAgreementIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPayLaterFinancingOptionTermsDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        termsIdentifier = self->_termsIdentifier;
        uint64_t v8 = v6->_termsIdentifier;
        if (termsIdentifier && v8)
        {
          if ((-[NSString isEqual:](termsIdentifier, "isEqual:") & 1) == 0) {
            goto LABEL_23;
          }
        }
        else if (termsIdentifier != v8)
        {
          goto LABEL_23;
        }
        termsURL = self->_termsURL;
        v11 = v6->_termsURL;
        if (termsURL && v11)
        {
          if ((-[NSURL isEqual:](termsURL, "isEqual:") & 1) == 0) {
            goto LABEL_23;
          }
        }
        else if (termsURL != v11)
        {
          goto LABEL_23;
        }
        installmentAgreementIdentifier = self->_installmentAgreementIdentifier;
        v13 = v6->_installmentAgreementIdentifier;
        if (installmentAgreementIdentifier && v13)
        {
          if (-[NSString isEqual:](installmentAgreementIdentifier, "isEqual:"))
          {
LABEL_19:
            riskPricingAgreementIdentifier = self->_riskPricingAgreementIdentifier;
            objc_super v15 = v6->_riskPricingAgreementIdentifier;
            if (riskPricingAgreementIdentifier && v15) {
              char v9 = -[NSString isEqual:](riskPricingAgreementIdentifier, "isEqual:");
            }
            else {
              char v9 = riskPricingAgreementIdentifier == v15;
            }
            goto LABEL_24;
          }
        }
        else if (installmentAgreementIdentifier == v13)
        {
          goto LABEL_19;
        }
LABEL_23:
        char v9 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    char v9 = 0;
  }
LABEL_25:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingOptionTermsDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFinancingOptionTermsDetails;
  v5 = [(PKPayLaterFinancingOptionTermsDetails *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsURL"];
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentAgreementIdentifier"];
    installmentAgreementIdentifier = v5->_installmentAgreementIdentifier;
    v5->_installmentAgreementIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"riskPricingAgreementIdentifier"];
    riskPricingAgreementIdentifier = v5->_riskPricingAgreementIdentifier;
    v5->_riskPricingAgreementIdentifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  termsIdentifier = self->_termsIdentifier;
  id v5 = a3;
  [v5 encodeObject:termsIdentifier forKey:@"termsIdentifier"];
  [v5 encodeObject:self->_termsURL forKey:@"termsURL"];
  [v5 encodeObject:self->_installmentAgreementIdentifier forKey:@"installmentAgreementIdentifier"];
  [v5 encodeObject:self->_riskPricingAgreementIdentifier forKey:@"riskPricingAgreementIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_termsIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSURL *)self->_termsURL copyWithZone:a3];
  char v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_installmentAgreementIdentifier copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_riskPricingAgreementIdentifier copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"termsIdentifier: '%@'; ", self->_termsIdentifier];
  [v3 appendFormat:@"termsURL: '%@'; ", self->_termsURL];
  objc_msgSend(v3, "appendFormat:", @"installmentAgreementIdentifier: '%@'; ",
    self->_installmentAgreementIdentifier);
  objc_msgSend(v3, "appendFormat:", @"riskPricingAgreementIdentifier: '%@'; ",
    self->_riskPricingAgreementIdentifier);
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
}

- (NSString)installmentAgreementIdentifier
{
  return self->_installmentAgreementIdentifier;
}

- (void)setInstallmentAgreementIdentifier:(id)a3
{
}

- (NSString)riskPricingAgreementIdentifier
{
  return self->_riskPricingAgreementIdentifier;
}

- (void)setRiskPricingAgreementIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_riskPricingAgreementIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentAgreementIdentifier, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
}

@end