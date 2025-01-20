@interface PKRecurringPaymentSummaryItem
+ (BOOL)supportsSecureCoding;
- (BOOL)intervalCountSpecified;
- (BOOL)intervalUnitSpecified;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecurringPaymentSummaryItem:(id)a3;
- (NSCalendarUnit)intervalUnit;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSInteger)intervalCount;
- (PKRecurringPaymentSummaryItem)init;
- (PKRecurringPaymentSummaryItem)initWithCoder:(id)a3;
- (PKRecurringPaymentSummaryItem)initWithDictionary:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(NSDate *)endDate;
- (void)setIntervalCount:(NSInteger)intervalCount;
- (void)setIntervalUnit:(NSCalendarUnit)intervalUnit;
- (void)setStartDate:(NSDate *)startDate;
@end

@implementation PKRecurringPaymentSummaryItem

- (PKRecurringPaymentSummaryItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKRecurringPaymentSummaryItem;
  result = [(PKRecurringPaymentSummaryItem *)&v3 init];
  if (result)
  {
    result->_intervalUnit = 8;
    result->_intervalCount = 1;
  }
  return result;
}

- (BOOL)intervalUnitSpecified
{
  return self->_intervalUnit != 8;
}

- (BOOL)intervalCountSpecified
{
  return self->_intervalCount != 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKRecurringPaymentSummaryItem;
  v5 = -[PKPaymentSummaryItem copyWithZone:](&v11, sel_copyWithZone_);
  uint64_t v6 = [(NSDate *)self->_startDate copyWithZone:a3];
  v7 = (void *)v5[7];
  v5[7] = v6;

  uint64_t v8 = [(NSDate *)self->_endDate copyWithZone:a3];
  v9 = (void *)v5[10];
  v5[10] = v8;

  v5[8] = self->_intervalUnit;
  v5[9] = self->_intervalCount;
  return v5;
}

- (PKRecurringPaymentSummaryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKRecurringPaymentSummaryItem;
  v5 = [(PKPaymentSummaryItem *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    [(PKRecurringPaymentSummaryItem *)v5 setStartDate:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    [(PKRecurringPaymentSummaryItem *)v5 setEndDate:v7];

    -[PKRecurringPaymentSummaryItem setIntervalUnit:](v5, "setIntervalUnit:", [v4 decodeIntegerForKey:@"intervalUnit"]);
    -[PKRecurringPaymentSummaryItem setIntervalCount:](v5, "setIntervalCount:", [v4 decodeIntegerForKey:@"intervalCount"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKRecurringPaymentSummaryItem;
  id v4 = a3;
  [(PKPaymentSummaryItem *)&v7 encodeWithCoder:v4];
  v5 = [(PKRecurringPaymentSummaryItem *)self startDate];
  [v4 encodeObject:v5 forKey:@"startDate"];

  uint64_t v6 = [(PKRecurringPaymentSummaryItem *)self endDate];
  [v4 encodeObject:v6 forKey:@"endDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKRecurringPaymentSummaryItem intervalUnit](self, "intervalUnit"), @"intervalUnit");
  objc_msgSend(v4, "encodeInteger:forKey:", -[PKRecurringPaymentSummaryItem intervalCount](self, "intervalCount"), @"intervalCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_endDate];
  v9.receiver = self;
  v9.super_class = (Class)PKRecurringPaymentSummaryItem;
  id v4 = [(PKPaymentSummaryItem *)&v9 hash];
  uint64_t v5 = PKCombinedHash((uint64_t)v4, v3);
  unint64_t v6 = self->_intervalUnit - v5 + 32 * v5;
  unint64_t v7 = self->_intervalCount - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKRecurringPaymentSummaryItem *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKRecurringPaymentSummaryItem *)self isEqualToRecurringPaymentSummaryItem:v5];

  return v6;
}

- (BOOL)isEqualToRecurringPaymentSummaryItem:(id)a3
{
  id v4 = a3;
  if (![(PKPaymentSummaryItem *)self isEqualToPaymentSummaryItem:v4]) {
    goto LABEL_20;
  }
  startDate = self->_startDate;
  BOOL v6 = (NSDate *)v4[7];
  if (startDate) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (startDate != v6) {
      goto LABEL_20;
    }
  }
  else if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
  {
    goto LABEL_20;
  }
  endDate = self->_endDate;
  objc_super v9 = (NSDate *)v4[10];
  if (endDate) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    if (-[NSDate isEqual:](endDate, "isEqual:")) {
      goto LABEL_18;
    }
LABEL_20:
    BOOL v11 = 0;
    goto LABEL_21;
  }
  if (endDate != v9) {
    goto LABEL_20;
  }
LABEL_18:
  if (self->_intervalUnit != v4[8]) {
    goto LABEL_20;
  }
  BOOL v11 = self->_intervalCount == v4[9];
LABEL_21:

  return v11;
}

- (PKRecurringPaymentSummaryItem)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKRecurringPaymentSummaryItem;
  BOOL v7 = [(PKPaymentSummaryItem *)&v17 initWithDictionary:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = [v6 PKDateForKey:@"startDate"];
    startDate = v7->_startDate;
    v7->_startDate = (NSDate *)v8;

    uint64_t v10 = [v6 PKDateForKey:@"endDate"];
    endDate = v7->_endDate;
    v7->_endDate = (NSDate *)v10;

    uint64_t v12 = [v6 PKIntegerForKey:@"intervalCount"];
    if (v12 >= 1) {
      v7->_intervalCount = v12;
    }
    v13 = [v6 PKStringForKey:@"intervalUnit"];
    v14 = v13;
    if (v13)
    {
      uint64_t v15 = PKCalendarUnitForString(v13);
      if (v15) {
        v7->_intervalUnit = v15;
      }
    }
  }
  return v7;
}

- (id)dictionaryRepresentation
{
  v13.receiver = self;
  v13.super_class = (Class)PKRecurringPaymentSummaryItem;
  id v3 = [(PKPaymentSummaryItem *)&v13 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  startDate = self->_startDate;
  if (startDate)
  {
    id v6 = PKW3CDateStringFromDate(startDate);
    [v4 setObject:v6 forKeyedSubscript:@"startDate"];
  }
  endDate = self->_endDate;
  if (endDate)
  {
    uint64_t v8 = PKW3CDateStringFromDate(endDate);
    [v4 setObject:v8 forKeyedSubscript:@"endDate"];
  }
  objc_super v9 = [NSNumber numberWithInteger:self->_intervalCount];
  [v4 setObject:v9 forKeyedSubscript:@"intervalCount"];

  uint64_t v10 = PKCalendarUnitString(self->_intervalUnit);
  if (v10) {
    [v4 setObject:v10 forKeyedSubscript:@"intervalUnit"];
  }
  BOOL v11 = (void *)[v4 copy];

  return v11;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(NSDate *)startDate
{
}

- (NSCalendarUnit)intervalUnit
{
  return self->_intervalUnit;
}

- (void)setIntervalUnit:(NSCalendarUnit)intervalUnit
{
  self->_intervalUnit = intervalUnit;
}

- (NSInteger)intervalCount
{
  return self->_intervalCount;
}

- (void)setIntervalCount:(NSInteger)intervalCount
{
  self->_intervalCount = intervalCount;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(NSDate *)endDate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end