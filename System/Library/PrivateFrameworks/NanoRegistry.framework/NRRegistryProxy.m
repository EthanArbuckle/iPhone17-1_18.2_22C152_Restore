@interface NRRegistryProxy
+ (BOOL)requireAnEntitlement;
+ (id)clientRemoteObjectInterface;
+ (id)entitlements;
+ (id)machServiceName;
+ (id)serverExportedInterface;
- (BOOL)_hasInternalEntitlement;
- (BOOL)loudHasEntitlement:(id)a3;
- (void)logCaller:(SEL)a3 args:(id)a4;
- (void)xpcApplyDiff:(id)a3 withSecureProperties:(id)a4 block:(id)a5;
- (void)xpcBooleanForInternalPreference:(id)a3 withBlock:(id)a4;
- (void)xpcClientInfo:(id)a3;
- (void)xpcDeviceIDAtSwitchIndex:(unsigned int)a3 withBlock:(id)a4;
- (void)xpcGetChangeHistoryWithBlock:(id)a3;
- (void)xpcGetDeviceCollectionWithBlock:(id)a3;
- (void)xpcGetDiffSinceTokenValue:(unint64_t)a3 getSecureProperties:(BOOL)a4 withBlock:(id)a5;
- (void)xpcLongForInternalPreference:(id)a3 withBlock:(id)a4;
- (void)xpcRetrieveSecureProperties:(id)a3 block:(id)a4;
- (void)xpcSetMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5;
- (void)xpcSwitchIndex:(id)a3;
@end

@implementation NRRegistryProxy

- (BOOL)loudHasEntitlement:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NRXPCProxy *)self hasEntitlement:v4];
  if (!v5)
  {
    v6 = nr_daemon_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      v8 = nr_daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = [(NRXPCProxy *)self appPath];
        int v11 = 138543618;
        v12 = v10;
        __int16 v13 = 2112;
        id v14 = v4;
        _os_log_error_impl(&dword_1A356E000, v8, OS_LOG_TYPE_ERROR, "client %{public}@ is missing the %@ entitlement", (uint8_t *)&v11, 0x16u);
      }
    }
  }

  return v5;
}

- (void)logCaller:(SEL)a3 args:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(NRXPCProxy *)self appPath];
      int v11 = NSStringFromSelector(a3);
      int v12 = 138543874;
      __int16 v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_1A356E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ called %{public}@ %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
}

+ (id)machServiceName
{
  return @"com.apple.nano.nanoregistry.paireddeviceregistry";
}

+ (id)serverExportedInterface
{
  if (qword_1EB30BAC0 != -1) {
    dispatch_once(&qword_1EB30BAC0, &__block_literal_global_6);
  }
  v2 = (void *)_MergedGlobals_9;

  return v2;
}

void __42__NRRegistryProxy_serverExportedInterface__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6D7918];
  v1 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = v0;

  v2 = (void *)_MergedGlobals_9;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  BOOL v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_xpcRetrieveSecureProperties_block_ argumentIndex:0 ofReply:0];
}

+ (id)clientRemoteObjectInterface
{
  if (qword_1EB30BAD0 != -1) {
    dispatch_once(&qword_1EB30BAD0, &__block_literal_global_41);
  }
  v2 = (void *)qword_1EB30BAC8;

  return v2;
}

void __46__NRRegistryProxy_clientRemoteObjectInterface__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6D7918];
  v1 = (void *)qword_1EB30BAC8;
  qword_1EB30BAC8 = v0;

  v2 = (void *)qword_1EB30BAC8;
  v3 = +[NRSecureDevicePropertyStore enclosedClassTypes];
  [v2 setClasses:v3 forSelector:sel_xpcRetrieveSecureProperties_block_ argumentIndex:0 ofReply:1];

  id v4 = (void *)qword_1EB30BAC8;
  BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  BOOL v7 = [v5 setWithArray:v6];
  [v4 setClasses:v7 forSelector:sel_xpcClientInfo_ argumentIndex:0 ofReply:1];

  BOOL v8 = (void *)qword_1EB30BAC8;
  v9 = +[NRSecureDevicePropertyStore enclosedClassTypes];
  [v8 setClasses:v9 forSelector:sel_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock_ argumentIndex:1 ofReply:1];
}

+ (id)entitlements
{
  v6[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"com.apple.bluetoothregistry";
  v6[1] = @"com.apple.nano.nanoregistry";
  v6[2] = @"com.apple.nano.nanoregistry.pairunpairobliterate";
  void v6[3] = @"com.apple.nano.nanoregistry.ids.plugin";
  v6[4] = @"com.apple.nano.nanoregistry.applydiff";
  v6[5] = @"com.apple.nano.nanoregistry.internal";
  v6[6] = @"com.apple.nano.nanoregistry.ids.plugin";
  v6[7] = @"com.apple.nano.nanoregistry.unpairwithbrick";
  v6[8] = @"com.apple.nanoregistry.BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2";
  v6[9] = @"com.apple.nano.nanoregistry.submitrtcpairingmetric";
  v6[10] = @"com.apple.nano.nanoregistry.generalaccess";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:11];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (BOOL)requireAnEntitlement
{
  return 0;
}

- (BOOL)_hasInternalEntitlement
{
  if (_NRIsInternalInstall___onceToken != -1) {
    dispatch_once(&_NRIsInternalInstall___onceToken, &__block_literal_global_18);
  }
  if (_NRIsInternalInstall___internalInstall)
  {
    return [(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.internal"];
  }
  else
  {
    id v4 = nr_daemon_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      id v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v7 = 0;
        _os_log_error_impl(&dword_1A356E000, v6, OS_LOG_TYPE_ERROR, "Internal functionality not available in customer builds", v7, 2u);
      }
    }
    return 0;
  }
}

- (void)xpcGetDeviceCollectionWithBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NRXPCProxy *)self hasEntitlements];
  id v6 = [(NRRegistryProxy *)self registryDelegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__NRRegistryProxy_xpcGetDeviceCollectionWithBlock___block_invoke;
  v8[3] = &unk_1E5B01848;
  BOOL v10 = v5;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 xpcGetDeviceCollectionWithBlock:v8];
}

void __51__NRRegistryProxy_xpcGetDeviceCollectionWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__NRRegistryProxy_xpcGetDeviceCollectionWithBlock___block_invoke_2;
  v13[3] = &unk_1E5B01820;
  char v18 = *(unsigned char *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v14 = v7;
  id v15 = v8;
  id v16 = v10;
  uint64_t v17 = a4;
  id v11 = v8;
  id v12 = v7;
  [v9 runCompletionBlock:v13];
}

uint64_t __51__NRRegistryProxy_xpcGetDeviceCollectionWithBlock___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void, void, void, uint64_t))(v3 + 16))(v3, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56), 1);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void, void, void))(v3 + 16))(v3, 0, 0, *(void *)(a1 + 56), 0);
  }
}

- (void)xpcGetDiffSinceTokenValue:(unint64_t)a3 getSecureProperties:(BOOL)a4 withBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  BOOL v9 = [(NRXPCProxy *)self hasEntitlements];
  id v10 = [(NRRegistryProxy *)self registryDelegate];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__NRRegistryProxy_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock___block_invoke;
  v12[3] = &unk_1E5B00E20;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 xpcGetDiffSinceTokenValue:a3 getSecureProperties:v9 & v5 withBlock:v12];
}

void __75__NRRegistryProxy_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock___block_invoke(uint64_t a1, void *a2, void *a3, char a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = [*(id *)(a1 + 32) connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__NRRegistryProxy_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock___block_invoke_2;
  v15[3] = &unk_1E5B01820;
  id v12 = *(id *)(a1 + 40);
  id v16 = v9;
  id v17 = v10;
  char v20 = a4;
  id v18 = v12;
  uint64_t v19 = a5;
  id v13 = v10;
  id v14 = v9;
  [v11 runCompletionBlock:v15];
}

uint64_t __75__NRRegistryProxy_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56));
}

- (void)xpcRetrieveSecureProperties:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NRXPCProxy *)self hasEntitlements])
  {
    id v8 = [(NRRegistryProxy *)self registryDelegate];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__NRRegistryProxy_xpcRetrieveSecureProperties_block___block_invoke;
    v9[3] = &unk_1E5B009C0;
    v9[4] = self;
    id v10 = v7;
    [v8 xpcRetrieveSecureProperties:v6 block:v9];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __53__NRRegistryProxy_xpcRetrieveSecureProperties_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__NRRegistryProxy_xpcRetrieveSecureProperties_block___block_invoke_2;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __53__NRRegistryProxy_xpcRetrieveSecureProperties_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)xpcSwitchIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(NRRegistryProxy *)self registryDelegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__NRRegistryProxy_xpcSwitchIndex___block_invoke;
  v7[3] = &unk_1E5B01898;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 xpcSwitchIndex:v7];
}

void __34__NRRegistryProxy_xpcSwitchIndex___block_invoke(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__NRRegistryProxy_xpcSwitchIndex___block_invoke_2;
  v5[3] = &unk_1E5B01870;
  id v6 = *(id *)(a1 + 40);
  int v7 = a2;
  [v4 runCompletionBlock:v5];
}

uint64_t __34__NRRegistryProxy_xpcSwitchIndex___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)xpcLongForInternalPreference:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NRRegistryProxy *)self registryDelegate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__NRRegistryProxy_xpcLongForInternalPreference_withBlock___block_invoke;
  void v10[3] = &unk_1E5B018E8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 xpcLongForInternalPreference:v7 withBlock:v10];
}

void __58__NRRegistryProxy_xpcLongForInternalPreference_withBlock___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__NRRegistryProxy_xpcLongForInternalPreference_withBlock___block_invoke_2;
  v8[3] = &unk_1E5B018C0;
  id v7 = *(id *)(a1 + 40);
  char v11 = a2;
  id v9 = v7;
  uint64_t v10 = a3;
  [v6 runCompletionBlock:v8];
}

uint64_t __58__NRRegistryProxy_xpcLongForInternalPreference_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)xpcBooleanForInternalPreference:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NRRegistryProxy *)self registryDelegate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__NRRegistryProxy_xpcBooleanForInternalPreference_withBlock___block_invoke;
  void v10[3] = &unk_1E5B01938;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 xpcBooleanForInternalPreference:v7 withBlock:v10];
}

void __61__NRRegistryProxy_xpcBooleanForInternalPreference_withBlock___block_invoke(uint64_t a1, char a2, char a3)
{
  id v6 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__NRRegistryProxy_xpcBooleanForInternalPreference_withBlock___block_invoke_2;
  v7[3] = &unk_1E5B01910;
  id v8 = *(id *)(a1 + 40);
  char v9 = a2;
  char v10 = a3;
  [v6 runCompletionBlock:v7];
}

uint64_t __61__NRRegistryProxy_xpcBooleanForInternalPreference_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)xpcDeviceIDAtSwitchIndex:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(NRRegistryProxy *)self registryDelegate];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__NRRegistryProxy_xpcDeviceIDAtSwitchIndex_withBlock___block_invoke;
  v9[3] = &unk_1E5B01960;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 xpcDeviceIDAtSwitchIndex:v4 withBlock:v9];
}

void __54__NRRegistryProxy_xpcDeviceIDAtSwitchIndex_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__NRRegistryProxy_xpcDeviceIDAtSwitchIndex_withBlock___block_invoke_2;
  v11[3] = &unk_1E5B00948;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 runCompletionBlock:v11];
}

uint64_t __54__NRRegistryProxy_xpcDeviceIDAtSwitchIndex_withBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)xpcClientInfo:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self _hasInternalEntitlement])
  {
    id v5 = [(NRRegistryProxy *)self registryDelegate];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__NRRegistryProxy_xpcClientInfo___block_invoke;
    void v6[3] = &unk_1E5B01988;
    v6[4] = self;
    id v7 = v4;
    [v5 xpcClientInfo:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __33__NRRegistryProxy_xpcClientInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__NRRegistryProxy_xpcClientInfo___block_invoke_2;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __33__NRRegistryProxy_xpcClientInfo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)xpcGetChangeHistoryWithBlock:(id)a3
{
  id v4 = a3;
  if ([(NRRegistryProxy *)self _hasInternalEntitlement])
  {
    id v5 = [(NRRegistryProxy *)self registryDelegate];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke;
    v12[3] = &unk_1E5B019B0;
    v12[4] = self;
    id v13 = v4;
    id v6 = v4;
    [v5 xpcGetChangeHistoryWithBlock:v12];

    id v7 = v13;
  }
  else
  {
    id v8 = [(NRXPCProxy *)self connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke_3;
    void v10[3] = &unk_1E5B00208;
    id v11 = v4;
    id v9 = v4;
    [v8 runCompletionBlock:v10];

    id v7 = v11;
  }
}

void __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke_2;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)xpcApplyDiff:(id)a3 withSecureProperties:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.applydiff"])
  {
    id v11 = [(NRRegistryProxy *)self registryDelegate];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke;
    v18[3] = &unk_1E5B000A8;
    v18[4] = self;
    id v19 = v10;
    id v12 = v10;
    [v11 xpcApplyDiff:v8 withSecureProperties:v9 block:v18];

    id v13 = v19;
  }
  else
  {
    id v14 = [(NRXPCProxy *)self connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke_3;
    v16[3] = &unk_1E5B00208;
    id v17 = v10;
    id v15 = v10;
    [v14 runCompletionBlock:v16];

    id v13 = v17;
  }
}

void __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke_2;
  v7[3] = &unk_1E5B00058;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 runCompletionBlock:v7];
}

uint64_t __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke_3(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"entitlement required";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [v2 errorWithDomain:@"com.apple.nanoregistry.registry" code:0 userInfo:v3];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
}

- (void)xpcSetMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(NRRegistryProxy *)self loudHasEntitlement:@"com.apple.nano.nanoregistry.pairunpairobliterate"])
  {
    id v10 = [(NRRegistryProxy *)self registryDelegate];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke;
    v17[3] = &unk_1E5B008A8;
    v17[4] = self;
    id v18 = v9;
    id v11 = v9;
    [v10 xpcSetMigrationConsented:v6 forDeviceID:v8 withBlock:v17];

    id v12 = v18;
  }
  else
  {
    id v13 = [(NRXPCProxy *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke_3;
    v15[3] = &unk_1E5B00208;
    id v16 = v9;
    id v14 = v9;
    [v13 runCompletionBlock:v15];

    id v12 = v16;
  }
}

void __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) connection];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke_2;
  v3[3] = &unk_1E5B00208;
  id v4 = *(id *)(a1 + 40);
  [v2 runCompletionBlock:v3];
}

uint64_t __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end