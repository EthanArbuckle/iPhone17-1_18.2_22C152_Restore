@interface RMProtocolErrorResponse
+ (id)requestWithCode:(id)a3 description:(id)a4 details:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)responseCode;
- (NSString)responseDescription;
- (RMModelAnyPayload)responseDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setResponseCode:(id)a3;
- (void)setResponseDescription:(id)a3;
- (void)setResponseDetails:(id)a3;
@end

@implementation RMProtocolErrorResponse

+ (id)requestWithCode:(id)a3 description:(id)a4 details:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setResponseCode:v9];

  [v10 setResponseDescription:v8];
  [v10 setResponseDetails:v7];

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Code" forKeyPath:@"responseCode" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v9 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Description" forKeyPath:@"responseDescription" isRequired:0 defaultValue:0 error:a5])
    {
      LOWORD(v11) = a4;
      BOOL v9 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Details" forKeyPath:@"responseDetails" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v11 error:a5];
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
  v6 = [(RMProtocolErrorResponse *)self responseCode];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Code" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMProtocolErrorResponse *)self responseDescription];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Description" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMProtocolErrorResponse *)self responseDetails];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__RMProtocolErrorResponse_serializeWithType___block_invoke;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v12 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Details" value:v8 dictSerializer:v11 isRequired:0 defaultValue:0];

  BOOL v9 = (void *)[v5 copy];

  return v9;
}

uint64_t __45__RMProtocolErrorResponse_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMProtocolErrorResponse;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_responseCode copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_responseDescription copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(RMModelAnyPayload *)self->_responseDetails copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(id)a3
{
}

- (NSString)responseDescription
{
  return self->_responseDescription;
}

- (void)setResponseDescription:(id)a3
{
}

- (RMModelAnyPayload)responseDetails
{
  return self->_responseDetails;
}

- (void)setResponseDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDetails, 0);
  objc_storeStrong((id *)&self->_responseDescription, 0);

  objc_storeStrong((id *)&self->_responseCode, 0);
}

@end