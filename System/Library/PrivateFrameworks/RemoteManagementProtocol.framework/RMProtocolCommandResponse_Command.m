@interface RMProtocolCommandResponse_Command
+ (NSSet)allowedResponseKeys;
+ (id)buildRequiredOnlyWithType:(id)a3 identifier:(id)a4;
+ (id)buildWithType:(id)a3 identifier:(id)a4 payload:(id)a5;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)responseIdentifier;
- (NSString)responseType;
- (RMModelAnyPayload)responsePayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setResponseIdentifier:(id)a3;
- (void)setResponsePayload:(id)a3;
- (void)setResponseType:(id)a3;
@end

@implementation RMProtocolCommandResponse_Command

+ (NSSet)allowedResponseKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v6[1] = @"Identifier";
  v6[2] = @"Payload";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithType:(id)a3 identifier:(id)a4 payload:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setResponseType:v9];

  [v10 setResponseIdentifier:v8];
  [v10 setResponsePayload:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithType:(id)a3 identifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setResponseType:v6];

  [v7 setResponseIdentifier:v5];

  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMProtocolCommandResponse_Command allowedResponseKeys];
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

LABEL_7:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    if (![(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Type" forKeyPath:@"responseType" isRequired:1 defaultValue:0 error:a5]|| ![(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Identifier" forKeyPath:@"responseIdentifier" isRequired:1 defaultValue:0 error:a5])
    {
      goto LABEL_7;
    }
    LOWORD(v17) = a4;
    LOBYTE(a5) = [(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Payload" forKeyPath:@"responsePayload" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v17 error:a5];
  }

  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMProtocolCommandResponse_Command *)self responseType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Type" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMProtocolCommandResponse_Command *)self responseIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Identifier" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMProtocolCommandResponse_Command *)self responsePayload];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__RMProtocolCommandResponse_Command_serializeWithType___block_invoke;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v12 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Payload" value:v8 dictSerializer:v11 isRequired:0 defaultValue:0];

  id v9 = (void *)[v5 copy];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMProtocolCommandResponse_Command;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_responseType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_responseIdentifier copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(RMModelAnyPayload *)self->_responsePayload copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

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
  objc_storeStrong((id *)&self->_responseIdentifier, 0);

  objc_storeStrong((id *)&self->_responseType, 0);
}

@end