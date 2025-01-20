@interface RMProtocolStatusReport
+ (id)requestWithStatusItems:(id)a3 errors:(id)a4 fullReport:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)reportErrors;
- (NSNumber)reportFullReport;
- (RMModelAnyPayload)reportStatusItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setReportErrors:(id)a3;
- (void)setReportFullReport:(id)a3;
- (void)setReportStatusItems:(id)a3;
@end

@implementation RMProtocolStatusReport

+ (id)requestWithStatusItems:(id)a3 errors:(id)a4 fullReport:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setReportStatusItems:v9];

  [v10 setReportErrors:v8];
  if (v7) {
    id v11 = v7;
  }
  else {
    id v11 = (id)MEMORY[0x263EFFA80];
  }
  [v10 setReportFullReport:v11];

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  LOWORD(v11) = a4;
  if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"StatusItems" forKeyPath:@"reportStatusItems" classType:objc_opt_class() isRequired:1 defaultValue:0 serializationType:v11 error:a5])
  {
    LOWORD(v12) = a4;
    BOOL v9 = 0;
    if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"Errors" forKeyPath:@"reportErrors" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 serializationType:v12 error:a5])
    {
      BOOL v9 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"FullReport" forKeyPath:@"reportFullReport" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)serializeWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMProtocolStatusReport *)self reportStatusItems];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__RMProtocolStatusReport_serializeWithType___block_invoke;
  v13[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v14 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"StatusItems" value:v6 dictSerializer:v13 isRequired:1 defaultValue:0];

  id v7 = [(RMProtocolStatusReport *)self reportErrors];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__RMProtocolStatusReport_serializeWithType___block_invoke_2;
  v11[3] = &__block_descriptor_34_e53___NSDictionary_16__0__RMProtocolStatusReport_Errors_8l;
  signed __int16 v12 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"Errors" value:v7 itemSerializer:v11 isRequired:1 defaultValue:0];

  id v8 = [(RMProtocolStatusReport *)self reportFullReport];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"FullReport" value:v8 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  BOOL v9 = (void *)[v5 copy];

  return v9;
}

uint64_t __44__RMProtocolStatusReport_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __44__RMProtocolStatusReport_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMProtocolStatusReport;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(RMModelAnyPayload *)self->_reportStatusItems copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_reportErrors copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_reportFullReport copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (RMModelAnyPayload)reportStatusItems
{
  return self->_reportStatusItems;
}

- (void)setReportStatusItems:(id)a3
{
}

- (NSArray)reportErrors
{
  return self->_reportErrors;
}

- (void)setReportErrors:(id)a3
{
}

- (NSNumber)reportFullReport
{
  return self->_reportFullReport;
}

- (void)setReportFullReport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportFullReport, 0);
  objc_storeStrong((id *)&self->_reportErrors, 0);

  objc_storeStrong((id *)&self->_reportStatusItems, 0);
}

uint64_t __51__RMProtocolStatusReport_Errors_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __57__RMProtocolStatusReport_StatusReason_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

@end