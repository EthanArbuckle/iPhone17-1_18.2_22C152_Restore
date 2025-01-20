@interface RMModelStatusManagementDeclarations_Declaration
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 serverToken:(id)a4 active:(id)a5 valid:(id)a6;
+ (id)buildWithIdentifier:(id)a3 serverToken:(id)a4 active:(id)a5 valid:(id)a6 reasons:(id)a7;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)statusReasons;
- (NSNumber)statusActive;
- (NSString)statusIdentifier;
- (NSString)statusServerToken;
- (NSString)statusValid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setStatusActive:(id)a3;
- (void)setStatusIdentifier:(id)a3;
- (void)setStatusReasons:(id)a3;
- (void)setStatusServerToken:(id)a3;
- (void)setStatusValid:(id)a3;
@end

@implementation RMModelStatusManagementDeclarations_Declaration

+ (NSSet)allowedStatusKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"identifier";
  v6[1] = @"server-token";
  v6[2] = @"active";
  v6[3] = @"valid";
  v6[4] = @"reasons";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 serverToken:(id)a4 active:(id)a5 valid:(id)a6 reasons:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setStatusIdentifier:v15];

  [v16 setStatusServerToken:v14];
  [v16 setStatusActive:v13];

  [v16 setStatusValid:v12];
  [v16 setStatusReasons:v11];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 serverToken:(id)a4 active:(id)a5 valid:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_opt_new();
  [v13 setStatusIdentifier:v12];

  [v13 setStatusServerToken:v11];
  [v13 setStatusActive:v10];

  [v13 setStatusValid:v9];
  return v13;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  id v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMModelStatusManagementDeclarations_Declaration allowedStatusKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"identifier", @"statusIdentifier", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"server-token", @"statusServerToken", 1, 0, a5)&& -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
         "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
         v8,
         @"active",
         @"statusActive",
         1,
         0,
         a5)
    && [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"valid" forKeyPath:@"statusValid" isRequired:1 defaultValue:0 error:a5])
  {
    LOWORD(v16) = a4;
    BOOL v14 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"reasons" forKeyPath:@"statusReasons" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 serializationType:v16 error:a5];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelStatusManagementDeclarations_Declaration *)self statusIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"identifier" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelStatusManagementDeclarations_Declaration *)self statusServerToken];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"server-token" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMModelStatusManagementDeclarations_Declaration *)self statusActive];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"active" value:v8 isRequired:1 defaultValue:0];

  id v9 = [(RMModelStatusManagementDeclarations_Declaration *)self statusValid];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"valid" value:v9 isRequired:1 defaultValue:0];

  id v10 = [(RMModelStatusManagementDeclarations_Declaration *)self statusReasons];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__RMModelStatusManagementDeclarations_Declaration_serializeWithType___block_invoke;
  v13[3] = &__block_descriptor_34_e43___NSDictionary_16__0__RMModelStatusReason_8l;
  signed __int16 v14 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"reasons" value:v10 itemSerializer:v13 isRequired:0 defaultValue:0];

  id v11 = (void *)[v5 copy];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)RMModelStatusManagementDeclarations_Declaration;
  v4 = [(RMModelPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusIdentifier copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusServerToken copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_statusActive copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_statusValid copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSArray *)self->_statusReasons copy];
  signed __int16 v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
{
}

- (NSString)statusServerToken
{
  return self->_statusServerToken;
}

- (void)setStatusServerToken:(id)a3
{
}

- (NSNumber)statusActive
{
  return self->_statusActive;
}

- (void)setStatusActive:(id)a3
{
}

- (NSString)statusValid
{
  return self->_statusValid;
}

- (void)setStatusValid:(id)a3
{
}

- (NSArray)statusReasons
{
  return self->_statusReasons;
}

- (void)setStatusReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusReasons, 0);
  objc_storeStrong((id *)&self->_statusValid, 0);
  objc_storeStrong((id *)&self->_statusActive, 0);
  objc_storeStrong((id *)&self->_statusServerToken, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end