@interface PKSelectedPaymentOffer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)serviceProviderData;
- (NSString)criteriaIdentifier;
- (NSString)selectedOfferIdentifier;
- (NSString)sessionIdentifier;
- (PKPaymentPass)paymentPass;
- (PKSelectedPaymentOffer)initWithCoder:(id)a3;
- (PKSelectedPaymentOffer)initWithType:(unint64_t)a3 selectedOfferIdentifier:(id)a4 paymentPass:(id)a5 criteriaIdentifier:(id)a6 sessionIdentifier:(id)a7 serviceProviderData:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)passUniqueID;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSelectedPaymentOffer

- (PKSelectedPaymentOffer)initWithType:(unint64_t)a3 selectedOfferIdentifier:(id)a4 paymentPass:(id)a5 criteriaIdentifier:(id)a6 sessionIdentifier:(id)a7 serviceProviderData:(id)a8
{
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)PKSelectedPaymentOffer;
  v18 = [(PKSelectedPaymentOffer *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    objc_storeStrong((id *)&v18->_selectedOfferIdentifier, a4);
    objc_storeStrong((id *)&v19->_paymentPass, a5);
    objc_storeStrong((id *)&v19->_criteriaIdentifier, a6);
    objc_storeStrong((id *)&v19->_sessionIdentifier, a7);
    objc_storeStrong((id *)&v19->_serviceProviderData, a8);
  }

  return v19;
}

- (id)passUniqueID
{
  return [(PKObject *)self->_paymentPass uniqueID];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKSelectedPaymentOffer *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        selectedOfferIdentifier = v6->_selectedOfferIdentifier;
        v8 = self->_selectedOfferIdentifier;
        v9 = selectedOfferIdentifier;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_28;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_29;
          }
        }
        criteriaIdentifier = v6->_criteriaIdentifier;
        v8 = self->_criteriaIdentifier;
        v14 = criteriaIdentifier;
        if (v8 == v14)
        {
        }
        else
        {
          v10 = v14;
          if (!v8 || !v14) {
            goto LABEL_28;
          }
          BOOL v15 = [(NSString *)v8 isEqualToString:v14];

          if (!v15) {
            goto LABEL_29;
          }
        }
        paymentPass = self->_paymentPass;
        id v17 = v6->_paymentPass;
        if (paymentPass && v17)
        {
          if ((-[PKPaymentPass isEqual:](paymentPass, "isEqual:") & 1) == 0) {
            goto LABEL_29;
          }
        }
        else if (paymentPass != v17)
        {
          goto LABEL_29;
        }
        sessionIdentifier = v6->_sessionIdentifier;
        v8 = self->_sessionIdentifier;
        v19 = sessionIdentifier;
        if (v8 == v19)
        {

LABEL_33:
          serviceProviderData = self->_serviceProviderData;
          objc_super v23 = v6->_serviceProviderData;
          if (serviceProviderData && v23)
          {
            if (-[NSDictionary isEqual:](serviceProviderData, "isEqual:")) {
              goto LABEL_38;
            }
          }
          else if (serviceProviderData == v23)
          {
LABEL_38:
            BOOL v12 = self->_type == v6->_type;
            goto LABEL_30;
          }
LABEL_29:
          BOOL v12 = 0;
LABEL_30:

          goto LABEL_31;
        }
        v10 = v19;
        if (v8 && v19)
        {
          BOOL v20 = [(NSString *)v8 isEqualToString:v19];

          if (!v20) {
            goto LABEL_29;
          }
          goto LABEL_33;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    BOOL v12 = 0;
  }
LABEL_31:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_selectedOfferIdentifier];
  [v3 safelyAddObject:self->_criteriaIdentifier];
  [v3 safelyAddObject:self->_paymentPass];
  [v3 safelyAddObject:self->_sessionIdentifier];
  [v3 safelyAddObject:self->_serviceProviderData];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

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

  v7 = [(PKSelectedPaymentOffer *)self criteriaIdentifier];
  [v3 appendFormat:@"criteriaIdentifier: '%@'; ", v7];

  v8 = [(PKSelectedPaymentOffer *)self passUniqueID];
  [v3 appendFormat:@"passUniqueID: '%@'; ", v8];

  v9 = [(PKSelectedPaymentOffer *)self sessionIdentifier];
  [v3 appendFormat:@"sessionIdentifier: '%@'; ", v9];

  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSelectedPaymentOffer)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKSelectedPaymentOffer;
  unint64_t v5 = [(PKSelectedPaymentOffer *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedOfferIdentifier"];
    selectedOfferIdentifier = v5->_selectedOfferIdentifier;
    v5->_selectedOfferIdentifier = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"criteriaIdentifier"];
    criteriaIdentifier = v5->_criteriaIdentifier;
    v5->_criteriaIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentPass"];
    paymentPass = v5->_paymentPass;
    v5->_paymentPass = (PKPaymentPass *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"serviceProviderData"];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  selectedOfferIdentifier = self->_selectedOfferIdentifier;
  id v5 = a3;
  [v5 encodeObject:selectedOfferIdentifier forKey:@"selectedOfferIdentifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_criteriaIdentifier forKey:@"criteriaIdentifier"];
  [v5 encodeObject:self->_paymentPass forKey:@"paymentPass"];
  [v5 encodeObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
  [v5 encodeObject:self->_serviceProviderData forKey:@"serviceProviderData"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_selectedOfferIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_type;
  uint64_t v8 = [(NSString *)self->_criteriaIdentifier copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(PKSecureElementPass *)self->_paymentPass copyWithZone:a3];
  BOOL v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  uint64_t v14 = [(NSDictionary *)self->_serviceProviderData copyWithZone:a3];
  uint64_t v15 = (void *)v5[6];
  v5[6] = v14;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)selectedOfferIdentifier
{
  return self->_selectedOfferIdentifier;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_selectedOfferIdentifier, 0);
}

@end