@interface PRTrustedContact
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)contactKey;
- (PRTrustedContact)init;
- (PRTrustedContact)initWithCoder:(id)a3;
- (PRTrustedContact)initWithContactKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRTrustedContact

- (PRTrustedContact)init
{
  return 0;
}

- (PRTrustedContact)initWithContactKey:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PRTrustedContact.m", 22, @"Invalid parameter not satisfying: %@", @"contactKey" object file lineNumber description];
  }
  if ([v6 length] != 6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRTrustedContact.m", 23, @"Invalid parameter not satisfying: %@", @"[contactKey length] == 6" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PRTrustedContact;
  v7 = [(PRTrustedContact *)&v12 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_contactKey, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRTrustedContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContactKey"];

  id v6 = [(PRTrustedContact *)self initWithContactKey:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRTrustedContact alloc];
  contactKey = self->_contactKey;
  return [(PRTrustedContact *)v4 initWithContactKey:contactKey];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"contact key: %@", self->_contactKey];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    contactKey = self->_contactKey;
    id v6 = [v4 contactKey];
    BOOL v7 = [(NSData *)contactKey isEqualToData:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSData)contactKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end