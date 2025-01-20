@interface RMProtocolCommandRequest
+ (id)requestWithStatus:(id)a3 identifier:(id)a4 result:(id)a5 reasons:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)requestReasons;
- (NSString)requestIdentifier;
- (NSString)requestStatus;
- (RMModelAnyPayload)requestResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestReasons:(id)a3;
- (void)setRequestResult:(id)a3;
- (void)setRequestStatus:(id)a3;
@end

@implementation RMProtocolCommandRequest

+ (id)requestWithStatus:(id)a3 identifier:(id)a4 result:(id)a5 reasons:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setRequestStatus:v12];

  [v13 setRequestIdentifier:v11];
  [v13 setRequestResult:v10];

  [v13 setRequestReasons:v9];

  return v13;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Status" forKeyPath:@"requestStatus" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v9 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Identifier" forKeyPath:@"requestIdentifier" isRequired:0 defaultValue:0 error:a5])
    {
      LOWORD(v11) = a4;
      BOOL v9 = 0;
      if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Result" forKeyPath:@"requestResult" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v11 error:a5])
      {
        LOWORD(v12) = a4;
        BOOL v9 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"Reasons" forKeyPath:@"requestReasons" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 serializationType:v12 error:a5];
      }
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
  v6 = [(RMProtocolCommandRequest *)self requestStatus];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Status" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMProtocolCommandRequest *)self requestIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Identifier" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMProtocolCommandRequest *)self requestResult];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__RMProtocolCommandRequest_serializeWithType___block_invoke;
  v14[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v15 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Result" value:v8 dictSerializer:v14 isRequired:0 defaultValue:0];

  BOOL v9 = [(RMProtocolCommandRequest *)self requestReasons];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__RMProtocolCommandRequest_serializeWithType___block_invoke_2;
  v12[3] = &__block_descriptor_34_e61___NSDictionary_16__0__RMProtocolCommandRequest_StatusReason_8l;
  signed __int16 v13 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"Reasons" value:v9 itemSerializer:v12 isRequired:0 defaultValue:0];

  id v10 = (void *)[v5 copy];

  return v10;
}

uint64_t __46__RMProtocolCommandRequest_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __46__RMProtocolCommandRequest_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMProtocolCommandRequest;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_requestStatus copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_requestIdentifier copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(RMModelAnyPayload *)self->_requestResult copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_requestReasons copy];
  uint64_t v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (RMModelAnyPayload)requestResult
{
  return self->_requestResult;
}

- (void)setRequestResult:(id)a3
{
}

- (NSArray)requestReasons
{
  return self->_requestReasons;
}

- (void)setRequestReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestReasons, 0);
  objc_storeStrong((id *)&self->_requestResult, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_requestStatus, 0);
}

uint64_t __59__RMProtocolCommandRequest_StatusReason_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

@end