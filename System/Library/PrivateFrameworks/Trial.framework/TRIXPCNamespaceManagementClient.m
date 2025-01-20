@interface TRIXPCNamespaceManagementClient
- (BOOL)deregisterNamespaceWithNamespaceName:(id)a3 error:(id *)a4;
- (BOOL)immediateDownloadForNamespaceNames:(id)a3 allowExpensiveNetworking:(BOOL)a4 error:(id *)a5;
- (BOOL)logSystemCovariatesWithError:(id *)a3;
- (BOOL)promoteFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6;
- (BOOL)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 applicationGroup:(id)a6 cloudKitContainerId:(int)a7 error:(id *)a8;
- (BOOL)rejectFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6;
- (BOOL)removeLevelsForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 removeImmediately:(BOOL)a6 error:(id *)a7;
- (BOOL)setProvisionalFactorPackId:(id)a3 forNamespaceName:(id)a4 error:(id *)a5;
- (BOOL)setPurgeabilityLevelsForFactors:(id)a3 forNamespaceName:(id)a4 error:(id *)a5;
- (BOOL)startNamespaceDownloadWithName:(id)a3 options:(id)a4 error:(id *)a5;
- (TRIXPCNamespaceManagementClient)init;
- (id)activeRolloutInformation:(id *)a3;
- (id)getOnDemandReferenceCountsPerUserAtGlobalPath:(id)a3 error:(id *)a4;
- (id)getSandboxExtensionTokensForIdentifierQueryWithError:(id *)a3;
- (id)loadNamespaceMetadataForNamespaceName:(id)a3 error:(id *)a4;
- (unint64_t)statusOfDownloadForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 notificationKey:(id *)a6 error:(id *)a7;
- (void)downloadLevelsForFactors:(id)a3 withNamespace:(id)a4 queue:(id)a5 factorsState:(id)a6 options:(id)a7 progress:(id)a8 completion:(id)a9;
@end

@implementation TRIXPCNamespaceManagementClient

void __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSystemHelper, 0);
  objc_storeStrong((id *)&self->_internalHelper, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

- (TRIXPCNamespaceManagementClient)init
{
  v25.receiver = self;
  v25.super_class = (Class)TRIXPCNamespaceManagementClient;
  v2 = [(TRIXPCNamespaceManagementClient *)&v25 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEFE1070];
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEFE10D0];
    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEFE1130];
    v6 = (void *)MEMORY[0x19F3AD060]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    [v4 setClasses:v11 forSelector:sel_activeRolloutInformationWithPrivacyFilterPolicy_completion_ argumentIndex:0 ofReply:1];

    id v12 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v13 = TRILogCategory_ClientFramework();
    uint64_t v14 = [v12 initWithServiceName:@"com.apple.triald.namespace-management" allowlistedServerInterface:v3 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 allowSystemToUserConnection:1 interruptionHandler:&__block_literal_global invalidationHandler:&__block_literal_global_132 logHandle:v13];
    helper = v2->_helper;
    v2->_helper = (_PASXPCClientHelper *)v14;

    id v16 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v17 = TRILogCategory_ClientFramework();
    uint64_t v18 = [v16 initWithServiceName:@"com.apple.triald.internal" allowlistedServerInterface:v4 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 allowSystemToUserConnection:1 interruptionHandler:&__block_literal_global_134 invalidationHandler:&__block_literal_global_136 logHandle:v17];
    internalHelper = v2->_internalHelper;
    v2->_internalHelper = (_PASXPCClientHelper *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v21 = TRILogCategory_ClientFramework();
    uint64_t v22 = [v20 initWithServiceName:@"com.apple.triald.system.internal" allowlistedServerInterface:v5 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 interruptionHandler:&__block_literal_global_138 invalidationHandler:&__block_literal_global_140 logHandle:v21];
    internalSystemHelper = v2->_internalSystemHelper;
    v2->_internalSystemHelper = (_PASXPCClientHelper *)v22;
  }
  return v2;
}

- (BOOL)immediateDownloadForNamespaceNames:(id)a3 allowExpensiveNetworking:(BOOL)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 273, @"Invalid parameter not satisfying: %@", @"namespaceNames" object file lineNumber description];
  }
  uint64_t v10 = qos_class_self();
  unint64_t v11 = +[TRIMisc unsafeFirstAuthenticationState];
  unint64_t v12 = v11;
  BOOL v13 = v11 == 1;
  uint64_t v14 = &stru_1EEFB6D68;
  if (v11 == 2) {
    uint64_t v14 = @"(unknown class C status) ";
  }
  if (!v11) {
    uint64_t v14 = @"(before class C unlock) ";
  }
  v15 = v14;
  id v16 = TRILogCategory_ClientFramework();
  os_log_type_t v17 = 2 * v13;
  if (os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 1026;
    LODWORD(v40) = v10;
    _os_log_impl(&dword_19D909000, v16, v17, "%@enqueuing immediateDownloadForNamespaceNames for: %@ at qos:%{public}u", buf, 0x1Cu);
  }
  BOOL v18 = v12 == 2;

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  v19 = dispatch_group_create();
  dispatch_group_enter(v19);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke;
  v27[3] = &unk_1E596A0D8;
  id v20 = v19;
  v28 = v20;
  id v21 = v9;
  int v33 = v10;
  id v29 = v21;
  v30 = self;
  BOOL v34 = a4;
  v31 = buf;
  v32 = &v35;
  uint64_t v22 = MEMORY[0x19F3AD290](v27);
  v23 = (void *)v22;
  if (v18) {
    (*(void (**)(uint64_t))(v22 + 16))(v22);
  }
  else {
    [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlockedWithQoS:v10 block:v22];
  }
  dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v24 = *((unsigned char *)v36 + 24) != 0;

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

  return v24;
}

void __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_2;
  v23[3] = &unk_1E596A0B0;
  id v24 = *(id *)(a1 + 32);
  v2 = (void (**)(void))MEMORY[0x19F3AD290](v23);
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_3;
  v16[3] = &unk_1E5969FC0;
  v16[4] = &v17;
  v3 = (void *)MEMORY[0x19F3AD290](v16);
  v4 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = *(_DWORD *)(a1 + 72);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v6;
    _os_log_impl(&dword_19D909000, v4, OS_LOG_TYPE_DEFAULT, "(after class C unlock) enqueuing immediateDownloadForNamespaceNames for: %@ at qos:%{public}u", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  id v7 = [*(id *)(*(void *)(a1 + 48) + 8) synchronousRemoteObjectProxyWithErrorHandler:v3];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 76);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_176;
  v15[3] = &unk_1E5969FC0;
  v15[4] = buf;
  [v7 immediateDownloadForNamespaceNames:v8 allowExpensiveNetworking:v9 completion:v15];
  uint64_t v10 = (void *)v18[5];
  if (v10 || (uint64_t v10 = *(void **)(*(void *)&buf[8] + 40)) != 0)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = v10;
    BOOL v13 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;

    char v14 = 0;
  }
  else
  {
    char v14 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v14;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v17, 8);

  if (v2) {
    v2[2](v2);
  }
}

void __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_2(uint64_t a1)
{
}

- (BOOL)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 applicationGroup:(id)a6 cloudKitContainerId:(int)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v12 = *(void *)&a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  if (!v15)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 79, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)buf = 0;
    char v38 = buf;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy_;
    v41 = __Block_byref_object_dispose_;
    id v42 = 0;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __150__TRIXPCNamespaceManagementClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_error___block_invoke;
    v36[3] = &unk_1E5969FC0;
    v36[4] = buf;
    BOOL v18 = (void *)MEMORY[0x19F3AD290](v36);
    uint64_t v32 = 0;
    int v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    uint64_t v19 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v18];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __150__TRIXPCNamespaceManagementClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_error___block_invoke_2;
    v25[3] = &unk_1E5969FE8;
    v25[4] = &v32;
    v25[5] = &v26;
    [v19 registerNamespaceWithNamespaceName:v15 compatibilityVersion:v12 defaultsFileURL:v16 applicationGroup:v17 cloudKitContainerId:v9 completion:v25];
    id v20 = (void *)*((void *)v38 + 5);
    if (v20)
    {
      if (a8)
      {
LABEL_6:
        BOOL v21 = 0;
        *a8 = v20;
LABEL_16:

        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(&v32, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      id v20 = (void *)v27[5];
      if (!v20)
      {
        BOOL v21 = *((unsigned char *)v33 + 24) != 0;
        goto LABEL_16;
      }
      if (a8) {
        goto LABEL_6;
      }
    }
    BOOL v21 = 0;
    goto LABEL_16;
  }
  id v22 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19D909000, v22, OS_LOG_TYPE_ERROR, "unable to register namespace while device is class C locked", buf, 2u);
  }

  if (a8)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v21 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_17:

  return v21;
}

void __150__TRIXPCNamespaceManagementClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_error___block_invoke(uint64_t a1, void *a2)
{
}

void __150__TRIXPCNamespaceManagementClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)startNamespaceDownloadWithName:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 128, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)buf = 0;
    id v31 = buf;
    uint64_t v32 = 0x3032000000;
    int v33 = __Block_byref_object_copy_;
    uint64_t v34 = __Block_byref_object_dispose_;
    id v35 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __80__TRIXPCNamespaceManagementClient_startNamespaceDownloadWithName_options_error___block_invoke;
    v29[3] = &unk_1E5969FC0;
    v29[4] = buf;
    uint64_t v11 = (void *)MEMORY[0x19F3AD290](v29);
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    uint64_t v12 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v11];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__TRIXPCNamespaceManagementClient_startNamespaceDownloadWithName_options_error___block_invoke_2;
    v18[3] = &unk_1E5969FE8;
    v18[4] = &v25;
    v18[5] = &v19;
    [v12 startDownloadNamespaceWithName:v9 options:v10 completion:v18];
    BOOL v13 = (void *)*((void *)v31 + 5);
    if (v13)
    {
      if (a5)
      {
LABEL_6:
        BOOL v14 = 0;
        *a5 = v13;
LABEL_16:

        _Block_object_dispose(&v19, 8);
        _Block_object_dispose(&v25, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v13 = (void *)v20[5];
      if (!v13)
      {
        BOOL v14 = *((unsigned char *)v26 + 24) != 0;
        goto LABEL_16;
      }
      if (a5) {
        goto LABEL_6;
      }
    }
    BOOL v14 = 0;
    goto LABEL_16;
  }
  id v15 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "unable to start namespace download while device is class C locked", buf, 2u);
  }

  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_17:

  return v14;
}

void __80__TRIXPCNamespaceManagementClient_startNamespaceDownloadWithName_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __80__TRIXPCNamespaceManagementClient_startNamespaceDownloadWithName_options_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)downloadLevelsForFactors:(id)a3 withNamespace:(id)a4 queue:(id)a5 factorsState:(id)a6 options:(id)a7 progress:(id)a8 completion:(id)a9
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v44 = a5;
  id v42 = a6;
  id v43 = a7;
  id v17 = a8;
  id v18 = a9;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    char v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 178, @"Invalid parameter not satisfying: %@", @"factors" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 179, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy_;
  v60[4] = __Block_byref_object_dispose_;
  id v61 = 0;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke;
  v59[3] = &unk_1E5969FC0;
  v59[4] = v60;
  uint64_t v19 = (void *)MEMORY[0x19F3AD290](v59);
  unint64_t v20 = +[TRIMisc unsafeFirstAuthenticationState];
  uint64_t v21 = qos_class_self();
  id v22 = &stru_1EEFB6D68;
  if (v20 == 2) {
    id v22 = @"(unknown class C status) ";
  }
  if (!v20) {
    id v22 = @"(before class C unlock) ";
  }
  v23 = v22;
  id v24 = TRILogCategory_ClientFramework();
  os_log_type_t v25 = 2 * (v20 == 1);
  if (os_log_type_enabled(v24, v25))
  {
    *(_DWORD *)buf = 138413058;
    v63 = v23;
    __int16 v64 = 2112;
    id v65 = v16;
    __int16 v66 = 2112;
    id v67 = v15;
    __int16 v68 = 1024;
    int v69 = v21;
    _os_log_impl(&dword_19D909000, v24, v25, "%@enqueuing downloadLevelsForFactors message for:%@ factors:%@ at qos:%u", buf, 0x26u);
  }
  v41 = v23;
  BOOL v26 = v20 == 2;

  uint64_t v27 = v17;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_167;
  v46[3] = &unk_1E596A088;
  os_log_type_t v58 = v25;
  char v28 = (__CFString *)v16;
  v47 = v28;
  int v57 = v21;
  id v40 = v15;
  id v48 = v40;
  v49 = self;
  id v29 = v19;
  id v53 = v29;
  id v30 = v42;
  id v50 = v30;
  id v31 = v43;
  id v51 = v31;
  v56 = v60;
  id v32 = v18;
  id v54 = v32;
  id v33 = v27;
  id v55 = v33;
  id v34 = v44;
  id v52 = v34;
  uint64_t v35 = MEMORY[0x19F3AD290](v46);
  v36 = (void *)v35;
  if (v26) {
    (*(void (**)(uint64_t))(v35 + 16))(v35);
  }
  else {
    [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlockedWithQoS:v21 block:v35];
  }
  uint64_t v37 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v28;
    _os_log_debug_impl(&dword_19D909000, v37, OS_LOG_TYPE_DEBUG, "finished enqueuing post-unlock downloadLevelsForFactors for: %@", buf, 0xCu);
  }

  _Block_object_dispose(v60, 8);
}

void __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke(uint64_t a1, void *a2)
{
}

void __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_167(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = TRILogCategory_ClientFramework();
  os_log_type_t v3 = *(unsigned char *)(a1 + 116);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = *(_DWORD *)(a1 + 112);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v31) = v6;
    _os_log_impl(&dword_19D909000, v2, v3, "(after class C unlock) enqueuing downloadLevelsForFactors message for:%@ factors:%@ at qos:%u", buf, 0x1Cu);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v31 = __Block_byref_object_copy_;
  id v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v24 = 0;
  os_log_type_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  char v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  id v7 = [*(id *)(*(void *)(a1 + 48) + 8) synchronousRemoteObjectProxyWithErrorHandler:*(void *)(a1 + 80)];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_168;
  v23[3] = &unk_1E596A010;
  void v23[4] = buf;
  v23[5] = &v24;
  [v7 startDownloadLevelsForFactors:v8 withNamespace:v9 factorsState:v10 options:v11 completion:v23];
  if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
  {
    uint64_t v12 = *(void *)(a1 + 88);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
  }
  else
  {
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_2;
      v20[3] = &unk_1E596A038;
      id v21 = *(id *)(a1 + 96);
      id v22 = *(id *)(a1 + 88);
      BOOL v13 = (void *)MEMORY[0x19F3AD290](v20);
      id v14 = +[TRIDownloadNotification registerDownloadNotificationForKey:*(void *)(*(void *)&buf[8] + 40) queue:*(void *)(a1 + 72) usingBlock:v13];

      id v15 = &v21;
    }
    else
    {
      id v16 = *(void (***)(void, void))(a1 + 88);
      if (!v16) {
        goto LABEL_9;
      }
      id v17 = *(NSObject **)(a1 + 72);
      if (!v17)
      {
        ((void (**)(void, BOOL))v16)[2](v16, v25[5] == 0);
        goto LABEL_9;
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_3;
      v18[3] = &unk_1E596A060;
      id v15 = (id *)v19;
      v19[0] = v16;
      v19[1] = &v24;
      dispatch_async(v17, v18);
    }
  }
LABEL_9:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);
}

void __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  switch([v5 type])
  {
    case 0:
    case 3:
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, [v5 progress]);
      }
      break;
    case 1:
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 100);
      }
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8) {
        (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, 0);
      }
      goto LABEL_11;
    case 2:
      uint64_t v9 = *(void *)(a1 + 40);
      if (v9)
      {
        uint64_t v10 = [v5 error];
        id v11 = +[TRIDownloadNotification generalErrorFromDownloadNotificationError:v10];
        (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v11);
      }
LABEL_11:
      +[TRIDownloadNotification deregisterNotificationWithToken:v12];
      break;
    default:
      break;
  }
}

uint64_t __121__TRIXPCNamespaceManagementClient_downloadLevelsForFactors_withNamespace_queue_factorsState_options_progress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == 0);
}

void __101__TRIXPCNamespaceManagementClient_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error___block_invoke_176(uint64_t a1, void *a2)
{
}

- (BOOL)removeLevelsForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 removeImmediately:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    os_log_type_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 342, @"Invalid parameter not satisfying: %@", @"factorNames" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 343, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    if (qword_1EB3B7790 != -1) {
      dispatch_once(&qword_1EB3B7790, &__block_literal_global_181);
    }
    if (_MergedGlobals_3)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v36 = 0x3032000000;
      uint64_t v37 = __Block_byref_object_copy_;
      char v38 = __Block_byref_object_dispose_;
      id v39 = 0;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __109__TRIXPCNamespaceManagementClient_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_error___block_invoke_187;
      v34[3] = &unk_1E5969FC0;
      v34[4] = &buf;
      id v16 = (void *)MEMORY[0x19F3AD290](v34);
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x3032000000;
      id v31 = __Block_byref_object_copy_;
      id v32 = __Block_byref_object_dispose_;
      id v33 = 0;
      id v17 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v16];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __109__TRIXPCNamespaceManagementClient_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_error___block_invoke_2;
      v27[3] = &unk_1E5969FC0;
      void v27[4] = &v28;
      [v17 removeLevelsForFactors:v13 withNamespace:v14 factorsState:v15 removeImmediately:v8 completion:v27];
      id v18 = *(void **)(*((void *)&buf + 1) + 40);
      if (v18)
      {
        if (a7)
        {
LABEL_9:
          BOOL v19 = 0;
          *a7 = v18;
LABEL_23:

          _Block_object_dispose(&v28, 8);
          _Block_object_dispose(&buf, 8);

          goto LABEL_24;
        }
      }
      else
      {
        id v18 = (void *)v29[5];
        if (!v18)
        {
          BOOL v19 = 1;
          goto LABEL_23;
        }
        if (a7) {
          goto LABEL_9;
        }
      }
      BOOL v19 = 0;
      goto LABEL_23;
    }
    id v21 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"com.apple.trial.client";
      _os_log_error_impl(&dword_19D909000, v21, OS_LOG_TYPE_ERROR, "Process is missing entitlement required for on-demand factor removal: <key>%@</key><array>...</array>", (uint8_t *)&buf, 0xCu);
    }

    if (a7)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v40 = *MEMORY[0x1E4F28568];
      v41[0] = @"Process is not entitled for on-demand factor removal.";
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
      *a7 = (id)[v22 initWithDomain:@"TRIGeneralErrorDomain" code:3 userInfo:v23];
    }
    goto LABEL_18;
  }
  unint64_t v20 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_19D909000, v20, OS_LOG_TYPE_ERROR, "unable to remove levels while device is class C locked", (uint8_t *)&buf, 2u);
  }

  if (!a7)
  {
LABEL_18:
    BOOL v19 = 0;
    goto LABEL_24;
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
  BOOL v19 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v19;
}

void __109__TRIXPCNamespaceManagementClient_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_error___block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = (void *)MEMORY[0x1E4F93B28];
  v2 = TRILogCategory_ClientFramework();
  if ([v1 hasTrueBooleanEntitlement:@"com.apple.private.security.storage.triald" logHandle:v2])
  {
    _MergedGlobals_3 = 1;
  }
  else
  {
    os_log_type_t v3 = +[TRIEntitlement objectForCurrentProcessEntitlement:@"com.apple.trial.client"];
    _MergedGlobals_3 = v3 != 0;
  }
}

void __109__TRIXPCNamespaceManagementClient_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_error___block_invoke_187(uint64_t a1, void *a2)
{
}

void __109__TRIXPCNamespaceManagementClient_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)deregisterNamespaceWithNamespaceName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 405, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)long long buf = 0;
    uint64_t v28 = buf;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy_;
    id v31 = __Block_byref_object_dispose_;
    id v32 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __78__TRIXPCNamespaceManagementClient_deregisterNamespaceWithNamespaceName_error___block_invoke;
    v26[3] = &unk_1E5969FC0;
    v26[4] = buf;
    BOOL v8 = (void *)MEMORY[0x19F3AD290](v26);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    BOOL v19 = __Block_byref_object_copy_;
    unint64_t v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    uint64_t v9 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__TRIXPCNamespaceManagementClient_deregisterNamespaceWithNamespaceName_error___block_invoke_2;
    v15[3] = &unk_1E5969FE8;
    v15[4] = &v22;
    void v15[5] = &v16;
    [v9 deregisterNamespaceWithNamespaceName:v7 completion:v15];
    uint64_t v10 = (void *)*((void *)v28 + 5);
    if (v10)
    {
      if (a4)
      {
LABEL_6:
        BOOL v11 = 0;
        *a4 = v10;
LABEL_16:

        _Block_object_dispose(&v16, 8);
        _Block_object_dispose(&v22, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v10 = (void *)v17[5];
      if (!v10)
      {
        BOOL v11 = *((unsigned char *)v23 + 24) != 0;
        goto LABEL_16;
      }
      if (a4) {
        goto LABEL_6;
      }
    }
    BOOL v11 = 0;
    goto LABEL_16;
  }
  id v12 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "unable to de-register namespace while device is class C locked", buf, 2u);
  }

  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_17:

  return v11;
}

void __78__TRIXPCNamespaceManagementClient_deregisterNamespaceWithNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
}

void __78__TRIXPCNamespaceManagementClient_deregisterNamespaceWithNamespaceName_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)setPurgeabilityLevelsForFactors:(id)a3 forNamespaceName:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 451, @"Invalid parameter not satisfying: %@", @"factorsWithPurgeabilityLevels" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 452, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)long long buf = 0;
    uint64_t v29 = buf;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy_;
    id v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __90__TRIXPCNamespaceManagementClient_setPurgeabilityLevelsForFactors_forNamespaceName_error___block_invoke;
    v27[3] = &unk_1E5969FC0;
    void v27[4] = buf;
    id v12 = (void *)MEMORY[0x19F3AD290](v27);
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy_;
    char v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    id v13 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v12];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __90__TRIXPCNamespaceManagementClient_setPurgeabilityLevelsForFactors_forNamespaceName_error___block_invoke_2;
    v20[3] = &unk_1E5969FC0;
    void v20[4] = &v21;
    [v13 setPurgeabilityLevelsForFactors:v9 forNamespaceName:v11 completion:v20];
    id v14 = (void *)*((void *)v29 + 5);
    if (v14)
    {
      if (a5)
      {
LABEL_6:
        BOOL v15 = 0;
        *a5 = v14;
LABEL_16:

        _Block_object_dispose(&v21, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_17;
      }
    }
    else
    {
      id v14 = (void *)v22[5];
      if (!v14)
      {
        BOOL v15 = 1;
        goto LABEL_16;
      }
      if (a5) {
        goto LABEL_6;
      }
    }
    BOOL v15 = 0;
    goto LABEL_16;
  }
  uint64_t v16 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19D909000, v16, OS_LOG_TYPE_ERROR, "unable to set purgeability levels while device is class C locked", buf, 2u);
  }

  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_17:

  return v15;
}

void __90__TRIXPCNamespaceManagementClient_setPurgeabilityLevelsForFactors_forNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
}

void __90__TRIXPCNamespaceManagementClient_setPurgeabilityLevelsForFactors_forNamespaceName_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)loadNamespaceMetadataForNamespaceName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 495, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)long long buf = 0;
    uint64_t v30 = buf;
    uint64_t v31 = 0x3032000000;
    id v32 = __Block_byref_object_copy_;
    id v33 = __Block_byref_object_dispose_;
    id v34 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __79__TRIXPCNamespaceManagementClient_loadNamespaceMetadataForNamespaceName_error___block_invoke;
    v28[3] = &unk_1E5969FC0;
    v28[4] = buf;
    BOOL v8 = (void *)MEMORY[0x19F3AD290](v28);
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    char v25 = __Block_byref_object_copy_;
    id v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    BOOL v19 = __Block_byref_object_copy_;
    unint64_t v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    id v9 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__TRIXPCNamespaceManagementClient_loadNamespaceMetadataForNamespaceName_error___block_invoke_2;
    v15[3] = &unk_1E596A100;
    v15[4] = &v16;
    void v15[5] = &v22;
    [v9 loadNamespaceMetadataForNamespaceName:v7 completion:v15];
    id v10 = (void *)*((void *)v30 + 5);
    if (v10)
    {
      if (a4)
      {
LABEL_6:
        id v11 = 0;
        *a4 = v10;
LABEL_16:

        _Block_object_dispose(&v16, 8);
        _Block_object_dispose(&v22, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      id v10 = (void *)v23[5];
      if (!v10)
      {
        id v11 = (id)v17[5];
        goto LABEL_16;
      }
      if (a4) {
        goto LABEL_6;
      }
    }
    id v11 = 0;
    goto LABEL_16;
  }
  id v12 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "unable to load namespace metadata while device is class C locked", buf, 2u);
  }

  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_17:

  return v11;
}

void __79__TRIXPCNamespaceManagementClient_loadNamespaceMetadataForNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
}

void __79__TRIXPCNamespaceManagementClient_loadNamespaceMetadataForNamespaceName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setProvisionalFactorPackId:(id)a3 forNamespaceName:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 540, @"Invalid parameter not satisfying: %@", @"factorPackId" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 541, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)long long buf = 0;
    id v33 = buf;
    uint64_t v34 = 0x3032000000;
    uint64_t v35 = __Block_byref_object_copy_;
    uint64_t v36 = __Block_byref_object_dispose_;
    id v37 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __85__TRIXPCNamespaceManagementClient_setProvisionalFactorPackId_forNamespaceName_error___block_invoke;
    v31[3] = &unk_1E5969FC0;
    v31[4] = buf;
    id v12 = (void *)MEMORY[0x19F3AD290](v31);
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy_;
    char v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    id v13 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v12];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__TRIXPCNamespaceManagementClient_setProvisionalFactorPackId_forNamespaceName_error___block_invoke_2;
    v20[3] = &unk_1E5969FE8;
    void v20[4] = &v27;
    void v20[5] = &v21;
    [v13 setProvisionalFactorPackId:v9 forNamespaceName:v11 completion:v20];
    id v14 = (void *)*((void *)v33 + 5);
    if (v14)
    {
      if (a5)
      {
LABEL_6:
        BOOL v15 = 0;
        *a5 = v14;
LABEL_16:

        _Block_object_dispose(&v21, 8);
        _Block_object_dispose(&v27, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      id v14 = (void *)v22[5];
      if (!v14)
      {
        BOOL v15 = *((unsigned char *)v28 + 24) != 0;
        goto LABEL_16;
      }
      if (a5) {
        goto LABEL_6;
      }
    }
    BOOL v15 = 0;
    goto LABEL_16;
  }
  uint64_t v16 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19D909000, v16, OS_LOG_TYPE_ERROR, "unable to set factor pack provisional while device is class C locked", buf, 2u);
  }

  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_17:

  return v15;
}

void __85__TRIXPCNamespaceManagementClient_setProvisionalFactorPackId_forNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
}

void __85__TRIXPCNamespaceManagementClient_setProvisionalFactorPackId_forNamespaceName_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)rejectFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 588, @"Invalid parameter not satisfying: %@", @"factorPackId" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 589, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)long long buf = 0;
    uint64_t v35 = buf;
    uint64_t v36 = 0x3032000000;
    id v37 = __Block_byref_object_copy_;
    char v38 = __Block_byref_object_dispose_;
    id v39 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __95__TRIXPCNamespaceManagementClient_rejectFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke;
    v33[3] = &unk_1E5969FC0;
    v33[4] = buf;
    id v14 = (void *)MEMORY[0x19F3AD290](v33);
    uint64_t v29 = 0;
    char v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy_;
    uint64_t v27 = __Block_byref_object_dispose_;
    id v28 = 0;
    BOOL v15 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v14];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95__TRIXPCNamespaceManagementClient_rejectFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2;
    v22[3] = &unk_1E5969FE8;
    v22[4] = &v29;
    v22[5] = &v23;
    [v15 rejectFactorPackId:v11 forNamespaceName:v12 rolloutDeployment:v13 completion:v22];
    uint64_t v16 = (void *)*((void *)v35 + 5);
    if (v16)
    {
      if (a6)
      {
LABEL_6:
        BOOL v17 = 0;
        *a6 = v16;
LABEL_16:

        _Block_object_dispose(&v23, 8);
        _Block_object_dispose(&v29, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v16 = (void *)v24[5];
      if (!v16)
      {
        BOOL v17 = *((unsigned char *)v30 + 24) != 0;
        goto LABEL_16;
      }
      if (a6) {
        goto LABEL_6;
      }
    }
    BOOL v17 = 0;
    goto LABEL_16;
  }
  uint64_t v18 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19D909000, v18, OS_LOG_TYPE_ERROR, "unable to reject factor pack provisional while device is class C locked", buf, 2u);
  }

  if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_17:

  return v17;
}

void __95__TRIXPCNamespaceManagementClient_rejectFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke(uint64_t a1, void *a2)
{
}

void __95__TRIXPCNamespaceManagementClient_rejectFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)promoteFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 637, @"Invalid parameter not satisfying: %@", @"factorPackId" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 638, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)long long buf = 0;
    uint64_t v35 = buf;
    uint64_t v36 = 0x3032000000;
    id v37 = __Block_byref_object_copy_;
    char v38 = __Block_byref_object_dispose_;
    id v39 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __96__TRIXPCNamespaceManagementClient_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke;
    v33[3] = &unk_1E5969FC0;
    v33[4] = buf;
    id v14 = (void *)MEMORY[0x19F3AD290](v33);
    uint64_t v29 = 0;
    char v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy_;
    uint64_t v27 = __Block_byref_object_dispose_;
    id v28 = 0;
    BOOL v15 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v14];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __96__TRIXPCNamespaceManagementClient_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2;
    v22[3] = &unk_1E5969FE8;
    v22[4] = &v29;
    v22[5] = &v23;
    [v15 promoteFactorPackId:v11 forNamespaceName:v12 rolloutDeployment:v13 completion:v22];
    uint64_t v16 = (void *)*((void *)v35 + 5);
    if (v16)
    {
      if (a6)
      {
LABEL_6:
        BOOL v17 = 0;
        *a6 = v16;
LABEL_16:

        _Block_object_dispose(&v23, 8);
        _Block_object_dispose(&v29, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v16 = (void *)v24[5];
      if (!v16)
      {
        BOOL v17 = *((unsigned char *)v30 + 24) != 0;
        goto LABEL_16;
      }
      if (a6) {
        goto LABEL_6;
      }
    }
    BOOL v17 = 0;
    goto LABEL_16;
  }
  uint64_t v18 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19D909000, v18, OS_LOG_TYPE_ERROR, "unable to promote factor pack while device is class C locked", buf, 2u);
  }

  if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_17:

  return v17;
}

void __96__TRIXPCNamespaceManagementClient_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke(uint64_t a1, void *a2)
{
}

void __96__TRIXPCNamespaceManagementClient_promoteFactorPackId_forNamespaceName_rolloutDeployment_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (unint64_t)statusOfDownloadForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 notificationKey:(id *)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 687, @"Invalid parameter not satisfying: %@", @"factorNames" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"TRIXPCClient.m", 688, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)long long buf = 0;
    id v44 = buf;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy_;
    v47 = __Block_byref_object_dispose_;
    id v48 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __111__TRIXPCNamespaceManagementClient_statusOfDownloadForFactors_withNamespace_factorsState_notificationKey_error___block_invoke;
    v42[3] = &unk_1E5969FC0;
    v42[4] = buf;
    uint64_t v16 = (void *)MEMORY[0x19F3AD290](v42);
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000;
    uint64_t v35 = __Block_byref_object_copy_;
    uint64_t v36 = __Block_byref_object_dispose_;
    id v37 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy_;
    char v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    BOOL v17 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v16];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __111__TRIXPCNamespaceManagementClient_statusOfDownloadForFactors_withNamespace_factorsState_notificationKey_error___block_invoke_2;
    v25[3] = &unk_1E596A128;
    v25[4] = &v38;
    v25[5] = &v32;
    void v25[6] = &v26;
    [v17 statusOfDownloadForFactors:v13 withNamespace:v14 factorsState:v15 completion:v25];
    uint64_t v18 = (void *)*((void *)v44 + 5);
    if (v18 || (uint64_t v18 = (void *)v27[5]) != 0)
    {
      if (a7)
      {
        objc_storeStrong(a7, v18);
        a7 = 0;
      }
    }
    else
    {
      if (a6) {
        objc_storeStrong(a6, (id)v33[5]);
      }
      a7 = (id *)v39[3];
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v19 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19D909000, v19, OS_LOG_TYPE_DEFAULT, "device is class C locked - download status cannot be determined", buf, 2u);
    }

    if (a7)
    {
      unint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
      id v21 = *a7;
      *a7 = v20;

      a7 = 0;
    }
  }

  return (unint64_t)a7;
}

void __111__TRIXPCNamespaceManagementClient_statusOfDownloadForFactors_withNamespace_factorsState_notificationKey_error___block_invoke(uint64_t a1, void *a2)
{
}

void __111__TRIXPCNamespaceManagementClient_statusOfDownloadForFactors_withNamespace_factorsState_notificationKey_error___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

- (id)activeRolloutInformation:(id *)a3
{
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)long long buf = 0;
    uint64_t v26 = buf;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy_;
    uint64_t v29 = __Block_byref_object_dispose_;
    id v30 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__TRIXPCNamespaceManagementClient_activeRolloutInformation___block_invoke;
    v24[3] = &unk_1E5969FC0;
    v24[4] = buf;
    id v5 = (void *)MEMORY[0x19F3AD290](v24);
    uint64_t v18 = 0;
    BOOL v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = __Block_byref_object_copy_;
    uint64_t v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy_;
    uint64_t v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    id v6 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__TRIXPCNamespaceManagementClient_activeRolloutInformation___block_invoke_2;
    v11[3] = &unk_1E596A150;
    v11[4] = &v18;
    v11[5] = &v12;
    [v6 activeRolloutInformationWithPrivacyFilterPolicy:1 completion:v11];
    id v7 = (void *)*((void *)v26 + 5);
    if (v7)
    {
      if (a3)
      {
LABEL_4:
        id v8 = 0;
        *a3 = v7;
LABEL_14:

        _Block_object_dispose(&v12, 8);
        _Block_object_dispose(&v18, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_15;
      }
    }
    else
    {
      id v7 = (void *)v13[5];
      if (!v7)
      {
        id v8 = (id)v19[5];
        goto LABEL_14;
      }
      if (a3) {
        goto LABEL_4;
      }
    }
    id v8 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "device is class C locked - cannot fetch rollout information", buf, 2u);
  }

  if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    id v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
LABEL_15:
  return v8;
}

void __60__TRIXPCNamespaceManagementClient_activeRolloutInformation___block_invoke(uint64_t a1, void *a2)
{
}

void __60__TRIXPCNamespaceManagementClient_activeRolloutInformation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)logSystemCovariatesWithError:(id *)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__TRIXPCNamespaceManagementClient_logSystemCovariatesWithError___block_invoke;
  v9[3] = &unk_1E5969FC0;
  v9[4] = &v10;
  id v5 = (void *)MEMORY[0x19F3AD290](v9, a2);
  id v6 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v5];
  [v6 logSystemCovariates];
  if (a3)
  {
    uint64_t v7 = (void *)v11[5];
    if (v7) {
      objc_storeStrong(a3, v7);
    }
  }

  _Block_object_dispose(&v10, 8);
  return a3 == 0;
}

void __64__TRIXPCNamespaceManagementClient_logSystemCovariatesWithError___block_invoke(uint64_t a1, void *a2)
{
}

- (id)getSandboxExtensionTokensForIdentifierQueryWithError:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __88__TRIXPCNamespaceManagementClient_getSandboxExtensionTokensForIdentifierQueryWithError___block_invoke;
  v24[3] = &unk_1E5969FC0;
  v24[4] = &v25;
  id v5 = (void *)MEMORY[0x19F3AD290](v24, a2);
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v6 = [(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__TRIXPCNamespaceManagementClient_getSandboxExtensionTokensForIdentifierQueryWithError___block_invoke_2;
  v11[3] = &unk_1E596A150;
  v11[4] = &v18;
  v11[5] = &v12;
  [v6 getSandboxExtensionTokensForIdentifierQueryWithCompletion:v11];
  uint64_t v7 = (void *)v26[5];
  if (v7 || (uint64_t v7 = (void *)v13[5]) != 0)
  {
    if (a3) {
      *a3 = v7;
    }
    id v8 = (id)objc_opt_new();
  }
  else
  {
    id v8 = (id)v19[5];
  }
  uint64_t v9 = v8;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v25, 8);
  return v9;
}

void __88__TRIXPCNamespaceManagementClient_getSandboxExtensionTokensForIdentifierQueryWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __88__TRIXPCNamespaceManagementClient_getSandboxExtensionTokensForIdentifierQueryWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)getOnDemandReferenceCountsPerUserAtGlobalPath:(id)a3 error:(id *)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"On-demand reference counts are not available on non-macOS platforms.";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    *a4 = (id)[v5 initWithDomain:@"TRIGeneralErrorDomain" code:17 userInfo:v6];
  }
  return 0;
}

@end