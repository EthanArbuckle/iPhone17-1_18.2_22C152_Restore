@interface RMModelAppManagedDeclaration_InstallBehavior
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithInstall:(id)a3 license:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadInstall;
- (RMModelAppManagedDeclaration_InstallBehaviorLicense)payloadLicense;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadInstall:(id)a3;
- (void)setPayloadLicense:(id)a3;
@end

@implementation RMModelAppManagedDeclaration_InstallBehavior

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Install";
  v6[1] = @"License";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithInstall:(id)a3 license:(id)a4
{
  id v5 = a4;
  v6 = (__CFString *)a3;
  v7 = objc_opt_new();
  v8 = v7;
  if (v6) {
    v9 = v6;
  }
  else {
    v9 = @"Optional";
  }
  [v7 setPayloadInstall:v9];

  [v8 setPayloadLicense:v5];
  return v8;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelAppManagedDeclaration_InstallBehavior allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Install" forKeyPath:@"payloadInstall" isRequired:0 defaultValue:@"Optional" error:a5])
  {
    LOWORD(v16) = a4;
    BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"License" forKeyPath:@"payloadLicense" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5];
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  v6 = [(RMModelAppManagedDeclaration_InstallBehavior *)self payloadInstall];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Install" value:v6 isRequired:0 defaultValue:@"Optional"];

  v7 = [(RMModelAppManagedDeclaration_InstallBehavior *)self payloadLicense];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__RMModelAppManagedDeclaration_InstallBehavior_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v11 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"License" value:v7 dictSerializer:v10 isRequired:0 defaultValue:0];

  id v8 = (void *)[v5 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelAppManagedDeclaration_InstallBehavior;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadInstall copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(RMModelAppManagedDeclaration_InstallBehaviorLicense *)self->_payloadLicense copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadInstall
{
  return self->_payloadInstall;
}

- (void)setPayloadInstall:(id)a3
{
}

- (RMModelAppManagedDeclaration_InstallBehaviorLicense)payloadLicense
{
  return self->_payloadLicense;
}

- (void)setPayloadLicense:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLicense, 0);
  objc_storeStrong((id *)&self->_payloadInstall, 0);
}

@end