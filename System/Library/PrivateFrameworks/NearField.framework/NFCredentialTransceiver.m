@interface NFCredentialTransceiver
- (BOOL)deleteApplets:(id)a3 queueServerConnection:(BOOL)a4 outError:(id *)a5;
- (BOOL)hasInvalidated;
- (NFCredentialSession)parentSession;
- (NFCredentialTransceiver)init;
- (id)_invalidateParentSession;
- (id)_syncGetSessionWithError:(id *)a3;
- (id)listAppletsAndRefreshCache:(BOOL)a3 outError:(id *)a4;
- (id)queryExtraInfoForApplets:(id)a3 outError:(id *)a4;
- (id)signChallenge:(id)a3 outError:(id *)a4;
- (id)transceive:(id)a3 outError:(id *)a4;
- (os_unfair_lock_s)lock;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setParentSession:(id)a3;
@end

@implementation NFCredentialTransceiver

- (NFCredentialTransceiver)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFCredentialTransceiver;
  v2 = [(NFCredentialTransceiver *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasInvalidated
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  p_lock = &self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__NFCredentialTransceiver_hasInvalidated__block_invoke;
  v4[3] = &unk_1E595D770;
  v4[4] = self;
  v4[5] = &v5;
  os_unfair_lock_lock(&self->_lock);
  __41__NFCredentialTransceiver_hasInvalidated__block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)p_lock;
}

void __41__NFCredentialTransceiver_hasInvalidated__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) parentSession];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == 0;
}

- (id)_syncGetSessionWithError:(id *)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  p_lock = &self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__NFCredentialTransceiver__syncGetSessionWithError___block_invoke;
  v12[3] = &unk_1E595D770;
  v12[4] = self;
  v12[5] = &v13;
  os_unfair_lock_lock(&self->_lock);
  __52__NFCredentialTransceiver__syncGetSessionWithError___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = (void *)v14[5];
  if (v5)
  {
    id v6 = v5;
  }
  else if (a3)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    char v8 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v9 = [NSString stringWithUTF8String:"Invalid State"];
    v20[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a3 = (id)[v7 initWithDomain:v8 code:12 userInfo:v10];
  }
  _Block_object_dispose(&v13, 8);

  return v5;
}

uint64_t __52__NFCredentialTransceiver__syncGetSessionWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) parentSession];
  return MEMORY[0x1F41817F8]();
}

- (id)transceive:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_19D636000, "transceive:outError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  char v8 = [(NFCredentialTransceiver *)self _syncGetSessionWithError:a4];
  v9 = v8;
  if (v8)
  {
    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__11;
    v25 = __Block_byref_object_dispose__11;
    id v26 = 0;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__11;
    v20 = __Block_byref_object_dispose__11;
    id v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__NFCredentialTransceiver_transceive_outError___block_invoke;
    v15[3] = &unk_1E595CF58;
    v15[4] = &v16;
    v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__NFCredentialTransceiver_transceive_outError___block_invoke_2;
    v14[3] = &unk_1E595E0C0;
    v14[4] = &state;
    v14[5] = &v16;
    [v10 transceive:v6 completion:v14];

    if (IsXPCInvalidated((void *)v17[5])) {
      id v11 = [(NFCredentialTransceiver *)self _invalidateParentSession];
    }
    if (a4) {
      *a4 = (id) v17[5];
    }
    id v12 = *(id *)(state.opaque[1] + 40);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&state, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __47__NFCredentialTransceiver_transceive_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __47__NFCredentialTransceiver_transceive_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)listAppletsAndRefreshCache:(BOOL)a3 outError:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v7 = _os_activity_create(&dword_19D636000, "listAppletsWithCachRefresh:outError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  char v8 = [(NFCredentialTransceiver *)self _syncGetSessionWithError:a4];
  uint64_t v9 = v8;
  if (v8)
  {
    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__11;
    v25 = __Block_byref_object_dispose__11;
    id v26 = 0;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__11;
    v20 = __Block_byref_object_dispose__11;
    id v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__NFCredentialTransceiver_listAppletsAndRefreshCache_outError___block_invoke;
    v15[3] = &unk_1E595CF58;
    v15[4] = &v16;
    v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__NFCredentialTransceiver_listAppletsAndRefreshCache_outError___block_invoke_2;
    v14[3] = &unk_1E595D078;
    v14[4] = &state;
    v14[5] = &v16;
    [v10 listAppletsAndRefreshCache:v5 completion:v14];

    if (IsXPCInvalidated((void *)v17[5])) {
      id v11 = [(NFCredentialTransceiver *)self _invalidateParentSession];
    }
    if (a4) {
      *a4 = (id) v17[5];
    }
    id v12 = *(id *)(state.opaque[1] + 40);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&state, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __63__NFCredentialTransceiver_listAppletsAndRefreshCache_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __63__NFCredentialTransceiver_listAppletsAndRefreshCache_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)queryExtraInfoForApplets:(id)a3 outError:(id *)a4
{
  v50[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = _os_activity_create(&dword_19D636000, "appletExtraInfos:outError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  if ([v7 count])
  {
    uint64_t v9 = [(NFCredentialTransceiver *)self _syncGetSessionWithError:a4];
    if (v9)
    {
      SEL v25 = a2;
      state.opaque[0] = 0;
      state.opaque[1] = (uint64_t)&state;
      uint64_t v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__11;
      v46 = __Block_byref_object_dispose__11;
      id v47 = 0;
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__11;
      v41 = __Block_byref_object_dispose__11;
      id v42 = 0;
      v10 = objc_opt_new();
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v34 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = [*(id *)(*((void *)&v33 + 1) + 8 * i) identifierAsData];
            [v10 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
        }
        while (v13);
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __61__NFCredentialTransceiver_queryExtraInfoForApplets_outError___block_invoke;
      v32[3] = &unk_1E595CF58;
      v32[4] = &v37;
      v17 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v32];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __61__NFCredentialTransceiver_queryExtraInfoForApplets_outError___block_invoke_2;
      v26[3] = &unk_1E595E110;
      v29 = &v37;
      p_os_activity_scope_state_s state = &state;
      id v27 = v11;
      v28 = self;
      SEL v31 = v25;
      [v17 queryExtraInfoForApplets:v10 completion:v26];

      if (IsXPCInvalidated((void *)v38[5])) {
        id v18 = [(NFCredentialTransceiver *)self _invalidateParentSession];
      }
      if (a4) {
        *a4 = (id) v38[5];
      }
      a4 = (id *)*(id *)(state.opaque[1] + 40);

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&state, 8);

      goto LABEL_18;
    }
  }
  else
  {
    if (!a4) {
      goto LABEL_19;
    }
    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = [NSString stringWithUTF8String:"nfcd"];
    v49[0] = *MEMORY[0x1E4F28568];
    v20 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v50[0] = v20;
    v50[1] = &unk_1EEF359F8;
    v49[1] = @"Line";
    v49[2] = @"Method";
    id v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", sel_getName(a2));
    v50[2] = v21;
    v49[3] = *MEMORY[0x1E4F28228];
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%d", sel_getName(a2), 132);
    v50[3] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:4];
    *a4 = (id)[v19 initWithDomain:v9 code:10 userInfo:v23];
  }
  a4 = 0;
LABEL_18:

LABEL_19:
  return a4;
}

void __61__NFCredentialTransceiver_queryExtraInfoForApplets_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __61__NFCredentialTransceiver_queryExtraInfoForApplets_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (!v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v32 = v5;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      uint64_t v14 = (const void **)MEMORY[0x1E4FBA898];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v17 = *(void **)(a1 + 32);
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __61__NFCredentialTransceiver_queryExtraInfoForApplets_outError___block_invoke_3;
          v33[3] = &unk_1E595E0E8;
          v33[4] = v16;
          uint64_t v18 = [v17 indexOfObjectWithOptions:0 passingTest:v33];
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            dispatch_get_specific(*v14);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              v20 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(*(id *)(a1 + 40));
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(*(id *)(a1 + 40));
              Name = sel_getName(*(SEL *)(a1 + 64));
              uint64_t v24 = 45;
              if (isMetaClass) {
                uint64_t v24 = 43;
              }
              v20(3, "%c[%{public}s %{public}s]:%i Unexpected applet extra info found", v24, ClassName, Name, 167);
            }
            dispatch_get_specific(*v14);
            SEL v25 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              id v26 = object_getClass(*(id *)(a1 + 40));
              if (class_isMetaClass(v26)) {
                int v27 = 43;
              }
              else {
                int v27 = 45;
              }
              v28 = object_getClassName(*(id *)(a1 + 40));
              v29 = sel_getName(*(SEL *)(a1 + 64));
              *(_DWORD *)buf = 67109890;
              int v39 = v27;
              __int16 v40 = 2082;
              v41 = v28;
              __int16 v42 = 2082;
              v43 = v29;
              __int16 v44 = 1024;
              int v45 = 167;
              _os_log_impl(&dword_19D636000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected applet extra info found", buf, 0x22u);
            }
          }
          else
          {
            v30 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v18];
            SEL v25 = +[NFAppletExtraInfo infoWithDictionary:v16 applet:v30];

            if (v25) {
              [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v25];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v12);
    }

    id v6 = 0;
    id v5 = v32;
  }
}

uint64_t __61__NFCredentialTransceiver_queryExtraInfoForApplets_outError___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 identifier];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"appletAid"];
  uint64_t v8 = [v6 isEqualToString:v7];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

- (BOOL)deleteApplets:(id)a3 queueServerConnection:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = _os_activity_create(&dword_19D636000, "deleteApplets:queueServerConnection:outError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  uint64_t v11 = [(NFCredentialTransceiver *)self _syncGetSessionWithError:a5];
  uint64_t v12 = v11;
  if (v11)
  {
    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__11;
    v50 = __Block_byref_object_dispose__11;
    id v51 = 0;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __72__NFCredentialTransceiver_deleteApplets_queueServerConnection_outError___block_invoke;
    v46[3] = &unk_1E595CF58;
    v46[4] = &state;
    uint64_t v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v46];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __72__NFCredentialTransceiver_deleteApplets_queueServerConnection_outError___block_invoke_2;
    v45[3] = &unk_1E595CF58;
    v45[4] = &state;
    [v13 deleteApplets:v9 completion:v45];

    uint64_t v14 = state.opaque[1];
    if (v6 && !*(void *)(state.opaque[1] + 40))
    {
      sel = a2;
      uint64_t v15 = objc_opt_new();
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v16 = v9;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v60 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v42 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = [*(id *)(*((void *)&v41 + 1) + 8 * i) identifier];
            [v15 addObject:v21];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v60 count:16];
        }
        while (v18);
      }

      v22 = +[NFRemoteAdminManager sharedRemoteAdminManager];
      char v23 = [v22 queueServerConnectionForApplets:v15];

      if ((v23 & 1) == 0)
      {
        uint64_t v24 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          id v26 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(sel);
          uint64_t v30 = 45;
          if (isMetaClass) {
            uint64_t v30 = 43;
          }
          v26(4, "%c[%{public}s %{public}s]:%i Queue server fails.", v30, ClassName, Name, 210);
        }
        dispatch_get_specific(*v24);
        SEL v31 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = object_getClass(self);
          if (class_isMetaClass(v32)) {
            int v33 = 43;
          }
          else {
            int v33 = 45;
          }
          long long v34 = object_getClassName(self);
          long long v35 = sel_getName(sel);
          *(_DWORD *)buf = 67109890;
          int v53 = v33;
          __int16 v54 = 2082;
          v55 = v34;
          __int16 v56 = 2082;
          v57 = v35;
          __int16 v58 = 1024;
          int v59 = 210;
          _os_log_impl(&dword_19D636000, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Queue server fails.", buf, 0x22u);
        }
      }
      uint64_t v14 = state.opaque[1];
    }
    if (IsXPCInvalidated(*(void **)(v14 + 40))) {
      id v36 = [(NFCredentialTransceiver *)self _invalidateParentSession];
    }
    if (a5) {
      *a5 = *(id *)(state.opaque[1] + 40);
    }
    BOOL v37 = *(void *)(state.opaque[1] + 40) == 0;
    _Block_object_dispose(&state, 8);
  }
  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

void __72__NFCredentialTransceiver_deleteApplets_queueServerConnection_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __72__NFCredentialTransceiver_deleteApplets_queueServerConnection_outError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)signChallenge:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_19D636000, "signChallenge:outError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  uint64_t v8 = [(NFCredentialTransceiver *)self _syncGetSessionWithError:a4];
  id v9 = v8;
  if (v8)
  {
    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__11;
    SEL v25 = __Block_byref_object_dispose__11;
    id v26 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__11;
    v20 = __Block_byref_object_dispose__11;
    id v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__NFCredentialTransceiver_signChallenge_outError___block_invoke;
    v15[3] = &unk_1E595CF58;
    v15[4] = &state;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__NFCredentialTransceiver_signChallenge_outError___block_invoke_2;
    v14[3] = &unk_1E595E0C0;
    v14[4] = &v16;
    v14[5] = &state;
    [v10 signChallenge:v6 completion:v14];

    if (IsXPCInvalidated(*(void **)(state.opaque[1] + 40))) {
      id v11 = [(NFCredentialTransceiver *)self _invalidateParentSession];
    }
    if (a4) {
      *a4 = *(id *)(state.opaque[1] + 40);
    }
    id v12 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&state, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __50__NFCredentialTransceiver_signChallenge_outError___block_invoke(uint64_t a1, void *a2)
{
}

void __50__NFCredentialTransceiver_signChallenge_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_invalidateParentSession
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  id v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__NFCredentialTransceiver__invalidateParentSession__block_invoke;
  v5[3] = &unk_1E595D770;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->_lock);
  __51__NFCredentialTransceiver__invalidateParentSession__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __51__NFCredentialTransceiver__invalidateParentSession__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) parentSession];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1 + 32);
  return [v5 setParentSession:0];
}

- (void)invalidate
{
  uint64_t v3 = [(NFCredentialTransceiver *)self _invalidateParentSession];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__11;
  uint64_t v18 = __Block_byref_object_dispose__11;
  id v19 = 0;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = *MEMORY[0x1E4F281F8];
  do
  {
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __37__NFCredentialTransceiver_invalidate__block_invoke;
    v13[3] = &unk_1E595CF58;
    v13[4] = &v14;
    uint64_t v6 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__NFCredentialTransceiver_invalidate__block_invoke_2;
    v12[3] = &unk_1E595CBD0;
    v12[5] = &v14;
    void v12[6] = a2;
    v12[4] = self;
    [v6 requestApplets:0 selectOnStart:0 AIDAllowList:0 externalAuth:0 mode:0 completion:v12];

    uint64_t v7 = (void *)v15[5];
    if (!v7) {
      break;
    }
    uint64_t v8 = [v7 domain];
    int v9 = [v8 isEqual:v5];

    if (!v9) {
      break;
    }
    if ([(id)v15[5] code] != 4097) {
      break;
    }
    BOOL v10 = __OFSUB__(invalidate_retry--, 1);
  }
  while (!((invalidate_retry < 0) ^ v10 | (invalidate_retry == 0)));
  _Block_object_dispose(&v14, 8);
}

void __37__NFCredentialTransceiver_invalidate__block_invoke(uint64_t a1, void *a2)
{
}

void __37__NFCredentialTransceiver_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %@", v9, ClassName, Name, 282, v3);
    }
    dispatch_get_specific(*v4);
    BOOL v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      uint64_t v13 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      v22 = v13;
      __int16 v23 = 2082;
      uint64_t v24 = v14;
      __int16 v25 = 1024;
      int v26 = 282;
      __int16 v27 = 2112;
      id v28 = v3;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NFCredentialSession)parentSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSession);
  return (NFCredentialSession *)WeakRetained;
}

- (void)setParentSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end