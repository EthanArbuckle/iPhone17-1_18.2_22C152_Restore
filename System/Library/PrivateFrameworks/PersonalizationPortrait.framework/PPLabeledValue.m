@interface PPLabeledValue
+ (BOOL)supportsSecureCoding;
+ (PPLabeledValue)labeledValueWithLabel:(id)a3 value:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLabeledValue:(id)a3;
- (NSCopying)value;
- (NSString)label;
- (PPLabeledValue)initWithCoder:(id)a3;
- (PPLabeledValue)initWithLabel:(id)a3 value:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPLabeledValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (NSCopying)value
{
  return self->_value;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isEqualToLabeledValue:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  label = self->_label;
  v7 = (NSString *)*((id *)v4 + 1);
  if (label == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = label;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_value;
  v13 = v12;
  if (v12 == (NSCopying *)v5[2]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSCopying isEqual:](v12, "isEqual:");
  }

LABEL_10:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPLabeledValue *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPLabeledValue *)self isEqualToLabeledValue:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  BOOL v6 = (void *)[(NSString *)self->_label copyWithZone:a3];
  v7 = (void *)[(NSCopying *)self->_value copyWithZone:a3];
  v8 = [v5 labeledValueWithLabel:v6 value:v7];

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  return [(NSCopying *)self->_value hash] - v3 + 32 * v3;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"lab"];
  [v5 encodeObject:self->_value forKey:@"val"];
}

- (PPLabeledValue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lab"];
  BOOL v6 = (void *)MEMORY[0x192F97350]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  char v10 = [v4 decodeObjectOfClasses:v9 forKey:@"val"];

  if (v10)
  {
    self = [(PPLabeledValue *)self initWithLabel:v5 value:v10];
    char v11 = self;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPLabeledValue %@: '%@'>", self->_label, self->_value];
  return v2;
}

- (PPLabeledValue)initWithLabel:(id)a3 value:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PPLabeledValue.m", 19, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PPLabeledValue;
  char v10 = [(PPLabeledValue *)&v14 init];
  char v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_label, a3);
    objc_storeStrong((id *)&v11->_value, a4);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (PPLabeledValue)labeledValueWithLabel:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PPLabeledValue alloc] initWithLabel:v6 value:v5];

  return v7;
}

@end