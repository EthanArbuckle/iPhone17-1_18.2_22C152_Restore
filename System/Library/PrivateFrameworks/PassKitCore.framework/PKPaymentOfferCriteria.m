@interface PKPaymentOfferCriteria
+ (BOOL)supportsSecureCoding;
+ (id)paymentOfferCritieraWithDictionary:(id)a3;
- (BOOL)eligibleWithConfiguration:(id)a3;
- (BOOL)eligibleWithConfiguration:(id)a3 ineligibleReason:(unint64_t *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)fpanIdentifier;
- (NSString)identifier;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (PKPaymentOfferCriteria)initWithCoder:(id)a3;
- (PKPaymentOfferCriteria)initWithDictionary:(id)a3;
- (id)associatedPassUniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)eligibility;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setEligibility:(unint64_t)a3;
- (void)setFpanIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentOfferCriteria

- (PKPaymentOfferCriteria)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentOfferCriteria;
  v5 = [(PKPaymentOfferCriteria *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"type"];
    v5->_type = PKPaymentOfferCriteriaTypeFromString(v8);

    v9 = [v4 PKStringForKey:@"eligibility"];
    v10 = v9;
    if (v9 != @"eligible")
    {
      if (v9)
      {
        char v11 = [(__CFString *)v9 isEqualToString:@"eligible"];

        if (v11) {
          goto LABEL_5;
        }
        v13 = v10;
        if (v13 == @"notEligible"
          || (v14 = v13,
              int v15 = [(__CFString *)v13 isEqualToString:@"notEligible"],
              v14,
              v15))
        {
          uint64_t v12 = 2;
          goto LABEL_10;
        }
      }
      uint64_t v12 = 0;
      goto LABEL_10;
    }
LABEL_5:
    uint64_t v12 = 1;
LABEL_10:

    v5->_eligibility = v12;
    uint64_t v16 = [v4 PKStringForKey:@"passSerialNumber"];
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v16;

    uint64_t v18 = [v4 PKStringForKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 PKStringForKey:@"fpanIdentifier"];
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v20;
  }
  return v5;
}

+ (id)paymentOfferCritieraWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 PKStringForKey:@"identifier"];
  if (v4
    && (([v3 PKStringForKey:@"type"],
         v5 = objc_claimAutoreleasedReturnValue(),
         uint64_t v6 = PKPaymentOfferCriteriaTypeFromString(v5),
         v5,
         v6 == 1)
     || v6 == 2)
    && (v7 = (objc_class *)objc_opt_class()) != 0)
  {
    v8 = (void *)[[v7 alloc] initWithDictionary:v3];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)associatedPassUniqueID
{
  passSerialNumber = self->_passSerialNumber;
  if (passSerialNumber)
  {
    passTypeIdentifier = self->_passTypeIdentifier;
    if (passTypeIdentifier)
    {
      passTypeIdentifier = PKGeneratePassUniqueID(passTypeIdentifier, passSerialNumber);
    }
  }
  else
  {
    passTypeIdentifier = 0;
  }
  return passTypeIdentifier;
}

- (BOOL)eligibleWithConfiguration:(id)a3
{
  return [(PKPaymentOfferCriteria *)self eligibleWithConfiguration:a3 ineligibleReason:0];
}

- (BOOL)eligibleWithConfiguration:(id)a3 ineligibleReason:(unint64_t *)a4
{
  unint64_t eligibility = self->_eligibility;
  if (a4) {
    *a4 = 2 * (eligibility != 1);
  }
  return eligibility == 1;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  unint64_t type = self->_type;
  v5 = @"installments";
  if (type != 1) {
    v5 = @"unknown";
  }
  if (type == 2) {
    uint64_t v6 = @"rewards";
  }
  else {
    uint64_t v6 = v5;
  }
  [v3 setObject:v6 forKeyedSubscript:@"type"];
  unint64_t eligibility = self->_eligibility;
  v8 = @"eligible";
  if (eligibility != 1) {
    v8 = @"unknown";
  }
  if (eligibility == 2) {
    v9 = @"notEligible";
  }
  else {
    v9 = v8;
  }
  [v3 setObject:v9 forKeyedSubscript:@"eligibility"];
  [v3 setObject:self->_passSerialNumber forKeyedSubscript:@"passSerialNumber"];
  [v3 setObject:self->_passTypeIdentifier forKeyedSubscript:@"passTypeIdentifier"];
  [v3 setObject:self->_fpanIdentifier forKeyedSubscript:@"fpanIdentifier"];
  v10 = (void *)[v3 copy];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferCriteria *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        identifier = v6->_identifier;
        v8 = self->_identifier;
        v9 = identifier;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9) {
            goto LABEL_32;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_33;
          }
        }
        if (self->_type != v6->_type || self->_eligibility != v6->_eligibility)
        {
          LOBYTE(v11) = 0;
LABEL_33:

          goto LABEL_34;
        }
        passSerialNumber = v6->_passSerialNumber;
        v8 = self->_passSerialNumber;
        v13 = passSerialNumber;
        if (v8 == v13)
        {
        }
        else
        {
          v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13) {
            goto LABEL_32;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v13];

          if (!v11) {
            goto LABEL_33;
          }
        }
        passTypeIdentifier = v6->_passTypeIdentifier;
        v8 = self->_passTypeIdentifier;
        int v15 = passTypeIdentifier;
        if (v8 == v15)
        {

LABEL_27:
          fpanIdentifier = self->_fpanIdentifier;
          v17 = v6->_fpanIdentifier;
          v8 = fpanIdentifier;
          uint64_t v18 = v17;
          if (v8 == v18)
          {
            LOBYTE(v11) = 1;
            v10 = v8;
          }
          else
          {
            v10 = v18;
            LOBYTE(v11) = 0;
            if (v8 && v18) {
              LOBYTE(v11) = [(NSString *)v8 isEqualToString:v18];
            }
          }
          goto LABEL_32;
        }
        v10 = v15;
        LOBYTE(v11) = 0;
        if (v8 && v15)
        {
          BOOL v11 = [(NSString *)v8 isEqualToString:v15];

          if (!v11) {
            goto LABEL_33;
          }
          goto LABEL_27;
        }
LABEL_32:

        goto LABEL_33;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_passSerialNumber];
  [v3 safelyAddObject:self->_passTypeIdentifier];
  [v3 safelyAddObject:self->_fpanIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_eligibility - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t type = self->_type;
  unint64_t v5 = @"installments";
  if (type != 1) {
    unint64_t v5 = @"unknown";
  }
  if (type == 2) {
    unint64_t v6 = @"rewards";
  }
  else {
    unint64_t v6 = v5;
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  unint64_t eligibility = self->_eligibility;
  v8 = @"eligible";
  if (eligibility != 1) {
    v8 = @"unknown";
  }
  if (eligibility == 2) {
    v9 = @"notEligible";
  }
  else {
    v9 = v8;
  }
  [v3 appendFormat:@"eligibility: '%@'; ", v9];
  [v3 appendFormat:@"passSerialNumber: '%@'; ", self->_passSerialNumber];
  [v3 appendFormat:@"passTypeIdentifier: '%@'; ", self->_passTypeIdentifier];
  [v3 appendFormat:@"fpanIdentifier: '%@'; ", self->_fpanIdentifier];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentOfferCriteria;
  unint64_t v5 = [(PKPaymentOfferCriteria *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    v5->_unint64_t eligibility = [v4 decodeIntegerForKey:@"eligibility"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passSerialNumber"];
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpanIdentifier"];
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_eligibility forKey:@"eligibility"];
  [v5 encodeObject:self->_passSerialNumber forKey:@"passSerialNumber"];
  [v5 encodeObject:self->_passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v5 encodeObject:self->_fpanIdentifier forKey:@"fpanIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[3] = self->_type;
  v5[2] = self->_eligibility;
  uint64_t v8 = [(NSString *)self->_passSerialNumber copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_passTypeIdentifier copyWithZone:a3];
  BOOL v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_fpanIdentifier copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)eligibility
{
  return self->_eligibility;
}

- (void)setEligibility:(unint64_t)a3
{
  self->_unint64_t eligibility = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end