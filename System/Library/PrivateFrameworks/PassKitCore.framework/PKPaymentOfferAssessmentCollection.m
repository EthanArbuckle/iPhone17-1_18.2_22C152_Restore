@interface PKPaymentOfferAssessmentCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)sessionIdentifier;
- (PKPaymentOfferAssessmentCollection)initWithCoder:(id)a3;
- (PKPaymentOfferAssessmentCollection)initWithDictionary:(id)a3;
- (PKPaymentOfferInstallmentAssessment)installmentAssessment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)selectedPaymentOfferWithCriteriaIdentifier:(id)a3 paymentPass:(id)a4 sessionIdentifier:(id)a5 previousSelectedOfferIdentifier:(id)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)populateChallenge:(id)a3 verifier:(id)a4;
- (void)populatePreferredLanguage:(id)a3;
- (void)setInstallmentAssessment:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation PKPaymentOfferAssessmentCollection

- (PKPaymentOfferAssessmentCollection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentOfferAssessmentCollection;
  v5 = [(PKPaymentOfferAssessmentCollection *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    v8 = [v4 PKDictionaryForKey:@"installmentAssessment"];
    if ([v8 count])
    {
      v9 = [[PKPaymentOfferInstallmentAssessment alloc] initWithDictionary:v8 sessionIdentifier:v5->_sessionIdentifier];
      installmentAssessment = v5->_installmentAssessment;
      v5->_installmentAssessment = v9;
    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_sessionIdentifier forKeyedSubscript:@"sessionIdentifier"];
  id v4 = [(PKPaymentOfferInstallmentAssessment *)self->_installmentAssessment dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"installmentAssessment"];

  v5 = (void *)[v3 copy];
  return v5;
}

- (id)selectedPaymentOfferWithCriteriaIdentifier:(id)a3 paymentPass:(id)a4 sessionIdentifier:(id)a5 previousSelectedOfferIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = 0;
  if (v11)
  {
    installmentAssessment = self->_installmentAssessment;
    if (installmentAssessment)
    {
      v16 = [(PKPaymentOfferInstallmentAssessment *)installmentAssessment selectedOfferIdentifier];
      uint64_t v17 = [(PKPaymentOfferInstallmentAssessment *)self->_installmentAssessment installmentOfferWithIdentifier:v16];
      v18 = (void *)v17;
      if (v13 && !v17)
      {
        v18 = [(PKPaymentOfferInstallmentAssessment *)self->_installmentAssessment installmentOfferWithIdentifier:v13];
        id v19 = v13;

        v16 = v19;
      }
      if (v18)
      {
        v14 = [[PKSelectedPaymentOfferInstallment alloc] initWithInstallmentAssessment:self->_installmentAssessment selectedOfferIdentifier:v16 criteriaIdentifier:v10 paymentPass:v11 sessionIdentifier:v12];
      }
      else
      {
        v14 = 0;
      }
    }
  }

  return v14;
}

- (void)populatePreferredLanguage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(PKPaymentOfferInstallmentAssessment *)self->_installmentAssessment offers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setPreferredLanguage:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)populateChallenge:(id)a3 verifier:(id)a4
{
  installmentAssessment = self->_installmentAssessment;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentOfferInstallmentAssessment *)installmentAssessment action];
  [v8 populateChallenge:v7 verifier:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferAssessmentCollection *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        sessionIdentifier = v6->_sessionIdentifier;
        id v8 = self->_sessionIdentifier;
        uint64_t v9 = sessionIdentifier;
        if (v8 == v9)
        {
        }
        else
        {
          long long v10 = v9;
          if (!v8 || !v9)
          {

LABEL_16:
            char v12 = 0;
LABEL_18:

            goto LABEL_19;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_16;
          }
        }
        installmentAssessment = self->_installmentAssessment;
        v14 = v6->_installmentAssessment;
        if (installmentAssessment && v14) {
          char v12 = -[PKPaymentOfferInstallmentAssessment isEqual:](installmentAssessment, "isEqual:");
        }
        else {
          char v12 = installmentAssessment == v14;
        }
        goto LABEL_18;
      }
    }
    char v12 = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_sessionIdentifier];
  [v3 safelyAddObject:self->_installmentAssessment];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"sessionIdentifier: '%@'; ", self->_sessionIdentifier];
  [v3 appendFormat:@"installmentAssessment: '%@'; ", self->_installmentAssessment];
  [v3 appendFormat:@">"];
  unint64_t v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferAssessmentCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferAssessmentCollection;
  v5 = [(PKPaymentOfferAssessmentCollection *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentAssessment"];
    installmentAssessment = v5->_installmentAssessment;
    v5->_installmentAssessment = (PKPaymentOfferInstallmentAssessment *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:sessionIdentifier forKey:@"sessionIdentifier"];
  [v5 encodeObject:self->_installmentAssessment forKey:@"installmentAssessment"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferAssessmentCollection allocWithZone:](PKPaymentOfferAssessmentCollection, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  sessionIdentifier = v5->_sessionIdentifier;
  v5->_sessionIdentifier = (NSString *)v6;

  uint64_t v8 = [(PKPaymentOfferInstallmentAssessment *)self->_installmentAssessment copyWithZone:a3];
  installmentAssessment = v5->_installmentAssessment;
  v5->_installmentAssessment = v8;

  return v5;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (PKPaymentOfferInstallmentAssessment)installmentAssessment
{
  return self->_installmentAssessment;
}

- (void)setInstallmentAssessment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentAssessment, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end