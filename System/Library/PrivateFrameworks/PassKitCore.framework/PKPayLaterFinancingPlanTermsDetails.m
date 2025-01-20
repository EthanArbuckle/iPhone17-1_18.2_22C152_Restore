@interface PKPayLaterFinancingPlanTermsDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)installmentAgreementIdentifier;
- (PKPayLaterFinancingPlanTermsDetails)initWithCoder:(id)a3;
- (PKPayLaterFinancingPlanTermsDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInstallmentAgreementIdentifier:(id)a3;
@end

@implementation PKPayLaterFinancingPlanTermsDetails

- (PKPayLaterFinancingPlanTermsDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingPlanTermsDetails;
  v5 = [(PKPayLaterFinancingPlanTermsDetails *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"installmentAgreementIdentifier"];
    installmentAgreementIdentifier = v5->_installmentAgreementIdentifier;
    v5->_installmentAgreementIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_installmentAgreementIdentifier forKeyedSubscript:@"installmentAgreementIdentifier"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_installmentAgreementIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPayLaterFinancingPlanTermsDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    installmentAgreementIdentifier = self->_installmentAgreementIdentifier;
    v7 = v5->_installmentAgreementIdentifier;
    if (installmentAgreementIdentifier && v7) {
      char v8 = -[NSString isEqual:](installmentAgreementIdentifier, "isEqual:");
    }
    else {
      char v8 = installmentAgreementIdentifier == v7;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlanTermsDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingPlanTermsDetails;
  v5 = [(PKPayLaterFinancingPlanTermsDetails *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentAgreementIdentifier"];
    installmentAgreementIdentifier = v5->_installmentAgreementIdentifier;
    v5->_installmentAgreementIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_installmentAgreementIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"installmentAgreementIdentifier: '%@'; ",
    self->_installmentAgreementIdentifier);
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)installmentAgreementIdentifier
{
  return self->_installmentAgreementIdentifier;
}

- (void)setInstallmentAgreementIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end