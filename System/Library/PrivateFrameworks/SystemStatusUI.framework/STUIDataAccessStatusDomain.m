@interface STUIDataAccessStatusDomain
+ (unint64_t)statusDomainName;
- (STUIDataAccessStatusDomain)initWithServerHandle:(id)a3;
- (STUIMutableDataAccessStatusDomainData)_internalQueue_generatedData;
- (id)_dataAccessAttributionsForAttributions:(uint64_t)a3 dataAccessType:(void *)a4 dataAccessAttributionProvider:;
- (id)data;
- (void)_internalQueue_beginWaitingForLingerTimeForAttribution:(id *)a1;
- (void)_internalQueue_handleLocationData:(void *)a3 mediaData:;
- (void)_internalQueue_notifyClientsOfData:(uint64_t)a1;
- (void)_internalQueue_updateDataForLocationData:(void *)a3 mediaData:;
- (void)dealloc;
- (void)invalidate;
@end

@implementation STUIDataAccessStatusDomain

void __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 64);
  }
  else {
    v3 = 0;
  }
  id v4 = [v3 data];
  -[STUIDataAccessStatusDomain _internalQueue_handleLocationData:mediaData:](*(void *)(a1 + 32), v4, *(void **)(a1 + 40));
}

void __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 72);
  }
  else {
    v3 = 0;
  }
  id v4 = [v3 data];
  -[STUIDataAccessStatusDomain _internalQueue_handleLocationData:mediaData:](*(void *)(a1 + 32), *(void **)(a1 + 40), v4);
}

- (void)_internalQueue_handleLocationData:(void *)a3 mediaData:
{
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 40);
    id v6 = a3;
    id v7 = a2;
    dispatch_assert_queue_V2(v5);
    unint64_t v9 = (unint64_t)*(id *)(a1 + 80);
    -[STUIDataAccessStatusDomain _internalQueue_updateDataForLocationData:mediaData:]((dispatch_queue_t *)a1, v7, v6);

    unint64_t v8 = (unint64_t)*(id *)(a1 + 80);
    if (v9 | v8 && ([(id)v9 isEqual:v8] & 1) == 0) {
      -[STUIDataAccessStatusDomain _internalQueue_notifyClientsOfData:](a1, (void *)v8);
    }
  }
}

- (void)_internalQueue_updateDataForLocationData:(void *)a3 mediaData:
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  unint64_t v81 = a2;
  unint64_t v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    if (v81 | v5)
    {
      val = a1;
      v80 = (void *)v5;
      id v7 = [(id)v5 cameraAttributions];
      v79 = -[STUIDataAccessStatusDomain _dataAccessAttributionsForAttributions:dataAccessType:dataAccessAttributionProvider:]((uint64_t)a1, v7, 1, &__block_literal_global_31);

      unint64_t v8 = [v80 microphoneAttributions];
      v78 = -[STUIDataAccessStatusDomain _dataAccessAttributionsForAttributions:dataAccessType:dataAccessAttributionProvider:]((uint64_t)a1, v8, 0, &__block_literal_global_9);

      id v9 = (id)v81;
      uint64_t v10 = [v9 activeDisplayModes];
      v11 = [v9 attributions];

      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v119[2] = __75__STUIDataAccessStatusDomain__filteredLocationAttributionsForLocationData___block_invoke;
      v119[3] = &__block_descriptor_40_e51_B16__0__STLocationStatusDomainLocationAttribution_8l;
      v119[4] = v10;
      v12 = objc_msgSend(v11, "bs_filter:", v119);

      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __75__STUIDataAccessStatusDomain__filteredLocationAttributionsForLocationData___block_invoke_2;
      v120[3] = &unk_1E6AA4798;
      BOOL v121 = (v10 & 2) != 0;
      v120[4] = val;
      v77 = objc_msgSend(v12, "bs_map:", v120);

      v76 = -[STUIDataAccessStatusDomain _dataAccessAttributionsForAttributions:dataAccessType:dataAccessAttributionProvider:]((uint64_t)val, v77, 2, &__block_literal_global_33);
      v13 = (void *)[v79 mutableCopy];
      [v13 unionSet:v78];
      [v13 unionSet:v76];
      id v14 = v13;
      dispatch_assert_queue_V2(val[5]);
      v15 = val[11];
      objc_setProperty_nonatomic_copy(val, v16, v14, 88);
      v17 = (void *)[v14 mutableCopy];
      [v17 minusSet:v15];
      v73 = v15;
      id v74 = [v15 mutableCopy];
      v75 = v14;
      [v74 minusSet:v14];
      v89 = val[12];
      v91 = val[13];
      v88 = val[14];
      v90 = val[15];
      v87 = val[16];
      v18 = val[17];
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      obuint64_t j = v17;
      uint64_t v84 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
      if (v84)
      {
        uint64_t v83 = *(void *)v109;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v109 != v83)
            {
              uint64_t v20 = v19;
              objc_enumerationMutation(obj);
              uint64_t v19 = v20;
            }
            uint64_t v85 = v19;
            v21 = *(void **)(*((void *)&v108 + 1) + 8 * v19);
            long long v104 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            v22 = [v91 allKeys];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v104 objects:v119 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v105;
              do
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v105 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  v26 = *(void **)(*((void *)&v104 + 1) + 8 * i);
                  v27 = [v26 attributedEntity];
                  v28 = [v21 attributedEntity];
                  if ([v27 isEqual:v28])
                  {
                    uint64_t v29 = [v26 dataAccessType];
                    LODWORD(v29) = v29 == [v21 dataAccessType];

                    if (v29)
                    {
                      v30 = [v91 objectForKey:v26];
                      [v30 invalidate];

                      [v91 removeObjectForKey:v26];
                      [v89 removeObject:v26];
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v23 = [v22 countByEnumeratingWithState:&v104 objects:v119 count:16];
              }
              while (v23);
            }

            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            v31 = [v90 allKeys];
            uint64_t v32 = [v31 countByEnumeratingWithState:&v100 objects:v118 count:16];
            if (v32)
            {
              uint64_t v33 = *(void *)v101;
              do
              {
                for (uint64_t j = 0; j != v32; ++j)
                {
                  if (*(void *)v101 != v33) {
                    objc_enumerationMutation(v31);
                  }
                  v35 = *(void **)(*((void *)&v100 + 1) + 8 * j);
                  v36 = [v35 attributedEntity];
                  v37 = [v21 attributedEntity];
                  if ([v36 isEqual:v37])
                  {
                    uint64_t v38 = [v35 dataAccessType];
                    LODWORD(v38) = v38 == [v21 dataAccessType];

                    if (v38)
                    {
                      v39 = [v90 objectForKey:v35];
                      [v39 invalidate];

                      [v90 removeObjectForKey:v35];
                      [v88 removeObject:v35];
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v32 = [v31 countByEnumeratingWithState:&v100 objects:v118 count:16];
              }
              while (v32);
            }

            long long v98 = 0u;
            long long v99 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            v40 = [v18 allKeys];
            uint64_t v41 = [v40 countByEnumeratingWithState:&v96 objects:v117 count:16];
            if (v41)
            {
              uint64_t v42 = *(void *)v97;
              do
              {
                for (uint64_t k = 0; k != v41; ++k)
                {
                  if (*(void *)v97 != v42) {
                    objc_enumerationMutation(v40);
                  }
                  v44 = *(void **)(*((void *)&v96 + 1) + 8 * k);
                  v45 = [v44 attributedEntity];
                  v46 = [v21 attributedEntity];
                  if ([v45 isEqual:v46])
                  {
                    uint64_t v47 = [v44 dataAccessType];
                    LODWORD(v47) = v47 == [v21 dataAccessType];

                    if (v47)
                    {
                      v48 = [v18 objectForKey:v44];
                      [v48 invalidate];

                      [v18 removeObjectForKey:v44];
                      [v87 removeObject:v44];
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v41 = [v40 countByEnumeratingWithState:&v96 objects:v117 count:16];
              }
              while (v41);
            }

            uint64_t v19 = v85 + 1;
          }
          while (v85 + 1 != v84);
          uint64_t v84 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
        }
        while (v84);
      }

      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v49 = v74;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v92 objects:v116 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v93;
        do
        {
          for (uint64_t m = 0; m != v50; ++m)
          {
            if (*(void *)v93 != v51) {
              objc_enumerationMutation(v49);
            }
            v53 = *(void **)(*((void *)&v92 + 1) + 8 * m);
            v54 = [MEMORY[0x1E4F1C9C8] date];
            v55 = [v53 accessStartDate];
            [v54 timeIntervalSinceDate:v55];
            double v57 = v56;

            if (v57 >= 0.0) {
              double v58 = v57;
            }
            else {
              double v58 = 0.0;
            }
            uint64_t v59 = [v53 dataAccessType];
            double v60 = 3.0;
            if (!v59)
            {
              v61 = objc_msgSend(v53, "microphoneRecordingAttribution", 3.0);
              [v61 maximumHistoryAccessed];
              double v63 = v62;

              double v60 = fmax(v63, 3.0);
            }
            double v64 = v60 - v58;
            if (BSFloatGreaterThanFloat())
            {
              id v65 = v53;
              objc_initWeak(&location, val);
              v66 = val[12];
              [v66 addObject:v65];

              v67 = (void *)[objc_alloc(MEMORY[0x1E4F4F6F0]) initWithIdentifier:@"STUIDataAccessStatusDomain-MinimumDisplayTime"];
              v68 = val[13];
              [v68 setObject:v67 forKey:v65];

              v69 = val[5];
              v112[0] = MEMORY[0x1E4F143A8];
              v112[1] = 3221225472;
              v112[2] = __94__STUIDataAccessStatusDomain__internalQueue_beginWaitingForMinimumDisplayTime_forAttribution___block_invoke;
              v112[3] = &unk_1E6AA47E0;
              objc_copyWeak(&v114, &location);
              id v70 = v65;
              id v113 = v70;
              [v67 scheduleWithFireInterval:v69 leewayInterval:v112 queue:v64 handler:0.5];

              objc_destroyWeak(&v114);
              objc_destroyWeak(&location);
            }
            else
            {
              -[STUIDataAccessStatusDomain _internalQueue_beginWaitingForLingerTimeForAttribution:]((id *)val, v53);
            }
          }
          uint64_t v50 = [v49 countByEnumeratingWithState:&v92 objects:v116 count:16];
        }
        while (v50);
      }

      if ([obj count])
      {
        v71 = -[STUIDataAccessStatusDomain _internalQueue_generatedData](val);
        objc_setProperty_nonatomic_copy(val, v72, v71, 80);
      }
      unint64_t v5 = (unint64_t)v80;
    }
    else
    {
      objc_setProperty_nonatomic_copy(a1, v6, 0, 80);
    }
  }
}

- (id)_dataAccessAttributionsForAttributions:(uint64_t)a3 dataAccessType:(void *)a4 dataAccessAttributionProvider:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v26 = a4;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v29 = (void *)[*(id *)(a1 + 88) mutableCopy];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v7;
  uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v10 = v29;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v32;
LABEL_8:
          uint64_t v14 = 0;
LABEL_9:
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
          if ([v15 dataAccessType] != a3) {
            goto LABEL_20;
          }
          id v16 = v15;
          uint64_t v17 = [v16 dataAccessType];
          switch(v17)
          {
            case 2:
              uint64_t v18 = [v16 locationAttribution];
              break;
            case 1:
              uint64_t v18 = [v16 cameraCaptureAttribution];
              break;
            case 0:
              uint64_t v18 = [v16 microphoneRecordingAttribution];
              break;
            default:
LABEL_19:

              char v19 = [v15 isEqual:v9];
              if (v19)
              {
                id v20 = v16;

                if (!v20) {
                  goto LABEL_25;
                }
                id v21 = v20;
                [v10 removeObject:v21];
                v22 = v21;
LABEL_27:
                [v27 addObject:v21];

                continue;
              }
LABEL_20:
              if (v12 == ++v14)
              {
                uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
                if (v12) {
                  goto LABEL_8;
                }
                goto LABEL_22;
              }
              goto LABEL_9;
          }
          v15 = (void *)v18;
          goto LABEL_19;
        }
LABEL_22:

LABEL_25:
        uint64_t v23 = v26[2](v26, v9);
        if (v23)
        {
          id v21 = (id)v23;
          v22 = 0;
          goto LABEL_27;
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v30);
  }

  return v27;
}

- (void)_internalQueue_notifyClientsOfData:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    id v4 = *(NSObject **)(a1 + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__STUIDataAccessStatusDomain__internalQueue_notifyClientsOfData___block_invoke;
    v5[3] = &unk_1E6AA39F0;
    v5[4] = a1;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

- (STUIMutableDataAccessStatusDomainData)_internalQueue_generatedData
{
  v1 = (STUIMutableDataAccessStatusDomainData *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    uint64_t v2 = (void *)[(STListData *)v1[3].super._attributionListData mutableCopy];
    [v2 addObjectsFromArray:v1[4].super.super.isa];
    [v2 addObjectsFromArray:v1[4].super._attributionListData];
    [v2 addObjectsFromArray:v1[5].super._userIdentities];
    v1 = objc_alloc_init(STUIMutableDataAccessStatusDomainData);
    [(STUIMutableDataAccessStatusDomainData *)v1 setDataAccessAttributions:v2];
  }
  return v1;
}

STUIDataAccessAttribution *__77__STUIDataAccessStatusDomain__dataAccessAttributionsForLocationAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [STUIDataAccessAttribution alloc];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v5 = [(STUIDataAccessAttribution *)v3 initWithLocationAttribution:v2 recent:0 startDate:v4 endDate:0];

  return v5;
}

STUIDataAccessAttribution *__82__STUIDataAccessStatusDomain__dataAccessAttributionsForCameraCaptureAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [STUIDataAccessAttribution alloc];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v5 = [(STUIDataAccessAttribution *)v3 initWithCameraCaptureAttribution:v2 recent:0 startDate:v4 endDate:0];

  return v5;
}

STUIDataAccessAttribution *__88__STUIDataAccessStatusDomain__dataAccessAttributionsForMicrophoneRecordingAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [STUIDataAccessAttribution alloc];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v5 = [(STUIDataAccessAttribution *)v3 initWithMicrophoneRecordingAttribution:v2 recent:0 startDate:v4 endDate:0];

  return v5;
}

+ (unint64_t)statusDomainName
{
  return 9000;
}

uint64_t __65__STUIDataAccessStatusDomain__internalQueue_notifyClientsOfData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) observeData:*(void *)(a1 + 40) forDomain:9000 withChangeContext:0];
}

id __75__STUIDataAccessStatusDomain__filteredLocationAttributionsForLocationData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 eligibleDisplayModes] & 1) != 0
    || *(unsigned char *)(a1 + 40)
    || ([v3 activityAttribution],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 attributedEntity],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isSystemService],
        v5,
        v4,
        !v6))
  {
    id v20 = v3;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = v3;
    uint64_t v9 = v8;
    if (v7)
    {
      id v10 = [v8 activityAttribution];
      uint64_t v11 = [v10 attributedEntity];
      if ([v11 isSystemService])
      {
        id v12 = objc_alloc(MEMORY[0x1E4FA9318]);
        uint64_t v13 = [v11 executableIdentity];
        uint64_t v14 = [v11 website];
        v15 = [v11 localizedExecutableDisplayName];
        id v16 = [v11 localizedExecutableDisplayName];
        uint64_t v17 = (void *)[v12 initWithExecutableIdentity:v13 website:v14 systemService:0 localizedDisplayName:v15 localizedExecutableDisplayName:v16];

        uint64_t v18 = [v10 activeEntity];
        if ([v18 isEqual:v11]) {
          id v19 = 0;
        }
        else {
          id v19 = v18;
        }
        v22 = (void *)[objc_alloc(MEMORY[0x1E4FA9310]) initWithAttributedEntity:v17 activeEntity:v19];
        id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FA93C0]), "initWithLocationState:activityAttribution:eligibleDisplayModes:", objc_msgSend(v9, "locationState"), v22, objc_msgSend(v9, "eligibleDisplayModes"));
      }
      else
      {
        id v20 = v9;
      }
    }
    else
    {
      id v20 = 0;
    }
  }
  return v20;
}

BOOL __75__STUIDataAccessStatusDomain__filteredLocationAttributionsForLocationData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 locationState] == 1)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = ([v3 eligibleDisplayModes] & v4) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_3;
    v7[3] = &unk_1E6AA39F0;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

void __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_5;
    v7[3] = &unk_1E6AA39F0;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

void __67__STUIDataAccessStatusDomain__internalQueue_makeAttributionRecent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  self = objc_loadWeakRetained(v3);
  [v4 invalidate];

  BOOL v5 = self;
  if (self) {
    BOOL v5 = (void *)*((void *)self + 17);
  }
  [v5 removeObjectForKey:*(void *)(a1 + 32)];
  int v6 = self;
  if (self) {
    int v6 = (void *)*((void *)self + 16);
  }
  [v6 removeObject:*(void *)(a1 + 32)];
  id v8 = -[STUIDataAccessStatusDomain _internalQueue_generatedData]((dispatch_queue_t *)self);
  uint64_t v9 = (uint64_t)self;
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v7, v8, 80);
    uint64_t v9 = (uint64_t)self;
  }
  -[STUIDataAccessStatusDomain _internalQueue_notifyClientsOfData:](v9, v8);
}

- (STUIDataAccessStatusDomain)initWithServerHandle:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)STUIDataAccessStatusDomain;
  BOOL v5 = [(STStatusDomain *)&v39 initWithServerHandle:v4];
  if (v5)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)Serial;

    uint64_t v8 = BSDispatchQueueCreateSerial();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
    activeAttributions = v5->_activeAttributions;
    v5->_activeAttributions = (NSSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    attributionsWaitingForMinimumDisplayTime = v5->_attributionsWaitingForMinimumDisplayTime;
    v5->_attributionsWaitingForMinimumDisplayTime = (NSMutableArray *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    activeAttributionMinimumDisplayTimers = v5->_activeAttributionMinimumDisplayTimers;
    v5->_activeAttributionMinimumDisplayTimers = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    attributionsWaitingForLingerTime = v5->_attributionsWaitingForLingerTime;
    v5->_attributionsWaitingForLingerTime = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    activeAttributionLingerTimers = v5->_activeAttributionLingerTimers;
    v5->_activeAttributionLingerTimers = (NSMutableDictionary *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    recentAttributions = v5->_recentAttributions;
    v5->_recentAttributions = (NSMutableArray *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    recentAttributionExpirationTimers = v5->_recentAttributionExpirationTimers;
    v5->_recentAttributionExpirationTimers = (NSMutableDictionary *)v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FA93B0]) initWithServerHandle:v4];
    locationDomain = v5->_locationDomain;
    v5->_locationDomain = (STLocationStatusDomain *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4FA93C8]) initWithServerHandle:v4];
    mediaDomain = v5->_mediaDomain;
    v5->_mediaDomain = (STMediaStatusDomain *)v26;

    objc_initWeak(&location, v5);
    uint64_t v28 = v5->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke;
    block[3] = &unk_1E6AA4728;
    uint64_t v29 = v5;
    long long v36 = v29;
    objc_copyWeak(&v37, &location);
    dispatch_sync(v28, block);
    id v30 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v34, &location);
    uint64_t v31 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureHandle = v29->_stateCaptureHandle;
    v29->_stateCaptureHandle = (BSInvalidatable *)v31;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v37);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 64);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_2;
  v12[3] = &unk_1E6AA46D8;
  id v3 = (id *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 40));
  [v2 observeData:v12];
  id v4 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_4;
  uint64_t v10 = &unk_1E6AA4700;
  objc_copyWeak(&v11, v3);
  [v4 observeData:&v7];
  BOOL v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "data", v7, v8, v9, v10);
  int v6 = [*(id *)(*(void *)(a1 + 32) + 72) data];
  -[STUIDataAccessStatusDomain _internalQueue_updateDataForLocationData:mediaData:](*(dispatch_queue_t **)(a1 + 32), v5, v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
}

__CFString *__51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained data];
  id v3 = [v2 description];
  id v4 = v3;
  if (!v3) {
    id v3 = @"(empty)";
  }
  BOOL v5 = v3;

  return v5;
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    [(BSInvalidatable *)self->_stateCaptureHandle invalidate];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    activeAttributionMinimumDisplayTimers = self->_activeAttributionMinimumDisplayTimers;
  }
  else
  {
    [0 invalidate];
    activeAttributionMinimumDisplayTimers = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
  }
  id v4 = [(NSMutableDictionary *)activeAttributionMinimumDisplayTimers allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) invalidate];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  if (self) {
    recentAttributionExpirationTimers = self->_recentAttributionExpirationTimers;
  }
  else {
    recentAttributionExpirationTimers = 0;
  }
  uint64_t v10 = [(NSMutableDictionary *)recentAttributionExpirationTimers allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * j) invalidate];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  v15.receiver = self;
  v15.super_class = (Class)STUIDataAccessStatusDomain;
  [(STStatusDomain *)&v15 dealloc];
}

- (id)data
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__STUIDataAccessStatusDomain_data__block_invoke;
  v5[3] = &unk_1E6AA3860;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__STUIDataAccessStatusDomain_data__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInvalidated] & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      id v3 = *(void **)(v2 + 80);
    }
    else {
      id v3 = 0;
    }
    id v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v4, v3);
  }
}

- (void)invalidate
{
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__STUIDataAccessStatusDomain_invalidate__block_invoke;
  block[3] = &unk_1E6AA37A0;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

id __40__STUIDataAccessStatusDomain_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 64);
  }
  else {
    id v3 = 0;
  }
  [v3 invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 72);
  }
  else {
    uint64_t v5 = 0;
  }
  [v5 invalidate];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)STUIDataAccessStatusDomain;
  return objc_msgSendSuper2(&v7, sel_invalidate);
}

- (void)_internalQueue_beginWaitingForLingerTimeForAttribution:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v4 = a1[14];
    [v4 addObject:v3];

    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F4F6F0]) initWithIdentifier:@"STUIDataAccessStatusDomain-LingerTime"];
    id v6 = a1[15];
    [v6 setObject:v5 forKey:v3];

    id v7 = a1[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__STUIDataAccessStatusDomain__internalQueue_beginWaitingForLingerTimeForAttribution___block_invoke;
    v8[3] = &unk_1E6AA47E0;
    objc_copyWeak(&v10, &location);
    id v9 = v3;
    [v5 scheduleWithFireInterval:v7 leewayInterval:v8 queue:0.05 handler:0.05];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __94__STUIDataAccessStatusDomain__internalQueue_beginWaitingForMinimumDisplayTime_forAttribution___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [v4 invalidate];

  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = (void *)*((void *)WeakRetained + 13);
  }
  [v5 removeObjectForKey:*(void *)(a1 + 32)];
  id v6 = WeakRetained;
  if (WeakRetained) {
    id v6 = (void *)*((void *)WeakRetained + 12);
  }
  [v6 removeObject:*(void *)(a1 + 32)];
  -[STUIDataAccessStatusDomain _internalQueue_beginWaitingForLingerTimeForAttribution:]((id *)WeakRetained, *(void **)(a1 + 32));
}

void __85__STUIDataAccessStatusDomain__internalQueue_beginWaitingForLingerTimeForAttribution___block_invoke(uint64_t a1, void *a2)
{
  id v4 = (id *)(a1 + 40);
  id v5 = a2;
  val = (id *)objc_loadWeakRetained(v4);
  [v5 invalidate];

  id v6 = val;
  if (val) {
    id v6 = (id *)val[15];
  }
  [v6 removeObjectForKey:*(void *)(a1 + 32)];
  id v7 = val;
  if (val) {
    id v7 = (id *)val[14];
  }
  [v7 removeObject:*(void *)(a1 + 32)];
  id v8 = *(id *)(a1 + 32);
  if (val)
  {
    objc_initWeak(&location, val);
    id v9 = v8;
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = [v9 dataAccessType];
    if (v11 == 2)
    {
      long long v16 = [STUIDataAccessAttribution alloc];
      uint64_t v13 = [v9 locationAttribution];
      uint64_t v14 = [v9 accessStartDate];
      uint64_t v15 = [(STUIDataAccessAttribution *)v16 initWithLocationAttribution:v13 recent:1 startDate:v14 endDate:v10];
    }
    else if (v11 == 1)
    {
      long long v17 = [STUIDataAccessAttribution alloc];
      uint64_t v13 = [v9 cameraCaptureAttribution];
      uint64_t v14 = [v9 accessStartDate];
      uint64_t v15 = [(STUIDataAccessAttribution *)v17 initWithCameraCaptureAttribution:v13 recent:1 startDate:v14 endDate:v10];
    }
    else
    {
      if (v11)
      {
LABEL_13:

        id v18 = val[16];
        [v18 addObject:v2];

        long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F4F6F0]) initWithIdentifier:@"STUIDataAccessStatusDomain-RecentAttributionExpiration"];
        id v20 = val[17];
        [v20 setObject:v19 forKey:v2];

        id v21 = val[5];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __67__STUIDataAccessStatusDomain__internalQueue_makeAttributionRecent___block_invoke;
        v27[3] = &unk_1E6AA47E0;
        objc_copyWeak(&v29, &location);
        id v22 = v2;
        id v28 = v22;
        [v19 scheduleWithFireInterval:v21 leewayInterval:v27 queue:15.0 handler:0.5];

        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
        goto LABEL_14;
      }
      uint64_t v12 = [STUIDataAccessAttribution alloc];
      uint64_t v13 = [v9 audioRecordingActivityAttribution];
      uint64_t v14 = [v9 accessStartDate];
      uint64_t v15 = [(STUIDataAccessAttribution *)v12 initWithAudioRecordingActivityAttribution:v13 recent:1 startDate:v14 endDate:v10];
    }
    uint64_t v2 = (void *)v15;

    goto LABEL_13;
  }
LABEL_14:

  uint64_t v24 = -[STUIDataAccessStatusDomain _internalQueue_generatedData]((dispatch_queue_t *)val);
  uint64_t v25 = (uint64_t)val;
  if (val)
  {
    objc_setProperty_nonatomic_copy(val, v23, v24, 80);
    uint64_t v25 = (uint64_t)val;
  }
  -[STUIDataAccessStatusDomain _internalQueue_notifyClientsOfData:](v25, v24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentAttributionExpirationTimers, 0);
  objc_storeStrong((id *)&self->_recentAttributions, 0);
  objc_storeStrong((id *)&self->_activeAttributionLingerTimers, 0);
  objc_storeStrong((id *)&self->_attributionsWaitingForLingerTime, 0);
  objc_storeStrong((id *)&self->_activeAttributionMinimumDisplayTimers, 0);
  objc_storeStrong((id *)&self->_attributionsWaitingForMinimumDisplayTime, 0);
  objc_storeStrong((id *)&self->_activeAttributions, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_mediaDomain, 0);
  objc_storeStrong((id *)&self->_locationDomain, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end