@interface RMProtocolDeclarationItemsResponse_Declarations
+ (NSSet)allowedResponseKeys;
+ (id)buildRequiredOnlyWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6;
+ (id)buildWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)responseActivations;
- (NSArray)responseAssets;
- (NSArray)responseConfigurations;
- (NSArray)responseManagement;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setResponseActivations:(id)a3;
- (void)setResponseAssets:(id)a3;
- (void)setResponseConfigurations:(id)a3;
- (void)setResponseManagement:(id)a3;
@end

@implementation RMProtocolDeclarationItemsResponse_Declarations

+ (NSSet)allowedResponseKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Activations";
  v6[1] = @"Configurations";
  v6[2] = @"Assets";
  v6[3] = @"Management";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setResponseActivations:v12];

  [v13 setResponseConfigurations:v11];
  [v13 setResponseAssets:v10];

  [v13 setResponseManagement:v9];

  return v13;
}

+ (id)buildRequiredOnlyWithActivations:(id)a3 configurations:(id)a4 assets:(id)a5 management:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setResponseActivations:v12];

  [v13 setResponseConfigurations:v11];
  [v13 setResponseAssets:v10];

  [v13 setResponseManagement:v9];

  return v13;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  id v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMProtocolDeclarationItemsResponse_Declarations allowedResponseKeys];
  [v11 minusSet:v12];

  if ([v11 count])
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F08320];
      v14 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v11];
      v23[0] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
      *a5 = [v13 errorWithDomain:@"error" code:1 userInfo:v15];
    }
    BOOL v16 = 0;
  }
  else
  {
    LOWORD(v18) = a4;
    BOOL v16 = 0;
    if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"Activations" forKeyPath:@"responseActivations" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 serializationType:v18 error:a5])
    {
      LOWORD(v19) = a4;
      BOOL v16 = 0;
      if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"Configurations" forKeyPath:@"responseConfigurations" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 serializationType:v19 error:a5])
      {
        LOWORD(v20) = a4;
        BOOL v16 = 0;
        if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"Assets" forKeyPath:@"responseAssets" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 serializationType:v20 error:a5])
        {
          LOWORD(v21) = a4;
          BOOL v16 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"Management" forKeyPath:@"responseManagement" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 serializationType:v21 error:a5];
        }
      }
    }
  }

  return v16;
}

- (id)serializeWithType:(signed __int16)a3
{
  v5 = objc_opt_new();
  v6 = [(RMProtocolDeclarationItemsResponse_Declarations *)self responseActivations];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke;
  v18[3] = &__block_descriptor_34_e74___NSDictionary_16__0__RMProtocolDeclarationItemsResponse_DeclarationItem_8l;
  signed __int16 v19 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"Activations" value:v6 itemSerializer:v18 isRequired:1 defaultValue:0];

  v7 = [(RMProtocolDeclarationItemsResponse_Declarations *)self responseConfigurations];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke_2;
  v16[3] = &__block_descriptor_34_e74___NSDictionary_16__0__RMProtocolDeclarationItemsResponse_DeclarationItem_8l;
  signed __int16 v17 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"Configurations" value:v7 itemSerializer:v16 isRequired:1 defaultValue:0];

  id v8 = [(RMProtocolDeclarationItemsResponse_Declarations *)self responseAssets];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke_3;
  v14[3] = &__block_descriptor_34_e74___NSDictionary_16__0__RMProtocolDeclarationItemsResponse_DeclarationItem_8l;
  signed __int16 v15 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"Assets" value:v8 itemSerializer:v14 isRequired:1 defaultValue:0];

  id v9 = [(RMProtocolDeclarationItemsResponse_Declarations *)self responseManagement];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__RMProtocolDeclarationItemsResponse_Declarations_serializeWithType___block_invoke_4;
  v12[3] = &__block_descriptor_34_e74___NSDictionary_16__0__RMProtocolDeclarationItemsResponse_DeclarationItem_8l;
  signed __int16 v13 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"Management" value:v9 itemSerializer:v12 isRequired:1 defaultValue:0];

  id v10 = (void *)[v5 copy];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMProtocolDeclarationItemsResponse_Declarations;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_responseActivations copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_responseConfigurations copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_responseAssets copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_responseManagement copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSArray)responseActivations
{
  return self->_responseActivations;
}

- (void)setResponseActivations:(id)a3
{
}

- (NSArray)responseConfigurations
{
  return self->_responseConfigurations;
}

- (void)setResponseConfigurations:(id)a3
{
}

- (NSArray)responseAssets
{
  return self->_responseAssets;
}

- (void)setResponseAssets:(id)a3
{
}

- (NSArray)responseManagement
{
  return self->_responseManagement;
}

- (void)setResponseManagement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseManagement, 0);
  objc_storeStrong((id *)&self->_responseAssets, 0);
  objc_storeStrong((id *)&self->_responseConfigurations, 0);

  objc_storeStrong((id *)&self->_responseActivations, 0);
}

@end