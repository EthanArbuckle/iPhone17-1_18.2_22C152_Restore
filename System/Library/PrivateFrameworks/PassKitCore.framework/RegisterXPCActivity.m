@interface RegisterXPCActivity
@end

@implementation RegisterXPCActivity

void ___RegisterXPCActivity_block_invoke(id *a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__19;
  v58 = __Block_byref_object_dispose__19;
  id v59 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__19;
  v52[4] = __Block_byref_object_dispose__19;
  id v53 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__19;
  v50[4] = __Block_byref_object_dispose__19;
  id v51 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__19;
  v48 = __Block_byref_object_dispose__19;
  id v49 = 0;
  v5 = _ScheduledActivityQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___RegisterXPCActivity_block_invoke_2;
  block[3] = &unk_1E56E1860;
  id v36 = a1[4];
  v39 = &v60;
  id v37 = a1[5];
  v40 = &v54;
  v41 = v52;
  v42 = v50;
  v43 = &v44;
  id v38 = a1[6];
  dispatch_sync(v5, block);

  if (*((unsigned char *)v61 + 24))
  {
    if (state == 2)
    {
      v15 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = a1[4];
        id v16 = a1[5];
        *(_DWORD *)buf = 138412546;
        id v65 = v16;
        __int16 v66 = 2112;
        id v67 = v17;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Beginning Scheduled Activity: %@ for Client: %@", buf, 0x16u);
      }

      v18 = _ScheduledActivityQueue();
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = ___RegisterXPCActivity_block_invoke_239;
      v30[3] = &unk_1E56E1888;
      v34 = &v44;
      v31 = a1[5];
      id v32 = a1[4];
      id v33 = a1[6];
      dispatch_async(v18, v30);

      v19 = v55[5];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = ___RegisterXPCActivity_block_invoke_240;
      v25[3] = &unk_1E56E18B0;
      v27 = v50;
      v28 = v52;
      id v26 = a1[5];
      v29 = &v44;
      dispatch_sync(v19, v25);
      if (!xpc_activity_set_state(v3, 5))
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = a1[4];
          id v20 = a1[5];
          *(_DWORD *)buf = 138412546;
          id v65 = v20;
          __int16 v66 = 2112;
          id v67 = v21;
          _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Failed to set Scheduled Activity: %@ for Client: %@ to DONE", buf, 0x16u);
        }
      }
      v6 = v31;
      goto LABEL_24;
    }
    if (!state)
    {
      v6 = xpc_activity_copy_criteria(v3);
      v7 = (void *)v45[5];
      if (v6)
      {
        v8 = [v7 xpcActivityCriteria];
        BOOL v9 = PDXPCDictionaryUpdateWithDictionary(v6, v8);

        if (!v9)
        {
          v10 = PKLogFacilityTypeGetObject(0);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = a1[4];
            id v11 = a1[5];
            *(_DWORD *)buf = 138412546;
            id v65 = v11;
            __int16 v66 = 2112;
            id v67 = v12;
            _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Preserving prior, identical XPC criteria for Scheduled Activity: %@ for Client: %@", buf, 0x16u);
          }

LABEL_24:
          goto LABEL_25;
        }
      }
      else
      {
        v6 = [v7 xpcActivityCriteria];
      }
      v22 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = a1[4];
        id v23 = a1[5];
        *(_DWORD *)buf = 138412546;
        id v65 = v23;
        __int16 v66 = 2112;
        id v67 = v24;
        _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Setting XPC criteria for Scheduled Activity: %@ for Client: %@", buf, 0x16u);
      }

      xpc_activity_set_criteria(v3, v6);
      goto LABEL_24;
    }
  }
  else if (state == 2 && !xpc_activity_set_state(v3, 5))
  {
    v6 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = a1[4];
      id v13 = a1[5];
      *(_DWORD *)buf = 138412546;
      id v65 = v13;
      __int16 v66 = 2112;
      id v67 = v14;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Failed to set Scheduled Activity: %@ for Client: %@ to DONE", buf, 0x16u);
    }
    goto LABEL_24;
  }
LABEL_25:

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
}

void ___RegisterXPCActivity_block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = _RegisteredClients();
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  v4 = [v3 activityRegistrations];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 isValid];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    goto LABEL_6;
  }
  v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v6 = [v3 activityQueue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v3 clientInstance];
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = [v5 activityContext];
  uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  v15 = [v5 activityCriteria];
  uint64_t v16 = [v15 copy];
  uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  v19 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (v19)
  {
    id v20 = [v19 endDate];
    [v20 timeIntervalSinceNow];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v21 >= 0.0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
LABEL_6:
    v22 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 40);
      int v25 = 138412546;
      uint64_t v26 = v23;
      __int16 v27 = 2112;
      uint64_t v28 = v24;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Removing invalid/expired Scheduled Activity: %@ for Client: %@", (uint8_t *)&v25, 0x16u);
    }

    [v4 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    xpc_activity_unregister((const char *)[*(id *)(a1 + 48) UTF8String]);
    _ArchiveRegisteredClients();
  }
}

void ___RegisterXPCActivity_block_invoke_239(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isRepeating]
    || ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) endDate],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 timeIntervalSinceNow],
        double v4 = v3,
        v2,
        v4 < 0.0))
  {
    v5 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v11 = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Removing finished Scheduled Activity: %@ for Client: %@", (uint8_t *)&v11, 0x16u);
    }

    v8 = _RegisteredClients();
    uint64_t v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];

    uint64_t v10 = [v9 activityRegistrations];
    [v10 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];

    xpc_activity_unregister((const char *)[*(id *)(a1 + 48) UTF8String]);
    _ArchiveRegisteredClients();
  }
  if (_TrimUnregisteredClients_onceToken != -1) {
    dispatch_once(&_TrimUnregisteredClients_onceToken, &__block_literal_global_245);
  }
}

uint64_t ___RegisterXPCActivity_block_invoke_240(void *a1)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 40);
    return [v2 performScheduledActivityWithIdentifier:v4 activityCriteria:v3 activityContext:v5];
  }
  else
  {
    uint64_t v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void *)(*(void *)(a1[7] + 8) + 40);
    return [v7 performScheduledActivityWithIdentifier:v8 activityCriteria:v9];
  }
}

@end