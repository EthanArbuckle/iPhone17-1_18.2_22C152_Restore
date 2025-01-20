@interface UARPServiceUpdaterDASMatchingRule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)matchingDictionary;
- (NSString)identifier;
- (UARPServiceUpdaterDASMatchingRule)initWithCoder:(id)a3;
- (UARPServiceUpdaterDASMatchingRule)initWithIdentifier:(id)a3 matchingDictionary:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPServiceUpdaterDASMatchingRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterDASMatchingRule)initWithIdentifier:(id)a3 matchingDictionary:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UARPServiceUpdaterDASMatchingRule;
  v6 = [(UARPServiceUpdaterDASMatchingRule *)&v8 init];
  if (v6)
  {
    v6->_identifier = (NSString *)[a3 copy];
    v6->_matchingDictionary = (NSDictionary *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPServiceUpdaterDASMatchingRule;
  [(UARPServiceUpdaterDASMatchingRule *)&v3 dealloc];
}

- (UARPServiceUpdaterDASMatchingRule)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  return -[UARPServiceUpdaterDASMatchingRule initWithIdentifier:matchingDictionary:](self, "initWithIdentifier:matchingDictionary:", v5, objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithArray:](NSSet, "setWithArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 4)), @"matchingDictionary"));
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_identifier forKey:@"identifier"];
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
      unsigned int v5 = [(NSString *)self->_identifier isEqual:*((void *)a3 + 1)];
      if (v5)
      {
        matchingDictionary = self->_matchingDictionary;
        uint64_t v7 = *((void *)a3 + 2);
        LOBYTE(v5) = [(NSDictionary *)matchingDictionary isEqual:v7];
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%@: Identifier=%@, matchingDictionary=%@>", NSStringFromClass(v3), self->_identifier, self->_matchingDictionary];
}

- (unint64_t)hash
{
  v2 = +[NSString stringWithFormat:@"%@", self->_identifier];
  return [(NSString *)v2 hash];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)matchingDictionary
{
  return self->_matchingDictionary;
}

@end