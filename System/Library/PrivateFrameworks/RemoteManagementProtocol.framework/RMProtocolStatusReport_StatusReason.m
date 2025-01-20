@interface RMProtocolStatusReport_StatusReason
+ (NSSet)allowedReportKeys;
+ (id)buildRequiredOnlyWithCode:(id)a3;
+ (id)buildWithCode:(id)a3 description:(id)a4 details:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)reportCode;
- (NSString)reportDescription;
- (RMModelAnyPayload)reportDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setReportCode:(id)a3;
- (void)setReportDescription:(id)a3;
- (void)setReportDetails:(id)a3;
@end

@implementation RMProtocolStatusReport_StatusReason

+ (NSSet)allowedReportKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Code";
  v6[1] = @"Description";
  v6[2] = @"Details";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithCode:(id)a3 description:(id)a4 details:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setReportCode:v9];

  [v10 setReportDescription:v8];
  [v10 setReportDetails:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithCode:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setReportCode:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMProtocolStatusReport_StatusReason allowedReportKeys];
  [v11 minusSet:v12];

  if ([v11 count])
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F08320];
      v14 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v11];
      v20[0] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      *a5 = [v13 errorWithDomain:@"error" code:1 userInfo:v15];
    }
    goto LABEL_7;
  }
  if (![(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Code" forKeyPath:@"reportCode" isRequired:1 defaultValue:0 error:a5])
  {
LABEL_7:
    BOOL v16 = 0;
    goto LABEL_8;
  }
  BOOL v16 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Description" forKeyPath:@"reportDescription" isRequired:0 defaultValue:0 error:a5])
  {
    LOWORD(v18) = a4;
    BOOL v16 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Details" forKeyPath:@"reportDetails" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v18 error:a5];
  }
LABEL_8:

  return v16;
}

- (id)serializeWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMProtocolStatusReport_StatusReason *)self reportCode];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Code" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMProtocolStatusReport_StatusReason *)self reportDescription];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Description" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMProtocolStatusReport_StatusReason *)self reportDetails];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__RMProtocolStatusReport_StatusReason_serializeWithType___block_invoke;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v12 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Details" value:v8 dictSerializer:v11 isRequired:0 defaultValue:0];

  id v9 = (void *)[v5 copy];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMProtocolStatusReport_StatusReason;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_reportCode copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_reportDescription copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(RMModelAnyPayload *)self->_reportDetails copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)reportCode
{
  return self->_reportCode;
}

- (void)setReportCode:(id)a3
{
}

- (NSString)reportDescription
{
  return self->_reportDescription;
}

- (void)setReportDescription:(id)a3
{
}

- (RMModelAnyPayload)reportDetails
{
  return self->_reportDetails;
}

- (void)setReportDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportDetails, 0);
  objc_storeStrong((id *)&self->_reportDescription, 0);

  objc_storeStrong((id *)&self->_reportCode, 0);
}

@end