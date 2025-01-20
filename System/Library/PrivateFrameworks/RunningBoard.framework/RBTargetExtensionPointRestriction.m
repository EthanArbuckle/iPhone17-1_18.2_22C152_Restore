@interface RBTargetExtensionPointRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithExtensionPoint:(id)a3;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBTargetExtensionPointRestriction

- (id)_initWithExtensionPoint:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBTargetExtensionPointRestriction;
  v5 = [(RBDomainRestriction *)&v10 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = v5;
  }

  return v5;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:@"ExtensionPoint"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v6 length])
  {
    a4 = [[RBTargetExtensionPointRestriction alloc] _initWithExtensionPoint:v6];
  }
  else if (a4)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    v8 = [NSString stringWithFormat:@"RBTargetExtensionPointRestriction doesn't specify extensionPoint or doesn't have right class for extensionPoint: %@", v5, *MEMORY[0x263F08338]];
    v14[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_super v10 = [v7 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v9];

    id v11 = v10;
    *a4 = v11;

    a4 = 0;
  }

  return a4;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a3 targetProcess];
  v7 = [v6 identity];
  char v8 = [v7 isExtension];

  if ((v8 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F646B8];
    uint64_t v22 = *MEMORY[0x263F08338];
    v14 = [NSString stringWithFormat:@"target isn't extension"];
    v23[0] = v14;
    v15 = NSDictionary;
    v16 = (void **)v23;
    v17 = &v22;
LABEL_8:
    v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    *a4 = [v12 errorWithDomain:v13 code:1 userInfo:v18];

    LOBYTE(a4) = 0;
    goto LABEL_9;
  }
  extensionPoint = self->_extensionPoint;
  objc_super v10 = [v6 bundleProperties];
  id v11 = [v10 extensionPointIdentifier];
  LOBYTE(extensionPoint) = [(NSString *)extensionPoint isEqualToString:v11];

  if ((extensionPoint & 1) == 0)
  {
    if (!a4) {
      goto LABEL_9;
    }
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F646B8];
    v14 = [NSString stringWithFormat:@"target doesn't have extensionPoint %@", self->_extensionPoint, *MEMORY[0x263F08338]];
    v21 = v14;
    v15 = NSDictionary;
    v16 = &v21;
    v17 = &v20;
    goto LABEL_8;
  }
  LOBYTE(a4) = 1;
LABEL_9:

  return (char)a4;
}

- (id)allEntitlements
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBTargetExtensionPointRestriction *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  extensionPoint = self->_extensionPoint;
  char v8 = v4->_extensionPoint;
  if (extensionPoint == v8)
  {
LABEL_10:
    char v6 = 1;
    goto LABEL_11;
  }
  if (extensionPoint) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v6 = -[NSString isEqual:](extensionPoint, "isEqual:");
    goto LABEL_11;
  }
LABEL_3:
  char v6 = 0;
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_extensionPoint hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@>", v4, self->_extensionPoint];

  return v5;
}

- (void).cxx_destruct
{
}

@end