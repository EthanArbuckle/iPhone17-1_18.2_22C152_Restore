@interface PKLabeledValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)label;
- (NSString)value;
- (PKLabeledValue)init;
- (PKLabeledValue)initWithCoder:(id)a3;
- (PKLabeledValue)initWithLabel:(NSString *)label value:(NSString *)value;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKLabeledValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKLabeledValue)init
{
  return [(PKLabeledValue *)self initWithLabel:&stru_1EE0F5368 value:&stru_1EE0F5368];
}

- (PKLabeledValue)initWithLabel:(NSString *)label value:(NSString *)value
{
  v6 = label;
  v7 = value;
  v14.receiver = self;
  v14.super_class = (Class)PKLabeledValue;
  v8 = [(PKLabeledValue *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)v6 copy];
    v10 = v8->_label;
    v8->_label = (NSString *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    v12 = v8->_value;
    v8->_value = (NSString *)v11;
  }
  return v8;
}

- (PKLabeledValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKLabeledValue;
  v5 = [(PKLabeledValue *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKLVLabel"];
    uint64_t v7 = [v6 copy];
    label = v5->_label;
    v5->_label = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKLVValue"];
    uint64_t v10 = [v9 copy];
    value = v5->_value;
    v5->_value = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"PKLVLabel"];
  [v5 encodeObject:self->_value forKey:@"PKLVValue"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  v6 = v5;
  if (!v6) {
    goto LABEL_12;
  }
  label = self->_label;
  v8 = (NSString *)v6[1];
  if (!label || !v8)
  {
    if (label == v8) {
      goto LABEL_8;
    }
LABEL_12:
    char v11 = 0;
    goto LABEL_13;
  }
  if ((-[NSString isEqual:](label, "isEqual:") & 1) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  value = self->_value;
  uint64_t v10 = (NSString *)v6[2];
  if (value && v10) {
    char v11 = -[NSString isEqual:](value, "isEqual:");
  }
  else {
    char v11 = value == v10;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  return [(NSString *)self->_value hash] ^ v3;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end