@interface TPSCapability
- (NSString)key;
- (TPSCapability)initWithDictionary:(id)a3;
- (id)debugDescription;
- (id)value;
- (int64_t)joinType;
- (void)setJoinType:(int64_t)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation TPSCapability

- (NSString)key
{
  return self->_key;
}

- (id)value
{
  return self->_value;
}

- (int64_t)joinType
{
  return self->_joinType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (TPSCapability)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSCapability;
  v5 = [(TPSCapability *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeStringForKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    uint64_t v8 = [v4 TPSSafeObjectForKey:@"value"];
    id value = v5->_value;
    v5->_id value = (id)v8;

    v10 = [v4 TPSSafeStringForKey:@"joinType"];
    if ([v10 isEqualToString:@"AND"])
    {
      uint64_t v11 = 0;
    }
    else
    {
      if (![v10 isEqualToString:@"OR"])
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v11 = 1;
    }
    v5->_joinType = v11;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSCapability;
  id v4 = [(TPSSerializableObject *)&v9 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSCapability *)self key];
  [v5 appendFormat:@"; %@ = %@", @"key", v6];

  v7 = [(TPSCapability *)self value];
  [v5 appendFormat:@"; %@ = %@", @"value", v7];

  [v5 appendFormat:@"; %@ = %ld", @"joinType", -[TPSCapability joinType](self, "joinType")];

  return v5;
}

- (void)setJoinType:(int64_t)a3
{
  self->_joinType = a3;
}

- (void)setKey:(id)a3
{
}

- (void)setValue:(id)a3
{
}

@end