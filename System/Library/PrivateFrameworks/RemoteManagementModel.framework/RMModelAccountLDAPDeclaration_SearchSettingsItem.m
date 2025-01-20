@interface RMModelAccountLDAPDeclaration_SearchSettingsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithSearchBase:(id)a3;
+ (id)buildWithVisibleDescription:(id)a3 searchBase:(id)a4 scope:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadScope;
- (NSString)payloadSearchBase;
- (NSString)payloadVisibleDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadScope:(id)a3;
- (void)setPayloadSearchBase:(id)a3;
- (void)setPayloadVisibleDescription:(id)a3;
@end

@implementation RMModelAccountLDAPDeclaration_SearchSettingsItem

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"VisibleDescription";
  v6[1] = @"SearchBase";
  v6[2] = @"Scope";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithVisibleDescription:(id)a3 searchBase:(id)a4 scope:(id)a5
{
  v7 = (__CFString *)a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadVisibleDescription:v9];

  [v10 setPayloadSearchBase:v8];
  if (v7) {
    v11 = v7;
  }
  else {
    v11 = @"Subtree";
  }
  [v10 setPayloadScope:v11];

  return v10;
}

+ (id)buildRequiredOnlyWithSearchBase:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadSearchBase:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelAccountLDAPDeclaration_SearchSettingsItem allowedPayloadKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"VisibleDescription" forKeyPath:@"payloadVisibleDescription" isRequired:0 defaultValue:0 error:a5])
  {
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"SearchBase" forKeyPath:@"payloadSearchBase" isRequired:1 defaultValue:0 error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Scope" forKeyPath:@"payloadScope" isRequired:0 defaultValue:@"Subtree" error:a5];
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelAccountLDAPDeclaration_SearchSettingsItem *)self payloadVisibleDescription];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"VisibleDescription" value:v5 isRequired:0 defaultValue:0];

  v6 = [(RMModelAccountLDAPDeclaration_SearchSettingsItem *)self payloadSearchBase];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"SearchBase" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelAccountLDAPDeclaration_SearchSettingsItem *)self payloadScope];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Scope" value:v7 isRequired:0 defaultValue:@"Subtree"];

  id v8 = (void *)[v4 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelAccountLDAPDeclaration_SearchSettingsItem;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadVisibleDescription copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadSearchBase copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadScope copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadVisibleDescription
{
  return self->_payloadVisibleDescription;
}

- (void)setPayloadVisibleDescription:(id)a3
{
}

- (NSString)payloadSearchBase
{
  return self->_payloadSearchBase;
}

- (void)setPayloadSearchBase:(id)a3
{
}

- (NSString)payloadScope
{
  return self->_payloadScope;
}

- (void)setPayloadScope:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadScope, 0);
  objc_storeStrong((id *)&self->_payloadSearchBase, 0);
  objc_storeStrong((id *)&self->_payloadVisibleDescription, 0);
}

@end