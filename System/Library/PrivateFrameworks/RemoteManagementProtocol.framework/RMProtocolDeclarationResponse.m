@interface RMProtocolDeclarationResponse
+ (id)requestWithType:(id)a3 identifier:(id)a4 serverToken:(id)a5 payload:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)responseIdentifier;
- (NSString)responseServerToken;
- (NSString)responseType;
- (RMModelAnyPayload)responsePayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setResponseIdentifier:(id)a3;
- (void)setResponsePayload:(id)a3;
- (void)setResponseServerToken:(id)a3;
- (void)setResponseType:(id)a3;
@end

@implementation RMProtocolDeclarationResponse

+ (id)requestWithType:(id)a3 identifier:(id)a4 serverToken:(id)a5 payload:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setResponseType:v12];

  [v13 setResponseIdentifier:v11];
  [v13 setResponseServerToken:v10];

  [v13 setResponsePayload:v9];

  return v13;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"Type", @"responseType", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"Identifier", @"responseIdentifier", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
         "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
         v8,
         @"ServerToken",
         @"responseServerToken",
         1,
         0,
         a5))
  {
    LOWORD(v11) = a4;
    BOOL v9 = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Payload" forKeyPath:@"responsePayload" classType:objc_opt_class() isRequired:1 defaultValue:0 serializationType:v11 error:a5];
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
  v6 = [(RMProtocolDeclarationResponse *)self responseType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Type" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMProtocolDeclarationResponse *)self responseIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Identifier" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMProtocolDeclarationResponse *)self responseServerToken];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"ServerToken" value:v8 isRequired:1 defaultValue:0];

  BOOL v9 = [(RMProtocolDeclarationResponse *)self responsePayload];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__RMProtocolDeclarationResponse_serializeWithType___block_invoke;
  v12[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v13 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Payload" value:v9 dictSerializer:v12 isRequired:1 defaultValue:0];

  id v10 = (void *)[v5 copy];

  return v10;
}

uint64_t __51__RMProtocolDeclarationResponse_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMProtocolDeclarationResponse;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_responseType copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_responseIdentifier copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_responseServerToken copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(RMModelAnyPayload *)self->_responsePayload copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)responseType
{
  return self->_responseType;
}

- (void)setResponseType:(id)a3
{
}

- (NSString)responseIdentifier
{
  return self->_responseIdentifier;
}

- (void)setResponseIdentifier:(id)a3
{
}

- (NSString)responseServerToken
{
  return self->_responseServerToken;
}

- (void)setResponseServerToken:(id)a3
{
}

- (RMModelAnyPayload)responsePayload
{
  return self->_responsePayload;
}

- (void)setResponsePayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsePayload, 0);
  objc_storeStrong((id *)&self->_responseServerToken, 0);
  objc_storeStrong((id *)&self->_responseIdentifier, 0);

  objc_storeStrong((id *)&self->_responseType, 0);
}

@end