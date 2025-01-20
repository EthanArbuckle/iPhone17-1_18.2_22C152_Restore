@interface RMModelStatusSoftwareUpdateInstallReason
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithReason:(id)a3;
+ (id)buildWithReason:(id)a3 declarationId:(id)a4;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)statusReason;
- (NSString)statusDeclarationId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusDeclarationId:(id)a3;
- (void)setStatusReason:(id)a3;
@end

@implementation RMModelStatusSoftwareUpdateInstallReason

+ (NSSet)allowedStatusKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"reason";
  v6[1] = @"declaration-id";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"softwareupdate.install-reason";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)buildWithReason:(id)a3 declarationId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusReason:v6];

  [v7 setStatusDeclarationId:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithReason:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusReason:v3];

  return v4;
}

+ (id)supportedOS
{
  v17[3] = *MEMORY[0x263EF8340];
  v16[0] = &unk_2708C3900;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0AF8];
  v15[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0B10];
  v15[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v17[0] = v4;
  v16[1] = &unk_2708C3918;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0B28];
  v14[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0B40];
  v14[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v17[1] = v7;
  v16[2] = &unk_2708C3948;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0B58];
  v13[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0B70];
  v13[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v17[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelStatusSoftwareUpdateInstallReason allowedStatusKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v7 usingKey:@"reason" forKeyPath:@"statusReason" validator:&__block_literal_global_26 isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"declaration-id" forKeyPath:@"statusDeclarationId" isRequired:0 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __94__RMModelStatusSoftwareUpdateInstallReason_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelStatusSoftwareUpdateInstallReason *)self statusReason];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v4 usingKey:@"reason" value:v5 itemSerializer:&__block_literal_global_44 isRequired:1 defaultValue:0];

  id v6 = [(RMModelStatusSoftwareUpdateInstallReason *)self statusDeclarationId];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"declaration-id" value:v6 isRequired:0 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

id __69__RMModelStatusSoftwareUpdateInstallReason_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelStatusSoftwareUpdateInstallReason;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_statusReason copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusDeclarationId copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSArray)statusReason
{
  return self->_statusReason;
}

- (void)setStatusReason:(id)a3
{
}

- (NSString)statusDeclarationId
{
  return self->_statusDeclarationId;
}

- (void)setStatusDeclarationId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDeclarationId, 0);
  objc_storeStrong((id *)&self->_statusReason, 0);
}

@end