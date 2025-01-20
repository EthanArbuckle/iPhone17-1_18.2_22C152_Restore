@interface PLMergePolicy
- (BOOL)isResolvingConflicts;
- (BOOL)resolveConflicts:(id)a3 error:(id *)a4;
- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4;
@end

@implementation PLMergePolicy

- (BOOL)isResolvingConflicts
{
  return self->_isResolvingConflicts;
}

- (BOOL)resolveConflicts:(id)a3 error:(id *)a4
{
  self->_isResolvingConflicts = 1;
  v6.receiver = self;
  v6.super_class = (Class)PLMergePolicy;
  BOOL result = [(NSMergePolicy *)&v6 resolveConflicts:a3 error:a4];
  self->_isResolvingConflicts = 0;
  return result;
}

- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  +[PLUnintendedChangeChecker checkForUnintendedChangeOnMergeConflicts:v6 withBlock:&__block_literal_global_61867];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v13 newVersionNumber])
        {
          v14 = [v13 sourceObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }

  v30.receiver = self;
  v30.super_class = (Class)PLMergePolicy;
  BOOL v15 = [(NSMergePolicy *)&v30 resolveOptimisticLockingVersionConflicts:v8 error:a4];
  +[PLUnintendedChangeChecker checkForUnintendedChangeOnMergeConflicts:v8 withBlock:&__block_literal_global_44_61870];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        v22 = objc_msgSend(v21, "managedObjectContext", (void)v26);
        v23 = [v22 delayedSaveActions];
        [v23 recordAlbumForCountsAndDateRangeUpdate:v21];

        v24 = [v22 delayedSaveActions];
        [v24 recordAlbumForKeyAssetsUpdate:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v18);
  }

  return v15;
}

void __64__PLMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke_42(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_FAULT, "Unintended change during post-flight merge: key %@, value: %@, context %@, conflict %@", buf, 0x2Au);
  }

  v13 = [NSString stringWithFormat:@"Unintended change during post-flight merge: key %@, value: %@, context %@, conflict %@", v8, v9, v10, v11];
  +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Photo Library state" message:@"Please file a Radar against Photos" radarTitle:@"TTR: Unintended change during post-flight merge" radarDescription:v13];
}

void __64__PLMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_FAULT, "Unintended change during pre-flight merge: key %@, value: %@, context %@, conflict %@", buf, 0x2Au);
  }

  v13 = [NSString stringWithFormat:@"Unintended change during pre-flight merge: key %@, value: %@, context %@, conflict %@", v8, v9, v10, v11];
  +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Photo Library state" message:@"Please file a Radar against Photos" radarTitle:@"TTR: Unintended change during pre-flight merge" radarDescription:v13];
}

@end