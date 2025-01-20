@interface PKAccountHistoricalBalance
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSDecimalNumber)balance;
- (PKAccountHistoricalBalance)initWithBalance:(id)a3 date:(id)a4;
- (PKAccountHistoricalBalance)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBalance:(id)a3;
- (void)setDate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountHistoricalBalance

- (PKAccountHistoricalBalance)initWithBalance:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountHistoricalBalance;
  v9 = [(PKAccountHistoricalBalance *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_balance, a3);
    objc_storeStrong((id *)&v10->_date, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  balance = self->_balance;
  id v5 = a3;
  [v5 encodeObject:balance forKey:@"balance"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (PKAccountHistoricalBalance)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountHistoricalBalance;
  id v5 = [(PKAccountHistoricalBalance *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDate *)self->_date copyWithZone:a3];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_balance copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  v5[3] = self->_type;
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"balance", self->_balance];
  [v3 appendFormat:@"%@: '%@'; ", @"date", self->_date];
  [v3 appendFormat:@"%@: '%lu'; ", @"type", self->_type];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_balance, 0);
}

@end