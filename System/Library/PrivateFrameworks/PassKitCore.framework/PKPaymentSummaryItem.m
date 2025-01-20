@interface PKPaymentSummaryItem
+ (BOOL)supportsSecureCoding;
+ (PKPaymentSummaryItem)itemWithProtobuf:(id)a3;
+ (PKPaymentSummaryItem)summaryItemWithLabel:(NSString *)label amount:(NSDecimalNumber *)amount;
+ (PKPaymentSummaryItem)summaryItemWithLabel:(NSString *)label amount:(NSDecimalNumber *)amount type:(PKPaymentSummaryItemType)type;
+ (id)_automaticReloadPaymentSummaryItemWithProtobuf:(id)a3;
+ (id)_deferredSummaryItemWithProtobuf:(id)a3;
+ (id)_recurringSummaryItemWithProtobuf:(id)a3;
+ (int64_t)version;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPaymentSummaryItem:(id)a3;
- (BOOL)useDarkColor;
- (BOOL)useLargeFont;
- (NSDecimalNumber)amount;
- (NSString)label;
- (NSString)localizedAmount;
- (NSString)localizedTitle;
- (PKPaymentSummaryItem)initWithCoder:(id)a3;
- (PKPaymentSummaryItem)initWithDictionary:(id)a3 error:(id *)a4;
- (PKPaymentSummaryItemType)type;
- (id)_protobufAutomaticReloadPaymentSummaryItemForItem:(id)a3;
- (id)_protobufDeferredSummaryItemForItem:(id)a3;
- (id)_protobufRecurringSummaryItemForItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)summaryItemProtobuf;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(NSDecimalNumber *)amount;
- (void)setLabel:(NSString *)label;
- (void)setLocalizedAmount:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setType:(PKPaymentSummaryItemType)type;
- (void)setUseDarkColor:(BOOL)a3;
- (void)setUseLargeFont:(BOOL)a3;
@end

@implementation PKPaymentSummaryItem

+ (PKPaymentSummaryItem)itemWithProtobuf:(id)a3
{
  id v4 = a3;
  if ([v4 hasRecurringPaymentSummaryItem])
  {
    v5 = [v4 recurringPaymentSummaryItem];
    uint64_t v6 = [a1 _recurringSummaryItemWithProtobuf:v5];
LABEL_9:
    id v7 = (id)v6;

    goto LABEL_10;
  }
  if ([v4 hasDeferredPaymentSummaryItem])
  {
    v5 = [v4 deferredPaymentSummaryItem];
    uint64_t v6 = [a1 _deferredSummaryItemWithProtobuf:v5];
    goto LABEL_9;
  }
  if ([v4 hasShippingMethodSummaryItem])
  {
    v5 = [v4 shippingMethodSummaryItem];
    uint64_t v6 = +[PKShippingMethod shippingMethodWithProtobuf:v5];
    goto LABEL_9;
  }
  if ([v4 hasAutomaticReloadPaymentSummaryItem])
  {
    v5 = [v4 automaticReloadPaymentSummaryItem];
    uint64_t v6 = +[PKPaymentSummaryItem _automaticReloadPaymentSummaryItemWithProtobuf:v5];
    goto LABEL_9;
  }
  if ([v4 hasInstantFundsOutFeeSummaryItem])
  {
    v13 = PKInstantFundsOutFeeSummaryItem;
  }
  else if ([v4 hasDisbursementSummaryItem])
  {
    v13 = PKDisbursementSummaryItem;
  }
  else
  {
    v13 = PKPaymentSummaryItem;
  }
  id v7 = objc_alloc_init(v13);
LABEL_10:
  if ([v4 hasDecimalAmount])
  {
    v8 = [v4 decimalAmount];
    uint64_t v9 = PKProtoSupportDecimalNumberFromProtobuf(v8);
LABEL_14:
    v10 = (void *)v9;
    [v7 setAmount:v9];

    goto LABEL_16;
  }
  if ([v4 hasCustomPrecisionAmount])
  {
    v8 = [v4 customPrecisionAmount];
    uint64_t v9 = PKLegacyCurrencyStorageIntegerToDecimal([v8 amount], 1);
    goto LABEL_14;
  }
  v8 = PKLegacyCurrencyStorageIntegerToDecimal([v4 amount], 0);
  [v7 setAmount:v8];
LABEL_16:

  v11 = [v4 label];
  [v7 setLabel:v11];

  objc_msgSend(v7, "setType:", objc_msgSend(v4, "type"));
  return (PKPaymentSummaryItem *)v7;
}

- (id)summaryItemProtobuf
{
  v3 = objc_alloc_init(PKProtobufPaymentSummaryItem);
  id v4 = [(PKPaymentSummaryItem *)self amount];
  [(PKProtobufPaymentSummaryItem *)v3 setAmount:PKCurrencyDecimalToLegacyStorageInteger(v4, 0)];

  v5 = [(PKPaymentSummaryItem *)self amount];
  uint64_t v6 = DecimalToCustomPrecisionProtobuf(v5);
  [(PKProtobufPaymentSummaryItem *)v3 setCustomPrecisionAmount:v6];

  id v7 = [(PKPaymentSummaryItem *)self amount];
  v8 = PKProtoSupportProtoDecimalNumberFromDecimalNumber(v7);
  [(PKProtobufPaymentSummaryItem *)v3 setDecimalAmount:v8];

  uint64_t v9 = [(PKPaymentSummaryItem *)self label];
  [(PKProtobufPaymentSummaryItem *)v3 setLabel:v9];

  [(PKProtobufPaymentSummaryItem *)v3 setType:[(PKPaymentSummaryItem *)self type]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [(PKPaymentSummaryItem *)self _protobufRecurringSummaryItemForItem:self];
    [(PKProtobufPaymentSummaryItem *)v3 setRecurringPaymentSummaryItem:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [(PKPaymentSummaryItem *)self _protobufDeferredSummaryItemForItem:self];
      [(PKProtobufPaymentSummaryItem *)v3 setDeferredPaymentSummaryItem:v10];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = [(PKPaymentSummaryItem *)self shippingMethodProtobuf];
        [(PKProtobufPaymentSummaryItem *)v3 setShippingMethodSummaryItem:v10];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [(PKPaymentSummaryItem *)self _protobufAutomaticReloadPaymentSummaryItemForItem:self];
          [(PKProtobufPaymentSummaryItem *)v3 setAutomaticReloadPaymentSummaryItem:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v10 = objc_alloc_init(PKProtobufInstantFundsOutFeeSummaryItem);
            [(PKProtobufPaymentSummaryItem *)v3 setInstantFundsOutFeeSummaryItem:v10];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_14;
            }
            v10 = objc_alloc_init(PKProtobufDisbursementSummaryItem);
            [(PKProtobufPaymentSummaryItem *)v3 setDisbursementSummaryItem:v10];
          }
        }
      }
    }
  }

LABEL_14:
  return v3;
}

+ (id)_recurringSummaryItemWithProtobuf:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKRecurringPaymentSummaryItem);
  if ([v3 hasStartDate])
  {
    v5 = (void *)MEMORY[0x1E4F1C9C8];
    [v3 startDate];
    uint64_t v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    [(PKRecurringPaymentSummaryItem *)v4 setStartDate:v6];
  }
  if ([v3 hasEndDate])
  {
    id v7 = (void *)MEMORY[0x1E4F1C9C8];
    [v3 endDate];
    v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    [(PKRecurringPaymentSummaryItem *)v4 setEndDate:v8];
  }
  -[PKRecurringPaymentSummaryItem setIntervalUnit:](v4, "setIntervalUnit:", [v3 intervalUnit]);
  -[PKRecurringPaymentSummaryItem setIntervalCount:](v4, "setIntervalCount:", [v3 intervalCount]);

  return v4;
}

+ (id)_deferredSummaryItemWithProtobuf:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKDeferredPaymentSummaryItem);
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 deferredDate];
  double v7 = v6;

  v8 = [v5 dateWithTimeIntervalSinceReferenceDate:v7];
  [(PKDeferredPaymentSummaryItem *)v4 setDeferredDate:v8];

  return v4;
}

+ (id)_automaticReloadPaymentSummaryItemWithProtobuf:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKAutomaticReloadPaymentSummaryItem);
  if ([v3 hasThresholdDecimalAmount])
  {
    v5 = [v3 thresholdDecimalAmount];

    PKProtoSupportDecimalNumberFromProtobuf(v5);
  }
  else
  {
    v5 = [v3 thresholdAmount];

    PKLegacyCurrencyStorageIntegerToDecimal([v5 amount], 1);
  double v6 = };
  [(PKAutomaticReloadPaymentSummaryItem *)v4 setThresholdAmount:v6];

  return v4;
}

- (id)_protobufRecurringSummaryItemForItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKProtobufRecurringPaymentSummaryItem);
  v5 = [v3 startDate];

  if (v5)
  {
    double v6 = [v3 startDate];
    [v6 timeIntervalSinceReferenceDate];
    -[PKProtobufRecurringPaymentSummaryItem setStartDate:](v4, "setStartDate:");
  }
  double v7 = [v3 endDate];

  if (v7)
  {
    v8 = [v3 endDate];
    [v8 timeIntervalSinceReferenceDate];
    -[PKProtobufRecurringPaymentSummaryItem setEndDate:](v4, "setEndDate:");
  }
  -[PKProtobufRecurringPaymentSummaryItem setIntervalUnit:](v4, "setIntervalUnit:", [v3 intervalUnit]);
  -[PKProtobufRecurringPaymentSummaryItem setIntervalCount:](v4, "setIntervalCount:", [v3 intervalCount]);

  return v4;
}

- (id)_protobufDeferredSummaryItemForItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKProtobufDeferredPaymentSummaryItem);
  v5 = [v3 deferredDate];

  [v5 timeIntervalSinceReferenceDate];
  -[PKProtobufDeferredPaymentSummaryItem setDeferredDate:](v4, "setDeferredDate:");

  return v4;
}

- (id)_protobufAutomaticReloadPaymentSummaryItemForItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKProtobufAutomaticReloadPaymentSummaryItem);
  v5 = [v3 thresholdAmount];
  double v6 = DecimalToCustomPrecisionProtobuf(v5);
  [(PKProtobufAutomaticReloadPaymentSummaryItem *)v4 setThresholdAmount:v6];

  double v7 = [v3 thresholdAmount];

  v8 = PKProtoSupportProtoDecimalNumberFromDecimalNumber(v7);
  [(PKProtobufAutomaticReloadPaymentSummaryItem *)v4 setThresholdDecimalAmount:v8];

  return v4;
}

+ (int64_t)version
{
  return 4;
}

+ (PKPaymentSummaryItem)summaryItemWithLabel:(NSString *)label amount:(NSDecimalNumber *)amount
{
  v5 = amount;
  double v6 = label;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setLabel:v6];

  [v7 setAmount:v5];
  return (PKPaymentSummaryItem *)v7;
}

+ (PKPaymentSummaryItem)summaryItemWithLabel:(NSString *)label amount:(NSDecimalNumber *)amount type:(PKPaymentSummaryItemType)type
{
  id v7 = amount;
  v8 = label;
  uint64_t v9 = [(id)objc_opt_class() summaryItemWithLabel:v8 amount:v7];

  [v9 setType:type];
  return (PKPaymentSummaryItem *)v9;
}

- (void)setAmount:(NSDecimalNumber *)amount
{
  PKCurrencyDecimalAmountRound(amount);
  id v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v5 = self->_amount;
  self->_amount = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(NSString *)self->_label copyWithZone:a3];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_amount copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_localizedTitle copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_localizedAmount copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  *((unsigned char *)v5 + 8) = self->_useDarkColor;
  *((unsigned char *)v5 + 9) = self->_useLargeFont;
  return v5;
}

- (PKPaymentSummaryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSummaryItem;
  v5 = [(PKPaymentSummaryItem *)&v11 init];
  if (v5)
  {
    uint64_t v6 = PKCurrencyStorageIntegerToCurrencyDecimalWithPrecision([v4 decodeInt64ForKey:@"amount"], 4);
    [(PKPaymentSummaryItem *)v5 setAmount:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    [(PKPaymentSummaryItem *)v5 setLabel:v7];

    -[PKPaymentSummaryItem setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    [(PKPaymentSummaryItem *)v5 setLocalizedTitle:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedAmount"];
    [(PKPaymentSummaryItem *)v5 setLocalizedAmount:v9];

    -[PKPaymentSummaryItem setUseDarkColor:](v5, "setUseDarkColor:", [v4 decodeBoolForKey:@"useDarkColor"]);
    -[PKPaymentSummaryItem setUseLargeFont:](v5, "setUseLargeFont:", [v4 decodeBoolForKey:@"useLargeFont"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", PKCurrencyDecimalToStorageIntegerWithPrecision(amount, 4), @"amount");
  v5 = [(PKPaymentSummaryItem *)self label];
  [v6 encodeObject:v5 forKey:@"label"];

  [v6 encodeInteger:self->_type forKey:@"type"];
  [v6 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v6 encodeObject:self->_localizedAmount forKey:@"localizedAmount"];
  [v6 encodeBool:self->_useDarkColor forKey:@"useDarkColor"];
  [v6 encodeBool:self->_useLargeFont forKey:@"useLargeFont"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_label];
  [v3 safelyAddObject:self->_amount];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPaymentSummaryItem *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentSummaryItem *)self isEqualToPaymentSummaryItem:v5];

  return v6;
}

- (BOOL)isEqualToPaymentSummaryItem:(id)a3
{
  uint64_t v4 = a3;
  unint64_t v5 = v4;
  if (self->_type != v4[4]) {
    goto LABEL_12;
  }
  BOOL v6 = (void *)v4[2];
  id v7 = self->_label;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if (!v7 || !v8)
    {

LABEL_12:
      char v13 = 0;
      goto LABEL_13;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_12;
    }
  }
  amount = self->_amount;
  uint64_t v12 = (NSDecimalNumber *)v5[3];
  if (amount && v12) {
    char v13 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
  }
  else {
    char v13 = amount == v12;
  }
LABEL_13:

  return v13;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(PKPaymentSummaryItem *)self label];
  unint64_t v5 = (void *)v4;
  if (v4) {
    [v3 appendFormat:@"label: %@; ", v4];
  }
  uint64_t v6 = [(PKPaymentSummaryItem *)self amount];
  id v7 = (void *)v6;
  if (v6) {
    [v3 appendFormat:@"amount: %@; ", v6];
  }
  if (self->_type == 1) {
    uint64_t v8 = @"Pending";
  }
  else {
    uint64_t v8 = @"Final";
  }
  [v3 appendFormat:@"type: %@; ", v8];
  [v3 appendFormat:@">"];
  uint64_t v9 = (void *)[v3 copy];

  return v9;
}

- (PKPaymentSummaryItem)initWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(PKPaymentSummaryItem *)self init];
  if (v6)
  {
    id v7 = [v5 PKStringForKey:@"amount"];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v7];
      amount = v6->_amount;
      v6->_amount = (NSDecimalNumber *)v8;
    }
    uint64_t v10 = [v5 PKStringForKey:@"label"];
    label = v6->_label;
    v6->_label = (NSString *)v10;

    uint64_t v12 = [v5 PKStringForKey:@"type"];
    if ([v12 isEqualToString:@"Pending"]) {
      v6->_type = 1;
    }
  }
  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = v3;
  if (self->_type == 1) {
    id v5 = @"Pending";
  }
  else {
    id v5 = @"Final";
  }
  [v3 setObject:v5 forKeyedSubscript:@"type"];
  label = self->_label;
  if (label) {
    [v4 setObject:label forKeyedSubscript:@"label"];
  }
  amount = self->_amount;
  if (amount)
  {
    uint64_t v8 = [(NSDecimalNumber *)amount stringValue];
    [v4 setObject:v8 forKeyedSubscript:@"amount"];
  }
  uint64_t v9 = (void *)[v4 copy];

  return v9;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (PKPaymentSummaryItemType)type
{
  return self->_type;
}

- (void)setType:(PKPaymentSummaryItemType)type
{
  self->_type = type;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedAmount
{
  return self->_localizedAmount;
}

- (void)setLocalizedAmount:(id)a3
{
}

- (BOOL)useDarkColor
{
  return self->_useDarkColor;
}

- (void)setUseDarkColor:(BOOL)a3
{
  self->_useDarkColor = a3;
}

- (BOOL)useLargeFont
{
  return self->_useLargeFont;
}

- (void)setUseLargeFont:(BOOL)a3
{
  self->_useLargeFont = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAmount, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end