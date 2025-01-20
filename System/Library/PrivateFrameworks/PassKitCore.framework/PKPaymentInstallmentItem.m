@interface PKPaymentInstallmentItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstallmentItem:(id)a3;
- (NSDecimalNumber)amount;
- (NSDecimalNumber)apr;
- (NSString)currencyCode;
- (NSString)programIdentifier;
- (NSString)programTerms;
- (PKPaymentInstallmentItem)initWithCoder:(id)a3;
- (int64_t)installmentItemType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setApr:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setInstallmentItemType:(int64_t)a3;
- (void)setProgramIdentifier:(id)a3;
- (void)setProgramTerms:(id)a3;
@end

@implementation PKPaymentInstallmentItem

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_programIdentifier];
  [v3 safelyAddObject:self->_apr];
  [v3 safelyAddObject:self->_programTerms];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_installmentItemType - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPaymentInstallmentItem *)a3;
  unint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentInstallmentItem *)self isEqualToInstallmentItem:v5];

  return v6;
}

- (BOOL)isEqualToInstallmentItem:(id)a3
{
  uint64_t v4 = a3;
  unint64_t v5 = v4;
  if (v4 && self->_installmentItemType == v4[1])
  {
    amount = self->_amount;
    v7 = (NSDecimalNumber *)v5[2];
    if (amount && v7)
    {
      if (-[NSDecimalNumber isEqual:](amount, "isEqual:"))
      {
LABEL_10:
        v10 = (void *)v5[3];
        v11 = self->_currencyCode;
        v12 = v10;
        if (v11 == v12)
        {
        }
        else
        {
          v13 = v12;
          LOBYTE(v8) = 0;
          if (!v11 || !v12) {
            goto LABEL_32;
          }
          BOOL v8 = [(NSString *)v11 isEqualToString:v12];

          if (!v8) {
            goto LABEL_9;
          }
        }
        v14 = (void *)v5[4];
        v11 = self->_programIdentifier;
        v15 = v14;
        if (v11 == v15)
        {

LABEL_22:
          apr = self->_apr;
          v17 = (NSDecimalNumber *)v5[5];
          if (apr && v17)
          {
            if (-[NSDecimalNumber isEqual:](apr, "isEqual:"))
            {
LABEL_27:
              programTerms = self->_programTerms;
              v19 = (void *)v5[6];
              v11 = programTerms;
              v20 = v19;
              if (v11 == v20)
              {
                LOBYTE(v8) = 1;
                v13 = v11;
              }
              else
              {
                v13 = v20;
                LOBYTE(v8) = 0;
                if (v11 && v20) {
                  LOBYTE(v8) = [(NSString *)v11 isEqualToString:v20];
                }
              }
              goto LABEL_32;
            }
          }
          else if (apr == v17)
          {
            goto LABEL_27;
          }
          goto LABEL_8;
        }
        v13 = v15;
        LOBYTE(v8) = 0;
        if (v11 && v15)
        {
          BOOL v8 = [(NSString *)v11 isEqualToString:v15];

          if (!v8) {
            goto LABEL_9;
          }
          goto LABEL_22;
        }
LABEL_32:

        goto LABEL_9;
      }
    }
    else if (amount == v7)
    {
      goto LABEL_10;
    }
  }
LABEL_8:
  LOBYTE(v8) = 0;
LABEL_9:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentInstallmentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentInstallmentItem;
  unint64_t v5 = [(PKPaymentInstallmentItem *)&v17 init];
  if (v5)
  {
    v5->_installmentItemType = [v4 decodeIntegerForKey:@"installmentItemType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apr"];
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"term"];
    programTerms = v5->_programTerms;
    v5->_programTerms = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t installmentItemType = self->_installmentItemType;
  id v5 = a3;
  [v5 encodeInteger:installmentItemType forKey:@"installmentItemType"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_programIdentifier forKey:@"identifier"];
  [v5 encodeObject:self->_apr forKey:@"apr"];
  [v5 encodeObject:self->_programTerms forKey:@"term"];
}

- (int64_t)installmentItemType
{
  return self->_installmentItemType;
}

- (void)setInstallmentItemType:(int64_t)a3
{
  self->_int64_t installmentItemType = a3;
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

- (NSString)programIdentifier
{
  return self->_programIdentifier;
}

- (void)setProgramIdentifier:(id)a3
{
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setApr:(id)a3
{
}

- (NSString)programTerms
{
  return self->_programTerms;
}

- (void)setProgramTerms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programTerms, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_programIdentifier, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end