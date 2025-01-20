@interface PKAccountAction
+ (BOOL)supportsSecureCoding;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (NSString)identifier;
- (PKAccountAction)initWithCoder:(id)a3;
- (unint64_t)actionType;
- (unint64_t)redemptionType;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(unint64_t)a3;
- (void)setAmount:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRedemptionType:(unint64_t)a3;
@end

@implementation PKAccountAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountAction;
  v5 = [(PKAccountAction *)&v13 init];
  if (v5)
  {
    v5->_actionType = [v4 decodeIntegerForKey:@"action"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    v5->_redemptionType = [v4 decodeIntegerForKey:@"rewardRedemptionType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t actionType = self->_actionType;
  id v5 = a3;
  [v5 encodeInteger:actionType forKey:@"action"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeInteger:self->_redemptionType forKey:@"rewardRedemptionType"];
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_unint64_t actionType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (unint64_t)redemptionType
{
  return self->_redemptionType;
}

- (void)setRedemptionType:(unint64_t)a3
{
  self->_redemptionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end