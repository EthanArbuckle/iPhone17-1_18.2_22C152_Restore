@interface PKTransactionReceiptHeaderField
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransactionReceiptHeaderField:(id)a3;
- (NSString)key;
- (NSString)label;
- (NSString)value;
- (PKTransactionReceiptHeaderField)initWithCoder:(id)a3;
- (PKTransactionReceiptHeaderField)initWithDictionary:(id)a3 bundle:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
- (void)setLabel:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKTransactionReceiptHeaderField

- (PKTransactionReceiptHeaderField)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKTransactionReceiptHeaderField;
  v8 = [(PKTransactionReceiptHeaderField *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 PKStringForKey:@"key"];
    key = v8->_key;
    v8->_key = (NSString *)v9;

    v11 = [v6 PKStringForKey:@"label"];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = PKLocalizedReceiptStringForReceiptBundle(v11, v7);
      label = v8->_label;
      v8->_label = (NSString *)v13;
    }
    uint64_t v15 = [v6 PKStringForKey:@"value"];
    value = v8->_value;
    v8->_value = (NSString *)v15;
  }
  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"key: '%@'; ", self->_key];
  [v3 appendFormat:@"label: '%@'; ", self->_label];
  [v3 appendFormat:@"value: '%@'; ", self->_value];
  [v3 appendFormat:@">"];
  v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKTransactionReceiptHeaderField *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransactionReceiptHeaderField *)self isEqualToTransactionReceiptHeaderField:v5];

  return v6;
}

- (BOOL)isEqualToTransactionReceiptHeaderField:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    BOOL v6 = (void *)v4[1];
    id v7 = self->_key;
    v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      uint64_t v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8) {
        goto LABEL_20;
      }
      BOOL v10 = [(NSString *)v7 isEqualToString:v8];

      if (!v10) {
        goto LABEL_21;
      }
    }
    v11 = (void *)v5[2];
    id v7 = self->_label;
    v12 = v11;
    if (v7 == v12)
    {

LABEL_15:
      value = self->_value;
      v14 = (void *)v5[3];
      id v7 = value;
      uint64_t v15 = v14;
      if (v7 == v15)
      {
        LOBYTE(v10) = 1;
        uint64_t v9 = v7;
      }
      else
      {
        uint64_t v9 = v15;
        LOBYTE(v10) = 0;
        if (v7 && v15) {
          LOBYTE(v10) = [(NSString *)v7 isEqualToString:v15];
        }
      }
      goto LABEL_20;
    }
    uint64_t v9 = v12;
    LOBYTE(v10) = 0;
    if (v7 && v12)
    {
      BOOL v10 = [(NSString *)v7 isEqualToString:v12];

      if (!v10) {
        goto LABEL_21;
      }
      goto LABEL_15;
    }
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v10) = 0;
LABEL_21:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_key];
  [v3 safelyAddObject:self->_label];
  [v3 safelyAddObject:self->_value];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReceiptHeaderField)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionReceiptHeaderField;
  v5 = [(PKTransactionReceiptHeaderField *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"key"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_label copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_value copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end