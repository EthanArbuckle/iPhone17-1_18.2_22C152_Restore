@interface VCVoiceShortcutPeaceMigrator
+ (void)migrateFromCloudKitIntoDatabaseIfNecessary:(id)a3;
- (BOOL)migrateObject:(id)a3 error:(id *)a4;
- (BOOL)migrateWithError:(id *)a3;
- (BOOL)saveRecord:(id)a3 withIdentifier:(id)a4 error:(id *)a5;
- (VCVoiceShortcutPeaceMigrator)initWithDatabase:(id)a3;
- (WFDatabase)database;
@end

@implementation VCVoiceShortcutPeaceMigrator

- (void).cxx_destruct
{
}

- (WFDatabase)database
{
  return self->_database;
}

- (BOOL)saveRecord:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = a4;
  v10 = [(VCVoiceShortcutPeaceMigrator *)self database];
  v11 = [v8 name];

  if (v11)
  {
    id v68 = 0;
    v12 = [[WFWorkflow alloc] initWithRecord:v8 reference:0 storageProvider:0 error:&v68];
    v13 = v68;
    if (v12)
    {
      uint64_t v14 = [v9 length];
      v15 = getWFPeaceMigrationLogObject();
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
          __int16 v71 = 2114;
          v72 = v9;
          _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_INFO, "%s Migrating voice shortcut with identifier %{public}@", buf, 0x16u);
        }

        v17 = [(WFWorkflow *)v12 actions];
        v18 = [v17 firstObject];

        id v19 = v18;
        if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v20 = v19;
          }
          else {
            v20 = 0;
          }
        }
        else
        {
          v20 = 0;
        }
        id v23 = v20;

        v24 = [v23 intent];

        if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          uint64_t v31 = [v10 referenceForWorkflowID:v9];
          if (v31)
          {
            v24 = (void *)v31;
            p_super = getWFPeaceMigrationLogObject();
            BOOL v21 = 1;
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
              __int16 v71 = 2114;
              v72 = v9;
              _os_log_impl(&dword_1C7F0A000, p_super, OS_LOG_TYPE_INFO, "%s Voice shortcut (%{public}@) was migrated previously", buf, 0x16u);
            }
          }
          else
          {
            id v64 = v19;
            v32 = [[WFWorkflowCreationOptions alloc] initWithRecord:v8];
            [(WFWorkflowCreationOptions *)v32 setIdentifier:v9];
            [v8 addWatchWorkflowTypeIfEligible];
            id v66 = 0;
            p_super = &v32->super;
            v33 = [v10 createWorkflowWithOptions:v32 error:&v66];
            v34 = v66;
            BOOL v21 = v33 != 0;

            if (!v33)
            {
              v35 = getWFPeaceMigrationLogObject();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315650;
                v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
                __int16 v71 = 2114;
                v72 = v9;
                __int16 v73 = 2114;
                v74 = v34;
                _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_FAULT, "%s Failed to save new shortcut for voice shortcut (%{public}@): %{public}@", buf, 0x20u);
              }

              if (a5) {
                *a5 = v34;
              }
            }

            v24 = 0;
            id v19 = v64;
          }
          goto LABEL_52;
        }
        v25 = [v24 workflowForIntentInDatabase:v10];
        p_super = v25;
        if (!v25)
        {
          v30 = getWFPeaceMigrationLogObject();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v65 = [v24 workflow];
            v36 = [v65 spokenPhrase];
            [v24 workflow];
            v62 = loga = v30;
            v37 = [v62 vocabularyIdentifier];
            *(_DWORD *)buf = 136315906;
            v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
            __int16 v71 = 2114;
            v72 = v9;
            __int16 v73 = 2112;
            v74 = v36;
            __int16 v75 = 2114;
            uint64_t v76 = (uint64_t)v37;
            _os_log_impl(&dword_1C7F0A000, loga, OS_LOG_TYPE_ERROR, "%s Voice shortcut (%{public}@) references a nonexistent shortcut \"%@\", with identifier %{public}@", buf, 0x2Au);

            v30 = loga;
          }
          BOOL v21 = 0;
          goto LABEL_51;
        }
        id v63 = v19;
        v27 = [v25 name];
        [v8 name];
        v28 = v61 = p_super;
        int v29 = [v27 isEqualToString:v28];

        if (v29)
        {
          p_super = v61;
          v30 = getWFPeaceMigrationLogObject();
          BOOL v21 = 1;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
            __int16 v71 = 2114;
            v72 = v9;
            _os_log_impl(&dword_1C7F0A000, v30, OS_LOG_TYPE_INFO, "%s Voice shortcut (%{public}@) references a shortcut of the same name", buf, 0x16u);
          }
          id v19 = v63;
          goto LABEL_51;
        }
        objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"legacyName", 0);
        v67[1] = 0;
        v58 = p_super = v61;
        v38 = objc_msgSend(v10, "recordWithDescriptor:properties:error:", v61);
        os_log_t log = (os_log_t)0;
        v57 = v38;
        if (!v38)
        {
          v43 = getWFPeaceMigrationLogObject();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            v44 = [v61 name];
            v45 = [v61 identifier];
            *(_DWORD *)buf = 136315906;
            v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
            __int16 v71 = 2114;
            v72 = v9;
            __int16 v73 = 2112;
            v74 = v44;
            __int16 v75 = 2114;
            uint64_t v76 = (uint64_t)v45;
            _os_log_impl(&dword_1C7F0A000, v43, OS_LOG_TYPE_FAULT, "%s Voice shortcut (%{public}@) failed to load existing shortcut \"%@\", with identifier %{public}@", buf, 0x2Au);

            p_super = v61;
          }
          v42 = v43;
          BOOL v21 = 0;
          id v19 = v63;
          goto LABEL_49;
        }
        v39 = [v38 legacyName];
        uint64_t v40 = [v39 length];

        if (v40)
        {
          v41 = getWFPeaceMigrationLogObject();
          BOOL v21 = 1;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
            __int16 v71 = 2114;
            v72 = v9;
            _os_log_impl(&dword_1C7F0A000, v41, OS_LOG_TYPE_INFO, "%s Voice shortcut (%{public}@) references a shortcut that already has a legacy name", buf, 0x16u);
          }
          v42 = v41;
          p_super = v61;
          id v19 = v63;
          goto LABEL_49;
        }
        v47 = [v38 name];
        [v38 setLegacyName:v47];

        v48 = [v8 name];
        [v38 setName:v48];

        getWFPeaceMigrationLogObject();
        v50 = v49 = v38;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v55 = [v49 name];
          uint64_t v51 = [v49 legacyName];
          *(_DWORD *)buf = 136315906;
          v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
          __int16 v71 = 2114;
          v72 = v9;
          __int16 v73 = 2112;
          v74 = v55;
          __int16 v75 = 2112;
          uint64_t v76 = v51;
          v52 = (void *)v51;
          _os_log_impl(&dword_1C7F0A000, v50, OS_LOG_TYPE_INFO, "%s Voice shortcut (%{public}@) references a shortcut with a different name. Swapping the name to \"%@\" and moving \"%@\" to the legacyName", buf, 0x2Au);
        }
        v67[0] = 0;
        p_super = v61;
        char v53 = [v10 saveRecord:v49 withDescriptor:v61 error:v67];
        v56 = v67[0];
        if (v53)
        {
          BOOL v21 = 1;
          id v19 = v63;
        }
        else
        {
          v54 = getWFPeaceMigrationLogObject();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315650;
            v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
            __int16 v71 = 2114;
            v72 = v9;
            __int16 v73 = 2114;
            v74 = v56;
            _os_log_impl(&dword_1C7F0A000, v54, OS_LOG_TYPE_FAULT, "%s Failed to save existing shortcut for voice shortcut (%{public}@): %{public}@", buf, 0x20u);
          }

          id v19 = v63;
          if (a5)
          {
            v42 = v56;
            BOOL v21 = 0;
            *a5 = v42;
LABEL_49:
            v30 = log;
LABEL_50:

LABEL_51:
LABEL_52:

            goto LABEL_53;
          }
          BOOL v21 = 0;
        }
        v30 = log;
        v42 = v56;
        goto LABEL_50;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_FAULT, "%s Voice shortcut record does not have an associated identifier", buf, 0xCu);
      }
    }
    else
    {
      v22 = getWFPeaceMigrationLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
        __int16 v71 = 2114;
        v72 = v13;
        _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_FAULT, "%s Voice shortcut workflow data failed to open: %{public}@", buf, 0x16u);
      }

      if (a5)
      {
        BOOL v21 = 0;
        *a5 = v13;
LABEL_53:

        goto LABEL_54;
      }
    }
    BOOL v21 = 0;
    goto LABEL_53;
  }
  v13 = getWFPeaceMigrationLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v70 = "-[VCVoiceShortcutPeaceMigrator saveRecord:withIdentifier:error:]";
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s Workflow record is missing a name and cannot be migrated", buf, 0xCu);
  }
  BOOL v21 = 0;
LABEL_54:

  return v21;
}

- (BOOL)migrateObject:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 entity];
  id v8 = [v7 name];
  int v9 = [v8 isEqualToString:@"VCVoiceShortcutManagedObject"];

  if (v9)
  {
    v10 = [v6 valueForKey:@"identifier"];
    uint64_t v11 = objc_opt_class();
    id v12 = v10;
    if (v12 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = getWFGeneralLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "WFEnforceClass";
        __int16 v31 = 2114;
        id v32 = v12;
        __int16 v33 = 2114;
        id v34 = (id)objc_opt_class();
        __int16 v35 = 2114;
        uint64_t v36 = v11;
        id v16 = v34;
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      id v13 = 0;
    }
    else
    {
      id v13 = v12;
    }

    id v28 = 0;
    v17 = [[WFWorkflowRecord alloc] initWithPeaceCoreDataModel:v6 error:&v28];
    id v18 = v28;
    if (v17)
    {
      id v19 = [v13 UUIDString];
      id v27 = 0;
      BOOL v14 = [(VCVoiceShortcutPeaceMigrator *)self saveRecord:v17 withIdentifier:v19 error:&v27];
      id v20 = v27;

      BOOL v21 = getWFPeaceMigrationLogObject();
      v22 = v21;
      if (v14)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v23 = [v13 UUIDString];
          *(_DWORD *)buf = 136315394;
          v30 = "-[VCVoiceShortcutPeaceMigrator migrateObject:error:]";
          __int16 v31 = 2114;
          id v32 = v23;
          _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_INFO, "%s Successfully saved voice shortcut (%{public}@) to database", buf, 0x16u);
        }
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315650;
          v30 = "-[VCVoiceShortcutPeaceMigrator migrateObject:error:]";
          __int16 v31 = 2112;
          id v32 = v6;
          __int16 v33 = 2114;
          id v34 = v18;
          _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_FAULT, "%s Failed to convert %@ to a workflow record: %{public}@", buf, 0x20u);
        }

        if (a4) {
          *a4 = v20;
        }
      }
    }
    else
    {
      v24 = getWFPeaceMigrationLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = [v13 UUIDString];
        *(_DWORD *)buf = 136315650;
        v30 = "-[VCVoiceShortcutPeaceMigrator migrateObject:error:]";
        __int16 v31 = 2114;
        id v32 = v25;
        __int16 v33 = 2114;
        id v34 = v18;
        _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_FAULT, "%s Failed to convert voice shortcut (%{public}@) to a workflow record: %{public}@", buf, 0x20u);
      }
      BOOL v14 = 0;
      if (a4) {
        *a4 = v18;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)migrateWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v5 = (void *)os_transaction_create();
  id v6 = [(VCVoiceShortcutPeaceMigrator *)self database];
  v7 = [v6 context];

  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__19015;
  int v29 = __Block_byref_object_dispose__19016;
  id v30 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__VCVoiceShortcutPeaceMigrator_migrateWithError___block_invoke;
  aBlock[3] = &unk_1E654FAE0;
  id v8 = v7;
  id v21 = v8;
  v22 = self;
  id v23 = &v25;
  v24 = &v31;
  int v9 = _Block_copy(aBlock);
  v10 = [(VCVoiceShortcutPeaceMigrator *)self database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__VCVoiceShortcutPeaceMigrator_migrateWithError___block_invoke_202;
  v18[3] = &unk_1E654FB08;
  id v11 = v9;
  id v19 = v11;
  [v10 performTransactionWithReason:@"peace migration" block:v18 error:0];

  if (v26[5])
  {
    id v12 = getWFPeaceMigrationLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = v26[5];
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]";
      __int16 v37 = 2114;
      uint64_t v38 = v13;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Shortcut migration from CoreData failed with error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    BOOL v14 = getWFPeaceMigrationLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]";
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_INFO, "%s Shortcut migration from CoreData succeeded", buf, 0xCu);
    }

    if (v32[3])
    {
      v15 = getWFPeaceMigrationLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v36 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]";
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_INFO, "%s At least one voice shortcut was migrated, marking migration as complete", buf, 0xCu);
      }

      +[WFCloudKitSyncSession setVoiceShortcutMigrationDidRun:1];
    }
  }
  if (a3) {
    *a3 = (id) v26[5];
  }
  BOOL v16 = v26[5] == 0;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __49__VCVoiceShortcutPeaceMigrator_migrateWithError___block_invoke(void *a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = 0x1E4F1C000uLL;
  v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"VCVoiceShortcutManagedObject"];
  v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isMarkedAsDeleted == NO"];
  [v3 setPredicate:v4];

  v5 = (void *)a1[4];
  id v56 = 0;
  v43 = v3;
  id v6 = [v5 executeFetchRequest:v3 error:&v56];
  id v7 = v56;
  id v41 = v56;
  v42 = v6;
  if (v41)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
    id v8 = getWFPeaceMigrationLogObject();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
LABEL_5:

      goto LABEL_6;
    }
    uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v58 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]_block_invoke";
    __int16 v59 = 2114;
    uint64_t v60 = v9;
    v10 = "%s Failed to fetch voice shortcuts from CoreData: %{public}@";
    id v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_FAULT;
    uint32_t v13 = 22;
LABEL_4:
    _os_log_impl(&dword_1C7F0A000, v11, v12, v10, buf, v13);
    goto LABEL_5;
  }
  if (![v6 count])
  {
    id v8 = getWFPeaceMigrationLogObject();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v58 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]_block_invoke";
    v10 = "%s No voice shortcuts found in CoreData database";
    id v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 12;
    goto LABEL_4;
  }
  long long v55 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v53 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        id v20 = (void *)MEMORY[0x1C87CA430]();
        id v21 = (void *)a1[5];
        id v51 = 0;
        char v22 = [v21 migrateObject:v19 error:&v51];
        id v23 = v51;
        id v24 = v51;
        if (v22)
        {
          ++*(void *)(*(void *)(a1[7] + 8) + 24);
        }
        else
        {
          uint64_t v25 = *(void *)(a1[6] + 8);
          uint64_t v27 = *(void *)(v25 + 40);
          v26 = (id *)(v25 + 40);
          if (!v27) {
            objc_storeStrong(v26, v23);
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v16);
  }

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v45 = [&unk_1F23178F8 countByEnumeratingWithState:&v47 objects:v63 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v48 != v44) {
            objc_enumerationMutation(&unk_1F23178F8);
          }
          uint64_t v29 = *(void *)(*((void *)&v47 + 1) + 8 * j);
          unint64_t v30 = v2;
          uint64_t v31 = [*(id *)(v2 + 208) fetchRequestWithEntityName:v29];
          id v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v31];
          uint64_t v33 = (void *)a1[4];
          id v46 = 0;
          uint64_t v34 = [v33 executeRequest:v32 error:&v46];
          id v35 = v46;
          uint64_t v36 = [v34 result];
          if (v36)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              __int16 v37 = v36;
            }
            else {
              __int16 v37 = 0;
            }
          }
          else
          {
            __int16 v37 = 0;
          }
          id v38 = v37;

          char v39 = [v38 BOOLValue];
          if ((v39 & 1) == 0)
          {
            uint64_t v40 = getWFPeaceMigrationLogObject();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315650;
              v58 = "-[VCVoiceShortcutPeaceMigrator migrateWithError:]_block_invoke";
              __int16 v59 = 2114;
              uint64_t v60 = v29;
              __int16 v61 = 2114;
              id v62 = v35;
              _os_log_impl(&dword_1C7F0A000, v40, OS_LOG_TYPE_FAULT, "%s Failed to delete migrated %{public}@s: %{public}@", buf, 0x20u);
            }
          }
          unint64_t v2 = v30;
        }
        uint64_t v45 = [&unk_1F23178F8 countByEnumeratingWithState:&v47 objects:v63 count:16];
      }
      while (v45);
    }
  }
LABEL_6:
}

uint64_t __49__VCVoiceShortcutPeaceMigrator_migrateWithError___block_invoke_202(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (VCVoiceShortcutPeaceMigrator)initWithDatabase:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"VCVoiceShortcutPeaceMigrator.m", 74, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)VCVoiceShortcutPeaceMigrator;
  id v7 = [(VCVoiceShortcutPeaceMigrator *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_database, a3);
    uint64_t v9 = v8;
  }

  return v8;
}

+ (void)migrateFromCloudKitIntoDatabaseIfNecessary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[WFCloudKitSyncSession voiceShortcutMigrationDidRun])
  {
    v4 = getWFPeaceMigrationLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      char v22 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]";
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Previously migrated voice shortcuts, will not migrate them again", buf, 0xCu);
    }
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
    v4 = [v5 initWithBundleIdentifier:*MEMORY[0x1E4FB4BE8] allowPlaceholder:0 error:0];
    id v6 = [v4 applicationState];
    char v7 = [v6 isInstalled];

    if (v7)
    {
      id v8 = (void *)os_transaction_create();
      uint64_t v9 = [[VCVoiceShortcutPeaceMigrator alloc] initWithDatabase:v3];
      v10 = [VCCKVoiceShortcutFetcher alloc];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __75__VCVoiceShortcutPeaceMigrator_migrateFromCloudKitIntoDatabaseIfNecessary___block_invoke;
      v19[3] = &unk_1E6550540;
      id v20 = v9;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __75__VCVoiceShortcutPeaceMigrator_migrateFromCloudKitIntoDatabaseIfNecessary___block_invoke_172;
      uint64_t v17 = &unk_1E654FAB8;
      id v18 = v8;
      id v11 = v8;
      objc_super v12 = v9;
      uint32_t v13 = [(VCCKVoiceShortcutFetcher *)v10 initWithRecordHandler:v19 completionHandler:&v14];
      [(VCCKVoiceShortcutFetcher *)v13 start];
    }
    else
    {
      objc_super v12 = getWFPeaceMigrationLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        char v22 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]";
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s Shortcuts app is not installed, will not attempt to migrate voice shortcuts from Peace", buf, 0xCu);
      }
    }
  }
}

void __75__VCVoiceShortcutPeaceMigrator_migrateFromCloudKitIntoDatabaseIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1C87CA430]();
  id v16 = 0;
  id v5 = [[WFWorkflowRecord alloc] initWithPeaceCloudKitRecord:v3 error:&v16];
  id v6 = v16;
  if (v5)
  {
    char v7 = *(void **)(a1 + 32);
    id v8 = [v3 recordID];
    uint64_t v9 = [v8 recordName];
    id v15 = 0;
    char v10 = [v7 saveRecord:v5 withIdentifier:v9 error:&v15];
    id v11 = v15;

    if ((v10 & 1) == 0)
    {
      objc_super v12 = getWFPeaceMigrationLogObject();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      uint32_t v13 = [v3 recordID];
      uint64_t v14 = [v13 recordName];
      *(_DWORD *)buf = 136315650;
      id v18 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = v14;
      __int16 v21 = 2114;
      char v22 = v11;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to save CloudKit record (%{public}@): %{public}@", buf, 0x20u);

LABEL_7:
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = getWFPeaceMigrationLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_super v12 = [v3 recordID];
      uint32_t v13 = [v12 recordName];
      *(_DWORD *)buf = 136315650;
      id v18 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = v13;
      __int16 v21 = 2114;
      char v22 = v6;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to convert CloudKit record (%{public}@) into a workflow record: %{public}@", buf, 0x20u);
      goto LABEL_7;
    }
  }
LABEL_9:
}

void __75__VCVoiceShortcutPeaceMigrator_migrateFromCloudKitIntoDatabaseIfNecessary___block_invoke_172(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFPeaceMigrationLogObject();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_INFO, "%s Successfully migrated voice shortcuts from CloudKit", (uint8_t *)&v7, 0xCu);
    }

    +[WFCloudKitSyncSession setVoiceShortcutMigrationDidRun:1];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "+[VCVoiceShortcutPeaceMigrator migrateFromCloudKitIntoDatabaseIfNecessary:]_block_invoke";
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to migrate all CloudKit records: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

@end