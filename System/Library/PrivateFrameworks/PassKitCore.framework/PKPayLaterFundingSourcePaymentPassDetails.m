@interface PKPayLaterFundingSourcePaymentPassDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDetails:(id)a3;
- (NSString)cardName;
- (NSString)cardSuffix;
- (NSString)description;
- (NSString)dpanIdentifier;
- (NSString)fpanIdentifier;
- (PKPayLaterFundingSourcePaymentPassDetails)initWithCoder:(id)a3;
- (PKPayLaterFundingSourcePaymentPassDetails)initWithDictionary:(id)a3 type:(unint64_t)a4;
- (PKPayLaterFundingSourcePaymentPassDetails)initWithPaymentPass:(id)a3 paymentApplication:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)cardNetwork;
- (unint64_t)cardType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setCardName:(id)a3;
- (void)setCardNetwork:(int64_t)a3;
- (void)setCardSuffix:(id)a3;
- (void)setCardType:(unint64_t)a3;
- (void)setDpanIdentifier:(id)a3;
- (void)setFpanIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPayLaterFundingSourcePaymentPassDetails

- (PKPayLaterFundingSourcePaymentPassDetails)initWithDictionary:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterFundingSourcePaymentPassDetails;
  v7 = [(PKPayLaterFundingSourcePaymentPassDetails *)&v20 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a4;
    uint64_t v9 = [v6 PKStringForKey:@"dpanIdentifier"];
    dpanIdentifier = v8->_dpanIdentifier;
    v8->_dpanIdentifier = (NSString *)v9;

    uint64_t v11 = [v6 PKStringForKey:@"fpanIdentifier"];
    fpanIdentifier = v8->_fpanIdentifier;
    v8->_fpanIdentifier = (NSString *)v11;

    uint64_t v13 = [v6 PKStringForKey:@"cardName"];
    cardName = v8->_cardName;
    v8->_cardName = (NSString *)v13;

    uint64_t v15 = [v6 PKStringForKey:@"cardSuffix"];
    cardSuffix = v8->_cardSuffix;
    v8->_cardSuffix = (NSString *)v15;

    v17 = [v6 PKStringForKey:@"cardType"];
    v8->_cardType = PKPayLaterFundingSourceCardTypeFromString(v17);

    v18 = [v6 PKStringForKey:@"cardNetwork"];
    v8->_cardNetwork = PKPaymentCredentialTypeForPaymentNetworkName(v18);
  }
  return v8;
}

- (PKPayLaterFundingSourcePaymentPassDetails)initWithPaymentPass:(id)a3 paymentApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterFundingSourcePaymentPassDetails;
  v8 = [(PKPayLaterFundingSourcePaymentPassDetails *)&v21 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    uint64_t v10 = [v6 primaryAccountIdentifier];
    fpanIdentifier = v9->_fpanIdentifier;
    v9->_fpanIdentifier = (NSString *)v10;

    uint64_t v12 = [v7 dpanIdentifier];
    dpanIdentifier = v9->_dpanIdentifier;
    v9->_dpanIdentifier = (NSString *)v12;

    uint64_t v14 = [v6 primaryAccountNumberSuffix];
    cardSuffix = v9->_cardSuffix;
    v9->_cardSuffix = (NSString *)v14;

    uint64_t v16 = [v6 localizedDescription];
    cardName = v9->_cardName;
    v9->_cardName = (NSString *)v16;

    uint64_t v18 = [v7 paymentType];
    uint64_t v19 = 2 * (v18 == 2);
    if (v18 == 1) {
      uint64_t v19 = 1;
    }
    v9->_cardType = v19;
    v9->_cardNetwork = [v7 paymentNetworkIdentifier];
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_dpanIdentifier forKeyedSubscript:@"dpanIdentifier"];
  [v3 setObject:self->_fpanIdentifier forKeyedSubscript:@"fpanIdentifier"];
  [v3 setObject:self->_cardName forKeyedSubscript:@"cardName"];
  [v3 setObject:self->_cardSuffix forKeyedSubscript:@"cardSuffix"];
  unint64_t cardType = self->_cardType;
  if (cardType > 2) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E56F3CA8[cardType];
  }
  [v3 setObject:v5 forKeyedSubscript:@"cardType"];
  id v6 = PKPaymentNetworkNameForPaymentCredentialType(self->_cardNetwork);
  [v3 setObject:v6 forKeyedSubscript:@"cardNetwork"];

  id v7 = (void *)[v3 copy];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPayLaterFundingSourcePaymentPassDetails *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterFundingSourcePaymentPassDetails *)self isEqualToDetails:v5];

  return v6;
}

- (BOOL)isEqualToDetails:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_26;
  }
  BOOL v6 = (void *)v4[2];
  id v7 = self->_dpanIdentifier;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_25;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_26;
    }
  }
  uint64_t v11 = (void *)v5[3];
  id v7 = self->_fpanIdentifier;
  uint64_t v12 = v11;
  if (v7 == v12)
  {
  }
  else
  {
    uint64_t v9 = v12;
    if (!v7 || !v12) {
      goto LABEL_25;
    }
    BOOL v13 = [(NSString *)v7 isEqualToString:v12];

    if (!v13) {
      goto LABEL_26;
    }
  }
  uint64_t v14 = (void *)v5[6];
  id v7 = self->_cardName;
  uint64_t v15 = v14;
  if (v7 == v15)
  {
  }
  else
  {
    uint64_t v9 = v15;
    if (!v7 || !v15) {
      goto LABEL_25;
    }
    BOOL v16 = [(NSString *)v7 isEqualToString:v15];

    if (!v16) {
      goto LABEL_26;
    }
  }
  v17 = (void *)v5[7];
  id v7 = self->_cardSuffix;
  uint64_t v18 = v17;
  if (v7 != v18)
  {
    uint64_t v9 = v18;
    if (v7 && v18)
    {
      BOOL v19 = [(NSString *)v7 isEqualToString:v18];

      if (!v19) {
        goto LABEL_26;
      }
      goto LABEL_29;
    }
LABEL_25:

    goto LABEL_26;
  }

LABEL_29:
  if (self->_cardNetwork == v5[4] && self->_cardType == v5[5])
  {
    BOOL v20 = self->_type == v5[1];
    goto LABEL_27;
  }
LABEL_26:
  BOOL v20 = 0;
LABEL_27:

  return v20;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_dpanIdentifier];
  [v3 safelyAddObject:self->_fpanIdentifier];
  [v3 safelyAddObject:self->_cardName];
  [v3 safelyAddObject:self->_cardSuffix];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_cardNetwork - v4 + 32 * v4;
  unint64_t v6 = self->_cardType - v5 + 32 * v5;
  unint64_t v7 = self->_type - v6 + 32 * v6;

  return v7;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"dpanIdentifier: '%@'; ", self->_dpanIdentifier];
  [v3 appendFormat:@"fpanIdentifier: '%@'; ", self->_fpanIdentifier];
  [v3 appendFormat:@"cardName: '%@'; ", self->_cardName];
  [v3 appendFormat:@"cardSuffix: '%@'; ", self->_cardSuffix];
  unint64_t cardType = self->_cardType;
  if (cardType > 2) {
    int64_t v5 = @"unknown";
  }
  else {
    int64_t v5 = off_1E56F3CA8[cardType];
  }
  [v3 appendFormat:@"cardType: '%@'; ", v5];
  unint64_t v6 = PKPaymentNetworkNameForPaymentCredentialType(self->_cardNetwork);
  [v3 appendFormat:@"cardNetwork: '%@'; ", v6];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFundingSourcePaymentPassDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFundingSourcePaymentPassDetails;
  int64_t v5 = [(PKPayLaterFundingSourcePaymentPassDetails *)&v15 init];
  if (v5)
  {
    -[PKPayLaterFundingSourcePaymentPassDetails setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpanIdentifier"];
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardSuffix"];
    cardSuffix = v5->_cardSuffix;
    v5->_cardSuffix = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardName"];
    cardName = v5->_cardName;
    v5->_cardName = (NSString *)v12;

    v5->_unint64_t cardType = [v4 decodeIntegerForKey:@"cardType"];
    v5->_cardNetwork = [v4 decodeIntegerForKey:@"cardNetwork"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_dpanIdentifier forKey:@"dpanIdentifier"];
  [v5 encodeObject:self->_fpanIdentifier forKey:@"fpanIdentifier"];
  [v5 encodeObject:self->_cardSuffix forKey:@"cardSuffix"];
  [v5 encodeObject:self->_cardName forKey:@"cardName"];
  [v5 encodeInteger:self->_cardType forKey:@"cardType"];
  [v5 encodeInteger:self->_cardNetwork forKey:@"cardNetwork"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterFundingSourcePaymentPassDetails allocWithZone:](PKPayLaterFundingSourcePaymentPassDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_dpanIdentifier copyWithZone:a3];
  dpanIdentifier = v5->_dpanIdentifier;
  v5->_dpanIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_fpanIdentifier copyWithZone:a3];
  fpanIdentifier = v5->_fpanIdentifier;
  v5->_fpanIdentifier = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_cardSuffix copyWithZone:a3];
  cardSuffix = v5->_cardSuffix;
  v5->_cardSuffix = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_cardName copyWithZone:a3];
  cardName = v5->_cardName;
  v5->_cardName = (NSString *)v12;

  v5->_unint64_t cardType = self->_cardType;
  v5->_cardNetwork = self->_cardNetwork;
  v5->_unint64_t type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
}

- (int64_t)cardNetwork
{
  return self->_cardNetwork;
}

- (void)setCardNetwork:(int64_t)a3
{
  self->_cardNetwork = a3;
}

- (unint64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(unint64_t)a3
{
  self->_unint64_t cardType = a3;
}

- (NSString)cardName
{
  return self->_cardName;
}

- (void)setCardName:(id)a3
{
}

- (NSString)cardSuffix
{
  return self->_cardSuffix;
}

- (void)setCardSuffix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSuffix, 0);
  objc_storeStrong((id *)&self->_cardName, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end