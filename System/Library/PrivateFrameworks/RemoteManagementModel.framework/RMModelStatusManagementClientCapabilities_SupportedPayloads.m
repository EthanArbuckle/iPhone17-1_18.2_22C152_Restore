@interface RMModelStatusManagementClientCapabilities_SupportedPayloads
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithDeclarations:(id)a3 statusItems:(id)a4;
+ (id)buildWithDeclarations:(id)a3 statusItems:(id)a4;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)statusStatusItems;
- (RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations)statusDeclarations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setStatusDeclarations:(id)a3;
- (void)setStatusStatusItems:(id)a3;
@end

@implementation RMModelStatusManagementClientCapabilities_SupportedPayloads

+ (NSSet)allowedStatusKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"declarations";
  v6[1] = @"status-items";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDeclarations:(id)a3 statusItems:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusDeclarations:v6];

  [v7 setStatusStatusItems:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithDeclarations:(id)a3 statusItems:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusDeclarations:v6];

  [v7 setStatusStatusItems:v5];
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelStatusManagementClientCapabilities_SupportedPayloads allowedStatusKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  LOWORD(v16) = a4;
  if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"declarations" forKeyPath:@"statusDeclarations" classType:objc_opt_class() isRequired:1 defaultValue:0 serializationType:v16 error:a5])
  {
    BOOL v14 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"status-items" forKeyPath:@"statusStatusItems" validator:&__block_literal_global_127 isRequired:1 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)serializeWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMModelStatusManagementClientCapabilities_SupportedPayloads *)self statusDeclarations];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__RMModelStatusManagementClientCapabilities_SupportedPayloads_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v11 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"declarations" value:v6 dictSerializer:v10 isRequired:1 defaultValue:0];

  v7 = [(RMModelStatusManagementClientCapabilities_SupportedPayloads *)self statusStatusItems];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"status-items" value:v7 itemSerializer:&__block_literal_global_129 isRequired:1 defaultValue:0];

  id v8 = (void *)[v5 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelStatusManagementClientCapabilities_SupportedPayloads;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations *)self->_statusDeclarations copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_statusStatusItems copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (RMModelStatusManagementClientCapabilities_SupportedPayloadsDeclarations)statusDeclarations
{
  return self->_statusDeclarations;
}

- (void)setStatusDeclarations:(id)a3
{
}

- (NSArray)statusStatusItems
{
  return self->_statusStatusItems;
}

- (void)setStatusStatusItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusStatusItems, 0);
  objc_storeStrong((id *)&self->_statusDeclarations, 0);
}

@end