@interface SPOfflineAdvertisingKeys
+ (BOOL)supportsSecureCoding;
- (NSArray)keys;
- (NSDictionary)dictionaryRepresentation;
- (SPOfflineAdvertisingKeys)initWithCoder:(id)a3;
- (SPOfflineAdvertisingKeys)initWithInterval:(int64_t)a3 keys:(id)a4;
- (id)description;
- (int64_t)rotationInterval;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPOfflineAdvertisingKeys

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPOfflineAdvertisingKeys)initWithInterval:(int64_t)a3 keys:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPOfflineAdvertisingKeys;
  v7 = [(SPOfflineAdvertisingKeys *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_rotationInterval = a3;
    uint64_t v9 = [v6 copy];
    keys = v8->_keys;
    v8->_keys = (NSArray *)v9;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SPOfflineAdvertisingKeys rotationInterval](self, "rotationInterval"), @"interval");
  id v5 = [(SPOfflineAdvertisingKeys *)self keys];
  [v4 encodeObject:v5 forKey:@"keys"];
}

- (SPOfflineAdvertisingKeys)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_rotationInterval = [v4 decodeIntegerForKey:@"interval"];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v5 setWithArray:v6];
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"keys"];

  keys = self->_keys;
  self->_keys = v8;

  return self;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(SPOfflineAdvertisingKeys *)self rotationInterval];
  id v6 = [(SPOfflineAdvertisingKeys *)self keys];
  v7 = [v3 stringWithFormat:@"<%@: %p interval: %lu, keys: %lu]>", v4, self, v5, objc_msgSend(v6, "count")];

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4F1BCA0];
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[SPOfflineAdvertisingKeys rotationInterval](self, "rotationInterval"));
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E4F1BC98];
  uint64_t v4 = [(SPOfflineAdvertisingKeys *)self keys];
  v8[1] = v4;
  int64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (int64_t)rotationInterval
{
  return self->_rotationInterval;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void).cxx_destruct
{
}

@end