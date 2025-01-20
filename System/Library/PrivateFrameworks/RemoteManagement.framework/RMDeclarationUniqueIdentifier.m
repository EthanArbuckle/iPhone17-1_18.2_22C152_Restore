@interface RMDeclarationUniqueIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeclarationIdentifier:(id)a3;
- (NSString)identifier;
- (NSString)managementSourceIdentifier;
- (NSString)serverToken;
- (NSString)type;
- (RMDeclarationUniqueIdentifier)initWithCoder:(id)a3;
- (RMDeclarationUniqueIdentifier)initWithDeclarationPayload:(id)a3;
- (RMDeclarationUniqueIdentifier)initWithManagementSourceIdentifier:(id)a3 type:(id)a4 identifier:(id)a5 serverToken:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMDeclarationUniqueIdentifier

- (RMDeclarationUniqueIdentifier)initWithDeclarationPayload:(id)a3
{
  id v4 = a3;
  v5 = [v4 managementSourceIdentifier];
  v6 = [v4 declarationType];
  v7 = [v4 identifier];
  v8 = [v4 serverToken];

  v9 = [(RMDeclarationUniqueIdentifier *)self initWithManagementSourceIdentifier:v5 type:v6 identifier:v7 serverToken:v8];
  return v9;
}

- (RMDeclarationUniqueIdentifier)initWithManagementSourceIdentifier:(id)a3 type:(id)a4 identifier:(id)a5 serverToken:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RMDeclarationUniqueIdentifier;
  v14 = [(RMDeclarationUniqueIdentifier *)&v24 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    managementSourceIdentifier = v14->_managementSourceIdentifier;
    v14->_managementSourceIdentifier = v15;

    v17 = (NSString *)[v11 copy];
    type = v14->_type;
    v14->_type = v17;

    v19 = (NSString *)[v12 copy];
    identifier = v14->_identifier;
    v14->_identifier = v19;

    v21 = (NSString *)[v13 copy];
    serverToken = v14->_serverToken;
    v14->_serverToken = v21;
  }
  return v14;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(RMDeclarationUniqueIdentifier *)self managementSourceIdentifier];
  v6 = [(RMDeclarationUniqueIdentifier *)self type];
  v7 = [(RMDeclarationUniqueIdentifier *)self identifier];
  v8 = [(RMDeclarationUniqueIdentifier *)self serverToken];
  v9 = +[NSString stringWithFormat:@"<%@: %p { managementSourceIdentifier = %@, type = %@, identifier = %@, serverToken = %@ }>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMDeclarationUniqueIdentifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(RMDeclarationUniqueIdentifier *)self isEqualToDeclarationIdentifier:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToDeclarationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(RMDeclarationUniqueIdentifier *)self hash];
  if (v5 == [v4 hash])
  {
    v6 = [(RMDeclarationUniqueIdentifier *)self managementSourceIdentifier];
    v7 = [v4 managementSourceIdentifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(RMDeclarationUniqueIdentifier *)self type];
      v9 = [v4 type];
      if ([v8 isEqualToString:v9])
      {
        id v10 = [(RMDeclarationUniqueIdentifier *)self identifier];
        id v11 = [v4 identifier];
        if ([v10 isEqualToString:v11])
        {
          id v12 = [(RMDeclarationUniqueIdentifier *)self serverToken];
          id v13 = [v4 serverToken];
          unsigned __int8 v14 = [v12 isEqualToString:v13];
        }
        else
        {
          unsigned __int8 v14 = 0;
        }
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(RMDeclarationUniqueIdentifier *)self managementSourceIdentifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(RMDeclarationUniqueIdentifier *)self type];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = [(RMDeclarationUniqueIdentifier *)self identifier];
  unint64_t v8 = (unint64_t)[v7 hash];
  v9 = [(RMDeclarationUniqueIdentifier *)self serverToken];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMDeclarationUniqueIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managementSourceIdentifier"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  unint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverToken"];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0 || v8 == 0)
  {
    id v12 = 0;
  }
  else
  {
    self = [(RMDeclarationUniqueIdentifier *)self initWithManagementSourceIdentifier:v5 type:v6 identifier:v7 serverToken:v8];
    id v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RMDeclarationUniqueIdentifier *)self managementSourceIdentifier];
  [v4 encodeObject:v5 forKey:@"managementSourceIdentifier"];

  unint64_t v6 = [(RMDeclarationUniqueIdentifier *)self type];
  [v4 encodeObject:v6 forKey:@"type"];

  v7 = [(RMDeclarationUniqueIdentifier *)self identifier];
  [v4 encodeObject:v7 forKey:@"identifier"];

  id v8 = [(RMDeclarationUniqueIdentifier *)self serverToken];
  [v4 encodeObject:v8 forKey:@"serverToken"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [RMDeclarationUniqueIdentifier alloc];
  id v5 = [(RMDeclarationUniqueIdentifier *)self managementSourceIdentifier];
  unint64_t v6 = [(RMDeclarationUniqueIdentifier *)self type];
  v7 = [(RMDeclarationUniqueIdentifier *)self identifier];
  id v8 = [(RMDeclarationUniqueIdentifier *)self serverToken];
  BOOL v9 = [(RMDeclarationUniqueIdentifier *)v4 initWithManagementSourceIdentifier:v5 type:v6 identifier:v7 serverToken:v8];

  return v9;
}

- (NSString)managementSourceIdentifier
{
  return self->_managementSourceIdentifier;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serverToken
{
  return self->_serverToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_managementSourceIdentifier, 0);
}

@end