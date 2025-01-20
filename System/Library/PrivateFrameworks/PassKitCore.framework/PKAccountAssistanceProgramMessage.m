@interface PKAccountAssistanceProgramMessage
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)chargeOffPreventionAmount;
- (NSDecimalNumber)currentBalance;
- (NSDecimalNumber)pastDue;
- (NSString)description;
- (PKAccountAssistanceProgramMessage)initWithCoder:(id)a3;
- (PKAccountAssistanceProgramMessage)initWithRecord:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setChargeOffPreventionAmount:(id)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setPastDue:(id)a3;
@end

@implementation PKAccountAssistanceProgramMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountAssistanceProgramMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountAssistanceProgramMessage;
  v5 = [(PKAccountAssistanceProgramMessage *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pastDue"];
    pastDue = v5->_pastDue;
    v5->_pastDue = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chargeOffPreventionAmount"];
    chargeOffPreventionAmount = v5->_chargeOffPreventionAmount;
    v5->_chargeOffPreventionAmount = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  pastDue = self->_pastDue;
  id v5 = a3;
  [v5 encodeObject:pastDue forKey:@"pastDue"];
  [v5 encodeObject:self->_chargeOffPreventionAmount forKey:@"chargeOffPreventionAmount"];
  [v5 encodeObject:self->_currentBalance forKey:@"currentBalance"];
}

- (PKAccountAssistanceProgramMessage)initWithRecord:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountAssistanceProgramMessage;
  id v5 = [(PKAccountAssistanceProgramMessage *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"pastDue");
    pastDue = v5->_pastDue;
    v5->_pastDue = (NSDecimalNumber *)v6;

    uint64_t v8 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"chargeOffPreventionAmount");
    chargeOffPreventionAmount = v5->_chargeOffPreventionAmount;
    v5->_chargeOffPreventionAmount = (NSDecimalNumber *)v8;

    uint64_t v10 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"currentBalance");
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v10;
  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v4 = [a3 encryptedValues];
  if (PKApplePayContainerEnvironment() == 2)
  {
    [v4 setObject:self->_pastDue forKey:@"pastDue"];
    [v4 setObject:self->_chargeOffPreventionAmount forKey:@"chargeOffPreventionAmount"];
    [v4 setObject:self->_currentBalance forKey:@"currentBalance"];
  }
}

+ (id)recordType
{
  return @"AssistanceProgram";
}

+ (id)recordNamePrefix
{
  return @"assitance-";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  pastDue = self->_pastDue;
  uint64_t v6 = (NSDecimalNumber *)v4[1];
  if (pastDue && v6)
  {
    if ((-[NSDecimalNumber isEqual:](pastDue, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (pastDue != v6)
  {
    goto LABEL_14;
  }
  chargeOffPreventionAmount = self->_chargeOffPreventionAmount;
  uint64_t v8 = (NSDecimalNumber *)v4[2];
  if (!chargeOffPreventionAmount || !v8)
  {
    if (chargeOffPreventionAmount == v8) {
      goto LABEL_10;
    }
LABEL_14:
    char v11 = 0;
    goto LABEL_15;
  }
  if ((-[NSDecimalNumber isEqual:](chargeOffPreventionAmount, "isEqual:") & 1) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  currentBalance = self->_currentBalance;
  uint64_t v10 = (NSDecimalNumber *)v4[3];
  if (currentBalance && v10) {
    char v11 = -[NSDecimalNumber isEqual:](currentBalance, "isEqual:");
  }
  else {
    char v11 = currentBalance == v10;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_pastDue];
  [v3 safelyAddObject:self->_chargeOffPreventionAmount];
  [v3 safelyAddObject:self->_currentBalance];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = [(NSDecimalNumber *)self->_pastDue description];
  [v3 appendFormat:@"pastDue: '%@'; ", v4];

  id v5 = [(NSDecimalNumber *)self->_chargeOffPreventionAmount description];
  [v3 appendFormat:@"chargeOffPreventionAmount: '%@'; ", v5];

  uint64_t v6 = [(NSDecimalNumber *)self->_currentBalance description];
  [v3 appendFormat:@"currentBalance: '%@'; ", v6];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSDecimalNumber)pastDue
{
  return self->_pastDue;
}

- (void)setPastDue:(id)a3
{
}

- (NSDecimalNumber)chargeOffPreventionAmount
{
  return self->_chargeOffPreventionAmount;
}

- (void)setChargeOffPreventionAmount:(id)a3
{
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_chargeOffPreventionAmount, 0);
  objc_storeStrong((id *)&self->_pastDue, 0);
}

@end