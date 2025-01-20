@interface RMModelPasscodeSettingsDeclaration_CustomRegexDescription
+ (NSSet)allowedPayloadKeys;
+ (id)build;
+ (id)buildRequiredOnly;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSDictionary)payloadDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadDictionary:(id)a3;
@end

@implementation RMModelPasscodeSettingsDeclaration_CustomRegexDescription

+ (NSSet)allowedPayloadKeys
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

+ (id)build
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  LOBYTE(a5) = [(RMModelPayloadBase *)self loadObjectsFromDictionary:v8 forKeyPath:@"payloadDictionary" classType:objc_opt_class() serializationType:v6 error:a5];

  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = [(RMModelPasscodeSettingsDeclaration_CustomRegexDescription *)self payloadDictionary];
  [(RMModelPayloadBase *)self serializeObjectsIntoDictionary:v5 value:v6 classType:objc_opt_class() serializationType:v3];

  v7 = (void *)[v5 copy];
  return v7;
}

- (void)combineWithOther:(id)a3
{
  id v4 = a3;
  id v7 = [(RMModelPasscodeSettingsDeclaration_CustomRegexDescription *)self payloadDictionary];
  v5 = [v4 payloadDictionary];

  uint64_t v6 = +[RMModelConfigurationBase combineMergeDictionary:v7 other:v5];
  [(RMModelPasscodeSettingsDeclaration_CustomRegexDescription *)self setPayloadDictionary:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMModelPasscodeSettingsDeclaration_CustomRegexDescription;
  id v4 = [(RMModelPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSDictionary *)self->_payloadDictionary copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSDictionary)payloadDictionary
{
  return self->_payloadDictionary;
}

- (void)setPayloadDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end