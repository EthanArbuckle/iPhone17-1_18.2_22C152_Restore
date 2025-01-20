@interface VCShortcutsObliterator
- (BOOL)deleteAppGroupWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteDataVaultWithError:(id *)a3;
- (BOOL)deleteKeychainItemsWithError:(id *)a3;
- (BOOL)terminateProcessWithIdentifier:(id)a3 assertion:(id *)a4 error:(id *)a5;
- (NSSet)syncDataHandlers;
- (VCShortcutsObliterator)initWithTriggerRegistrar:(id)a3 syncDataHandlers:(id)a4;
- (WFTriggerRegistrar)triggerRegistrar;
- (void)obliterate:(id *)a3;
- (void)resetWatchSync;
@end

@implementation VCShortcutsObliterator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncDataHandlers, 0);
  objc_storeStrong((id *)&self->_triggerRegistrar, 0);
}

- (NSSet)syncDataHandlers
{
  return self->_syncDataHandlers;
}

- (WFTriggerRegistrar)triggerRegistrar
{
  return self->_triggerRegistrar;
}

- (void)resetWatchSync
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(VCShortcutsObliterator *)self syncDataHandlers];
  v3 = [v2 valueForKeyPath:@"@distinctUnionOfArrays.services"];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v11 + 1) + 8 * i);
        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v9 = v8;
          }
          else {
            v9 = 0;
          }
        }
        else
        {
          v9 = 0;
        }
        id v10 = v9;

        [v10 requestFullResync];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (BOOL)terminateProcessWithIdentifier:(id)a3 assertion:(id *)a4 error:(id *)a5
{
  id v9 = a3;
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"VCShortcutsObliterator.m", 185, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v10 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:v9];
  long long v11 = [MEMORY[0x1E4F96430] predicateMatchingIdentity:v10];
  long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F96488]) initWithExplanation:@"VCShortcutsObliterator is terminating Shortcuts processes upon a data obliteration request"];
  [v12 setMaximumTerminationResistance:40];
  long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F96490]) initWithPredicate:v11 context:v12];
  id v22 = 0;
  id v23 = 0;
  char v14 = [v13 execute:&v23 error:&v22];
  id v15 = v23;
  id v16 = v22;
  if (a4) {
    *a4 = v15;
  }
  if ((v14 & 1) == 0)
  {
    v17 = [v16 domain];
    if ([v17 isEqualToString:*MEMORY[0x1E4F964C8]])
    {
      v21 = a5;
      uint64_t v18 = [v16 code];

      if (v18 != 3)
      {
        a5 = v21;
        if (!v21) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      v17 = v16;
      id v16 = 0;
      a5 = v21;
    }

    if (a5)
    {
LABEL_10:
      id v16 = v16;
      *a5 = v16;
    }
  }
LABEL_11:

  return v14;
}

- (BOOL)deleteDataVaultWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4FB4BE8];
  id v16 = 0;
  id v17 = 0;
  BOOL v5 = [(VCShortcutsObliterator *)self terminateProcessWithIdentifier:v4 assertion:&v17 error:&v16];
  id v6 = v17;
  id v7 = v16;
  id v8 = v7;
  if (!v5 && v7)
  {
    id v9 = getWFObliteratorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[VCShortcutsObliterator deleteDataVaultWithError:]";
      __int16 v20 = 2114;
      uint64_t v21 = v4;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_FAULT, "%s Terminating %{public}@ failed with error: %{public}@", buf, 0x20u);
    }

    if (a3) {
      *a3 = v8;
    }
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "wf_shortcutsDirectoryURL");
  long long v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  char v12 = [v11 removeItemAtURL:v10 error:&v15];
  id v13 = v15;

  if (v6) {
    [v6 invalidate];
  }
  if (objc_msgSend(v13, "vc_isFileNotFound"))
  {

    id v13 = 0;
    char v12 = 1;
  }
  else if (a3 && v13)
  {
    id v13 = v13;
    *a3 = v13;
  }

  return v12;
}

- (BOOL)deleteAppGroupWithIdentifier:(id)a3 error:(id *)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"VCShortcutsObliterator.m", 123, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v8 = v7;
  [v8 UTF8String];
  container_create_or_lookup_for_current_user();
  id v9 = v8;
  uint64_t v18 = v9;
  uint64_t v10 = container_delete();
  BOOL v11 = v10 == 21 || v10 == 1;
  if (v10 != 1 && v10 != 21)
  {
    char v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    id v13 = [NSString stringWithFormat:@"Moving %@'s app group container out of its live location failed with error: %llu", v9, v10];
    v20[0] = v13;
    char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v15 = [v12 errorWithDomain:@"VCShortcutsObliteratorErrorDomain" code:2 userInfo:v14];

    if (a4) {
      *a4 = v15;
    }
  }
  return v11;
}

void __61__VCShortcutsObliterator_deleteAppGroupWithIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2 != 1 && a2 != 21)
  {
    uint64_t v4 = getWFObliteratorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315650;
      id v7 = "-[VCShortcutsObliterator deleteAppGroupWithIdentifier:error:]_block_invoke";
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = a2;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_FAULT, "%s container_delete for app group %{public}@ failed with error: %llu", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (BOOL)deleteKeychainItemsWithError:(id *)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B550];
  v15[0] = *MEMORY[0x1E4F3B978];
  v15[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F5AC30];
  v16[0] = *MEMORY[0x1E4F3B988];
  v16[1] = v5;
  CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  OSStatus v7 = SecItemDelete(v6);
  OSStatus v8 = v7;
  if (v7 != -25300 && v7 != 0)
  {
    __int16 v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
    uint64_t v11 = v10;
    if (a3) {
      *a3 = v10;
    }
  }
  if (v8) {
    BOOL v12 = v8 == -25300;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = v12;

  return v13;
}

- (void)obliterate:(id *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = getWFObliteratorLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Starting obliterator", buf, 0xCu);
  }
  v39 = a3;

  CFDictionaryRef v6 = getWFObliteratorLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Unregistering triggers...", buf, 0xCu);
  }

  OSStatus v7 = [(VCShortcutsObliterator *)self triggerRegistrar];
  [v7 unregisterAllTriggers];

  OSStatus v8 = getWFObliteratorLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_INFO, "%s Deleting keychain...", buf, 0xCu);
  }

  id v46 = 0;
  BOOL v9 = [(VCShortcutsObliterator *)self deleteKeychainItemsWithError:&v46];
  id v10 = v46;
  id v11 = 0;
  if (!v9)
  {
    BOOL v12 = getWFObliteratorLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[VCShortcutsObliterator obliterate:]";
      __int16 v49 = 2114;
      id v50 = v10;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_FAULT, "%s Deleting keychain failed with error: %{public}@", buf, 0x16u);
    }

    if (v10) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  BOOL v13 = getWFObliteratorLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_INFO, "%s Deleting app groups...", buf, 0xCu);
  }
  v38 = v10;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v14 = *MEMORY[0x1E4F5AC20];
  v53[0] = *MEMORY[0x1E4F5ABD0];
  v53[1] = v14;
  v53[2] = *MEMORY[0x1E4F5AC28];
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    id v18 = 0;
    uint64_t v19 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        uint64_t v21 = v18;
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(v15);
        }
        __int16 v22 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v41 = v18;
        BOOL v23 = -[VCShortcutsObliterator deleteAppGroupWithIdentifier:error:](self, "deleteAppGroupWithIdentifier:error:", v22, &v41, v38);
        id v18 = v41;

        if (!v23)
        {
          uint64_t v24 = getWFObliteratorLogObject();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315650;
            v48 = "-[VCShortcutsObliterator obliterate:]";
            __int16 v49 = 2112;
            id v50 = v22;
            __int16 v51 = 2114;
            id v52 = v18;
            _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_FAULT, "%s Deleting the %@ app group failed with error: %{public}@", buf, 0x20u);
          }

          if (v18)
          {
            id v25 = v18;

            id v11 = v25;
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v17);
  }
  else
  {
    id v18 = 0;
  }

  v26 = getWFObliteratorLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C7D7E000, v26, OS_LOG_TYPE_INFO, "%s Clearing user defaults...", buf, 0xCu);
  }

  v27 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v27 removePersistentDomainForName:*MEMORY[0x1E4FB4BF8]];

  v28 = getWFObliteratorLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C7D7E000, v28, OS_LOG_TYPE_INFO, "%s Clearing Siri Vocab...", buf, 0xCu);
  }

  v29 = [MEMORY[0x1E4F30838] sharedVocabulary];
  v30 = objc_opt_new();
  [v29 setVocabularyStrings:v30 ofType:50000];

  v31 = getWFObliteratorLogObject();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C7D7E000, v31, OS_LOG_TYPE_INFO, "%s Deleting data vault...", buf, 0xCu);
  }

  id v40 = 0;
  BOOL v32 = [(VCShortcutsObliterator *)self deleteDataVaultWithError:&v40];
  id v33 = v40;
  if (!v32)
  {
    v34 = getWFObliteratorLogObject();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[VCShortcutsObliterator obliterate:]";
      __int16 v49 = 2114;
      id v50 = v33;
      _os_log_impl(&dword_1C7D7E000, v34, OS_LOG_TYPE_FAULT, "%s Deleting data vault failed with error: %{public}@", buf, 0x16u);
    }

    if (v33)
    {
      id v35 = v33;

      id v11 = v35;
    }
  }
  v36 = getWFObliteratorLogObject();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C7D7E000, v36, OS_LOG_TYPE_INFO, "%s Resetting watch sync...", buf, 0xCu);
  }

  [(VCShortcutsObliterator *)self resetWatchSync];
  v37 = getWFObliteratorLogObject();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C7D7E000, v37, OS_LOG_TYPE_INFO, "%s Finished obliterating", buf, 0xCu);
  }

  if (v39) {
    id *v39 = v11;
  }
}

- (VCShortcutsObliterator)initWithTriggerRegistrar:(id)a3 syncDataHandlers:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"VCShortcutsObliterator.m", 40, @"Invalid parameter not satisfying: %@", @"syncDataHandlers" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)VCShortcutsObliterator;
  id v10 = [(VCShortcutsObliterator *)&v15 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_triggerRegistrar, a3);
    objc_storeStrong((id *)&v11->_syncDataHandlers, a4);
    BOOL v12 = v11;
  }

  return v11;
}

@end