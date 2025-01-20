@interface PKSelectedPaymentOfferInstallment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKPaymentOfferInstallmentAssessment)installmentAssessment;
- (PKSelectedPaymentOfferInstallment)initWithCoder:(id)a3;
- (PKSelectedPaymentOfferInstallment)initWithInstallmentAssessment:(id)a3 selectedOfferIdentifier:(id)a4 criteriaIdentifier:(id)a5 paymentPass:(id)a6 sessionIdentifier:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)selectedInstallmentOffer;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSelectedPaymentOfferInstallment

- (PKSelectedPaymentOfferInstallment)initWithInstallmentAssessment:(id)a3 selectedOfferIdentifier:(id)a4 criteriaIdentifier:(id)a5 paymentPass:(id)a6 sessionIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = [v13 installmentOfferWithIdentifier:v17];
  v19 = [v18 serviceProviderData];

  v22.receiver = self;
  v22.super_class = (Class)PKSelectedPaymentOfferInstallment;
  v20 = [(PKSelectedPaymentOffer *)&v22 initWithType:1 selectedOfferIdentifier:v17 paymentPass:v15 criteriaIdentifier:v16 sessionIdentifier:v14 serviceProviderData:v19];

  if (v20) {
    objc_storeStrong((id *)&v20->_installmentAssessment, a3);
  }

  return v20;
}

- (id)selectedInstallmentOffer
{
  installmentAssessment = self->_installmentAssessment;
  v3 = [(PKSelectedPaymentOffer *)self selectedOfferIdentifier];
  v4 = [(PKPaymentOfferInstallmentAssessment *)installmentAssessment installmentOfferWithIdentifier:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKSelectedPaymentOfferInstallment *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)PKSelectedPaymentOfferInstallment;
    if ([(PKSelectedPaymentOffer *)&v12 isEqual:v6])
    {
      installmentAssessment = self->_installmentAssessment;
      v8 = v6->_installmentAssessment;
      if (installmentAssessment) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9) {
        char v10 = installmentAssessment == v8;
      }
      else {
        char v10 = -[PKPaymentOfferInstallmentAssessment isEqual:](installmentAssessment, "isEqual:");
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_installmentAssessment];
  v7.receiver = self;
  v7.super_class = (Class)PKSelectedPaymentOfferInstallment;
  id v4 = [(PKSelectedPaymentOffer *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = [(PKSelectedPaymentOffer *)self type];
  unint64_t v5 = @"unknown";
  if (v4 == 1) {
    unint64_t v5 = @"installment";
  }
  if (v4 == 2) {
    unint64_t v5 = @"rewards";
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  v6 = [(PKSelectedPaymentOffer *)self selectedOfferIdentifier];
  [v3 appendFormat:@"selectedOfferIdentifier: '%@'; ", v6];

  [v3 appendFormat:@"installmentAssessment: '%@'; ", self->_installmentAssessment];
  objc_super v7 = [(PKSelectedPaymentOffer *)self criteriaIdentifier];
  [v3 appendFormat:@"criteriaIdentifier: '%@'; ", v7];

  v8 = [(PKSelectedPaymentOffer *)self passUniqueID];
  [v3 appendFormat:@"passUniqueID: '%@'; ", v8];

  BOOL v9 = [(PKSelectedPaymentOffer *)self sessionIdentifier];
  [v3 appendFormat:@"sessionIdentifier: '%@'; ", v9];

  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSelectedPaymentOfferInstallment)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSelectedPaymentOfferInstallment;
  unint64_t v5 = [(PKSelectedPaymentOffer *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentAssessment"];
    installmentAssessment = v5->_installmentAssessment;
    v5->_installmentAssessment = (PKPaymentOfferInstallmentAssessment *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKSelectedPaymentOfferInstallment;
  id v4 = a3;
  [(PKSelectedPaymentOffer *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentAssessment, @"installmentAssessment", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKPaymentOfferInstallmentAssessment *)self->_installmentAssessment copyWithZone:a3];
  objc_super v7 = (void *)v5[7];
  v5[7] = v6;

  return v5;
}

- (PKPaymentOfferInstallmentAssessment)installmentAssessment
{
  return self->_installmentAssessment;
}

- (void).cxx_destruct
{
}

@end