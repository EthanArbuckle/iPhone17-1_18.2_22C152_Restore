@interface _ICValueHistoryItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_ICValueHistoryItem)initWithCoder:(id)a3;
- (_ICValueHistoryItem)initWithValue:(id)a3 timestamp:(unint64_t)a4;
- (id)value;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ICValueHistoryItem

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (objc_class *)NSNumber;
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithUnsignedLongLong:self->_timestamp];
  [v5 encodeObject:v6 forKey:@"timestamp"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (id)value
{
  return self->_value;
}

- (_ICValueHistoryItem)initWithValue:(id)a3 timestamp:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_ICValueHistoryItem;
  v8 = [(_ICValueHistoryItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a4;
    objc_storeStrong(&v8->_value, a3);
  }

  return v9;
}

- (_ICValueHistoryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_ICValueHistoryItem;
  id v5 = [(_ICValueHistoryItem *)&v11 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    v5->_timestamp = [v6 unsignedLongLongValue];
    if (ICSecureCodingGetPropertyListClasses_sPropertyListTypesOnce != -1) {
      dispatch_once(&ICSecureCodingGetPropertyListClasses_sPropertyListTypesOnce, &__block_literal_global_9324);
    }
    id v7 = (id)ICSecureCodingGetPropertyListClasses_sPropertyListTypes;
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"value"];
    id value = v5->_value;
    v5->_id value = (id)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && self->_timestamp == v4[1])
  {
    id value = self->_value;
    id v7 = (id)v4[2];
    if (value == v7)
    {
      char v8 = 1;
    }
    else
    {
      char v8 = 0;
      if (value && v7) {
        char v8 = objc_msgSend(value, "isEqual:");
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t timestamp = self->_timestamp;
  return [self->_value hash] ^ timestamp;
}

@end