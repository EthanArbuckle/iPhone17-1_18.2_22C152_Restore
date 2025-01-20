@interface RMModelSoftwareUpdateSettingsDeclaration_Beta
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithProgramEnrollment:(id)a3 offerPrograms:(id)a4 requireProgram:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadOfferPrograms;
- (NSString)payloadProgramEnrollment;
- (RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram)payloadRequireProgram;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadOfferPrograms:(id)a3;
- (void)setPayloadProgramEnrollment:(id)a3;
- (void)setPayloadRequireProgram:(id)a3;
@end

@implementation RMModelSoftwareUpdateSettingsDeclaration_Beta

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"ProgramEnrollment";
  v6[1] = @"OfferPrograms";
  v6[2] = @"RequireProgram";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithProgramEnrollment:(id)a3 offerPrograms:(id)a4 requireProgram:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = (__CFString *)a3;
  v10 = objc_opt_new();
  v11 = v10;
  if (v9) {
    v12 = v9;
  }
  else {
    v12 = @"Allowed";
  }
  [v10 setPayloadProgramEnrollment:v12];

  [v11 setPayloadOfferPrograms:v8];
  [v11 setPayloadRequireProgram:v7];

  return v11;
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

  v12 = +[RMModelSoftwareUpdateSettingsDeclaration_Beta allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"ProgramEnrollment" forKeyPath:@"payloadProgramEnrollment" isRequired:0 defaultValue:@"Allowed" error:a5])
  {
    LOWORD(v17) = a4;
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"OfferPrograms" forKeyPath:@"payloadOfferPrograms" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 serializationType:v17 error:a5])
    {
      LOWORD(v16) = a4;
      BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"RequireProgram" forKeyPath:@"payloadRequireProgram" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5];
    }
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMModelSoftwareUpdateSettingsDeclaration_Beta *)self payloadProgramEnrollment];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"ProgramEnrollment" value:v6 isRequired:0 defaultValue:@"Allowed"];

  id v7 = [(RMModelSoftwareUpdateSettingsDeclaration_Beta *)self payloadOfferPrograms];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__RMModelSoftwareUpdateSettingsDeclaration_Beta_serializeWithType___block_invoke;
  v13[3] = &__block_descriptor_34_e76___NSDictionary_16__0__RMModelSoftwareUpdateSettingsDeclaration_BetaProgram_8l;
  signed __int16 v14 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"OfferPrograms" value:v7 itemSerializer:v13 isRequired:0 defaultValue:0];

  id v8 = [(RMModelSoftwareUpdateSettingsDeclaration_Beta *)self payloadRequireProgram];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__RMModelSoftwareUpdateSettingsDeclaration_Beta_serializeWithType___block_invoke_2;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v12 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"RequireProgram" value:v8 dictSerializer:v11 isRequired:0 defaultValue:0];

  v9 = (void *)[v5 copy];
  return v9;
}

- (void)combineWithOther:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(RMModelSoftwareUpdateSettingsDeclaration_Beta *)self payloadProgramEnrollment];
  v6 = [v4 payloadProgramEnrollment];
  v15[0] = @"Allowed";
  v15[1] = @"AlwaysOn";
  v15[2] = @"AlwaysOff";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  id v8 = +[RMModelConfigurationBase combineEnumLast:v5 other:v6 enums:v7];
  [(RMModelSoftwareUpdateSettingsDeclaration_Beta *)self setPayloadProgramEnrollment:v8];

  v9 = [(RMModelSoftwareUpdateSettingsDeclaration_Beta *)self payloadOfferPrograms];
  v10 = [v4 payloadOfferPrograms];
  v11 = +[RMModelConfigurationBase combineSetUnion:v9 other:v10];
  [(RMModelSoftwareUpdateSettingsDeclaration_Beta *)self setPayloadOfferPrograms:v11];

  signed __int16 v12 = [(RMModelSoftwareUpdateSettingsDeclaration_Beta *)self payloadRequireProgram];
  v13 = [v4 payloadRequireProgram];

  signed __int16 v14 = +[RMModelConfigurationBase combineFirst:v12 other:v13];
  [(RMModelSoftwareUpdateSettingsDeclaration_Beta *)self setPayloadRequireProgram:v14];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration_Beta;
  id v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadProgramEnrollment copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadOfferPrograms copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram *)self->_payloadRequireProgram copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadProgramEnrollment
{
  return self->_payloadProgramEnrollment;
}

- (void)setPayloadProgramEnrollment:(id)a3
{
}

- (NSArray)payloadOfferPrograms
{
  return self->_payloadOfferPrograms;
}

- (void)setPayloadOfferPrograms:(id)a3
{
}

- (RMModelSoftwareUpdateSettingsDeclaration_BetaRequireProgram)payloadRequireProgram
{
  return self->_payloadRequireProgram;
}

- (void)setPayloadRequireProgram:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRequireProgram, 0);
  objc_storeStrong((id *)&self->_payloadOfferPrograms, 0);
  objc_storeStrong((id *)&self->_payloadProgramEnrollment, 0);
}

@end