@interface WCAKeyValueItem
+ (BOOL)supportsSecureCoding;
- (BOOL)BOOLValue;
- (NSArray)arrayValue;
- (NSData)bytesValue;
- (NSDictionary)dictionaryValue;
- (NSError)error;
- (NSString)key;
- (NSString)stringValue;
- (WCAKeyValueItem)initWithCoder:(id)a3;
- (WCAKeyValueItem)initWithKey:(id)a3 error:(id)a4;
- (WCAKeyValueItem)initWithKey:(id)a3 value:(id)a4;
- (double)doubleValue;
- (float)floatValue;
- (id)description;
- (int)int32Value;
- (int64_t)int64Value;
- (unint64_t)uint64Value;
- (unsigned)uint32Value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WCAKeyValueItem

- (WCAKeyValueItem)initWithKey:(id)a3 value:(id)a4
{
  v6 = (NSString *)a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WCAKeyValueItem;
  v8 = [(WCAKeyValueItem *)&v13 init];
  key = v8->_key;
  v8->_key = v6;
  v10 = v6;

  id value = v8->_value;
  v8->_id value = v7;

  return v8;
}

- (WCAKeyValueItem)initWithKey:(id)a3 error:(id)a4
{
  v6 = (NSString *)a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WCAKeyValueItem;
  v8 = [(WCAKeyValueItem *)&v13 init];
  key = v8->_key;
  v8->_key = v6;
  v10 = v6;

  id value = v8->_value;
  v8->_id value = v7;

  return v8;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ : %p ", v5, self];

  [v6 appendFormat:@"key: %@", self->_key];
  id v7 = [self->_value description];
  [v6 appendFormat:@", value: %@", v7];

  [v6 appendString:@">"];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"_key"];
  [v5 encodeObject:self->_value forKey:@"_value"];
}

- (WCAKeyValueItem)initWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)WCAKeyValueItem;
  id v3 = a3;
  v4 = [(WCAKeyValueItem *)&v17 init];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"_key"];
  key = v4->_key;
  v4->_key = (NSString *)v5;

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  objc_super v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0, v17.receiver, v17.super_class);
  uint64_t v14 = [v3 decodeObjectOfClasses:v13 forKey:@"_value"];

  id value = v4->_value;
  v4->_id value = (id)v14;

  return v4;
}

- (NSDictionary)dictionaryValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver.isa, self->_value);
    }
  }
  id v7 = self->_value;

  return (NSDictionary *)v7;
}

- (NSArray)arrayValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_0.isa, self->_value);
    }
  }
  id v7 = self->_value;

  return (NSArray *)v7;
}

- (double)doubleValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_1.isa, self->_value);
    }
  }
  id v7 = self->_value;

  [v7 doubleValue];
  return result;
}

- (float)floatValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_1.isa, self->_value);
    }
  }
  id v7 = self->_value;

  [v7 floatValue];
  return result;
}

- (int)int32Value
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_1.isa, self->_value);
    }
  }
  id v7 = self->_value;

  return [v7 intValue];
}

- (int64_t)int64Value
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_1.isa, self->_value);
    }
  }
  id v7 = self->_value;

  return [v7 longLongValue];
}

- (unsigned)uint32Value
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_1.isa, self->_value);
    }
  }
  id v7 = self->_value;

  return [v7 unsignedIntValue];
}

- (unint64_t)uint64Value
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_1.isa, self->_value);
    }
  }
  id v7 = self->_value;

  return [v7 unsignedLongLongValue];
}

- (BOOL)BOOLValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_1.isa, self->_value);
    }
  }
  id v7 = self->_value;

  return [v7 BOOLValue];
}

- (NSString)stringValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_2.isa, self->_value);
    }
  }
  id v7 = self->_value;

  return (NSString *)v7;
}

- (NSData)bytesValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_3.isa, self->_value);
    }
  }
  id v7 = self->_value;

  return (NSData *)v7;
}

- (NSError)error
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  if (value == (id)v4)
  {
  }
  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(&cfstr_FailedToConver_4.isa, self->_value);
    }
  }
  id v7 = self->_value;

  return (NSError *)v7;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong(&self->_value, 0);
}

@end