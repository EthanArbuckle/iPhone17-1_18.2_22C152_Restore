@interface PKPayLaterFinancingOptionInstallment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)dueDate;
- (PKPayLaterFinancingAmount)dueAmount;
- (PKPayLaterFinancingOptionInstallment)initWithCoder:(id)a3;
- (PKPayLaterFinancingOptionInstallment)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDueAmount:(id)a3;
- (void)setDueDate:(id)a3;
@end

@implementation PKPayLaterFinancingOptionInstallment

- (PKPayLaterFinancingOptionInstallment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFinancingOptionInstallment;
  v5 = [(PKPayLaterFinancingOptionInstallment *)&v13 init];
  if (v5)
  {
    v6 = [PKPayLaterFinancingAmount alloc];
    v7 = [v4 PKDictionaryForKey:@"dueAmount"];
    uint64_t v8 = [(PKPayLaterFinancingAmount *)v6 initWithDictionary:v7];
    dueAmount = v5->_dueAmount;
    v5->_dueAmount = (PKPayLaterFinancingAmount *)v8;

    uint64_t v10 = [v4 PKDateForKey:@"dueDate"];
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v10;
  }
  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_dueAmount];
  [v3 safelyAddObject:self->_dueDate];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPayLaterFinancingOptionInstallment *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        dueAmount = self->_dueAmount;
        uint64_t v8 = v6->_dueAmount;
        if (dueAmount && v8)
        {
          if (-[PKPayLaterFinancingAmount isEqual:](dueAmount, "isEqual:"))
          {
LABEL_7:
            dueDate = self->_dueDate;
            uint64_t v10 = v6->_dueDate;
            if (dueDate && v10) {
              char v11 = -[NSDate isEqual:](dueDate, "isEqual:");
            }
            else {
              char v11 = dueDate == v10;
            }
            goto LABEL_15;
          }
        }
        else if (dueAmount == v8)
        {
          goto LABEL_7;
        }
        char v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    char v11 = 0;
  }
LABEL_16:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingOptionInstallment)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFinancingOptionInstallment;
  v5 = [(PKPayLaterFinancingOptionInstallment *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueAmount"];
    dueAmount = v5->_dueAmount;
    v5->_dueAmount = (PKPayLaterFinancingAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDate"];
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dueAmount = self->_dueAmount;
  id v5 = a3;
  [v5 encodeObject:dueAmount forKey:@"dueAmount"];
  [v5 encodeObject:self->_dueDate forKey:@"dueDate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(PKPayLaterFinancingAmount *)self->_dueAmount copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSDate *)self->_dueDate copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"dueAmount: '%@'; ", self->_dueAmount];
  [v3 appendFormat:@"dueDate: '%@'; ", self->_dueDate];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
}

- (PKPayLaterFinancingAmount)dueAmount
{
  return self->_dueAmount;
}

- (void)setDueAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueAmount, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
}

@end