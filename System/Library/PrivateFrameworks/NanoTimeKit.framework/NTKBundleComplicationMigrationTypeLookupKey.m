@interface NTKBundleComplicationMigrationTypeLookupKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NTKBundleComplicationMigrationTypeLookupKey)initWithCoder:(id)a3;
- (NTKBundleComplicationMigrationTypeLookupKey)initWithComplicationType:(unint64_t)a3 family:(int64_t)a4;
- (int64_t)family;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKBundleComplicationMigrationTypeLookupKey

- (NTKBundleComplicationMigrationTypeLookupKey)initWithComplicationType:(unint64_t)a3 family:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKBundleComplicationMigrationTypeLookupKey;
  result = [(NTKBundleComplicationMigrationTypeLookupKey *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_family = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4[1] && self->_family == v4[2];

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendUnsignedInteger:self->_type];
  id v5 = (id)[v3 appendInteger:self->_family];
  unint64_t v6 = [v3 hash];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_family forKey:@"family"];
}

- (NTKBundleComplicationMigrationTypeLookupKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKBundleComplicationMigrationTypeLookupKey;
  id v5 = [(NTKBundleComplicationMigrationTypeLookupKey *)&v7 init];
  if (v5)
  {
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    v5->_family = [v4 decodeIntegerForKey:@"family"];
  }

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)family
{
  return self->_family;
}

@end