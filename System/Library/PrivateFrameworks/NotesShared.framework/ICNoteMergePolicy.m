@interface ICNoteMergePolicy
- (BOOL)resolveConflictingAttachment:(id)a3 with:(id)a4;
- (BOOL)resolveConflictingAttachment:(id)a3 withInlineAttachment:(id)a4;
- (BOOL)resolveConflictingAttachmentPreviewImage:(id)a3 with:(id)a4;
- (BOOL)resolveConflictingDeviceMigrationState:(id)a3 with:(id)a4;
- (BOOL)resolveConflictingFolder:(id)a3 with:(id)a4;
- (BOOL)resolveConflictingInlineAttachment:(id)a3 with:(id)a4;
- (BOOL)resolveConflictingLegacyTombstone:(id)a3 with:(id)a4;
- (BOOL)resolveConflictingNote:(id)a3 with:(id)a4;
- (BOOL)resolveConstraintConflict:(id)a3;
- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4;
- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4;
- (ICNoteMergePolicy)init;
- (void)resolveConflict:(id)a3 forWallClockMergeablesInObject:(id)a4;
@end

@implementation ICNoteMergePolicy

- (ICNoteMergePolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteMergePolicy;
  return [(NSMergePolicy *)&v3 initWithMergeType:2];
}

- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v76 = self;
  v83.receiver = self;
  v83.super_class = (Class)ICNoteMergePolicy;
  BOOL v7 = [(NSMergePolicy *)&v83 resolveOptimisticLockingVersionConflicts:v6 error:a4];
  [MEMORY[0x1E4F837E8] postBasicEvent:15];
  if (v7 && !*a4)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    os_log_t obj = (os_log_t)v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
    if (!v9) {
      goto LABEL_5;
    }
    uint64_t v10 = v9;
    BOOL v66 = v7;
    id v67 = v6;
    uint64_t v11 = *(void *)v80;
    uint64_t v77 = *(void *)v80;
LABEL_8:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v80 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v79 + 1) + 8 * v12);
      if (![v13 newVersionNumber])
      {
        v20 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          [(ICNoteMergePolicy *)v88 resolveOptimisticLockingVersionConflicts:&v89 error:v20];
        }

        v16 = [v13 sourceObject];
        v19 = [v16 managedObjectContext];
        v21 = [v13 sourceObject];
        [v19 deleteObject:v21];

        goto LABEL_66;
      }
      v14 = [v13 sourceObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      v16 = [v13 sourceObject];
      if (isKindOfClass)
      {
        objc_opt_class();
        v17 = [v13 persistedSnapshot];
        v18 = [v17 objectForKeyedSubscript:@"modificationDate"];
        if (v18)
        {
          v19 = ICDynamicCast();
        }
        else
        {
          v28 = [v13 cachedSnapshot];
          v29 = [v28 objectForKeyedSubscript:@"modificationDate"];
          v19 = ICDynamicCast();

          uint64_t v11 = v77;
        }
        uint64_t v30 = v10;

        if (v19)
        {
          v31 = [v16 modificationDate];
          uint64_t v32 = [v31 compare:v19];

          if (v32 == -1) {
            [v16 setModificationDate:v19];
          }
        }
        v33 = [v16 cryptoTag];
        if (v33)
        {
          v34 = [v16 noteData];
          v35 = [v34 cryptoTag];
          if (v35)
          {
            v36 = [v16 cryptoInitializationVector];
            if (v36)
            {
              v37 = [v16 noteData];
              v38 = [v37 cryptoInitializationVector];
              v75 = v37;
              if (v38)
              {
                id v74 = v38;
                v39 = [v16 cryptoTag];
                v72 = [v16 noteData];
                [v72 cryptoTag];
                v71 = v73 = v39;
                if (objc_msgSend(v39, "isEqual:"))
                {
                  v69 = [v16 cryptoInitializationVector];
                  v70 = [v16 noteData];
                  v68 = [v70 cryptoInitializationVector];
                  int v40 = [v69 isEqual:v68] ^ 1;
                }
                else
                {
                  int v40 = 1;
                }

                v38 = v74;
              }
              else
              {
                int v40 = 0;
              }
            }
            else
            {
              int v40 = 0;
            }
          }
          else
          {
            int v40 = 0;
          }

          uint64_t v11 = v77;
        }
        else
        {
          int v40 = 0;
        }

        uint64_t v10 = v30;
        if ([v16 isPasswordProtected])
        {
          int v53 = +[ICCryptoStrategyFactory cipherVersionForObject:v16]? 0: v40;
          if (v53 == 1)
          {
            v54 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              v60 = [v16 noteData];
              v61 = objc_msgSend(v60, "ic_loggingIdentifier");
              v62 = [v16 shortLoggingDescription];
              *(_DWORD *)buf = 138412546;
              v85 = v61;
              __int16 v86 = 2112;
              v87 = v62;
              _os_log_error_impl(&dword_1C3A61000, v54, OS_LOG_TYPE_ERROR, "Re-saving note data (%@) because crypto goo has diverged for note: %@", buf, 0x16u);

              uint64_t v11 = v77;
            }

            v55 = [v16 noteData];
            [v55 setNeedsToBeSaved:1];

            v56 = [v16 noteData];
            [v56 saveNoteDataIfNeeded];
          }
        }
        goto LABEL_65;
      }
      objc_opt_class();
      char v22 = objc_opt_isKindOfClass();

      v16 = [v13 sourceObject];
      if (v22) {
        break;
      }
      objc_opt_class();
      char v25 = objc_opt_isKindOfClass();

      if (v25)
      {
        v16 = [v13 sourceObject];
        objc_opt_class();
        v26 = [v13 persistedSnapshot];
        v27 = [v26 objectForKeyedSubscript:@"mergeableData"];
        if (v27)
        {
          v19 = ICDynamicCast();
        }
        else
        {
          v48 = [v13 cachedSnapshot];
          v49 = [v48 objectForKeyedSubscript:@"mergeableData"];
          v19 = ICDynamicCast();

          uint64_t v11 = v77;
        }

        if (v19)
        {
          v50 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            v63 = objc_opt_class();
            id v64 = v63;
            v65 = [v16 identifier];
            *(_DWORD *)buf = 138412546;
            v85 = v63;
            __int16 v86 = 2112;
            v87 = v65;
            _os_log_debug_impl(&dword_1C3A61000, v50, OS_LOG_TYPE_DEBUG, "Resolving mergeableData conflict for %@ (%@)", buf, 0x16u);

            uint64_t v11 = v77;
          }

          v51 = [v16 attachmentModel];
          [v51 mergeWithMergeableData:v19];

          v52 = [v16 attachmentModel];
          [v52 setMergeableDataDirty:1];

          [v16 saveMergeableDataIfNeeded];
        }
LABEL_65:
        [(ICNoteMergePolicy *)v76 resolveConflict:v13 forWallClockMergeablesInObject:v16];
LABEL_66:
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
        if (!v10)
        {
          id v6 = v67;
          LOBYTE(v7) = v66;
          goto LABEL_5;
        }
        goto LABEL_8;
      }
    }
    objc_opt_class();
    v23 = [v13 persistedSnapshot];
    v24 = [v23 objectForKeyedSubscript:@"data"];
    if (v24)
    {
      v19 = ICDynamicCast();
    }
    else
    {
      v41 = [v13 cachedSnapshot];
      v42 = [v41 objectForKeyedSubscript:@"data"];
      v19 = ICDynamicCast();

      uint64_t v11 = v77;
    }

    if (v19)
    {
      v43 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v57 = objc_msgSend(v16, "ic_loggingIdentifier");
        v58 = [v16 note];
        v59 = [v58 shortLoggingDescription];
        *(_DWORD *)buf = 138412546;
        v85 = v57;
        __int16 v86 = 2112;
        v87 = v59;
        _os_log_debug_impl(&dword_1C3A61000, v43, OS_LOG_TYPE_DEBUG, "Resolving note data (%@) conflict for note: %@", buf, 0x16u);

        uint64_t v11 = v77;
      }

      v44 = [v16 note];
      int v45 = [v44 isPasswordProtected];

      v46 = [v16 note];
      v47 = v46;
      if (v45) {
        [v46 mergeEncryptedData:v19 mergeConflict:v13];
      }
      else {
        [v46 mergeWithNoteData:v19];
      }

      [v16 setNeedsToBeSaved:1];
      [v16 saveNoteDataIfNeeded];
    }
    goto LABEL_66;
  }
  [MEMORY[0x1E4F837E8] postBasicEvent:16];
  os_log_t obj = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
    -[ICNoteMergePolicy resolveOptimisticLockingVersionConflicts:error:]((uint64_t)v6, (uint64_t *)a4, obj);
  }
LABEL_5:

  return v7;
}

- (void)resolveConflict:(id)a3 forWallClockMergeablesInObject:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(id)objc_opt_class() mergeableWallClockValueKeyPaths];
  uint64_t v29 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v31;
    *(void *)&long long v7 = 138412546;
    long long v26 = v7;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        objc_opt_class();
        uint64_t v10 = [v5 persistedSnapshot];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];
        if (v11)
        {
          uint64_t v12 = ICDynamicCast();
        }
        else
        {
          v13 = [v5 cachedSnapshot];
          v14 = [v13 objectForKeyedSubscript:v9];
          uint64_t v12 = ICDynamicCast();
        }
        if ([v12 length])
        {
          v15 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            char v22 = objc_opt_class();
            id v23 = v22;
            v24 = objc_msgSend(v6, "ic_loggingIdentifier");
            *(_DWORD *)buf = 138412802;
            v35 = v22;
            __int16 v36 = 2112;
            v37 = v9;
            __int16 v38 = 2112;
            v39 = v24;
            _os_log_debug_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEBUG, "Resolving wall clock mergeable conflict for %@ (key=%@, identifier=%@)", buf, 0x20u);
          }
          objc_opt_class();
          v16 = [v6 valueForKey:v9];
          v17 = ICDynamicCast();

          if ([v17 length])
          {
            v18 = [[ICTTMergeableWallClockValue alloc] initWithData:v17];
            v19 = [[ICTTMergeableWallClockValue alloc] initWithData:v12];
            if (![(ICTTMergeableWallClockValue *)v18 merge:v19])
            {
              v20 = os_log_create("com.apple.notes", "CoreData");
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                char v25 = objc_msgSend(v6, "ic_loggingIdentifier");
                *(_DWORD *)buf = v26;
                v35 = v9;
                __int16 v36 = 2112;
                v37 = v25;
                _os_log_error_impl(&dword_1C3A61000, v20, OS_LOG_TYPE_ERROR, "Merge failed when resolving conflict for key (%@): %@", buf, 0x16u);
              }
            }
            v21 = [(ICTTMergeableWallClockValue *)v18 serialize];
            [v6 setValue:v21 forKeyPath:v9];
          }
          else
          {
            [v6 setValue:v12 forKeyPath:v9];
          }
        }
        ++v8;
      }
      while (v29 != v8);
      uint64_t v29 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v29);
  }
}

- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [MEMORY[0x1E4F837E8] postBasicEvent:17];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
        uint64_t v12 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          long long v26 = [v11 conflictingObjects];
          v13 = [v26 firstObject];
          v14 = (objc_class *)objc_opt_class();
          v15 = NSStringFromClass(v14);
          [v11 constraintValues];
          uint64_t v16 = v7;
          uint64_t v17 = v8;
          uint64_t v18 = v9;
          v20 = v19 = self;
          *(_DWORD *)buf = 138412546;
          long long v33 = v15;
          __int16 v34 = 2112;
          v35 = v20;
          _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_INFO, "Found constraint conflict for %@: %@", buf, 0x16u);

          self = v19;
          uint64_t v9 = v18;
          uint64_t v8 = v17;
          uint64_t v7 = v16;
        }
        if (![(ICNoteMergePolicy *)self resolveConstraintConflict:v11])
        {
          [MEMORY[0x1E4F837E8] postBasicEvent:3];
          v21 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            long long v33 = v11;
            _os_log_error_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_ERROR, "Constraint violation when merging the MOC: %@", buf, 0xCu);
          }

          if (v8)
          {
            uint64_t v8 = 1;
          }
          else
          {
            uint64_t v8 = 1;
            [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICNoteMergePolicy resolveConstraintConflicts:error:]" simulateCrash:1 showAlert:1 format:@"Constraint violation when merging the MOC"];
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v7);
  }

  v27.receiver = self;
  v27.super_class = (Class)ICNoteMergePolicy;
  BOOL v22 = [(NSMergePolicy *)&v27 resolveConstraintConflicts:obj error:a4];

  return v22;
}

- (BOOL)resolveConstraintConflict:(id)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 constraint];
  uint64_t v6 = NSStringFromSelector(sel_identifier);
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v8 = [v4 conflictingObjects];
    uint64_t v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = [v4 databaseObject];

    if (v10)
    {
      uint64_t v11 = [v4 databaseObject];
      [v9 insertObject:v11 atIndex:0];
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F29008];
    v13 = NSStringFromSelector(sel_className);
    v14 = [v12 sortDescriptorWithKey:v13 ascending:1];
    v44[0] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
    [v9 sortUsingDescriptors:v15];

    if ([v9 count] == 2)
    {
      uint64_t v16 = [v9 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = [v9 lastObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v19 = [v9 firstObject];
          v20 = [v9 lastObject];
          BOOL v21 = [(ICNoteMergePolicy *)self resolveConflictingAttachment:v19 withInlineAttachment:v20];
          goto LABEL_44;
        }
      }
      else
      {
      }
    }
    if ([v9 count] == 2)
    {
      id v23 = [v9 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [v9 lastObject];
        objc_opt_class();
        char v25 = objc_opt_isKindOfClass();

        if (v25)
        {
          v19 = [v9 firstObject];
          v20 = [v9 lastObject];
          BOOL v21 = [(ICNoteMergePolicy *)self resolveConflictingNote:v19 with:v20];
          goto LABEL_44;
        }
      }
      else
      {
      }
    }
    if ([v9 count] == 2)
    {
      long long v26 = [v9 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v27 = [v9 lastObject];
        objc_opt_class();
        char v28 = objc_opt_isKindOfClass();

        if (v28)
        {
          v19 = [v9 firstObject];
          v20 = [v9 lastObject];
          BOOL v21 = [(ICNoteMergePolicy *)self resolveConflictingFolder:v19 with:v20];
          goto LABEL_44;
        }
      }
      else
      {
      }
    }
    if ([v9 count] == 2)
    {
      long long v29 = [v9 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v30 = [v9 lastObject];
        objc_opt_class();
        char v31 = objc_opt_isKindOfClass();

        if (v31)
        {
          v19 = [v9 firstObject];
          v20 = [v9 lastObject];
          BOOL v21 = [(ICNoteMergePolicy *)self resolveConflictingAttachment:v19 with:v20];
          goto LABEL_44;
        }
      }
      else
      {
      }
    }
    if ([v9 count] == 2)
    {
      long long v32 = [v9 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v33 = [v9 lastObject];
        objc_opt_class();
        char v34 = objc_opt_isKindOfClass();

        if (v34)
        {
          v19 = [v9 firstObject];
          v20 = [v9 lastObject];
          BOOL v21 = [(ICNoteMergePolicy *)self resolveConflictingAttachmentPreviewImage:v19 with:v20];
          goto LABEL_44;
        }
      }
      else
      {
      }
    }
    if ([v9 count] == 2)
    {
      v35 = [v9 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v36 = [v9 lastObject];
        objc_opt_class();
        char v37 = objc_opt_isKindOfClass();

        if (v37)
        {
          v19 = [v9 firstObject];
          v20 = [v9 lastObject];
          BOOL v21 = [(ICNoteMergePolicy *)self resolveConflictingInlineAttachment:v19 with:v20];
          goto LABEL_44;
        }
      }
      else
      {
      }
    }
    if ([v9 count] == 2)
    {
      __int16 v38 = [v9 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = [v9 lastObject];
        objc_opt_class();
        char v40 = objc_opt_isKindOfClass();

        if (v40)
        {
          v19 = [v9 firstObject];
          v20 = [v9 lastObject];
          BOOL v21 = [(ICNoteMergePolicy *)self resolveConflictingDeviceMigrationState:v19 with:v20];
          goto LABEL_44;
        }
      }
      else
      {
      }
    }
    if ([v9 count] != 2) {
      goto LABEL_46;
    }
    v19 = [v9 firstObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v22 = 0;
      goto LABEL_45;
    }
    uint64_t v41 = [v9 lastObject];
    objc_opt_class();
    char v42 = objc_opt_isKindOfClass();

    if ((v42 & 1) == 0)
    {
LABEL_46:
      BOOL v22 = 0;
      goto LABEL_47;
    }
    v19 = [v9 firstObject];
    v20 = [v9 lastObject];
    BOOL v21 = [(ICNoteMergePolicy *)self resolveConflictingLegacyTombstone:v19 with:v20];
LABEL_44:
    BOOL v22 = v21;

LABEL_45:
LABEL_47:

    goto LABEL_48;
  }
  BOOL v22 = 0;
LABEL_48:

  return v22;
}

- (BOOL)resolveConflictingAttachment:(id)a3 withInlineAttachment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (!v5 || !v6) {
    goto LABEL_8;
  }
  uint64_t v8 = [v5 title];
  if (v8
    || ([v5 userTitle], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v5 urlString], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v5 media], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_8:
    uint64_t v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICNoteMergePolicy resolveConflictingAttachment:withInlineAttachment:]();
    }

    BOOL v10 = 0;
    goto LABEL_11;
  }
  uint64_t v12 = [v5 identifier];
  v13 = [v7 identifier];
  int v14 = [v12 isEqualToString:v13];

  if (!v14) {
    goto LABEL_8;
  }
  v15 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ICNoteMergePolicy resolveConflictingAttachment:withInlineAttachment:]();
  }

  uint64_t v16 = [v5 managedObjectContext];
  [v16 deleteObject:v5];

  BOOL v10 = 1;
  [v7 setNeedsToBeFetchedFromCloud:1];
LABEL_11:

  return v10;
}

- (BOOL)resolveConflictingFolder:(id)a3 with:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 needsInitialFetchFromCloud]
    && ([v6 needsInitialFetchFromCloud] & 1) == 0)
  {
    id v7 = v6;
    id v8 = v5;
    goto LABEL_22;
  }
  if (([v5 needsInitialFetchFromCloud] & 1) == 0
    && [v6 needsInitialFetchFromCloud]
    || [v5 needsInitialFetchFromCloud]
    && [v6 needsInitialFetchFromCloud])
  {
    id v7 = v5;
    id v8 = v6;
LABEL_22:
    id v13 = v8;
    goto LABEL_23;
  }
  if ([v5 needsInitialFetchFromCloud]) {
    goto LABEL_20;
  }
  if ([v6 needsInitialFetchFromCloud]) {
    goto LABEL_20;
  }
  int v9 = [v5 folderType];
  if (v9 != [v6 folderType]
    || ([v5 account],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        [v6 account],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v10 isEqual:v11],
        v11,
        v10,
        !v12))
  {
LABEL_20:
    id v7 = 0;
    id v13 = 0;
    goto LABEL_46;
  }
  id v7 = v5;
  id v13 = v6;
  int v14 = [v13 dateForLastTitleModification];
  v15 = [v7 dateForLastTitleModification];
  int v16 = objc_msgSend(v14, "ic_isLaterThanDate:", v15);

  if (v16)
  {
    uint64_t v17 = [v13 title];
    [v7 setTitle:v17];

    uint64_t v18 = [v13 dateForLastTitleModification];
    [v7 setDateForLastTitleModification:v18];
  }
  v19 = [v13 parentModificationDate];
  v20 = [v7 parentModificationDate];
  int v21 = objc_msgSend(v19, "ic_isLaterThanDate:", v20);

  if (v21)
  {
    BOOL v22 = [v13 parent];
    [v7 setParent:v22];
  }
  id v23 = [v13 customNoteSortTypeModificationDate];
  v24 = [v7 customNoteSortTypeModificationDate];
  int v25 = objc_msgSend(v23, "ic_isLaterThanDate:", v24);

  if (v25)
  {
    long long v26 = [v13 customNoteSortTypeValue];
    [v7 setCustomNoteSortTypeValue:v26];

    objc_super v27 = [v13 customNoteSortTypeModificationDate];
    [v7 setCustomNoteSortTypeModificationDate:v27];
  }
  char v28 = [v13 mergeableData];

  if (v28)
  {
    long long v29 = [v13 mergeableData];
    [v7 mergeWithMergeableData:v29];
  }
LABEL_23:
  if (v13 && v7)
  {
    long long v30 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v56 = [v5 identifier];
      v57 = [v7 objectID];
      v58 = [v13 objectID];
      *(_DWORD *)buf = 138412802;
      v70 = v56;
      __int16 v71 = 2112;
      v72 = v57;
      __int16 v73 = 2112;
      id v74 = v58;
      _os_log_debug_impl(&dword_1C3A61000, v30, OS_LOG_TYPE_DEBUG, "Resolving folder conflict (%@) by keeping (%@) and deleting (%@)", buf, 0x20u);
    }
    char v31 = [v13 notes];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v33 = [v13 notes];
      char v34 = (void *)[v33 copy];

      uint64_t v35 = [v34 countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v64 != v37) {
              objc_enumerationMutation(v34);
            }
            [*(id *)(*((void *)&v63 + 1) + 8 * i) setFolder:v7];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v63 objects:v68 count:16];
        }
        while (v36);
      }

      v39 = [v13 notes];
      char v40 = (void *)[v39 copy];
      [v7 addNotes:v40];

      uint64_t v41 = [MEMORY[0x1E4F1CAD0] set];
      [v13 setNotes:v41];
    }
    char v42 = [v13 children];
    uint64_t v43 = [v42 count];

    if (v43)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v44 = objc_msgSend(v13, "children", 0);
      int v45 = (void *)[v44 copy];

      uint64_t v46 = [v45 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v60;
        do
        {
          for (uint64_t j = 0; j != v47; ++j)
          {
            if (*(void *)v60 != v48) {
              objc_enumerationMutation(v45);
            }
            [*(id *)(*((void *)&v59 + 1) + 8 * j) setParent:v7];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v59 objects:v67 count:16];
        }
        while (v47);
      }

      v50 = [v13 children];
      v51 = (void *)[v50 copy];
      [v7 addChildren:v51];

      v52 = [MEMORY[0x1E4F1CAD0] set];
      [v13 setChildren:v52];
    }
    +[ICFolder purgeFolder:v13];
    BOOL v53 = 1;
    goto LABEL_49;
  }
LABEL_46:
  v54 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
    -[ICNoteMergePolicy resolveConflictingFolder:with:]();
  }

  BOOL v53 = 0;
LABEL_49:

  return v53;
}

- (BOOL)resolveConflictingInlineAttachment:(id)a3 with:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 needsInitialFetchFromCloud]
    || (int v7 = [v6 needsInitialFetchFromCloud], v8 = v6, v9 = v5, v7))
  {
    if (([v5 needsInitialFetchFromCloud] & 1) != 0
      || (v10 = [v6 needsInitialFetchFromCloud], v8 = v5, int v9 = v6, (v10 & 1) == 0))
    {
      if (![v5 needsInitialFetchFromCloud]
        || (v11 = [v6 needsInitialFetchFromCloud], v8 = v5, int v9 = v6, (v11 & 1) == 0))
      {
        if (([v5 needsInitialFetchFromCloud] & 1) != 0
          || ([v6 needsInitialFetchFromCloud] & 1) != 0
          || ([v5 tokenContentIdentifier],
              int v21 = objc_claimAutoreleasedReturnValue(),
              [v6 tokenContentIdentifier],
              BOOL v22 = objc_claimAutoreleasedReturnValue(),
              int v23 = [v21 isEqualToString:v22],
              v22,
              v21,
              !v23))
        {
          id v12 = 0;
          id v13 = 0;
          goto LABEL_31;
        }
        int v24 = [v5 markedForDeletion];
        int v25 = [v6 markedForDeletion];
        id v8 = v5;
        int v9 = v6;
        if (v24 != v25)
        {
          int v26 = [v5 markedForDeletion];
          if (v26) {
            id v8 = v5;
          }
          else {
            id v8 = v6;
          }
          if (v26) {
            int v9 = v6;
          }
          else {
            int v9 = v5;
          }
        }
      }
    }
  }
  id v12 = v8;
  id v13 = v9;
  if (v13 && v12)
  {
    int v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      char v28 = [v5 identifier];
      long long v29 = [v12 objectID];
      long long v30 = [v13 objectID];
      int v31 = 138412802;
      uint64_t v32 = v28;
      __int16 v33 = 2112;
      char v34 = v29;
      __int16 v35 = 2112;
      uint64_t v36 = v30;
      _os_log_debug_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_DEBUG, "Resolving inline attachment conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v31, 0x20u);
    }
    v15 = [v12 note];
    if (!v15)
    {
      int v16 = [v13 note];

      if (!v16) {
        goto LABEL_15;
      }
      v15 = [v13 note];
      [v12 setNote:v15];
    }

LABEL_15:
    uint64_t v17 = [v12 parentAttachment];
    if (!v17)
    {
      uint64_t v18 = [v13 parentAttachment];

      if (!v18)
      {
LABEL_19:
        os_log_t v19 = [v13 managedObjectContext];
        [v19 deleteObject:v13];
        BOOL v20 = 1;
        goto LABEL_34;
      }
      uint64_t v17 = [v13 parentAttachment];
      [v12 setParentAttachment:v17];
    }

    goto LABEL_19;
  }
LABEL_31:
  os_log_t v19 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[ICNoteMergePolicy resolveConflictingInlineAttachment:with:]();
  }

  BOOL v20 = 0;
LABEL_34:

  return v20;
}

- (BOOL)resolveConflictingNote:(id)a3 with:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 needsInitialFetchFromCloud]
    || (int v7 = [v6 needsInitialFetchFromCloud], v8 = v6, v9 = v5, v7))
  {
    if (([v5 needsInitialFetchFromCloud] & 1) != 0
      || (v10 = [v6 needsInitialFetchFromCloud], v8 = v5, int v9 = v6, (v10 & 1) == 0))
    {
      if (![v5 needsInitialFetchFromCloud]
        || (v11 = [v6 markedForDeletion], v8 = v6, int v9 = v5, (v11 & 1) == 0))
      {
        if (![v5 markedForDeletion]
          || (v12 = [v6 needsInitialFetchFromCloud], v8 = v5, int v9 = v6, (v12 & 1) == 0))
        {
          id v13 = [v5 folder];
          if (v13)
          {
          }
          else
          {
            int v21 = [v6 folder];

            id v8 = v6;
            int v9 = v5;
            if (v21) {
              goto LABEL_21;
            }
          }
          uint64_t v14 = [v5 folder];
          if (!v14
            || (v15 = (void *)v14,
                [v6 folder],
                int v16 = objc_claimAutoreleasedReturnValue(),
                v16,
                v15,
                id v8 = v5,
                int v9 = v6,
                v16))
          {
            uint64_t v17 = [v5 folder];
            uint64_t v18 = [v6 folder];
            int v19 = [v17 isEqual:v18];

            if (!v19)
            {
              id v22 = 0;
              id v23 = 0;
              goto LABEL_47;
            }
            BOOL v20 = [v5 document];

            if (v20) {
              id v8 = v5;
            }
            else {
              id v8 = v6;
            }
            if (v20) {
              int v9 = v6;
            }
            else {
              int v9 = v5;
            }
          }
        }
      }
    }
  }
LABEL_21:
  id v22 = v8;
  id v23 = v9;
  if (v23 && v22)
  {
    int v24 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v51 = [v5 identifier];
      v52 = [v22 objectID];
      BOOL v53 = [v23 objectID];
      *(_DWORD *)buf = 138412802;
      __int16 v71 = v51;
      __int16 v72 = 2112;
      __int16 v73 = v52;
      __int16 v74 = 2112;
      uint64_t v75 = v53;
      _os_log_debug_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_DEBUG, "Resolving note conflict (%@) by keeping (%@) and deleting (%@)", buf, 0x20u);
    }
    int v25 = [v23 attachments];
    uint64_t v26 = [v25 count];

    if (v26)
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      objc_super v27 = [v23 attachments];
      char v28 = (void *)[v27 copy];

      uint64_t v29 = [v28 countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v65 != v31) {
              objc_enumerationMutation(v28);
            }
            [*(id *)(*((void *)&v64 + 1) + 8 * i) setNote:v22];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v64 objects:v69 count:16];
        }
        while (v30);
      }

      __int16 v33 = [v23 attachments];
      char v34 = (void *)[v33 copy];
      [v22 addAttachments:v34];

      __int16 v35 = [MEMORY[0x1E4F1CAD0] set];
      [v23 setAttachments:v35];
    }
    uint64_t v36 = [v23 inlineAttachments];
    uint64_t v37 = [v36 count];

    if (v37)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      __int16 v38 = [v23 inlineAttachments];
      v39 = (void *)[v38 copy];

      uint64_t v40 = [v39 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v41; ++j)
          {
            if (*(void *)v61 != v42) {
              objc_enumerationMutation(v39);
            }
            [*(id *)(*((void *)&v60 + 1) + 8 * j) setNote:v22];
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v60 objects:v68 count:16];
        }
        while (v41);
      }

      v44 = [v23 inlineAttachments];
      int v45 = (void *)[v44 copy];
      [v22 addInlineAttachments:v45];

      uint64_t v46 = [MEMORY[0x1E4F1CAD0] set];
      [v23 setInlineAttachments:v46];
    }
    uint64_t v47 = [v23 document];

    if (v47)
    {
      uint64_t v54 = MEMORY[0x1E4F143A8];
      uint64_t v55 = 3221225472;
      v56 = __49__ICNoteMergePolicy_resolveConflictingNote_with___block_invoke;
      v57 = &unk_1E64A48D0;
      id v58 = v22;
      id v59 = v23;
      [v58 performMerge:&v54];
    }
    objc_msgSend(v23, "managedObjectContext", v54, v55, v56, v57);
    os_log_t v48 = (os_log_t)objc_claimAutoreleasedReturnValue();
    [v48 deleteObject:v23];
    BOOL v49 = 1;
    goto LABEL_50;
  }
LABEL_47:
  os_log_t v48 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
    -[ICNoteMergePolicy resolveConflictingNote:with:]();
  }

  BOOL v49 = 0;
LABEL_50:

  return v49;
}

uint64_t __49__ICNoteMergePolicy_resolveConflictingNote_with___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) document];
  objc_super v3 = [*(id *)(a1 + 40) document];
  uint64_t v4 = [v2 mergeWithStringVersionedDocument:v3];

  return v4;
}

- (BOOL)resolveConflictingAttachment:(id)a3 with:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (([v5 needsInitialFetchFromCloud] & 1) != 0
    || (char v7 = [v6 needsInitialFetchFromCloud], v8 = v5, v9 = v6, (v7 & 1) == 0))
  {
    if (![v5 needsInitialFetchFromCloud]
      || (v10 = [v6 needsInitialFetchFromCloud], v8 = v6, int v9 = v5, v10))
    {
      if (![v5 needsInitialFetchFromCloud]
        || (v11 = [v6 needsInitialFetchFromCloud], v8 = v5, int v9 = v6, (v11 & 1) == 0))
      {
        uint64_t v12 = [v5 serverRecordData];
        if (!v12
          || (id v13 = (void *)v12,
              [v6 serverRecordData],
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              v14,
              v13,
              id v8 = v5,
              int v9 = v6,
              v14))
        {
          id v15 = [v6 serverRecordData];
          if (!v15)
          {
LABEL_12:
            id v17 = 0;
LABEL_18:
            int v19 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              -[ICNoteMergePolicy resolveConflictingAttachment:with:]();
            }

            BOOL v20 = 0;
            goto LABEL_21;
          }
          int v16 = [v5 serverRecordData];

          id v8 = v6;
          int v9 = v5;
          if (v16)
          {
            id v15 = 0;
            goto LABEL_12;
          }
        }
      }
    }
  }
  id v15 = v8;
  id v17 = v9;
  if (!v17 || !v15) {
    goto LABEL_18;
  }
  uint64_t v18 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v22 = [v5 identifier];
    id v23 = [v15 objectID];
    int v24 = [v17 objectID];
    int v25 = 138412802;
    uint64_t v26 = v22;
    __int16 v27 = 2112;
    char v28 = v23;
    __int16 v29 = 2112;
    uint64_t v30 = v24;
    _os_log_debug_impl(&dword_1C3A61000, v18, OS_LOG_TYPE_DEBUG, "Resolving attachment conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v25, 0x20u);
  }
  [v17 suppressFileDeletion];
  int v19 = [v17 managedObjectContext];
  [v19 deleteObject:v17];
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (BOOL)resolveConflictingAttachmentPreviewImage:(id)a3 with:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (([v5 versionOutOfDate] & 1) != 0
    || (char v7 = [v6 versionOutOfDate], v8 = v5, v9 = v6, (v7 & 1) == 0))
  {
    if (![v5 isInCloud] || (v10 = objc_msgSend(v6, "isInCloud"), v8 = v5, int v9 = v6, v10))
    {
      if (![v5 versionOutOfDate]
        || (v11 = [v6 versionOutOfDate], v8 = v6, int v9 = v5, v11))
      {
        if (([v5 isInCloud] & 1) != 0
          || (v12 = [v6 isInCloud], v8 = v6, int v9 = v5, (v12 & 1) == 0))
        {
          id v13 = [v5 modifiedDate];
          uint64_t v14 = [v6 modifiedDate];
          int v15 = objc_msgSend(v13, "ic_isLaterThanDate:", v14);

          if (v15) {
            id v8 = v5;
          }
          else {
            id v8 = v6;
          }
          if (v15) {
            int v9 = v6;
          }
          else {
            int v9 = v5;
          }
        }
      }
    }
  }
  id v16 = v8;
  id v17 = v9;
  if (v17) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  BOOL v19 = !v18;
  BOOL v20 = os_log_create("com.apple.notes", "CoreData");
  int v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v23 = [v5 identifier];
      int v24 = [v16 objectID];
      int v25 = [v17 objectID];
      int v26 = 138412802;
      __int16 v27 = v23;
      __int16 v28 = 2112;
      __int16 v29 = v24;
      __int16 v30 = 2112;
      uint64_t v31 = v25;
      _os_log_debug_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_DEBUG, "Resolving attachment preview image conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v26, 0x20u);
    }
    [v17 suppressFileDeletion];
    int v21 = [v17 managedObjectContext];
    [v21 deleteObject:v17];
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ICNoteMergePolicy resolveConflictingAttachmentPreviewImage:with:]();
    }
  }
  return v19;
}

- (BOOL)resolveConflictingDeviceMigrationState:(id)a3 with:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 isInCloud] || (int v7 = objc_msgSend(v6, "isInCloud"), v8 = v5, v9 = v6, v7))
  {
    if (([v5 isInCloud] & 1) != 0
      || (v10 = [v6 isInCloud], v8 = v6, int v9 = v5, (v10 & 1) == 0))
    {
      int v11 = [v5 stateModificationDate];
      char v12 = [v6 stateModificationDate];
      int v13 = objc_msgSend(v11, "ic_isLaterThanDate:", v12);

      if (v13) {
        id v8 = v5;
      }
      else {
        id v8 = v6;
      }
      if (v13) {
        int v9 = v6;
      }
      else {
        int v9 = v5;
      }
    }
  }
  id v14 = v8;
  id v15 = v9;
  if (v15) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  BOOL v17 = !v16;
  BOOL v18 = os_log_create("com.apple.notes", "CoreData");
  BOOL v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v25 = [v5 identifier];
      int v26 = [v14 objectID];
      __int16 v27 = [v15 objectID];
      int v31 = 138412802;
      uint64_t v32 = v25;
      __int16 v33 = 2112;
      char v34 = v26;
      __int16 v35 = 2112;
      uint64_t v36 = v27;
      _os_log_debug_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_DEBUG, "Resolving device migration state conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v31, 0x20u);
    }
    BOOL v20 = [v15 stateModificationDate];
    int v21 = [v14 stateModificationDate];
    int v22 = objc_msgSend(v20, "ic_isLaterThanDate:", v21);

    if (v22)
    {
      objc_msgSend(v14, "setState:", objc_msgSend(v15, "state"));
      id v23 = [v15 stateModificationDate];
      [v14 setStateModificationDate:v23];

      [v14 updateChangeCountWithReason:@"Resolved Core Data conflict"];
    }
    BOOL v19 = [v15 managedObjectContext];
    [v19 deleteObject:v15];
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = [v5 identifier];
      __int16 v29 = [v14 objectID];
      __int16 v30 = [v15 objectID];
      int v31 = 138412802;
      uint64_t v32 = v28;
      __int16 v33 = 2112;
      char v34 = v29;
      __int16 v35 = 2112;
      uint64_t v36 = v30;
      _os_log_error_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_ERROR, "Not resolving device migration state constraint conflict (%@) between (%@) and (%@)", (uint8_t *)&v31, 0x20u);
    }
  }

  return v17;
}

- (BOOL)resolveConflictingLegacyTombstone:(id)a3 with:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 isInCloud] || (int v7 = objc_msgSend(v6, "isInCloud"), v8 = v5, v9 = v6, v7))
  {
    if (([v5 isInCloud] & 1) != 0
      || (v10 = [v6 isInCloud], v8 = v6, int v9 = v5, (v10 & 1) == 0))
    {
      uint64_t v11 = [v5 account];
      if (!v11
        || (char v12 = (void *)v11,
            [v6 account],
            int v13 = objc_claimAutoreleasedReturnValue(),
            v13,
            v12,
            id v8 = v5,
            int v9 = v6,
            v13))
      {
        id v14 = [v5 account];
        if (v14)
        {
        }
        else
        {
          BOOL v18 = [v6 account];

          id v8 = v6;
          int v9 = v5;
          if (v18) {
            goto LABEL_12;
          }
        }
        int v15 = [v5 isEquivalentTo:v6];
        id v8 = v5;
        int v9 = v6;
        if (!v15)
        {
          id v16 = 0;
          id v17 = 0;
LABEL_17:
          BOOL v20 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            id v23 = [v5 identifier];
            int v24 = [v16 objectID];
            int v25 = [v17 objectID];
            int v29 = 138412802;
            __int16 v30 = v23;
            __int16 v31 = 2112;
            uint64_t v32 = v24;
            __int16 v33 = 2112;
            char v34 = v25;
            _os_log_error_impl(&dword_1C3A61000, v20, OS_LOG_TYPE_ERROR, "Not resolving legacy tombstone constraint conflict (%@) between (%@) and (%@)", (uint8_t *)&v29, 0x20u);
          }
          BOOL v21 = 0;
          goto LABEL_20;
        }
      }
    }
  }
LABEL_12:
  id v16 = v8;
  id v17 = v9;
  if (!v17 || !v16) {
    goto LABEL_17;
  }
  BOOL v19 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v26 = [v5 identifier];
    __int16 v27 = [v16 objectID];
    __int16 v28 = [v17 objectID];
    int v29 = 138412802;
    __int16 v30 = v26;
    __int16 v31 = 2112;
    uint64_t v32 = v27;
    __int16 v33 = 2112;
    char v34 = v28;
    _os_log_debug_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_DEBUG, "Resolving legacy tombstone conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v29, 0x20u);
  }
  BOOL v20 = [v17 managedObjectContext];
  [v20 deleteObject:v17];
  BOOL v21 = 1;
LABEL_20:

  return v21;
}

- (void)resolveOptimisticLockingVersionConflicts:(void *)a3 error:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  int v7 = [a2 sourceObject];
  id v8 = [v7 entity];
  int v9 = [v8 name];
  *(_DWORD *)a1 = 138412290;
  *a3 = v9;
  _os_log_debug_impl(&dword_1C3A61000, a4, OS_LOG_TYPE_DEBUG, "Another context deleted a %@ and we are deleting it too", a1, 0xCu);
}

- (void)resolveOptimisticLockingVersionConflicts:(os_log_t)log error:.cold.2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "CoreData optimistic locking resolution failed for conflicts: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)resolveConflictingAttachment:withInlineAttachment:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = [v3 identifier];
  uint64_t v5 = [v1 objectID];
  __int16 v6 = [v2 objectID];
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  char v10 = v5;
  __int16 v11 = 2112;
  char v12 = v6;
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Resolving attachment vs inline attachment conflict (%@) by keeping (%@) and deleting (%@)", (uint8_t *)&v7, 0x20u);
}

- (void)resolveConflictingAttachment:withInlineAttachment:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  [v2 identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_2() objectID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_4_2() objectID];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Not resolving attachment vs inline attachment constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);
}

- (void)resolveConflictingFolder:with:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  [v2 identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_2() objectID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_4_2() objectID];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Not resolving folder constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);
}

- (void)resolveConflictingInlineAttachment:with:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  [v2 identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_2() objectID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_4_2() objectID];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Not resolving inline attachment constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);
}

- (void)resolveConflictingNote:with:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  [v2 identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_2() objectID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_4_2() objectID];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Not resolving note constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);
}

- (void)resolveConflictingAttachment:with:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  [v2 identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_2() objectID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_4_2() objectID];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Not resolving attachment constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);
}

- (void)resolveConflictingAttachmentPreviewImage:with:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  [v2 identifier];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_3_2() objectID];
  objc_claimAutoreleasedReturnValue();
  id v3 = [(id)OUTLINED_FUNCTION_4_2() objectID];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v4, v5, "Not resolving attachment preview image constraint conflict (%@) between (%@) and (%@)", v6, v7, v8, v9, v10);
}

@end