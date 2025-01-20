@interface RMModelAccountSubscribedCalendarDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 calendarURL:(id)a4;
+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 calendarURL:(id)a5 authenticationCredentialsAssetReference:(id)a6;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)payloadAuthenticationCredentialsAssetReference;
- (NSString)payloadCalendarURL;
- (NSString)payloadVisibleName;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3;
- (void)setPayloadCalendarURL:(id)a3;
- (void)setPayloadVisibleName:(id)a3;
@end

@implementation RMModelAccountSubscribedCalendarDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.subscribed-calendar";
}

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"VisibleName";
  v6[1] = @"CalendarURL";
  v6[2] = @"AuthenticationCredentialsAssetReference";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BCEB0];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_5 != -1) {
    dispatch_once(&assetReferences_onceToken_5, &__block_literal_global_5);
  }
  uint64_t v3 = assetReferences_assetPaths_5;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __62__RMModelAccountSubscribedCalendarDeclaration_assetReferences__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCEC8 keyPath:@"$.payloadAuthenticationCredentialsAssetReference"];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  v2 = (void *)assetReferences_assetPaths_5;
  assetReferences_assetPaths_5 = v1;
}

+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 calendarURL:(id)a5 authenticationCredentialsAssetReference:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  [v13 setDeclarationType:@"com.apple.configuration.account.subscribed-calendar"];
  if (v9)
  {
    [v13 setDeclarationIdentifier:v9];
  }
  else
  {
    v14 = [MEMORY[0x263F08C38] UUID];
    v15 = [v14 UUIDString];
    [v13 setDeclarationIdentifier:v15];
  }
  [v13 setPayloadVisibleName:v12];

  [v13 setPayloadCalendarURL:v11];
  [v13 setPayloadAuthenticationCredentialsAssetReference:v10];

  [v13 updateServerToken];
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 calendarURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.account.subscribed-calendar"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadCalendarURL:v6];

  [v7 updateServerToken];
  return v7;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  v21[4] = *MEMORY[0x263EF8340];
  v20[0] = &unk_2708C17B8;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCEE0];
  v19[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCEF8];
  v19[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C1800;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCF10];
  v18[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCF28];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C17D0;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCF40];
  v17[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCF58];
  v17[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C1818;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCF70];
  v16[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCF88];
  v16[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v21[3] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelAccountSubscribedCalendarDeclaration allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  BOOL v13 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"VisibleName" forKeyPath:@"payloadVisibleName" isRequired:0 defaultValue:0 error:a5])
  {
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"CalendarURL" forKeyPath:@"payloadCalendarURL" isRequired:1 defaultValue:0 error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"AuthenticationCredentialsAssetReference" forKeyPath:@"payloadAuthenticationCredentialsAssetReference" isRequired:0 defaultValue:0 error:a5];
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelAccountSubscribedCalendarDeclaration *)self payloadVisibleName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"VisibleName" value:v5 isRequired:0 defaultValue:0];

  id v6 = [(RMModelAccountSubscribedCalendarDeclaration *)self payloadCalendarURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"CalendarURL" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelAccountSubscribedCalendarDeclaration *)self payloadAuthenticationCredentialsAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"AuthenticationCredentialsAssetReference" value:v7 isRequired:0 defaultValue:0];

  v8 = (void *)[v4 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelAccountSubscribedCalendarDeclaration;
  v4 = [(RMModelDeclarationBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadVisibleName copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_payloadCalendarURL copy];
  v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_payloadAuthenticationCredentialsAssetReference copy];
  id v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)payloadVisibleName
{
  return self->_payloadVisibleName;
}

- (void)setPayloadVisibleName:(id)a3
{
}

- (NSString)payloadCalendarURL
{
  return self->_payloadCalendarURL;
}

- (void)setPayloadCalendarURL:(id)a3
{
}

- (NSString)payloadAuthenticationCredentialsAssetReference
{
  return self->_payloadAuthenticationCredentialsAssetReference;
}

- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadCalendarURL, 0);
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
}

@end