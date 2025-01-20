@interface PBFPosterRoleCoordinatorSynchronizeAttribute
@end

@implementation PBFPosterRoleCoordinatorSynchronizeAttribute

uint64_t ___PBFPosterRoleCoordinatorSynchronizeAttribute_block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [v5 attributeType];
  if ([v6 isEqual:*MEMORY[0x1E4F92760]])
  {
    v7 = (void *)MEMORY[0x1E4F926B0];
    v8 = [*(id *)(a1 + 32) _path];
    LOBYTE(v7) = [v7 storeFocusConfigurationForPath:v8 focusConfiguration:v5 error:a3];

    if ((v7 & 1) == 0)
    {
      v9 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
  }
  else if ([v6 isEqual:*MEMORY[0x1E4F92750]])
  {
    v10 = (void *)MEMORY[0x1E4F926B0];
    v11 = [*(id *)(a1 + 32) _path];
    LOBYTE(v10) = [v10 storeAmbientConfigurationForPath:v11 ambientConfiguration:v5 error:a3];

    if ((v10 & 1) == 0)
    {
      v9 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
LABEL_11:
        v14 = [*(id *)(a1 + 32) role];
        v15 = objc_msgSend(*(id *)(a1 + 32), "pbf_posterUUID");
        uint64_t v16 = *a3;
        int v17 = 138544130;
        v18 = v14;
        __int16 v19 = 2114;
        v20 = v15;
        __int16 v21 = 2114;
        v22 = v6;
        __int16 v23 = 2114;
        uint64_t v24 = v16;
        _os_log_fault_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_FAULT, "[%{public}@] Failed to synchronize attribute %{public}@ to disk for posterUUID %{public}@: %{public}@", (uint8_t *)&v17, 0x2Au);
      }
LABEL_9:

      uint64_t v12 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v12 = 1;
LABEL_10:

  return v12;
}

uint64_t ___PBFPosterRoleCoordinatorSynchronizeAttribute_block_invoke_385(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(*(id *)(a1 + 40), "pbf_posterUUID");
  v8 = [*(id *)(a1 + 40) role];
  v9 = [v5 attributeType];
  v10 = [v5 encodeJSON];
  LOBYTE(v6) = [v6 mutateAttributeForPoster:v7 roleId:v8 attributeId:v9 attributePayload:v10 error:a3];

  if ((v6 & 1) == 0)
  {
    v11 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v13 = [*(id *)(a1 + 40) role];
      v14 = objc_msgSend(*(id *)(a1 + 40), "pbf_posterUUID");
      v15 = [v5 attributeType];
      uint64_t v16 = *a3;
      int v17 = 138544130;
      v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      __int16 v21 = 2114;
      v22 = v15;
      __int16 v23 = 2114;
      uint64_t v24 = v16;
      _os_log_fault_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_FAULT, "[%{public}@] Failed to synchronize attribute %{public}@ to database for posterUUID %{public}@: %{public}@", (uint8_t *)&v17, 0x2Au);
    }
  }

  return 1;
}

@end