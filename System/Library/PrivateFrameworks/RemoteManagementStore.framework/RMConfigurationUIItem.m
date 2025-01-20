@interface RMConfigurationUIItem
+ (BOOL)supportsSecureCoding;
+ (id)configurationUIItemWithConfiguration:(id)a3 details:(id)a4;
+ (id)configurationUIItemWithIdentifier:(id)a3 serverToken:(id)a4 type:(id)a5 details:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfigurationUI:(id)a3;
- (NSString)declarationIdentifier;
- (NSString)declarationServerToken;
- (NSString)declarationType;
- (RMConfigurationUIDetails)declarationDetails;
- (RMConfigurationUIItem)initWithCoder:(id)a3;
- (RMConfigurationUIItem)initWithConfiguration:(id)a3 details:(id)a4;
- (RMConfigurationUIItem)initWithIdentifier:(id)a3 serverToken:(id)a4 type:(id)a5 details:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMConfigurationUIItem

+ (id)configurationUIItemWithConfiguration:(id)a3 details:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[RMConfigurationUIItem alloc] initWithConfiguration:v6 details:v5];

  return v7;
}

+ (id)configurationUIItemWithIdentifier:(id)a3 serverToken:(id)a4 type:(id)a5 details:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[RMConfigurationUIItem alloc] initWithIdentifier:v12 serverToken:v11 type:v10 details:v9];

  return v13;
}

- (RMConfigurationUIItem)initWithConfiguration:(id)a3 details:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 declarationIdentifier];
  id v9 = [v7 declarationServerToken];
  id v10 = [v7 declarationType];

  id v11 = [(RMConfigurationUIItem *)self initWithIdentifier:v8 serverToken:v9 type:v10 details:v6];
  return v11;
}

- (RMConfigurationUIItem)initWithIdentifier:(id)a3 serverToken:(id)a4 type:(id)a5 details:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)RMConfigurationUIItem;
  v15 = [(RMConfigurationUIItem *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_declarationIdentifier, a3);
    objc_storeStrong((id *)&v16->_declarationServerToken, a4);
    objc_storeStrong((id *)&v16->_declarationType, a5);
    objc_storeStrong((id *)&v16->_declarationDetails, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMConfigurationUIItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"server-token"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"details"];

  id v9 = [(RMConfigurationUIItem *)self initWithIdentifier:v5 serverToken:v6 type:v7 details:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RMConfigurationUIItem *)self declarationIdentifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(RMConfigurationUIItem *)self declarationServerToken];
  [v4 encodeObject:v6 forKey:@"server-token"];

  id v7 = [(RMConfigurationUIItem *)self declarationType];
  [v4 encodeObject:v7 forKey:@"type"];

  id v8 = [(RMConfigurationUIItem *)self declarationDetails];
  [v4 encodeObject:v8 forKey:@"details"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMConfigurationUIItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(RMConfigurationUIItem *)self isEqualToConfigurationUI:v4];
  }

  return v5;
}

- (BOOL)isEqualToConfigurationUI:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMConfigurationUIItem *)self declarationIdentifier];
  id v6 = [v4 declarationIdentifier];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(RMConfigurationUIItem *)self declarationServerToken];
    id v8 = [v4 declarationServerToken];
    if ([v7 isEqualToString:v8])
    {
      id v9 = [(RMConfigurationUIItem *)self declarationType];
      id v10 = [v4 declarationType];
      if ([v9 isEqualToString:v10])
      {
        id v11 = [(RMConfigurationUIItem *)self declarationDetails];
        id v12 = [v4 declarationDetails];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (NSString)declarationServerToken
{
  return self->_declarationServerToken;
}

- (NSString)declarationType
{
  return self->_declarationType;
}

- (RMConfigurationUIDetails)declarationDetails
{
  return self->_declarationDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationDetails, 0);
  objc_storeStrong((id *)&self->_declarationType, 0);
  objc_storeStrong((id *)&self->_declarationServerToken, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
}

@end