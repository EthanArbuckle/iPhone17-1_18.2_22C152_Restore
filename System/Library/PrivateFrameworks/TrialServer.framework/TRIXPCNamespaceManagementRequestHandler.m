@interface TRIXPCNamespaceManagementRequestHandler
+ (id)_deploymentsWithUnexpectedExperimentDataInContainer:(id)a3 dynamicNamespaceName:(id)a4 serverContext:(id)a5;
+ (id)_notificationKeyWithNamespace:(id)a3 assetIndexesByTreatment:(id)a4 assetIdsByFactorPack:(id)a5;
+ (void)_immediateDownloadForNamespaceNames:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 taskQueue:(id)a6 allowExpensiveNetworking:(BOOL)a7 taskAttribution:(id)a8 completion:(id)a9;
+ (void)_promoteFactorPackId:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 forNamespaceName:(id)a6 rolloutDeployment:(id)a7 completion:(id)a8;
+ (void)_purgeMismatchedDataForDynamicNamespaceName:(id)a3 appContainer:(id)a4 serverContext:(id)a5;
+ (void)_rejectFactorPackId:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 forNamespaceName:(id)a6 rolloutDeployment:(id)a7 completion:(id)a8;
+ (void)_removeAssetFactors:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 taskQueue:(id)a6 namespace:(id)a7 factorsState:(id)a8 removeImmediately:(BOOL)a9 completion:(id)a10;
+ (void)_reregisterOneShotXPCActivityWithDescriptor:(id)a3 resumingTaskQueue:(id)a4;
+ (void)_resumeTaskQueueForDiscretionaryCellularWithQueue:(id)a3;
+ (void)_resumeTaskQueueForDiscretionaryWifiWithQueue:(id)a3;
+ (void)_setProvisionalFactorPackId:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 forNamespaceName:(id)a6 completion:(id)a7;
+ (void)_startDownloadAssetIndexesByTreatment:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 taskQueue:(id)a6 experimentIds:(id)a7 assetIdsByFactorPack:(id)a8 rolloutFactorNames:(id)a9 rolloutDeployments:(id)a10 namespace:(id)a11 taskAttribution:(id)a12 factorsState:(id)a13 notificationKey:(id)a14;
+ (void)resumeTaskQueue:(id)a3 forNetworkOptions:(id)a4;
+ (void)usingServerContext:(id)a3 deregisterNamespaceWithName:(id)a4 teamId:(id)a5 taskQueue:(id)a6 completion:(id)a7;
+ (void)usingServerContext:(id)a3 registerNamespaceWithNamespaceName:(id)a4 compatibilityVersion:(unsigned int)a5 defaultsFileURL:(id)a6 teamId:(id)a7 appContainerId:(id)a8 appContainerType:(int64_t)a9 cloudKitContainerId:(int)a10 bundleId:(id)a11 completion:(id)a12;
+ (void)usingServerContext:(id)a3 taskQueue:(id)a4 startDownloadNamespaceWithName:(id)a5 attribution:(id)a6 completion:(id)a7;
- (BOOL)_validateNamespaceName:(id)a3 error:(id *)a4;
- (BOOL)_validateSetPurgeabilityLevelRequestUsingFactorProviderChain:(id)a3 paths:(id)a4 purgeabilityLevelsForFactors:(id)a5 error:(id *)a6;
- (TRIXPCNamespaceManagementRequestHandler)initWithServerContextPromise:(id)a3 auditToken:(id *)a4;
- (id)_factorProviderChainForNamespace:(id)a3 paths:(id)a4;
- (int)_namespacePurgeabilityLevelForNamespaceName:(id)a3 paths:(id)a4;
- (void)_loadNamespaceMetadataForNamespace:(id)a3 usingEntitlementWitness:(id)a4 withPaths:(id)a5 completion:(id)a6;
- (void)_setPurgeabilityLevelsForFactors:(id)a3 usingEntitlementWitness:(id)a4 namespace:(id)a5 paths:(id)a6 completion:(id)a7;
- (void)deregisterNamespaceWithNamespaceName:(id)a3 completion:(id)a4;
- (void)getSandboxExtensionTokensForIdentifierQueryWithCompletion:(id)a3;
- (void)immediateDownloadForNamespaceNames:(id)a3 allowExpensiveNetworking:(BOOL)a4 completion:(id)a5;
- (void)loadNamespaceMetadataForNamespaceName:(id)a3 completion:(id)a4;
- (void)promoteFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 completion:(id)a6;
- (void)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 applicationGroup:(id)a6 cloudKitContainerId:(int)a7 completion:(id)a8;
- (void)rejectFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 completion:(id)a6;
- (void)removeLevelsForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 removeImmediately:(BOOL)a6 completion:(id)a7;
- (void)runBlockWhenServerAvailable:(id)a3;
- (void)setProvisionalFactorPackId:(id)a3 forNamespaceName:(id)a4 completion:(id)a5;
- (void)setPurgeabilityLevelsForFactors:(id)a3 forNamespaceName:(id)a4 completion:(id)a5;
- (void)startDownloadLevelsForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 options:(id)a6 completion:(id)a7;
- (void)startDownloadNamespaceWithName:(id)a3 options:(id)a4 completion:(id)a5;
- (void)statusOfDownloadForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 completion:(id)a6;
@end

@implementation TRIXPCNamespaceManagementRequestHandler

- (TRIXPCNamespaceManagementRequestHandler)initWithServerContextPromise:(id)a3 auditToken:(id *)a4
{
  id v8 = a3;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIXPCNamespaceManagementService.m", 96, @"Invalid parameter not satisfying: %@", @"serverContextPromise" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)TRIXPCNamespaceManagementRequestHandler;
  v9 = [(TRIXPCNamespaceManagementRequestHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serverContextPromise, a3);
    long long v11 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v10->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v10->_auditToken.val[4] = v11;
  }

  return v10;
}

- (void)runBlockWhenServerAvailable:(id)a3
{
}

- (void)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 applicationGroup:(id)a6 cloudKitContainerId:(int)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke;
  v90[3] = &unk_1E6BBCA38;
  v90[4] = self;
  id v18 = v14;
  id v91 = v18;
  unsigned int v63 = a4;
  unsigned int v94 = a4;
  id v19 = v15;
  id v92 = v19;
  id v20 = v16;
  id v93 = v20;
  int v64 = a7;
  int v95 = a7;
  v21 = (void (**)(void, void))MEMORY[0x1E016EA80](v90);
  v21[2](v21, 0);
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x2020000000;
  char v89 = 0;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_91;
  v83[3] = &unk_1E6BBCA60;
  v85 = &v86;
  v66 = v21;
  id v84 = v66;
  v22 = (void (**)(void))MEMORY[0x1E016EA80](v83);
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_2;
  v80[3] = &unk_1E6BB91B8;
  id v23 = v17;
  id v82 = v23;
  id v24 = v18;
  id v81 = v24;
  uint64_t v25 = MEMORY[0x1E016EA80](v80);
  v26 = (void (**)(void, void, void))v25;
  if (!v24)
  {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v25 + 16))(v25, 2, @"Namespace name must not be nil.");
    goto LABEL_34;
  }
  long long v27 = *(_OWORD *)&self->_auditToken.val[4];
  long long v78 = *(_OWORD *)self->_auditToken.val;
  long long v79 = v27;
  v65 = [MEMORY[0x1E4FB00E0] applicationBundleIdentifierWithAuditToken:&v78];
  if (v65)
  {
    p_auditToken = &self->_auditToken;
    if (v20)
    {
      long long v29 = *(_OWORD *)&self->_auditToken.val[4];
      long long v78 = *(_OWORD *)p_auditToken->val;
      long long v79 = v29;
      if ([MEMORY[0x1E4FB00E0] isEntitledToApplicationGroup:v20 withAuditToken:&v78])
      {
        id v58 = v20;
        uint64_t v30 = 3;
LABEL_10:
        uint64_t v57 = v30;
        if (!v19 || ![v19 isFileURL]) {
          goto LABEL_28;
        }
        long long v32 = *(_OWORD *)&self->_auditToken.val[4];
        long long v78 = *(_OWORD *)p_auditToken->val;
        long long v79 = v32;
        uint64_t v33 = [MEMORY[0x1E4FB00E0] codeSignIdentifierWithAuditToken:&v78];
        v54 = (void *)v33;
        if (v33)
        {
          v56 = [MEMORY[0x1E4FB0060] containerWithIdentifier:v33 type:1];
          v55 = [v56 containerURL];
        }
        else
        {
          v55 = 0;
          v56 = 0;
        }
        v34 = [v19 relativePath];
        int v35 = [v34 isAbsolutePath];

        if (v35)
        {
          v36 = [v55 relativePath];
          if (!v36) {
            goto LABEL_27;
          }
          v60 = [v19 relativePath];
          v37 = [v55 relativePath];
          int v51 = [v60 hasPrefix:v37];

          if (!v51) {
            goto LABEL_27;
          }
          v38 = [MEMORY[0x1E4F28CB8] defaultManager];
          v52 = [v19 relativePath];
          v39 = [v55 relativePath];
          v61 = [v38 triPath:v52 relativeToParentPath:v39];

          v40 = (void *)MEMORY[0x1E4F1CB10];
          v53 = [v56 identifier];
          uint64_t v41 = objc_msgSend(v40, "triContainerURLWithPath:containerId:containerType:", v61, v53, objc_msgSend(v56, "type"));

          if (v41)
          {

LABEL_26:
            id v19 = (id)v41;
LABEL_27:

LABEL_28:
            long long v43 = *(_OWORD *)&self->_auditToken.val[4];
            long long v78 = *(_OWORD *)p_auditToken->val;
            long long v79 = v43;
            v44 = [MEMORY[0x1E4FB00E0] teamIdWithAuditToken:&v78];
            if (!v44)
            {
              ((void (**)(void, uint64_t, __CFString *))v26)[2](v26, 3, @"Unable to determine teamId for calling process.");
              id v45 = 0;
              goto LABEL_32;
            }
            v67[0] = MEMORY[0x1E4F143A8];
            v67[1] = 3221225472;
            v67[2] = __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_128;
            v67[3] = &unk_1E6BBCA88;
            v73 = v66;
            id v74 = v23;
            v67[4] = self;
            id v68 = v24;
            unsigned int v76 = v63;
            id v19 = v19;
            id v69 = v19;
            id v45 = v44;
            id v70 = v45;
            id v71 = v58;
            uint64_t v75 = v57;
            int v77 = v64;
            id v72 = v65;
            v46 = (void *)MEMORY[0x1E016EA80](v67);
            [(TRIXPCNamespaceManagementRequestHandler *)self runBlockWhenServerAvailable:v46];
            *((unsigned char *)v87 + 24) = 1;

            v47 = v73;
LABEL_30:

LABEL_32:
            goto LABEL_33;
          }
          v49 = [NSString stringWithFormat:@"Unable to process defaults with path %@", v61];
          ((void (**)(void, uint64_t, void *))v26)[2](v26, 2, v49);

          v48 = v61;
        }
        else
        {
          if (!v56)
          {
            ((void (**)(void, uint64_t, __CFString *))v26)[2](v26, 1, @"Unable to determine app container for calling process.");
LABEL_41:

            id v45 = v54;
            v47 = v56;
            goto LABEL_30;
          }
          v38 = [v19 relativePath];
          if (!v38)
          {
            v50 = [MEMORY[0x1E4F28B00] currentHandler];
            [v50 handleFailureInMethod:a2, self, @"TRIXPCNamespaceManagementService.m", 192, @"Invalid parameter not satisfying: %@", @"relativePath" object file lineNumber description];
          }
          v42 = (void *)MEMORY[0x1E4F1CB10];
          v62 = [v56 identifier];
          uint64_t v41 = objc_msgSend(v42, "triContainerURLWithPath:containerId:containerType:", v38, v62, objc_msgSend(v56, "type"));

          if (v41) {
            goto LABEL_26;
          }
          v48 = [NSString stringWithFormat:@"Unable to process defaults with URL %@", 0];
          ((void (**)(void, uint64_t, void *))v26)[2](v26, 2, v48);
        }

        id v19 = 0;
        goto LABEL_41;
      }
      ((void (**)(void, uint64_t, __CFString *))v26)[2](v26, 3, @"Calling process not entitled to specified application group.");
    }
    else
    {
      long long v31 = *(_OWORD *)&self->_auditToken.val[4];
      long long v78 = *(_OWORD *)p_auditToken->val;
      long long v79 = v31;
      id v58 = [MEMORY[0x1E4FB00E0] codeSignIdentifierWithAuditToken:&v78];
      if (v58)
      {
        uint64_t v30 = 2;
        goto LABEL_10;
      }
      ((void (**)(void, uint64_t, __CFString *))v26)[2](v26, 3, @"Unable to determine code sign identifier for calling process.");
    }
  }
  else
  {
    ((void (**)(void, uint64_t, __CFString *))v26)[2](v26, 2, @"Invalid application bundle identifier provided");
  }
LABEL_33:

LABEL_34:
  if (v22) {
    v22[2](v22);
  }

  _Block_object_dispose(&v86, 8);
}

void __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (a2) {
      v7 = "end";
    }
    else {
      v7 = "begin";
    }
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = TRILoggedNamespaceName(*(void **)(a1 + 40));
    int v10 = *(_DWORD *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    v13 = TRICloudKitSupport_Container_EnumDescriptor();
    id v14 = [v13 enumNameForValue:*(unsigned int *)(a1 + 68)];
    *(_DWORD *)buf = 67111170;
    int v17 = v15;
    __int16 v18 = 2114;
    id v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    __int16 v22 = 2080;
    id v23 = v7;
    __int16 v24 = 2114;
    uint64_t v25 = v9;
    __int16 v26 = 1024;
    int v27 = v10;
    __int16 v28 = 2112;
    uint64_t v29 = v12;
    __int16 v30 = 2112;
    uint64_t v31 = v11;
    __int16 v32 = 2112;
    uint64_t v33 = v14;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s registerNamespaceWithNamespaceName:%{public}@ compatibilityVersion:%u defaultsFileURL:%@ applicationGroup:%@ cloudKitContainerId:%@ completion:", buf, 0x54u);
  }
}

uint64_t __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_91(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = TRILoggedNamespaceName(*(void **)(a1 + 32));
      *(_DWORD *)buf = 138543618;
      id v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to register namespace %{public}@: %{public}@", buf, 0x16u);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F28568];
    id v12 = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_2_129;
  v12[3] = &unk_1E6BB8F60;
  id v13 = *(id *)(a1 + 80);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v12);
  if (v5 && v6)
  {
    uint64_t v8 = objc_opt_class();
    LODWORD(v11) = *(_DWORD *)(a1 + 108);
    [v8 usingServerContext:v5 registerNamespaceWithNamespaceName:*(void *)(a1 + 40) compatibilityVersion:*(unsigned int *)(a1 + 104) defaultsFileURL:*(void *)(a1 + 48) teamId:*(void *)(a1 + 56) appContainerId:*(void *)(a1 + 64) appContainerType:*(void *)(a1 + 96) cloudKitContainerId:v11 bundleId:*(void *)(a1 + 72) completion:*(void *)(a1 + 88)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 88);
    if (v9)
    {
      int v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
  }
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __163__TRIXPCNamespaceManagementRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_applicationGroup_cloudKitContainerId_completion___block_invoke_2_129(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deregisterNamespaceWithNamespaceName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke;
  v35[3] = &unk_1E6BB9140;
  v35[4] = self;
  id v8 = v6;
  id v36 = v8;
  uint64_t v9 = (void (**)(void, void))MEMORY[0x1E016EA80](v35);
  v9[2](v9, 0);
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_131;
  v28[3] = &unk_1E6BBCA60;
  __int16 v30 = &v31;
  int v10 = v9;
  id v29 = v10;
  uint64_t v11 = (void (**)(void))MEMORY[0x1E016EA80](v28);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_2;
  v25[3] = &unk_1E6BBCAB0;
  id v12 = v8;
  id v26 = v12;
  id v13 = v7;
  id v27 = v13;
  uint64_t v14 = MEMORY[0x1E016EA80](v25);
  __int16 v15 = (void (**)(void, void, void))v14;
  if (v12)
  {
    long long v16 = *(_OWORD *)&self->_auditToken.val[4];
    v24[0] = *(_OWORD *)self->_auditToken.val;
    v24[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4FB00E0] teamIdWithAuditToken:v24];
    if (v17)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_132;
      v19[3] = &unk_1E6BB9230;
      __int16 v22 = v10;
      id v23 = v13;
      v19[4] = self;
      id v20 = v12;
      id v21 = v17;
      __int16 v18 = (void *)MEMORY[0x1E016EA80](v19);
      [(TRIXPCNamespaceManagementRequestHandler *)self runBlockWhenServerAvailable:v18];
      *((unsigned char *)v32 + 24) = 1;
    }
    else
    {
      ((void (**)(void, uint64_t, __CFString *))v15)[2](v15, 3, @"Unable to determine teamId for calling process.");
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v14 + 16))(v14, 2, @"Namespace name must not be nil.");
  }

  if (v11) {
    v11[2](v11);
  }

  _Block_object_dispose(&v31, 8);
}

void __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (a2) {
      id v8 = "end";
    }
    else {
      id v8 = "begin";
    }
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = TRILoggedNamespaceName(*(void **)(a1 + 40));
    v11[0] = 67110146;
    v11[1] = v5;
    __int16 v12 = 2114;
    id v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    id v19 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s deregisterNamespaceWithNamespaceName:%{public}@ completion:", (uint8_t *)v11, 0x30u);
  }
}

uint64_t __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_131(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = TRILoggedNamespaceName(*(void **)(a1 + 32));
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to deregister namespace %{public}@: %{public}@", buf, 0x16u);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v13 = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v9);
  }
}

void __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_2_133;
  v10[3] = &unk_1E6BB8F60;
  id v11 = *(id *)(a1 + 56);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v10);
  if (v5 && v6)
  {
    [(id)objc_opt_class() usingServerContext:v5 deregisterNamespaceWithName:*(void *)(a1 + 40) teamId:*(void *)(a1 + 48) taskQueue:v6 completion:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 64);
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
  }
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __91__TRIXPCNamespaceManagementRequestHandler_deregisterNamespaceWithNamespaceName_completion___block_invoke_2_133(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startDownloadNamespaceWithName:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke;
  v47[3] = &unk_1E6BB9078;
  v47[4] = self;
  id v11 = v8;
  id v48 = v11;
  id v12 = v9;
  id v49 = v12;
  id v13 = (void (**)(void, void))MEMORY[0x1E016EA80](v47);
  v13[2](v13, 0);
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_134;
  v40[3] = &unk_1E6BBCA60;
  v42 = &v43;
  __int16 v14 = v13;
  id v41 = v14;
  uint64_t v15 = (void (**)(void))MEMORY[0x1E016EA80](v40);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_2;
  v37[3] = &unk_1E6BBCAB0;
  id v16 = v11;
  id v38 = v16;
  id v17 = v10;
  id v39 = v17;
  uint64_t v18 = MEMORY[0x1E016EA80](v37);
  id v19 = (void (**)(void, void, void))v18;
  if (v16)
  {
    if ([MEMORY[0x1E4FB0280] validateSafeASCIISubsetIdentifier:v16])
    {
      long long v20 = *(_OWORD *)&self->_auditToken.val[4];
      long long v35 = *(_OWORD *)self->_auditToken.val;
      long long v36 = v20;
      id v21 = [MEMORY[0x1E4FB00E0] applicationBundleIdentifierWithAuditToken:&v35];
      if (v21)
      {
        if ([MEMORY[0x1E4FB0280] validateSafeASCIISubsetIdentifier:v21])
        {
          long long v22 = *(_OWORD *)&self->_auditToken.val[4];
          long long v35 = *(_OWORD *)self->_auditToken.val;
          long long v36 = v22;
          id v23 = [MEMORY[0x1E4FB00E0] teamIdWithAuditToken:&v35];
          if (v23)
          {
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_148;
            v26[3] = &unk_1E6BBCB20;
            __int16 v32 = v14;
            id v33 = v17;
            id v27 = v16;
            char v34 = v19;
            id v24 = v23;
            id v28 = v24;
            id v29 = v21;
            id v30 = v12;
            uint64_t v31 = self;
            uint64_t v25 = (void *)MEMORY[0x1E016EA80](v26);
            [(TRIXPCNamespaceManagementRequestHandler *)self runBlockWhenServerAvailable:v25];
            *((unsigned char *)v44 + 24) = 1;
          }
          else
          {
            ((void (**)(void, uint64_t, __CFString *))v19)[2](v19, 3, @"Unable to determine teamId for calling process.");
            id v24 = 0;
          }
        }
        else
        {
          id v24 = (id)[[NSString alloc] initWithFormat:@"appContainerId(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)", v21];
          ((void (**)(void, uint64_t, id))v19)[2](v19, 2, v24);
        }
      }
      else
      {
        ((void (**)(void, uint64_t, __CFString *))v19)[2](v19, 3, @"Unable to determine applicationBundleId for calling process.");
        id v21 = 0;
      }
    }
    else
    {
      id v21 = (void *)[[NSString alloc] initWithFormat:@"namespaceName(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)", v16];
      ((void (**)(void, uint64_t, void *))v19)[2](v19, 2, v21);
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v18 + 16))(v18, 2, @"Namespace name must be non-nil.");
  }

  if (v15) {
    v15[2](v15);
  }

  _Block_object_dispose(&v43, 8);
}

void __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1[4] + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    id v9 = "end";
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    if (!a2) {
      id v9 = "begin";
    }
    v13[0] = 67110402;
    v13[1] = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    __int16 v18 = 2080;
    id v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s startDownloadNamespaceWithName:%{public}@ options:%{public}@ completion:", (uint8_t *)v13, 0x3Au);
  }
}

uint64_t __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_134(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to start download of namespace %{public}@: %{public}@", buf, 0x16u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v13 = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v9);
  }
}

void __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_148(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_2_149;
  v18[3] = &unk_1E6BB8F60;
  id v19 = *(id *)(a1 + 72);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v18);
  if (v5 && v6)
  {
    id v8 = [v5 namespaceDatabase];
    id v9 = [v8 dynamicNamespaceRecordWithNamespaceName:*(void *)(a1 + 32)];

    if (v9)
    {
      id v17 = [TRITaskAttributionInternalInsecure alloc];
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = [v9 cloudKitContainer];
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v12 = *(void **)(a1 + 56);
      __int16 v14 = v12;
      if (!v12)
      {
        __int16 v14 = [MEMORY[0x1E4FB00D8] inexpensiveOptions];
      }
      uint64_t v15 = [(TRITaskAttributionInternalInsecure *)v17 initWithTeamIdentifier:v10 triCloudKitContainer:v11 applicationBundleIdentifier:v13 networkOptions:v14];
      if (!v12) {

      }
      [(id)objc_opt_class() usingServerContext:v5 taskQueue:v6 startDownloadNamespaceWithName:*(void *)(a1 + 32) attribution:v15 completion:*(void *)(a1 + 80)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
      id v9 = 0;
    }
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 80);
    if (!v16) {
      goto LABEL_13;
    }
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v9);
  }

LABEL_13:
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __93__TRIXPCNamespaceManagementRequestHandler_startDownloadNamespaceWithName_options_completion___block_invoke_2_149(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_notificationKeyWithNamespace:(id)a3 assetIndexesByTreatment:(id)a4 assetIdsByFactorPack:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v7 = a4;
  id v45 = a5;
  context = (void *)MEMORY[0x1E016E7F0]();
  id v8 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v44 = v7;
  id v9 = [v7 allKeys];
  uint64_t v10 = [v9 sortedArrayUsingSelector:sel_compare_];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v57 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        [v8 addObject:v15];
        uint64_t v16 = [v44 objectForKeyedSubscript:v15];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __118__TRIXPCNamespaceManagementRequestHandler__notificationKeyWithNamespace_assetIndexesByTreatment_assetIdsByFactorPack___block_invoke;
        v54[3] = &unk_1E6BBAF10;
        id v55 = v8;
        [v16 enumerateIndexesUsingBlock:v54];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v12);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v17 = [v45 allKeys];
  uint64_t v18 = [v17 sortedArrayUsingSelector:sel_compare_];

  obuint64_t j = v18;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8 * j);
        uint64_t v24 = (void *)MEMORY[0x1E016E7F0]([v8 addObject:v23]);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v25 = [v45 objectForKeyedSubscript:v23];
        id v26 = [v25 allObjects];
        id v27 = [v26 sortedArrayUsingComparator:&__block_literal_global_22];

        uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v60 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v47;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v47 != v30) {
                objc_enumerationMutation(v27);
              }
              __int16 v32 = [*(id *)(*((void *)&v46 + 1) + 8 * k) assetId];
              [v8 addObject:v32];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v60 count:16];
          }
          while (v29);
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v20);
  }

  id v33 = [NSString triHashStrings:v8 withDataSalt:0];
  id v34 = [NSString alloc];
  unint64_t v35 = [v33 length];
  if (v35 >= 8) {
    uint64_t v36 = 8;
  }
  else {
    uint64_t v36 = v35;
  }
  v37 = objc_msgSend(v33, "subdataWithRange:", 0, v36);
  id v38 = [v37 triHexlify];
  id v39 = (void *)[v34 initWithFormat:@"%@.%@", v42, v38];

  return v39;
}

void __118__TRIXPCNamespaceManagementRequestHandler__notificationKeyWithNamespace_assetIndexesByTreatment_assetIdsByFactorPack___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%tu", a2);
  [v2 addObject:v3];
}

uint64_t __118__TRIXPCNamespaceManagementRequestHandler__notificationKeyWithNamespace_assetIndexesByTreatment_assetIdsByFactorPack___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 assetId];
  id v6 = [v4 assetId];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)startDownloadLevelsForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke;
  v55[3] = &unk_1E6BBCAF8;
  v55[4] = self;
  id v35 = v12;
  id v56 = v35;
  id v36 = v13;
  id v57 = v36;
  id v17 = v14;
  id v58 = v17;
  id v18 = v15;
  id v59 = v18;
  uint64_t v19 = (void (**)(void, void))MEMORY[0x1E016EA80](v55);
  v19[2](v19, 0);
  uint64_t v51 = 0;
  long long v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_166;
  v48[3] = &unk_1E6BBCA60;
  long long v50 = &v51;
  uint64_t v20 = v19;
  id v49 = v20;
  uint64_t v21 = (void (**)(void))MEMORY[0x1E016EA80](v48);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_2;
  v46[3] = &unk_1E6BB8FD8;
  id v22 = v16;
  id v47 = v22;
  uint64_t v23 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v46);
  uint64_t v24 = (void *)MEMORY[0x1E4F93B28];
  uint64_t v25 = TRILogCategory_Server();
  uint64_t v26 = *MEMORY[0x1E4FB0500];
  long long v27 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v27;
  if ([v24 taskWithAuditToken:buf hasTrueBooleanEntitlement:v26 logHandle:v25])
  {

LABEL_4:
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_171;
    v37[3] = &unk_1E6BBCB20;
    uint64_t v43 = v20;
    id v44 = v22;
    id v38 = v35;
    id v39 = v36;
    id v40 = v17;
    id v41 = self;
    id v45 = v23;
    id v42 = v18;
    __int16 v32 = (void *)MEMORY[0x1E016EA80](v37);
    [(TRIXPCNamespaceManagementRequestHandler *)self runBlockWhenServerAvailable:v32];
    *((unsigned char *)v52 + 24) = 1;

    id v33 = v43;
    goto LABEL_5;
  }
  uint64_t v28 = *MEMORY[0x1E4FB0510];
  long long v29 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v29;
  uint64_t v30 = objc_msgSend(MEMORY[0x1E4FB00E0], "objectForEntitlement:withAuditToken:", v28, buf, v35, v36);
  BOOL v31 = v30 == 0;

  if (!v31) {
    goto LABEL_4;
  }
  ((void (**)(void, uint64_t, __CFString *))v23)[2](v23, 3, @"Calling process is not entitled to request on-demand factors.");
  id v33 = TRILogCategory_Server();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    unsigned int v34 = self->_auditToken.val[5];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v34;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v28;
    _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required for on-demand factor download: %@", buf, 0x12u);
  }
LABEL_5:

  if (v21) {
    v21[2](v21);
  }

  _Block_object_dispose(&v51, 8);
}

void __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1[4] + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    id v9 = "end";
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    if (!a2) {
      id v9 = "begin";
    }
    uint64_t v12 = a1[6];
    uint64_t v13 = a1[7];
    uint64_t v14 = a1[8];
    v15[0] = 67110914;
    v15[1] = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    __int16 v20 = 2080;
    uint64_t v21 = v9;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    __int16 v24 = 2114;
    uint64_t v25 = v12;
    __int16 v26 = 2114;
    uint64_t v27 = v13;
    __int16 v28 = 2114;
    uint64_t v29 = v14;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s startDownloadLevelsForFactors:%{public}@ withNamespace:%{public}@ fstate:%{public}@ options:%{public}@ completion:", (uint8_t *)v15, 0x4Eu);
  }
}

uint64_t __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_166(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_2_172;
  v56[3] = &unk_1E6BB8F60;
  id v57 = *(id *)(a1 + 72);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v56);
  if (v5 && v6)
  {
    id v55 = 0;
    unsigned int v54 = 0;
    id v52 = 0;
    id v53 = 0;
    id v50 = 0;
    id v51 = 0;
    id v49 = 0;
    id v8 = (void *)MEMORY[0x1E4FB0150];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [v5 paths];
    int v12 = [v8 validateDownloadForFactors:v9 withNamespace:v10 paths:v11 container:&v54 factorsState:*(void *)(a1 + 48) assetIndexesByTreatment:&v53 experimentIds:&v52 assetIdsByFactorPack:&v51 rolloutFactorNames:&v50 rolloutDeployments:&v49 error:&v55];

    uint64_t v13 = [(id)objc_opt_class() _notificationKeyWithNamespace:*(void *)(a1 + 40) assetIndexesByTreatment:v53 assetIdsByFactorPack:v51];
    uint64_t v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v53;
      _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_INFO, "Notification key is %{public}@, asset index: %@", buf, 0x16u);
    }

    if (!v12)
    {
      uint64_t v31 = *(void *)(a1 + 80);
      if (v31) {
        (*(void (**)(uint64_t, void, id))(v31 + 16))(v31, 0, v55);
      }
      goto LABEL_37;
    }
    if ([v53 count] || objc_msgSend(v51, "count"))
    {
      id v46 = (id)objc_opt_new();
      uint64_t v15 = *(void *)(a1 + 56);
      long long v16 = *(_OWORD *)(v15 + 32);
      *(_OWORD *)buf = *(_OWORD *)(v15 + 16);
      *(_OWORD *)&buf[16] = v16;
      uint64_t v17 = [MEMORY[0x1E4FB00E0] applicationBundleIdentifierWithAuditToken:buf];
      if (!v17)
      {
        id v32 = [NSString alloc];
        id v33 = [MEMORY[0x1E4FB00E0] entitlementKeyForApplicationBundleIdentifier];
        uint64_t v23 = (TRITaskAttributionInternalInsecure *)objc_msgSend(v32, "initWithFormat:", @"Process is missing entitlement \"%@\"; you must declare the application bundle identifier explicitly in entitlements.",
                                                      v33);

        (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
        uint64_t v19 = TRILogCategory_Server();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v34 = *(_DWORD *)(*(void *)(a1 + 56) + 36);
          id v35 = [MEMORY[0x1E4FB00E0] entitlementKeyForApplicationBundleIdentifier];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v35;
          _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement \"%{public}@\".", buf, 0x12u);
        }
LABEL_35:

        goto LABEL_36;
      }
      if ([MEMORY[0x1E4FB0280] validateSafeASCIISubsetIdentifier:v17])
      {
        __int16 v18 = [v5 keyValueStore];
        uint64_t v19 = +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:v18];

        uint64_t v20 = [v19 subscribedFactorsForNamespaceName:*(void *)(a1 + 40)];
        uint64_t v21 = (void *)[(id)v20 mutableCopy];

        [v21 addObjectsFromArray:*(void *)(a1 + 32)];
        uint64_t v22 = *(void *)(a1 + 40);
        id v47 = 0;
        LOBYTE(v20) = [v19 setSubscriptionWithFactorNames:v21 inNamespaceName:v22 error:&v47];
        uint64_t v23 = (TRITaskAttributionInternalInsecure *)v47;
        if (v20)
        {

          __int16 v24 = [TRITaskAttributionInternalInsecure alloc];
          uint64_t v25 = v54;
          __int16 v26 = *(void **)(a1 + 64);
          uint64_t v27 = v26;
          if (!v26)
          {
            uint64_t v27 = [MEMORY[0x1E4FB00D8] inexpensiveOptions];
          }
          uint64_t v23 = [(TRITaskAttributionInternalInsecure *)v24 initWithTeamIdentifier:0 triCloudKitContainer:v25 applicationBundleIdentifier:v17 networkOptions:v27];
          if (!v26) {

          }
          [(id)objc_opt_class() _startDownloadAssetIndexesByTreatment:v53 usingEntitlementWitness:v46 serverContext:v5 taskQueue:v6 experimentIds:v52 assetIdsByFactorPack:v51 rolloutFactorNames:v50 rolloutDeployments:v49 namespace:*(void *)(a1 + 40) taskAttribution:v23 factorsState:*(void *)(a1 + 48) notificationKey:v13];
          uint64_t v28 = *(void *)(a1 + 80);
          if (v28) {
            (*(void (**)(uint64_t, void *, void))(v28 + 16))(v28, v13, 0);
          }
          goto LABEL_36;
        }
        id v42 = TRILogCategory_Server();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v23;
          _os_log_error_impl(&dword_1DA291000, v42, OS_LOG_TYPE_ERROR, "Unable to update on-demand asset subscription, error: %{public}@", buf, 0xCu);
        }

        uint64_t v43 = *(void *)(a1 + 80);
        if (v43) {
          (*(void (**)(uint64_t, void, TRITaskAttributionInternalInsecure *))(v43 + 16))(v43, 0, v23);
        }

        goto LABEL_35;
      }
      uint64_t v23 = (TRITaskAttributionInternalInsecure *)[[NSString alloc] initWithFormat:@"appContainerId(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)", v17];
      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    }
    else
    {
      id v36 = TRILogCategory_Server();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        uint64_t v37 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v37;
        _os_log_impl(&dword_1DA291000, v36, OS_LOG_TYPE_INFO, "Completing on-demand factor request for namespace \"%{public}@\" without actually downloading assets.", buf, 0xCu);
      }

      id v38 = [v5 keyValueStore];
      uint64_t v17 = +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:v38];

      uint64_t v39 = [v17 subscribedFactorsForNamespaceName:*(void *)(a1 + 40)];
      uint64_t v23 = (TRITaskAttributionInternalInsecure *)[(id)v39 mutableCopy];

      [(TRITaskAttributionInternalInsecure *)v23 addObjectsFromArray:*(void *)(a1 + 32)];
      uint64_t v40 = *(void *)(a1 + 40);
      id v48 = 0;
      LOBYTE(v39) = [v17 setSubscriptionWithFactorNames:v23 inNamespaceName:v40 error:&v48];
      id v46 = v48;
      if (v39)
      {

        uint64_t v41 = *(void *)(a1 + 80);
        if (v41) {
          (*(void (**)(uint64_t, void, void))(v41 + 16))(v41, 0, 0);
        }
        [MEMORY[0x1E4FB00D0] notifyDownloadCompletedForKey:v13];
        goto LABEL_37;
      }
      id v44 = TRILogCategory_Server();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v46;
        _os_log_error_impl(&dword_1DA291000, v44, OS_LOG_TYPE_ERROR, "Unable to update on-demand asset subscription, error: %@", buf, 0xCu);
      }

      uint64_t v45 = *(void *)(a1 + 80);
      if (v45) {
        (*(void (**)(uint64_t, void, id))(v45 + 16))(v45, 0, v46);
      }
    }
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  uint64_t v29 = *(void *)(a1 + 80);
  if (v29)
  {
    uint64_t v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v30);
  }
LABEL_38:
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __119__TRIXPCNamespaceManagementRequestHandler_startDownloadLevelsForFactors_withNamespace_factorsState_options_completion___block_invoke_2_172(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)immediateDownloadForNamespaceNames:(id)a3 allowExpensiveNetworking:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke;
  v54[3] = &unk_1E6BBCB48;
  void v54[4] = self;
  id v10 = v8;
  id v55 = v10;
  BOOL v56 = v6;
  uint64_t v11 = (void (**)(void, void))MEMORY[0x1E016EA80](v54);
  v11[2](v11, 0);
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_181;
  v47[3] = &unk_1E6BBCA60;
  id v49 = &v50;
  int v12 = v11;
  id v48 = v12;
  uint64_t v13 = (void (**)(void))MEMORY[0x1E016EA80](v47);
  if ([MEMORY[0x1E4FB0198] unsafeFirstAuthenticationState])
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_183;
    v44[3] = &unk_1E6BBCAB0;
    id v14 = v10;
    id v45 = v14;
    id v15 = v9;
    id v46 = v15;
    id v36 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v44);
    if (!v14 || ![v14 count])
    {
      uint64_t v25 = TRILogCategory_Server();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "Immediate download is not needed, namespace names are either nil or empty", buf, 2u);
      }

      if (v15) {
        (*((void (**)(id, void))v15 + 2))(v15, 0);
      }
      goto LABEL_24;
    }
    uint64_t v16 = *MEMORY[0x1E4FB0510];
    long long v17 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v17;
    __int16 v18 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v16 withAuditToken:buf];
    BOOL v19 = v18 == 0;

    if (v19)
    {
      ((void (**)(void, uint64_t, __CFString *))v36)[2](v36, 3, @"Calling process is not entitled to immediate download");
      uint64_t v28 = TRILogCategory_Server();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        unsigned int v29 = self->_auditToken.val[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v16;
        _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required for immediate download: %@", buf, 0x12u);
      }
      goto LABEL_23;
    }
    id v35 = objc_opt_new();
    long long v20 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v20;
    uint64_t v21 = [MEMORY[0x1E4FB00E0] applicationBundleIdentifierWithAuditToken:buf];
    if (v21)
    {
      if (([MEMORY[0x1E4FB0280] validateSafeASCIISubsetIdentifier:v21] & 1) == 0)
      {
        uint64_t v22 = (void *)[[NSString alloc] initWithFormat:@"applicationBundleIdentifier (%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)", v21];
        ((void (**)(void, uint64_t, void *))v36)[2](v36, 2, v22);
        goto LABEL_22;
      }
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4FB00D8]) initWithAllowsCellular:v6 discretionaryBehavior:0];
      int v34 = [[TRITaskAttributionInternalInsecure alloc] initWithTeamIdentifier:0 triCloudKitContainer:1 applicationBundleIdentifier:v21 networkOptions:v22];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_190;
      v37[3] = &unk_1E6BBCB70;
      uint64_t v41 = v12;
      id v42 = v15;
      void v37[4] = self;
      id v38 = v14;
      uint64_t v39 = v35;
      BOOL v43 = v6;
      uint64_t v23 = v34;
      uint64_t v40 = v23;
      __int16 v24 = (void *)MEMORY[0x1E016EA80](v37);
      [(TRIXPCNamespaceManagementRequestHandler *)self runBlockWhenServerAvailable:v24];
      *((unsigned char *)v51 + 24) = 1;
    }
    else
    {
      id v30 = [NSString alloc];
      uint64_t v31 = [MEMORY[0x1E4FB00E0] entitlementKeyForApplicationBundleIdentifier];
      uint64_t v22 = objc_msgSend(v30, "initWithFormat:", @"Process is missing entitlement \"%@\"; you must declare the application bundle identifier explicitly in entitlements.",
                      v31);

      ((void (**)(void, uint64_t, void *))v36)[2](v36, 3, v22);
      uint64_t v23 = TRILogCategory_Server();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        unsigned int v32 = self->_auditToken.val[5];
        id v33 = [MEMORY[0x1E4FB00E0] entitlementKeyForApplicationBundleIdentifier];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v32;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v33;
        _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement \"%{public}@\".", buf, 0x12u);
      }
    }

LABEL_22:
    uint64_t v28 = v35;
LABEL_23:

LABEL_24:
    uint64_t v27 = v45;
    goto LABEL_25;
  }
  __int16 v26 = TRILogCategory_Server();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_1DA291000, v26, OS_LOG_TYPE_DEFAULT, "Failing request for immediateDownloadForNamespaceNames:%{public}@ since device is still class C locked", buf, 0xCu);
  }

  if (v9)
  {
    uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    (*((void (**)(id, void *))v9 + 2))(v9, v27);
LABEL_25:
  }
  if (v13) {
    v13[2](v13);
  }

  _Block_object_dispose(&v50, 8);
}

void __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    BOOL v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (a2) {
      id v8 = "end";
    }
    else {
      id v8 = "begin";
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v11 = "YES";
    }
    else {
      uint64_t v11 = "NO";
    }
    v12[0] = 67110658;
    v12[1] = v5;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2080;
    __int16 v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 2080;
    uint64_t v22 = v11;
    __int16 v23 = 1026;
    qos_class_t v24 = qos_class_self();
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s immediateDownloadForNamespaceNames:%{public}@ allowExpensiveNetworking:%s qos:%{public}u completion:", (uint8_t *)v12, 0x40u);
  }
}

uint64_t __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_181(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_183(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to start immediateDownloadForNamespaceNames %{public}@: %{public}@", buf, 0x16u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v13 = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
  }
}

void __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_2;
  id v13 = &unk_1E6BB8F60;
  id v14 = *(id *)(a1 + 64);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](&v10);
  if (v5 && v6)
  {
    objc_msgSend((id)objc_opt_class(), "_immediateDownloadForNamespaceNames:usingEntitlementWitness:serverContext:taskQueue:allowExpensiveNetworking:taskAttribution:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), v5, v6, *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 56), *(void *)(a1 + 72), v10, v11, v12, v13);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 72);
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __114__TRIXPCNamespaceManagementRequestHandler_immediateDownloadForNamespaceNames_allowExpensiveNetworking_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeLevelsForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 removeImmediately:(BOOL)a6 completion:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke;
  v56[3] = &unk_1E6BB9208;
  void v56[4] = self;
  id v37 = v11;
  id v57 = v37;
  id v15 = v12;
  id v58 = v15;
  id v16 = v13;
  id v59 = v16;
  id v17 = (void (**)(void, void))MEMORY[0x1E016EA80](v56);
  v17[2](v17, 0);
  uint64_t v52 = 0;
  char v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_191;
  v49[3] = &unk_1E6BBCA60;
  id v51 = &v52;
  uint64_t v18 = v17;
  id v50 = v18;
  __int16 v19 = (void (**)(void))MEMORY[0x1E016EA80](v49);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_2;
  v46[3] = &unk_1E6BBCAB0;
  id v20 = v15;
  id v47 = v20;
  id v21 = v14;
  id v48 = v21;
  uint64_t v22 = MEMORY[0x1E016EA80](v46);
  __int16 v23 = (void (**)(void, void, void))v22;
  if (!v20)
  {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v22 + 16))(v22, 2, @"Namespace name must not be nil.");
    goto LABEL_8;
  }
  qos_class_t v24 = (void *)MEMORY[0x1E4F93B28];
  uint64_t v25 = TRILogCategory_Server();
  uint64_t v26 = *MEMORY[0x1E4FB0500];
  long long v27 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v27;
  if ([v24 taskWithAuditToken:buf hasTrueBooleanEntitlement:v26 logHandle:v25])
  {
  }
  else
  {
    uint64_t v28 = *MEMORY[0x1E4FB0510];
    long long v29 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v29;
    id v30 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v28 withAuditToken:buf];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      ((void (**)(void, uint64_t, __CFString *))v23)[2](v23, 3, @"Calling process is not entitled to remove on-demand factors.");
      id v33 = TRILogCategory_Server();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        unsigned int v35 = self->_auditToken.val[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v35;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v28;
        _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required for on-demand factor removal: %{public}@", buf, 0x12u);
      }
      goto LABEL_7;
    }
  }
  unsigned int v32 = objc_opt_new();
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_195;
  v38[3] = &unk_1E6BBCB98;
  BOOL v43 = v18;
  id v44 = v21;
  v38[4] = self;
  id v39 = v37;
  id v33 = v32;
  uint64_t v40 = v33;
  id v41 = v20;
  id v42 = v16;
  BOOL v45 = a6;
  int v34 = (void *)MEMORY[0x1E016EA80](v38);
  [(TRIXPCNamespaceManagementRequestHandler *)self runBlockWhenServerAvailable:v34];
  *((unsigned char *)v53 + 24) = 1;

LABEL_7:
LABEL_8:

  if (v19) {
    v19[2](v19);
  }

  _Block_object_dispose(&v52, 8);
}

void __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1[4] + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = (void *)v7;
    uint64_t v9 = "end";
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    if (!a2) {
      uint64_t v9 = "begin";
    }
    uint64_t v12 = a1[6];
    uint64_t v13 = a1[7];
    v14[0] = 67110658;
    v14[1] = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 2080;
    id v20 = v9;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    __int16 v23 = 2114;
    uint64_t v24 = v12;
    __int16 v25 = 2114;
    uint64_t v26 = v13;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s removeLevelsForFactors:%{public}@ namespace:%{public}@ fstate:%{public}@ completion:", (uint8_t *)v14, 0x44u);
  }
}

uint64_t __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_191(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to removeLevelsForFactors %{public}@: %{public}@", buf, 0x16u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v13 = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
  }
}

void __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_2_196;
  v12[3] = &unk_1E6BB8F60;
  id v13 = *(id *)(a1 + 72);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v12);
  if (v5 && v6)
  {
    uint64_t v8 = objc_opt_class();
    LOBYTE(v11) = *(unsigned char *)(a1 + 88);
    [v8 _removeAssetFactors:*(void *)(a1 + 40) usingEntitlementWitness:*(void *)(a1 + 48) serverContext:v5 taskQueue:v6 namespace:*(void *)(a1 + 56) factorsState:*(void *)(a1 + 64) removeImmediately:v11 completion:*(void *)(a1 + 80)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 80);
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    }
  }
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __122__TRIXPCNamespaceManagementRequestHandler_removeLevelsForFactors_withNamespace_factorsState_removeImmediately_completion___block_invoke_2_196(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPurgeabilityLevelsForFactors:(id)a3 forNamespaceName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke;
  v37[3] = &unk_1E6BB9078;
  void v37[4] = self;
  id v11 = v8;
  id v38 = v11;
  id v12 = v9;
  id v39 = v12;
  id v13 = (void (**)(void, void))MEMORY[0x1E016EA80](v37);
  v13[2](v13, 0);
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_197;
  v30[3] = &unk_1E6BBCA60;
  unsigned int v32 = &v33;
  id v14 = v13;
  id v31 = v14;
  uint64_t v15 = (void (**)(void))MEMORY[0x1E016EA80](v30);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  __int16 v23 = __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_2;
  uint64_t v24 = &unk_1E6BB9230;
  __int16 v16 = v14;
  id v28 = v16;
  id v17 = v10;
  id v29 = v17;
  __int16 v25 = self;
  id v18 = v12;
  id v26 = v18;
  id v19 = v11;
  id v27 = v19;
  id v20 = (void *)MEMORY[0x1E016EA80](&v21);
  -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v20, v21, v22, v23, v24, v25);
  *((unsigned char *)v34 + 24) = 1;

  if (v15) {
    v15[2](v15);
  }

  _Block_object_dispose(&v33, 8);
}

void __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1[4] + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    id v9 = "end";
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    if (!a2) {
      id v9 = "begin";
    }
    v13[0] = 67110402;
    v13[1] = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    __int16 v18 = 2080;
    id v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s setPurgeabilityLevelsForFactors:%{public}@ forNamespace:%{public}@ completion:", (uint8_t *)v13, 0x3Au);
  }
}

uint64_t __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_197(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_3;
  v31[3] = &unk_1E6BB8F60;
  id v32 = *(id *)(a1 + 56);
  uint64_t v7 = (void (**)(void))MEMORY[0x1E016EA80](v31);
  if (v5 && v6)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_4;
    v29[3] = &unk_1E6BB8FD8;
    id v30 = *(id *)(a1 + 64);
    id v8 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v29);
    id v28 = 0;
    [*(id *)(a1 + 32) _validateNamespaceName:*(void *)(a1 + 40) error:&v28];
    if (v28)
    {
      uint64_t v9 = *(void *)(a1 + 64);
      if (v9) {
        (*(void (**)(void))(v9 + 16))();
      }
      goto LABEL_13;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F93B28];
    uint64_t v13 = *(void *)(a1 + 32);
    __int16 v14 = TRILogCategory_Server();
    uint64_t v15 = *MEMORY[0x1E4FB0500];
    long long v16 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v13 + 16);
    *(_OWORD *)&buf[16] = v16;
    if ([v12 taskWithAuditToken:buf hasTrueBooleanEntitlement:v15 logHandle:v14])
    {
    }
    else
    {
      uint64_t v17 = *MEMORY[0x1E4FB0510];
      uint64_t v18 = *(void *)(a1 + 32);
      long long v19 = *(_OWORD *)(v18 + 32);
      *(_OWORD *)buf = *(_OWORD *)(v18 + 16);
      *(_OWORD *)&buf[16] = v19;
      __int16 v20 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v17 withAuditToken:buf];
      BOOL v21 = v20 == 0;

      if (v21)
      {
        ((void (**)(void, uint64_t, __CFString *))v8)[2](v8, 3, @"Calling process is not entitled to set purgeability factor levels.");
        __int16 v22 = TRILogCategory_Server();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v27 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v27;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v17;
          _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required to set purgeability factor levels: %{public}@", buf, 0x12u);
        }
        goto LABEL_12;
      }
    }
    __int16 v22 = objc_opt_new();
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 48);
    __int16 v25 = *(void **)(a1 + 32);
    id v26 = [v5 paths];
    [v25 _setPurgeabilityLevelsForFactors:v24 usingEntitlementWitness:v22 namespace:v23 paths:v26 completion:*(void *)(a1 + 64)];

LABEL_12:
LABEL_13:

    uint64_t v11 = v30;
    goto LABEL_14;
  }
  uint64_t v10 = *(void *)(a1 + 64);
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
LABEL_14:

LABEL_15:
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __103__TRIXPCNamespaceManagementRequestHandler_setPurgeabilityLevelsForFactors_forNamespaceName_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)loadNamespaceMetadataForNamespaceName:(id)a3 completion:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke;
  v41[3] = &unk_1E6BB9140;
  v41[4] = self;
  id v8 = v6;
  id v42 = v8;
  uint64_t v9 = (void (**)(void, void))MEMORY[0x1E016EA80](v41);
  v9[2](v9, 0);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_201;
  v36[3] = &unk_1E6BBCA60;
  id v38 = v39;
  uint64_t v10 = v9;
  id v37 = v10;
  uint64_t v11 = (void (**)(void))MEMORY[0x1E016EA80](v36);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_2;
  v34[3] = &unk_1E6BB8FD8;
  id v12 = v7;
  id v35 = v12;
  uint64_t v13 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v34);
  id v33 = 0;
  [(TRIXPCNamespaceManagementRequestHandler *)self _validateNamespaceName:v8 error:&v33];
  if (!v33)
  {
    __int16 v14 = (void *)MEMORY[0x1E4F93B28];
    uint64_t v15 = TRILogCategory_Server();
    uint64_t v16 = *MEMORY[0x1E4FB0500];
    long long v17 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v17;
    if ([v14 taskWithAuditToken:buf hasTrueBooleanEntitlement:v16 logHandle:v15])
    {
    }
    else
    {
      uint64_t v18 = *MEMORY[0x1E4FB0510];
      long long v19 = *(_OWORD *)&self->_auditToken.val[4];
      *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
      *(_OWORD *)&buf[16] = v19;
      __int16 v20 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v18 withAuditToken:buf];
      BOOL v21 = v20 == 0;

      if (v21)
      {
        ((void (**)(void, uint64_t, __CFString *))v13)[2](v13, 3, @"Calling process is not entitled to load purgeability factor levels.");
        uint64_t v23 = TRILogCategory_Server();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          unsigned int v24 = self->_auditToken.val[5];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v24;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v18;
          _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required to load purgeability factor levels: %{public}@", buf, 0x12u);
        }
        goto LABEL_8;
      }
    }
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    int v27 = __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_205;
    id v28 = &unk_1E6BB90A0;
    id v31 = v10;
    id v32 = v12;
    id v29 = self;
    id v30 = v8;
    __int16 v22 = (void *)MEMORY[0x1E016EA80](&v25);
    -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v22, v25, v26, v27, v28, v29);

    uint64_t v23 = v31;
LABEL_8:

    goto LABEL_9;
  }
  if (v12) {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
LABEL_9:

  if (v11) {
    v11[2](v11);
  }

  _Block_object_dispose(v39, 8);
}

void __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = "end";
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v12[0] = 67110146;
    if (!a2) {
      uint64_t v9 = "begin";
    }
    v12[1] = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v17 = 2080;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s loadNamespaceMetadataForNamespaceName:%{public}@ completion:", (uint8_t *)v12, 0x30u);
  }
}

uint64_t __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_201(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_205(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _DWORD v13[2] = __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_2_206;
  v13[3] = &unk_1E6BB8F60;
  id v14 = *(id *)(a1 + 48);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v13);
  if (v5 && v6)
  {
    id v8 = objc_opt_new();
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [v5 paths];
    [v9 _loadNamespaceMetadataForNamespace:v10 usingEntitlementWitness:v8 withPaths:v11 completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (!v12) {
      goto LABEL_7;
    }
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v8);
  }

LABEL_7:
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __92__TRIXPCNamespaceManagementRequestHandler_loadNamespaceMetadataForNamespaceName_completion___block_invoke_2_206(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setProvisionalFactorPackId:(id)a3 forNamespaceName:(id)a4 completion:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke;
  v50[3] = &unk_1E6BB9078;
  v50[4] = self;
  id v11 = v8;
  id v51 = v11;
  id v12 = v9;
  id v52 = v12;
  __int16 v13 = (void (**)(void, void))MEMORY[0x1E016EA80](v50);
  v13[2](v13, 0);
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_207;
  v43[3] = &unk_1E6BBCA60;
  BOOL v45 = &v46;
  id v14 = v13;
  id v44 = v14;
  __int16 v15 = (void (**)(void))MEMORY[0x1E016EA80](v43);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_2;
  v40[3] = &unk_1E6BBCAB0;
  id v16 = v12;
  id v41 = v16;
  id v17 = v10;
  id v42 = v17;
  uint64_t v18 = MEMORY[0x1E016EA80](v40);
  __int16 v19 = (void (**)(void, void, void))v18;
  if (!v16)
  {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v18 + 16))(v18, 2, @"Namespace name must not be nil.");
    goto LABEL_8;
  }
  uint64_t v20 = (void *)MEMORY[0x1E4F93B28];
  uint64_t v21 = TRILogCategory_Server();
  uint64_t v22 = *MEMORY[0x1E4FB0500];
  long long v23 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v23;
  if ([v20 taskWithAuditToken:buf hasTrueBooleanEntitlement:v22 logHandle:v21])
  {
  }
  else
  {
    uint64_t v24 = *MEMORY[0x1E4FB0510];
    long long v25 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v25;
    uint64_t v26 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v24 withAuditToken:buf];
    BOOL v27 = v26 == 0;

    if (v27)
    {
      ((void (**)(void, uint64_t, __CFString *))v19)[2](v19, 3, @"Calling process is not entitled to set factor pack id provisional.");
      id v29 = TRILogCategory_Server();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        unsigned int v30 = self->_auditToken.val[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v24;
        _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required set factor pack id provisional: %{public}@", buf, 0x12u);
      }
      goto LABEL_7;
    }
  }
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  id v33 = __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_211;
  uint64_t v34 = &unk_1E6BB9230;
  id v38 = v14;
  id v39 = v17;
  id v35 = self;
  id v36 = v11;
  id v37 = v16;
  id v28 = (void *)MEMORY[0x1E016EA80](&v31);
  -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v28, v31, v32, v33, v34, v35);
  *((unsigned char *)v47 + 24) = 1;

  id v29 = v38;
LABEL_7:

LABEL_8:
  if (v15) {
    v15[2](v15);
  }

  _Block_object_dispose(&v46, 8);
}

void __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1[4] + 36);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (a2) {
      id v8 = "end";
    }
    else {
      id v8 = "begin";
    }
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    uint64_t v11 = a1[6];
    v12[0] = 67110658;
    v12[1] = v5;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2080;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    __int16 v23 = 1024;
    qos_class_t v24 = qos_class_self();
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s setProvisionalFactorPackId:%{public}@ forNamespaceName:%{public}@ completion: qos:%u", (uint8_t *)v12, 0x40u);
  }
}

uint64_t __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_207(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to setProvisionalFactorPackId %{public}@: %{public}@", buf, 0x16u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v13 = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v9);
  }
}

void __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_2_212;
  v10[3] = &unk_1E6BB8F60;
  id v11 = *(id *)(a1 + 56);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v10);
  if (v5 && v6)
  {
    id v8 = objc_opt_new();
    [(id)objc_opt_class() _setProvisionalFactorPackId:*(void *)(a1 + 40) usingEntitlementWitness:v8 serverContext:v5 forNamespaceName:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 64);
    if (!v9) {
      goto LABEL_7;
    }
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v8);
  }

LABEL_7:
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __98__TRIXPCNamespaceManagementRequestHandler_setProvisionalFactorPackId_forNamespaceName_completion___block_invoke_2_212(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 completion:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v34 = a5;
  id v12 = a6;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke;
  v52[3] = &unk_1E6BB9078;
  v52[4] = self;
  id v13 = v10;
  id v53 = v13;
  id v14 = v11;
  id v54 = v14;
  uint64_t v15 = (void (**)(void, void))MEMORY[0x1E016EA80](v52);
  v15[2](v15, 0);
  uint64_t v48 = 0;
  char v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_213;
  v45[3] = &unk_1E6BBCA60;
  id v47 = &v48;
  __int16 v16 = v15;
  id v46 = v16;
  id v17 = (void (**)(void))MEMORY[0x1E016EA80](v45);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2;
  v42[3] = &unk_1E6BBCAB0;
  id v18 = v14;
  id v43 = v18;
  id v19 = v12;
  id v44 = v19;
  uint64_t v20 = MEMORY[0x1E016EA80](v42);
  __int16 v21 = (void (**)(void, void, void))v20;
  if (!v18)
  {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v20 + 16))(v20, 2, @"Namespace name must not be nil.");
    goto LABEL_8;
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F93B28];
  __int16 v23 = TRILogCategory_Server();
  uint64_t v24 = *MEMORY[0x1E4FB0500];
  long long v25 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v25;
  if ([v22 taskWithAuditToken:buf hasTrueBooleanEntitlement:v24 logHandle:v23])
  {
  }
  else
  {
    uint64_t v26 = *MEMORY[0x1E4FB0510];
    long long v27 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v27;
    id v28 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v26 withAuditToken:buf];
    BOOL v29 = v28 == 0;

    if (v29)
    {
      ((void (**)(void, uint64_t, __CFString *))v21)[2](v21, 3, @"Calling process is not entitled to reject factor pack id.");
      uint64_t v31 = TRILogCategory_Server();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        unsigned int v33 = self->_auditToken.val[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v26;
        _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required reject factor pack id: %{public}@", buf, 0x12u);
      }
      goto LABEL_7;
    }
  }
  unsigned int v30 = objc_opt_new();
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_217;
  v35[3] = &unk_1E6BBCBC0;
  char v40 = v16;
  id v41 = v19;
  v35[4] = self;
  id v36 = v13;
  uint64_t v31 = v30;
  id v37 = v31;
  id v38 = v18;
  id v39 = v34;
  uint64_t v32 = (void *)MEMORY[0x1E016EA80](v35);
  [(TRIXPCNamespaceManagementRequestHandler *)self runBlockWhenServerAvailable:v32];
  *((unsigned char *)v49 + 24) = 1;

LABEL_7:
LABEL_8:

  if (v17) {
    v17[2](v17);
  }

  _Block_object_dispose(&v48, 8);
}

void __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1[4] + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = "end";
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    if (!a2) {
      uint64_t v9 = "begin";
    }
    v13[0] = 67110402;
    v13[1] = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    __int16 v18 = 2080;
    id v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s rejectFactorPackId:%{public}@ forNamespaceName:%{public}@ completion:", (uint8_t *)v13, 0x3Au);
  }
}

uint64_t __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_213(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to rejectFactorPackId %{public}@: %{public}@", buf, 0x16u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v13 = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v9);
  }
}

void __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_217(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2_218;
  v10[3] = &unk_1E6BB8F60;
  id v11 = *(id *)(a1 + 72);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v10);
  if (v5 && v6)
  {
    [(id)objc_opt_class() _rejectFactorPackId:*(void *)(a1 + 40) usingEntitlementWitness:*(void *)(a1 + 48) serverContext:v5 forNamespaceName:*(void *)(a1 + 56) rolloutDeployment:*(void *)(a1 + 64) completion:*(void *)(a1 + 80)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 80);
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
  }
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __108__TRIXPCNamespaceManagementRequestHandler_rejectFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2_218(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)promoteFactorPackId:(id)a3 forNamespaceName:(id)a4 rolloutDeployment:(id)a5 completion:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v34 = a5;
  id v12 = a6;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke;
  v52[3] = &unk_1E6BB9078;
  v52[4] = self;
  id v13 = v10;
  id v53 = v13;
  id v14 = v11;
  id v54 = v14;
  uint64_t v15 = (void (**)(void, void))MEMORY[0x1E016EA80](v52);
  v15[2](v15, 0);
  uint64_t v48 = 0;
  char v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_219;
  v45[3] = &unk_1E6BBCA60;
  id v47 = &v48;
  __int16 v16 = v15;
  id v46 = v16;
  id v17 = (void (**)(void))MEMORY[0x1E016EA80](v45);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2;
  v42[3] = &unk_1E6BBCAB0;
  id v18 = v14;
  id v43 = v18;
  id v19 = v12;
  id v44 = v19;
  uint64_t v20 = MEMORY[0x1E016EA80](v42);
  uint64_t v21 = (void (**)(void, void, void))v20;
  if (!v18)
  {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v20 + 16))(v20, 2, @"Namespace name must not be nil.");
    goto LABEL_8;
  }
  __int16 v22 = (void *)MEMORY[0x1E4F93B28];
  uint64_t v23 = TRILogCategory_Server();
  uint64_t v24 = *MEMORY[0x1E4FB0500];
  long long v25 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v25;
  if ([v22 taskWithAuditToken:buf hasTrueBooleanEntitlement:v24 logHandle:v23])
  {
  }
  else
  {
    uint64_t v26 = *MEMORY[0x1E4FB0510];
    long long v27 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v27;
    id v28 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v26 withAuditToken:buf];
    BOOL v29 = v28 == 0;

    if (v29)
    {
      ((void (**)(void, uint64_t, __CFString *))v21)[2](v21, 3, @"Calling process is not entitled to remove on-demand factors.");
      uint64_t v31 = TRILogCategory_Server();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        unsigned int v33 = self->_auditToken.val[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v26;
        _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required for on-demand factor removal: %{public}@", buf, 0x12u);
      }
      goto LABEL_7;
    }
  }
  unsigned int v30 = objc_opt_new();
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_220;
  v35[3] = &unk_1E6BBCBC0;
  char v40 = v16;
  id v41 = v19;
  v35[4] = self;
  id v36 = v13;
  uint64_t v31 = v30;
  id v37 = v31;
  id v38 = v18;
  id v39 = v34;
  uint64_t v32 = (void *)MEMORY[0x1E016EA80](v35);
  [(TRIXPCNamespaceManagementRequestHandler *)self runBlockWhenServerAvailable:v32];
  *((unsigned char *)v49 + 24) = 1;

LABEL_7:
LABEL_8:

  if (v17) {
    v17[2](v17);
  }

  _Block_object_dispose(&v48, 8);
}

void __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1[4] + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = (void *)v7;
    uint64_t v9 = "end";
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    if (!a2) {
      uint64_t v9 = "begin";
    }
    v13[0] = 67110402;
    v13[1] = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v10;
    __int16 v18 = 2080;
    id v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s promoteFactorPackId:%{public}@ forNamespaceName:%{public}@ completion:", (uint8_t *)v13, 0x3Au);
  }
}

uint64_t __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_219(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to promoteFactorPackId for %{public}@: %{public}@", buf, 0x16u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v13 = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v9);
  }
}

void __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2_221;
  v10[3] = &unk_1E6BB8F60;
  id v11 = *(id *)(a1 + 72);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v10);
  if (v5 && v6)
  {
    [(id)objc_opt_class() _promoteFactorPackId:*(void *)(a1 + 40) usingEntitlementWitness:*(void *)(a1 + 48) serverContext:v5 forNamespaceName:*(void *)(a1 + 56) rolloutDeployment:*(void *)(a1 + 64) completion:*(void *)(a1 + 80)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 80);
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
  }
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __109__TRIXPCNamespaceManagementRequestHandler_promoteFactorPackId_forNamespaceName_rolloutDeployment_completion___block_invoke_2_221(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)statusOfDownloadForFactors:(id)a3 withNamespace:(id)a4 factorsState:(id)a5 completion:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke;
  v46[3] = &unk_1E6BB9208;
  void v46[4] = self;
  id v14 = v10;
  id v47 = v14;
  id v15 = v11;
  id v48 = v15;
  id v16 = v12;
  id v49 = v16;
  id v17 = (void (**)(void, void))MEMORY[0x1E016EA80](v46);
  v17[2](v17, 0);
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_222;
  void v39[3] = &unk_1E6BBCA60;
  id v41 = &v42;
  uint64_t v18 = v17;
  id v40 = v18;
  id v19 = (void (**)(void))MEMORY[0x1E016EA80](v39);
  if ([MEMORY[0x1E4FB0198] unsafeFirstAuthenticationState])
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_223;
    v37[3] = &unk_1E6BB8FD8;
    id v20 = v13;
    id v38 = v20;
    uint64_t v21 = (void *)MEMORY[0x1E016EA80](v37);
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    id v28 = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_2;
    BOOL v29 = &unk_1E6BBCC10;
    id v34 = v18;
    id v35 = v20;
    unsigned int v30 = self;
    id v22 = v21;
    id v36 = v22;
    id v31 = v14;
    id v32 = v15;
    id v33 = v16;
    uint64_t v23 = (void *)MEMORY[0x1E016EA80](&v26);
    -[TRIXPCNamespaceManagementRequestHandler runBlockWhenServerAvailable:](self, "runBlockWhenServerAvailable:", v23, v26, v27, v28, v29, v30);
    *((unsigned char *)v43 + 24) = 1;

    uint64_t v24 = v38;
LABEL_7:

    goto LABEL_8;
  }
  long long v25 = TRILogCategory_Server();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v51 = v15;
    _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "cannot determine download status of factors for %@", buf, 0xCu);
  }

  if (v13)
  {
    uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v24);
    goto LABEL_7;
  }
LABEL_8:
  if (v19) {
    v19[2](v19);
  }

  _Block_object_dispose(&v42, 8);
}

void __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1[4] + 36);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (a2) {
      uint64_t v8 = "end";
    }
    else {
      uint64_t v8 = "begin";
    }
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    uint64_t v12 = a1[6];
    uint64_t v11 = a1[7];
    v13[0] = 67110914;
    v13[1] = v5;
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2080;
    id v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    uint64_t v25 = v11;
    __int16 v26 = 1026;
    qos_class_t v27 = qos_class_self();
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s statusOfDownloadForFactors:%{public}@ withNamespace:%{public}@ fstate:%{public}@ qos:%{public}u completion:", (uint8_t *)v13, 0x4Au);
  }
}

uint64_t __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_222(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_223(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    int v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_3;
  v41[3] = &unk_1E6BB8F60;
  id v42 = *(id *)(a1 + 64);
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v41);
  if (v5 && v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F93B28];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = TRILogCategory_Server();
    uint64_t v11 = *MEMORY[0x1E4FB0500];
    long long v12 = *(_OWORD *)(v9 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v9 + 16);
    *(_OWORD *)&buf[16] = v12;
    if ([v8 taskWithAuditToken:buf hasTrueBooleanEntitlement:v11 logHandle:v10])
    {

LABEL_8:
      id v40 = 0;
      int v39 = 0;
      id v37 = 0;
      id v38 = 0;
      __int16 v20 = (void *)MEMORY[0x1E4FB0150];
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      uint64_t v23 = [v5 paths];
      char v24 = [v20 validateDownloadForFactors:v21 withNamespace:v22 paths:v23 container:&v39 factorsState:*(void *)(a1 + 56) assetIndexesByTreatment:&v38 experimentIds:0 assetIdsByFactorPack:&v37 rolloutFactorNames:0 rolloutDeployments:0 error:&v40];

      uint64_t v25 = [(id)objc_opt_class() _notificationKeyWithNamespace:*(void *)(a1 + 48) assetIndexesByTreatment:v38 assetIdsByFactorPack:v37];
      __int16 v26 = TRILogCategory_Server();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v38;
        _os_log_impl(&dword_1DA291000, v26, OS_LOG_TYPE_INFO, "Notification key is %@, asset index: %@", buf, 0x16u);
      }

      if (v24)
      {
        if ([v38 count] || objc_msgSend(v37, "count"))
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          *(void *)&buf[24] = 1;
          qos_class_t v27 = (void *)MEMORY[0x1E016E7F0]();
          uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v25, 0);
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_228;
          v36[3] = &unk_1E6BBCBE8;
          void v36[4] = buf;
          [v6 enumerateTasksWithTagsIntersectingTagSet:v28 block:v36];

          uint64_t v29 = *(void *)(a1 + 72);
          if (v29) {
            (*(void (**)(void))(v29 + 16))();
          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          id v32 = TRILogCategory_Server();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            uint64_t v33 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v33;
            _os_log_impl(&dword_1DA291000, v32, OS_LOG_TYPE_INFO, "Got on-demand factor status for namespace \"%@\" with all assets already downloaded.", buf, 0xCu);
          }

          uint64_t v34 = *(void *)(a1 + 72);
          if (v34) {
            (*(void (**)(uint64_t, uint64_t, void, void))(v34 + 16))(v34, 4, 0, 0);
          }
          [MEMORY[0x1E4FB00D0] notifyDownloadCompletedForKey:v25];
        }
      }
      else
      {
        uint64_t v30 = *(void *)(a1 + 72);
        if (v30) {
          (*(void (**)(uint64_t, void, void, id))(v30 + 16))(v30, 0, 0, v40);
        }
      }

      goto LABEL_19;
    }
    uint64_t v15 = *MEMORY[0x1E4FB0510];
    uint64_t v16 = *(void *)(a1 + 32);
    long long v17 = *(_OWORD *)(v16 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v16 + 16);
    *(_OWORD *)&buf[16] = v17;
    __int16 v18 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v15 withAuditToken:buf];
    BOOL v19 = v18 == 0;

    if (!v19) {
      goto LABEL_8;
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    id v31 = TRILogCategory_Server();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v35 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v35;
      *(_WORD *)&buf[8] = 2114;
      *(void *)&buf[10] = v15;
      _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "XPC client process with pid %d is missing entitlement required for seeing download status of on-demand factors: %{public}@", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 72);
    if (v13)
    {
      __int16 v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0, 0, v14);
    }
  }
LABEL_19:
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108__TRIXPCNamespaceManagementRequestHandler_statusOfDownloadForFactors_withNamespace_factorsState_completion___block_invoke_228(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v5 = [v10 task];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v10 task];
    int v8 = [v7 isCurrentlyExecuting];
    uint64_t v9 = 2;
    if (!v8) {
      uint64_t v9 = 3;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
  }
  *a3 = 1;
}

- (void)getSandboxExtensionTokensForIdentifierQueryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__TRIXPCNamespaceManagementRequestHandler_getSandboxExtensionTokensForIdentifierQueryWithCompletion___block_invoke;
  v25[3] = &unk_1E6BB8F38;
  void v25[4] = self;
  id v5 = (void (**)(void, void))MEMORY[0x1E016EA80](v25);
  v5[2](v5, 0);
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__TRIXPCNamespaceManagementRequestHandler_getSandboxExtensionTokensForIdentifierQueryWithCompletion___block_invoke_231;
  v18[3] = &unk_1E6BBCA60;
  __int16 v20 = &v21;
  id v6 = v5;
  id v19 = v6;
  id v7 = (void (**)(void))MEMORY[0x1E016EA80](v18);
  int v8 = objc_opt_new();
  uint64_t v9 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  id v10 = [v9 treatmentsDir];
  uint64_t v11 = +[TRISandboxExtensionFactory extensionTokenForPath:v10 extensionClass:0];

  if (v11) {
    [v8 addObject:v11];
  }
  long long v12 = [v9 namespaceDescriptorsDir];
  uint64_t v13 = +[TRISandboxExtensionFactory extensionTokenForPath:v12 extensionClass:0];

  if (v13) {
    [v8 addObject:v13];
  }
  if ([v8 count] == 2)
  {
    __int16 v14 = (void *)[v8 copy];
    v4[2](v4, v14, 0);
  }
  else
  {
    uint64_t v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Could not obtain sandbox extension tokens", v17, 2u);
    }

    __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIGeneralErrorDomain" code:16 userInfo:0];
    uint64_t v16 = objc_opt_new();
    ((void (**)(id, void *, void *))v4)[2](v4, v16, v14);
  }
  *((unsigned char *)v22 + 24) = 1;

  if (v7) {
    v7[2](v7);
  }

  _Block_object_dispose(&v21, 8);
}

void __101__TRIXPCNamespaceManagementRequestHandler_getSandboxExtensionTokensForIdentifierQueryWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      id v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    long long v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s getSandboxExtensionTokensForIdentifierQueryWithCompletioncompletion:", (uint8_t *)v11, 0x26u);
  }
}

uint64_t __101__TRIXPCNamespaceManagementRequestHandler_getSandboxExtensionTokensForIdentifierQueryWithCompletion___block_invoke_231(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_setPurgeabilityLevelsForFactors:(id)a3 usingEntitlementWitness:(id)a4 namespace:(id)a5 paths:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_6:
    char v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRIXPCNamespaceManagementService.m", 1237, @"Invalid parameter not satisfying: %@", @"purgeabilityLevelsForFactors" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRIXPCNamespaceManagementService.m", 1238, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    goto LABEL_4;
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"TRIXPCNamespaceManagementService.m", 1236, @"Invalid parameter not satisfying: %@", @"entitlementWitness" object file lineNumber description];

  if (!v13) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v15) {
    goto LABEL_7;
  }
LABEL_4:
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __127__TRIXPCNamespaceManagementRequestHandler__setPurgeabilityLevelsForFactors_usingEntitlementWitness_namespace_paths_completion___block_invoke;
  v26[3] = &unk_1E6BBCC38;
  id v29 = v13;
  id v30 = v17;
  void v26[4] = self;
  id v27 = v15;
  id v28 = v16;
  id v18 = v13;
  id v19 = v16;
  id v20 = v15;
  id v21 = v17;
  uint64_t v22 = (void *)MEMORY[0x1E016EA80](v26);
  [(TRIXPCNamespaceManagementRequestHandler *)self runBlockWhenServerAvailable:v22];
}

void __127__TRIXPCNamespaceManagementRequestHandler__setPurgeabilityLevelsForFactors_usingEntitlementWitness_namespace_paths_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [v5 paths];
    uint64_t v11 = [v8 _factorProviderChainForNamespace:v9 paths:v10];

    id v36 = 0;
    if ([*(id *)(a1 + 32) _validateSetPurgeabilityLevelRequestUsingFactorProviderChain:v11 paths:*(void *)(a1 + 48) purgeabilityLevelsForFactors:*(void *)(a1 + 56) error:&v36])
    {
      id v31 = v7;
      __int16 v12 = objc_opt_new();
      id v30 = v11;
      objc_msgSend(v12, "setCompatibilityVersion:", objc_msgSend(v11, "namespaceCompatibilityVersion"));
      id v13 = objc_alloc_init(MEMORY[0x1E4FB05E8]);
      [v12 setFactorNamePurgeabilityLevels:v13];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = *(id *)(a1 + 56);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            id v20 = [*(id *)(a1 + 56) objectForKey:v19];
            uint64_t v21 = [v20 intValue];

            uint64_t v22 = [v12 factorNamePurgeabilityLevels];
            [v22 setEnum:v21 forKey:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v16);
      }

      id v23 = objc_alloc(MEMORY[0x1E4FB00C0]);
      char v24 = [v5 paths];
      uint64_t v25 = (void *)[v23 initWithPaths:v24];

      [v25 mergeNamespaceMetadata:v12 forNamespaceName:*(void *)(a1 + 40)];
      uint64_t v26 = *(void *)(a1 + 64);
      if (v26) {
        (*(void (**)(uint64_t, void))(v26 + 16))(v26, 0);
      }

      uint64_t v11 = v30;
      uint64_t v7 = v31;
    }
    else
    {
      uint64_t v29 = *(void *)(a1 + 64);
      if (v29) {
        (*(void (**)(uint64_t, id))(v29 + 16))(v29, v36);
      }
    }
  }
  else
  {
    uint64_t v27 = *(void *)(a1 + 64);
    if (v27)
    {
      id v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);
    }
  }
}

- (BOOL)_validateSetPurgeabilityLevelRequestUsingFactorProviderChain:(id)a3 paths:(id)a4 purgeabilityLevelsForFactors:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = a5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v10)
  {
    BOOL v19 = 1;
    goto LABEL_17;
  }
  uint64_t v11 = v10;
  id v28 = a6;
  uint64_t v12 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v30 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
      uint64_t v15 = [v8 levelForFactor:v14];
      uint64_t v16 = [v15 fileOrDirectoryLevelWithIsDir:0];
      if (!v16)
      {
        id v20 = @"Found invalid factor name %@";
LABEL_14:
        id v21 = (id)objc_msgSend([NSString alloc], "initWithFormat:", v20, v14);
        uint64_t v22 = TRILogCategory_Server();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v21;
          _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F28568];
        *(void *)buf = v21;
        char v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v34 count:1];
        uint64_t v25 = [v23 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v24];

        id v26 = *v28;
        *id v28 = (id)v25;

        BOOL v19 = 0;
        goto LABEL_17;
      }
      uint64_t v17 = [v9 objectForKeyedSubscript:v14];
      [v17 intValue];
      int IsValidValue = TRIPurgeabilityLevel_IsValidValue();

      if (!IsValidValue)
      {
        id v20 = @"Found invalid purgeability level for factorName %@";
        goto LABEL_14;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    BOOL v19 = 1;
    if (v11) {
      continue;
    }
    break;
  }
LABEL_17:

  return v19;
}

- (int)_namespacePurgeabilityLevelForNamespaceName:(id)a3 paths:(id)a4
{
  id v5 = a3;
  id v6 = [a4 namespaceDescriptorsDefaultDir];
  uint64_t v7 = [MEMORY[0x1E4FB01A0] loadWithNamespaceName:v5 fromDirectory:v6];

  LODWORD(v5) = [v7 purgeabilityLevel];
  return (int)v5;
}

- (void)_loadNamespaceMetadataForNamespace:(id)a3 usingEntitlementWitness:(id)a4 withPaths:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, id, void))a6;
  if (v12)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIXPCNamespaceManagementService.m", 1312, @"Invalid parameter not satisfying: %@", @"entitlementWitness" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"TRIXPCNamespaceManagementService.m", 1313, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4FB00C0]) initWithPaths:v13];
  id v23 = 0;
  uint64_t v16 = [v15 loadNamespaceMetadataForNamespaceName:v11 error:&v23];
  id v17 = v23;
  if (!v17)
  {
    id v18 = [(TRIXPCNamespaceManagementRequestHandler *)self _factorProviderChainForNamespace:v11 paths:v13];
    int v19 = [v16 compatibilityVersion];
    if (v19 == [v18 namespaceCompatibilityVersion])
    {
      id v20 = v16;
      if (!v14) {
        goto LABEL_11;
      }
    }
    else
    {
      id v20 = 0;
      if (!v14)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    v14[2](v14, v20, 0);
    goto LABEL_11;
  }
  if (v14) {
    ((void (**)(id, id, id))v14)[2](v14, 0, v17);
  }
LABEL_12:
}

- (id)_factorProviderChainForNamespace:(id)a3 paths:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB01D0]) initWithPaths:v6];
  char v13 = 0;
  id v8 = [v7 resolveFactorProviderChainForNamespaceName:v5 faultOnMissingInstalledFactors:0 installedFactorsAccessible:&v13];
  id v9 = v8;
  if (!v13)
  {
    uint64_t v10 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_260);

    id v9 = (void *)v10;
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB01B0]) initWithNamespaceName:v5 typedProviderChain:v9 paths:v6];

  return v11;
}

BOOL __82__TRIXPCNamespaceManagementRequestHandler__factorProviderChainForNamespace_paths___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] != 1;
}

- (BOOL)_validateNamespaceName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v7 = __72__TRIXPCNamespaceManagementRequestHandler__validateNamespaceName_error___block_invoke(@"namespaceName must be non-nil.");
    id v8 = *a4;
    *a4 = v7;
LABEL_6:

    BOOL v6 = 0;
    goto LABEL_7;
  }
  if (([MEMORY[0x1E4FB0280] validateSafeASCIISubsetIdentifier:v5] & 1) == 0)
  {
    id v8 = (id)[[NSString alloc] initWithFormat:@"namespaceName(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)", v5];
    id v9 = __72__TRIXPCNamespaceManagementRequestHandler__validateNamespaceName_error___block_invoke(v8);
    id v10 = *a4;
    *a4 = v9;

    goto LABEL_6;
  }
  BOOL v6 = 1;
LABEL_7:

  return v6;
}

id __72__TRIXPCNamespaceManagementRequestHandler__validateNamespaceName_error___block_invoke(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v1 = (objc_class *)MEMORY[0x1E4F28C58];
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = v2;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  id v5 = (void *)[v3 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v4];
  return v5;
}

+ (void)_purgeMismatchedDataForDynamicNamespaceName:(id)a3 appContainer:(id)a4 serverContext:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E016E7F0]();
  id v12 = [a1 _deploymentsWithUnexpectedExperimentDataInContainer:v9 dynamicNamespaceName:v8 serverContext:v10];
  if ([v12 count])
  {
    char v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_269);
    uint64_t v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = TRILoggedNamespaceName(v8);
      uint64_t v16 = [v13 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543618;
      int v39 = v15;
      __int16 v40 = 2114;
      id v41 = v16;
      _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Mismatch in experiments for dynamic namespace %{public}@: %{public}@", buf, 0x16u);
    }
    long long v31 = v13;
    long long v32 = v11;

    id v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Purging data for these deployments...", buf, 2u);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v34;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * v22);
          char v24 = objc_msgSend(v10, "experimentDatabase", v31, v32, (void)v33);
          [v24 removeExperimentRecordWithExperimentDeployment:v23];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v20);
    }

    uint64_t v25 = [v10 paths];
    id v26 = [v25 pathsForContainer:v9 asClientProcess:0];

    if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v28 = [v26 trialRootDir];
      [v27 triForceRemoveItemAtPath:v28 error:0];

      long long v29 = v31;
      id v11 = v32;
    }
    else
    {
      uint64_t v27 = TRILogCategory_Server();
      long long v29 = v31;
      id v11 = v32;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        long long v30 = [v9 identifier];
        *(_DWORD *)buf = 138543362;
        int v39 = v30;
        _os_log_impl(&dword_1DA291000, v27, OS_LOG_TYPE_DEFAULT, "Skipping purge of Trial data in missing container: %{public}@", buf, 0xCu);
      }
    }
  }
}

uint64_t __114__TRIXPCNamespaceManagementRequestHandler__purgeMismatchedDataForDynamicNamespaceName_appContainer_serverContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortDesc];
}

+ (id)_deploymentsWithUnexpectedExperimentDataInContainer:(id)a3 dynamicNamespaceName:(id)a4 serverContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  id v11 = [v9 experimentDatabase];
  id v12 = (void *)MEMORY[0x1E016E7F0]();
  char v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F347BA50, 0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __130__TRIXPCNamespaceManagementRequestHandler__deploymentsWithUnexpectedExperimentDataInContainer_dynamicNamespaceName_serverContext___block_invoke;
  v19[3] = &unk_1E6BB9310;
  id v20 = v8;
  id v14 = v10;
  id v21 = v14;
  id v15 = v8;
  [v11 enumerateExperimentRecordsMatchingStatuses:v13 block:v19];

  uint64_t v16 = v21;
  id v17 = v14;

  return v17;
}

void __130__TRIXPCNamespaceManagementRequestHandler__deploymentsWithUnexpectedExperimentDataInContainer_dynamicNamespaceName_serverContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = objc_msgSend(v3, "namespaces", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 name];
        if ([v10 isEqualToString:*(void *)(a1 + 32)])
        {
          id v11 = [v9 treatmentURL];

          if (v11)
          {
            id v12 = [v9 treatmentURL];
            char v13 = [v12 checkResourceIsReachableAndReturnError:0];

            if ((v13 & 1) == 0)
            {
              id v14 = *(void **)(a1 + 40);
              id v15 = [v3 experimentDeployment];
              [v14 addObject:v15];

              goto LABEL_13;
            }
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
LABEL_13:
}

+ (void)usingServerContext:(id)a3 registerNamespaceWithNamespaceName:(id)a4 compatibilityVersion:(unsigned int)a5 defaultsFileURL:(id)a6 teamId:(id)a7 appContainerId:(id)a8 appContainerType:(int64_t)a9 cloudKitContainerId:(int)a10 bundleId:(id)a11 completion:(id)a12
{
  uint64_t v15 = *(void *)&a5;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v51 = a6;
  id v21 = a7;
  id v22 = a8;
  id v50 = a11;
  id v23 = a12;
  if (v19)
  {
    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1450, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];

    if (v20)
    {
LABEL_3:
      if (v21) {
        goto LABEL_4;
      }
LABEL_34:
      uint64_t v44 = [MEMORY[0x1E4F28B00] currentHandler];
      [v44 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1452, @"Invalid parameter not satisfying: %@", @"teamId" object file lineNumber description];

      if (v22) {
        goto LABEL_5;
      }
      goto LABEL_35;
    }
  }
  id v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1451, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

  if (!v21) {
    goto LABEL_34;
  }
LABEL_4:
  if (v22) {
    goto LABEL_5;
  }
LABEL_35:
  char v45 = [MEMORY[0x1E4F28B00] currentHandler];
  [v45 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1453, @"Invalid parameter not satisfying: %@", @"appContainerId" object file lineNumber description];

LABEL_5:
  id v48 = a1;
  char v24 = TRILogCategory_Server();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    __int16 v40 = TRILoggedNamespaceName(v20);
    *(_DWORD *)buf = 138543362;
    id v57 = v40;
    _os_log_debug_impl(&dword_1DA291000, v24, OS_LOG_TYPE_DEBUG, "registering namespace %{public}@", buf, 0xCu);
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __213__TRIXPCNamespaceManagementRequestHandler_usingServerContext_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_bundleId_completion___block_invoke;
  v53[3] = &unk_1E6BB91B8;
  id v25 = v23;
  id v55 = v25;
  id v26 = v20;
  id v54 = v26;
  uint64_t v27 = MEMORY[0x1E016EA80](v53);
  id v28 = (void (**)(void, void, void))v27;
  if (v15)
  {
    long long v29 = [v19 namespaceDatabase];
    LODWORD(v46) = a10;
    id v49 = v21;
    char v30 = [v29 addOrUpdateDynamicNamespaceWithName:v26 compatibilityVersion:v15 defaultsFileURL:v51 teamId:v21 appContainerId:v22 appContainerType:a9 cloudKitContainer:v46];

    if (v30)
    {
      if (v22)
      {
        long long v31 = [MEMORY[0x1E4FB0060] containerWithIdentifier:v22 type:a9];
      }
      else
      {
        long long v31 = 0;
      }
      id v21 = v49;
      long long v32 = objc_opt_new();
      [v32 setFactorsURL:v51];
      [v32 setAppContainer:v31];
      [v32 setCloudKitContainerId:a10];
      [v32 setResourceAttributionIdentifier:v50];
      id v47 = (void *)[objc_alloc(MEMORY[0x1E4FB01A0]) initWithNamespaceName:v26 downloadNCV:v15 optionalParams:v32];
      long long v33 = [v19 paths];
      long long v34 = v33;
      if (v31)
      {
        long long v35 = [v33 pathsForContainer:v31 asClientProcess:0];

        if (!v35)
        {
          ((void (**)(void, uint64_t, __CFString *))v28)[2](v28, 1, @"Unable to resolve app container.");
LABEL_30:

          goto LABEL_31;
        }
        id v52 = 0;
        if ([v35 validateWithError:&v52])
        {
          [v48 _purgeMismatchedDataForDynamicNamespaceName:v26 appContainer:v31 serverContext:v19];
          long long v34 = v35;
LABEL_19:
          long long v36 = [v34 namespaceDescriptorsDefaultDir];
          char v37 = [v47 saveToDirectory:v36];

          if (v37)
          {
            if (v25)
            {
              uint64_t v38 = TRILogCategory_Server();
              id v21 = v49;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                id v41 = TRILoggedNamespaceName(v26);
                *(_DWORD *)buf = 138543362;
                id v57 = v41;
                _os_log_debug_impl(&dword_1DA291000, v38, OS_LOG_TYPE_DEBUG, "registered namespace %{public}@", buf, 0xCu);

                id v21 = v49;
              }

              (*((void (**)(id, uint64_t, void))v25 + 2))(v25, 1, 0);
              goto LABEL_29;
            }
          }
          else
          {
            ((void (**)(void, uint64_t, __CFString *))v28)[2](v28, 1, @"Unable to write namespace descriptor.");
          }
          id v21 = v49;
LABEL_29:

          goto LABEL_30;
        }
        long long v34 = v35;
      }
      else
      {
        id v52 = 0;
        if ([v33 validateWithError:&v52]) {
          goto LABEL_19;
        }
      }
      int v39 = [v52 description];
      ((void (**)(void, uint64_t, void *))v28)[2](v28, 1, v39);

      goto LABEL_29;
    }
    ((void (**)(void, uint64_t, __CFString *))v28)[2](v28, 1, @"Unable to register namespace.");
    id v21 = v49;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v27 + 16))(v27, 2, @"namespace compatibility version must be greater than zero");
  }
LABEL_31:
}

void __213__TRIXPCNamespaceManagementRequestHandler_usingServerContext_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_bundleId_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v10 = TRILoggedNamespaceName(*(void **)(a1 + 32));
      *(_DWORD *)buf = 138543618;
      id v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to register namespace %{public}@: %{public}@", buf, 0x16u);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F28568];
    id v12 = v5;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)usingServerContext:(id)a3 deregisterNamespaceWithName:(id)a4 teamId:(id)a5 taskQueue:(id)a6 completion:(id)a7
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v93 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v88 = [MEMORY[0x1E4F28B00] currentHandler];
    [v88 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1531, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  char v89 = [MEMORY[0x1E4F28B00] currentHandler];
  [v89 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1532, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke;
  v118[3] = &unk_1E6BBCAB0;
  id v17 = v14;
  id v119 = v17;
  id v18 = v16;
  id v120 = v18;
  id v19 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v118);
  id v20 = [v13 namespaceDatabase];
  uint64_t v21 = [v20 dynamicNamespaceRecordWithNamespaceName:v17];

  v101 = (void *)v21;
  if (v21)
  {
    id v92 = v19;
    id v90 = v18;
    uint64_t v22 = objc_opt_new();
    id v23 = [v13 experimentDatabase];
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke_300;
    v115[3] = &unk_1E6BB9310;
    id v91 = v17;
    id v102 = v17;
    id v116 = v102;
    id v24 = (id)v22;
    id v117 = v24;
    LOBYTE(v22) = [v23 enumerateExperimentRecordsWithBlock:v115];

    if ((v22 & 1) == 0)
    {
      ((void (**)(void, uint64_t, __CFString *))v19)[2](v19, 1, @"Unable to check for pending updates");
      id v18 = v90;
LABEL_74:

      id v17 = v91;
      goto LABEL_75;
    }
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    obuint64_t j = v24;
    uint64_t v25 = [obj countByEnumeratingWithState:&v111 objects:v126 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v112;
      id v95 = v24;
      id v96 = v15;
      uint64_t v94 = *(void *)v112;
      do
      {
        uint64_t v28 = 0;
        uint64_t v97 = v26;
        do
        {
          if (*(void *)v112 != v27) {
            objc_enumerationMutation(obj);
          }
          long long v29 = *(void **)(*((void *)&v111 + 1) + 8 * v28);
          char v30 = (void *)MEMORY[0x1E016E7F0]();
          long long v31 = [v29 experimentDeployment];
          long long v32 = [v31 taskTag];
          [v15 cancelTasksWithTag:v32];

          long long v33 = v29;
          v105 = v29;
          if ([v29 type] == 1)
          {
            v99 = v30;
            uint64_t v100 = v28;
            long long v109 = 0u;
            long long v110 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            id v103 = [v29 namespaces];
            uint64_t v34 = [v103 countByEnumeratingWithState:&v107 objects:v125 count:16];
            long long v35 = v101;
            if (v34)
            {
              uint64_t v36 = v34;
              uint64_t v104 = *(void *)v108;
              do
              {
                for (uint64_t i = 0; i != v36; ++i)
                {
                  if (*(void *)v108 != v104) {
                    objc_enumerationMutation(v103);
                  }
                  uint64_t v38 = [*(id *)(*((void *)&v107 + 1) + 8 * i) name];
                  int v39 = [v35 name];
                  if ([v38 isEqualToString:v39])
                  {
                    id v40 = v35;
                  }
                  else
                  {
                    id v41 = [v13 namespaceDatabase];
                    id v40 = [v41 dynamicNamespaceRecordWithNamespaceName:v102];
                  }
                  uint64_t v42 = [v13 paths];
                  if (v40)
                  {
                    id v43 = [v40 appContainer];
                    uint64_t v44 = [v42 pathsForContainer:v43 asClientProcess:0];

                    uint64_t v42 = (void *)v44;
                  }
                  if (v42)
                  {
                    char v45 = (void *)MEMORY[0x1E4FB01A0];
                    uint64_t v46 = [v35 name];
                    id v47 = [v42 namespaceDescriptorsExperimentDir];
                    id v48 = [v45 loadWithNamespaceName:v46 fromDirectory:v47];

                    if (v48)
                    {
                      id v49 = [v42 namespaceDescriptorsExperimentDir];
                      [v48 removeFromDirectory:v49];
                    }
                    long long v33 = v105;
                    id v50 = [v105 treatmentId];

                    if (v50)
                    {
                      id v51 = [[TRIClientTreatmentStorage alloc] initWithPaths:v42];
                      id v52 = [v105 treatmentId];
                      [(TRIClientTreatmentStorage *)v51 removeTreatmentWithTreatmentId:v52];

                      if (_os_feature_enabled_impl())
                      {
                        id v53 = [[TRIFBClientTreatmentStorage alloc] initWithPaths:v42];
                        id v54 = [v105 treatmentId];
                        [(TRIFBClientTreatmentStorage *)v53 removeTreatmentWithTreatmentId:v54];

                        long long v33 = v105;
                      }
                    }
                  }
                  else
                  {
                    id v48 = TRILogCategory_Server();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                    {
                      id v55 = [v40 appContainer];
                      [v55 identifier];
                      id v57 = v56 = v13;
                      uint64_t v58 = [v101 name];
                      id v59 = TRILoggedNamespaceName(v58);
                      *(_DWORD *)buf = 138543618;
                      v122 = v57;
                      __int16 v123 = 2114;
                      v124 = v59;
                      _os_log_impl(&dword_1DA291000, v48, OS_LOG_TYPE_DEFAULT, "Missing container %{public}@ for namespace %{public}@.", buf, 0x16u);

                      id v13 = v56;
                      long long v35 = v101;

                      long long v33 = v105;
                    }
                  }
                }
                uint64_t v36 = [v103 countByEnumeratingWithState:&v107 objects:v125 count:16];
              }
              while (v36);
            }

            id v24 = v95;
            id v15 = v96;
            uint64_t v27 = v94;
            uint64_t v26 = v97;
            char v30 = v99;
            uint64_t v28 = v100;
          }
          v60 = [v13 experimentDatabase];
          uint64_t v61 = [v33 experimentDeployment];
          uint64_t v62 = [v60 removeExperimentRecordWithExperimentDeployment:v61];

          if (!v62)
          {
            uint64_t v63 = TRILogCategory_Server();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              int v64 = [v105 experimentDeployment];
              v65 = [v64 shortDesc];
              *(_DWORD *)buf = 138543362;
              v122 = v65;
              _os_log_error_impl(&dword_1DA291000, v63, OS_LOG_TYPE_ERROR, "failed to remove experiment %{public}@ from database", buf, 0xCu);
            }
          }
          ++v28;
        }
        while (v28 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v111 objects:v126 count:16];
      }
      while (v26);
    }

    v66 = [v13 paths];
    v67 = [v101 appContainer];
    id v68 = [v66 pathsForContainer:v67 asClientProcess:0];

    if (!v68)
    {
      ((void (**)(void, uint64_t, __CFString *))v92)[2](v92, 1, @"Unable to resolve app container.");
      id v18 = v90;
LABEL_73:

      id v19 = v92;
      goto LABEL_74;
    }
    id v106 = 0;
    if ([v68 validateWithError:&v106])
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        id v69 = [[TRIClientTreatmentStorage alloc] initWithPaths:v68];
        if (![(TRIClientTreatmentStorage *)v69 removeTreatmentFromLayer:2 withNamespaceName:v102 upgradeNCVs:0])
        {
          id v70 = TRILogCategory_Server();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            uint64_t v86 = TRILoggedNamespaceName(v102);
            *(_DWORD *)buf = 138543362;
            v122 = v86;
            _os_log_error_impl(&dword_1DA291000, v70, OS_LOG_TYPE_ERROR, "failed to remove descriptor from rollout layer for namespace %{public}@", buf, 0xCu);
          }
        }
      }
      if (_os_feature_enabled_impl())
      {
        id v71 = [[TRIFBClientTreatmentStorage alloc] initWithPaths:v68];
        if (![(TRIFBClientTreatmentStorage *)v71 removeTreatmentFromLayer:2 withNamespaceName:v102 upgradeNCVs:0])
        {
          id v72 = TRILogCategory_Server();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v87 = TRILoggedNamespaceName(v102);
            *(_DWORD *)buf = 138543362;
            v122 = v87;
            _os_log_error_impl(&dword_1DA291000, v72, OS_LOG_TYPE_ERROR, "Flatbuffers: failed to remove descriptor from rollout layer for namespace %{public}@", buf, 0xCu);
          }
        }
      }
      v73 = (void *)MEMORY[0x1E4FB01A0];
      id v74 = [v68 namespaceDescriptorsDefaultDir];
      LOBYTE(v73) = [v73 removeDescriptorWithNamespaceName:v102 fromDirectory:v74];

      if ((v73 & 1) == 0)
      {
        uint64_t v75 = TRILogCategory_Server();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          id v84 = TRILoggedNamespaceName(v102);
          *(_DWORD *)buf = 138543362;
          v122 = v84;
          _os_log_error_impl(&dword_1DA291000, v75, OS_LOG_TYPE_ERROR, "failed to remove descriptor from default layer for namespace %{public}@", buf, 0xCu);
        }
      }
      unsigned int v76 = (void *)[objc_alloc(MEMORY[0x1E4FB01E0]) initWithPaths:v68];
      char v77 = [v76 deleteStatusForNamespaceWithName:v102];

      if ((v77 & 1) == 0)
      {
        long long v78 = TRILogCategory_Server();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v85 = TRILoggedNamespaceName(v102);
          *(_DWORD *)buf = 138543362;
          v122 = v85;
          _os_log_error_impl(&dword_1DA291000, v78, OS_LOG_TYPE_ERROR, "failed to remove status file for namespace %{public}@", buf, 0xCu);
        }
      }
      long long v79 = [v13 namespaceDatabase];
      uint64_t v80 = [v79 removeDynamicNamespaceRecordWithNamespaceName:v102];

      if (v80)
      {
        id v81 = TRILogCategory_Server();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          v83 = TRILoggedNamespaceName(v102);
          *(_DWORD *)buf = 138543362;
          v122 = v83;
          _os_log_debug_impl(&dword_1DA291000, v81, OS_LOG_TYPE_DEBUG, "deregistered namespace %{public}@", buf, 0xCu);
        }
        id v18 = v90;
        if (v90) {
          (*((void (**)(id, uint64_t, void))v90 + 2))(v90, 1, 0);
        }
        goto LABEL_72;
      }
      ((void (**)(void, uint64_t, __CFString *))v92)[2](v92, 1, @"Unable to deregister namespace.");
    }
    else
    {
      id v82 = [v106 description];
      ((void (**)(void, uint64_t, void *))v92)[2](v92, 1, v82);
    }
    id v18 = v90;
LABEL_72:

    goto LABEL_73;
  }
  ((void (**)(void, uint64_t, __CFString *))v19)[2](v19, 2, @"namespace is not registered");
LABEL_75:
}

void __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = TRILoggedNamespaceName(*(void **)(a1 + 32));
    *(_DWORD *)buf = 138543618;
    id v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to deregister namespace %{public}@: %{public}@", buf, 0x16u);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v13 = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v9);
  }
}

void __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke_300(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 namespaces];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke_2;
  v7[3] = &unk_1E6BBCC80;
  id v8 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v7);
  uint64_t v6 = [v5 count];

  if (v6) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t __118__TRIXPCNamespaceManagementRequestHandler_usingServerContext_deregisterNamespaceWithName_teamId_taskQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (void)usingServerContext:(id)a3 taskQueue:(id)a4 startDownloadNamespaceWithName:(id)a5 attribution:(id)a6 completion:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = (void (**)(id, uint64_t, void))a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1676, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_19:
      long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1678, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

      if (v16) {
        goto LABEL_5;
      }
      goto LABEL_20;
    }
  }
  long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1677, @"Invalid parameter not satisfying: %@", @"taskQueue" object file lineNumber description];

  if (!v15) {
    goto LABEL_19;
  }
LABEL_4:
  if (v16) {
    goto LABEL_5;
  }
LABEL_20:
  uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1679, @"Invalid parameter not satisfying: %@", @"attributing" object file lineNumber description];

LABEL_5:
  if (+[TRIUserAdjustableSettings getExperimentOptOut:v13])
  {
    uint64_t v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v38 = v15;
      _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "Skipping download for namespace: %{public}@ due to user opt-out of experiments", buf, 0xCu);
    }

    id v19 = objc_opt_class();
    id v20 = [v16 networkOptions];
    [v19 resumeTaskQueue:v14 forNetworkOptions:v20];

    if (v17) {
      v17[2](v17, 1, 0);
    }
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F1C9C8] distantPast];
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v15, 0);
    id v23 = +[TRIFetchMultipleExperimentNotificationsTask taskWithStartingFetchDateOverride:v21 namespaceNames:v22 taskAttributing:v16 rollbacksOnly:0 limitedCarryOnly:0];
    id v24 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
    char v25 = [v14 addTask:v23 options:v24];

    if (v25 == 2)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v35 = *MEMORY[0x1E4F28568];
      uint64_t v36 = @"Unable to download namespace.";
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      uint64_t v28 = (void *)[v26 initWithDomain:@"TRIGeneralErrorDomain" code:13 userInfo:v27];
    }
    else
    {
      long long v29 = objc_opt_class();
      char v30 = [v16 networkOptions];
      [v29 resumeTaskQueue:v14 forNetworkOptions:v30];

      uint64_t v28 = 0;
    }
    if (v17) {
      ((void (**)(id, uint64_t, void *))v17)[2](v17, v25 != 2, v28);
    }
  }
}

+ (void)_startDownloadAssetIndexesByTreatment:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 taskQueue:(id)a6 experimentIds:(id)a7 assetIdsByFactorPack:(id)a8 rolloutFactorNames:(id)a9 rolloutDeployments:(id)a10 namespace:(id)a11 taskAttribution:(id)a12 factorsState:(id)a13 notificationKey:(id)a14
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  id v19 = a4;
  id v20 = a5;
  id v70 = a6;
  id v66 = a7;
  id v72 = a8;
  id v64 = a9;
  id v65 = a10;
  id v69 = a11;
  id v68 = a12;
  id v63 = a13;
  id v21 = a14;
  uint64_t v62 = v19;
  id v67 = v21;
  if (!v19)
  {
    id v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1722, @"Invalid parameter not satisfying: %@", @"entitlementWitness" object file lineNumber description];

    id v21 = v67;
  }
  uint64_t v22 = v20;
  if (!v20)
  {
    id v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1723, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];

    id v21 = v67;
  }
  if (!v70)
  {
    id v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1724, @"Invalid parameter not satisfying: %@", @"taskQueue" object file lineNumber description];

    id v21 = v67;
  }
  if (!v71)
  {
    id v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1725, @"Invalid parameter not satisfying: %@", @"assetIndexesByTreatment" object file lineNumber description];

    id v21 = v67;
  }
  if (!v72)
  {
    id v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1726, @"Invalid parameter not satisfying: %@", @"assetIdsByFactorPack" object file lineNumber description];

    id v21 = v67;
  }
  if (v69)
  {
    if (v21) {
      goto LABEL_13;
    }
  }
  else
  {
    id v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1727, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    if (v67) {
      goto LABEL_13;
    }
  }
  id v57 = [MEMORY[0x1E4F28B00] currentHandler];
  [v57 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1728, @"Invalid parameter not satisfying: %@", @"notificationKey" object file lineNumber description];

LABEL_13:
  if (!v68)
  {
    uint64_t v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1729, @"Invalid parameter not satisfying: %@", @"taskAttribution" object file lineNumber description];
  }
  uint64_t v87 = 0;
  uint64_t v88 = &v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 0;
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke;
  v86[3] = &unk_1E6BBCCA8;
  v86[4] = &v87;
  [v71 enumerateKeysAndObjectsUsingBlock:v86];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_2;
  v85[3] = &unk_1E6BBCCD0;
  v85[4] = &v87;
  [v72 enumerateKeysAndObjectsUsingBlock:v85];
  if (v88[3])
  {
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_341;
    v83[3] = &unk_1E6BBCCF8;
    id v23 = v68;
    id v84 = v23;
    id v24 = (void *)MEMORY[0x1E016EA80](v83);
    *(void *)buf = 0;
    long long v78 = buf;
    uint64_t v79 = 0x3032000000;
    uint64_t v80 = __Block_byref_object_copy__35;
    id v81 = __Block_byref_object_dispose__35;
    id v82 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
    char v25 = (void *)MEMORY[0x1E016E7F0]();
    id v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v67, 0);
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_343;
    v74[3] = &unk_1E6BBCD20;
    id v27 = v24;
    id v75 = v27;
    unsigned int v76 = buf;
    [v70 enumerateTasksWithTagsIntersectingTagSet:v26 block:v74];

    if (v66)
    {
      uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v66];
      if ([v28 count] == 1)
      {
        uint64_t v61 = [v28 anyObject];
      }
      else
      {
        long long v31 = TRILogCategory_Server();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v91 = 138412290;
          id v92 = v28;
          _os_log_impl(&dword_1DA291000, v31, OS_LOG_TYPE_DEFAULT, "Received != 1 experiment id for TRIFetchOnDemandFactorsTask, so none will be logged. Received %@", v91, 0xCu);
        }

        uint64_t v61 = 0;
      }
    }
    else
    {
      uint64_t v61 = 0;
    }
    if (v65)
    {
      long long v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v65];
      if ([v32 count] == 1)
      {
        long long v33 = [v32 anyObject];
      }
      else
      {
        uint64_t v34 = TRILogCategory_Server();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v91 = 138412290;
          id v92 = v32;
          _os_log_impl(&dword_1DA291000, v34, OS_LOG_TYPE_DEFAULT, "Received != 1 deployment for TRIFetchOnDemandFactorsTask, so none will be logged. Received %@", v91, 0xCu);
        }

        long long v33 = 0;
      }
    }
    else
    {
      long long v33 = 0;
    }
    uint64_t v35 = objc_opt_new();
    uint64_t v36 = [v23 networkOptions];
    int v37 = [v36 allowsCellularAccess];

    if (v37)
    {
      id v38 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v39 = (void *)MEMORY[0x1E4FB01A0];
      id v40 = [v22 paths];
      id v41 = [v40 namespaceDescriptorsDefaultDir];
      uint64_t v42 = [v39 loadWithNamespaceName:v69 fromDirectory:v41];

      if (([v42 expensiveNetworkingAllowed] & 1) == 0)
      {
        id v43 = TRILogCategory_Server();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v91 = 138412290;
          id v92 = v69;
          _os_log_impl(&dword_1DA291000, v43, OS_LOG_TYPE_DEFAULT, "Changing TRIFetchOnDemandFactorsTask to require inexpensive networking since %@ does not support expensive networking", v91, 0xCu);
        }

        uint64_t v44 = [[TRITaskCapabilityModifier alloc] initWithAdd:1 remove:2];
        uint64_t v35 = v44;
      }
    }
    char v45 = +[TRIFetchOnDemandFactorsTask taskWithAssetIndexesByTreatment:v71 experimentId:v61 assetIdsByFactorPack:v72 rolloutFactorNames:v64 rolloutDeployment:v33 namespaceName:v69 taskAttributing:v23 notificationKey:v67 capabilityModifier:v35];
    id v73 = 0;
    int v46 = [v70 addTask:v45 options:*((void *)v78 + 5) taskId:&v73];
    if (v46)
    {
      if (v46 != 1)
      {
        if (v46 == 2)
        {
          id v47 = TRILogCategory_Server();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v91 = 0;
            _os_log_error_impl(&dword_1DA291000, v47, OS_LOG_TYPE_ERROR, "Enqueue TRIFetchOnDemandFactorsTask failed; completing request.",
              v91,
              2u);
          }

          [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:v67 withError:0];
        }
        goto LABEL_53;
      }
      id v50 = TRILogCategory_Server();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v91 = 138543618;
        id v92 = v67;
        __int16 v93 = 2112;
        id v94 = v73;
        _os_log_impl(&dword_1DA291000, v50, OS_LOG_TYPE_DEFAULT, "Ignored duplicate TRIFetchOnDemandFactorsTask with notification key: %{public}@, duplicate of task [tid:%@]", v91, 0x16u);
      }
    }
    else
    {
      id v48 = TRILogCategory_Server();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v91 = 138412546;
        id v92 = v73;
        __int16 v93 = 2114;
        id v94 = v67;
        _os_log_impl(&dword_1DA291000, v48, OS_LOG_TYPE_DEFAULT, "Enqueued TRIFetchOnDemandFactorsTask [tid:%@] with notification key: %{public}@", v91, 0x16u);
      }

      id v49 = objc_opt_class();
      id v50 = [v23 networkOptions];
      [v49 resumeTaskQueue:v70 forNetworkOptions:v50];
    }

LABEL_53:
    _Block_object_dispose(buf, 8);

    char v30 = v67;
    goto LABEL_54;
  }
  long long v29 = TRILogCategory_Server();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v29, OS_LOG_TYPE_INFO, "Nothing to download, no factor names provided", buf, 2u);
  }

  char v30 = v67;
  [MEMORY[0x1E4FB00D0] notifyDownloadProgressForKey:v67 withProgress:100];
  [MEMORY[0x1E4FB00D0] notifyDownloadCompletedForKey:v67];
LABEL_54:
  _Block_object_dispose(&v87, 8);
}

uint64_t __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_341(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)*MEMORY[0x1E4FB04E8];
  id v8 = [*(id *)(a1 + 32) applicationBundleIdentifier];
  if ([v7 isEqual:v8])
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v10 = (void *)*MEMORY[0x1E4FB04F8];
    uint64_t v11 = [*(id *)(a1 + 32) applicationBundleIdentifier];
    LOBYTE(v10) = [v10 isEqual:v11];

    if ((v10 & 1) != 0
      || ([*(id *)(a1 + 32) networkOptions],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 discretionaryBehavior],
          v12,
          !v13)
      && ([v5 discretionaryBehavior] == 2
       || ([v6 startDate], id v15 = objc_claimAutoreleasedReturnValue(), v15, v15)))
    {
      uint64_t v9 = 1;
      goto LABEL_9;
    }
    if ([v5 allowsCellularAccess])
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    id v8 = [*(id *)(a1 + 32) networkOptions];
    uint64_t v9 = [v8 allowsCellularAccess];
  }

LABEL_9:
  return v9;
}

void __257__TRIXPCNamespaceManagementRequestHandler__startDownloadAssetIndexesByTreatment_usingEntitlementWitness_serverContext_taskQueue_experimentIds_assetIdsByFactorPack_rolloutFactorNames_rolloutDeployments_namespace_taskAttribution_factorsState_notificationKey___block_invoke_343(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 task];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v5 task];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v8 taskAttribution];
    uint64_t v11 = [v10 networkOptions];
    LODWORD(v9) = (*(uint64_t (**)(uint64_t, void *, id))(v9 + 16))(v9, v11, v5);

    if (v9)
    {
      uint64_t v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v5 taskId];
        int v17 = 138412290;
        uint64_t v18 = v13;
        _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Found a preexisting TRIFetchOnDemandFactorsTask %@ with lower priority; attempting to replace with higher priority task.",
          (uint8_t *)&v17,
          0xCu);
      }
      uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyWithReplacementDuplicateTaskResolution:1];
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      *a3 = 1;
    }
  }
}

+ (void)_immediateDownloadForNamespaceNames:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 taskQueue:(id)a6 allowExpensiveNetworking:(BOOL)a7 taskAttribution:(id)a8 completion:(id)a9
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = (void (**)(id, void))a9;
  id v50 = v15;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1860, @"Invalid parameter not satisfying: %@", @"entitlementWitness" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  id v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1861, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];

  if (v17)
  {
LABEL_4:
    if (v14) {
      goto LABEL_5;
    }
LABEL_24:
    char v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1863, @"Invalid parameter not satisfying: %@", @"namespaceNames" object file lineNumber description];

    if (v18) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_23:
  uint64_t v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1862, @"Invalid parameter not satisfying: %@", @"taskQueue" object file lineNumber description];

  if (!v14) {
    goto LABEL_24;
  }
LABEL_5:
  if (v18) {
    goto LABEL_6;
  }
LABEL_25:
  int v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 1864, @"Invalid parameter not satisfying: %@", @"taskAttribution" object file lineNumber description];

LABEL_6:
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x3032000000;
  uint64_t v61 = __Block_byref_object_copy__35;
  uint64_t v62 = __Block_byref_object_dispose__35;
  id v63 = 0;
  id v20 = (void *)MEMORY[0x1E4FB00D0];
  id v21 = [v14 allObjects];
  uint64_t v22 = [v20 immediateDownloadNotificationKeyForNamespaceNames:v21];

  if (v22)
  {
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __179__TRIXPCNamespaceManagementRequestHandler__immediateDownloadForNamespaceNames_usingEntitlementWitness_serverContext_taskQueue_allowExpensiveNetworking_taskAttribution_completion___block_invoke;
    v57[3] = &unk_1E6BBCD48;
    v57[4] = &v58;
    id v49 = (void *)MEMORY[0x1E016EA80](v57);
    id v23 = (id)[MEMORY[0x1E4FB00D0] registerDownloadNotificationForKey:v22 queue:0 usingBlock:v49];
    id v24 = +[TRITaskQueuingOptions optionsWithDuplicateTaskResolution:1];
    id v47 = +[TRISetupAssistantFetchUtils registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext:v16];
    char v25 = +[TRISelectRolloutNotificationListTask taskWithNamespaceNames:v14 taskAttribution:v18];
    id v56 = 0;
    if ([v17 addTask:v25 options:v24 taskId:&v56] == 2)
    {
      id v26 = TRILogCategory_Server();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Enqueue TRISelectRolloutNotificationListTask failed", buf, 2u);
      }

      id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v66 = *MEMORY[0x1E4F28568];
      id v67 = @"Unable to enqueue TRISelectRolloutNotificationListTask";
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      uint64_t v29 = [v27 initWithDomain:@"TRIGeneralErrorDomain" code:13 userInfo:v28];
      char v30 = (void *)v59[5];
      v59[5] = v29;

      if (v19) {
        v19[2](v19, v59[5]);
      }
    }
    else
    {
      uint64_t v36 = TRILogCategory_Server();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v65 = v56;
        _os_log_impl(&dword_1DA291000, v36, OS_LOG_TYPE_DEFAULT, "Enqueued TRISelectRolloutNotificationListTask with [tid:%@]", buf, 0xCu);
      }

      int v37 = objc_opt_class();
      id v38 = [v18 networkOptions];
      [v37 resumeTaskQueue:v17 forNetworkOptions:v38];

      uint64_t v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      id v40 = objc_claimAutoreleasedReturnValue();
      id v41 = dispatch_queue_create((const char *)[v40 UTF8String], 0);

      *(_DWORD *)buf = 0;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __179__TRIXPCNamespaceManagementRequestHandler__immediateDownloadForNamespaceNames_usingEntitlementWitness_serverContext_taskQueue_allowExpensiveNetworking_taskAttribution_completion___block_invoke_358;
      handler[3] = &unk_1E6BBCD70;
      id v52 = v47;
      id v53 = v16;
      id v54 = v19;
      id v55 = &v58;
      notify_register_dispatch("com.apple.trial.TaskQueueComplete", (int *)buf, v41, handler);
    }
  }
  else
  {
    long long v31 = TRILogCategory_Server();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "immediateDownloadForNamespaceNames called for unexpected use case, please reach out to trial-device-dev@group.apple.com before using this.", buf, 2u);
    }

    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v68 = *MEMORY[0x1E4F28568];
    v69[0] = @"immediateDownloadForNamespaceNames called for unexpected use case, please reach out to trial-device-dev@group.apple.com";
    long long v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
    uint64_t v34 = [v32 initWithDomain:@"TRIGeneralErrorDomain" code:3 userInfo:v33];
    uint64_t v35 = (void *)v59[5];
    v59[5] = v34;

    if (v19) {
      v19[2](v19, v59[5]);
    }
  }

  _Block_object_dispose(&v58, 8);
}

void __179__TRIXPCNamespaceManagementRequestHandler__immediateDownloadForNamespaceNames_usingEntitlementWitness_serverContext_taskQueue_allowExpensiveNetworking_taskAttribution_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 type];
    uint64_t v9 = [v5 error];
    int v15 = 134218242;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Received download notification with type: %lu, error: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  [MEMORY[0x1E4FB00D0] deregisterNotificationWithToken:v6];

  if ([v5 type] == 2)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FB00D0];
    uint64_t v11 = [v5 error];
    uint64_t v12 = [v10 generalErrorFromDownloadNotificationError:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void __179__TRIXPCNamespaceManagementRequestHandler__immediateDownloadForNamespaceNames_usingEntitlementWitness_serverContext_taskQueue_allowExpensiveNetworking_taskAttribution_completion___block_invoke_358(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) builtTelemetry];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 40) client];
        uint64_t v10 = [v9 logger];
        uint64_t v11 = [*(id *)(a1 + 40) client];
        uint64_t v12 = [v11 trackingId];
        [v10 logWithTrackingId:v12 metrics:0 dimensions:0 trialSystemTelemetry:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, void))(v13 + 16))(v13, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  notify_cancel(a2);
}

+ (void)resumeTaskQueue:(id)a3 forNetworkOptions:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v6 discretionaryBehavior])
  {
    if ([v6 allowsCellularAccess]) {
      [a1 _resumeTaskQueueForDiscretionaryCellularWithQueue:v8];
    }
    else {
      [a1 _resumeTaskQueueForDiscretionaryWifiWithQueue:v8];
    }
  }
  else
  {
    id v7 = [[TRIRunningXPCActivityDescriptor alloc] initForImmediateWorkWithCapabilities:11];
    [v8 resumeWithXPCActivityDescriptor:v7 executeWhenSuspended:0];
  }
}

+ (void)_reregisterOneShotXPCActivityWithDescriptor:(id)a3 resumingTaskQueue:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 name];
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Re-registering one-shot XPC activity in hope of prompt execution: %{public}@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __105__TRIXPCNamespaceManagementRequestHandler__reregisterOneShotXPCActivityWithDescriptor_resumingTaskQueue___block_invoke_2;
  v10[3] = &unk_1E6BB8200;
  id v11 = v6;
  id v9 = v6;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v5 checkInBlock:&__block_literal_global_364 asyncHandler:v10];
}

void __105__TRIXPCNamespaceManagementRequestHandler__reregisterOneShotXPCActivityWithDescriptor_resumingTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  xpc_object_t v3 = xpc_activity_copy_criteria(v2);
  if (!v3) {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  }
  xpc_object_t xdict = v3;
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F14170], 0);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4F141A8], 0);
  xpc_activity_set_criteria(v2, xdict);
}

uint64_t __105__TRIXPCNamespaceManagementRequestHandler__reregisterOneShotXPCActivityWithDescriptor_resumingTaskQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resumeWithXPCActivityDescriptor:a2 executeWhenSuspended:0];
}

+ (void)_resumeTaskQueueForDiscretionaryWifiWithQueue:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryWifiWithQueue___block_invoke;
  block[3] = &unk_1E6BB82F8;
  id v9 = v3;
  uint64_t v4 = qword_1EA8D80C0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EA8D80C0, block);
  }
  id v6 = v9;
  id v7 = (id)_MergedGlobals_41;

  [v7 runAfterDelaySeconds:1 coalescingBehavior:10.0];
}

void __89__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryWifiWithQueue___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E016E7F0]();
  id v3 = objc_alloc(MEMORY[0x1E4F93B98]);
  uint64_t v4 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.trial.discretionary-wifi-coalesce" qosClass:17];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryWifiWithQueue___block_invoke_2;
  v7[3] = &unk_1E6BB82F8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v5 = [v3 initWithQueue:v4 operation:v7];

  id v6 = (void *)_MergedGlobals_41;
  _MergedGlobals_41 = v5;
}

void __89__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryWifiWithQueue___block_invoke_2(uint64_t a1)
{
  id v2 = +[TRILaunchDaemonActivityDescriptor clientTriggeredWifiDescriptor];
  +[TRIXPCNamespaceManagementRequestHandler _reregisterOneShotXPCActivityWithDescriptor:v2 resumingTaskQueue:*(void *)(a1 + 32)];
}

+ (void)_resumeTaskQueueForDiscretionaryCellularWithQueue:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryCellularWithQueue___block_invoke;
  block[3] = &unk_1E6BB82F8;
  id v9 = v3;
  uint64_t v4 = qword_1EA8D80D0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_1EA8D80D0, block);
  }
  id v6 = v9;
  id v7 = (id)qword_1EA8D80C8;

  [v7 runAfterDelaySeconds:1 coalescingBehavior:10.0];
}

void __93__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryCellularWithQueue___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E016E7F0]();
  id v3 = objc_alloc(MEMORY[0x1E4F93B98]);
  uint64_t v4 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.trial.discretionary-cellular-coalesce" qosClass:17];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryCellularWithQueue___block_invoke_2;
  v7[3] = &unk_1E6BB82F8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v5 = [v3 initWithQueue:v4 operation:v7];

  id v6 = (void *)qword_1EA8D80C8;
  qword_1EA8D80C8 = v5;
}

void __93__TRIXPCNamespaceManagementRequestHandler__resumeTaskQueueForDiscretionaryCellularWithQueue___block_invoke_2(uint64_t a1)
{
  id v2 = +[TRILaunchDaemonActivityDescriptor clientTriggeredCellularDescriptor];
  +[TRIXPCNamespaceManagementRequestHandler _reregisterOneShotXPCActivityWithDescriptor:v2 resumingTaskQueue:*(void *)(a1 + 32)];
}

+ (void)_removeAssetFactors:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 taskQueue:(id)a6 namespace:(id)a7 factorsState:(id)a8 removeImmediately:(BOOL)a9 completion:(id)a10
{
  v115[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v79 = a6;
  id v19 = a7;
  id v78 = a8;
  uint64_t v80 = (void (**)(id, void))a10;
  char v77 = v17;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    id v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2020, @"Invalid parameter not satisfying: %@", @"entitlementWitness" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  id v65 = [MEMORY[0x1E4F28B00] currentHandler];
  [v65 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2021, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];

LABEL_3:
  if (v79)
  {
    if (v16) {
      goto LABEL_5;
    }
LABEL_42:
    id v67 = [MEMORY[0x1E4F28B00] currentHandler];
    [v67 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2023, @"Invalid parameter not satisfying: %@", @"factorNames" object file lineNumber description];

    if (v19) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
  uint64_t v66 = [MEMORY[0x1E4F28B00] currentHandler];
  [v66 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2022, @"Invalid parameter not satisfying: %@", @"taskQueue" object file lineNumber description];

  if (!v16) {
    goto LABEL_42;
  }
LABEL_5:
  if (v19) {
    goto LABEL_6;
  }
LABEL_43:
  uint64_t v68 = [MEMORY[0x1E4F28B00] currentHandler];
  [v68 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2024, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_6:
  uint64_t v20 = (void *)MEMORY[0x1E016E7F0]();
  id v21 = [v18 keyValueStore];
  uint64_t v22 = +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:v21];

  id v23 = [v22 subscribedFactorsForNamespaceName:v19];
  id v24 = (void *)[v23 mutableCopy];

  char v25 = [MEMORY[0x1E4F1CA80] setWithArray:v24];
  id v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
  [v25 minusSet:v26];

  id v27 = TRILogCategory_Server();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v19;
    _os_log_impl(&dword_1DA291000, v27, OS_LOG_TYPE_DEFAULT, "Unsubscribe factor %{public}@ in namespace '%{public}@'", buf, 0x16u);
  }

  uint64_t v28 = [v25 allObjects];

  id v109 = 0;
  char v29 = [v22 setSubscriptionWithFactorNames:v28 inNamespaceName:v19 error:&v109];
  id v30 = v109;
  if (v29)
  {

    *(void *)buf = 0;
    id v101 = 0;
    long long v31 = (void *)MEMORY[0x1E4FB0150];
    id v32 = [v18 paths];
    LODWORD(v31) = [v31 validateDownloadForFactors:v16 withNamespace:v19 paths:v32 container:0 factorsState:v78 assetIndexesByTreatment:buf experimentIds:0 assetIdsByFactorPack:&v101 rolloutFactorNames:0 rolloutDeployments:0 error:0];

    if (v31)
    {
      unsigned int v76 = [(id)objc_opt_class() _notificationKeyWithNamespace:v19 assetIndexesByTreatment:*(void *)buf assetIdsByFactorPack:v101];
    }
    else
    {
      unsigned int v76 = 0;
    }

    if (v76 && ([v79 cancelTasksWithTag:v76] & 1) == 0)
    {
      uint64_t v34 = TRILogCategory_Server();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v76;
        _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "Unable to cancel downloading task with notification key: '%{public}@'", buf, 0xCu);
      }
    }
    id v35 = objc_alloc(MEMORY[0x1E4FB01D0]);
    uint64_t v36 = [v18 paths];
    id v74 = (void *)[v35 initWithPaths:v36 factorsState:v78];

    if (v74)
    {
      int v37 = (void *)MEMORY[0x1E4FB01B0];
      id v38 = [v18 paths];
      id v73 = [v37 factorProviderWithPaths:v38 namespaceName:v19 resolver:v74];

      id v107 = 0;
      id v108 = 0;
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke;
      v105[3] = &unk_1E6BBCDB8;
      id v39 = v19;
      id v106 = v39;
      [v73 computeTreatmentAssetIndexes:&v108 withAssociatedExperimentIds:0 andFactorPackAssetIds:&v107 withAssociatedRolloutDeployments:0 withExperimentFactorNames:0 andRolloutFactorNames:0 forFactors:v16 usingFilter:v105];
      id v40 = [TRIClientTreatmentStorage alloc];
      id v41 = [v18 paths];
      uint64_t v42 = [(TRIClientTreatmentStorage *)v40 initWithPaths:v41];

      id v43 = [TRIFactorPackStorage alloc];
      uint64_t v44 = [v18 paths];
      id v71 = [(TRIFactorPackStorage *)v43 initWithPaths:v44];

      id v45 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      int v46 = [v73 factorNamesWithObfuscation:v16];
      id v47 = (void *)[v45 initWithArray:v46];

      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      long long v111 = __Block_byref_object_copy__35;
      long long v112 = __Block_byref_object_dispose__35;
      id v113 = 0;
      id v101 = 0;
      id v102 = &v101;
      uint64_t v103 = 0x2020000000;
      char v104 = 0;
      id v48 = v108;
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_381;
      v94[3] = &unk_1E6BBCDE0;
      v99 = &v101;
      id v49 = v39;
      id v95 = v49;
      id v50 = v18;
      id v96 = v50;
      id v70 = v42;
      uint64_t v97 = v70;
      id v51 = v47;
      id v98 = v51;
      uint64_t v100 = buf;
      [v48 enumerateKeysAndObjectsUsingBlock:v94];
      if (a9) {
        char v52 = 3;
      }
      else {
        char v52 = 1;
      }
      id v53 = [TRIAssetStore alloc];
      id v54 = [v50 paths];
      id v55 = [(TRIAssetStore *)v53 initWithPaths:v54];

      id v56 = v107;
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_386;
      v82[3] = &unk_1E6BBCE08;
      uint64_t v90 = &v101;
      id v69 = v71;
      v83 = v69;
      id v57 = v49;
      id v84 = v57;
      char v92 = v52;
      id v72 = v51;
      id v85 = v72;
      id v91 = buf;
      id v86 = v50;
      id v58 = v73;
      id v87 = v58;
      id v88 = v16;
      BOOL v93 = a9;
      id v59 = v55;
      uint64_t v89 = v59;
      [v56 enumerateKeysAndObjectsUsingBlock:v82];
      if (*((unsigned char *)v102 + 24))
      {
        [MEMORY[0x1E4FB01E8] notifyUpdateForNamespaceName:v57];
      }
      else
      {
        id v63 = TRILogCategory_Server();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v81 = 0;
          _os_log_impl(&dword_1DA291000, v63, OS_LOG_TYPE_INFO, "Nothing to remove. No local asset found.", v81, 2u);
        }
      }
      if (v80) {
        v80[2](v80, *(void *)(*(void *)&buf[8] + 40));
      }

      _Block_object_dispose(&v101, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v58 = (id)[[NSString alloc] initWithFormat:@"Unable to resolve namespaces for stale factorsState: %@", v78];
      id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v114 = *MEMORY[0x1E4F28568];
      v115[0] = v58;
      uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:&v114 count:1];
      uint64_t v62 = (void *)[v60 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v61];

      if (v80) {
        ((void (**)(id, void *))v80)[2](v80, v62);
      }
    }
  }
  else
  {
    long long v33 = TRILogCategory_Server();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Unable to update on-demand asset subscription, error: %{public}@", buf, 0xCu);
    }

    if (v80) {
      ((void (**)(id, id))v80)[2](v80, v30);
    }
  }
}

uint64_t __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v9 localizedDescription];
      int v21 = 138543362;
      id v22 = v11;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Error removing on-demand asset, %{public}@", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_13;
  }
  if (([v8 isOnDemand] & 1) == 0)
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v21 = 138543618;
      id v22 = v7;
      __int16 v23 = 2114;
      uint64_t v24 = v15;
      id v16 = "Ignore removal of asset of factor \"%{public}@\" in namespace \"%{public}@\" which is not on-demand";
      id v17 = v10;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
      _os_log_impl(&dword_1DA291000, v17, v18, v16, (uint8_t *)&v21, 0x16u);
    }
LABEL_13:

    uint64_t v14 = 0;
    goto LABEL_14;
  }
  if (![v8 hasPath]
    || ([v8 path],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 length],
        v12,
        !v13))
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      int v21 = 138543618;
      id v22 = v7;
      __int16 v23 = 2114;
      uint64_t v24 = v19;
      id v16 = "Ignore removal of asset of factor \"%{public}@\" in namespace \"%{public}@\" which does not have local path";
      id v17 = v10;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v14 = 1;
LABEL_14:

  return v14;
}

void __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_381(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  id v7 = (void *)MEMORY[0x1E4FB01A0];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) paths];
  uint64_t v10 = [v9 namespaceDescriptorsRolloutDir];
  id v11 = [v7 loadWithNamespaceName:v8 fromDirectory:v10];

  uint64_t v12 = [*(id *)(a1 + 48) updateSavedTreatmentWithTreatmentId:v5 deletingAssetsWithFactorNames:*(void *)(a1 + 56) forNamespaceName:*(void *)(a1 + 32) forRollouts:v11 != 0];
  if (!v12)
  {
    uint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v5;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unable to update treatment %@ with asset removal of %@", buf, 0x16u);
    }

    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      id v26 = @"Unable to update treatment with one or more asset removal";
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v16 = [v14 errorWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v15];
      uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
      os_log_type_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
  if (_os_feature_enabled_impl())
  {
    BOOL v19 = v11 != 0;
    uint64_t v20 = [TRIFBClientTreatmentStorage alloc];
    int v21 = [*(id *)(a1 + 40) paths];
    id v22 = [(TRIFBClientTreatmentStorage *)v20 initWithPaths:v21];

    __int16 v23 = [(TRIFBClientTreatmentStorage *)v22 updateSavedTreatmentWithTreatmentId:v5 deletingAssetsWithFactorNames:*(void *)(a1 + 56) forNamespaceName:*(void *)(a1 + 32) forRollouts:v19];
    if (([v12 isEqual:v23] & 1) == 0)
    {
      uint64_t v24 = TRILogCategory_Server();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v23;
        __int16 v29 = 2112;
        id v30 = v12;
        _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "Updated treatment from fb storage: %@ does not match treatment from pb storage: %@", buf, 0x16u);
      }
    }
  }
}

void __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_386(uint64_t a1, void *a2, void *a3)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  if (([*(id *)(a1 + 32) updateSavedFactorPackWithId:v5 namespaceName:*(void *)(a1 + 40) deletingAssetsWithFactorNames:*(void *)(a1 + 48) inUseAssetBehavior:*(unsigned __int8 *)(a1 + 104)] & 1) == 0&& !*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"Unable to update treatment with one or more asset removal";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v9 = [v7 errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  uint64_t v12 = [*(id *)(a1 + 32) pathForFactorPackWithId:v5 namespaceName:*(void *)(a1 + 40)];
  uint64_t v13 = [v12 stringByAppendingPathComponent:@"factorPack.fb"];
  uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v15 = [v14 fileExistsAtPath:v13];

  if (v15 && _os_feature_enabled_impl())
  {
    uint64_t v16 = [TRIFBFactorPackStorage alloc];
    uint64_t v17 = [*(id *)(a1 + 56) paths];
    os_log_type_t v18 = [(TRIFBFactorPackStorage *)v16 initWithPaths:v17];

    uint64_t v19 = *(void *)(a1 + 40);
    id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    int v21 = [*(id *)(a1 + 64) factorNamesWithObfuscation:*(void *)(a1 + 72)];
    id v22 = (void *)[v20 initWithArray:v21];
    LOBYTE(v19) = [(TRIFBFactorPackStorage *)v18 updateSavedFactorLevelsWithFactorPackId:v5 namespaceName:v19 deletingAssetsWithFactorNames:v22 inUseAssetBehavior:*(unsigned __int8 *)(a1 + 104)];

    if ((v19 & 1) == 0)
    {
      __int16 v23 = TRILogCategory_Server();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v5;
        _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "Could not update saved factor levels for remove asset for factor pack id: %@", buf, 0xCu);
      }
    }
  }
  if (*(unsigned char *)(a1 + 105))
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    _OWORD v24[2] = __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_392;
    v24[3] = &unk_1E6BBAF60;
    id v25 = *(id *)(a1 + 80);
    [v6 enumerateObjectsUsingBlock:v24];
  }
}

void __163__TRIXPCNamespaceManagementRequestHandler__removeAssetFactors_usingEntitlementWitness_serverContext_taskQueue_namespace_factorsState_removeImmediately_completion___block_invoke_392(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 assetId];
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Immediately removing %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = [v3 assetId];
  [v6 removeAssetWithIdentifier:v7];
}

+ (void)_setProvisionalFactorPackId:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 forNamespaceName:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = (void (**)(id, uint64_t, id))a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2212, @"Invalid parameter not satisfying: %@", @"entitlementWitness" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_10:
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2214, @"Invalid parameter not satisfying: %@", @"factorPackId" object file lineNumber description];

      if (v16) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  __int16 v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2213, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_4:
  if (v16) {
    goto LABEL_5;
  }
LABEL_11:
  id v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2215, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_5:
  os_log_type_t v18 = [TRINamespaceResolverStorage alloc];
  uint64_t v19 = [v15 paths];
  id v20 = [(TRINamespaceResolverStorage *)v18 initWithPaths:v19];

  id v26 = 0;
  uint64_t v21 = [(TRINamespaceResolverStorage *)v20 setProvisionalFactorPackId:v13 forNamespaceName:v16 error:&v26];
  if (v17) {
    v17[2](v17, v21, v26);
  }
}

+ (void)_rejectFactorPackId:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 forNamespaceName:(id)a6 rolloutDeployment:(id)a7 completion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = (void (**)(id, uint64_t, id))a8;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2232, @"Invalid parameter not satisfying: %@", @"entitlementWitness" object file lineNumber description];

    if (v17)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_10:
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2234, @"Invalid parameter not satisfying: %@", @"factorPackId" object file lineNumber description];

      if (v18) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  id v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2233, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];

  if (!v15) {
    goto LABEL_10;
  }
LABEL_4:
  if (v18) {
    goto LABEL_5;
  }
LABEL_11:
  uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2235, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_5:
  uint64_t v21 = [TRINamespaceResolverStorage alloc];
  id v22 = [v17 paths];
  __int16 v23 = [(TRINamespaceResolverStorage *)v21 initWithPaths:v22];

  id v29 = 0;
  uint64_t v24 = [(TRINamespaceResolverStorage *)v23 rejectFactorPackId:v15 forNamespaceName:v18 rolloutDeployment:v19 error:&v29];
  if (v20) {
    v20[2](v20, v24, v29);
  }
}

+ (void)_promoteFactorPackId:(id)a3 usingEntitlementWitness:(id)a4 serverContext:(id)a5 forNamespaceName:(id)a6 rolloutDeployment:(id)a7 completion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = (void (**)(id, uint64_t, id))a8;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2252, @"Invalid parameter not satisfying: %@", @"entitlementWitness" object file lineNumber description];

    if (v17)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_10:
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2254, @"Invalid parameter not satisfying: %@", @"factorPackId" object file lineNumber description];

      if (v18) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  id v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2253, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];

  if (!v15) {
    goto LABEL_10;
  }
LABEL_4:
  if (v18) {
    goto LABEL_5;
  }
LABEL_11:
  uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, a1, @"TRIXPCNamespaceManagementService.m", 2255, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_5:
  uint64_t v21 = [TRINamespaceResolverStorage alloc];
  id v22 = [v17 paths];
  __int16 v23 = [(TRINamespaceResolverStorage *)v21 initWithPaths:v22];

  id v29 = 0;
  uint64_t v24 = [(TRINamespaceResolverStorage *)v23 promoteFactorPackId:v15 forNamespaceName:v18 rolloutDeployment:v19 error:&v29];
  if (v20) {
    v20[2](v20, v24, v29);
  }
}

- (void).cxx_destruct
{
}

@end