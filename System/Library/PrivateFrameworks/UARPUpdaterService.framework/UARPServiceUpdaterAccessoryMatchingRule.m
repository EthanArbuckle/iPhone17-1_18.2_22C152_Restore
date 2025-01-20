@interface UARPServiceUpdaterAccessoryMatchingRule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)matchingDictionary;
- (NSString)identifier;
- (NSString)xpcEventStream;
- (UARPServiceUpdaterAccessoryMatchingRule)initWithCoder:(id)a3;
- (UARPServiceUpdaterAccessoryMatchingRule)initWithIdentifier:(id)a3 xpcEventStream:(id)a4 matchingDictionary:(id)a5;
- (const)transportDescription;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPServiceUpdaterAccessoryMatchingRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterAccessoryMatchingRule)initWithIdentifier:(id)a3 xpcEventStream:(id)a4 matchingDictionary:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)UARPServiceUpdaterAccessoryMatchingRule;
  v8 = [(UARPServiceUpdaterAccessoryMatchingRule *)&v10 init];
  if (v8)
  {
    v8->_identifier = (NSString *)[a3 copy];
    v8->_xpcEventStream = (NSString *)[a4 copy];
    v8->_matchingDictionary = (NSDictionary *)[a5 copy];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPServiceUpdaterAccessoryMatchingRule;
  [(UARPServiceUpdaterAccessoryMatchingRule *)&v3 dealloc];
}

- (UARPServiceUpdaterAccessoryMatchingRule)initWithCoder:(id)a3
{
  v9[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"xpcEventStream"];
  v7 = (void *)MEMORY[0x263EFFA08];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  return -[UARPServiceUpdaterAccessoryMatchingRule initWithIdentifier:xpcEventStream:matchingDictionary:](self, "initWithIdentifier:xpcEventStream:matchingDictionary:", v5, v6, objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v9, 4)), @"matchingDictionary"));
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_identifier forKey:@"identifier"];
  [a3 encodeObject:self->_xpcEventStream forKey:@"xpcEventStream"];
  matchingDictionary = self->_matchingDictionary;
  [a3 encodeObject:matchingDictionary forKey:@"matchingDictionary"];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      int v5 = [(NSString *)self->_identifier isEqual:*((void *)a3 + 1)];
      if (v5)
      {
        int v5 = [(NSString *)self->_xpcEventStream isEqual:*((void *)a3 + 2)];
        if (v5)
        {
          matchingDictionary = self->_matchingDictionary;
          uint64_t v7 = *((void *)a3 + 3);
          LOBYTE(v5) = [(NSDictionary *)matchingDictionary isEqual:v7];
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (const)transportDescription
{
  return (const char *)&unk_23BB50D2A;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: Identifier=%@, Event Stream=%@>", NSStringFromClass(v4), self->_identifier, self->_xpcEventStream];
}

- (unint64_t)hash
{
  v2 = (void *)[NSString stringWithFormat:@"%@%@", self->_identifier, self->_xpcEventStream];
  return [v2 hash];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)xpcEventStream
{
  return self->_xpcEventStream;
}

- (NSDictionary)matchingDictionary
{
  return self->_matchingDictionary;
}

@end