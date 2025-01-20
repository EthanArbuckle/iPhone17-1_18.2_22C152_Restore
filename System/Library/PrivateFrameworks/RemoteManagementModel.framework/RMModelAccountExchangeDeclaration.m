@interface RMModelAccountExchangeDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 enabledProtocolTypes:(id)a4;
+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 enabledProtocolTypes:(id)a5 userIdentityAssetReference:(id)a6 hostName:(id)a7 port:(id)a8 path:(id)a9 externalHostName:(id)a10 externalPort:(id)a11 externalPath:(id)a12 oAuth:(id)a13 authenticationCredentialsAssetReference:(id)a14 authenticationIdentityAssetReference:(id)a15 SMIME:(id)a16 mailServiceActive:(id)a17 lockMailService:(id)a18 contactsServiceActive:(id)a19 lockContactsService:(id)a20 calendarServiceActive:(id)a21 lockCalendarService:(id)a22 remindersServiceActive:(id)a23 lockRemindersService:(id)a24 notesServiceActive:(id)a25 lockNotesService:(id)a26;
+ (id)combineConfigurations:(id)a3;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSArray)payloadEnabledProtocolTypes;
- (NSNumber)payloadCalendarServiceActive;
- (NSNumber)payloadContactsServiceActive;
- (NSNumber)payloadExternalPort;
- (NSNumber)payloadLockCalendarService;
- (NSNumber)payloadLockContactsService;
- (NSNumber)payloadLockMailService;
- (NSNumber)payloadLockNotesService;
- (NSNumber)payloadLockRemindersService;
- (NSNumber)payloadMailServiceActive;
- (NSNumber)payloadNotesServiceActive;
- (NSNumber)payloadPort;
- (NSNumber)payloadRemindersServiceActive;
- (NSString)payloadAuthenticationCredentialsAssetReference;
- (NSString)payloadAuthenticationIdentityAssetReference;
- (NSString)payloadExternalHostName;
- (NSString)payloadExternalPath;
- (NSString)payloadHostName;
- (NSString)payloadPath;
- (NSString)payloadUserIdentityAssetReference;
- (NSString)payloadVisibleName;
- (RMModelAccountExchangeDeclaration_OAuth)payloadOAuth;
- (RMModelAccountExchangeDeclaration_SMIME)payloadSMIME;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3;
- (void)setPayloadAuthenticationIdentityAssetReference:(id)a3;
- (void)setPayloadCalendarServiceActive:(id)a3;
- (void)setPayloadContactsServiceActive:(id)a3;
- (void)setPayloadEnabledProtocolTypes:(id)a3;
- (void)setPayloadExternalHostName:(id)a3;
- (void)setPayloadExternalPath:(id)a3;
- (void)setPayloadExternalPort:(id)a3;
- (void)setPayloadHostName:(id)a3;
- (void)setPayloadLockCalendarService:(id)a3;
- (void)setPayloadLockContactsService:(id)a3;
- (void)setPayloadLockMailService:(id)a3;
- (void)setPayloadLockNotesService:(id)a3;
- (void)setPayloadLockRemindersService:(id)a3;
- (void)setPayloadMailServiceActive:(id)a3;
- (void)setPayloadNotesServiceActive:(id)a3;
- (void)setPayloadOAuth:(id)a3;
- (void)setPayloadPath:(id)a3;
- (void)setPayloadPort:(id)a3;
- (void)setPayloadRemindersServiceActive:(id)a3;
- (void)setPayloadSMIME:(id)a3;
- (void)setPayloadUserIdentityAssetReference:(id)a3;
- (void)setPayloadVisibleName:(id)a3;
@end

@implementation RMModelAccountExchangeDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.exchange";
}

+ (NSSet)allowedPayloadKeys
{
  v6[23] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"VisibleName";
  v6[1] = @"EnabledProtocolTypes";
  v6[2] = @"UserIdentityAssetReference";
  v6[3] = @"HostName";
  v6[4] = @"Port";
  v6[5] = @"Path";
  v6[6] = @"ExternalHostName";
  v6[7] = @"ExternalPort";
  v6[8] = @"External Path";
  v6[9] = @"OAuth";
  v6[10] = @"AuthenticationCredentialsAssetReference";
  v6[11] = @"AuthenticationIdentityAssetReference";
  v6[12] = @"SMIME";
  v6[13] = @"MailServiceActive";
  v6[14] = @"LockMailService";
  v6[15] = @"ContactsServiceActive";
  v6[16] = @"LockContactsService";
  v6[17] = @"CalendarServiceActive";
  v6[18] = @"LockCalendarService";
  v6[19] = @"RemindersServiceActive";
  v6[20] = @"LockRemindersService";
  v6[21] = @"NotesServiceActive";
  v6[22] = @"LockNotesService";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:23];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_2708BCA30];
}

- (id)assetReferences
{
  if (assetReferences_onceToken_1 != -1) {
    dispatch_once(&assetReferences_onceToken_1, &__block_literal_global_1);
  }
  uint64_t v3 = assetReferences_assetPaths_1;
  return [(RMModelConfigurationBase *)self assetReferencesFromKeyPaths:v3 payloadObject:self];
}

void __52__RMModelAccountExchangeDeclaration_assetReferences__block_invoke()
{
  v7[5] = *MEMORY[0x263EF8340];
  v0 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCA48 keyPath:@"$.payloadUserIdentityAssetReference"];
  v1 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCA60, @"$.payloadAuthenticationCredentialsAssetReference", v0 keyPath];
  v7[1] = v1;
  v2 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCA78 keyPath:@"$.payloadAuthenticationIdentityAssetReference"];
  v7[2] = v2;
  uint64_t v3 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCA90 keyPath:@"$.payloadSMIME.payloadSigning.payloadIdentityAssetReference"];
  v7[3] = v3;
  v4 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:&unk_2708BCAA8 keyPath:@"$.payloadSMIME.payloadEncryption.payloadIdentityAssetReference"];
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:5];
  v6 = (void *)assetReferences_assetPaths_1;
  assetReferences_assetPaths_1 = v5;
}

+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 enabledProtocolTypes:(id)a5 userIdentityAssetReference:(id)a6 hostName:(id)a7 port:(id)a8 path:(id)a9 externalHostName:(id)a10 externalPort:(id)a11 externalPath:(id)a12 oAuth:(id)a13 authenticationCredentialsAssetReference:(id)a14 authenticationIdentityAssetReference:(id)a15 SMIME:(id)a16 mailServiceActive:(id)a17 lockMailService:(id)a18 contactsServiceActive:(id)a19 lockContactsService:(id)a20 calendarServiceActive:(id)a21 lockCalendarService:(id)a22 remindersServiceActive:(id)a23 lockRemindersService:(id)a24 notesServiceActive:(id)a25 lockNotesService:(id)a26
{
  id v26 = a3;
  id v27 = a26;
  id v28 = a25;
  id v72 = a24;
  id v71 = a23;
  id v70 = a22;
  id v69 = a21;
  id v68 = a20;
  id v67 = a19;
  id v66 = a18;
  id v65 = a17;
  id v64 = a16;
  id v63 = a15;
  id v62 = a14;
  id v61 = a13;
  id v60 = a12;
  id v57 = a11;
  id v53 = a10;
  id v29 = a9;
  id v30 = a8;
  id v31 = a7;
  id v32 = a6;
  id v33 = a5;
  id v34 = a4;
  v35 = objc_opt_new();
  [v35 setDeclarationType:@"com.apple.configuration.account.exchange"];
  if (v26)
  {
    [v35 setDeclarationIdentifier:v26];
  }
  else
  {
    [MEMORY[0x263F08C38] UUID];
    v36 = id v59 = v27;
    [v36 UUIDString];
    v38 = id v37 = v28;
    [v35 setDeclarationIdentifier:v38];

    id v28 = v37;
    id v26 = 0;
    id v27 = v59;
  }
  [v35 setPayloadVisibleName:v34];

  [v35 setPayloadEnabledProtocolTypes:v33];
  [v35 setPayloadUserIdentityAssetReference:v32];

  [v35 setPayloadHostName:v31];
  [v35 setPayloadPort:v30];

  [v35 setPayloadPath:v29];
  [v35 setPayloadExternalHostName:v53];

  [v35 setPayloadExternalPort:v57];
  [v35 setPayloadExternalPath:v60];

  [v35 setPayloadOAuth:v61];
  [v35 setPayloadAuthenticationCredentialsAssetReference:v62];

  [v35 setPayloadAuthenticationIdentityAssetReference:v63];
  [v35 setPayloadSMIME:v64];

  v39 = (void *)MEMORY[0x263EFFA88];
  if (v65) {
    id v40 = v65;
  }
  else {
    id v40 = (id)MEMORY[0x263EFFA88];
  }
  [v35 setPayloadMailServiceActive:v40];

  v41 = (void *)MEMORY[0x263EFFA80];
  if (v66) {
    id v42 = v66;
  }
  else {
    id v42 = (id)MEMORY[0x263EFFA80];
  }
  [v35 setPayloadLockMailService:v42];

  if (v67) {
    id v43 = v67;
  }
  else {
    id v43 = v39;
  }
  [v35 setPayloadContactsServiceActive:v43];

  if (v68) {
    id v44 = v68;
  }
  else {
    id v44 = v41;
  }
  [v35 setPayloadLockContactsService:v44];

  if (v69) {
    id v45 = v69;
  }
  else {
    id v45 = v39;
  }
  [v35 setPayloadCalendarServiceActive:v45];

  if (v70) {
    id v46 = v70;
  }
  else {
    id v46 = v41;
  }
  [v35 setPayloadLockCalendarService:v46];

  if (v71) {
    id v47 = v71;
  }
  else {
    id v47 = v39;
  }
  [v35 setPayloadRemindersServiceActive:v47];

  if (v72) {
    id v48 = v72;
  }
  else {
    id v48 = v41;
  }
  [v35 setPayloadLockRemindersService:v48];

  if (v28) {
    id v49 = v28;
  }
  else {
    id v49 = v39;
  }
  [v35 setPayloadNotesServiceActive:v49];

  if (v27) {
    id v50 = v27;
  }
  else {
    id v50 = v41;
  }
  [v35 setPayloadLockNotesService:v50];

  [v35 updateServerToken];
  return v35;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 enabledProtocolTypes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.account.exchange"];
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
  [v7 setPayloadEnabledProtocolTypes:v6];

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
  v20[0] = &unk_2708C15D8;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCAC0];
  v19[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCAD8];
  v19[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C1620;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCAF0];
  v18[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCB08];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C15F0;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCB20];
  v17[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCB38];
  v17[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C1638;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCB50];
  v16[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BCB68];
  v16[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v21[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelAccountExchangeDeclaration allowedPayloadKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"VisibleName" forKeyPath:@"payloadVisibleName" isRequired:0 defaultValue:0 error:a5])
  {
    if ([(RMModelPayloadBase *)self loadArrayFromDictionary:v8 usingKey:@"EnabledProtocolTypes" forKeyPath:@"payloadEnabledProtocolTypes" validator:&__block_literal_global_166 isRequired:1 defaultValue:0 error:a5])
    {
      BOOL v14 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"UserIdentityAssetReference" forKeyPath:@"payloadUserIdentityAssetReference" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v14 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"HostName" forKeyPath:@"payloadHostName" isRequired:0 defaultValue:0 error:a5])
        {
          BOOL v14 = 0;
          if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"Port" forKeyPath:@"payloadPort" isRequired:0 defaultValue:0 error:a5])
          {
            BOOL v14 = 0;
            if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"Path" forKeyPath:@"payloadPath" isRequired:0 defaultValue:0 error:a5])
            {
              BOOL v14 = 0;
              if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"ExternalHostName" forKeyPath:@"payloadExternalHostName" isRequired:0 defaultValue:0 error:a5])
              {
                BOOL v14 = 0;
                if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v8 usingKey:@"ExternalPort" forKeyPath:@"payloadExternalPort" isRequired:0 defaultValue:0 error:a5])
                {
                  BOOL v14 = 0;
                  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"External Path" forKeyPath:@"payloadExternalPath" isRequired:0 defaultValue:0 error:a5])
                  {
                    LOWORD(v16) = a4;
                    BOOL v14 = 0;
                    if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"OAuth" forKeyPath:@"payloadOAuth" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v16 error:a5])
                    {
                      BOOL v14 = 0;
                      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"AuthenticationCredentialsAssetReference" forKeyPath:@"payloadAuthenticationCredentialsAssetReference" isRequired:0 defaultValue:0 error:a5])
                      {
                        BOOL v14 = 0;
                        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v8 usingKey:@"AuthenticationIdentityAssetReference" forKeyPath:@"payloadAuthenticationIdentityAssetReference" isRequired:0 defaultValue:0 error:a5])
                        {
                          LOWORD(v17) = a4;
                          BOOL v14 = 0;
                          if ([(RMModelPayloadBase *)self loadDictionaryFromDictionary:v8 usingKey:@"SMIME" forKeyPath:@"payloadSMIME" classType:objc_opt_class() isRequired:0 defaultValue:0 serializationType:v17 error:a5])
                          {
                            BOOL v14 = 0;
                            if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"MailServiceActive" forKeyPath:@"payloadMailServiceActive" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
                            {
                              BOOL v14 = 0;
                              if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"LockMailService" forKeyPath:@"payloadLockMailService" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
                              {
                                BOOL v14 = 0;
                                if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"ContactsServiceActive" forKeyPath:@"payloadContactsServiceActive" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
                                {
                                  BOOL v14 = 0;
                                  if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"LockContactsService" forKeyPath:@"payloadLockContactsService" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
                                  {
                                    BOOL v14 = 0;
                                    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"CalendarServiceActive" forKeyPath:@"payloadCalendarServiceActive" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
                                    {
                                      BOOL v14 = 0;
                                      if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"LockCalendarService" forKeyPath:@"payloadLockCalendarService" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
                                      {
                                        BOOL v14 = 0;
                                        if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"RemindersServiceActive" forKeyPath:@"payloadRemindersServiceActive" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
                                        {
                                          BOOL v14 = 0;
                                          if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"LockRemindersService" forKeyPath:@"payloadLockRemindersService" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
                                          {
                                            BOOL v14 = 0;
                                            if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"NotesServiceActive" forKeyPath:@"payloadNotesServiceActive" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:a5])
                                            {
                                              BOOL v14 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v8 usingKey:@"LockNotesService" forKeyPath:@"payloadLockNotesService" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5];
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

uint64_t __87__RMModelAccountExchangeDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  id v5 = objc_opt_new();
  id v6 = [(RMModelAccountExchangeDeclaration *)self payloadVisibleName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"VisibleName" value:v6 isRequired:0 defaultValue:0];

  v7 = [(RMModelAccountExchangeDeclaration *)self payloadEnabledProtocolTypes];
  [(RMModelPayloadBase *)self serializeArrayIntoDictionary:v5 usingKey:@"EnabledProtocolTypes" value:v7 itemSerializer:&__block_literal_global_236 isRequired:1 defaultValue:0];

  id v8 = [(RMModelAccountExchangeDeclaration *)self payloadUserIdentityAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"UserIdentityAssetReference" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelAccountExchangeDeclaration *)self payloadHostName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"HostName" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelAccountExchangeDeclaration *)self payloadPort];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"Port" value:v10 isRequired:0 defaultValue:0];

  v11 = [(RMModelAccountExchangeDeclaration *)self payloadPath];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"Path" value:v11 isRequired:0 defaultValue:0];

  v12 = [(RMModelAccountExchangeDeclaration *)self payloadExternalHostName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"ExternalHostName" value:v12 isRequired:0 defaultValue:0];

  v13 = [(RMModelAccountExchangeDeclaration *)self payloadExternalPort];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v5 usingKey:@"ExternalPort" value:v13 isRequired:0 defaultValue:0];

  BOOL v14 = [(RMModelAccountExchangeDeclaration *)self payloadExternalPath];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"External Path" value:v14 isRequired:0 defaultValue:0];

  v15 = [(RMModelAccountExchangeDeclaration *)self payloadOAuth];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __62__RMModelAccountExchangeDeclaration_serializePayloadWithType___block_invoke_2;
  v35[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v36 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"OAuth" value:v15 dictSerializer:v35 isRequired:0 defaultValue:0];

  uint64_t v16 = [(RMModelAccountExchangeDeclaration *)self payloadAuthenticationCredentialsAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"AuthenticationCredentialsAssetReference" value:v16 isRequired:0 defaultValue:0];

  uint64_t v17 = [(RMModelAccountExchangeDeclaration *)self payloadAuthenticationIdentityAssetReference];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"AuthenticationIdentityAssetReference" value:v17 isRequired:0 defaultValue:0];

  v18 = [(RMModelAccountExchangeDeclaration *)self payloadSMIME];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __62__RMModelAccountExchangeDeclaration_serializePayloadWithType___block_invoke_3;
  v33[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  signed __int16 v34 = a3;
  [(RMModelPayloadBase *)self serializeDictionaryIntoDictionary:v5 usingKey:@"SMIME" value:v18 dictSerializer:v33 isRequired:0 defaultValue:0];

  v19 = [(RMModelAccountExchangeDeclaration *)self payloadMailServiceActive];
  uint64_t v20 = MEMORY[0x263EFFA88];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"MailServiceActive" value:v19 isRequired:0 defaultValue:MEMORY[0x263EFFA88]];

  v21 = [(RMModelAccountExchangeDeclaration *)self payloadLockMailService];
  uint64_t v22 = MEMORY[0x263EFFA80];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"LockMailService" value:v21 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  v23 = [(RMModelAccountExchangeDeclaration *)self payloadContactsServiceActive];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"ContactsServiceActive" value:v23 isRequired:0 defaultValue:v20];

  v24 = [(RMModelAccountExchangeDeclaration *)self payloadLockContactsService];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"LockContactsService" value:v24 isRequired:0 defaultValue:v22];

  v25 = [(RMModelAccountExchangeDeclaration *)self payloadCalendarServiceActive];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"CalendarServiceActive" value:v25 isRequired:0 defaultValue:v20];

  id v26 = [(RMModelAccountExchangeDeclaration *)self payloadLockCalendarService];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"LockCalendarService" value:v26 isRequired:0 defaultValue:v22];

  id v27 = [(RMModelAccountExchangeDeclaration *)self payloadRemindersServiceActive];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"RemindersServiceActive" value:v27 isRequired:0 defaultValue:v20];

  id v28 = [(RMModelAccountExchangeDeclaration *)self payloadLockRemindersService];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"LockRemindersService" value:v28 isRequired:0 defaultValue:v22];

  id v29 = [(RMModelAccountExchangeDeclaration *)self payloadNotesServiceActive];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"NotesServiceActive" value:v29 isRequired:0 defaultValue:v20];

  id v30 = [(RMModelAccountExchangeDeclaration *)self payloadLockNotesService];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v5 usingKey:@"LockNotesService" value:v30 isRequired:0 defaultValue:v22];

  id v31 = (void *)[v5 copy];
  return v31;
}

id __62__RMModelAccountExchangeDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __62__RMModelAccountExchangeDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __62__RMModelAccountExchangeDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v52.receiver = self;
  v52.super_class = (Class)RMModelAccountExchangeDeclaration;
  v4 = [(RMModelDeclarationBase *)&v52 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadVisibleName copy];
  id v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadEnabledProtocolTypes copy];
  id v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_payloadUserIdentityAssetReference copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSString *)self->_payloadHostName copy];
  v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadPort copy];
  BOOL v14 = (void *)v4[10];
  v4[10] = v13;

  uint64_t v15 = [(NSString *)self->_payloadPath copy];
  uint64_t v16 = (void *)v4[11];
  v4[11] = v15;

  uint64_t v17 = [(NSString *)self->_payloadExternalHostName copy];
  v18 = (void *)v4[12];
  v4[12] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadExternalPort copy];
  uint64_t v20 = (void *)v4[13];
  v4[13] = v19;

  uint64_t v21 = [(NSString *)self->_payloadExternalPath copy];
  uint64_t v22 = (void *)v4[14];
  v4[14] = v21;

  uint64_t v23 = [(RMModelAccountExchangeDeclaration_OAuth *)self->_payloadOAuth copy];
  v24 = (void *)v4[15];
  v4[15] = v23;

  uint64_t v25 = [(NSString *)self->_payloadAuthenticationCredentialsAssetReference copy];
  id v26 = (void *)v4[16];
  v4[16] = v25;

  uint64_t v27 = [(NSString *)self->_payloadAuthenticationIdentityAssetReference copy];
  id v28 = (void *)v4[17];
  v4[17] = v27;

  uint64_t v29 = [(RMModelAccountExchangeDeclaration_SMIME *)self->_payloadSMIME copy];
  id v30 = (void *)v4[18];
  v4[18] = v29;

  uint64_t v31 = [(NSNumber *)self->_payloadMailServiceActive copy];
  id v32 = (void *)v4[19];
  v4[19] = v31;

  uint64_t v33 = [(NSNumber *)self->_payloadLockMailService copy];
  signed __int16 v34 = (void *)v4[20];
  v4[20] = v33;

  uint64_t v35 = [(NSNumber *)self->_payloadContactsServiceActive copy];
  signed __int16 v36 = (void *)v4[21];
  v4[21] = v35;

  uint64_t v37 = [(NSNumber *)self->_payloadLockContactsService copy];
  v38 = (void *)v4[22];
  v4[22] = v37;

  uint64_t v39 = [(NSNumber *)self->_payloadCalendarServiceActive copy];
  id v40 = (void *)v4[23];
  v4[23] = v39;

  uint64_t v41 = [(NSNumber *)self->_payloadLockCalendarService copy];
  id v42 = (void *)v4[24];
  v4[24] = v41;

  uint64_t v43 = [(NSNumber *)self->_payloadRemindersServiceActive copy];
  id v44 = (void *)v4[25];
  v4[25] = v43;

  uint64_t v45 = [(NSNumber *)self->_payloadLockRemindersService copy];
  id v46 = (void *)v4[26];
  v4[26] = v45;

  uint64_t v47 = [(NSNumber *)self->_payloadNotesServiceActive copy];
  id v48 = (void *)v4[27];
  v4[27] = v47;

  uint64_t v49 = [(NSNumber *)self->_payloadLockNotesService copy];
  id v50 = (void *)v4[28];
  v4[28] = v49;

  return v4;
}

- (NSString)payloadVisibleName
{
  return self->_payloadVisibleName;
}

- (void)setPayloadVisibleName:(id)a3
{
}

- (NSArray)payloadEnabledProtocolTypes
{
  return self->_payloadEnabledProtocolTypes;
}

- (void)setPayloadEnabledProtocolTypes:(id)a3
{
}

- (NSString)payloadUserIdentityAssetReference
{
  return self->_payloadUserIdentityAssetReference;
}

- (void)setPayloadUserIdentityAssetReference:(id)a3
{
}

- (NSString)payloadHostName
{
  return self->_payloadHostName;
}

- (void)setPayloadHostName:(id)a3
{
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
}

- (NSString)payloadPath
{
  return self->_payloadPath;
}

- (void)setPayloadPath:(id)a3
{
}

- (NSString)payloadExternalHostName
{
  return self->_payloadExternalHostName;
}

- (void)setPayloadExternalHostName:(id)a3
{
}

- (NSNumber)payloadExternalPort
{
  return self->_payloadExternalPort;
}

- (void)setPayloadExternalPort:(id)a3
{
}

- (NSString)payloadExternalPath
{
  return self->_payloadExternalPath;
}

- (void)setPayloadExternalPath:(id)a3
{
}

- (RMModelAccountExchangeDeclaration_OAuth)payloadOAuth
{
  return self->_payloadOAuth;
}

- (void)setPayloadOAuth:(id)a3
{
}

- (NSString)payloadAuthenticationCredentialsAssetReference
{
  return self->_payloadAuthenticationCredentialsAssetReference;
}

- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3
{
}

- (NSString)payloadAuthenticationIdentityAssetReference
{
  return self->_payloadAuthenticationIdentityAssetReference;
}

- (void)setPayloadAuthenticationIdentityAssetReference:(id)a3
{
}

- (RMModelAccountExchangeDeclaration_SMIME)payloadSMIME
{
  return self->_payloadSMIME;
}

- (void)setPayloadSMIME:(id)a3
{
}

- (NSNumber)payloadMailServiceActive
{
  return self->_payloadMailServiceActive;
}

- (void)setPayloadMailServiceActive:(id)a3
{
}

- (NSNumber)payloadLockMailService
{
  return self->_payloadLockMailService;
}

- (void)setPayloadLockMailService:(id)a3
{
}

- (NSNumber)payloadContactsServiceActive
{
  return self->_payloadContactsServiceActive;
}

- (void)setPayloadContactsServiceActive:(id)a3
{
}

- (NSNumber)payloadLockContactsService
{
  return self->_payloadLockContactsService;
}

- (void)setPayloadLockContactsService:(id)a3
{
}

- (NSNumber)payloadCalendarServiceActive
{
  return self->_payloadCalendarServiceActive;
}

- (void)setPayloadCalendarServiceActive:(id)a3
{
}

- (NSNumber)payloadLockCalendarService
{
  return self->_payloadLockCalendarService;
}

- (void)setPayloadLockCalendarService:(id)a3
{
}

- (NSNumber)payloadRemindersServiceActive
{
  return self->_payloadRemindersServiceActive;
}

- (void)setPayloadRemindersServiceActive:(id)a3
{
}

- (NSNumber)payloadLockRemindersService
{
  return self->_payloadLockRemindersService;
}

- (void)setPayloadLockRemindersService:(id)a3
{
}

- (NSNumber)payloadNotesServiceActive
{
  return self->_payloadNotesServiceActive;
}

- (void)setPayloadNotesServiceActive:(id)a3
{
}

- (NSNumber)payloadLockNotesService
{
  return self->_payloadLockNotesService;
}

- (void)setPayloadLockNotesService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLockNotesService, 0);
  objc_storeStrong((id *)&self->_payloadNotesServiceActive, 0);
  objc_storeStrong((id *)&self->_payloadLockRemindersService, 0);
  objc_storeStrong((id *)&self->_payloadRemindersServiceActive, 0);
  objc_storeStrong((id *)&self->_payloadLockCalendarService, 0);
  objc_storeStrong((id *)&self->_payloadCalendarServiceActive, 0);
  objc_storeStrong((id *)&self->_payloadLockContactsService, 0);
  objc_storeStrong((id *)&self->_payloadContactsServiceActive, 0);
  objc_storeStrong((id *)&self->_payloadLockMailService, 0);
  objc_storeStrong((id *)&self->_payloadMailServiceActive, 0);
  objc_storeStrong((id *)&self->_payloadSMIME, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadOAuth, 0);
  objc_storeStrong((id *)&self->_payloadExternalPath, 0);
  objc_storeStrong((id *)&self->_payloadExternalPort, 0);
  objc_storeStrong((id *)&self->_payloadExternalHostName, 0);
  objc_storeStrong((id *)&self->_payloadPath, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
  objc_storeStrong((id *)&self->_payloadUserIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadEnabledProtocolTypes, 0);
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
}

uint64_t __61__RMModelAccountExchangeDeclaration_SMIME_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

uint64_t __61__RMModelAccountExchangeDeclaration_SMIME_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializeWithType:*(__int16 *)(a1 + 32)];
}

@end