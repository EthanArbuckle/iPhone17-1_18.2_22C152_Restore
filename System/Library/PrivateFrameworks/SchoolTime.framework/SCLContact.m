@interface SCLContact
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)contactIdentifier;
- (NSString)value;
- (SCLContact)init;
- (SCLContact)initWithCoder:(id)a3;
- (id)_initWithContactIdentifier:(id)a3 type:(unint64_t)a4 value:(id)a5;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLContact

- (SCLContact)init
{
  return (SCLContact *)[(SCLContact *)self _initWithContactIdentifier:0 type:0 value:0];
}

- (id)_initWithContactIdentifier:(id)a3 type:(unint64_t)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SCLContact;
  v10 = [(SCLContact *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    contactIdentifier = v10->_contactIdentifier;
    v10->_contactIdentifier = (NSString *)v11;

    v10->_type = a4;
    uint64_t v13 = [v9 copy];
    value = v10->_value;
    v10->_value = (NSString *)v13;
  }
  return v10;
}

- (unint64_t)hash
{
  v3 = [(SCLContact *)self contactIdentifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SCLContact *)self type] ^ v4;
  v6 = [(SCLContact *)self value];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SCLContact *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      v6 = [(SCLContact *)self contactIdentifier];
      unint64_t v7 = [(SCLContact *)v5 contactIdentifier];
      if (BSEqualObjects()
        && (unint64_t v8 = [(SCLContact *)self type], v8 == [(SCLContact *)v5 type]))
      {
        id v9 = [(SCLContact *)self value];
        v10 = [(SCLContact *)v5 value];
        char v11 = BSEqualStrings();
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v4 = [(SCLContact *)self contactIdentifier];
  [v3 appendString:v4 withName:@"contactIdentifier"];

  unint64_t v5 = [(SCLContact *)self type];
  v6 = @"unknown";
  if (v5 == 2) {
    v6 = @"phone";
  }
  if (v5 == 1) {
    unint64_t v7 = @"email";
  }
  else {
    unint64_t v7 = v6;
  }
  [v3 appendString:v7 withName:@"type"];
  unint64_t v8 = [(SCLContact *)self value];
  [v3 appendString:v8 withName:@"value"];

  id v9 = [v3 build];

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [SCLContact alloc];
  contactIdentifier = self->_contactIdentifier;
  unint64_t type = self->_type;
  value = self->_value;
  return [(SCLContact *)v4 _initWithContactIdentifier:contactIdentifier type:type value:value];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLContact)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"type"];
  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];

  unint64_t v8 = [(SCLContact *)self _initWithContactIdentifier:v5 type:v6 value:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  contactIdentifier = self->_contactIdentifier;
  id v5 = a3;
  [v5 encodeObject:contactIdentifier forKey:@"contactIdentifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end