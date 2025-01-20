@interface RMModelServicesBackgroundTasksDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 taskType:(id)a4;
+ (id)buildWithIdentifier:(id)a3 taskType:(id)a4 taskDescription:(id)a5 executableAssetReference:(id)a6 launchdConfigurations:(id)a7;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadLaunchdConfigurations;
- (NSString)payloadExecutableAssetReference;
- (NSString)payloadTaskDescription;
- (NSString)payloadTaskType;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadExecutableAssetReference:(id)a3;
- (void)setPayloadLaunchdConfigurations:(id)a3;
- (void)setPayloadTaskDescription:(id)a3;
- (void)setPayloadTaskType:(id)a3;
@end

@implementation RMModelServicesBackgroundTasksDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.services.background-tasks";
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"TaskType";
  v6[1] = @"TaskDescription";
  v6[2] = @"ExecutableAssetReference";
  v6[3] = @"LaunchdConfigurations";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BEBA8];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_14 != -1) {
    dispatch_once(&assetReferences_onceToken_14, &__block_literal_global_21);
  }
  uint64_t v3 = assetReferences_assetPaths_14;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __60__RMModelServicesBackgroundTasksDeclaration_assetReferences__block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BEBC0 keyPath:@"$.payloadExecutableAssetReference"];
  v4[0] = v0;
  v1 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BEBD8 keyPath:@"$.payloadLaunchdConfigurations.*.payloadFileAssetReference"];
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v3 = (void *)assetReferences_assetPaths_14;
  assetReferences_assetPaths_14 = v2;
}

+ (id)buildWithIdentifier:(id)a3 taskType:(id)a4 taskDescription:(id)a5 executableAssetReference:(id)a6 launchdConfigurations:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.services.background-tasks"];
  if (v11)
  {
    [v16 setDeclarationIdentifier:v11];
  }
  else
  {
    v17 = [MEMORY[0x263F08C38] UUID];
    v18 = [v17 UUIDString];
    [v16 setDeclarationIdentifier:v18];
  }
  [v16 setPayloadTaskType:v15];

  [v16 setPayloadTaskDescription:v14];
  [v16 setPayloadExecutableAssetReference:v13];

  [v16 setPayloadLaunchdConfigurations:v12];
  [v16 updateServerToken];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 taskType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.services.background-tasks"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadTaskType:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = &unk_2708C2700;
  uint64_t v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEBF0];
  v7[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEC08];
  v7[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v9[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v5;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  id v11 = [v9 setWithArray:v10];

  id v12 = +[RMModelServicesBackgroundTasksDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  id v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"TaskType" forKeyPath:@"payloadTaskType" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v14 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"TaskDescription" forKeyPath:@"payloadTaskDescription" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"ExecutableAssetReference" forKeyPath:@"payloadExecutableAssetReference" isRequired:0 defaultValue:0 error:a5])
      {
        LOWORD(v16) = a4;
        BOOL v14 = [(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"LaunchdConfigurations" forKeyPath:@"payloadLaunchdConfigurations" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 serializationType:v16 error:a5];
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMModelServicesBackgroundTasksDeclaration *)self payloadTaskType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"TaskType" value:v6 isRequired:1 defaultValue:0];

  v7 = [(RMModelServicesBackgroundTasksDeclaration *)self payloadTaskDescription];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"TaskDescription" value:v7 isRequired:0 defaultValue:0];

  id v8 = [(RMModelServicesBackgroundTasksDeclaration *)self payloadExecutableAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"ExecutableAssetReference" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelServicesBackgroundTasksDeclaration *)self payloadLaunchdConfigurations];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__RMModelServicesBackgroundTasksDeclaration_serializePayloadWithType___block_invoke;
  v12[3] = &__block_descriptor_34_e77___NSDictionary_16__0__RMModelServicesBackgroundTasksDeclaration_LaunchdItem_8l;
  signed __int16 v13 = a3;
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"LaunchdConfigurations" value:v9 itemSerializer:v12 isRequired:0 defaultValue:0];

  v10 = (void *)[v5 copy];
  return v10;
}

uint64_t __70__RMModelServicesBackgroundTasksDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelServicesBackgroundTasksDeclaration;
  v4 = [(RMModelDeclarationBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadTaskType copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadTaskDescription copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_payloadExecutableAssetReference copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadLaunchdConfigurations copy];
  id v12 = (void *)v4[9];
  v4[9] = v11;

  return v4;
}

- (NSString)payloadTaskType
{
  return self->_payloadTaskType;
}

- (void)setPayloadTaskType:(id)a3
{
}

- (NSString)payloadTaskDescription
{
  return self->_payloadTaskDescription;
}

- (void)setPayloadTaskDescription:(id)a3
{
}

- (NSString)payloadExecutableAssetReference
{
  return self->_payloadExecutableAssetReference;
}

- (void)setPayloadExecutableAssetReference:(id)a3
{
}

- (NSArray)payloadLaunchdConfigurations
{
  return self->_payloadLaunchdConfigurations;
}

- (void)setPayloadLaunchdConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLaunchdConfigurations, 0);
  objc_storeStrong((id *)&self->_payloadExecutableAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadTaskDescription, 0);
  objc_storeStrong((id *)&self->_payloadTaskType, 0);
}

@end