@interface RMProtocolStatusReport_Errors
+ (NSSet)allowedReportKeys;
+ (id)buildRequiredOnlyWithStatusItem:(id)a3;
+ (id)buildWithStatusItem:(id)a3 reasons:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)reportReasons;
- (NSString)reportStatusItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setReportReasons:(id)a3;
- (void)setReportStatusItem:(id)a3;
@end

@implementation RMProtocolStatusReport_Errors

+ (NSSet)allowedReportKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"StatusItem";
  v6[1] = @"Reasons";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithStatusItem:(id)a3 reasons:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setReportStatusItem:v6];

  [v7 setReportReasons:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithStatusItem:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setReportStatusItem:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMProtocolStatusReport_Errors allowedReportKeys];
  [v11 minusSet:v12];

  if ([v11 count])
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08320];
      v14 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v11];
      v19[0] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a5 = [v13 errorWithDomain:@"error" code:1 userInfo:v15];

LABEL_6:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    if (![(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"StatusItem" forKeyPath:@"reportStatusItem" isRequired:1 defaultValue:0 error:a5])goto LABEL_6; {
    LOWORD(v17) = a4;
    }
    LOBYTE(a5) = [(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"Reasons" forKeyPath:@"reportReasons" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 serializationType:v17 error:a5];
  }

  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMProtocolStatusReport_Errors *)self reportStatusItem];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"StatusItem" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMProtocolStatusReport_Errors *)self reportReasons];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__RMProtocolStatusReport_Errors_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e59___NSDictionary_16__0__RMProtocolStatusReport_StatusReason_8l;
  signed __int16 v11 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"Reasons" value:v7 itemSerializer:v10 isRequired:0 defaultValue:0];

  id v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMProtocolStatusReport_Errors;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_reportStatusItem copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_reportReasons copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)reportStatusItem
{
  return self->_reportStatusItem;
}

- (void)setReportStatusItem:(id)a3
{
}

- (NSArray)reportReasons
{
  return self->_reportReasons;
}

- (void)setReportReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportReasons, 0);

  objc_storeStrong((id *)&self->_reportStatusItem, 0);
}

@end