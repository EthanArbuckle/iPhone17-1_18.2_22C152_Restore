@interface NPKBalanceField
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPendingUpdate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimaryBalance;
- (NPKBalanceField)initWithBalance:(id)a3 label:(id)a4 formattedValue:(id)a5 identifier:(id)a6 primaryBalance:(BOOL)a7 action:(id)a8 pendingUpdateExpireDate:(id)a9;
- (NPKBalanceField)initWithCoder:(id)a3;
- (NSNumber)rawCountValue;
- (NSString)description;
- (NSString)formattedValue;
- (NSString)identifier;
- (NSString)label;
- (PKPaymentBalance)balance;
- (PKPaymentPassAction)action;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NPKBalanceField

- (NPKBalanceField)initWithBalance:(id)a3 label:(id)a4 formattedValue:(id)a5 identifier:(id)a6 primaryBalance:(BOOL)a7 action:(id)a8 pendingUpdateExpireDate:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  v31.receiver = self;
  v31.super_class = (Class)NPKBalanceField;
  v21 = [(NPKBalanceField *)&v31 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_balance, a3);
    uint64_t v23 = [v16 copy];
    label = v22->_label;
    v22->_label = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    formattedValue = v22->_formattedValue;
    v22->_formattedValue = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v27;

    v22->_isPrimaryBalance = a7;
    objc_storeStrong((id *)&v22->_action, a8);
    objc_storeStrong((id *)&v22->_pendingUpdateExpireDate, a9);
  }

  return v22;
}

- (NPKBalanceField)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPKBalanceField;
  v5 = [(NPKBalanceField *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
    balance = v5->_balance;
    v5->_balance = (PKPaymentBalance *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formattedValue"];
    formattedValue = v5->_formattedValue;
    v5->_formattedValue = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    v5->_isPrimaryBalance = [v4 decodeBoolForKey:@"isPrimaryBalance"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (PKPaymentPassAction *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pendingUpdateExpireDate"];
    pendingUpdateExpireDate = v5->_pendingUpdateExpireDate;
    v5->_pendingUpdateExpireDate = (NSDate *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"label"];
  [v5 encodeObject:self->_balance forKey:@"balance"];
  [v5 encodeObject:self->_formattedValue forKey:@"formattedValue"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeBool:self->_isPrimaryBalance forKey:@"isPrimaryBalance"];
  [v5 encodeObject:self->_action forKey:@"action"];
  [v5 encodeObject:self->_pendingUpdateExpireDate forKey:@"pendingUpdateExpireDate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasPendingUpdate
{
  pendingUpdateExpireDate = self->_pendingUpdateExpireDate;
  if (pendingUpdateExpireDate)
  {
    [(NSDate *)pendingUpdateExpireDate timeIntervalSinceNow];
    LOBYTE(pendingUpdateExpireDate) = v3 > 0.0;
  }
  return (char)pendingUpdateExpireDate;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NPKBalanceField *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else if ([(NPKBalanceField *)v4 conformsToProtocol:&unk_26D078108])
  {
    uint64_t v6 = [(NPKBalanceField *)self balance];
    v7 = [(NPKBalanceField *)v5 balance];
    if (PKEqualObjects())
    {
      uint64_t v8 = [(NPKBalanceField *)self label];
      v9 = [(NPKBalanceField *)v5 label];
      if (PKEqualObjects())
      {
        uint64_t v10 = [(NPKBalanceField *)self formattedValue];
        v11 = [(NPKBalanceField *)v5 formattedValue];
        if (PKEqualObjects()
          && (BOOL v12 = [(NPKBalanceField *)self isPrimaryBalance],
              v12 == [(NPKBalanceField *)v5 isPrimaryBalance]))
        {
          uint64_t v14 = [(NPKBalanceField *)self action];
          id v15 = [(NPKBalanceField *)v5 action];
          char v13 = PKEqualObjects();
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  double v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  id v5 = [(NPKBalanceField *)self label];
  uint64_t v6 = [(NPKBalanceField *)self formattedValue];
  [(NPKBalanceField *)self isPrimaryBalance];
  v7 = NSStringFromBOOL();
  uint64_t v8 = [(NPKBalanceField *)self identifier];
  v9 = [v3 stringWithFormat:@"<%@: %p> {label:%@ formattedValue:%@ isPrimaryBalance:%@ ID:%@", v4, self, v5, v6, v7, v8];

  pendingUpdateExpireDate = self->_pendingUpdateExpireDate;
  if (pendingUpdateExpireDate) {
    [v9 appendFormat:@" PendingUpdateExpireDate:%@ hasPendingUpdate:%d", pendingUpdateExpireDate, -[NPKBalanceField hasPendingUpdate](self, "hasPendingUpdate")];
  }
  v11 = [(NPKBalanceField *)self balance];

  if (v11)
  {
    BOOL v12 = [(NPKBalanceField *)self balance];
    char v13 = [v12 value];
    [v9 appendFormat:@" balanceValue:%@", v13];
  }
  uint64_t v14 = [(NPKBalanceField *)self action];

  if (v14)
  {
    id v15 = [(NPKBalanceField *)self action];
    [v9 appendFormat:@" action:%@", v15];
  }
  [v9 appendString:@"}"];
  return (NSString *)v9;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)formattedValue
{
  return self->_formattedValue;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isPrimaryBalance
{
  return self->_isPrimaryBalance;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (PKPaymentBalance)balance
{
  return self->_balance;
}

- (NSNumber)rawCountValue
{
  return self->_rawCountValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawCountValue, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_formattedValue, 0);
  objc_storeStrong((id *)&self->detailLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pendingUpdateExpireDate, 0);
}

@end