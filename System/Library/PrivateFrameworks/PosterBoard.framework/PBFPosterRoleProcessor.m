@interface PBFPosterRoleProcessor
- (BOOL)_executeChange:(id)a3 roleCoordinator:(id)a4 changeHandler:(id)a5 recursiveDepth:(unint64_t)a6 transaction:(id)a7 error:(id *)a8;
- (BOOL)_executeTransaction:(id)a3 block:(id)a4 error:(id *)a5;
- (BOOL)_processEvent:(id)a3 changeHandler:(id)a4 recursiveDepth:(unint64_t)a5 transaction:(id)a6 error:(id *)a7;
- (NSArray)roleCoordinators;
- (NSString)logIdentifier;
- (OS_os_log)log;
- (PBFPosterExtensionDataStorage)dataStorage;
- (PBFPosterRoleProcessor)initWithDataStorage:(id)a3 roleCoordinators:(id)a4;
- (id)processChanges:(id)a3 context:(id)a4 reason:(id)a5 userInfo:(id)a6 error:(id *)a7;
- (id)processEvents:(id)a3 context:(id)a4 reason:(id)a5 userInfo:(id)a6 error:(id *)a7;
- (void)_fireDidBeginTransaction:(id)a3;
- (void)_fireDidCommitTransaction:(id)a3;
- (void)_fireDidEvaluateEvent:(id)a3 transaction:(id)a4;
- (void)_fireDidExecuteChange:(id)a3 transaction:(id)a4;
- (void)_fireDidFinalizeTransaction:(id)a3;
- (void)_fireTransactionFinished:(id)a3 result:(id)a4 error:(id)a5;
- (void)_fireWasInvalidated:(id)a3;
- (void)_fireWillBeginTransaction:(id)a3;
- (void)_fireWillCommitTransaction:(id)a3;
- (void)_fireWillEvaluateEvent:(id)a3 transaction:(id)a4;
- (void)_fireWillExecuteChange:(id)a3 transaction:(id)a4;
- (void)_fireWillFinalizeTransaction:(id)a3;
- (void)_resetRoleCoordinatorTransaction;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)noteTransactionWasInvalidated:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setLog:(id)a3;
- (void)setLogIdentifier:(id)a3;
@end

@implementation PBFPosterRoleProcessor

- (PBFPosterRoleProcessor)initWithDataStorage:(id)a3 roleCoordinators:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (!v9)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:]();
    }
LABEL_23:
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32AD194);
  }
  v10 = v9;
  if (([v9 conformsToProtocol:&unk_1F2AE5A58] & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFPosterExtensionDataStorage)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32AD1F8);
  }

  id v11 = v8;
  NSClassFromString(&cfstr_Nsarray.isa);
  if (!v11)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32AD25CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:]();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32AD2C0);
  }

  if (![v11 count])
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[roleCoordinators count] > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleProcessor initWithDataStorage:roleCoordinators:]();
    }
    goto LABEL_23;
  }
  v12 = objc_opt_new();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __63__PBFPosterRoleProcessor_initWithDataStorage_roleCoordinators___block_invoke;
  v34[3] = &unk_1E6984550;
  id v13 = v12;
  id v35 = v13;
  [v11 enumerateObjectsUsingBlock:v34];
  v33.receiver = self;
  v33.super_class = (Class)PBFPosterRoleProcessor;
  v14 = [(PBFPosterRoleProcessor *)&v33 init];
  if (v14)
  {
    uint64_t v15 = [v11 sortedArrayUsingComparator:&__block_literal_global_40];
    roleCoordinators = v14->_roleCoordinators;
    v14->_roleCoordinators = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAA0];
    v18 = objc_msgSend(v11, "bs_mapNoNulls:", &__block_literal_global_99);
    uint64_t v19 = [v17 orderedSetWithArray:v18];
    roleOrderedSet = v14->_roleOrderedSet;
    v14->_roleOrderedSet = (NSOrderedSet *)v19;

    uint64_t v21 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v21;

    uint64_t v23 = [v13 copy];
    roleToRoleCoordinator = v14->_roleToRoleCoordinator;
    v14->_roleToRoleCoordinator = (NSDictionary *)v23;

    objc_storeStrong((id *)&v14->_dataStorage, a3);
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    invalidationFlag = v14->_invalidationFlag;
    v14->_invalidationFlag = (BSAtomicFlag *)v25;

    v27 = PBFLogDataStore();
    [(PBFPosterRoleProcessor *)v14 setLog:v27];
  }
  return v14;
}

void __63__PBFPosterRoleProcessor_initWithDataStorage_roleCoordinators___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 role];
  [v2 setObject:v3 forKey:v4];
}

uint64_t __63__PBFPosterRoleProcessor_initWithDataStorage_roleCoordinators___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 role];
  v6 = [v4 role];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __63__PBFPosterRoleProcessor_initWithDataStorage_roleCoordinators___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 role];
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    id v4 = self->_observers;
    objc_sync_enter(v4);
    [(NSHashTable *)self->_observers addObject:v5];
    objc_sync_exit(v4);
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    id v4 = self->_observers;
    objc_sync_enter(v4);
    [(NSHashTable *)self->_observers removeObject:v5];
    objc_sync_exit(v4);
  }
}

- (id)processChanges:(id)a3 context:(id)a4 reason:(id)a5 userInfo:(id)a6 error:(id *)a7
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v13 = a4;
  id v65 = a5;
  id v66 = a6;
  id v14 = v13;
  if (!v14)
  {
    v56 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleProcessor processChanges:context:reason:userInfo:error:]();
    }
    [v56 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32ADDB4);
  }
  uint64_t v15 = v14;
  if (([v14 conformsToProtocol:&unk_1F2AE5460] & 1) == 0)
  {
    v57 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFPosterRoleCoordinatorTransitionContext)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleProcessor processChanges:context:reason:userInfo:error:]();
    }
    [v57 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32ADE18);
  }

  v67 = v15;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v16 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v17 = self;
    objc_sync_enter(v17);
    obj = v17;
    if (v17->_activeTransaction)
    {
      v48 = [NSString stringWithFormat:@"Active transaction is ongoing.  Role processing is not concurrent."];
      v49 = MEMORY[0x1E4F14500];
      id v50 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v51 = (id)objc_claimAutoreleasedReturnValue();
        v52 = (objc_class *)objc_opt_class();
        v53 = NSStringFromClass(v52);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2048;
        v90 = (uint64_t (*)(uint64_t, uint64_t))v17;
        LOWORD(v91) = 2114;
        *(void *)((char *)&v91 + 2) = @"PBFPosterRoleProcessor.m";
        WORD5(v91) = 1024;
        HIDWORD(v91) = 125;
        __int16 v92 = 2114;
        v93 = v48;
        _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v48 UTF8String];
      uint64_t v54 = _bs_set_crash_log_message();
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.4(v54);
    }
    v62 = a7;
    v18 = [(NSHashTable *)v17->_observers allObjects];
    uint64_t v19 = +[_PBFPosterRoleProcessorTransaction transactionWithReason:v65 context:v15 userInfo:v66 observers:v18 processor:v17];

    objc_storeStrong((id *)&v17->_activeTransaction, v19);
    v20 = v19;
    objc_sync_exit(obj);

    uint64_t v21 = [(PBFPosterRoleProcessor *)obj log];
    v22 = objc_msgSend(v15, "pbf_transitionContextIdentifier");
    uint64_t v23 = [v22 UUIDString];
    v68 = [v23 substringToIndex:7];

    v61 = obj->_roleToRoleCoordinator;
    os_signpost_id_t v24 = os_signpost_id_generate(v21);
    uint64_t v25 = v21;
    v26 = v25;
    unint64_t v60 = v24 - 1;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "processRoleCoordinatorChanges:context:reason:userInfo:error:", "", buf, 2u);
    }
    os_signpost_id_t spid = v24;

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v59 = _os_activity_create(&dword_1D31CE000, "processRoleCoordinatorChange", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v59, &state);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v68;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@} Preparing to process data store update w/ context: %{public}@", buf, 0x16u);
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v68;
      _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@} Changes:", buf, 0xCu);
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v27 = v64;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v79 objects:v88 count:16];
    if (v28)
    {
      uint64_t v29 = 0;
      uint64_t v30 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v80 != v30) {
            objc_enumerationMutation(v27);
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v32 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v79 + 1) + 8 * i);
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v68;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v29;
            *(_WORD *)&buf[22] = 2114;
            v90 = v32;
            _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@}\tChange %lu: %{public}@", buf, 0x20u);
            ++v29;
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v28);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v90 = __Block_byref_object_copy__16;
    *(void *)&long long v91 = __Block_byref_object_dispose__16;
    *((void *)&v91 + 1) = 0;
    objc_super v33 = +[PBFPosterRoleCoordinatorChange distillArrayOfChangesIntoChangesOrderedByPosterRoleEntropy:v27];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __71__PBFPosterRoleProcessor_processChanges_context_reason_userInfo_error___block_invoke;
    v70[3] = &unk_1E69845B8;
    v34 = v26;
    v71 = v34;
    id v35 = v68;
    id v72 = v35;
    id v36 = v33;
    id v73 = v36;
    id v74 = v27;
    v37 = v61;
    v78 = buf;
    v75 = v37;
    v76 = obj;
    id v38 = v20;
    id v77 = v38;
    id v69 = 0;
    BOOL v39 = [(PBFPosterRoleProcessor *)obj _executeTransaction:v38 block:v70 error:&v69];
    id v40 = v69;
    v41 = obj;
    objc_sync_enter(v41);
    activeTransaction = obj->_activeTransaction;
    obj->_activeTransaction = 0;

    objc_sync_exit(v41);
    os_activity_scope_leave(&state);
    v43 = v34;
    v44 = v43;
    if (v60 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v43))
    {
      *(_WORD *)v84 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v44, OS_SIGNPOST_INTERVAL_END, spid, "processRoleCoordinatorChanges:context:reason:userInfo:error:", "", v84, 2u);
    }

    if (v40) {
      BOOL v45 = 0;
    }
    else {
      BOOL v45 = v39;
    }
    if (v45 && !*(void *)(*(void *)&buf[8] + 40))
    {
      v16 = [v38 results];
    }
    else
    {
      if (v62)
      {
        if (*(void *)(*(void *)&buf[8] + 40)) {
          v46 = *(void **)(*(void *)&buf[8] + 40);
        }
        else {
          v46 = v40;
        }
        id *v62 = v46;
      }
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        id v55 = *(id *)(*(void *)&buf[8] + 40);
        if (!v55) {
          id v55 = v40;
        }
        *(_DWORD *)v84 = 138543618;
        id v85 = v35;
        __int16 v86 = 2114;
        id v87 = v55;
        _os_log_error_impl(&dword_1D31CE000, v44, OS_LOG_TYPE_ERROR, "(%{public}@} Failed to commit changes: %{public}@", v84, 0x16u);
      }
      v16 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  return v16;
}

uint64_t __71__PBFPosterRoleProcessor_processChanges_context_reason_userInfo_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v54 = a2;
  id v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v65 = v4;
    _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executing changes", buf, 0xCu);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v48 = [obj countByEnumeratingWithState:&v60 objects:v75 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v61;
    uint64_t v51 = *MEMORY[0x1E4F28588];
    *(void *)&long long v5 = 138543874;
    long long v45 = v5;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v61 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v60 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 56), "firstObject", v45);
        id v9 = [v8 role];

        uint64_t v10 = [*(id *)(a1 + 64) objectForKeyedSubscript:v9];
        if (!v10)
        {
          objc_super v33 = (void *)MEMORY[0x1E4F28C58];
          v73[0] = v51;
          v73[1] = @"role";
          if (v9) {
            v34 = v9;
          }
          else {
            v34 = @"(unknown role)";
          }
          v74[0] = @"Role coordinator not found.";
          v74[1] = v34;
          id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:2];
          uint64_t v36 = objc_msgSend(v33, "pbf_generalErrorWithCode:userInfo:", 1, v35);
          uint64_t v37 = *(void *)(*(void *)(a1 + 88) + 8);
          id v38 = *(void **)(v37 + 40);
          *(void *)(v37 + 40) = v36;

          goto LABEL_40;
        }
        id v11 = (void *)v10;
        uint64_t v49 = v6;
        id v50 = v9;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v12 = v7;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v72 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v57;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v57 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v56 + 1) + 8 * i);
              v18 = *(NSObject **)(a1 + 32);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v19 = *(void *)(a1 + 40);
                *(_DWORD *)buf = 138543618;
                uint64_t v65 = v19;
                __int16 v66 = 2114;
                uint64_t v67 = v17;
                _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@}\t Begin %{public}@", buf, 0x16u);
              }
              v20 = *(void **)(a1 + 72);
              uint64_t v21 = *(void *)(a1 + 80);
              id v55 = 0;
              char v22 = [v20 _executeChange:v17 roleCoordinator:v11 changeHandler:v54 recursiveDepth:0 transaction:v21 error:&v55];
              id v23 = v55;
              os_signpost_id_t v24 = v23;
              if ((v22 & 1) == 0)
              {
                uint64_t v25 = v23;
                if (!v23)
                {
                  v26 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v70 = v51;
                  v71 = @"Change failed to apply and did not return an error.";
                  v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
                  v52 = objc_msgSend(v26, "pbf_generalErrorWithCode:userInfo:", 0);
                  uint64_t v25 = v52;
                }
                objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v25);
                if (!v24)
                {
                }
              }
              id v27 = *(NSObject **)(a1 + 32);
              if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v30 = *(void *)(a1 + 40);
                  uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
                  *(_DWORD *)buf = v45;
                  uint64_t v65 = v30;
                  __int16 v66 = 2114;
                  uint64_t v67 = v17;
                  __int16 v68 = 2114;
                  uint64_t v69 = v31;
                  _os_log_error_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_ERROR, "(%{public}@}\tChange %{public}@ failed to apply w/ error: %{public}@", buf, 0x20u);
                }

                goto LABEL_30;
              }
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v28 = *(void *)(a1 + 40);
                *(_DWORD *)buf = 138543618;
                uint64_t v65 = v28;
                __int16 v66 = 2114;
                uint64_t v67 = v17;
                _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, "(%{public}@}\tChange %{public}@ applied successful", buf, 0x16u);
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v72 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_30:

        uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        if (v29) {
          goto LABEL_33;
        }
        uint64_t v6 = v49 + 1;
      }
      while (v49 + 1 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v60 objects:v75 count:16];
      if (v48) {
        continue;
      }
      break;
    }
  }
LABEL_33:

  v32 = *(NSObject **)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      __71__PBFPosterRoleProcessor_processChanges_context_reason_userInfo_error___block_invoke_cold_1();
    }
LABEL_40:
    uint64_t v39 = 0;
  }
  else
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = *(void *)(a1 + 40);
      v41 = *(void **)(a1 + 56);
      v42 = v32;
      uint64_t v43 = [v41 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v65 = v40;
      __int16 v66 = 2048;
      uint64_t v67 = v43;
      _os_log_impl(&dword_1D31CE000, v42, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executed %lu changes", buf, 0x16u);
    }
    uint64_t v39 = 1;
  }

  return v39;
}

- (id)processEvents:(id)a3 context:(id)a4 reason:(id)a5 userInfo:(id)a6 error:(id *)a7
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v13 = a4;
  id v14 = a5;
  id v62 = a6;
  id v15 = v13;
  if (!v15)
  {
    v53 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleProcessor processEvents:context:reason:userInfo:error:]();
    }
    [v53 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32AEC54);
  }
  v16 = v15;
  if (([v15 conformsToProtocol:&unk_1F2AE5460] & 1) == 0)
  {
    id v54 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFPosterRoleCoordinatorTransitionContext)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleProcessor processEvents:context:reason:userInfo:error:]();
    }
    [v54 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32AECB8);
  }

  long long v60 = v14;
  long long v63 = v16;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      uint64_t v17 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    v18 = self;
    objc_sync_enter(v18);
    if (v18->_activeTransaction)
    {
      long long v45 = [NSString stringWithFormat:@"Active transaction is ongoing.  Role processing is not concurrent."];
      v46 = MEMORY[0x1E4F14500];
      id v47 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v48 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v49 = (objc_class *)objc_opt_class();
        id v50 = NSStringFromClass(v49);
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = v48;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2048;
        v84 = (uint64_t (*)(uint64_t, uint64_t))v18;
        LOWORD(v85) = 2114;
        *(void *)((char *)&v85 + 2) = @"PBFPosterRoleProcessor.m";
        WORD5(v85) = 1024;
        HIDWORD(v85) = 225;
        __int16 v86 = 2114;
        id v87 = v45;
        _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v45 UTF8String];
      uint64_t v51 = _bs_set_crash_log_message();
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.4(v51);
    }
    long long v59 = a7;
    uint64_t v19 = [(NSHashTable *)v18->_observers allObjects];
    v20 = +[_PBFPosterRoleProcessorTransaction transactionWithReason:v14 context:v16 userInfo:v62 observers:v19 processor:v18];

    long long v58 = v20;
    objc_storeStrong((id *)&v18->_activeTransaction, v20);
    objc_sync_exit(v18);

    uint64_t v21 = [(PBFPosterRoleProcessor *)v18 log];
    char v22 = objc_msgSend(v16, "pbf_transitionContextIdentifier");
    id v23 = [v22 UUIDString];
    id v64 = [v23 substringToIndex:7];

    os_signpost_id_t v24 = os_signpost_id_generate(v21);
    uint64_t v25 = v21;
    v26 = v25;
    unint64_t v57 = v24 - 1;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "processEvents:context:reason:userInfo:error:", "", buf, 2u);
    }
    os_signpost_id_t spid = v24;

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    long long v56 = _os_activity_create(&dword_1D31CE000, "processEvents", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v56, &state);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v64;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@} Preparing to process data store events w/ context: %{public}@", buf, 0x16u);
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v64;
      _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@} Events:", buf, 0xCu);
    }
    long long v76 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v73 = 0u;
    id v27 = v61;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v28)
    {
      uint64_t v29 = 0;
      uint64_t v30 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v74 != v30) {
            objc_enumerationMutation(v27);
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v32 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v73 + 1) + 8 * i);
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v64;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v29;
            *(_WORD *)&buf[22] = 2114;
            v84 = v32;
            _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@}\tEvent %lu: %{public}@", buf, 0x20u);
            ++v29;
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v73 objects:v82 count:16];
      }
      while (v28);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v84 = __Block_byref_object_copy__16;
    *(void *)&long long v85 = __Block_byref_object_dispose__16;
    *((void *)&v85 + 1) = 0;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __70__PBFPosterRoleProcessor_processEvents_context_reason_userInfo_error___block_invoke;
    v66[3] = &unk_1E69845E0;
    objc_super v33 = v26;
    uint64_t v67 = v33;
    id v34 = v64;
    id v68 = v34;
    id v69 = v27;
    uint64_t v70 = v18;
    id v35 = v58;
    id v71 = v35;
    id v72 = buf;
    id v65 = 0;
    BOOL v36 = [(PBFPosterRoleProcessor *)v18 _executeTransaction:v35 block:v66 error:&v65];
    id v37 = v65;
    id v38 = v18;
    objc_sync_enter(v38);
    activeTransaction = v18->_activeTransaction;
    v18->_activeTransaction = 0;

    objc_sync_exit(v38);
    os_activity_scope_leave(&state);
    uint64_t v40 = v33;
    v41 = v40;
    if (v57 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v40))
    {
      *(_WORD *)v78 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v41, OS_SIGNPOST_INTERVAL_END, spid, "processRoleCoordinatorChanges:context:reason:userInfo:error:", "", v78, 2u);
    }

    if (v37) {
      BOOL v42 = 0;
    }
    else {
      BOOL v42 = v36;
    }
    if (v42 && !*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v17 = [v35 results];
    }
    else
    {
      if (v59)
      {
        if (*(void *)(*(void *)&buf[8] + 40)) {
          uint64_t v43 = *(void **)(*(void *)&buf[8] + 40);
        }
        else {
          uint64_t v43 = v37;
        }
        id *v59 = v43;
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v52 = *(id *)(*(void *)&buf[8] + 40);
        if (!v52) {
          id v52 = v37;
        }
        *(_DWORD *)v78 = 138543618;
        id v79 = v34;
        __int16 v80 = 2114;
        id v81 = v52;
        _os_log_error_impl(&dword_1D31CE000, v41, OS_LOG_TYPE_ERROR, "(%{public}@} Failed to commit changes: %{public}@", v78, 0x16u);
      }
      uint64_t v17 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  return v17;
}

BOOL __70__PBFPosterRoleProcessor_processEvents_context_reason_userInfo_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v43 = v5;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executing events", buf, 0xCu);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    uint64_t v36 = *MEMORY[0x1E4F28588];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v12 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v43 = v13;
          __int16 v44 = 2114;
          uint64_t v45 = v11;
          _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@}\t Begin %{public}@", buf, 0x16u);
        }
        id v14 = *(void **)(a1 + 56);
        uint64_t v15 = *(void *)(a1 + 64);
        v16 = (id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        id obj = 0;
        char v17 = [v14 _processEvent:v11 changeHandler:v3 recursiveDepth:0 transaction:v15 error:&obj];
        objc_storeStrong(v16, obj);
        uint64_t v18 = *(void *)(a1 + 72);
        if ((v17 & 1) == 0 && !*(void *)(*(void *)(v18 + 8) + 40))
        {
          uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v48 = v36;
          uint64_t v49 = @"Event failed to be fired and did not return an error.";
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          uint64_t v21 = objc_msgSend(v19, "pbf_generalErrorWithCode:userInfo:", 0, v20);
          uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
          id v23 = *(void **)(v22 + 40);
          *(void *)(v22 + 40) = v21;

          uint64_t v18 = *(void *)(a1 + 72);
        }
        os_signpost_id_t v24 = *(NSObject **)(a1 + 32);
        if (*(void *)(*(void *)(v18 + 8) + 40))
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = *(void *)(a1 + 40);
            uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            *(_DWORD *)buf = 138543874;
            uint64_t v43 = v34;
            __int16 v44 = 2114;
            uint64_t v45 = v11;
            __int16 v46 = 2114;
            uint64_t v47 = v35;
            _os_log_error_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_ERROR, "(%{public}@}\tEvent %{public}@ failed to be processed w/ error: %{public}@", buf, 0x20u);
          }
          goto LABEL_21;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v43 = v25;
          __int16 v44 = 2114;
          uint64_t v45 = v11;
          _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "(%{public}@}\tEvent %{public}@ processed successful", buf, 0x16u);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v27 = *(NSObject **)(a1 + 32);
  if (v26)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __70__PBFPosterRoleProcessor_processEvents_context_reason_userInfo_error___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = *(void *)(a1 + 40);
    uint64_t v29 = *(void **)(a1 + 64);
    uint64_t v30 = v27;
    uint64_t v31 = [v29 emittedEvents];
    uint64_t v32 = [v31 count];
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = v28;
    __int16 v44 = 2048;
    uint64_t v45 = v32;
    _os_log_impl(&dword_1D31CE000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executed %lu events", buf, 0x16u);
  }
  return v26 == 0;
}

- (void)noteTransactionWasInvalidated:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (_PBFPosterRoleProcessorTransaction *)a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    if (v5->_activeTransaction == v4)
    {
      id v6 = [(PBFPosterRoleProcessor *)v5 log];
      uint64_t v7 = [(_PBFPosterRoleProcessorTransaction *)v4 shortIdentifier];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543618;
        uint64_t v9 = v7;
        __int16 v10 = 2114;
        uint64_t v11 = v4;
        _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@} Transaction Invalidated %{public}@", (uint8_t *)&v8, 0x16u);
      }
    }
    objc_sync_exit(v5);
  }
}

- (BOOL)_executeTransaction:(id)a3 block:(id)a4 error:(id *)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v48 = a4;
  uint64_t v49 = v6;
  id v52 = [v6 shortIdentifier];
  long long v56 = [v6 context];
  uint64_t v7 = [(PBFPosterRoleProcessor *)self log];
  unint64_t v57 = self->_roleToRoleCoordinator;
  BSAbsoluteMachTimeNow();
  double v9 = v8;
  __int16 v10 = PBFLogDataStore();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v52;
    _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@} Starting transaction", buf, 0xCu);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v11 = self->_roleOrderedSet;
  uint64_t v12 = [(NSOrderedSet *)v11 countByEnumeratingWithState:&v86 objects:v100 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v87 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = [(NSDictionary *)v57 objectForKeyedSubscript:*(void *)(*((void *)&v86 + 1) + 8 * i)];
        [v15 incrementTransactionCount];
      }
      uint64_t v12 = [(NSOrderedSet *)v11 countByEnumeratingWithState:&v86 objects:v100 count:16];
    }
    while (v12);
  }

  [(PBFPosterRoleProcessor *)self _fireWillBeginTransaction:v49];
  id v54 = objc_opt_new();
  id v55 = objc_opt_new();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v16 = self->_roleOrderedSet;
  uint64_t v17 = [(NSOrderedSet *)v16 countByEnumeratingWithState:&v82 objects:v99 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v83;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v83 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v82 + 1) + 8 * j);
        uint64_t v21 = [(NSDictionary *)v57 objectForKeyedSubscript:v20];
        uint64_t v22 = objc_msgSend(v56, "pbf_currentActivePosterForRole:", v20);
        [v55 setObject:v22 forKeyedSubscript:v20];
        id v23 = [v21 posterCollection];
        if (v23) {
          [v54 setObject:v23 forKeyedSubscript:v20];
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v52;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2114;
          v96 = v23;
          _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@} Stashing collection for role %{public}@: %{public}@", buf, 0x20u);
        }
      }
      uint64_t v17 = [(NSOrderedSet *)v16 countByEnumeratingWithState:&v82 objects:v99 count:16];
    }
    while (v17);
  }

  os_signpost_id_t v24 = objc_msgSend(v56, "pbf_extensionStoreCoordinatorForProvider");
  uint64_t v25 = [v24 objectEnumerator];
  uint64_t v26 = [v25 allObjects];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke;
  aBlock[3] = &unk_1E6981338;
  id v27 = v26;
  id v79 = v27;
  uint64_t v28 = v7;
  __int16 v80 = v28;
  id v29 = v52;
  id v81 = v29;
  __int16 v46 = _Block_copy(aBlock);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v96 = __Block_byref_object_copy__16;
  v97 = __Block_byref_object_dispose__16;
  id v98 = 0;
  uint64_t v47 = objc_opt_new();
  v53 = objc_opt_new();
  uint64_t v51 = objc_opt_new();
  if (v48)
  {
    dataStorage = self->_dataStorage;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke_149;
    v63[3] = &unk_1E6984608;
    v63[4] = self;
    id v64 = v49;
    id v65 = v28;
    id v66 = v29;
    id v75 = v48;
    id v76 = v46;
    id v77 = buf;
    uint64_t v67 = v57;
    id v68 = v27;
    id v69 = v51;
    id v70 = v54;
    id v71 = v53;
    id v72 = v55;
    id v73 = v56;
    id v74 = v47;
    id v62 = 0;
    int v31 = [(PBFPosterExtensionDataStorage *)dataStorage performChanges:v63 error:&v62];
    unint64_t v32 = (unint64_t)v62;
  }
  else
  {
    [(PBFPosterRoleProcessor *)self _fireDidBeginTransaction:v49];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v90 = 138543362;
      id v91 = v29;
      _os_log_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEFAULT, "(%{public}@} completed null transaction", v90, 0xCu);
    }
    [(PBFPosterRoleProcessor *)self _fireWillCommitTransaction:v49];
    unint64_t v32 = 0;
    int v31 = 1;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  objc_super v33 = self->_roleOrderedSet;
  uint64_t v34 = [(NSOrderedSet *)v33 countByEnumeratingWithState:&v58 objects:v94 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v59 != v35) {
          objc_enumerationMutation(v33);
        }
        id v37 = [(NSDictionary *)v57 objectForKeyedSubscript:*(void *)(*((void *)&v58 + 1) + 8 * k)];
        [v37 decrementTransactionCount];
      }
      uint64_t v34 = [(NSOrderedSet *)v33 countByEnumeratingWithState:&v58 objects:v94 count:16];
    }
    while (v34);
  }

  unint64_t v38 = *(void *)(*(void *)&buf[8] + 40);
  if (v31 && !(v38 | v32))
  {
    [(PBFPosterRoleProcessor *)self _fireDidCommitTransaction:v49];
    long long v39 = objc_alloc_init(_PBFPosterRoleProcessorTransactionResult);
    [(_PBFPosterRoleProcessorTransactionResult *)v39 setAffectedRoles:v51];
    [(_PBFPosterRoleProcessorTransactionResult *)v39 setCollectionDiffsPerRole:v53];
    [(_PBFPosterRoleProcessorTransactionResult *)v39 setPreCommitActivePosterConfigurationForRole:v55];
    [(_PBFPosterRoleProcessorTransactionResult *)v39 setPostCommitActivePosterConfigurationForRole:v47];
    long long v41 = [v49 emittedEvents];
    [(_PBFPosterRoleProcessorTransactionResult *)v39 setEmittedEvents:v41];

    [v49 setResults:v39];
    [(PBFPosterRoleProcessor *)self _fireTransactionFinished:v49 result:v39 error:0];
    BSAbsoluteMachTimeNow();
    double v43 = v42;
    __int16 v44 = PBFLogDataStore();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v90 = 138543618;
      id v91 = v29;
      __int16 v92 = 2048;
      double v93 = v43 - v9;
      _os_log_impl(&dword_1D31CE000, v44, OS_LOG_TYPE_DEFAULT, "(%{public}@} Fin; finished transaction successfully in %f",
        v90,
        0x16u);
    }

    BOOL v40 = 1;
  }
  else
  {
    if (!v38) {
      unint64_t v38 = v32;
    }
    long long v39 = (_PBFPosterRoleProcessorTransactionResult *)(id)v38;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleProcessor _executeTransaction:block:error:]((uint64_t)v29, (uint64_t)v39, v28);
    }
    [(PBFPosterRoleProcessor *)self _fireTransactionFinished:v49 result:0 error:v39];
    BOOL v40 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v40;
}

void __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v23 + 1) + 8 * v2);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v17 = v3;
        uint64_t v18 = v2;
        uint64_t v4 = [v3 configurationStoreCoordinatorsWithError:0];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v31 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v20 != v7) {
                objc_enumerationMutation(v4);
              }
              double v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
              __int16 v10 = *(NSObject **)(a1 + 40);
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v11 = *(void *)(a1 + 48);
                *(_DWORD *)buf = 138543618;
                uint64_t v28 = v11;
                __int16 v29 = 2114;
                uint64_t v30 = v9;
                _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@} Aborting staged changes for %{public}@", buf, 0x16u);
              }
              [v9 abortStaged];
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v31 count:16];
          }
          while (v6);
        }

        uint64_t v12 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          uint64_t v28 = v13;
          __int16 v29 = 2114;
          uint64_t v30 = v17;
          _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@} Aborting staged changes for %{public}@", buf, 0x16u);
        }
        [v17 abortStaged];
        uint64_t v2 = v18 + 1;
      }
      while (v18 + 1 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v16);
  }
}

uint64_t __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke_149(uint64_t a1, void *a2)
{
  v188[1] = *MEMORY[0x1E4F143B8];
  id v135 = a2;
  [*(id *)(a1 + 32) _fireDidBeginTransaction:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(a1 + 48);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138543362;
    uint64_t v171 = v4;
    _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executing transaction", buf, 0xCu);
  }
  int v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 128) + 16))();
  int v6 = [*(id *)(a1 + 40) isInvalidated];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    __int16 v10 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      uint64_t v171 = v11;
      _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@} Finalizing Changes for transaction", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _fireWillFinalizeTransaction:*(void *)(a1 + 40)];
    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    id obj = [*(id *)(a1 + 64) objectEnumerator];
    uint64_t v12 = [obj countByEnumeratingWithState:&v166 objects:v186 count:16];
    uint64_t v136 = a1;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v167;
      uint64_t v132 = *(void *)v167;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v167 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v166 + 1) + 8 * i);
          id v165 = 0;
          id v164 = 0;
          char v17 = [v16 finalizeChangesWithChangeHandler:v135 outEvents:&v165 error:&v164];
          id v18 = v165;
          id v19 = v164;
          id v20 = v19;
          if ((v17 & 1) == 0)
          {
            uint64_t v121 = *(void *)(*(void *)(v136 + 144) + 8);
            id v21 = *(id *)(v121 + 40);
            *(void *)(v121 + 40) = v19;
            id v53 = v19;
LABEL_52:

            goto LABEL_57;
          }
          long long v162 = 0u;
          long long v163 = 0u;
          long long v160 = 0u;
          long long v161 = 0u;
          id v21 = v18;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v160 objects:v185 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v161;
            while (2)
            {
              uint64_t v25 = 0;
              long long v26 = v20;
              do
              {
                if (*(void *)v161 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v27 = *(void *)(*((void *)&v160 + 1) + 8 * v25);
                uint64_t v28 = *(void **)(v136 + 32);
                uint64_t v29 = *(void *)(v136 + 40);
                id v159 = 0;
                char v30 = [v28 _processEvent:v27 changeHandler:v135 recursiveDepth:1 transaction:v29 error:&v159];
                id v20 = v159;

                if ((v30 & 1) == 0)
                {
                  uint64_t v51 = *(void *)(*(void *)(v136 + 144) + 8);
                  id v52 = *(void **)(v51 + 40);
                  *(void *)(v51 + 40) = v20;
                  id v53 = v20;

                  goto LABEL_52;
                }
                ++v25;
                long long v26 = v20;
              }
              while (v23 != v25);
              uint64_t v23 = [v21 countByEnumeratingWithState:&v160 objects:v185 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          a1 = v136;
          uint64_t v14 = v132;
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v166 objects:v186 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    [*(id *)(a1 + 32) _fireDidFinalizeTransaction:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _fireWillCommitTransaction:*(void *)(a1 + 40)];
    int v31 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      uint64_t v171 = v32;
      _os_log_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_DEFAULT, "(%{public}@} Transaction finished executing; attempting to commit staged changes.",
        buf,
        0xCu);
    }
    id obj = (id)objc_opt_new();
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id v33 = *(id *)(a1 + 72);
    uint64_t v34 = [v33 countByEnumeratingWithState:&v155 objects:v184 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v133 = *(void *)v156;
      char v130 = 1;
      id v126 = v33;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v156 != v133) {
            objc_enumerationMutation(v126);
          }
          id v37 = *(void **)(*((void *)&v155 + 1) + 8 * j);
          long long v151 = 0u;
          long long v152 = 0u;
          long long v153 = 0u;
          long long v154 = 0u;
          unint64_t v38 = [v37 configurationStoreCoordinatorsWithError:0];
          uint64_t v39 = [v38 countByEnumeratingWithState:&v151 objects:v183 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            id v41 = 0;
            uint64_t v42 = *(void *)v152;
            while (2)
            {
              uint64_t v43 = 0;
              __int16 v44 = v41;
              do
              {
                if (*(void *)v152 != v42) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v45 = *(void **)(*((void *)&v151 + 1) + 8 * v43);
                id v150 = 0;
                char v46 = [v45 commitStagedWithError:&v150];
                id v41 = v150;

                if ((v46 & 1) == 0)
                {
                  [obj addObject:v41];
                  a1 = v136;
                  uint64_t v47 = *(NSObject **)(v136 + 48);
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v48 = *(void *)(v136 + 56);
                    *(_DWORD *)buf = 138543874;
                    uint64_t v171 = v48;
                    __int16 v172 = 2114;
                    v173 = v45;
                    __int16 v174 = 2114;
                    id v175 = v41;
                    _os_log_error_impl(&dword_1D31CE000, v47, OS_LOG_TYPE_ERROR, "(%{public}@} Error committing staged changes for csc %{public}@: %{public}@", buf, 0x20u);
                  }
                  char v130 = 0;
                  goto LABEL_46;
                }
                ++v43;
                __int16 v44 = v41;
              }
              while (v40 != v43);
              uint64_t v40 = [v38 countByEnumeratingWithState:&v151 objects:v183 count:16];
              if (v40) {
                continue;
              }
              break;
            }
            a1 = v136;
LABEL_46:
          }
        }
        uint64_t v35 = [v126 countByEnumeratingWithState:&v155 objects:v184 count:16];
      }
      while (v35);

      if ((v130 & 1) == 0)
      {
        int v49 = 1;
        int v50 = 1;
LABEL_74:
        if ([obj count]) {
          int v71 = 1;
        }
        else {
          int v71 = v49;
        }
        id v72 = *(NSObject **)(a1 + 48);
        int v123 = v50 | v71;
        if ((v50 | v71) == 1)
        {
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
            __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke_149_cold_1(a1, (uint64_t)obj, v72);
          }
          id v73 = *(NSObject **)(a1 + 48);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v74 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 138543362;
            uint64_t v171 = v74;
            _os_log_impl(&dword_1D31CE000, v73, OS_LOG_TYPE_DEFAULT, "(%{public}@} Executing revert of changes for events:", buf, 0xCu);
          }
          long long v143 = 0u;
          long long v144 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          id v75 = [*(id *)(a1 + 40) emittedEvents];
          uint64_t v76 = [v75 countByEnumeratingWithState:&v141 objects:v181 count:16];
          if (v76)
          {
            uint64_t v77 = v76;
            uint64_t v78 = *(void *)v142;
            do
            {
              for (uint64_t k = 0; k != v77; ++k)
              {
                if (*(void *)v142 != v78) {
                  objc_enumerationMutation(v75);
                }
                __int16 v80 = *(void **)(*((void *)&v141 + 1) + 8 * k);
                id v81 = *(NSObject **)(v136 + 48);
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v82 = *(void *)(v136 + 56);
                  long long v83 = v81;
                  long long v84 = [v80 originatingRoleCoordinatorChange];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v171 = v82;
                  __int16 v172 = 2114;
                  v173 = v80;
                  __int16 v174 = 2114;
                  id v175 = v84;
                  _os_log_impl(&dword_1D31CE000, v83, OS_LOG_TYPE_DEFAULT, "(%{public}@} Reverting event: %{public}@; origin change: %{public}@",
                    buf,
                    0x20u);
                }
                if ([v80 couldRevert])
                {
                  int v85 = [v80 revert];
                  long long v86 = *(NSObject **)(v136 + 48);
                  if (v85)
                  {
                    if (os_log_type_enabled(*(os_log_t *)(v136 + 48), OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v87 = *(void *)(v136 + 56);
                      *(_DWORD *)buf = 138543618;
                      uint64_t v171 = v87;
                      __int16 v172 = 2114;
                      v173 = v80;
                      _os_log_impl(&dword_1D31CE000, v86, OS_LOG_TYPE_DEFAULT, "(%{public}@} Reverted %{public}@", buf, 0x16u);
                    }
                  }
                  else if (os_log_type_enabled(*(os_log_t *)(v136 + 48), OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v88 = *(void *)(v136 + 56);
                    *(_DWORD *)buf = 138543618;
                    uint64_t v171 = v88;
                    __int16 v172 = 2114;
                    v173 = v80;
                    _os_log_error_impl(&dword_1D31CE000, v86, OS_LOG_TYPE_ERROR, "(%{public}@} Unable to revert %{public}@", buf, 0x16u);
                  }
                }
              }
              uint64_t v77 = [v75 countByEnumeratingWithState:&v141 objects:v181 count:16];
            }
            while (v77);
          }

          long long v89 = (void *)MEMORY[0x1E4F28C58];
          v90 = @"(null tx identifier)";
          if (*(void *)(v136 + 56)) {
            v90 = *(__CFString **)(v136 + 56);
          }
          uint64_t v91 = *MEMORY[0x1E4F28750];
          v179[0] = @"txIdentifier";
          v179[1] = v91;
          v180[0] = v90;
          v180[1] = obj;
          __int16 v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v180 forKeys:v179 count:2];
          uint64_t v93 = objc_msgSend(v89, "pbf_generalErrorWithCode:userInfo:", 8, v92);
          uint64_t v94 = *(void *)(*(void *)(v136 + 144) + 8);
          v95 = *(void **)(v94 + 40);
          *(void *)(v94 + 40) = v93;

          (*(void (**)(void))(*(void *)(v136 + 136) + 16))();
        }
        else
        {
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v96 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 138543362;
            uint64_t v171 = v96;
            _os_log_impl(&dword_1D31CE000, v72, OS_LOG_TYPE_DEFAULT, "(%{public}@ Data store has committed changes w/ no errors; building results",
              buf,
              0xCu);
          }
          v97 = *(void **)(a1 + 80);
          id v98 = [*(id *)(a1 + 40) affectedRoles];
          [v97 unionSet:v98];

          long long v139 = 0u;
          long long v140 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          id v125 = *(id *)(*(void *)(a1 + 32) + 16);
          id v127 = (id)[v125 countByEnumeratingWithState:&v137 objects:v178 count:16];
          if (v127)
          {
            uint64_t v99 = *(void *)v138;
            uint64_t v124 = *(void *)v138;
            do
            {
              for (m = 0; m != v127; m = (char *)m + 1)
              {
                if (*(void *)v138 != v99) {
                  objc_enumerationMutation(v125);
                }
                uint64_t v101 = *(void **)(*((void *)&v137 + 1) + 8 * (void)m);
                v102 = [*(id *)(a1 + 64) objectForKeyedSubscript:v101];
                uint64_t v103 = [*(id *)(a1 + 88) objectForKey:v101];
                v104 = [v102 buildNewPosterCollectionFromStorage:v135];
                v131 = (void *)[objc_alloc(MEMORY[0x1E4F92618]) initWithCollection:v103 newCollection:v104];
                objc_msgSend(*(id *)(a1 + 96), "setObject:forKey:");
                v105 = [*(id *)(a1 + 104) objectForKeyedSubscript:v101];
                v106 = objc_msgSend(*(id *)(a1 + 112), "pbf_desiredActiveConfigurationForRole:", v101);
                v134 = (void *)v103;
                if ((v106
                   && ([v104 posterWithUUID:v106],
                       (v107 = objc_claimAutoreleasedReturnValue()) != 0)
                   || ([v102 determineActivePosterConfigurationForStorage:v135 context:*(void *)(a1 + 112)], (v107 = objc_claimAutoreleasedReturnValue()) != 0))&& (objc_msgSend(v107, "isEqual:", v105) & 1) == 0)
                {
                  v111 = +[PBFPosterDataStoreEventBuilder posterActivated:v107 previous:v105];
                  v112 = [v111 buildWithError:0];

                  if (v112)
                  {
                    v113 = *(NSObject **)(a1 + 48);
                    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v114 = *(void *)(a1 + 56);
                      *(_DWORD *)buf = 138544130;
                      uint64_t v171 = v114;
                      __int16 v172 = 2114;
                      v173 = v101;
                      __int16 v174 = 2114;
                      id v175 = v105;
                      __int16 v176 = 2114;
                      v177 = v107;
                      _os_log_impl(&dword_1D31CE000, v113, OS_LOG_TYPE_DEFAULT, "(%{public}@ Active poster configuration updated for role '%{public}@' from %{public}@ -> %{public}@", buf, 0x2Au);
                    }
                    [*(id *)(a1 + 32) _processEvent:v112 changeHandler:v135 recursiveDepth:0 transaction:*(void *)(a1 + 40) error:0];
                    v115 = *(void **)(a1 + 80);
                    v116 = [*(id *)(a1 + 40) affectedRoles];
                    [v115 unionSet:v116];

                    a1 = v136;
                  }
                  [*(id *)(a1 + 120) setObject:v107 forKeyedSubscript:v101];

                  uint64_t v99 = v124;
                }
                else
                {
                  v108 = *(NSObject **)(a1 + 48);
                  BOOL v109 = os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT);
                  if (v105)
                  {
                    if (v109)
                    {
                      uint64_t v110 = *(void *)(a1 + 56);
                      *(_DWORD *)buf = 138543874;
                      uint64_t v171 = v110;
                      __int16 v172 = 2114;
                      v173 = v101;
                      __int16 v174 = 2114;
                      id v175 = v105;
                      _os_log_impl(&dword_1D31CE000, v108, OS_LOG_TYPE_DEFAULT, "(%{public}@ Active poster configuration stays the same for role '%{public}@': %{public}@", buf, 0x20u);
                    }
                    [*(id *)(a1 + 120) setObject:v105 forKeyedSubscript:v101];
                  }
                  else if (v109)
                  {
                    uint64_t v117 = *(void *)(a1 + 56);
                    *(_DWORD *)buf = 138543874;
                    uint64_t v171 = v117;
                    __int16 v172 = 2114;
                    v173 = v101;
                    __int16 v174 = 2114;
                    id v175 = 0;
                    _os_log_impl(&dword_1D31CE000, v108, OS_LOG_TYPE_DEFAULT, "(%{public}@ Active poster configuration for role '%{public}@' is invalid: %{public}@", buf, 0x20u);
                  }
                }
              }
              id v127 = (id)[v125 countByEnumeratingWithState:&v137 objects:v178 count:16];
            }
            while (v127);
          }

          v118 = *(NSObject **)(a1 + 48);
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v119 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 138543362;
            uint64_t v171 = v119;
            _os_log_impl(&dword_1D31CE000, v118, OS_LOG_TYPE_DEFAULT, "(%{public}@ Successfully performed changes and committed staged changes.", buf, 0xCu);
          }
        }
        uint64_t v9 = v123 ^ 1u;
        goto LABEL_127;
      }
    }
    else
    {
    }
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v61 = *(id *)(a1 + 72);
    uint64_t v62 = [v61 countByEnumeratingWithState:&v146 objects:v182 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v147;
      while (2)
      {
        for (uint64_t n = 0; n != v63; ++n)
        {
          if (*(void *)v147 != v64) {
            objc_enumerationMutation(v61);
          }
          id v66 = *(void **)(*((void *)&v146 + 1) + 8 * n);
          id v145 = 0;
          char v67 = [v66 commitStagedWithError:&v145];
          id v68 = v145;
          id v69 = v68;
          if ((v67 & 1) == 0)
          {
            [obj addObject:v68];
            a1 = v136;
            id v70 = *(NSObject **)(v136 + 48);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              uint64_t v122 = *(void *)(v136 + 56);
              *(_DWORD *)buf = 138543874;
              uint64_t v171 = v122;
              __int16 v172 = 2114;
              v173 = v66;
              __int16 v174 = 2114;
              id v175 = v69;
              _os_log_error_impl(&dword_1D31CE000, v70, OS_LOG_TYPE_ERROR, "(%{public}@} Error committing staged changes for esc %{public}@: %{public}@", buf, 0x20u);
            }

            int v50 = 1;
            goto LABEL_73;
          }
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v146 objects:v182 count:16];
        if (v63) {
          continue;
        }
        break;
      }
      int v50 = 0;
      a1 = v136;
    }
    else
    {
      int v50 = 0;
    }
LABEL_73:

    int v49 = 0;
    goto LABEL_74;
  }
  int v8 = v6;
  (*(void (**)(void))(*(void *)(a1 + 136) + 16))();
  if (!*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 40))
  {
    id v54 = (void *)MEMORY[0x1E4F28C58];
    if (!v8)
    {
      uint64_t v59 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 0, 0);
      uint64_t v9 = 0;
      uint64_t v60 = *(void *)(*(void *)(a1 + 144) + 8);
      id obja = *(id *)(v60 + 40);
      *(void *)(v60 + 40) = v59;

      goto LABEL_128;
    }
    id v55 = @"(null tx identifier)";
    if (*(void *)(a1 + 56)) {
      id v55 = *(__CFString **)(a1 + 56);
    }
    v187 = @"txIdentifier";
    v188[0] = v55;
    id obj = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v188 forKeys:&v187 count:1];
    uint64_t v56 = objc_msgSend(v54, "pbf_generalErrorWithCode:userInfo:", 3);
    uint64_t v57 = *(void *)(*(void *)(a1 + 144) + 8);
    long long v58 = *(void **)(v57 + 40);
    *(void *)(v57 + 40) = v56;

LABEL_57:
    uint64_t v9 = 0;
LABEL_127:

    goto LABEL_128;
  }
  uint64_t v9 = 0;
LABEL_128:

  return v9;
}

- (BOOL)_executeChange:(id)a3 roleCoordinator:(id)a4 changeHandler:(id)a5 recursiveDepth:(unint64_t)a6 transaction:(id)a7 error:(id *)a8
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    BOOL v18 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  [(PBFPosterRoleProcessor *)self _fireWillExecuteChange:v14 transaction:v17];
  if (![v17 isInvalidated])
  {
    id v39 = 0;
    int v21 = [v15 updateCoordinatorWithChange:v14 changeHandler:v16 emitEvents:&v39 error:a8];
    id v22 = v39;
    if (v21)
    {
      uint64_t v23 = [v17 affectedRoles];
      id v33 = v15;
      uint64_t v24 = [v15 role];
      [v23 addObject:v24];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v34 = v22;
      id v25 = v22;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v36;
        unint64_t v29 = a6 + 1;
        while (2)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v36 != v28) {
              objc_enumerationMutation(v25);
            }
            if (![(PBFPosterRoleProcessor *)self _processEvent:*(void *)(*((void *)&v35 + 1) + 8 * i) changeHandler:v16 recursiveDepth:v29 transaction:v17 error:a8])
            {
              id v15 = v33;
              id v22 = v34;
              goto LABEL_20;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v42 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      [(PBFPosterRoleProcessor *)self _fireDidExecuteChange:v14 transaction:v17];
      if (![v17 isInvalidated])
      {
        BOOL v18 = 1;
        id v15 = v33;
        id v22 = v34;
        goto LABEL_22;
      }
      id v22 = v34;
      if (!a8)
      {
        BOOL v18 = 0;
        id v15 = v33;
        goto LABEL_22;
      }
      int v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F28588];
      id v41 = @"transaction invalidated";
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 3, v25);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = v33;
LABEL_20:
    }
    BOOL v18 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (a8)
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28588];
    v44[0] = @"transaction invalidated";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    objc_msgSend(v19, "pbf_generalErrorWithCode:userInfo:", 3, v20);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v18 = 0;
LABEL_23:

  return v18;
}

- (BOOL)_processEvent:(id)a3 changeHandler:(id)a4 recursiveDepth:(unint64_t)a5 transaction:(id)a6 error:(id *)a7
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v49 = a4;
  id v13 = a6;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    BOOL v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [v13 appendEmittedEvent:v12];
    [(PBFPosterRoleProcessor *)self _fireWillEvaluateEvent:v12 transaction:v13];
    if ([v13 isInvalidated])
    {
      if (a7)
      {
        id v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v73 = *MEMORY[0x1E4F28588];
        v74[0] = @"transaction invalidated";
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];
        objc_msgSend(v15, "pbf_generalErrorWithCode:userInfo:", 3, v16);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v14 = 0;
    }
    else
    {
      uint64_t v17 = [v13 shortIdentifier];
      BOOL v18 = [(PBFPosterRoleProcessor *)self log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v67 = v17;
        __int16 v68 = 2114;
        id v69 = v12;
        _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@} Processing event: %{public}@", buf, 0x16u);
      }
      id v19 = [v13 affectedRoles];
      uint64_t v41 = [v19 count];
      char v46 = v18;

      roleCoordinators = self->_roleCoordinators;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __87__PBFPosterRoleProcessor__processEvent_changeHandler_recursiveDepth_transaction_error___block_invoke;
      v59[3] = &unk_1E6984630;
      BOOL v62 = v41 != 0;
      id v21 = v13;
      id v60 = v21;
      id v43 = v12;
      id v61 = v43;
      [(NSArray *)roleCoordinators bs_filter:v59];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v44 = [obj countByEnumeratingWithState:&v55 objects:v72 count:16];
      uint64_t v42 = (void *)v17;
      if (v44)
      {
        uint64_t v45 = *(void *)v56;
        unint64_t v22 = a5 + 1;
        id v39 = v13;
        id v40 = v12;
        do
        {
          uint64_t v23 = 0;
          id v24 = v43;
          do
          {
            if (*(void *)v56 != v45) {
              objc_enumerationMutation(obj);
            }
            id v25 = *(void **)(*((void *)&v55 + 1) + 8 * v23);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              uint64_t v67 = v17;
              __int16 v68 = 2114;
              id v69 = v24;
              __int16 v70 = 2114;
              int v71 = v25;
              _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@} Issuing event %{public}@ to %{public}@", buf, 0x20u);
            }
            id v54 = 0;
            char v26 = [v25 notifyEventWasReceived:v24 changes:&v54 storage:v49];
            id v27 = v54;
            uint64_t v47 = v27;
            if (v26)
            {
              if (!v41)
              {
                id v28 = v27;
                unint64_t v29 = [v21 affectedRoles];
                char v30 = [v25 role];
                [v29 addObject:v30];

                id v27 = v28;
              }
              long long v52 = 0u;
              long long v53 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              id v31 = v27;
              uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v65 count:16];
              if (v32)
              {
                uint64_t v33 = v32;
                uint64_t v34 = *(void *)v51;
                while (2)
                {
                  for (uint64_t i = 0; i != v33; ++i)
                  {
                    if (*(void *)v51 != v34) {
                      objc_enumerationMutation(v31);
                    }
                    if (![(PBFPosterRoleProcessor *)self _executeChange:*(void *)(*((void *)&v50 + 1) + 8 * i) roleCoordinator:v25 changeHandler:v49 recursiveDepth:v22 transaction:v21 error:a7])
                    {

                      long long v37 = obj;
                      id v13 = v39;
                      id v12 = v40;
                      BOOL v18 = v46;
                      goto LABEL_36;
                    }
                  }
                  uint64_t v33 = [v31 countByEnumeratingWithState:&v50 objects:v65 count:16];
                  if (v33) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v17 = (uint64_t)v42;
              id v24 = v43;
              BOOL v18 = v46;
            }
            else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              uint64_t v67 = v17;
              __int16 v68 = 2114;
              id v69 = v24;
              __int16 v70 = 2114;
              int v71 = v25;
              _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@} Event %{public}@ was not handled by role coordinator %{public}@; continuing",
                buf,
                0x20u);
            }

            ++v23;
          }
          while (v23 != v44);
          id v13 = v39;
          id v12 = v40;
          uint64_t v44 = [obj countByEnumeratingWithState:&v55 objects:v72 count:16];
        }
        while (v44);
      }

      [(PBFPosterRoleProcessor *)self _fireDidEvaluateEvent:v43 transaction:v21];
      if ([v21 isInvalidated])
      {
        if (a7)
        {
          long long v36 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v63 = *MEMORY[0x1E4F28588];
          uint64_t v64 = @"transaction invalidated";
          long long v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
          objc_msgSend(v36, "pbf_generalErrorWithCode:userInfo:", 3, v37);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:
        }
        BOOL v14 = 0;
      }
      else
      {
        BOOL v14 = 1;
      }
    }
  }

  return v14;
}

uint64_t __87__PBFPosterRoleProcessor__processEvent_changeHandler_recursiveDepth_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48)
    && ([*(id *)(a1 + 32) affectedRoles],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v3 role],
        int v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 containsObject:v5],
        v5,
        v4,
        !v6))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v3 validateEventIsRelevant:*(void *)(a1 + 40)];
  }

  return v7;
}

- (void)_fireWillBeginTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = objc_msgSend(v4, "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 roleProcessor:self willBeginTransaction:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_fireDidBeginTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = objc_msgSend(v4, "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 roleProcessor:self didBeginTransaction:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_fireWillExecuteChange:(id)a3 transaction:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = objc_msgSend(v7, "observers", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 roleProcessor:self willExecuteChange:v6 transaction:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_fireDidExecuteChange:(id)a3 transaction:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = objc_msgSend(v7, "observers", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 roleProcessor:self didExecuteChange:v6 transaction:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_fireWillEvaluateEvent:(id)a3 transaction:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = objc_msgSend(v7, "observers", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 roleProcessor:self willEvaluateEvent:v6 transaction:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_fireDidEvaluateEvent:(id)a3 transaction:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = objc_msgSend(v7, "observers", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 roleProcessor:self didEvaluateEvent:v6 transaction:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_fireWillFinalizeTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = objc_msgSend(v4, "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 roleProcessor:self willFinalizeTransaction:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_fireDidFinalizeTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = objc_msgSend(v4, "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 roleProcessor:self didFinalizeTransaction:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_fireWillCommitTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = objc_msgSend(v4, "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 roleProcessor:self willCommitTransaction:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_fireDidCommitTransaction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = objc_msgSend(v4, "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 roleProcessor:self didCommitTransaction:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_fireTransactionFinished:(id)a3 result:(id)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v17 = a4;
  id v9 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v8 observers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    if (v9) {
      id v14 = 0;
    }
    else {
      id v14 = v17;
    }
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 roleProcessor:self transactionFinished:v8 success:v9 == 0 results:v14 error:v9];
        }
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [v8 cancel];
  [(PBFPosterRoleProcessor *)self _resetRoleCoordinatorTransaction];
}

- (void)_fireWasInvalidated:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = objc_msgSend(v4, "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 roleProcessorWasInvalidated:self];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [v4 cancel];
  [(PBFPosterRoleProcessor *)self _resetRoleCoordinatorTransaction];
}

- (void)_resetRoleCoordinatorTransaction
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_roleCoordinators;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "finalizeTransactionCount", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)invalidate
{
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    id obj = self;
    objc_sync_enter(obj);
    [(_PBFPosterRoleProcessorTransaction *)obj->_activeTransaction invalidate];
    activeTransactiouint64_t n = obj->_activeTransaction;
    obj->_activeTransactiouint64_t n = 0;

    objc_sync_exit(obj);
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  self->_log = (OS_os_log *)a3;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLogIdentifier:(id)a3
{
}

- (PBFPosterExtensionDataStorage)dataStorage
{
  return (PBFPosterExtensionDataStorage *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)roleCoordinators
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleCoordinators, 0);
  objc_storeStrong((id *)&self->_dataStorage, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_roleToRoleCoordinator, 0);
  objc_storeStrong((id *)&self->_roleOrderedSet, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
}

- (void)initWithDataStorage:roleCoordinators:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDataStorage:roleCoordinators:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDataStorage:roleCoordinators:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)processChanges:context:reason:userInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)processChanges:context:reason:userInfo:error:.cold.3()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __71__PBFPosterRoleProcessor_processChanges_context_reason_userInfo_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "(%{public}@} Failed to execute changes w/ error: %{public}@");
}

- (void)processEvents:context:reason:userInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)processEvents:context:reason:userInfo:error:.cold.3()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __70__PBFPosterRoleProcessor_processEvents_context_reason_userInfo_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "(%{public}@} Failed to process events w/ error: %{public}@");
}

- (void)_executeTransaction:(uint64_t)a1 block:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, a2, a3, "(%{public}@} Failed to execute transaction: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __58__PBFPosterRoleProcessor__executeTransaction_block_error___block_invoke_149_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 56);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, a2, a3, "(%{public}@} Error committing changes: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end