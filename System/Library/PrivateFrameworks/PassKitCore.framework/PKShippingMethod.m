@interface PKShippingMethod
+ (BOOL)supportsSecureCoding;
+ (PKShippingMethod)shippingMethodWithProtobuf:(id)a3;
+ (int64_t)version;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToShippingMethod:(id)a3;
- (NSString)detail;
- (NSString)identifier;
- (PKDateComponentsRange)dateComponentsRange;
- (PKShippingMethod)initWithCoder:(id)a3;
- (PKShippingMethod)initWithDictionary:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)shippingMethodProtobuf;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateComponentsRange:(PKDateComponentsRange *)dateComponentsRange;
- (void)setDetail:(NSString *)detail;
- (void)setIdentifier:(NSString *)identifier;
@end

@implementation PKShippingMethod

+ (PKShippingMethod)shippingMethodWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKShippingMethod);
  if ([v3 hasDecimalAmount])
  {
    v5 = [v3 decimalAmount];
    uint64_t v6 = PKProtoSupportDecimalNumberFromProtobuf(v5);
LABEL_5:
    v7 = (void *)v6;
    [(PKPaymentSummaryItem *)v4 setAmount:v6];

    goto LABEL_7;
  }
  if ([v3 hasCustomPrecisionAmount])
  {
    v5 = [v3 customPrecisionAmount];
    uint64_t v6 = PKLegacyCurrencyStorageIntegerToDecimal([v5 amount], 1);
    goto LABEL_5;
  }
  v5 = PKLegacyCurrencyStorageIntegerToDecimal([v3 amount], 0);
  [(PKPaymentSummaryItem *)v4 setAmount:v5];
LABEL_7:

  v8 = [v3 label];
  [(PKPaymentSummaryItem *)v4 setLabel:v8];

  -[PKPaymentSummaryItem setType:](v4, "setType:", [v3 type]);
  v9 = [v3 identifier];
  [(PKShippingMethod *)v4 setIdentifier:v9];

  v10 = [v3 detail];
  [(PKShippingMethod *)v4 setDetail:v10];

  return v4;
}

- (id)shippingMethodProtobuf
{
  id v3 = objc_alloc_init(PKProtobufShippingMethod);
  v4 = [(PKPaymentSummaryItem *)self amount];
  [(PKProtobufShippingMethod *)v3 setAmount:PKCurrencyDecimalToLegacyStorageInteger(v4, 0)];

  v5 = [(PKPaymentSummaryItem *)self amount];
  uint64_t v6 = DecimalToCustomPrecisionProtobuf(v5);
  [(PKProtobufShippingMethod *)v3 setCustomPrecisionAmount:v6];

  v7 = [(PKPaymentSummaryItem *)self amount];
  v8 = PKProtoSupportProtoDecimalNumberFromDecimalNumber(v7);
  [(PKProtobufShippingMethod *)v3 setDecimalAmount:v8];

  v9 = [(PKPaymentSummaryItem *)self label];
  [(PKProtobufShippingMethod *)v3 setLabel:v9];

  [(PKProtobufShippingMethod *)v3 setType:[(PKPaymentSummaryItem *)self type]];
  v10 = [(PKShippingMethod *)self identifier];
  [(PKProtobufShippingMethod *)v3 setIdentifier:v10];

  v11 = [(PKShippingMethod *)self detail];
  [(PKProtobufShippingMethod *)v3 setDetail:v11];

  return v3;
}

+ (int64_t)version
{
  return 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PKShippingMethod;
  v5 = -[PKPaymentSummaryItem copyWithZone:](&v13, sel_copyWithZone_);
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[7];
  v5[7] = v6;

  uint64_t v8 = [(NSString *)self->_detail copyWithZone:a3];
  v9 = (void *)v5[8];
  v5[8] = v8;

  id v10 = [(PKDateComponentsRange *)self->_dateComponentsRange copyWithZone:a3];
  v11 = (void *)v5[9];
  v5[9] = v10;

  return v5;
}

- (PKShippingMethod)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKShippingMethod;
  v5 = [(PKPaymentSummaryItem *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(PKShippingMethod *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detail"];
    [(PKShippingMethod *)v5 setDetail:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateComponentsRange"];
    [(PKShippingMethod *)v5 setDateComponentsRange:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKShippingMethod;
  id v4 = a3;
  [(PKPaymentSummaryItem *)&v8 encodeWithCoder:v4];
  v5 = [(PKShippingMethod *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(PKShippingMethod *)self detail];
  [v4 encodeObject:v6 forKey:@"detail"];

  v7 = [(PKShippingMethod *)self dateComponentsRange];
  [v4 encodeObject:v7 forKey:@"dateComponentsRange"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_detail];
  [v3 safelyAddObject:self->_dateComponentsRange];
  v7.receiver = self;
  v7.super_class = (Class)PKShippingMethod;
  id v4 = [(PKPaymentSummaryItem *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKShippingMethod *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKShippingMethod *)self isEqualToShippingMethod:v5];

  return v6;
}

- (BOOL)isEqualToShippingMethod:(id)a3
{
  id v4 = a3;
  if (![(PKPaymentSummaryItem *)self isEqualToPaymentSummaryItem:v4]) {
    goto LABEL_17;
  }
  unint64_t v5 = (void *)v4[7];
  BOOL v6 = self->_identifier;
  objc_super v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    objc_super v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_16;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_17;
    }
  }
  v11 = (void *)v4[8];
  BOOL v6 = self->_detail;
  v12 = v11;
  if (v6 == v12)
  {

    goto LABEL_21;
  }
  objc_super v8 = v12;
  if (v6) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
LABEL_16:

LABEL_17:
    BOOL v14 = 0;
    goto LABEL_18;
  }
  BOOL v16 = [(NSString *)v6 isEqualToString:v12];

  if (!v16) {
    goto LABEL_17;
  }
LABEL_21:
  dateComponentsRange = self->_dateComponentsRange;
  v18 = (PKDateComponentsRange *)v4[9];
  if (dateComponentsRange && v18) {
    BOOL v14 = -[PKDateComponentsRange isEqual:](dateComponentsRange, "isEqual:");
  }
  else {
    BOOL v14 = dateComponentsRange == v18;
  }
LABEL_18:

  return v14;
}

- (PKShippingMethod)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKShippingMethod;
  objc_super v7 = [(PKPaymentSummaryItem *)&v13 initWithDictionary:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = [v6 PKStringForKey:@"detail"];
    detail = v7->_detail;
    v7->_detail = (NSString *)v8;

    uint64_t v10 = [v6 PKStringForKey:@"identifier"];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v10;
  }
  return v7;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  v10.receiver = self;
  v10.super_class = (Class)PKShippingMethod;
  id v4 = [(PKPaymentSummaryItem *)&v10 dictionaryRepresentation];
  unint64_t v5 = [v3 dictionaryWithDictionary:v4];

  detail = self->_detail;
  if (detail) {
    [v5 setObject:detail forKeyedSubscript:@"detail"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v5 setObject:identifier forKeyedSubscript:@"identifier"];
  }
  uint64_t v8 = (void *)[v5 copy];

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSString *)identifier
{
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(NSString *)detail
{
}

- (PKDateComponentsRange)dateComponentsRange
{
  return self->_dateComponentsRange;
}

- (void)setDateComponentsRange:(PKDateComponentsRange *)dateComponentsRange
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponentsRange, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end