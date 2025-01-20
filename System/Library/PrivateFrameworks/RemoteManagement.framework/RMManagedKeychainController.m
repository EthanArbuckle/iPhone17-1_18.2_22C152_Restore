@interface RMManagedKeychainController
+ (RMSharedLock)lock;
+ (RMSharedLock)modifierLock;
+ (id)newManagedKeychainControllerForScope:(int64_t)a3 personaID:(id)a4;
- (BOOL)hasDataForAssetKey:(id)a3;
- (BOOL)removedKeychainItemsForAssetKey:(id)a3 error:(id *)a4;
- (BOOL)storeACMEDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(unint64_t)a5 keyType:(id)a6 hardwareBound:(BOOL)a7 subject:(id)a8 subjectAltName:(id)a9 usageFlags:(unint64_t)a10 extendedKeyUsage:(id)a11 attest:(BOOL)a12 isUserEnrollment:(BOOL)a13 assetKey:(id)a14 error:(id *)a15;
- (BOOL)storePEMData:(id)a3 assetKey:(id)a4 error:(id *)a5;
- (BOOL)storePKCS12Data:(id)a3 password:(id)a4 assetKey:(id)a5 error:(id *)a6;
- (BOOL)storePKCS1Data:(id)a3 assetKey:(id)a4 error:(id *)a5;
- (BOOL)storePassword:(id)a3 userName:(id)a4 assetKey:(id)a5 error:(id *)a6;
- (BOOL)storeSCEPIdentityURL:(id)a3 caInstanceName:(id)a4 caFingerprint:(id)a5 caCapabilities:(id)a6 challenge:(id)a7 subject:(id)a8 keySize:(unint64_t)a9 usageFlags:(unint64_t)a10 subjectAltName:(id)a11 retries:(unint64_t)a12 retryDelay:(unsigned int)a13 assetKey:(id)a14 error:(id *)a15;
- (BOOL)unassignAllAssetsFromConfigurationKey:(id)a3 error:(id *)a4;
- (NSString)personaID;
- (RMManagedKeychainController)initWithScope:(int64_t)a3 personaID:(id)a4;
- (id)assetKeysForCertificatesAndReturnError:(id *)a3;
- (id)assetKeysForIdentitiesAndReturnError:(id *)a3;
- (id)assetKeysForPasswordsAndReturnError:(id *)a3;
- (id)assignCertificateForAssetKey:(id)a3 toConfigurationKey:(id)a4 access:(void *)a5 group:(id)a6 error:(id *)a7;
- (id)assignIdentityForAssetKey:(id)a3 configurationKey:(id)a4 access:(void *)a5 group:(id)a6 error:(id *)a7;
- (id)assignPasswordForAssetKey:(id)a3 toConfigurationKey:(id)a4 access:(void *)a5 group:(id)a6 returnUserName:(id *)a7 error:(id *)a8;
- (id)certificatePersistentRefForAssetKey:(id)a3 error:(id *)a4;
- (id)certificatePersistentRefsForAssetKeys:(id)a3 error:(id *)a4;
- (id)debugState;
- (int64_t)scope;
- (void)_postNotification;
- (void)debugState;
- (void)lockBeforeModifyingKeychain;
- (void)setPersonaID:(id)a3;
- (void)setScope:(int64_t)a3;
- (void)unlockAfterModifyingKeychain;
@end

@implementation RMManagedKeychainController

+ (id)newManagedKeychainControllerForScope:(int64_t)a3 personaID:(id)a4
{
  id v5 = a4;
  v6 = [[RMManagedKeychainController alloc] initWithScope:a3 personaID:v5];

  return v6;
}

- (RMManagedKeychainController)initWithScope:(int64_t)a3 personaID:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMManagedKeychainController;
  v8 = [(RMManagedKeychainController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_scope = a3 == 1;
    objc_storeStrong((id *)&v8->_personaID, a4);
    v10 = +[RMLog managedKeychainController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[RMManagedKeychainController initWithScope:personaID:]((uint64_t)v7, a3, v10);
    }
  }
  return v9;
}

+ (RMSharedLock)lock
{
  if (lock_onceToken != -1) {
    dispatch_once(&lock_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)lock_lock;

  return (RMSharedLock *)v2;
}

uint64_t __35__RMManagedKeychainController_lock__block_invoke()
{
  lock_lock = +[RMSharedLock newSharedLockWithDescription:@"RMManagedKeychainController-internal"];

  return MEMORY[0x270F9A758]();
}

+ (RMSharedLock)modifierLock
{
  if (modifierLock_onceToken != -1) {
    dispatch_once(&modifierLock_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)modifierLock_lock;

  return (RMSharedLock *)v2;
}

uint64_t __43__RMManagedKeychainController_modifierLock__block_invoke()
{
  modifierLock_lock = +[RMSharedLock newSharedLockWithDescription:@"RMManagedKeychainController-modifier"];

  return MEMORY[0x270F9A758]();
}

- (void)lockBeforeModifyingKeychain
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_224784000, v0, v1, "Lock modifier lock", v2, v3, v4, v5, v6);
}

- (void)unlockAfterModifyingKeychain
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_224784000, v0, v1, "Unlock modifier lock", v2, v3, v4, v5, v6);
}

- (BOOL)hasDataForAssetKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController hasDataForAssetKey:]();
  }

  uint8_t v6 = +[RMManagedKeychainController lock];
  [v6 lock];

  id v7 = +[ManagedKeychain sharedInstance];
  int64_t v8 = [(RMManagedKeychainController *)self scope];
  v9 = [(RMManagedKeychainController *)self personaID];
  LOBYTE(v8) = [v7 hasAssetForAssetKey:v4 scope:v8 persona:v9];

  v10 = +[RMManagedKeychainController lock];
  [v10 unlock];

  return v8;
}

- (BOOL)storePassword:(id)a3 userName:(id)a4 assetKey:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController storePassword:userName:assetKey:error:]();
  }

  v14 = +[RMManagedKeychainController lock];
  [v14 lock];

  v15 = +[ManagedKeychain sharedInstance];
  int64_t v16 = [(RMManagedKeychainController *)self scope];
  v17 = [(RMManagedKeychainController *)self personaID];
  LOBYTE(v16) = [v15 storeWithPassword:v12 userName:v11 assetKey:v10 scope:v16 persona:v17 error:a6];

  v18 = +[RMManagedKeychainController lock];
  [v18 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a6];
  [(RMManagedKeychainController *)self _postNotification];

  return v16;
}

- (BOOL)storePEMData:(id)a3 assetKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController storePEMData:assetKey:error:]();
  }

  id v11 = +[RMManagedKeychainController lock];
  [v11 lock];

  id v12 = +[ManagedKeychain sharedInstance];
  int64_t v13 = [(RMManagedKeychainController *)self scope];
  v14 = [(RMManagedKeychainController *)self personaID];
  LOBYTE(v13) = [v12 storeWithPemData:v9 assetKey:v8 scope:v13 persona:v14 error:a5];

  v15 = +[RMManagedKeychainController lock];
  [v15 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a5];
  [(RMManagedKeychainController *)self _postNotification];

  return v13;
}

- (BOOL)storePKCS1Data:(id)a3 assetKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController storePKCS1Data:assetKey:error:]();
  }

  id v11 = +[RMManagedKeychainController lock];
  [v11 lock];

  id v12 = +[ManagedKeychain sharedInstance];
  int64_t v13 = [(RMManagedKeychainController *)self scope];
  v14 = [(RMManagedKeychainController *)self personaID];
  LOBYTE(v13) = [v12 storeWithDerData:v9 assetKey:v8 scope:v13 persona:v14 error:a5];

  v15 = +[RMManagedKeychainController lock];
  [v15 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a5];
  [(RMManagedKeychainController *)self _postNotification];

  return v13;
}

- (BOOL)storePKCS12Data:(id)a3 password:(id)a4 assetKey:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  int64_t v13 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController storePKCS12Data:password:assetKey:error:]();
  }

  v14 = +[RMManagedKeychainController lock];
  [v14 lock];

  v15 = +[ManagedKeychain sharedInstance];
  int64_t v16 = [(RMManagedKeychainController *)self scope];
  v17 = [(RMManagedKeychainController *)self personaID];
  LOBYTE(v16) = [v15 storeWithPkcs12Data:v12 password:v11 assetKey:v10 scope:v16 persona:v17 error:a6];

  v18 = +[RMManagedKeychainController lock];
  [v18 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a6];
  [(RMManagedKeychainController *)self _postNotification];

  return v16;
}

- (BOOL)storeSCEPIdentityURL:(id)a3 caInstanceName:(id)a4 caFingerprint:(id)a5 caCapabilities:(id)a6 challenge:(id)a7 subject:(id)a8 keySize:(unint64_t)a9 usageFlags:(unint64_t)a10 subjectAltName:(id)a11 retries:(unint64_t)a12 retryDelay:(unsigned int)a13 assetKey:(id)a14 error:(id *)a15
{
  id v21 = a14;
  id v36 = a11;
  id v35 = a8;
  id v34 = a7;
  id v33 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController storeSCEPIdentityURL:caInstanceName:caFingerprint:caCapabilities:challenge:subject:keySize:usageFlags:subjectAltName:retries:retryDelay:assetKey:error:]();
  }

  v26 = +[RMManagedKeychainController lock];
  [v26 lock];

  v27 = +[ManagedKeychain sharedInstance];
  int64_t v28 = [(RMManagedKeychainController *)self scope];
  v29 = [(RMManagedKeychainController *)self personaID];
  LODWORD(v32) = a13;
  char v37 = [v27 storeSCEPIdentityWithUrl:v24 caInstanceName:v23 caFingerprint:v22 caCapabilities:v33 challenge:v34 subject:v35 keySize:a9 usageFlags:a10 subjectAltName:v36 retries:a12 retryDelay:v32 assetKey:v21 scope:v28 persona:v29 error:a15];

  v30 = +[RMManagedKeychainController lock];
  [v30 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a15];
  [(RMManagedKeychainController *)self _postNotification];

  return v37;
}

- (BOOL)storeACMEDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(unint64_t)a5 keyType:(id)a6 hardwareBound:(BOOL)a7 subject:(id)a8 subjectAltName:(id)a9 usageFlags:(unint64_t)a10 extendedKeyUsage:(id)a11 attest:(BOOL)a12 isUserEnrollment:(BOOL)a13 assetKey:(id)a14 error:(id *)a15
{
  BOOL v34 = a7;
  id v37 = a14;
  id v32 = a11;
  id v31 = a9;
  id v30 = a8;
  id v29 = a6;
  id v19 = a4;
  id v20 = a3;
  id v21 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController storeACMEDirectoryURL:clientIdentifier:keySize:keyType:hardwareBound:subject:subjectAltName:usageFlags:extendedKeyUsage:attest:isUserEnrollment:assetKey:error:]();
  }

  id v22 = +[RMManagedKeychainController lock];
  [v22 lock];

  id v23 = +[ManagedKeychain sharedInstance];
  int64_t v24 = [(RMManagedKeychainController *)self scope];
  v25 = [(RMManagedKeychainController *)self personaID];
  LOWORD(v28) = __PAIR16__(a13, a12);
  char v35 = objc_msgSend(v23, "storeACMEIdentityWithDirectoryURL:clientIdentifier:keySize:keyType:hardwareBound:subject:subjectAltName:usageFlags:extendedKeyUsage:attest:isUserEnrollment:assetKey:scope:persona:error:", v20, v19, a5, v29, v34, v30, v31, a10, v32, v28, v37, v24, v25, a15);

  v26 = +[RMManagedKeychainController lock];
  [v26 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a15];
  [(RMManagedKeychainController *)self _postNotification];

  return v35;
}

- (id)assignPasswordForAssetKey:(id)a3 toConfigurationKey:(id)a4 access:(void *)a5 group:(id)a6 returnUserName:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v17 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController assignPasswordForAssetKey:toConfigurationKey:access:group:returnUserName:error:]();
  }

  v18 = +[RMManagedKeychainController lock];
  [v18 lock];

  id v19 = +[ManagedKeychain sharedInstance];
  int64_t v20 = [(RMManagedKeychainController *)self scope];
  id v21 = [(RMManagedKeychainController *)self personaID];
  id v22 = [v19 assignPasswordWithAssetKey:v14 scope:v20 persona:v21 toConfigurationKey:v15 accessibility:a5 accessGroup:v16 returnUserName:a7 error:a8];

  id v23 = +[RMManagedKeychainController lock];
  [v23 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a8];

  return v22;
}

- (id)assignCertificateForAssetKey:(id)a3 toConfigurationKey:(id)a4 access:(void *)a5 group:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController assignCertificateForAssetKey:toConfigurationKey:access:group:error:]();
  }

  id v16 = +[RMManagedKeychainController lock];
  [v16 lock];

  v17 = +[ManagedKeychain sharedInstance];
  int64_t v18 = [(RMManagedKeychainController *)self scope];
  id v19 = [(RMManagedKeychainController *)self personaID];
  int64_t v20 = [v17 assignCertWithAssetKey:v12 scope:v18 persona:v19 toConfigurationKey:v13 accessibility:a5 accessGroup:v14 error:a7];

  id v21 = +[RMManagedKeychainController lock];
  [v21 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a7];

  return v20;
}

- (id)assignIdentityForAssetKey:(id)a3 configurationKey:(id)a4 access:(void *)a5 group:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController assignIdentityForAssetKey:configurationKey:access:group:error:]();
  }

  id v16 = +[RMManagedKeychainController lock];
  [v16 lock];

  v17 = +[ManagedKeychain sharedInstance];
  int64_t v18 = [(RMManagedKeychainController *)self scope];
  id v19 = [(RMManagedKeychainController *)self personaID];
  int64_t v20 = [v17 assignIdentityWithAssetKey:v12 scope:v18 persona:v19 toConfigurationKey:v13 accessibility:a5 accessGroup:v14 error:a7];

  id v21 = +[RMManagedKeychainController lock];
  [v21 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a7];

  return v20;
}

- (BOOL)unassignAllAssetsFromConfigurationKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController unassignAllAssetsFromConfigurationKey:error:]();
  }

  id v8 = +[RMManagedKeychainController lock];
  [v8 lock];

  id v9 = +[ManagedKeychain sharedInstance];
  int64_t v10 = [(RMManagedKeychainController *)self scope];
  id v11 = [(RMManagedKeychainController *)self personaID];
  LOBYTE(v10) = [v9 unassignAllAssetsFromConfigurationKey:v6 scope:v10 persona:v11 error:a4];

  id v12 = +[RMManagedKeychainController lock];
  [v12 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a4];
  return v10;
}

- (BOOL)removedKeychainItemsForAssetKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController removedKeychainItemsForAssetKey:error:]();
  }

  id v8 = +[RMManagedKeychainController lock];
  [v8 lock];

  id v9 = +[ManagedKeychain sharedInstance];
  int64_t v10 = [(RMManagedKeychainController *)self scope];
  id v11 = [(RMManagedKeychainController *)self personaID];
  LOBYTE(v10) = [v9 deleteWithAssetKey:v6 scope:v10 persona:v11 error:a4];

  id v12 = +[RMManagedKeychainController lock];
  [v12 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a4];
  [(RMManagedKeychainController *)self _postNotification];

  return v10;
}

- (id)assetKeysForCertificatesAndReturnError:(id *)a3
{
  uint64_t v5 = +[RMManagedKeychainController lock];
  [v5 lock];

  id v6 = +[ManagedKeychain sharedInstance];
  int64_t v7 = [(RMManagedKeychainController *)self scope];
  id v8 = [(RMManagedKeychainController *)self personaID];
  id v9 = [v6 assetKeysForCertificatesWithScope:v7 persona:v8 error:a3];

  int64_t v10 = +[RMManagedKeychainController lock];
  [v10 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a3];

  return v9;
}

- (id)assetKeysForIdentitiesAndReturnError:(id *)a3
{
  uint64_t v5 = +[RMManagedKeychainController lock];
  [v5 lock];

  id v6 = +[ManagedKeychain sharedInstance];
  int64_t v7 = [(RMManagedKeychainController *)self scope];
  id v8 = [(RMManagedKeychainController *)self personaID];
  id v9 = [v6 assetKeysForIdentitiesWithScope:v7 persona:v8 error:a3];

  int64_t v10 = +[RMManagedKeychainController lock];
  [v10 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a3];

  return v9;
}

- (id)assetKeysForPasswordsAndReturnError:(id *)a3
{
  uint64_t v5 = +[RMManagedKeychainController lock];
  [v5 lock];

  id v6 = +[ManagedKeychain sharedInstance];
  int64_t v7 = [(RMManagedKeychainController *)self scope];
  id v8 = [(RMManagedKeychainController *)self personaID];
  id v9 = [v6 assetKeysForPasswordsWithScope:v7 persona:v8 error:a3];

  int64_t v10 = +[RMManagedKeychainController lock];
  [v10 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a3];

  return v9;
}

- (id)certificatePersistentRefForAssetKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = +[RMManagedKeychainController lock];
  [v7 lock];

  id v8 = +[ManagedKeychain sharedInstance];
  int64_t v9 = [(RMManagedKeychainController *)self scope];
  int64_t v10 = [(RMManagedKeychainController *)self personaID];
  id v11 = [v8 certificatePersistentRefWithAssetKey:v6 scope:v9 persona:v10 error:a4];

  id v12 = +[RMManagedKeychainController lock];
  [v12 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a4];

  return v11;
}

- (id)certificatePersistentRefsForAssetKeys:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = +[RMManagedKeychainController lock];
  [v7 lock];

  id v8 = +[ManagedKeychain sharedInstance];
  int64_t v9 = [(RMManagedKeychainController *)self scope];
  int64_t v10 = [(RMManagedKeychainController *)self personaID];
  id v11 = [v8 certificatePersistentRefsWithAssetKeys:v6 scope:v9 persona:v10 error:a4];

  id v12 = +[RMManagedKeychainController lock];
  [v12 unlock];

  +[RMErrorUtilities convertSwiftErrorReference:a4];

  return v11;
}

- (void)_postNotification
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_224784000, v0, v1, "sending certificate changed notification", v2, v3, v4, v5, v6);
}

- (id)debugState
{
  uint64_t v3 = +[RMLog managedKeychainController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[RMManagedKeychainController debugState]();
  }

  uint64_t v4 = +[ManagedKeychain sharedInstance];
  int64_t v5 = [(RMManagedKeychainController *)self scope];
  uint8_t v6 = [(RMManagedKeychainController *)self personaID];
  int64_t v7 = [v4 debugStateWithScope:v5 persona:v6];

  return v7;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithScope:(NSObject *)a3 personaID:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1_2(&dword_224784000, a2, a3, "Created with scope: %ld personaID: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)hasDataForAssetKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "hasDataForAssetKey: %{public}@", v2, v3, v4, v5, v6);
}

- (void)storePassword:userName:assetKey:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "storePassword: %{public}@", v2, v3, v4, v5, v6);
}

- (void)storePEMData:assetKey:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "storePEMData: %{public}@", v2, v3, v4, v5, v6);
}

- (void)storePKCS1Data:assetKey:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "storePKCS1Data: %{public}@", v2, v3, v4, v5, v6);
}

- (void)storePKCS12Data:password:assetKey:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "storePKCS12Data identity: %{public}@", v2, v3, v4, v5, v6);
}

- (void)storeSCEPIdentityURL:caInstanceName:caFingerprint:caCapabilities:challenge:subject:keySize:usageFlags:subjectAltName:retries:retryDelay:assetKey:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "storeSCEPIdentity identity: %{public}@", v2, v3, v4, v5, v6);
}

- (void)storeACMEDirectoryURL:clientIdentifier:keySize:keyType:hardwareBound:subject:subjectAltName:usageFlags:extendedKeyUsage:attest:isUserEnrollment:assetKey:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "storeACMEIdentity identity: %{public}@", v2, v3, v4, v5, v6);
}

- (void)assignPasswordForAssetKey:toConfigurationKey:access:group:returnUserName:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_224784000, v0, v1, "assignPasswordForAssetKey: %{public}@ configuration: %{public}@");
}

- (void)assignCertificateForAssetKey:toConfigurationKey:access:group:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_224784000, v0, v1, "assignCertificateForAssetKey: %{public}@ configuration: %{public}@");
}

- (void)assignIdentityForAssetKey:configurationKey:access:group:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_224784000, v0, v1, "assignIdentityForAssetKey: %{public}@ configuration: %{public}@");
}

- (void)unassignAllAssetsFromConfigurationKey:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "unassignAllAssetsFromConfigurationKey: %{public}@", v2, v3, v4, v5, v6);
}

- (void)removedKeychainItemsForAssetKey:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_224784000, v0, v1, "removedKeychainItemsForAssetKey: %{public}@", v2, v3, v4, v5, v6);
}

- (void)debugState
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_224784000, v0, v1, "debugState", v2, v3, v4, v5, v6);
}

@end