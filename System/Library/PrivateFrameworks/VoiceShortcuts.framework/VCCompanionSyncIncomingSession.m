@interface VCCompanionSyncIncomingSession
+ (int64_t)direction;
- (void)resetDataStoreForSyncSession:(id)a3 completion:(id)a4;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
@end

@implementation VCCompanionSyncIncomingSession

+ (int64_t)direction
{
  return 1;
}

- (void)resetDataStoreForSyncSession:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v8 = [(VCCompanionSyncSession *)self syncDataHandlers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v25 = v7;
    id v26 = v6;
    id v11 = 0;
    uint64_t v12 = *(void *)v29;
    while (2)
    {
      uint64_t v13 = 0;
      v14 = v11;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        v16 = (void *)MEMORY[0x1C87C4C10]();
        id v27 = v14;
        int v17 = [v15 deleteSyncedData:&v27];
        id v11 = v27;

        v18 = getWFWatchSyncLogObject();
        v19 = v18;
        if (!v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315650;
            v33 = "-[VCCompanionSyncIncomingSession resetDataStoreForSyncSession:completion:]";
            __int16 v34 = 2114;
            v35 = self;
            __int16 v36 = 2114;
            id v37 = v11;
            _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_FAULT, "%s %{public}@ failed to reset local data: %{public}@", buf, 0x20u);
          }

          if (!v11)
          {
            v21 = (void *)MEMORY[0x1E4F28C58];
            v22 = (objc_class *)objc_opt_class();
            v23 = NSStringFromClass(v22);
            objc_msgSend(v21, "vc_voiceShortcutErrorWithCode:reason:", 3001, @"%@ failed to reset data store", v23);
            id v11 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v20 = 0;
          goto LABEL_17;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[VCCompanionSyncIncomingSession resetDataStoreForSyncSession:completion:]";
          __int16 v34 = 2114;
          v35 = self;
          _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_DEFAULT, "%s %{public}@ successfully reset local data", buf, 0x16u);
        }

        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    uint64_t v20 = 1;
LABEL_17:
    v7 = v25;
    id v6 = v26;
  }
  else
  {
    id v11 = 0;
    uint64_t v20 = 1;
  }

  v7[2](v7, v20, v11);
  v24 = [(VCCompanionSyncSession *)self transaction];
  os_transaction_needs_more_time();
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t, void *))a5;
  uint64_t v10 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v56 = "-[VCCompanionSyncIncomingSession syncSession:applyChanges:completion:]";
    __int16 v57 = 2114;
    v58 = self;
    __int16 v59 = 2048;
    uint64_t v60 = [v8 count];
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@ received %lu incoming changes", buf, 0x20u);
  }

  id v11 = [[VCSYChangeEnumerator alloc] initWithLazyArray:v8];
  uint64_t v12 = [(VCSYChangeEnumerator *)v11 allObjects];

  unint64_t v13 = [v12 count];
  if (v13 >= [v8 count])
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v16 = VCPartitionMessages(v12);
    v14 = (void *)[v15 initWithDictionary:v16];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = [(VCCompanionSyncSession *)self syncDataHandlers];
    uint64_t v17 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
    v47 = v14;
    if (v17)
    {
      uint64_t v18 = v17;
      v42 = v12;
      v43 = v9;
      id v44 = v8;
      id v45 = v7;
      v19 = 0;
      uint64_t v48 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v52 != v48) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x1C87C4C10]();
          v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_opt_class(), "messageType"));
          v24 = [v14 objectForKeyedSubscript:v23];
          [v14 removeObjectForKey:v23];
          if ([v24 count])
          {
            v25 = [(VCCompanionSyncSession *)self service];
            id v50 = v19;
            int v26 = [v21 applyChanges:v24 fromSyncService:v25 error:&v50];
            id v27 = v50;

            long long v28 = getWFWatchSyncLogObject();
            long long v29 = v28;
            if (!v26)
            {
              if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
              {
                uint64_t v32 = [v24 count];
                *(_DWORD *)buf = 136315906;
                v56 = "-[VCCompanionSyncIncomingSession syncSession:applyChanges:completion:]";
                __int16 v57 = 2114;
                v58 = self;
                __int16 v59 = 2048;
                uint64_t v60 = v32;
                __int16 v61 = 2114;
                id v62 = v27;
                _os_log_impl(&dword_1C7D7E000, v29, OS_LOG_TYPE_FAULT, "%s %{public}@ error applying %lu changes: %{public}@", buf, 0x2Au);
              }

              id v7 = v45;
              v14 = v47;
              if (!v27)
              {
                v33 = (void *)MEMORY[0x1E4F28C58];
                __int16 v34 = (objc_class *)objc_opt_class();
                v35 = NSStringFromClass(v34);
                objc_msgSend(v33, "vc_voiceShortcutErrorWithCode:reason:", 3001, @"%@ failed to apply %lu changes", v35, objc_msgSend(v24, "count"));
                id v27 = (id)objc_claimAutoreleasedReturnValue();
              }
              uint64_t v31 = 0;
              v19 = v27;
              goto LABEL_23;
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = [v24 count];
              *(_DWORD *)buf = 136315906;
              v56 = "-[VCCompanionSyncIncomingSession syncSession:applyChanges:completion:]";
              __int16 v57 = 2114;
              v58 = self;
              __int16 v59 = 2048;
              uint64_t v60 = v30;
              __int16 v61 = 2112;
              id v62 = v24;
              _os_log_impl(&dword_1C7D7E000, v29, OS_LOG_TYPE_DEFAULT, "%s %{public}@ successfully applied %lu changes=%@", buf, 0x2Au);
            }

            v19 = v27;
            v14 = v47;
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      uint64_t v31 = 1;
      id v7 = v45;
LABEL_23:
      uint64_t v9 = v43;
      id v8 = v44;
      uint64_t v12 = v42;
    }
    else
    {
      v19 = 0;
      uint64_t v31 = 1;
    }

    if ([v14 count])
    {
      __int16 v36 = [v14 allKeys];
      id v37 = objc_msgSend(v36, "if_compactMap:", &__block_literal_global_4198);
      v38 = [v37 componentsJoinedByString:@", "];

      uint64_t v39 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 3005, @"Changes of type %@ were unhandled", v38);

      v40 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "-[VCCompanionSyncIncomingSession syncSession:applyChanges:completion:]";
        __int16 v57 = 2114;
        v58 = v38;
        _os_log_impl(&dword_1C7D7E000, v40, OS_LOG_TYPE_FAULT, "%s Changes of type %{public}@ were unhandled, failing", buf, 0x16u);
      }

      uint64_t v31 = 0;
      v19 = (void *)v39;
      v14 = v47;
    }
    v9[2](v9, v31, v19);
    v41 = [(VCCompanionSyncSession *)self transaction];
    os_transaction_needs_more_time();
  }
  else
  {
    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 3001, @"Failed to apply %lu changes because %lu of them failed to deserialize", objc_msgSend(v8, "count"), objc_msgSend(v8, "count") - objc_msgSend(v12, "count"));
    v9[2](v9, 0, v14);
  }
}

__CFString *__70__VCCompanionSyncIncomingSession_syncSession_applyChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  int v2 = [a2 intValue];
  v3 = @"IntentDefinition";
  if (v2 == 2) {
    v3 = @"VoiceShortcut";
  }
  if (v2 == 3) {
    return @"Workflow";
  }
  else {
    return v3;
  }
}

@end