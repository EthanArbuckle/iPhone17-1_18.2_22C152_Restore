@interface RMModelStatusReason
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithCode:(id)a3;
+ (id)buildWithCode:(id)a3 description:(id)a4 details:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)statusCode;
- (NSString)statusDescription;
- (RMModelAnyPayload)statusDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setStatusCode:(id)a3;
- (void)setStatusDescription:(id)a3;
- (void)setStatusDetails:(id)a3;
@end

@implementation RMModelStatusReason

+ (NSSet)allowedStatusKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"code";
  v6[1] = @"description";
  v6[2] = @"details";
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
  [v10 setStatusCode:v9];

  [v10 setStatusDescription:v8];
  [v10 setStatusDetails:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithCode:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusCode:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelStatusReason allowedStatusKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"code" forKeyPath:@"statusCode" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"description" forKeyPath:@"statusDescription" isRequired:0 defaultValue:0 error:a5])
    {
      LOWORD(v16) = a4;
      BOOL v14 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"details" forKeyPath:@"statusDetails" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5];
    }
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
  v6 = [(RMModelStatusReason *)self statusCode];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"code" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelStatusReason *)self statusDescription];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"description" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMModelStatusReason *)self statusDetails];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__RMModelStatusReason_serializeWithType___block_invoke;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v12 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"details" value:v8 dictSerializer:v11 isRequired:0 defaultValue:0];

  id v9 = (void *)[v5 copy];
  return v9;
}

uint64_t __41__RMModelStatusReason_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelStatusReason;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusCode copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusDescription copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(RMModelAnyPayload *)self->_statusDetails copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
}

- (RMModelAnyPayload)statusDetails
{
  return self->_statusDetails;
}

- (void)setStatusDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDetails, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
}

@end