@interface TRIAllocationStatusDefaultProvider
- (BOOL)enumerateActiveExperimentsForEnvironment:(int)a3 error:(id *)a4 block:(id)a5;
- (BOOL)enumerateActiveRolloutsWithError:(id *)a3 block:(id)a4;
- (BOOL)enumerateSampledActiveExperimentsForEnvironment:(int)a3 correlationID:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)enumerateSampledActiveRolloutsForCorrelationID:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)removeUpdateHandlerForToken:(id)a3;
- (TRIAllocationStatusDefaultProvider)init;
- (id)_defaultQueue;
- (id)activeBMLTInformationWithError:(id *)a3;
- (id)activeExperimentInformationWithError:(id *)a3;
- (id)addStatusUpdateHandlerForEnvironment:(int)a3 queue:(id)a4 block:(id)a5;
- (id)enumerateExperimentStatusesForEnvironment:(int)a3 privacyFilterPolicy:(unsigned __int8)a4 startingFromCursor:(id)a5 error:(id *)a6 block:(id)a7;
- (id)enumerateExperimentStatusesForEnvironment:(int)a3 startingFromCursor:(id)a4 error:(id *)a5 block:(id)a6;
- (id)enumerateExperimentStatusesForTestingPrivacyFilterPolicyWithEnvironment:(int)a3 startingFromCursor:(id)a4 error:(id *)a5 block:(id)a6;
- (id)syncProxyWithErrorHandler:(id)a3;
- (void)dealloc;
@end

@implementation TRIAllocationStatusDefaultProvider

- (TRIAllocationStatusDefaultProvider)init
{
  v49.receiver = self;
  v49.super_class = (Class)TRIAllocationStatusDefaultProvider;
  v2 = [(TRIAllocationStatusDefaultProvider *)&v49 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEFE1190];
    v4 = (void *)MEMORY[0x19F3AD060]();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v5 forSelector:sel_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion_ argumentIndex:0 ofReply:1];

    v6 = (void *)MEMORY[0x19F3AD060]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    [v3 setClasses:v9 forSelector:sel_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion_ argumentIndex:1 ofReply:1];

    v10 = (void *)MEMORY[0x19F3AD060]();
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v11 forSelector:sel_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion_ argumentIndex:2 ofReply:1];

    v12 = (void *)MEMORY[0x19F3AD060]();
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    [v3 setClasses:v15 forSelector:sel_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion_ argumentIndex:0 ofReply:1];

    v16 = (void *)MEMORY[0x19F3AD060]();
    id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    [v3 setClasses:v19 forSelector:sel_rolloutRecordsWithCompletion_ argumentIndex:0 ofReply:1];

    v20 = (void *)MEMORY[0x19F3AD060]();
    id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
    [v3 setClasses:v23 forSelector:sel_bmltRecordsWithCompletion_ argumentIndex:0 ofReply:1];

    v24 = (void *)MEMORY[0x19F3AD060]();
    id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
    [v3 setClasses:v27 forSelector:sel_rolloutAllocationStatusWithPrivacyFilterPolicy_completion_ argumentIndex:0 ofReply:1];

    id v28 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v29 = TRILogCategory_ClientFramework();
    uint64_t v30 = [v28 initWithServiceName:@"com.apple.trial.status" allowlistedServerInterface:v3 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 allowSystemToUserConnection:1 interruptionHandler:&__block_literal_global_18 invalidationHandler:&__block_literal_global_98 logHandle:v29];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (_PASXPCClientHelper *)v30;

    v32 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEFE10D0];
    v33 = (void *)MEMORY[0x19F3AD060]();
    id v34 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v34, "initWithObjects:", v35, v36, v37, objc_opt_class(), 0);
    [v32 setClasses:v38 forSelector:sel_activeExperimentInformationWithPrivacyFilterPolicy_completion_ argumentIndex:0 ofReply:1];

    id v39 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v40 = TRILogCategory_ClientFramework();
    uint64_t v41 = [v39 initWithServiceName:@"com.apple.triald.internal" allowlistedServerInterface:v32 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 allowSystemToUserConnection:1 interruptionHandler:&__block_literal_global_146 invalidationHandler:&__block_literal_global_148 logHandle:v40];
    internalHelper = v2->_internalHelper;
    v2->_internalHelper = (_PASXPCClientHelper *)v41;

    v43 = objc_opt_new();
    uint64_t v44 = objc_opt_new();
    v45 = (void *)v43[1];
    v43[1] = v44;

    uint64_t v46 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v43];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v46;
  }
  return v2;
}

- (void)dealloc
{
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_154];
  v3.receiver = self;
  v3.super_class = (Class)TRIAllocationStatusDefaultProvider;
  [(TRIAllocationStatusDefaultProvider *)&v3 dealloc];
}

void __45__TRIAllocationStatusDefaultProvider_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a2 + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        notify_cancel(objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "intValue", (void)v7));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)syncProxyWithErrorHandler:(id)a3
{
  return (id)[(_PASXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (id)_defaultQueue
{
  if (qword_1EB3B7760 != -1) {
    dispatch_once(&qword_1EB3B7760, &__block_literal_global_158);
  }
  id v2 = (void *)_MergedGlobals_1;
  return v2;
}

void __51__TRIAllocationStatusDefaultProvider__defaultQueue__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.trial.status" qosClass:17];
  id v2 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v1;
}

- (id)enumerateExperimentStatusesForEnvironment:(int)a3 startingFromCursor:(id)a4 error:(id *)a5 block:(id)a6
{
  return [(TRIAllocationStatusDefaultProvider *)self enumerateExperimentStatusesForEnvironment:*(void *)&a3 privacyFilterPolicy:1 startingFromCursor:a4 error:a5 block:a6];
}

- (id)enumerateExperimentStatusesForTestingPrivacyFilterPolicyWithEnvironment:(int)a3 startingFromCursor:(id)a4 error:(id *)a5 block:(id)a6
{
  return [(TRIAllocationStatusDefaultProvider *)self enumerateExperimentStatusesForEnvironment:*(void *)&a3 privacyFilterPolicy:2 startingFromCursor:a4 error:a5 block:a6];
}

- (id)enumerateExperimentStatusesForEnvironment:(int)a3 privacyFilterPolicy:(unsigned __int8)a4 startingFromCursor:(id)a5 error:(id *)a6 block:(id)a7
{
  unsigned int v54 = a4;
  v110[1] = *MEMORY[0x1E4F143B8];
  id v49 = a5;
  v52 = (void (**)(id, void *, uint8_t *))a7;
  if (!v52)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 224, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    *(void *)v100 = 0;
    v101 = v100;
    uint64_t v102 = 0x3032000000;
    v103 = __Block_byref_object_copy__7;
    v104 = __Block_byref_object_dispose__7;
    id v105 = 0;
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke;
    v97[3] = &unk_1E596B038;
    v99 = v100;
    v55 = v9;
    v98 = v55;
    v48 = (void *)MEMORY[0x19F3AD290](v97);
    v56 = [(_PASXPCClientHelper *)self->_clientHelper remoteObjectProxyWithErrorHandler:v48];
    if (v49) {
      [v49 date];
    }
    else {
    v58 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    BOOL v12 = 0;
    uint64_t v50 = *MEMORY[0x1E4F28568];
    while (1)
    {
      if (v12)
      {
        v45 = [TRIAllocationStatusCursor alloc];
        [v58 timeIntervalSince1970];
        v11 = -[TRIAllocationStatusCursor initWithSecondsFromEpoch:](v45, "initWithSecondsFromEpoch:");
        goto LABEL_58;
      }
      uint64_t v91 = 0;
      v92 = &v91;
      uint64_t v93 = 0x3032000000;
      v94 = __Block_byref_object_copy__7;
      v95 = __Block_byref_object_dispose__7;
      id v96 = 0;
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x3032000000;
      v88 = __Block_byref_object_copy__7;
      v89 = __Block_byref_object_dispose__7;
      id v90 = 0;
      uint64_t v79 = 0;
      v80 = &v79;
      uint64_t v81 = 0x3032000000;
      v82 = __Block_byref_object_copy__7;
      v83 = __Block_byref_object_dispose__7;
      id v84 = 0;
      uint64_t v73 = 0;
      v74 = &v73;
      uint64_t v75 = 0x3032000000;
      v76 = __Block_byref_object_copy__7;
      v77 = __Block_byref_object_dispose__7;
      id v78 = 0;
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke_2;
      v67[3] = &unk_1E596B060;
      id v13 = v55;
      v68 = v13;
      v69 = &v91;
      v70 = &v85;
      v71 = &v79;
      v72 = &v73;
      [v56 experimentHistoryRecordsWithLimit:100 newerThanDate:v58 privacyFilterPolicy:v54 deploymentEnvironment:a3 completion:v67];
      if ([MEMORY[0x1E4F93B18] waitForSemaphore:v13 timeoutSeconds:10.0])
      {
        uint64_t v14 = NSString;
        v15 = NSStringFromSelector(a2);
        v16 = [v14 stringWithFormat:@"Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@.", v15];

        if (a6)
        {
          id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v109 = v50;
          v110[0] = v16;
          uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:&v109 count:1];
          *a6 = (id)[v17 initWithDomain:@"TRIGeneralErrorDomain" code:7 userInfo:v18];
        }
        v19 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412290;
          v108 = v44;
          _os_log_error_impl(&dword_19D909000, v19, OS_LOG_TYPE_ERROR, "Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@.", buf, 0xCu);
        }
      }
      else
      {
        id v21 = (void *)*((void *)v101 + 5);
        if (v21)
        {
          if (a6)
          {
            id v22 = v21;
LABEL_25:
            BOOL v12 = 0;
            char v20 = 0;
            *a6 = v22;
            goto LABEL_20;
          }
        }
        else
        {
          if (v92[5])
          {
            v23 = (void *)v74[5];
            if (v23)
            {
              id v24 = v23;

              v58 = v24;
            }
            v62 = +[TRIAllocationStatus internalToExternalStatusMapping];
            buf[0] = 0;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            id obj = (id)v92[5];
            uint64_t v25 = [obj countByEnumeratingWithState:&v63 objects:v106 count:16];
            if (!v25)
            {
LABEL_48:

              BOOL v12 = [(id)v80[5] intValue] < 0x64 || buf[0] != 0;
              char v20 = 1;
              goto LABEL_20;
            }
            uint64_t v60 = *(void *)v64;
            while (2)
            {
              uint64_t v26 = 0;
              uint64_t v61 = v25;
LABEL_32:
              if (*(void *)v64 != v60) {
                objc_enumerationMutation(obj);
              }
              v27 = *(void **)(*((void *)&v63 + 1) + 8 * v26);
              id v28 = (void *)MEMORY[0x19F3AD060]();
              v29 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v27, "eventType"));
              uint64_t v30 = [v62 objectForKeyedSubscript:v29];
              unsigned __int8 v31 = [v30 intValue];

              if (!v31) {
                goto LABEL_40;
              }
              v32 = [v27 namespaces];
              if (!v32) {
                goto LABEL_40;
              }
              v33 = [v27 treatmentId];
              if (v33 == @"unspecified-or-default-treatment")
              {
                int v42 = 7;
                goto LABEL_43;
              }
              BOOL v34 = [v27 deploymentId] == -1;

              if (!v34)
              {
                uint64_t v35 = [TRIExperimentAllocationStatus alloc];
                uint64_t v36 = [v27 eventDate];
                uint64_t v37 = [v27 experimentId];
                uint64_t v38 = [v27 deploymentId];
                id v39 = [v27 treatmentId];
                v40 = [v27 namespaces];
                v32 = [(TRIExperimentAllocationStatus *)v35 initWithType:v31 date:v36 experimentId:v37 deploymentId:v38 treatmentId:v39 namespaces:v40];

                v52[2](v52, v32, buf);
                if (buf[0])
                {
                  uint64_t v41 = [v27 eventDate];

                  int v42 = 6;
                  v58 = (void *)v41;
                }
                else
                {
                  int v42 = 0;
                }
LABEL_43:
              }
              else
              {
LABEL_40:
                int v42 = 7;
              }
              if (v42 != 7 && v42) {
                goto LABEL_48;
              }
              if (v61 == ++v26)
              {
                uint64_t v25 = [obj countByEnumeratingWithState:&v63 objects:v106 count:16];
                if (!v25) {
                  goto LABEL_48;
                }
                continue;
              }
              goto LABEL_32;
            }
          }
          if (a6)
          {
            id v22 = (id) v86[5];
            goto LABEL_25;
          }
        }
      }
      BOOL v12 = 0;
      char v20 = 0;
LABEL_20:

      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v79, 8);

      _Block_object_dispose(&v85, 8);
      _Block_object_dispose(&v91, 8);

      if ((v20 & 1) == 0)
      {
        v11 = 0;
LABEL_58:

        _Block_object_dispose(v100, 8);
        goto LABEL_59;
      }
    }
  }
  long long v10 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v100 = 0;
    _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "unable to enumerate experiment statuses while device is class C locked", v100, 2u);
  }

  if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_59:

  return v11;
}

void __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke_3;
  v18[3] = &unk_1E596A0B0;
  id v19 = *(id *)(a1 + 32);
  uint64_t v14 = (void (**)(void))MEMORY[0x19F3AD290](v18);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v12;
  id v17 = v12;

  if (v14) {
    v14[2](v14);
  }
}

intptr_t __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)enumerateActiveExperimentsForEnvironment:(int)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v9 = (void (**)(id, void, uint8_t *))a5;
  if (!v9)
  {
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 324, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    *(void *)long long v65 = 0;
    long long v66 = v65;
    uint64_t v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__7;
    v69 = __Block_byref_object_dispose__7;
    id v70 = 0;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke;
    v57[3] = &unk_1E596B038;
    v59 = v65;
    id v11 = v10;
    v58 = v11;
    id v12 = (void *)MEMORY[0x19F3AD290](v57);
    id v13 = [(_PASXPCClientHelper *)self->_clientHelper remoteObjectProxyWithErrorHandler:v12];
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    unsigned int v54 = __Block_byref_object_copy__7;
    v55 = __Block_byref_object_dispose__7;
    id v56 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__7;
    id v49 = __Block_byref_object_dispose__7;
    id v50 = 0;
    uint64_t v14 = (void *)MEMORY[0x19F3AD060]();
    id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v16 = [NSNumber numberWithInt:v6];
    id v17 = objc_msgSend(v15, "initWithObjects:", v16, 0);

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke_2;
    v41[3] = &unk_1E596B088;
    uint64_t v18 = v11;
    int v42 = v18;
    v43 = &v45;
    uint64_t v44 = &v51;
    [v13 experimentRecordsWithDeploymentEnvironments:v17 privacyFilterPolicy:1 completion:v41];

    if ([MEMORY[0x1E4F93B18] waitForSemaphore:v18 timeoutSeconds:10.0])
    {
      id v19 = NSString;
      char v20 = NSStringFromSelector(a2);
      id v21 = [v19 stringWithFormat:@"Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@.", v20];

      if (a4)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v63 = *MEMORY[0x1E4F28568];
        long long v64 = v21;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        *a4 = (id)[v22 initWithDomain:@"TRIGeneralErrorDomain" code:7 userInfo:v23];
      }
      id v24 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v62 = v35;
        _os_log_error_impl(&dword_19D909000, v24, OS_LOG_TYPE_ERROR, "Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@.", buf, 0xCu);
      }
      goto LABEL_10;
    }
    v27 = (void *)*((void *)v66 + 5);
    if (v27)
    {
      if (!a4)
      {
LABEL_10:
        BOOL v25 = 0;
LABEL_11:

        _Block_object_dispose(&v45, 8);
        _Block_object_dispose(&v51, 8);

        _Block_object_dispose(v65, 8);
        goto LABEL_21;
      }
      id v28 = v27;
    }
    else
    {
      uint64_t v30 = (void *)v52[5];
      if (v30)
      {
        buf[0] = 0;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v31 = v30;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v60 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v38;
LABEL_25:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v38 != v33) {
              objc_enumerationMutation(v31);
            }
            v9[2](v9, *(void *)(*((void *)&v37 + 1) + 8 * v34), buf);
            if (buf[0]) {
              break;
            }
            if (v32 == ++v34)
            {
              uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v60 count:16];
              if (v32) {
                goto LABEL_25;
              }
              break;
            }
          }
        }

        BOOL v25 = 1;
        goto LABEL_11;
      }
      if (!a4) {
        goto LABEL_10;
      }
      id v28 = (id) v46[5];
    }
    BOOL v25 = 0;
    *a4 = v28;
    goto LABEL_11;
  }
  uint64_t v26 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long v65 = 67240192;
    *(_DWORD *)&v65[4] = qos_class_self();
    _os_log_error_impl(&dword_19D909000, v26, OS_LOG_TYPE_ERROR, "unable to enumerate active experiments while device is class C locked qos:%{public}u", v65, 8u);
  }

  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v25 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_21:

  return v25;
}

void __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v32 = a2;
  id v30 = a3;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke_3;
  v48[3] = &unk_1E596A0B0;
  uint64_t v33 = a1;
  id v49 = *(id *)(a1 + 32);
  id v31 = (id)MEMORY[0x19F3AD290](v48);
  if (v32)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v32;
    uint64_t v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16, v30);
    if (v38)
    {
      uint64_t v37 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v45 != v37) {
            objc_enumerationMutation(obj);
          }
          long long v8 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if ([v8 status] == 1)
          {
            dispatch_semaphore_t v9 = [v8 treatmentId];
            BOOL v10 = v9 == 0;

            if (!v10)
            {
              id v11 = objc_opt_new();
              long long v42 = 0u;
              long long v43 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              id v12 = [v8 namespaces];
              uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v50 count:16];
              if (v13)
              {
                uint64_t v14 = *(void *)v41;
                do
                {
                  for (uint64_t j = 0; j != v13; ++j)
                  {
                    if (*(void *)v41 != v14) {
                      objc_enumerationMutation(v12);
                    }
                    v16 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                    id v17 = [TRIVersionedNamespace alloc];
                    uint64_t v18 = [v16 name];
                    id v19 = -[TRIVersionedNamespace initWithName:compatibilityVersion:](v17, "initWithName:compatibilityVersion:", v18, [v16 compatibilityVersion]);
                    [v11 addObject:v19];
                  }
                  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v50 count:16];
                }
                while (v13);
              }

              uint64_t v36 = *(void **)(*(void *)(*(void *)(v33 + 48) + 8) + 40);
              char v20 = [TRIExperimentAllocationStatus alloc];
              id v21 = [v8 startDate];
              id v22 = v21;
              if (!v21)
              {
                uint64_t v34 = objc_opt_new();
                id v22 = v34;
              }
              v23 = [v8 experimentDeployment];
              id v24 = [v23 experimentId];
              BOOL v25 = [v8 experimentDeployment];
              uint64_t v26 = [v25 deploymentId];
              v27 = [v8 treatmentId];
              id v28 = [(TRIExperimentAllocationStatus *)v20 initWithType:2 date:v22 experimentId:v24 deploymentId:v26 treatmentId:v27 namespaces:v11];
              [v36 addObject:v28];

              if (!v21) {
            }
              }
          }
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v38);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  v29 = v31;
  if (v31)
  {
    (*((void (**)(void))v31 + 2))();
    v29 = v31;
  }
}

intptr_t __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)enumerateSampledActiveExperimentsForEnvironment:(int)a3 correlationID:(id)a4 error:(id *)a5 block:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = (void (**)(id, uint64_t, unsigned __int8 *))a6;
  if (!v12)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 412, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__7;
  id v32 = __Block_byref_object_dispose__7;
  id v33 = (id)objc_opt_new();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __112__TRIAllocationStatusDefaultProvider_enumerateSampledActiveExperimentsForEnvironment_correlationID_error_block___block_invoke;
  v27[3] = &unk_1E596B0B0;
  v27[4] = &v28;
  [(TRIAllocationStatusDefaultProvider *)self enumerateActiveExperimentsForEnvironment:v8 error:a5 block:v27];
  if (v8 || [MEMORY[0x1E4F93B08] isInternalBuild])
  {
    id v13 = (id)v29[5];
  }
  else
  {
    id v13 = +[TRIAllocationStatus sampleAllocationStatuses:v29[5] correlationId:v11 nrSamples:2];
  }
  unsigned __int8 v26 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
LABEL_8:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v23 != v16) {
        objc_enumerationMutation(v14);
      }
      uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * v17);
      id v19 = (void *)MEMORY[0x19F3AD060]();
      v12[2](v12, v18, &v26);
      LODWORD(v18) = v26;
      if (v18) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v34 count:16];
        if (v15) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v28, 8);
  return 1;
}

uint64_t __112__TRIAllocationStatusDefaultProvider_enumerateSampledActiveExperimentsForEnvironment_correlationID_error_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

- (id)activeExperimentInformationWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)buf = 0;
    char v20 = buf;
    uint64_t v21 = 0x3032000000;
    long long v22 = __Block_byref_object_copy__7;
    long long v23 = __Block_byref_object_dispose__7;
    id v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__TRIAllocationStatusDefaultProvider_activeExperimentInformationWithError___block_invoke;
    v18[3] = &unk_1E5969FC0;
    void v18[4] = buf;
    uint64_t v5 = (void *)MEMORY[0x19F3AD290](v18);
    uint64_t v6 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v5];
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__7;
    uint64_t v16 = __Block_byref_object_dispose__7;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__TRIAllocationStatusDefaultProvider_activeExperimentInformationWithError___block_invoke_2;
    v11[3] = &unk_1E596B0D8;
    v11[4] = &v12;
    [v6 activeExperimentInformationWithPrivacyFilterPolicy:1 completion:v11];
    long long v7 = (void *)*((void *)v20 + 5);
    if (v7)
    {
      id v8 = 0;
      if (a3) {
        *a3 = v7;
      }
    }
    else
    {
      id v8 = (id)v13[5];
    }
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    dispatch_semaphore_t v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = qos_class_self();
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "unable to fetch active experiments while device is class C locked qos:%{public}u", buf, 8u);
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
  }
  return v8;
}

void __75__TRIAllocationStatusDefaultProvider_activeExperimentInformationWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __75__TRIAllocationStatusDefaultProvider_activeExperimentInformationWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)enumerateActiveRolloutsWithError:(id *)a3 block:(id)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  long long v7 = (void (**)(id, void, uint8_t *))a4;
  if (!v7)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 473, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    *(void *)unsigned int v54 = 0;
    v55 = v54;
    uint64_t v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__7;
    v58 = __Block_byref_object_dispose__7;
    id v59 = 0;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke;
    v51[3] = &unk_1E596B038;
    uint64_t v53 = v54;
    dispatch_semaphore_t v9 = v8;
    uint64_t v52 = v9;
    BOOL v10 = (void *)MEMORY[0x19F3AD290](v51);
    id v11 = [(_PASXPCClientHelper *)self->_clientHelper remoteObjectProxyWithErrorHandler:v10];
    uint64_t v45 = 0;
    long long v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__7;
    id v49 = __Block_byref_object_dispose__7;
    id v50 = 0;
    uint64_t v39 = 0;
    long long v40 = &v39;
    uint64_t v41 = 0x3032000000;
    long long v42 = __Block_byref_object_copy__7;
    long long v43 = __Block_byref_object_dispose__7;
    id v44 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke_2;
    v35[3] = &unk_1E596B088;
    uint64_t v12 = v9;
    uint64_t v36 = v12;
    uint64_t v37 = &v39;
    uint64_t v38 = &v45;
    [v11 rolloutAllocationStatusWithPrivacyFilterPolicy:1 completion:v35];
    if ([MEMORY[0x1E4F93B18] waitForSemaphore:v12 timeoutSeconds:10.0])
    {
      id v13 = NSString;
      uint64_t v14 = NSStringFromSelector(a2);
      uint64_t v15 = [v13 stringWithFormat:@"Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@.", v14];

      if (a3)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v63 = *MEMORY[0x1E4F28568];
        v64[0] = v15;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
        *a3 = (id)[v16 initWithDomain:@"TRIGeneralErrorDomain" code:7 userInfo:v17];
      }
      uint64_t v18 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v29 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v62 = v29;
        _os_log_error_impl(&dword_19D909000, v18, OS_LOG_TYPE_ERROR, "Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@.", buf, 0xCu);
      }
      goto LABEL_10;
    }
    uint64_t v21 = (void *)*((void *)v55 + 5);
    if (v21)
    {
      if (!a3)
      {
LABEL_10:
        BOOL v19 = 0;
LABEL_11:

        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v45, 8);

        _Block_object_dispose(v54, 8);
        goto LABEL_21;
      }
      id v22 = v21;
    }
    else
    {
      id v24 = (void *)v46[5];
      if (v24)
      {
        buf[0] = 0;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v60 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v32;
LABEL_25:
          uint64_t v28 = 0;
          while (1)
          {
            if (*(void *)v32 != v27) {
              objc_enumerationMutation(v25);
            }
            v7[2](v7, *(void *)(*((void *)&v31 + 1) + 8 * v28), buf);
            if (buf[0]) {
              break;
            }
            if (v26 == ++v28)
            {
              uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v60 count:16];
              if (v26) {
                goto LABEL_25;
              }
              break;
            }
          }
        }

        BOOL v19 = 1;
        goto LABEL_11;
      }
      if (!a3) {
        goto LABEL_10;
      }
      id v22 = (id) v40[5];
    }
    BOOL v19 = 0;
    *a3 = v22;
    goto LABEL_11;
  }
  char v20 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unsigned int v54 = 0;
    _os_log_error_impl(&dword_19D909000, v20, OS_LOG_TYPE_ERROR, "unable to enumerate active rollouts while device is class C locked", v54, 2u);
  }

  if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_21:

  return v19;
}

void __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke_3;
  v12[3] = &unk_1E596A0B0;
  id v13 = *(id *)(a1 + 32);
  long long v7 = (void (**)(void))MEMORY[0x19F3AD290](v12);
  if (v6)
  {
    dispatch_semaphore_t v8 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    dispatch_semaphore_t v9 = v6;
  }
  else
  {
    dispatch_semaphore_t v8 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    dispatch_semaphore_t v9 = v5;
  }
  id v10 = v9;
  id v11 = *v8;
  *dispatch_semaphore_t v8 = v10;

  if (v7) {
    v7[2](v7);
  }
}

intptr_t __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)enumerateSampledActiveRolloutsForCorrelationID:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(id, uint64_t, unsigned __int8 *))a5;
  if (!v10)
  {
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 546, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__7;
  uint64_t v30 = __Block_byref_object_dispose__7;
  id v31 = (id)objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __97__TRIAllocationStatusDefaultProvider_enumerateSampledActiveRolloutsForCorrelationID_error_block___block_invoke;
  v25[3] = &unk_1E596B100;
  v25[4] = &v26;
  [(TRIAllocationStatusDefaultProvider *)self enumerateActiveRolloutsWithError:a4 block:v25];
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    id v11 = (id)v27[5];
  }
  else
  {
    id v11 = +[TRIAllocationStatus sampleAllocationStatuses:v27[5] correlationId:v9 nrSamples:2];
  }
  unsigned __int8 v24 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
LABEL_8:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v21 != v14) {
        objc_enumerationMutation(v12);
      }
      uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
      id v17 = (void *)MEMORY[0x19F3AD060]();
      v10[2](v10, v16, &v24);
      LODWORD(v16) = v24;
      if (v16) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v32 count:16];
        if (v13) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v26, 8);
  return 1;
}

uint64_t __97__TRIAllocationStatusDefaultProvider_enumerateSampledActiveRolloutsForCorrelationID_error_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

- (id)activeBMLTInformationWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)buf = 0;
    long long v20 = buf;
    uint64_t v21 = 0x3032000000;
    long long v22 = __Block_byref_object_copy__7;
    long long v23 = __Block_byref_object_dispose__7;
    id v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__TRIAllocationStatusDefaultProvider_activeBMLTInformationWithError___block_invoke;
    v18[3] = &unk_1E5969FC0;
    void v18[4] = buf;
    id v5 = (void *)MEMORY[0x19F3AD290](v18);
    id v6 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v5];
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__7;
    uint64_t v16 = __Block_byref_object_dispose__7;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__TRIAllocationStatusDefaultProvider_activeBMLTInformationWithError___block_invoke_2;
    v11[3] = &unk_1E596B128;
    v11[4] = &v12;
    [v6 activeBMLTInformationWithPrivacyFilterPolicy:1 completion:v11];
    long long v7 = (void *)*((void *)v20 + 5);
    if (v7)
    {
      id v8 = 0;
      if (a3) {
        *a3 = v7;
      }
    }
    else
    {
      id v8 = (id)v13[5];
    }
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = qos_class_self();
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "unable to fetch active BMLTs while device is class C locked qos:%{public}u", buf, 8u);
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
  }
  return v8;
}

void __69__TRIAllocationStatusDefaultProvider_activeBMLTInformationWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __69__TRIAllocationStatusDefaultProvider_activeBMLTInformationWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)addStatusUpdateHandlerForEnvironment:(int)a3 queue:(id)a4 block:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 606, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  id v11 = +[TRIAllocationStatus notificationNameForDeploymentEnvironment:v6];
  if (v11)
  {
    if (!v9)
    {
      id v9 = [(TRIAllocationStatusDefaultProvider *)self _defaultQueue];
    }
    int out_token = 0;
    uint64_t v12 = (const char *)[v11 UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __87__TRIAllocationStatusDefaultProvider_addStatusUpdateHandlerForEnvironment_queue_block___block_invoke;
    handler[3] = &unk_1E596A288;
    id v21 = v10;
    if (notify_register_dispatch(v12, &out_token, v9, handler))
    {
      uint64_t v13 = 0;
    }
    else
    {
      lock = self->_lock;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __87__TRIAllocationStatusDefaultProvider_addStatusUpdateHandlerForEnvironment_queue_block___block_invoke_2;
      v18[3] = &__block_descriptor_36_e48_v16__0__TRIAllocationStatusProviderGuardedData_8l;
      int v19 = out_token;
      [(_PASLock *)lock runWithLockAcquired:v18];
      uint64_t v15 = [TRINotificationState alloc];
      uint64_t v13 = [(TRINotificationState *)v15 initWithToken:out_token];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __87__TRIAllocationStatusDefaultProvider_addStatusUpdateHandlerForEnvironment_queue_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__TRIAllocationStatusDefaultProvider_addStatusUpdateHandlerForEnvironment_queue_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a2 + 8);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  [v2 addObject:v3];
}

- (BOOL)removeUpdateHandlerForToken:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 token];
    if (!notify_cancel(v5))
    {
      lock = self->_lock;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __66__TRIAllocationStatusDefaultProvider_removeUpdateHandlerForToken___block_invoke;
      v9[3] = &__block_descriptor_36_e48_v16__0__TRIAllocationStatusProviderGuardedData_8l;
      int v10 = v5;
      [(_PASLock *)lock runWithLockAcquired:v9];
LABEL_6:
      BOOL v6 = 1;
      goto LABEL_7;
    }
  }
  BOOL v6 = 0;
LABEL_7:

  return v6;
}

void __66__TRIAllocationStatusDefaultProvider_removeUpdateHandlerForToken___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a2 + 8);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  [v2 removeObject:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_internalHelper, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

@end