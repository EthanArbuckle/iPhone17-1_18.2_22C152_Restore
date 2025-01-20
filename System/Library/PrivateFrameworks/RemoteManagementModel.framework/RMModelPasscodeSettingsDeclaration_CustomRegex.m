@interface RMModelPasscodeSettingsDeclaration_CustomRegex
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithRegex:(id)a3;
+ (id)buildWithRegex:(id)a3 description:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadRegex;
- (RMModelPasscodeSettingsDeclaration_CustomRegexDescription)payloadDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadDescription:(id)a3;
- (void)setPayloadRegex:(id)a3;
@end

@implementation RMModelPasscodeSettingsDeclaration_CustomRegex

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Regex";
  v6[1] = @"Description";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithRegex:(id)a3 description:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadRegex:v6];

  [v7 setPayloadDescription:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithRegex:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadRegex:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelPasscodeSettingsDeclaration_CustomRegex allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Regex" forKeyPath:@"payloadRegex" isRequired:1 defaultValue:0 error:a5])
  {
    LOWORD(v16) = a4;
    BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Description" forKeyPath:@"payloadDescription" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMModelPasscodeSettingsDeclaration_CustomRegex *)self payloadRegex];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Regex" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelPasscodeSettingsDeclaration_CustomRegex *)self payloadDescription];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__RMModelPasscodeSettingsDeclaration_CustomRegex_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v11 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Description" value:v7 dictSerializer:v10 isRequired:0 defaultValue:0];

  id v8 = (void *)[v5 copy];
  return v8;
}

- (void)combineWithOther:(id)a3
{
  id v4 = a3;
  id v5 = [(RMModelPasscodeSettingsDeclaration_CustomRegex *)self payloadRegex];
  id v6 = [v4 payloadRegex];
  v7 = +[RMModelConfigurationBase combineFirst:v5 other:v6];
  [(RMModelPasscodeSettingsDeclaration_CustomRegex *)self setPayloadRegex:v7];

  id v10 = [(RMModelPasscodeSettingsDeclaration_CustomRegex *)self payloadDescription];
  id v8 = [v4 payloadDescription];

  v9 = +[RMModelConfigurationBase combineDictionary:v10 other:v8];
  [(RMModelPasscodeSettingsDeclaration_CustomRegex *)self setPayloadDescription:v9];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelPasscodeSettingsDeclaration_CustomRegex;
  id v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadRegex copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(RMModelPasscodeSettingsDeclaration_CustomRegexDescription *)self->_payloadDescription copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadRegex
{
  return self->_payloadRegex;
}

- (void)setPayloadRegex:(id)a3
{
}

- (RMModelPasscodeSettingsDeclaration_CustomRegexDescription)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_payloadRegex, 0);
}

@end