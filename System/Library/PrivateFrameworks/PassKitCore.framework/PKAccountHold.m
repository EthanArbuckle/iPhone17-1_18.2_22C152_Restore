@interface PKAccountHold
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (PKAccountHold)initWithCoder:(id)a3;
- (PKAccountHold)initWithRecord:(id)a3;
- (PKCurrencyAmount)currencyAmount;
- (unint64_t)hash;
- (unint64_t)state;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountHold

- (PKAccountHold)initWithRecord:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PKAccountHold;
  v5 = [(PKAccountHold *)&v48 init];
  if (!v5) {
    goto LABEL_40;
  }
  uint64_t v6 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"holdIdentifier");
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  objc_msgSend(v4, "pk_encryptedStringForKey:", @"type");
  v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == @"floatHold") {
    goto LABEL_5;
  }
  if (!v8) {
    goto LABEL_27;
  }
  char v10 = [(__CFString *)v8 isEqualToString:@"floatHold"];

  if (v10)
  {
LABEL_5:
    uint64_t v11 = 1;
    goto LABEL_28;
  }
  v12 = v9;
  if (v12 == @"checkHold"
    || (v13 = v12,
        char v14 = [(__CFString *)v12 isEqualToString:@"checkHold"],
        v13,
        (v14 & 1) != 0))
  {
    uint64_t v11 = 2;
    goto LABEL_28;
  }
  v15 = v13;
  if (v15 == @"exceptionReviewHold"
    || (v16 = v15,
        char v17 = [(__CFString *)v15 isEqualToString:@"exceptionReviewHold"],
        v16,
        (v17 & 1) != 0))
  {
    uint64_t v11 = 3;
    goto LABEL_28;
  }
  v18 = v16;
  if (v18 == @"childSupportObligationHold"
    || (v19 = v18,
        char v20 = [(__CFString *)v18 isEqualToString:@"childSupportObligationHold"],
        v19,
        (v20 & 1) != 0))
  {
    uint64_t v11 = 4;
    goto LABEL_28;
  }
  v21 = v19;
  if (v21 == @"permanentHold"
    || (v22 = v21,
        char v23 = [(__CFString *)v21 isEqualToString:@"permanentHold"],
        v22,
        (v23 & 1) != 0))
  {
    uint64_t v11 = 5;
    goto LABEL_28;
  }
  v24 = v22;
  if (v24 == @"fdicHold"
    || (v25 = v24,
        char v26 = [(__CFString *)v24 isEqualToString:@"fdicHold"],
        v25,
        (v26 & 1) != 0))
  {
    uint64_t v11 = 6;
    goto LABEL_28;
  }
  v27 = v25;
  if (v27 == @"garnishmentHold"
    || (v28 = v27,
        char v29 = [(__CFString *)v27 isEqualToString:@"garnishmentHold"],
        v28,
        (v29 & 1) != 0))
  {
    uint64_t v11 = 7;
    goto LABEL_28;
  }
  v30 = v28;
  if (v30 == @"provisionalHold"
    || (v31 = v30,
        int v32 = [(__CFString *)v30 isEqualToString:@"provisionalHold"],
        v31,
        v32))
  {
    uint64_t v11 = 8;
  }
  else
  {
LABEL_27:
    uint64_t v11 = 0;
  }
LABEL_28:

  v5->_type = v11;
  objc_msgSend(v4, "pk_encryptedStringForKey:", @"state");
  v33 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33 == @"placed")
  {
LABEL_31:
    uint64_t v36 = 1;
    goto LABEL_36;
  }
  if (!v33) {
    goto LABEL_35;
  }
  char v35 = [(__CFString *)v33 isEqualToString:@"placed"];

  if (v35) {
    goto LABEL_31;
  }
  v37 = v34;
  if (v37 == @"removed"
    || (v38 = v37,
        int v39 = [(__CFString *)v37 isEqualToString:@"removed"],
        v38,
        v39))
  {
    uint64_t v36 = 2;
  }
  else
  {
LABEL_35:
    uint64_t v36 = 0;
  }
LABEL_36:

  v5->_state = v36;
  v40 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"amount");
  uint64_t v41 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"currencyCode");
  v42 = (void *)v41;
  if (v40 && v41)
  {
    v43 = [PKCurrencyAmount alloc];
    v44 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v40];
    uint64_t v45 = [(PKCurrencyAmount *)v43 initWithAmount:v44 currency:v42 exponent:0];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v45;
  }
LABEL_40:

  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v12 = [a3 encryptedValues];
  if (PKApplePayContainerEnvironment() == 2)
  {
    [v12 setObject:self->_identifier forKey:@"holdIdentifier"];
    unint64_t type = self->_type;
    if (type > 8) {
      v5 = @"floatHold";
    }
    else {
      v5 = off_1E56EB660[type];
    }
    [v12 setObject:v5 forKey:@"type"];
    unint64_t state = self->_state;
    v7 = @"placed";
    if (state == 2) {
      v7 = @"removed";
    }
    if (state) {
      v8 = v7;
    }
    else {
      v8 = @"unknown";
    }
    [v12 setObject:v8 forKey:@"state"];
    v9 = [(PKCurrencyAmount *)self->_currencyAmount amount];
    char v10 = [v9 stringValue];
    [v12 setObject:v10 forKey:@"amount"];

    uint64_t v11 = [(PKCurrencyAmount *)self->_currencyAmount currency];
    [v12 setObject:v11 forKey:@"currencyCode"];
  }
}

+ (id)recordType
{
  return @"AccountHold";
}

+ (id)recordNamePrefix
{
  return @"hold";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountHold)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountHold;
  v5 = [(PKAccountHold *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"holdIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    v5->_unint64_t state = [v4 decodeIntegerForKey:@"state"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    uint64_t v10 = PKCurrencyAmountCreate(v8, v9, 0);
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"holdIdentifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  uint64_t v6 = [(PKCurrencyAmount *)self->_currencyAmount amount];
  [v5 encodeObject:v6 forKey:@"amount"];

  id v7 = [(PKCurrencyAmount *)self->_currencyAmount currency];
  [v5 encodeObject:v7 forKey:@"currencyCode"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  identifier = self->_identifier;
  uint64_t v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_14;
  }
  currencyAmount = self->_currencyAmount;
  v8 = (PKCurrencyAmount *)v4[4];
  if (!currencyAmount || !v8)
  {
    if (currencyAmount == v8) {
      goto LABEL_12;
    }
LABEL_14:
    BOOL v9 = 0;
    goto LABEL_15;
  }
  if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:")) {
    goto LABEL_14;
  }
LABEL_12:
  if (self->_type != v4[2]) {
    goto LABEL_14;
  }
  BOOL v9 = self->_state == v4[3];
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_currencyAmount];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_state - v5 + 32 * v5;

  return v6;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t type = self->_type;
  if (type > 8) {
    unint64_t v5 = @"floatHold";
  }
  else {
    unint64_t v5 = off_1E56EB660[type];
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  unint64_t state = self->_state;
  id v7 = @"placed";
  if (state == 2) {
    id v7 = @"removed";
  }
  if (state) {
    v8 = v7;
  }
  else {
    v8 = @"unknown";
  }
  [v3 appendFormat:@"state: '%@'; ", v8];
  [v3 appendFormat:@"currencyAmount: '%@'; ", self->_currencyAmount];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end