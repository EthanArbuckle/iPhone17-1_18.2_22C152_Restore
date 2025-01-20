@interface SESExpressKey
+ (id)withKeyIdentifier:(id)a3 appletIdentifier:(id)a4 configuration:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)configuration;
- (NSString)appletIdentifier;
- (NSString)keyIdentifier;
- (unint64_t)hash;
@end

@implementation SESExpressKey

+ (id)withKeyIdentifier:(id)a3 appletIdentifier:(id)a4 configuration:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = (void *)v10[1];
  v10[1] = v7;
  id v12 = v7;

  v13 = (void *)v10[2];
  v10[2] = v8;
  id v14 = v8;

  v15 = (void *)v10[3];
  v10[3] = v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(SESExpressKey *)self keyIdentifier];
    v6 = [v4 keyIdentifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(SESExpressKey *)self keyIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)keyIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)appletIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)configuration
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end