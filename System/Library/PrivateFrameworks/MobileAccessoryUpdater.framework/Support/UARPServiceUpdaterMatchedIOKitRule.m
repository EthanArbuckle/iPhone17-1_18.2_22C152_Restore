@interface UARPServiceUpdaterMatchedIOKitRule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (UARPServiceUpdaterMatchedIOKitRule)initWithCoder:(id)a3;
- (UARPServiceUpdaterMatchedIOKitRule)initWithIdentifier:(id)a3 registryEntryID:(unint64_t)a4;
- (id)description;
- (unint64_t)registryEntryID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPServiceUpdaterMatchedIOKitRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterMatchedIOKitRule)initWithIdentifier:(id)a3 registryEntryID:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UARPServiceUpdaterMatchedIOKitRule;
  v6 = [(UARPServiceUpdaterMatchedIOKitRule *)&v8 init];
  if (v6)
  {
    v6->_identifier = (NSString *)[a3 copy];
    v6->_registryEntryID = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPServiceUpdaterMatchedIOKitRule;
  [(UARPServiceUpdaterMatchedIOKitRule *)&v3 dealloc];
}

- (UARPServiceUpdaterMatchedIOKitRule)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"registryEntryID"), "unsignedLongLongValue");
  return [(UARPServiceUpdaterMatchedIOKitRule *)self initWithIdentifier:v5 registryEntryID:v6];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_identifier forKey:@"identifier"];
  id v5 = +[NSNumber numberWithUnsignedLongLong:self->_registryEntryID];
  [a3 encodeObject:v5 forKey:@"registryEntryID"];
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
      if (v5) {
        LOBYTE(v5) = self->_registryEntryID == *((void *)a3 + 2);
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%@: Identifier=%@, Registry Entry ID=0x%llx", NSStringFromClass(v3), self->_identifier, self->_registryEntryID];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

@end