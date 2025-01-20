@interface TPPBPeerStableInfo
+ (Class)custodianRecoveryKeysType;
+ (Class)policySecretsType;
- (BOOL)hasClock;
- (BOOL)hasDeviceName;
- (BOOL)hasFlexiblePolicyHash;
- (BOOL)hasFlexiblePolicyVersion;
- (BOOL)hasFrozenPolicyHash;
- (BOOL)hasFrozenPolicyVersion;
- (BOOL)hasIsInheritedAccount;
- (BOOL)hasOsVersion;
- (BOOL)hasRecoveryEncryptionPublicKey;
- (BOOL)hasRecoverySigningPublicKey;
- (BOOL)hasSecureElementIdentity;
- (BOOL)hasSerialNumber;
- (BOOL)hasUserControllableViewStatus;
- (BOOL)hasWalrus;
- (BOOL)hasWebAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInheritedAccount;
- (BOOL)readFrom:(id)a3;
- (NSData)recoveryEncryptionPublicKey;
- (NSData)recoverySigningPublicKey;
- (NSMutableArray)custodianRecoveryKeys;
- (NSMutableArray)policySecrets;
- (NSString)deviceName;
- (NSString)flexiblePolicyHash;
- (NSString)frozenPolicyHash;
- (NSString)osVersion;
- (NSString)serialNumber;
- (TPPBPeerStableInfoSetting)walrus;
- (TPPBPeerStableInfoSetting)webAccess;
- (TPPBSecureElementIdentity)secureElementIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)custodianRecoveryKeysAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)policySecretsAtIndex:(unint64_t)a3;
- (id)userControllableViewStatusAsString:(int)a3;
- (int)StringAsUserControllableViewStatus:(id)a3;
- (int)userControllableViewStatus;
- (unint64_t)clock;
- (unint64_t)custodianRecoveryKeysCount;
- (unint64_t)flexiblePolicyVersion;
- (unint64_t)frozenPolicyVersion;
- (unint64_t)hash;
- (unint64_t)policySecretsCount;
- (void)addCustodianRecoveryKeys:(id)a3;
- (void)addPolicySecrets:(id)a3;
- (void)clearCustodianRecoveryKeys;
- (void)clearPolicySecrets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClock:(unint64_t)a3;
- (void)setCustodianRecoveryKeys:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setFlexiblePolicyHash:(id)a3;
- (void)setFlexiblePolicyVersion:(unint64_t)a3;
- (void)setFrozenPolicyHash:(id)a3;
- (void)setFrozenPolicyVersion:(unint64_t)a3;
- (void)setHasClock:(BOOL)a3;
- (void)setHasFlexiblePolicyVersion:(BOOL)a3;
- (void)setHasFrozenPolicyVersion:(BOOL)a3;
- (void)setHasIsInheritedAccount:(BOOL)a3;
- (void)setHasUserControllableViewStatus:(BOOL)a3;
- (void)setIsInheritedAccount:(BOOL)a3;
- (void)setOsVersion:(id)a3;
- (void)setPolicySecrets:(id)a3;
- (void)setRecoveryEncryptionPublicKey:(id)a3;
- (void)setRecoverySigningPublicKey:(id)a3;
- (void)setSecureElementIdentity:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUserControllableViewStatus:(int)a3;
- (void)setWalrus:(id)a3;
- (void)setWebAccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPeerStableInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAccess, 0);
  objc_storeStrong((id *)&self->_walrus, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_secureElementIdentity, 0);
  objc_storeStrong((id *)&self->_recoverySigningPublicKey, 0);
  objc_storeStrong((id *)&self->_recoveryEncryptionPublicKey, 0);
  objc_storeStrong((id *)&self->_policySecrets, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_frozenPolicyHash, 0);
  objc_storeStrong((id *)&self->_flexiblePolicyHash, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryKeys, 0);
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
}

- (void)setWebAccess:(id)a3
{
}

- (TPPBPeerStableInfoSetting)webAccess
{
  return self->_webAccess;
}

- (void)setWalrus:(id)a3
{
}

- (TPPBPeerStableInfoSetting)walrus
{
  return self->_walrus;
}

- (void)setSecureElementIdentity:(id)a3
{
}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  return self->_secureElementIdentity;
}

- (void)setCustodianRecoveryKeys:(id)a3
{
}

- (NSMutableArray)custodianRecoveryKeys
{
  return self->_custodianRecoveryKeys;
}

- (void)setPolicySecrets:(id)a3
{
}

- (NSMutableArray)policySecrets
{
  return self->_policySecrets;
}

- (void)setFlexiblePolicyHash:(id)a3
{
}

- (NSString)flexiblePolicyHash
{
  return self->_flexiblePolicyHash;
}

- (unint64_t)flexiblePolicyVersion
{
  return self->_flexiblePolicyVersion;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setRecoveryEncryptionPublicKey:(id)a3
{
}

- (NSData)recoveryEncryptionPublicKey
{
  return self->_recoveryEncryptionPublicKey;
}

- (void)setRecoverySigningPublicKey:(id)a3
{
}

- (NSData)recoverySigningPublicKey
{
  return self->_recoverySigningPublicKey;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setFrozenPolicyHash:(id)a3
{
}

- (NSString)frozenPolicyHash
{
  return self->_frozenPolicyHash;
}

- (unint64_t)frozenPolicyVersion
{
  return self->_frozenPolicyVersion;
}

- (unint64_t)clock
{
  return self->_clock;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v4 = (unint64_t *)a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 140);
  if (v6)
  {
    self->_clock = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 140);
  }
  if ((v6 & 4) != 0)
  {
    self->_frozenPolicyVersion = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (v4[7]) {
    -[TPPBPeerStableInfo setFrozenPolicyHash:](self, "setFrozenPolicyHash:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = (id)v5[9];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        [(TPPBPeerStableInfo *)self addPolicySecrets:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  if (v5[8]) {
    -[TPPBPeerStableInfo setOsVersion:](self, "setOsVersion:");
  }
  if (v5[5]) {
    -[TPPBPeerStableInfo setDeviceName:](self, "setDeviceName:");
  }
  if (v5[11]) {
    -[TPPBPeerStableInfo setRecoverySigningPublicKey:](self, "setRecoverySigningPublicKey:");
  }
  if (v5[10]) {
    -[TPPBPeerStableInfo setRecoveryEncryptionPublicKey:](self, "setRecoveryEncryptionPublicKey:");
  }
  if (v5[13]) {
    -[TPPBPeerStableInfo setSerialNumber:](self, "setSerialNumber:");
  }
  if ((*((unsigned char *)v5 + 140) & 2) != 0)
  {
    self->_flexiblePolicyVersion = v5[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (v5[6]) {
    -[TPPBPeerStableInfo setFlexiblePolicyHash:](self, "setFlexiblePolicyHash:");
  }
  if ((*((unsigned char *)v5 + 140) & 8) != 0)
  {
    self->_userControllableViewStatus = *((_DWORD *)v5 + 28);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = (id)v5[4];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        -[TPPBPeerStableInfo addCustodianRecoveryKeys:](self, "addCustodianRecoveryKeys:", *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }

  secureElementIdentity = self->_secureElementIdentity;
  unint64_t v18 = v5[12];
  if (secureElementIdentity)
  {
    if (v18) {
      -[TPPBSecureElementIdentity mergeFrom:](secureElementIdentity, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[TPPBPeerStableInfo setSecureElementIdentity:](self, "setSecureElementIdentity:");
  }
  walrus = self->_walrus;
  unint64_t v20 = v5[15];
  if (walrus)
  {
    if (v20) {
      -[TPPBPeerStableInfoSetting mergeFrom:](walrus, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[TPPBPeerStableInfo setWalrus:](self, "setWalrus:");
  }
  webAccess = self->_webAccess;
  unint64_t v22 = v5[16];
  if (webAccess)
  {
    if (v22) {
      -[TPPBPeerStableInfoSetting mergeFrom:](webAccess, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[TPPBPeerStableInfo setWebAccess:](self, "setWebAccess:");
  }
  if ((*((unsigned char *)v5 + 140) & 0x10) != 0)
  {
    self->_isInheritedAccount = *((unsigned char *)v5 + 136);
    *(unsigned char *)&self->_has |= 0x10u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v20 = 2654435761u * self->_clock;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v20 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      unint64_t v19 = 2654435761u * self->_frozenPolicyVersion;
      goto LABEL_6;
    }
  }
  unint64_t v19 = 0;
LABEL_6:
  NSUInteger v18 = [(NSString *)self->_frozenPolicyHash hash];
  uint64_t v17 = [(NSMutableArray *)self->_policySecrets hash];
  NSUInteger v16 = [(NSString *)self->_osVersion hash];
  NSUInteger v15 = [(NSString *)self->_deviceName hash];
  uint64_t v14 = [(NSData *)self->_recoverySigningPublicKey hash];
  uint64_t v13 = [(NSData *)self->_recoveryEncryptionPublicKey hash];
  NSUInteger v3 = [(NSString *)self->_serialNumber hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v4 = 2654435761u * self->_flexiblePolicyVersion;
  }
  else {
    unint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_flexiblePolicyHash hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v6 = 2654435761 * self->_userControllableViewStatus;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_custodianRecoveryKeys hash];
  unint64_t v8 = [(TPPBSecureElementIdentity *)self->_secureElementIdentity hash];
  unint64_t v9 = [(TPPBPeerStableInfoSetting *)self->_walrus hash];
  unint64_t v10 = [(TPPBPeerStableInfoSetting *)self->_webAccess hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v11 = 2654435761 * self->_isInheritedAccount;
  }
  else {
    uint64_t v11 = 0;
  }
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 140) & 1) == 0 || self->_clock != *((void *)v4 + 1)) {
      goto LABEL_49;
    }
  }
  else if (*((unsigned char *)v4 + 140))
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 140) & 4) == 0 || self->_frozenPolicyVersion != *((void *)v4 + 3)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 140) & 4) != 0)
  {
    goto LABEL_49;
  }
  frozenPolicyHash = self->_frozenPolicyHash;
  if ((unint64_t)frozenPolicyHash | *((void *)v4 + 7)
    && !-[NSString isEqual:](frozenPolicyHash, "isEqual:"))
  {
    goto LABEL_49;
  }
  policySecrets = self->_policySecrets;
  if ((unint64_t)policySecrets | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](policySecrets, "isEqual:")) {
      goto LABEL_49;
    }
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:")) {
      goto LABEL_49;
    }
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:")) {
      goto LABEL_49;
    }
  }
  recoverySigningPublicKey = self->_recoverySigningPublicKey;
  if ((unint64_t)recoverySigningPublicKey | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](recoverySigningPublicKey, "isEqual:")) {
      goto LABEL_49;
    }
  }
  recoveryEncryptionPublicKey = self->_recoveryEncryptionPublicKey;
  if ((unint64_t)recoveryEncryptionPublicKey | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](recoveryEncryptionPublicKey, "isEqual:")) {
      goto LABEL_49;
    }
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:")) {
      goto LABEL_49;
    }
  }
  char has = (char)self->_has;
  char v13 = *((unsigned char *)v4 + 140);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 140) & 2) == 0 || self->_flexiblePolicyVersion != *((void *)v4 + 2)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 140) & 2) != 0)
  {
    goto LABEL_49;
  }
  flexiblePolicyHash = self->_flexiblePolicyHash;
  if ((unint64_t)flexiblePolicyHash | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](flexiblePolicyHash, "isEqual:")) {
      goto LABEL_49;
    }
    char has = (char)self->_has;
    char v13 = *((unsigned char *)v4 + 140);
  }
  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_userControllableViewStatus != *((_DWORD *)v4 + 28)) {
      goto LABEL_49;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_49;
  }
  custodianRecoveryKeys = self->_custodianRecoveryKeys;
  if ((unint64_t)custodianRecoveryKeys | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](custodianRecoveryKeys, "isEqual:"))
  {
    goto LABEL_49;
  }
  secureElementIdentity = self->_secureElementIdentity;
  if ((unint64_t)secureElementIdentity | *((void *)v4 + 12))
  {
    if (!-[TPPBSecureElementIdentity isEqual:](secureElementIdentity, "isEqual:")) {
      goto LABEL_49;
    }
  }
  walrus = self->_walrus;
  if ((unint64_t)walrus | *((void *)v4 + 15))
  {
    if (!-[TPPBPeerStableInfoSetting isEqual:](walrus, "isEqual:")) {
      goto LABEL_49;
    }
  }
  webAccess = self->_webAccess;
  if ((unint64_t)webAccess | *((void *)v4 + 16))
  {
    if (!-[TPPBPeerStableInfoSetting isEqual:](webAccess, "isEqual:")) {
      goto LABEL_49;
    }
  }
  BOOL v19 = (*((unsigned char *)v4 + 140) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 140) & 0x10) != 0)
    {
      if (self->_isInheritedAccount)
      {
        if (!*((unsigned char *)v4 + 136)) {
          goto LABEL_49;
        }
      }
      else if (*((unsigned char *)v4 + 136))
      {
        goto LABEL_49;
      }
      BOOL v19 = 1;
      goto LABEL_50;
    }
LABEL_49:
    BOOL v19 = 0;
  }
LABEL_50:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_clock;
    *(unsigned char *)(v5 + 140) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_frozenPolicyVersion;
    *(unsigned char *)(v5 + 140) |= 4u;
  }
  uint64_t v8 = [(NSString *)self->_frozenPolicyHash copyWithZone:a3];
  unint64_t v9 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v8;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  unint64_t v10 = self->_policySecrets;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v10);
        }
        NSUInteger v15 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addPolicySecrets:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_osVersion copyWithZone:a3];
  uint64_t v17 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v16;

  uint64_t v18 = [(NSString *)self->_deviceName copyWithZone:a3];
  BOOL v19 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v18;

  uint64_t v20 = [(NSData *)self->_recoverySigningPublicKey copyWithZone:a3];
  v21 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v20;

  uint64_t v22 = [(NSData *)self->_recoveryEncryptionPublicKey copyWithZone:a3];
  long long v23 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v22;

  uint64_t v24 = [(NSString *)self->_serialNumber copyWithZone:a3];
  long long v25 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v24;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_flexiblePolicyVersion;
    *(unsigned char *)(v6 + 140) |= 2u;
  }
  uint64_t v26 = [(NSString *)self->_flexiblePolicyHash copyWithZone:a3];
  long long v27 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v26;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 112) = self->_userControllableViewStatus;
    *(unsigned char *)(v6 + 140) |= 8u;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v28 = self->_custodianRecoveryKeys;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * j), "copyWithZone:", a3, (void)v41);
        [(id)v6 addCustodianRecoveryKeys:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v30);
  }

  id v34 = [(TPPBSecureElementIdentity *)self->_secureElementIdentity copyWithZone:a3];
  v35 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v34;

  id v36 = [(TPPBPeerStableInfoSetting *)self->_walrus copyWithZone:a3];
  v37 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v36;

  id v38 = [(TPPBPeerStableInfoSetting *)self->_webAccess copyWithZone:a3];
  v39 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v38;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 136) = self->_isInheritedAccount;
    *(unsigned char *)(v6 + 140) |= 0x10u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_clock;
    *((unsigned char *)v4 + 140) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[3] = self->_frozenPolicyVersion;
    *((unsigned char *)v4 + 140) |= 4u;
  }
  id v16 = v4;
  if (self->_frozenPolicyHash) {
    objc_msgSend(v4, "setFrozenPolicyHash:");
  }
  if ([(TPPBPeerStableInfo *)self policySecretsCount])
  {
    [v16 clearPolicySecrets];
    unint64_t v6 = [(TPPBPeerStableInfo *)self policySecretsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        unint64_t v9 = [(TPPBPeerStableInfo *)self policySecretsAtIndex:i];
        [v16 addPolicySecrets:v9];
      }
    }
  }
  if (self->_osVersion) {
    objc_msgSend(v16, "setOsVersion:");
  }
  unint64_t v10 = v16;
  if (self->_deviceName)
  {
    objc_msgSend(v16, "setDeviceName:");
    unint64_t v10 = v16;
  }
  if (self->_recoverySigningPublicKey)
  {
    objc_msgSend(v16, "setRecoverySigningPublicKey:");
    unint64_t v10 = v16;
  }
  if (self->_recoveryEncryptionPublicKey)
  {
    objc_msgSend(v16, "setRecoveryEncryptionPublicKey:");
    unint64_t v10 = v16;
  }
  if (self->_serialNumber)
  {
    objc_msgSend(v16, "setSerialNumber:");
    unint64_t v10 = v16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10[2] = self->_flexiblePolicyVersion;
    *((unsigned char *)v10 + 140) |= 2u;
  }
  if (self->_flexiblePolicyHash)
  {
    objc_msgSend(v16, "setFlexiblePolicyHash:");
    unint64_t v10 = v16;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v10 + 28) = self->_userControllableViewStatus;
    *((unsigned char *)v10 + 140) |= 8u;
  }
  if ([(TPPBPeerStableInfo *)self custodianRecoveryKeysCount])
  {
    [v16 clearCustodianRecoveryKeys];
    unint64_t v11 = [(TPPBPeerStableInfo *)self custodianRecoveryKeysCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(TPPBPeerStableInfo *)self custodianRecoveryKeysAtIndex:j];
        [v16 addCustodianRecoveryKeys:v14];
      }
    }
  }
  if (self->_secureElementIdentity) {
    objc_msgSend(v16, "setSecureElementIdentity:");
  }
  NSUInteger v15 = v16;
  if (self->_walrus)
  {
    objc_msgSend(v16, "setWalrus:");
    NSUInteger v15 = v16;
  }
  if (self->_webAccess)
  {
    objc_msgSend(v16, "setWebAccess:");
    NSUInteger v15 = v16;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v15[136] = self->_isInheritedAccount;
    v15[140] |= 0x10u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_frozenPolicyHash) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v6 = self->_policySecrets;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  if (self->_osVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_recoverySigningPublicKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_recoveryEncryptionPublicKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_serialNumber) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_flexiblePolicyHash) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v11 = self->_custodianRecoveryKeys;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if (self->_secureElementIdentity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_walrus) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_webAccess) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPeerStableInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_clock];
    [v3 setObject:v5 forKey:@"clock"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    unint64_t v6 = [NSNumber numberWithUnsignedLongLong:self->_frozenPolicyVersion];
    [v3 setObject:v6 forKey:@"frozen_policy_version"];
  }
  frozenPolicyHash = self->_frozenPolicyHash;
  if (frozenPolicyHash) {
    [v3 setObject:frozenPolicyHash forKey:@"frozen_policy_hash"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v3 setObject:osVersion forKey:@"os_version"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"device_name"];
  }
  recoverySigningPublicKey = self->_recoverySigningPublicKey;
  if (recoverySigningPublicKey) {
    [v3 setObject:recoverySigningPublicKey forKey:@"recovery_signing_public_key"];
  }
  recoveryEncryptionPublicKey = self->_recoveryEncryptionPublicKey;
  if (recoveryEncryptionPublicKey) {
    [v3 setObject:recoveryEncryptionPublicKey forKey:@"recovery_encryption_public_key"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v3 setObject:serialNumber forKey:@"serial_number"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v13 = [NSNumber numberWithUnsignedLongLong:self->_flexiblePolicyVersion];
    [v3 setObject:v13 forKey:@"flexible_policy_version"];
  }
  flexiblePolicyHash = self->_flexiblePolicyHash;
  if (flexiblePolicyHash) {
    [v3 setObject:flexiblePolicyHash forKey:@"flexible_policy_hash"];
  }
  if ([(NSMutableArray *)self->_policySecrets count])
  {
    NSUInteger v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_policySecrets, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v16 = self->_policySecrets;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"policy_secrets"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t userControllableViewStatus = self->_userControllableViewStatus;
    if (userControllableViewStatus >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_userControllableViewStatus);
      long long v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v23 = off_2640ECA00[userControllableViewStatus];
    }
    [v3 setObject:v23 forKey:@"user_controllable_view_status"];
  }
  if ([(NSMutableArray *)self->_custodianRecoveryKeys count])
  {
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_custodianRecoveryKeys, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v25 = self->_custodianRecoveryKeys;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = [*(id *)(*((void *)&v39 + 1) + 8 * j) dictionaryRepresentation];
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKey:@"custodian_recovery_keys"];
  }
  secureElementIdentity = self->_secureElementIdentity;
  if (secureElementIdentity)
  {
    v32 = [(TPPBSecureElementIdentity *)secureElementIdentity dictionaryRepresentation];
    [v3 setObject:v32 forKey:@"secureElementIdentity"];
  }
  walrus = self->_walrus;
  if (walrus)
  {
    id v34 = [(TPPBPeerStableInfoSetting *)walrus dictionaryRepresentation];
    [v3 setObject:v34 forKey:@"walrus"];
  }
  webAccess = self->_webAccess;
  if (webAccess)
  {
    id v36 = [(TPPBPeerStableInfoSetting *)webAccess dictionaryRepresentation];
    [v3 setObject:v36 forKey:@"web_access"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v37 = [NSNumber numberWithBool:self->_isInheritedAccount];
    [v3 setObject:v37 forKey:@"isInheritedAccount"];
  }
  return v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPeerStableInfo;
  id v4 = [(TPPBPeerStableInfo *)&v8 description];
  uint64_t v5 = [(TPPBPeerStableInfo *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsInheritedAccount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasIsInheritedAccount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isInheritedAccount = a3;
}

- (BOOL)hasWebAccess
{
  return self->_webAccess != 0;
}

- (BOOL)hasWalrus
{
  return self->_walrus != 0;
}

- (BOOL)hasSecureElementIdentity
{
  return self->_secureElementIdentity != 0;
}

- (id)custodianRecoveryKeysAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_custodianRecoveryKeys objectAtIndex:a3];
}

- (unint64_t)custodianRecoveryKeysCount
{
  return [(NSMutableArray *)self->_custodianRecoveryKeys count];
}

- (void)addCustodianRecoveryKeys:(id)a3
{
  id v4 = a3;
  custodianRecoveryKeys = self->_custodianRecoveryKeys;
  id v8 = v4;
  if (!custodianRecoveryKeys)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_custodianRecoveryKeys;
    self->_custodianRecoveryKeys = v6;

    id v4 = v8;
    custodianRecoveryKeys = self->_custodianRecoveryKeys;
  }
  [(NSMutableArray *)custodianRecoveryKeys addObject:v4];
}

- (void)clearCustodianRecoveryKeys
{
}

- (int)StringAsUserControllableViewStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DISABLED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ENABLED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FOLLOWING"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)userControllableViewStatusAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_2640ECA00[a3];
  }
  return v3;
}

- (BOOL)hasUserControllableViewStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasUserControllableViewStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setUserControllableViewStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t userControllableViewStatus = a3;
}

- (int)userControllableViewStatus
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_userControllableViewStatus;
  }
  else {
    return 0;
  }
}

- (id)policySecretsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_policySecrets objectAtIndex:a3];
}

- (unint64_t)policySecretsCount
{
  return [(NSMutableArray *)self->_policySecrets count];
}

- (void)addPolicySecrets:(id)a3
{
  id v4 = a3;
  policySecrets = self->_policySecrets;
  id v8 = v4;
  if (!policySecrets)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_policySecrets;
    self->_policySecrets = v6;

    id v4 = v8;
    policySecrets = self->_policySecrets;
  }
  [(NSMutableArray *)policySecrets addObject:v4];
}

- (void)clearPolicySecrets
{
}

- (BOOL)hasFlexiblePolicyHash
{
  return self->_flexiblePolicyHash != 0;
}

- (BOOL)hasFlexiblePolicyVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasFlexiblePolicyVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setFlexiblePolicyVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_flexiblePolicyVersion = a3;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasRecoveryEncryptionPublicKey
{
  return self->_recoveryEncryptionPublicKey != 0;
}

- (BOOL)hasRecoverySigningPublicKey
{
  return self->_recoverySigningPublicKey != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (BOOL)hasFrozenPolicyHash
{
  return self->_frozenPolicyHash != 0;
}

- (BOOL)hasFrozenPolicyVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasFrozenPolicyVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setFrozenPolicyVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_frozenPolicyVersion = a3;
}

- (BOOL)hasClock
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasClock:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setClock:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clock = a3;
}

+ (Class)custodianRecoveryKeysType
{
  return (Class)objc_opt_class();
}

+ (Class)policySecretsType
{
  return (Class)objc_opt_class();
}

@end