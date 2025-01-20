@interface RMProtocolDeclarationItemsResponse
+ (id)requestWithDeclarations:(id)a3 declarationsToken:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)responseDeclarationsToken;
- (RMProtocolDeclarationItemsResponse_Declarations)responseDeclarations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setResponseDeclarations:(id)a3;
- (void)setResponseDeclarationsToken:(id)a3;
@end

@implementation RMProtocolDeclarationItemsResponse

+ (id)requestWithDeclarations:(id)a3 declarationsToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setResponseDeclarations:v6];

  [v7 setResponseDeclarationsToken:v5];

  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  LOWORD(v11) = a4;
  if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"Declarations" forKeyPath:@"responseDeclarations" classType:objc_opt_class() isRequired:1 defaultValue:0 serializationType:v11 error:a5])
  {
    BOOL v9 = [(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"DeclarationsToken" forKeyPath:@"responseDeclarationsToken" isRequired:1 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)serializeWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMProtocolDeclarationItemsResponse *)self responseDeclarations];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__RMProtocolDeclarationItemsResponse_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v11 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"Declarations" value:v6 dictSerializer:v10 isRequired:1 defaultValue:0];

  v7 = [(RMProtocolDeclarationItemsResponse *)self responseDeclarationsToken];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"DeclarationsToken" value:v7 isRequired:1 defaultValue:0];

  id v8 = (void *)[v5 copy];

  return v8;
}

uint64_t __56__RMProtocolDeclarationItemsResponse_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMProtocolDeclarationItemsResponse;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(RMProtocolDeclarationItemsResponse_Declarations *)self->_responseDeclarations copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_responseDeclarationsToken copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (RMProtocolDeclarationItemsResponse_Declarations)responseDeclarations
{
  return self->_responseDeclarations;
}

- (void)setResponseDeclarations:(id)a3
{
}

- (NSString)responseDeclarationsToken
{
  return self->_responseDeclarationsToken;
}

- (void)setResponseDeclarationsToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDeclarationsToken, 0);

  objc_storeStrong((id *)&self->_responseDeclarations, 0);
}

uint64_t __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

@end