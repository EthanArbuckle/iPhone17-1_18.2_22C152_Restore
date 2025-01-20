@interface RMDeclarationManifestItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToManifestItem:(id)a3;
- (NSString)identifier;
- (NSString)version;
- (RMDeclarationManifestItem)initWithCoder:(id)a3;
- (RMDeclarationManifestItem)initWithIdentifier:(id)a3 version:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMDeclarationManifestItem

- (RMDeclarationManifestItem)initWithIdentifier:(id)a3 version:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RMDeclarationManifestItem;
  v8 = [(RMDeclarationManifestItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    version = v8->_version;
    v8->_version = (NSString *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMDeclarationManifestItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];

  id v7 = [(RMDeclarationManifestItem *)self initWithIdentifier:v5 version:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMDeclarationManifestItem *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(RMDeclarationManifestItem *)self version];
  [v4 encodeObject:v6 forKey:@"version"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMDeclarationManifestItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(RMDeclarationManifestItem *)self isEqualToManifestItem:v4];
  }

  return v5;
}

- (BOOL)isEqualToManifestItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMDeclarationManifestItem *)self identifier];
  id v6 = [v4 identifier];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(RMDeclarationManifestItem *)self version];
    v8 = [v4 version];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end