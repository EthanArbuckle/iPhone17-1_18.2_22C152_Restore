@interface TPPeerStableInfo
+ (id)flexiblePolicyVersionFromPb:(id)a3;
+ (id)policySecretsFromPb:(id)a3;
- (BOOL)checkSignatureWithKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerStableInfo:(id)a3;
- (BOOL)isInheritedAccount;
- (NSData)data;
- (NSData)recoveryEncryptionPublicKey;
- (NSData)recoverySigningPublicKey;
- (NSData)sig;
- (NSDictionary)policySecrets;
- (NSString)deviceName;
- (NSString)osVersion;
- (NSString)serialNumber;
- (TPPBPeerStableInfoSetting)walrusSetting;
- (TPPBPeerStableInfoSetting)webAccess;
- (TPPBSecureElementIdentity)secureElementIdentity;
- (TPPeerStableInfo)initWithClock:(unint64_t)a3 frozenPolicyVersion:(id)a4 flexiblePolicyVersion:(id)a5 policySecrets:(id)a6 syncUserControllableViews:(int)a7 secureElementIdentity:(id)a8 walrusSetting:(id)a9 webAccess:(id)a10 deviceName:(id)a11 serialNumber:(id)a12 osVersion:(id)a13 signingKeyPair:(id)a14 recoverySigningPubKey:(id)a15 recoveryEncryptionPubKey:(id)a16 isInheritedAccount:(BOOL)a17 error:(id *)a18;
- (TPPeerStableInfo)initWithData:(id)a3 sig:(id)a4;
- (TPPeerStableInfo)initWithData:(id)a3 signingKeyPair:(id)a4 error:(id *)a5;
- (TPPolicyVersion)flexiblePolicyVersion;
- (TPPolicyVersion)frozenPolicyVersion;
- (TPTypedSignedData)tsd;
- (id)bestPolicyVersion;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pb;
- (int)syncUserControllableViews;
- (unint64_t)clock;
- (void)setTsd:(id)a3;
@end

@implementation TPPeerStableInfo

- (void).cxx_destruct
{
}

- (void)setTsd:(id)a3
{
}

- (TPTypedSignedData)tsd
{
  return self->_tsd;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TPPeerStableInfo *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPPeerStableInfo *)self isEqualToPeerStableInfo:v4];
  }

  return v5;
}

- (id)bestPolicyVersion
{
  v3 = [(TPPeerStableInfo *)self flexiblePolicyVersion];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(TPPeerStableInfo *)self frozenPolicyVersion];
  }
  v6 = v5;

  return v6;
}

- (NSData)sig
{
  v2 = [(TPPeerStableInfo *)self tsd];
  v3 = [v2 sig];

  return (NSData *)v3;
}

- (NSData)data
{
  v2 = [(TPPeerStableInfo *)self tsd];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (id)description
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  v4 = [(TPPeerStableInfo *)self dictionaryRepresentation];
  id v5 = [v4 description];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  v4 = [(TPPeerStableInfo *)self pb];
  id v5 = [v4 dictionaryRepresentation];

  return v5;
}

- (BOOL)isEqualToPeerStableInfo:(id)a3
{
  v4 = (TPPeerStableInfo *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    id v5 = [(TPPeerStableInfo *)self data];
    v6 = [(TPPeerStableInfo *)v4 data];
    if ([v5 isEqualToData:v6])
    {
      v7 = [(TPPeerStableInfo *)self sig];
      v8 = [(TPPeerStableInfo *)v4 sig];
      char v9 = [v7 isEqualToData:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(TPPeerStableInfo *)self tsd];
  char v6 = [v5 checkSignatureWithKey:v4];

  return v6;
}

- (BOOL)isInheritedAccount
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  char v5 = [v4 isInheritedAccount];

  return v5;
}

- (TPPBPeerStableInfoSetting)webAccess
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  char v5 = [v4 webAccess];

  return (TPPBPeerStableInfoSetting *)v5;
}

- (TPPBPeerStableInfoSetting)walrusSetting
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  char v5 = [v4 walrus];

  return (TPPBPeerStableInfoSetting *)v5;
}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  char v5 = [v4 secureElementIdentity];

  return (TPPBSecureElementIdentity *)v5;
}

- (int)syncUserControllableViews
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  int v5 = [v4 userControllableViewStatus];

  return v5;
}

- (NSData)recoveryEncryptionPublicKey
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  int v5 = [v4 recoveryEncryptionPublicKey];
  char v6 = [v5 pbToNullable];

  return (NSData *)v6;
}

- (NSData)recoverySigningPublicKey
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  int v5 = [v4 recoverySigningPublicKey];
  char v6 = [v5 pbToNullable];

  return (NSData *)v6;
}

- (NSString)osVersion
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  int v5 = [v4 osVersion];

  return (NSString *)v5;
}

- (NSString)serialNumber
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  int v5 = [v4 serialNumber];
  char v6 = [v5 pbToNullable];

  return (NSString *)v6;
}

- (NSString)deviceName
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  int v5 = [v4 deviceName];
  char v6 = [v5 pbToNullable];

  return (NSString *)v6;
}

- (NSDictionary)policySecrets
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  int v5 = +[TPPeerStableInfo policySecretsFromPb:v4];

  return (NSDictionary *)v5;
}

- (TPPolicyVersion)flexiblePolicyVersion
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  int v5 = +[TPPeerStableInfo flexiblePolicyVersionFromPb:v4];

  return (TPPolicyVersion *)v5;
}

- (TPPolicyVersion)frozenPolicyVersion
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  int v5 = [TPPolicyVersion alloc];
  uint64_t v6 = [v4 frozenPolicyVersion];
  v7 = [v4 frozenPolicyHash];
  v8 = [(TPPolicyVersion *)v5 initWithVersion:v6 hash:v7];

  return v8;
}

- (unint64_t)clock
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [(TPPeerStableInfo *)self pb];
  unint64_t v5 = [v4 clock];

  return v5;
}

- (id)pb
{
  v3 = [TPPBPeerStableInfo alloc];
  id v4 = [(TPPeerStableInfo *)self data];
  unint64_t v5 = [(TPPBPeerStableInfo *)v3 initWithData:v4];

  return v5;
}

- (TPPeerStableInfo)initWithData:(id)a3 signingKeyPair:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [[TPTypedSignedData alloc] initWithData:v9 key:v8 signatureTypeName:@"TPPB.PeerStableInfo" error:a5];

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)TPPeerStableInfo;
    v11 = [(TPPeerStableInfo *)&v15 init];
    v12 = v11;
    if (v11) {
      objc_storeStrong((id *)&v11->_tsd, v10);
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (TPPeerStableInfo)initWithData:(id)a3 sig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x210554CF0]();
  id v9 = [[TPPBPeerStableInfo alloc] initWithData:v6];

  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)TPPeerStableInfo;
    v10 = [(TPPeerStableInfo *)&v15 init];
    if (v10)
    {
      v11 = [[TPTypedSignedData alloc] initWithData:v6 sig:v7 signatureTypeName:@"TPPB.PeerStableInfo"];
      tsd = v10->_tsd;
      v10->_tsd = v11;
    }
    self = v10;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (TPPeerStableInfo)initWithClock:(unint64_t)a3 frozenPolicyVersion:(id)a4 flexiblePolicyVersion:(id)a5 policySecrets:(id)a6 syncUserControllableViews:(int)a7 secureElementIdentity:(id)a8 walrusSetting:(id)a9 webAccess:(id)a10 deviceName:(id)a11 serialNumber:(id)a12 osVersion:(id)a13 signingKeyPair:(id)a14 recoverySigningPubKey:(id)a15 recoveryEncryptionPubKey:(id)a16 isInheritedAccount:(BOOL)a17 error:(id *)a18
{
  id v44 = a4;
  id v21 = a5;
  id v22 = a6;
  id v40 = a8;
  id v39 = a9;
  id v38 = a10;
  id v23 = a11;
  id v36 = a12;
  id v24 = a13;
  id v41 = a14;
  id v25 = a15;
  id v26 = a16;
  context = (void *)MEMORY[0x210554CF0]();
  v27 = objc_alloc_init(TPPBPeerStableInfo);
  [(TPPBPeerStableInfo *)v27 setClock:a3];
  -[TPPBPeerStableInfo setFrozenPolicyVersion:](v27, "setFrozenPolicyVersion:", [v44 versionNumber]);
  v28 = [v44 policyHash];
  [(TPPBPeerStableInfo *)v27 setFrozenPolicyHash:v28];

  -[TPPBPeerStableInfo setFlexiblePolicyVersion:](v27, "setFlexiblePolicyVersion:", [v21 versionNumber]);
  v29 = [v21 policyHash];
  [(TPPBPeerStableInfo *)v27 setFlexiblePolicyHash:v29];

  v30 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v22, "count"));
  [(TPPBPeerStableInfo *)v27 setPolicySecrets:v30];

  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __283__TPPeerStableInfo_initWithClock_frozenPolicyVersion_flexiblePolicyVersion_policySecrets_syncUserControllableViews_secureElementIdentity_walrusSetting_webAccess_deviceName_serialNumber_osVersion_signingKeyPair_recoverySigningPubKey_recoveryEncryptionPubKey_isInheritedAccount_error___block_invoke;
  v45[3] = &unk_2640EC9C0;
  v46 = v27;
  v31 = v27;
  [v22 enumerateKeysAndObjectsUsingBlock:v45];
  [(TPPBPeerStableInfo *)v31 setDeviceName:v23];
  [(TPPBPeerStableInfo *)v31 setUserControllableViewStatus:a7];
  [(TPPBPeerStableInfo *)v31 setSerialNumber:v36];
  [(TPPBPeerStableInfo *)v31 setOsVersion:v24];
  [(TPPBPeerStableInfo *)v31 setRecoveryEncryptionPublicKey:v26];
  [(TPPBPeerStableInfo *)v31 setRecoverySigningPublicKey:v25];
  [(TPPBPeerStableInfo *)v31 setSecureElementIdentity:v40];
  [(TPPBPeerStableInfo *)v31 setWalrus:v39];
  [(TPPBPeerStableInfo *)v31 setWebAccess:v38];
  [(TPPBPeerStableInfo *)v31 setIsInheritedAccount:a17];
  v32 = [(TPPBPeerStableInfo *)v31 data];

  v33 = [(TPPeerStableInfo *)self initWithData:v32 signingKeyPair:v41 error:a18];

  return v33;
}

void __283__TPPeerStableInfo_initWithClock_frozenPolicyVersion_flexiblePolicyVersion_policySecrets_syncUserControllableViews_secureElementIdentity_walrusSetting_webAccess_deviceName_serialNumber_osVersion_signingKeyPair_recoverySigningPubKey_recoveryEncryptionPubKey_isInheritedAccount_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init(TPPBPolicySecret);
  [(TPPBPolicySecret *)v8 setName:v6];

  [(TPPBPolicySecret *)v8 setSecret:v5];
  id v7 = [*(id *)(a1 + 32) policySecrets];
  [v7 addObject:v8];
}

+ (id)policySecretsFromPb:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 policySecrets];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    id v7 = [v3 policySecrets];
    id v8 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = objc_msgSend(v3, "policySecrets", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_super v15 = [v14 secret];
          v16 = [v14 name];
          [v8 setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)flexiblePolicyVersionFromPb:(id)a3
{
  id v3 = a3;
  id v4 = [v3 flexiblePolicyHash];
  if ([v4 length] || objc_msgSend(v3, "flexiblePolicyVersion"))
  {
    uint64_t v5 = [TPPolicyVersion alloc];
    uint64_t v6 = [v3 flexiblePolicyVersion];
    id v7 = [v3 flexiblePolicyHash];
    id v8 = [(TPPolicyVersion *)v5 initWithVersion:v6 hash:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end