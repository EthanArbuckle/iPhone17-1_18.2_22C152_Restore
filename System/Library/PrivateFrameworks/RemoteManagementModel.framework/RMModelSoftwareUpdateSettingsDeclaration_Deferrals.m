@interface RMModelSoftwareUpdateSettingsDeclaration_Deferrals
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithCombinedPeriodInDays:(id)a3 majorPeriodInDays:(id)a4 minorPeriodInDays:(id)a5 systemPeriodInDays:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadCombinedPeriodInDays;
- (NSNumber)payloadMajorPeriodInDays;
- (NSNumber)payloadMinorPeriodInDays;
- (NSNumber)payloadSystemPeriodInDays;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadCombinedPeriodInDays:(id)a3;
- (void)setPayloadMajorPeriodInDays:(id)a3;
- (void)setPayloadMinorPeriodInDays:(id)a3;
- (void)setPayloadSystemPeriodInDays:(id)a3;
@end

@implementation RMModelSoftwareUpdateSettingsDeclaration_Deferrals

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"CombinedPeriodInDays";
  v6[1] = @"MajorPeriodInDays";
  v6[2] = @"MinorPeriodInDays";
  v6[3] = @"SystemPeriodInDays";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithCombinedPeriodInDays:(id)a3 majorPeriodInDays:(id)a4 minorPeriodInDays:(id)a5 systemPeriodInDays:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadCombinedPeriodInDays:v12];

  [v13 setPayloadMajorPeriodInDays:v11];
  [v13 setPayloadMinorPeriodInDays:v10];

  [v13 setPayloadSystemPeriodInDays:v9];
  return v13;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelSoftwareUpdateSettingsDeclaration_Deferrals allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"CombinedPeriodInDays" forKeyPath:@"payloadCombinedPeriodInDays" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"MajorPeriodInDays" forKeyPath:@"payloadMajorPeriodInDays" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"MinorPeriodInDays" forKeyPath:@"payloadMinorPeriodInDays" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = [(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"SystemPeriodInDays" forKeyPath:@"payloadSystemPeriodInDays" isRequired:0 defaultValue:0 error:a5];
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self payloadCombinedPeriodInDays];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"CombinedPeriodInDays" value:v5 isRequired:0 defaultValue:0];

  v6 = [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self payloadMajorPeriodInDays];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"MajorPeriodInDays" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self payloadMinorPeriodInDays];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"MinorPeriodInDays" value:v7 isRequired:0 defaultValue:0];

  v8 = [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self payloadSystemPeriodInDays];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"SystemPeriodInDays" value:v8 isRequired:0 defaultValue:0];

  id v9 = (void *)[v4 copy];
  return v9;
}

- (void)combineWithOther:(id)a3
{
  id v4 = a3;
  v5 = [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self payloadCombinedPeriodInDays];
  v6 = [v4 payloadCombinedPeriodInDays];
  id v7 = +[RMModelConfigurationBase combineNumberMax:v5 other:v6];
  [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self setPayloadCombinedPeriodInDays:v7];

  v8 = [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self payloadMajorPeriodInDays];
  id v9 = [v4 payloadMajorPeriodInDays];
  id v10 = +[RMModelConfigurationBase combineNumberMax:v8 other:v9];
  [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self setPayloadMajorPeriodInDays:v10];

  id v11 = [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self payloadMinorPeriodInDays];
  id v12 = [v4 payloadMinorPeriodInDays];
  BOOL v13 = +[RMModelConfigurationBase combineNumberMax:v11 other:v12];
  [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self setPayloadMinorPeriodInDays:v13];

  id v16 = [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self payloadSystemPeriodInDays];
  v14 = [v4 payloadSystemPeriodInDays];

  v15 = +[RMModelConfigurationBase combineNumberMax:v16 other:v14];
  [(RMModelSoftwareUpdateSettingsDeclaration_Deferrals *)self setPayloadSystemPeriodInDays:v15];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelSoftwareUpdateSettingsDeclaration_Deferrals;
  id v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadCombinedPeriodInDays copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadMajorPeriodInDays copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadMinorPeriodInDays copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadSystemPeriodInDays copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)payloadCombinedPeriodInDays
{
  return self->_payloadCombinedPeriodInDays;
}

- (void)setPayloadCombinedPeriodInDays:(id)a3
{
}

- (NSNumber)payloadMajorPeriodInDays
{
  return self->_payloadMajorPeriodInDays;
}

- (void)setPayloadMajorPeriodInDays:(id)a3
{
}

- (NSNumber)payloadMinorPeriodInDays
{
  return self->_payloadMinorPeriodInDays;
}

- (void)setPayloadMinorPeriodInDays:(id)a3
{
}

- (NSNumber)payloadSystemPeriodInDays
{
  return self->_payloadSystemPeriodInDays;
}

- (void)setPayloadSystemPeriodInDays:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSystemPeriodInDays, 0);
  objc_storeStrong((id *)&self->_payloadMinorPeriodInDays, 0);
  objc_storeStrong((id *)&self->_payloadMajorPeriodInDays, 0);
  objc_storeStrong((id *)&self->_payloadCombinedPeriodInDays, 0);
}

@end