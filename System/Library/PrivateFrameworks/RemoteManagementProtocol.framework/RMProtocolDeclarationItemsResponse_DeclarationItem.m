@interface RMProtocolDeclarationItemsResponse_DeclarationItem
+ (NSSet)allowedResponseKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 serverToken:(id)a4;
+ (id)buildWithIdentifier:(id)a3 serverToken:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)responseIdentifier;
- (NSString)responseServerToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setResponseIdentifier:(id)a3;
- (void)setResponseServerToken:(id)a3;
@end

@implementation RMProtocolDeclarationItemsResponse_DeclarationItem

+ (NSSet)allowedResponseKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Identifier";
  v6[1] = @"ServerToken";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 serverToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setResponseIdentifier:v6];

  [v7 setResponseServerToken:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 serverToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setResponseIdentifier:v6];

  [v7 setResponseServerToken:v5];

  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMProtocolDeclarationItemsResponse_DeclarationItem allowedResponseKeys];
  [v10 minusSet:v11];

  if ([v10 count])
  {
    if (a5)
    {
      v12 = (void *)MEMORY[0x263F087E8];
      v13 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v10, *MEMORY[0x263F08320]];
      v17[0] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a5 = [v12 errorWithDomain:@"error" code:1 userInfo:v14];

LABEL_6:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    if (![(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Identifier" forKeyPath:@"responseIdentifier" isRequired:1 defaultValue:0 error:a5])goto LABEL_6; {
    LOBYTE(a5) = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"ServerToken" forKeyPath:@"responseServerToken" isRequired:1 defaultValue:0 error:a5];
    }
  }

  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMProtocolDeclarationItemsResponse_DeclarationItem *)self responseIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Identifier" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMProtocolDeclarationItemsResponse_DeclarationItem *)self responseServerToken];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ServerToken" value:v6 isRequired:1 defaultValue:0];

  id v7 = (void *)[v4 copy];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMProtocolDeclarationItemsResponse_DeclarationItem;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_responseIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_responseServerToken copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseServerToken, 0);

  objc_storeStrong((id *)&self->_responseIdentifier, 0);
}

@end