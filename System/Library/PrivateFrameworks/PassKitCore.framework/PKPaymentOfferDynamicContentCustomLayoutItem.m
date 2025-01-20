@interface PKPaymentOfferDynamicContentCustomLayoutItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKPaymentOfferDynamicContentCustomLayoutItem)initWithCoder:(id)a3;
- (PKPaymentOfferDynamicContentCustomLayoutItem)initWithDictionary:(id)a3;
- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)leadingText;
- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)trailingText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferDynamicContentCustomLayoutItem

- (PKPaymentOfferDynamicContentCustomLayoutItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_14;
  }
  v5 = [v4 PKStringForKey:@"type"];
  v6 = v5;
  if (v5 != @"text")
  {
    if (v5)
    {
      char v7 = [(__CFString *)v5 isEqualToString:@"text"];

      if (v7) {
        goto LABEL_5;
      }
      v13 = v6;
      v14 = v13;
      if (v13 == @"divider"
        || (char v15 = [(__CFString *)v13 isEqualToString:@"divider"],
            v14,
            (v15 & 1) != 0))
      {

        unint64_t v10 = 0;
        unint64_t v11 = 0;
        uint64_t v12 = 2;
        goto LABEL_10;
      }
    }

    goto LABEL_14;
  }
LABEL_5:

  v8 = [v4 PKDictionaryForKey:@"leadingText"];
  v9 = [v4 PKDictionaryForKey:@"trailingText"];
  unint64_t v10 = [[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails alloc] initWithDictionary:v8];
  unint64_t v11 = [[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails alloc] initWithDictionary:v9];

  if (!(v10 | v11))
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = 1;
LABEL_10:
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentOfferDynamicContentCustomLayoutItem;
  v16 = [(PKPaymentOfferDynamicContentCustomLayoutItem *)&v20 init];
  p_isa = (id *)&v16->super.isa;
  if (v16)
  {
    v16->_type = v12;
    objc_storeStrong((id *)&v16->_leadingText, (id)v10);
    objc_storeStrong(p_isa + 3, (id)v11);
  }
  self = p_isa;

  v18 = self;
LABEL_15:

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  unint64_t type = self->_type;
  v6 = @"unknown";
  if (type == 1) {
    v6 = @"text";
  }
  if (type == 2) {
    char v7 = @"divider";
  }
  else {
    char v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"type"];
  v8 = [(PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)self->_leadingText dictionaryRepresentation];
  [v4 setObject:v8 forKeyedSubscript:@"leadingText"];

  v9 = [(PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)self->_trailingText dictionaryRepresentation];
  [v4 setObject:v9 forKeyedSubscript:@"trailingText"];

  unint64_t v10 = (void *)[v4 copy];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferDynamicContentCustomLayoutItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        leadingText = self->_leadingText;
        v8 = v6->_leadingText;
        if (leadingText && v8)
        {
          if (!-[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails isEqual:](leadingText, "isEqual:")) {
            goto LABEL_16;
          }
        }
        else if (leadingText != v8)
        {
          goto LABEL_16;
        }
        trailingText = self->_trailingText;
        unint64_t v11 = v6->_trailingText;
        if (trailingText && v11)
        {
          if (-[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails isEqual:](trailingText, "isEqual:"))
          {
LABEL_14:
            BOOL v9 = self->_type == v6->_type;
LABEL_17:

            goto LABEL_18;
          }
        }
        else if (trailingText == v11)
        {
          goto LABEL_14;
        }
LABEL_16:
        BOOL v9 = 0;
        goto LABEL_17;
      }
    }
    BOOL v9 = 0;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_leadingText];
  [v3 safelyAddObject:self->_trailingText];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t type = self->_type;
  unint64_t v5 = @"unknown";
  if (type == 1) {
    unint64_t v5 = @"text";
  }
  if (type == 2) {
    v6 = @"divider";
  }
  else {
    v6 = v5;
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  [v3 appendFormat:@"leadingText: '%@'; ", self->_leadingText];
  [v3 appendFormat:@"trailingText: '%@'; ", self->_trailingText];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentCustomLayoutItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferDynamicContentCustomLayoutItem;
  unint64_t v5 = [(PKPaymentOfferDynamicContentCustomLayoutItem *)&v11 init];
  if (v5)
  {
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leadingText"];
    leadingText = v5->_leadingText;
    v5->_leadingText = (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trailingText"];
    trailingText = v5->_trailingText;
    v5->_trailingText = (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_leadingText forKey:@"leadingText"];
  [v5 encodeObject:self->_trailingText forKey:@"trailingText"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferDynamicContentCustomLayoutItem allocWithZone:](PKPaymentOfferDynamicContentCustomLayoutItem, "allocWithZone:") init];
  uint64_t v6 = [(PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)self->_leadingText copyWithZone:a3];
  leadingText = v5->_leadingText;
  v5->_leadingText = v6;

  uint64_t v8 = [(PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)self->_trailingText copyWithZone:a3];
  trailingText = v5->_trailingText;
  v5->_trailingText = v8;

  v5->_unint64_t type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)leadingText
{
  return self->_leadingText;
}

- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)trailingText
{
  return self->_trailingText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
}

@end