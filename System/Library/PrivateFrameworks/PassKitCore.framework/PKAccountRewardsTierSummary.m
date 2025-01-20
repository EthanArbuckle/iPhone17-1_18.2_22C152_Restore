@interface PKAccountRewardsTierSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRewardsTierSummary:(id)a3;
- (NSCopying)identifier;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDecimalNumber)onePercentTotal;
- (NSDecimalNumber)specialTotal;
- (NSDecimalNumber)threePercentTotal;
- (NSDecimalNumber)totalAmount;
- (NSDecimalNumber)twoPercentTotal;
- (NSString)currencyCode;
- (NSString)description;
- (PKAccountRewardsTierSummary)initWithCoder:(id)a3;
- (PKAccountRewardsTierSummary)initWithStartDate:(id)a3 endDate:(id)a4 currencyCode:(id)a5 onePercentTotal:(id)a6 twoPercentTotal:(id)a7 threePercentTotal:(id)a8 specialTotal:(id)a9;
- (PKCurrencyAmount)totalCurrencyAmount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currencyAmountForRewardsTier:(unint64_t)a3;
- (id)totalForRewardsTier:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setOnePercentTotal:(id)a3;
- (void)setSpecialTotal:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setThreePercentTotal:(id)a3;
- (void)setTwoPercentTotal:(id)a3;
@end

@implementation PKAccountRewardsTierSummary

- (PKAccountRewardsTierSummary)initWithStartDate:(id)a3 endDate:(id)a4 currencyCode:(id)a5 onePercentTotal:(id)a6 twoPercentTotal:(id)a7 threePercentTotal:(id)a8 specialTotal:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PKAccountRewardsTierSummary;
  v18 = [(PKAccountRewardsTierSummary *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a3);
    objc_storeStrong((id *)&v19->_endDate, a4);
    objc_storeStrong((id *)&v19->_currencyCode, a5);
    objc_storeStrong((id *)&v19->_onePercentTotal, a6);
    objc_storeStrong((id *)&v19->_twoPercentTotal, a7);
    objc_storeStrong((id *)&v19->_threePercentTotal, a8);
    objc_storeStrong((id *)&v19->_specialTotal, a9);
  }

  return v19;
}

- (NSCopying)identifier
{
  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = [MEMORY[0x1E4F29128] UUID];
    v5 = [v4 UUIDString];
    v6 = self->_uuid;
    self->_uuid = v5;

    uuid = self->_uuid;
  }
  return (NSCopying *)uuid;
}

- (NSDecimalNumber)totalAmount
{
  onePercentTotal = [MEMORY[0x1E4F28C28] zero];
  v4 = onePercentTotal;
  if (self->_onePercentTotal) {
    onePercentTotal = self->_onePercentTotal;
  }
  if (self->_twoPercentTotal) {
    twoPercentTotal = self->_twoPercentTotal;
  }
  else {
    twoPercentTotal = v4;
  }
  v6 = [(NSDecimalNumber *)onePercentTotal decimalNumberByAdding:twoPercentTotal];
  v7 = v6;
  if (self->_threePercentTotal) {
    threePercentTotal = self->_threePercentTotal;
  }
  else {
    threePercentTotal = v4;
  }
  v9 = [v6 decimalNumberByAdding:threePercentTotal];

  if (self->_specialTotal) {
    specialTotal = self->_specialTotal;
  }
  else {
    specialTotal = v4;
  }
  v11 = [v9 decimalNumberByAdding:specialTotal];

  return (NSDecimalNumber *)v11;
}

- (PKCurrencyAmount)totalCurrencyAmount
{
  if (self->_currencyCode)
  {
    v3 = [(PKAccountRewardsTierSummary *)self totalAmount];
    v4 = PKCurrencyAmountCreate(v3, self->_currencyCode, 0);
  }
  else
  {
    v4 = 0;
  }
  return (PKCurrencyAmount *)v4;
}

- (id)totalForRewardsTier:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      onePercentTotal = self->_onePercentTotal;
      goto LABEL_7;
    case 2uLL:
      onePercentTotal = self->_twoPercentTotal;
      goto LABEL_7;
    case 3uLL:
      onePercentTotal = self->_threePercentTotal;
      goto LABEL_7;
    case 4uLL:
      onePercentTotal = self->_specialTotal;
LABEL_7:
      v3 = onePercentTotal;
      break;
    default:
      v3 = [MEMORY[0x1E4F28C28] zero];
      break;
  }
  return v3;
}

- (id)currencyAmountForRewardsTier:(unint64_t)a3
{
  if (self->_currencyCode)
  {
    v4 = [(PKAccountRewardsTierSummary *)self totalForRewardsTier:a3];
    v5 = PKCurrencyAmountCreate(v4, self->_currencyCode, 0);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSString)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  v4 = PKLongDateString(self->_startDate);
  [v3 appendFormat:@"startDate: '%@'; ", v4];

  v5 = PKLongDateString(self->_endDate);
  [v3 appendFormat:@"endDate: '%@'; ", v5];

  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  [(NSDecimalNumber *)self->_onePercentTotal doubleValue];
  objc_msgSend(v3, "appendFormat:", @"onePercent: '%f'; ", v6);
  [(NSDecimalNumber *)self->_twoPercentTotal doubleValue];
  objc_msgSend(v3, "appendFormat:", @"twoPercent: '%f'; ", v7);
  [(NSDecimalNumber *)self->_threePercentTotal doubleValue];
  objc_msgSend(v3, "appendFormat:", @"threePercent: '%f'; ", v8);
  [(NSDecimalNumber *)self->_specialTotal doubleValue];
  objc_msgSend(v3, "appendFormat:", @"special: '%f'; ", v9);
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKAccountRewardsTierSummary *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountRewardsTierSummary *)self isEqualToRewardsTierSummary:v5];

  return v6;
}

- (BOOL)isEqualToRewardsTierSummary:(id)a3
{
  v4 = a3;
  if (!v4) {
    goto LABEL_39;
  }
  startDate = self->_startDate;
  BOOL v6 = (NSDate *)v4[2];
  if (startDate) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (startDate != v6) {
      goto LABEL_39;
    }
  }
  else
  {
    char v8 = -[NSDate isEqual:](startDate, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_39;
    }
  }
  endDate = self->_endDate;
  v10 = (NSDate *)v4[3];
  if (endDate && v10)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (endDate != v10)
  {
    goto LABEL_39;
  }
  v11 = (void *)v4[4];
  v12 = self->_currencyCode;
  v13 = v11;
  if (v12 == v13)
  {
  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_39;
    }
    BOOL v15 = [(NSString *)v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_39;
    }
  }
  onePercentTotal = self->_onePercentTotal;
  id v17 = (NSDecimalNumber *)v4[5];
  if (onePercentTotal && v17)
  {
    if ((-[NSDecimalNumber isEqual:](onePercentTotal, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (onePercentTotal != v17)
  {
    goto LABEL_39;
  }
  twoPercentTotal = self->_twoPercentTotal;
  v19 = (NSDecimalNumber *)v4[6];
  if (twoPercentTotal && v19)
  {
    if ((-[NSDecimalNumber isEqual:](twoPercentTotal, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (twoPercentTotal != v19)
  {
    goto LABEL_39;
  }
  threePercentTotal = self->_threePercentTotal;
  id v21 = (NSDecimalNumber *)v4[7];
  if (!threePercentTotal || !v21)
  {
    if (threePercentTotal == v21) {
      goto LABEL_35;
    }
LABEL_39:
    char v24 = 0;
    goto LABEL_40;
  }
  if ((-[NSDecimalNumber isEqual:](threePercentTotal, "isEqual:") & 1) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  specialTotal = self->_specialTotal;
  id v23 = (NSDecimalNumber *)v4[8];
  if (specialTotal && v23) {
    char v24 = -[NSDecimalNumber isEqual:](specialTotal, "isEqual:");
  }
  else {
    char v24 = specialTotal == v23;
  }
LABEL_40:

  return v24;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_endDate];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_onePercentTotal];
  [v3 safelyAddObject:self->_twoPercentTotal];
  [v3 safelyAddObject:self->_threePercentTotal];
  [v3 safelyAddObject:self->_specialTotal];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountRewardsTierSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountRewardsTierSummary;
  v5 = [(PKAccountRewardsTierSummary *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"onePercentTotal"];
    onePercentTotal = v5->_onePercentTotal;
    v5->_onePercentTotal = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"twoPercentTotal"];
    twoPercentTotal = v5->_twoPercentTotal;
    v5->_twoPercentTotal = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threePercentTotal"];
    threePercentTotal = v5->_threePercentTotal;
    v5->_threePercentTotal = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specialTotal"];
    specialTotal = v5->_specialTotal;
    v5->_specialTotal = (NSDecimalNumber *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_onePercentTotal forKey:@"onePercentTotal"];
  [v5 encodeObject:self->_twoPercentTotal forKey:@"twoPercentTotal"];
  [v5 encodeObject:self->_threePercentTotal forKey:@"threePercentTotal"];
  [v5 encodeObject:self->_specialTotal forKey:@"specialTotal"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDate *)self->_startDate copyWithZone:a3];
  BOOL v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSDate *)self->_endDate copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_currencyCode copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_onePercentTotal copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  uint64_t v14 = [(NSDecimalNumber *)self->_twoPercentTotal copyWithZone:a3];
  BOOL v15 = (void *)v5[6];
  v5[6] = v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_threePercentTotal copyWithZone:a3];
  id v17 = (void *)v5[7];
  v5[7] = v16;

  uint64_t v18 = [(NSDecimalNumber *)self->_specialTotal copyWithZone:a3];
  v19 = (void *)v5[8];
  v5[8] = v18;

  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSDecimalNumber)onePercentTotal
{
  return self->_onePercentTotal;
}

- (void)setOnePercentTotal:(id)a3
{
}

- (NSDecimalNumber)twoPercentTotal
{
  return self->_twoPercentTotal;
}

- (void)setTwoPercentTotal:(id)a3
{
}

- (NSDecimalNumber)threePercentTotal
{
  return self->_threePercentTotal;
}

- (void)setThreePercentTotal:(id)a3
{
}

- (NSDecimalNumber)specialTotal
{
  return self->_specialTotal;
}

- (void)setSpecialTotal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialTotal, 0);
  objc_storeStrong((id *)&self->_threePercentTotal, 0);
  objc_storeStrong((id *)&self->_twoPercentTotal, 0);
  objc_storeStrong((id *)&self->_onePercentTotal, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end