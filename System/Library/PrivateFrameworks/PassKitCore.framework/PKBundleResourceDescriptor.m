@interface PKBundleResourceDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)withName:(id)a3 extension:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBundleResourceDescriptor:(id)a3;
- (NSString)extension;
- (NSString)name;
- (PKBundleResourceDescriptor)initWithCoder:(id)a3;
- (PKBundleResourceDescriptor)initWithName:(id)a3 extension:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKBundleResourceDescriptor

- (PKBundleResourceDescriptor)initWithName:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKBundleResourceDescriptor;
  v8 = [(PKBundleResourceDescriptor *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    extension = v8->_extension;
    v8->_extension = (NSString *)v11;
  }
  return v8;
}

- (PKBundleResourceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBundleResourceDescriptor;
  v5 = [(PKBundleResourceDescriptor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extension"];
    extension = v5->_extension;
    v5->_extension = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; %@.%@>",
               objc_opt_class(),
               self,
               self->_name,
               self->_extension);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_extension forKey:@"extension"];
}

+ (id)withName:(id)a3 extension:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PKBundleResourceDescriptor alloc] initWithName:v6 extension:v5];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PKBundleResourceDescriptor *)self isEqualToBundleResourceDescriptor:v4];

  return v5;
}

- (BOOL)isEqualToBundleResourceDescriptor:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    name = self->_name;
    id v5 = a3;
    id v6 = [v5 name];
    LODWORD(name) = [(NSString *)name isEqualToString:v6];

    extension = self->_extension;
    uint64_t v8 = [v5 extension];

    unsigned int v9 = name & [(NSString *)extension isEqualToString:v8];
  }
  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSString *)self->_extension hash] ^ v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end