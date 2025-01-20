@interface TPSContextualClientContextCondition
+ (BOOL)supportsSecureCoding;
- (NSString)key;
- (TPSContextualClientContextCondition)initWithCoder:(id)a3;
- (TPSContextualClientContextCondition)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)value;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation TPSContextualClientContextCondition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualClientContextCondition)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSContextualClientContextCondition;
  v5 = [(TPSContextualClientContextCondition *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeStringForKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    uint64_t v8 = [v4 TPSSafeObjectForKey:@"value"];
    id value = v5->_value;
    v5->_id value = (id)v8;
  }
  return v5;
}

- (TPSContextualClientContextCondition)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSContextualClientContextCondition;
  v5 = [(TPSSerializableObject *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"value"];
    id value = v5->_value;
    v5->_id value = (id)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSContextualClientContextCondition;
  id v4 = a3;
  [(TPSSerializableObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_key, @"key", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_value forKey:@"value"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSContextualClientContextCondition;
  id v4 = [(TPSSerializableObject *)&v6 copyWithZone:a3];
  [v4 setKey:self->_key];
  [v4 setValue:self->_value];
  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualClientContextCondition;
  id v4 = [(TPSSerializableObject *)&v9 debugDescription];
  objc_super v5 = (void *)[v3 initWithString:v4];

  objc_super v6 = [(TPSContextualClientContextCondition *)self key];
  [v5 appendFormat:@"%@ = %@", @"key", v6];

  v7 = [(TPSContextualClientContextCondition *)self value];
  [v5 appendFormat:@" %@ = %@", @"value", v7];

  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end