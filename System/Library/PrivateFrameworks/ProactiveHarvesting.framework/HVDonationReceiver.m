@interface HVDonationReceiver
+ (id)defaultReceiver;
- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4;
- (BOOL)donateInteractions:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)donateSearchableItems:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)donateUserAction:(id)a3 searchableItem:(id)a4 error:(id *)a5;
- (HVDonationReceiver)init;
- (HVDonationReceiver)initWithQueues:(id)a3;
- (void)_setUpUserActivityDonations;
@end

@implementation HVDonationReceiver

+ (id)defaultReceiver
{
  if (defaultReceiver__pasOnceToken6 != -1) {
    dispatch_once(&defaultReceiver__pasOnceToken6, &__block_literal_global_1288);
  }
  v2 = (void *)defaultReceiver__pasExprOnceResult;

  return v2;
}

- (BOOL)deleteContentWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = hv_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v19 = v6;
    _os_log_impl(&dword_226C41000, v7, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: deleteContentWithRequest called: %{private}@", buf, 0xCu);
  }

  queues = self->_queues;
  id v15 = 0;
  BOOL v9 = [(HVQueues *)queues deleteContentWithRequest:v6 error:&v15];
  id v10 = v15;
  if (!v9)
  {
    v11 = hv_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_error_impl(&dword_226C41000, v11, OS_LOG_TYPE_ERROR, "HVDonationReceiver: deleteContentWithRequest failed: %@", buf, 0xCu);
    }

    if (a4)
    {
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F08608];
      id v17 = v10;
      v13 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      *a4 = [v12 errorWithDomain:@"HVErrorDomain" code:6 userInfo:v13];
    }
  }

  return v9;
}

- (BOOL)donateInteractions:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v33 = a4;
  if (+[HVContentAdmission shouldAdmitContentFromBundleIdentifier:](HVContentAdmission, "shouldAdmitContentFromBundleIdentifier:"))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
    BOOL v10 = v9 == 0;
    if (v9)
    {
      uint64_t v11 = v9;
      BOOL v28 = v9 == 0;
      v29 = a5;
      id v30 = v7;
      v12 = 0;
      uint64_t v13 = *(void *)v36;
      uint64_t v14 = *MEMORY[0x263F080B0];
      char v31 = 1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v17 = (void *)MEMORY[0x22A6667F0]();
          v18 = [v16 identifier];

          if (v18)
          {
            id v19 = [[HVInteraction alloc] initWithInteraction:v16 bundleIdentifier:v33];
            queues = self->_queues;
            id v34 = 0;
            BOOL v21 = [(HVQueues *)queues enqueueContent:v19 contentProtection:v14 error:&v34];
            v22 = v34;
            if (!v21)
            {
              v23 = hv_default_log_handle();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v42 = v22;
                _os_log_error_impl(&dword_226C41000, v23, OS_LOG_TYPE_ERROR, "HVDonationReceiver: donateInteractions: HVQueues enqueueContent failed: %@", buf, 0xCu);
              }

              v24 = v22;
              char v31 = 0;
              v12 = v24;
            }
          }
          else
          {
            v22 = hv_default_log_handle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543619;
              v42 = v33;
              __int16 v43 = 2117;
              v44 = v16;
              _os_log_fault_impl(&dword_226C41000, v22, OS_LOG_TYPE_FAULT, "Received interaction with nil identifier from bundle id %{public}@: %{sensitive}@", buf, 0x16u);
            }
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v11);

      BOOL v10 = v31;
      if ((v29 == 0) | v31 & 1)
      {
        id v7 = v30;
        goto LABEL_27;
      }
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v39 = *MEMORY[0x263F08608];
      id v8 = v12;
      id v7 = v30;
      if (!v12) {
        id v8 = (id)objc_opt_new();
      }
      id v40 = v8;
      v26 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      id *v29 = [v25 errorWithDomain:@"HVErrorDomain" code:2 userInfo:v26];

      BOOL v10 = v28;
      if (v12)
      {
        BOOL v10 = 0;
        goto LABEL_27;
      }
    }

    v12 = 0;
    goto LABEL_27;
  }
  v12 = hv_default_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v33;
    _os_log_impl(&dword_226C41000, v12, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: donateInteraction: ignoring interaction from %@ due to user settings.", buf, 0xCu);
  }
  BOOL v10 = 1;
LABEL_27:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeSink, 0);
  objc_storeStrong((id *)&self->_biomeScheduler, 0);
  objc_storeStrong((id *)&self->_biomeSubQueue, 0);

  objc_storeStrong((id *)&self->_queues, 0);
}

- (BOOL)donateUserAction:(id)a3 searchableItem:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v9 bundleID];
  BOOL v11 = +[HVContentAdmission shouldAdmitContentFromBundleIdentifier:v10];

  if (v11)
  {
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    *(void *)&long long v48 = 0;
    *((void *)&v48 + 1) = &v48;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__1255;
    v51 = __Block_byref_object_dispose__1256;
    id v52 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__1255;
    v42 = __Block_byref_object_dispose__1256;
    id v43 = 0;
    uint64_t v13 = (void *)MEMORY[0x263F08D38];
    uint64_t v14 = [v8 uaIdentifier];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __60__HVDonationReceiver_donateUserAction_searchableItem_error___block_invoke;
    v34[3] = &unk_2647D58A0;
    long long v36 = &v38;
    long long v37 = &v48;
    id v15 = v12;
    long long v35 = v15;
    id v16 = (id)[v13 _fetchUserActivityWithUUID:v14 intervalToWaitForDocumentSynchronizationToComplete:v34 completionHandler:5.0];

    [MEMORY[0x263F61E38] waitForSemaphore:v15];
    if (!*(void *)(*((void *)&v48 + 1) + 40))
    {
      char v23 = 0;
      if (a5) {
        *a5 = (id) v39[5];
      }
      goto LABEL_19;
    }
    id v17 = hv_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(*((void *)&v48 + 1) + 40);
      *(_DWORD *)buf = 138412290;
      id v47 = v18;
      _os_log_impl(&dword_226C41000, v17, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: donateUserActivity: fetched user activity: %@", buf, 0xCu);
    }

    id v19 = [HVSearchableUserActivity alloc];
    uint64_t v20 = [(HVSearchableUserActivity *)v19 initWithUserActivity:*(void *)(*((void *)&v48 + 1) + 40) searchableItem:v9];
    queues = self->_queues;
    v22 = [v9 protection];
    id v33 = 0;
    char v23 = [(HVQueues *)queues enqueueContent:v20 contentProtection:v22 error:&v33];
    id v24 = v33;

    if ((v23 & 1) == 0)
    {
      v27 = hv_default_log_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v24;
        _os_log_error_impl(&dword_226C41000, v27, OS_LOG_TYPE_ERROR, "HVDonationReceiver: donateUserAction: HVQueues enqueueContent failed: %@", buf, 0xCu);
      }

      id v28 = v24;
      v25 = v28;
      if (!a5) {
        goto LABEL_18;
      }
      v32 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08608];
      v29 = v28;
      if (!v28) {
        v29 = objc_opt_new();
      }
      v45 = v29;
      id v30 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      *a5 = [v32 errorWithDomain:@"HVErrorDomain" code:2 userInfo:v30];

      if (v25) {
        goto LABEL_18;
      }
    }
    v25 = 0;
LABEL_18:

LABEL_19:
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v48, 8);
    goto LABEL_20;
  }
  id v15 = hv_default_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [v9 bundleID];
    LODWORD(v48) = 138412290;
    *(void *)((char *)&v48 + 4) = v26;
    _os_log_impl(&dword_226C41000, v15, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: donateUserActivity: ignoring activity from %@ due to user settings.", (uint8_t *)&v48, 0xCu);
  }
  char v23 = 1;
LABEL_20:

  return v23;
}

void __60__HVDonationReceiver_donateUserAction_searchableItem_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = hv_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_226C41000, v7, OS_LOG_TYPE_ERROR, "HVDonationReceiver: donateUserAction: failed to fetch user activity: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)donateSearchableItems:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = hv_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 count];
    int v11 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_15);
    *(_DWORD *)buf = 134218498;
    uint64_t v61 = v10;
    __int16 v62 = 2114;
    id v63 = v8;
    __int16 v64 = 2114;
    v65 = v11;
    _os_log_impl(&dword_226C41000, v9, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: received %tu searchableItems for %{public}@ (%{public}@)", buf, 0x20u);
  }
  if (+[HVContentAdmission shouldAdmitContentFromBundleIdentifier:v8])
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v68 count:16];
    BOOL v14 = v13 == 0;
    uint64_t v51 = v13;
    if (v13)
    {
      v42 = a5;
      id v43 = v7;
      id v15 = 0;
      uint64_t v16 = *(void *)v55;
      char v48 = 1;
      uint64_t v47 = *(void *)v55;
      id v45 = v12;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v55 != v16) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v54 + 1) + 8 * v17);
          id v19 = (void *)MEMORY[0x22A6667F0]();
          uint64_t v20 = [v18 bundleID];
          char v21 = [v20 isEqualToString:v8];

          if (v21)
          {
            id v53 = 0;
            v22 = +[HVBiomeConversions biomeEventFromSearchableItem:v18 bundleIdentifier:v8 error:&v53];
            char v23 = v53;
            if (v22)
            {
              id v24 = v15;
              id v25 = v8;
              queues = self->_queues;
              v27 = [v18 protection];
              id v52 = 0;
              BOOL v28 = [(HVQueues *)queues enqueueContent:v22 contentProtection:v27 error:&v52];
              v29 = v52;

              if (v28)
              {
                id v8 = v25;
                id v15 = v24;
              }
              else
              {
                char v31 = hv_default_log_handle();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  v50 = [v18 bundleID];
                  long long v37 = [v18 uniqueIdentifier];
                  uint64_t v38 = [v18 domainIdentifier];
                  *(_DWORD *)buf = 138544130;
                  uint64_t v61 = (uint64_t)v50;
                  __int16 v62 = 2114;
                  id v63 = v37;
                  __int16 v64 = 2114;
                  v65 = v38;
                  __int16 v66 = 2112;
                  v67 = v29;
                  _os_log_error_impl(&dword_226C41000, v31, OS_LOG_TYPE_ERROR, "HVDonationReceiver: donateSearchableItems: HVQueues enqueueContent bid:%{public}@ uid:%{public}@ did:%{public}@ failed: %@", buf, 0x2Au);
                }
                v29 = v29;

                char v48 = 0;
                id v15 = v29;
                id v8 = v25;
              }
              id v12 = v45;
              uint64_t v16 = v47;
            }
            else
            {
              id v30 = hv_default_log_handle();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                uint64_t v44 = [v18 bundleID];
                [v18 uniqueIdentifier];
                long long v35 = v49 = v15;
                long long v36 = [v18 domainIdentifier];
                *(_DWORD *)buf = 138544130;
                uint64_t v61 = (uint64_t)v44;
                __int16 v62 = 2114;
                id v63 = v35;
                __int16 v64 = 2114;
                v65 = v36;
                __int16 v66 = 2112;
                v67 = v23;
                _os_log_error_impl(&dword_226C41000, v30, OS_LOG_TYPE_ERROR, "HVDonationReceiver: HVBiomeConversions biomeEventFromSearchableItem bid:%{public}@ uid:%{public}@ did:%{public}@ failed: %@", buf, 0x2Au);

                uint64_t v16 = v47;
                id v15 = v49;
              }
              char v48 = 0;
              v29 = v15;
              id v15 = v23;
            }
          }
          else
          {
            char v23 = hv_default_log_handle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            {
              v32 = [v18 bundleID];
              id v33 = [v18 uniqueIdentifier];
              id v34 = [v18 domainIdentifier];
              *(_DWORD *)buf = 138544130;
              uint64_t v61 = (uint64_t)v32;
              __int16 v62 = 2114;
              id v63 = v8;
              __int16 v64 = 2114;
              v65 = v33;
              __int16 v66 = 2114;
              v67 = v34;
              _os_log_fault_impl(&dword_226C41000, v23, OS_LOG_TYPE_FAULT, "HVDonationReceiver: HVBiomeConversions mismatched bundle id (%{public}@ != %{public}@) uid:%{public}@ did:%{public}@", buf, 0x2Au);
            }
            char v48 = 0;
          }

          ++v17;
        }
        while (v51 != v17);
        uint64_t v51 = [v12 countByEnumeratingWithState:&v54 objects:v68 count:16];
      }
      while (v51);

      BOOL v14 = v48;
      if ((v42 == 0) | v48 & 1)
      {
        id v7 = v43;
        goto LABEL_36;
      }
      uint64_t v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v58 = *MEMORY[0x263F08608];
      id v12 = v15;
      id v7 = v43;
      if (!v15) {
        id v12 = (id)objc_opt_new();
      }
      id v59 = v12;
      uint64_t v40 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      id *v42 = [v39 errorWithDomain:@"HVErrorDomain" code:2 userInfo:v40];

      BOOL v14 = 0;
      if (v15)
      {
        BOOL v14 = 0;
        goto LABEL_36;
      }
    }

    id v15 = 0;
    goto LABEL_36;
  }
  id v15 = hv_default_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v61 = (uint64_t)v8;
    _os_log_impl(&dword_226C41000, v15, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: donateSearchableItems: ignoring content from %{public}@ due to user settings.", buf, 0xCu);
  }
  BOOL v14 = 1;
LABEL_36:

  return v14;
}

__CFString *__67__HVDonationReceiver_donateSearchableItems_bundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 uniqueIdentifier];
  v3 = v2;
  if (!v2) {
    v2 = @"(NO UNIQUEID!)";
  }
  v4 = v2;

  return v4;
}

- (void)_setUpUserActivityDonations
{
  v3 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"HVDonationReceiver.biomeSubQueue" qosClass:9];
  biomeSubQueue = self->_biomeSubQueue;
  self->_biomeSubQueue = v3;

  id v5 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x263F2A758]) initWithIdentifier:@"com.apple.HVDonationReceiver.BiomeScheduler" targetQueue:self->_biomeSubQueue];
  biomeScheduler = self->_biomeScheduler;
  self->_biomeScheduler = v5;

  id v7 = objc_opt_new();
  id v8 = [v7 publisher];
  id v9 = [v8 subscribeOn:self->_biomeScheduler];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__HVDonationReceiver__setUpUserActivityDonations__block_invoke_10;
  v12[3] = &unk_2647D5858;
  v12[4] = self;
  uint64_t v10 = [v9 sinkWithCompletion:&__block_literal_global_9 receiveInput:v12];
  biomeSink = self->_biomeSink;
  self->_biomeSink = v10;
}

void __49__HVDonationReceiver__setUpUserActivityDonations__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [a2 eventBody];
  v4 = [v3 associatedBundleId];
  BOOL v5 = +[HVContentAdmission shouldAdmitContentFromBundleIdentifier:v4];

  if (v5)
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *MEMORY[0x263F08098];
    id v13 = 0;
    char v8 = [v6 enqueueContent:v3 contentProtection:v7 error:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0)
    {
      uint64_t v10 = hv_default_log_handle();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      int v11 = [v3 uuid];
      id v12 = [v3 associatedBundleId];
      *(_DWORD *)buf = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl(&dword_226C41000, v10, OS_LOG_TYPE_ERROR, "HVDonationReceiver: user activities: failed to enqueue %@ from %@: %@", buf, 0x20u);

LABEL_7:
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = hv_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v3 uuid];
      int v11 = [v3 associatedBundleId];
      *(_DWORD *)buf = 138412546;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_226C41000, v9, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: user activities: ignoring %@ from %@ due to settings.", buf, 0x16u);
      goto LABEL_7;
    }
  }
LABEL_9:
}

void __49__HVDonationReceiver__setUpUserActivityDonations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if ([v2 state] == 1)
  {
    v3 = hv_default_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = [v2 error];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_226C41000, v3, OS_LOG_TYPE_ERROR, "HVDonationReceiver: user activities: completion error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  v4 = hv_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_226C41000, v4, OS_LOG_TYPE_DEFAULT, "HVDonationReceiver: user activities: completed.", (uint8_t *)&v6, 2u);
  }
}

- (HVDonationReceiver)initWithQueues:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HVDonationReceiver;
  int v6 = [(HVDonationReceiver *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queues, a3);
  }

  return v7;
}

- (HVDonationReceiver)init
{
  v3 = +[HVQueues defaultQueues];
  v4 = [(HVDonationReceiver *)self initWithQueues:v3];

  return v4;
}

void __37__HVDonationReceiver_defaultReceiver__block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)defaultReceiver__pasExprOnceResult;
  defaultReceiver__pasExprOnceResult = v1;
}

@end