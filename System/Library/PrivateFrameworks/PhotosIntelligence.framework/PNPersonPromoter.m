@interface PNPersonPromoter
+ (BOOL)_writePersonPromoterInformation:(id)a3 atURL:(id)a4;
+ (BOOL)hasProcessedForLibrary:(id)a3;
+ (BOOL)isEnabled;
+ (id)_personPromoterInformationAtURL:(id)a3;
+ (id)requestSuggestedMePersonIdentifierAtURL:(id)a3 withError:(id *)a4;
+ (unint64_t)numberOfFacesProcessedOnLastRunAtURL:(id)a3;
+ (void)cumulativeNormalDistributionWithData:(id)a3 sigmaFactor:(double)a4 usingBlock:(id)a5;
+ (void)probabilityDensityNormalDistributionWithData:(id)a3 sigmaFactor:(double)a4 usingBlock:(id)a5;
+ (void)setProcessed:(BOOL)a3 forLibrary:(id)a4;
- (BOOL)_personClusterShouldBeVerified:(id)a3;
- (BOOL)_promoteInterestingPersons:(id)a3 updateBlock:(id)a4;
- (BOOL)isInQuiescentState;
- (BOOL)promoteUnverifiedPersonsWithUpdateBlock:(id)a3;
- (NSMutableDictionary)metricsReport;
- (NSNumber)quiescentState;
- (PNPersonClusterManager)personClusterManager;
- (PNPersonDeduperProfile)deduperProfile;
- (PNPersonPromoter)initWithPhotoLibrary:(id)a3 andDelegate:(id)a4;
- (PNPersonPromoterDelegate)delegate;
- (PNPersonPromoterProfile)promoterProfile;
- (PNPhotoLibraryProtocol)photoLibrary;
- (double)_personTimespan:(id)a3;
- (float)faceProcessingProgress;
- (id)_graphOrderedPersonsWithPersons:(id)a3 withAllPersons:(id)a4 updateBlock:(id)a5;
- (id)_interestingPersonsFromVerifiedPersons:(id)a3 unverifiedPersons:(id)a4 updateBlock:(id)a5;
- (id)_newPersonDeduperWithVerifiedPersons:(id)a3;
- (id)_promoteUnverifiedPersons:(id)a3 withVerifiedPersons:(id)a4 updateBlock:(id)a5;
- (id)_sortedSocialGroups:(id)a3 withPersonsByLocalIdentifier:(id)a4;
- (id)_sortedUnverifiedPersonsToDedupForVerifiedPersons:(id)a3 type:(unint64_t)a4 updateBlock:(id)a5;
- (id)_verifiedPersonsToProcess;
- (id)advancedStatus;
- (id)evaluatePersonPromoterWithUpdateBlock:(id)a3;
- (id)interestingPersonsFromPersons:(id)a3 detectionType:(signed __int16)a4 updateBlock:(id)a5;
- (id)interestingPersonsFromPersons:(id)a3 updateBlock:(id)a4;
- (void)incrementMetricForKey:(id)a3 withValue:(unint64_t)a4;
- (void)reportMetrics;
- (void)setDeduperProfile:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFaceProcessingProgress:(float)a3;
- (void)setPersonClusterManager:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setPromoterProfile:(id)a3;
- (void)setQuiescentState:(id)a3;
@end

@implementation PNPersonPromoter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deduperProfile, 0);
  objc_storeStrong((id *)&self->_promoterProfile, 0);
  objc_storeStrong((id *)&self->_quiescentState, 0);
  objc_storeStrong((id *)&self->_metricsReport, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_personClusterManager, 0);
}

- (void)setDeduperProfile:(id)a3
{
}

- (PNPersonDeduperProfile)deduperProfile
{
  return self->_deduperProfile;
}

- (void)setPromoterProfile:(id)a3
{
}

- (PNPersonPromoterProfile)promoterProfile
{
  return self->_promoterProfile;
}

- (void)setFaceProcessingProgress:(float)a3
{
  self->_faceProcessingProgress = a3;
}

- (float)faceProcessingProgress
{
  return self->_faceProcessingProgress;
}

- (void)setQuiescentState:(id)a3
{
}

- (NSNumber)quiescentState
{
  return self->_quiescentState;
}

- (NSMutableDictionary)metricsReport
{
  return self->_metricsReport;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PNPhotoLibraryProtocol)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setDelegate:(id)a3
{
}

- (PNPersonPromoterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PNPersonPromoterDelegate *)WeakRetained;
}

- (void)setPersonClusterManager:(id)a3
{
}

- (PNPersonClusterManager)personClusterManager
{
  return self->_personClusterManager;
}

- (id)_sortedSocialGroups:(id)a3 withPersonsByLocalIdentifier:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263F08968]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, objc_msgSend(v5, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v39;
          double v15 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v39 != v14) {
                objc_enumerationMutation(v12);
              }
              v17 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v38 + 1) + 8 * j)];
              [v17 interestingScore];
              double v19 = v18;

              double v15 = v15 + v19;
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v13);
        }
        else
        {
          double v15 = 0.0;
        }

        unint64_t v20 = [v12 count];
        v21 = [NSNumber numberWithDouble:v15 / (double)v20];
        [v7 setObject:v21 forKey:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v8);
  }

  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __69__PNPersonPromoter__sortedSocialGroups_withPersonsByLocalIdentifier___block_invoke;
  v36[3] = &unk_26544ED78;
  id v22 = v7;
  id v37 = v22;
  v23 = [obj sortedArrayUsingComparator:v36];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__303;
  v34 = __Block_byref_object_dispose__304;
  id v35 = [v23 firstObject];
  if ((unint64_t)[(id)v31[5] count] >= 3)
  {
    v24 = (void *)v31[5];
    v31[5] = 0;
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __69__PNPersonPromoter__sortedSocialGroups_withPersonsByLocalIdentifier___block_invoke_2;
  v29[3] = &unk_26544EDA0;
  v29[4] = &v30;
  v25 = [MEMORY[0x263F08A98] predicateWithBlock:v29];
  v26 = [v23 filteredArrayUsingPredicate:v25];

  _Block_object_dispose(&v30, 8);

  return v26;
}

uint64_t __69__PNPersonPromoter__sortedSocialGroups_withPersonsByLocalIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKey:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v8 compare:v7];
  return v9;
}

BOOL __69__PNPersonPromoter__sortedSocialGroups_withPersonsByLocalIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (unint64_t)[v3 count] > 2
    || *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) == (void)v3;

  return v4;
}

- (id)_graphOrderedPersonsWithPersons:(id)a3 withAllPersons:(id)a4 updateBlock:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v60 != v13) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "localIdentifier", v42);
        [v10 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v12);
  }

  v17 = [(PNPersonPromoter *)self delegate];
  double v18 = [(PNPersonPromoter *)self personClusterManager];
  long long v43 = v9;
  double v19 = [v17 performSocialGroupsIdentifiersWithPersonClusterManager:v18 forPersons:obj overTheYearsComputation:0 updateBlock:v9];

  unint64_t v20 = [(PNPersonPromoter *)self _sortedSocialGroups:v19 withPersonsByLocalIdentifier:v10];

  v21 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"highlyInteresting" ascending:0];
  v67[0] = v21;
  id v22 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"interestingScore" ascending:0];
  v67[1] = v22;
  v23 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"localIdentifier" ascending:0];
  v67[2] = v23;
  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:3];

  v46 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v44 = v20;
  uint64_t v24 = [v44 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v48 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v56 != v48) {
          objc_enumerationMutation(v44);
        }
        v27 = *(void **)(*((void *)&v55 + 1) + 8 * j);
        v28 = objc_opt_new();
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v29 = v27;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v65 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v52;
          do
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v52 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v51 + 1) + 8 * k);
              id v35 = objc_msgSend(v10, "objectForKeyedSubscript:", v34, v42);
              if (v35)
              {
                [v28 addObject:v35];
                [v10 removeObjectForKey:v34];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v51 objects:v65 count:16];
          }
          while (v31);
        }

        if (v28)
        {
          [v28 sortUsingDescriptors:v47];
          [v46 addObjectsFromArray:v28];
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v28;
            _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter][Order] Add from social group: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v25 = [v44 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v25);
  }

  v36 = [v10 allValues];
  if ([v36 count])
  {
    id v37 = [v36 sortedArrayUsingDescriptors:v47];
    [v46 addObjectsFromArray:v37];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v37;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter][Order] Rest of people %@", buf, 0xCu);
    }
  }
  long long v38 = (void *)MEMORY[0x263F08A98];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __79__PNPersonPromoter__graphOrderedPersonsWithPersons_withAllPersons_updateBlock___block_invoke;
  v49[3] = &unk_26544ED50;
  id v50 = v42;
  id v39 = v42;
  long long v40 = [v38 predicateWithBlock:v49];
  [v46 filterUsingPredicate:v40];

  return v46;
}

uint64_t __79__PNPersonPromoter__graphOrderedPersonsWithPersons_withAllPersons_updateBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (BOOL)_promoteInterestingPersons:(id)a3 updateBlock:(id)a4
{
  v125[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v67 = (void (**)(id, uint64_t, float))a4;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x2020000000;
  char v114 = 0;
  long long v53 = [(PNPersonPromoter *)self photoLibrary];
  long long v55 = objc_opt_new();
  v65 = objc_opt_new();
  v66 = objc_opt_new();
  long long v54 = self;
  id v8 = [(PNPersonPromoter *)self delegate];
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x2020000000;
  uint64_t v110 = 0;
  id v9 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  v10 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"manualOrder" ascending:1];
  v125[0] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:1];
  long long v61 = [v6 sortedArrayUsingDescriptors:v11];

  unint64_t v12 = 0;
  uint64_t v58 = *MEMORY[0x263F150E0];
  uint64_t v13 = *MEMORY[0x263F150F8];
  while (v12 < objc_msgSend(v61, "count", v53) - 1)
  {
    uint64_t v14 = [v61 objectAtIndexedSubscript:v12];
    uint64_t v15 = [v14 manualOrder];

    v16 = [v61 objectAtIndexedSubscript:v12 + 1];
    uint64_t v17 = [v16 manualOrder];

    if (v15 == v58 || v17 == v58) {
      break;
    }
    if (v17 - v15 < v13) {
      v108[3] = v17;
    }
    ++v12;
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = v6;
  uint64_t v18 = [obj countByEnumeratingWithState:&v103 objects:v124 count:16];
  if (v18)
  {
    uint64_t v59 = *(void *)v104;
    do
    {
      uint64_t v64 = 0;
      uint64_t v60 = v18;
      do
      {
        if (*(void *)v104 != v59) {
          objc_enumerationMutation(obj);
        }
        v63 = *(void **)(*((void *)&v103 + 1) + 8 * v64);
        context = (void *)MEMORY[0x25A2E0AC0]();
        v67[2](v67, (uint64_t)(v112 + 3), 0.9);
        if (*((unsigned char *)v112 + 24))
        {
          int v19 = 1;
        }
        else if ([v63 hidden])
        {
          int v19 = 6;
        }
        else
        {
          unint64_t v20 = [v63 manualOrder];
          long long v57 = [v63 mergedPersonIdentifiers];
          if ([v63 isVerified])
          {
            if ([v63 verifiedType] == 1 && v20 == v58 || objc_msgSend(v63, "verifiedType") == 2)
            {
              [v55 addObject:v63];
            }
            else if ([v63 verifiedType] == 1 && v20 > v108[3])
            {
              v108[3] = v20;
            }
          }
          else
          {
            v21 = (void *)MEMORY[0x25A2E0AC0]();
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v63;
              _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[PersonPromoter] Upgrading person %@", buf, 0xCu);
            }
            id v22 = [v63 sourcePerson];
            uint64_t v23 = [v63 mergedPersonIdentifiers];

            uint64_t v24 = [v8 keyFaceForPerson:v22 qualityMeasureByFace:v9 updateBlock:v67];
            if (v24)
            {
              uint64_t v25 = [v22 localIdentifier];
              [v66 setObject:v24 forKeyedSubscript:v25];
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v63;
              _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "-[PNPersonPromoterDelegate keyFaceForPerson:] Returned nil key face on %@", buf, 0xCu);
            }
            [v55 addObject:v63];

            long long v57 = (void *)v23;
          }
          v26 = [(PNPersonPromoter *)v54 photoLibrary];
          v27 = [v57 allObjects];
          v28 = objc_msgSend(v26, "pn_fetchPersonsWithLocalIdentifiers:", v27);

          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          id v29 = v28;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v99 objects:v123 count:16];
          if (v30)
          {
            uint64_t v31 = *(void *)v100;
            do
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v100 != v31) {
                  objc_enumerationMutation(v29);
                }
                v33 = *(void **)(*((void *)&v99 + 1) + 8 * i);
                uint64_t v34 = [v33 keyFace];
                BOOL v35 = v34 == 0;

                if (v35)
                {
                  v36 = (void *)MEMORY[0x25A2E0AC0]();
                  id v37 = [v8 keyFaceForPerson:v33 qualityMeasureByFace:v9 updateBlock:v67];
                  if (v37)
                  {
                    long long v38 = [v33 localIdentifier];
                    [v66 setObject:v37 forKeyedSubscript:v38];

                    [v65 addObject:v33];
                  }
                  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v63;
                    _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "-[PNPersonPromoterDelegate keyFaceForPerson:] Returned nil key face on %@", buf, 0xCu);
                  }
                }
              }
              uint64_t v30 = [v29 countByEnumeratingWithState:&v99 objects:v123 count:16];
            }
            while (v30);
          }

          int v19 = 0;
        }
        if (v19 != 6 && v19)
        {
          id v41 = 0;
          char v42 = 0;
          id v43 = obj;
          goto LABEL_54;
        }
        ++v64;
      }
      while (v64 != v60);
      uint64_t v18 = [obj countByEnumeratingWithState:&v103 objects:v124 count:16];
    }
    while (v18);
  }

  v98[0] = MEMORY[0x263EF8330];
  v98[1] = 3221225472;
  v98[2] = __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke;
  v98[3] = &unk_26544ECD8;
  v98[4] = &v107;
  id v39 = [MEMORY[0x263F08A98] predicateWithBlock:v98];
  [v55 filterUsingPredicate:v39];

  uint64_t v40 = [v55 count];
  if (!*((unsigned char *)v112 + 24))
  {
    uint64_t v45 = v40;
    if (v40)
    {
      v46 = &_os_log_internal;
      id v47 = &_os_log_internal;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        uint64_t v48 = [obj count];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v45;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v48;
        _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter] Sorting %lu persons, with a total of %lu persons.", buf, 0x16u);
      }

      v95[0] = MEMORY[0x263EF8330];
      v95[1] = 3221225472;
      v95[2] = __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke_443;
      v95[3] = &unk_26544ED00;
      v96 = v67;
      v97 = &v111;
      id v43 = [(PNPersonPromoter *)v54 _graphOrderedPersonsWithPersons:v55 withAllPersons:obj updateBlock:v95];

      if (*((unsigned char *)v112 + 24))
      {
        id v41 = 0;
        char v42 = 0;
LABEL_54:

        goto LABEL_55;
      }
    }
    else
    {
      id v43 = 0;
    }
    uint64_t v91 = 0;
    v92 = &v91;
    uint64_t v93 = 0x2020000000;
    uint64_t v94 = 0;
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x2020000000;
    uint64_t v90 = 0;
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x2020000000;
    uint64_t v86 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v120 = __Block_byref_object_copy__303;
    v121 = __Block_byref_object_dispose__304;
    id v122 = [MEMORY[0x263EFF9C0] set];
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke_444;
    v69[3] = &unk_26544ED28;
    id v70 = v9;
    v71 = v54;
    id v72 = obj;
    id v73 = v66;
    v77 = &v83;
    v78 = buf;
    v79 = &v91;
    id v49 = v53;
    id v74 = v49;
    v80 = &v87;
    id v75 = v65;
    v81 = &v107;
    uint64_t v82 = v45;
    id v43 = v43;
    id v76 = v43;
    id v68 = 0;
    char v42 = objc_msgSend(v49, "pn_performChangesAndWait:error:", v69, &v68);
    id v41 = v68;
    if (v42)
    {
      [(PNPersonPromoter *)v54 incrementMetricForKey:@"numberOfPersonsPromotedToGraphVerified" withValue:v92[3]];
      [(PNPersonPromoter *)v54 incrementMetricForKey:@"numberOfGraphMergeCandidatesAdded" withValue:v88[3]];
      [(PNPersonPromoter *)v54 incrementMetricForKey:@"numberOfFacesAvailableInPeopleHome" withValue:v84[3]];
      -[PNPersonPromoter incrementMetricForKey:withValue:](v54, "incrementMetricForKey:withValue:", @"numberOfAssetsAvailableInPeopleHome", [*(id *)(*(void *)&buf[8] + 40) count]);
      [(PNPersonPromoter *)v54 reportMetrics];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v115 = 138412546;
      CFAbsoluteTime v116 = *(double *)&v49;
      __int16 v117 = 2112;
      id v118 = v41;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[PersonPromoter] Failed to perform changes on library %@: %@", v115, 0x16u);
    }
    id v50 = &_os_log_internal;
    id v51 = &_os_log_internal;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      CFAbsoluteTime v52 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)v115 = 134217984;
      CFAbsoluteTime v116 = v52 - Current;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter][Perf] Promote Interesting Persons took %fs", v115, 0xCu);
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v83, 8);
    _Block_object_dispose(&v87, 8);
    _Block_object_dispose(&v91, 8);
    goto LABEL_54;
  }
  id v41 = 0;
  char v42 = 0;
LABEL_55:

  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(&v111, 8);

  return v42;
}

BOOL __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 manualOrder];
  return !v3 || v3 > *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke_443(uint64_t a1, unsigned char *a2, float a3)
{
  float v5 = a3 * 0.1 + 0.9;
  uint64_t result = (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(v5);
  *a2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

void __59__PNPersonPromoter__promoteInterestingPersons_updateBlock___block_invoke_444(uint64_t a1)
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  v1 = [*(id *)(a1 + 32) keyEnumerator];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v121 objects:v137 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v122 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v121 + 1) + 8 * i);
        v7 = [*(id *)(a1 + 32) objectForKey:v6];
        objc_msgSend(v6, "setQualityMeasure:", objc_msgSend(v7, "integerValue"));
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v121 objects:v137 count:16];
    }
    while (v3);
  }

  id v8 = [*(id *)(a1 + 40) personClusterManager];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  obuint64_t j = *(id *)(a1 + 48);
  uint64_t v9 = [obj countByEnumeratingWithState:&v117 objects:v136 count:16];
  uint64_t v87 = v8;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v118;
    uint64_t v89 = *(void *)v118;
    do
    {
      uint64_t v12 = 0;
      uint64_t v90 = v10;
      do
      {
        if (*(void *)v118 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(char **)(*((void *)&v117 + 1) + 8 * v12);
        context = (void *)MEMORY[0x25A2E0AC0]();
        if (([v13 isVerified] & 1) == 0)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v126 = v13;
            _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[PersonPromoter] Upgrading person %@", buf, 0xCu);
          }
          uint64_t v14 = objc_msgSend(v13, "sourcePerson", v87);
          uint64_t v15 = *(void **)(a1 + 56);
          v16 = [v14 localIdentifier];
          uint64_t v17 = [v15 objectForKeyedSubscript:v16];

          if (v17) {
            [v14 setKeyFace:v17];
          }
          [v13 setIsVerified:1];
          *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) += [v14 faceCount];
          uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
          [v13 sourcePersonBackingAssetIdentifiers];
          v20 = int v19 = v13;
          [v18 unionSet:v20];

          uint64_t v13 = v19;
          ++*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
        }
        objc_msgSend(v13, "mergedPersonIdentifiers", v87);
        v21 = (char *)objc_claimAutoreleasedReturnValue();
        if ([v21 count])
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v126 = v21;
            __int16 v127 = 2112;
            v128 = v13;
            _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[PersonPromoter] Adding %@ to person %@", buf, 0x16u);
          }
          id v22 = *(void **)(a1 + 64);
          uint64_t v23 = [v21 allObjects];
          uint64_t v24 = objc_msgSend(v22, "pn_fetchPersonsWithLocalIdentifiers:", v23);

          uint64_t v25 = v24;
          objc_msgSend(v13, "pn_addMergeCandidatePersons:", v24);
          *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) += [v24 count];
          v26 = v13;
          Class v27 = NSClassFromString(&cfstr_Phpersonchange.isa);
          id v98 = objc_alloc_init(MEMORY[0x263EFF980]);
          if (v27)
          {
            uint64_t v94 = v12;
            v92 = v26;
            [v26 localIdentifier];
            uint64_t v93 = v21;
            v96 = (char *)objc_claimAutoreleasedReturnValue();
            long long v99 = objc_msgSend(v21, "setByAddingObject:");
            long long v113 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            id v28 = v25;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v113 objects:v135 count:16];
            v97 = v25;
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v114;
              do
              {
                uint64_t v32 = 0;
                do
                {
                  if (*(void *)v114 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = *(void **)(*((void *)&v113 + 1) + 8 * v32);
                  if (([v33 isVerified] & 1) == 0)
                  {
                    uint64_t v34 = [[PNPersonCluster alloc] initWithPerson:v33 inPhotoLibrary:*(void *)(a1 + 64)];
                    BOOL v35 = [(PNPersonCluster *)v34 localIdentifier];
                    [v8 mergeConfidenceBetweenPersonLocalIdentifier:v35 andCandidateLocalIdentifiers:v99];
                    if (v36 >= 0.0)
                    {
                      double v38 = v36;
                      id v39 = [(objc_class *)v27 changeRequestForPerson:v33];
                      [v39 setMergeCandidateConfidence:v38];
                      [v98 addObject:v33];

                      uint64_t v25 = v97;
                    }
                    else
                    {
                      [v33 mergeCandidateConfidence];
                      if (v37 == 0.0)
                      {
                        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          v126 = v35;
                          __int16 v127 = 2112;
                          v128 = v96;
                          _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[PersonPromoter] no confidence between %@ and %@, skip", buf, 0x16u);
                        }
                      }
                      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        v126 = v35;
                        __int16 v127 = 2112;
                        v128 = v96;
                        _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter] no confidence between %@ and %@, skip", buf, 0x16u);
                      }
                    }
                  }
                  ++v32;
                }
                while (v30 != v32);
                uint64_t v40 = [v28 countByEnumeratingWithState:&v113 objects:v135 count:16];
                uint64_t v30 = v40;
              }
              while (v40);
            }

            if ([v98 count])
            {
              Class v41 = NSClassFromString(&cfstr_Phperson.isa);
              long long v109 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              long long v112 = 0u;
              id v42 = v98;
              uint64_t v43 = [v42 countByEnumeratingWithState:&v109 objects:v134 count:16];
              if (v43)
              {
                uint64_t v44 = v43;
                uint64_t v45 = *(void *)v110;
                do
                {
                  for (uint64_t j = 0; j != v44; ++j)
                  {
                    if (*(void *)v110 != v45) {
                      objc_enumerationMutation(v42);
                    }
                    id v47 = *(void **)(*((void *)&v109 + 1) + 8 * j);
                    uint64_t v48 = (void *)MEMORY[0x25A2E0AC0]();
                    id v49 = [(objc_class *)v41 fetchMergeCandidateWithConfidencePersonsForPerson:v47 options:0];
                    if ([v49 count])
                    {
                      id v50 = [(objc_class *)v27 changeRequestForPerson:v47];
                      [v50 removeMergeCandidateWithConfidencePersons:v49];
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                      {
                        id v51 = [v47 localIdentifier];
                        *(_DWORD *)buf = 138412290;
                        v126 = v51;
                        _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[PersonPromoter] removing existing merge candidates with confidence for %@", buf, 0xCu);
                      }
                    }
                  }
                  uint64_t v44 = [v42 countByEnumeratingWithState:&v109 objects:v134 count:16];
                }
                while (v44);
              }

              CFAbsoluteTime v52 = [v92 sourcePerson];
              id v8 = v87;
              if (!v52)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v59 = [v92 localIdentifier];
                  *(_DWORD *)buf = 138412290;
                  v126 = v59;
                  _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[PersonPromoter] verifiedPHPerson is nil for %@", buf, 0xCu);
                }
                long long v53 = *(void **)(a1 + 64);
                long long v54 = [v92 localIdentifier];
                v133 = v54;
                long long v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v133 count:1];
                long long v56 = objc_msgSend(v53, "pn_fetchPersonsWithLocalIdentifiers:", v55);
                long long v57 = [v56 fetchedObjects];
                CFAbsoluteTime v52 = [v57 firstObject];
              }
              uint64_t v58 = [(objc_class *)v27 changeRequestForPerson:v52];
              [v58 addMergeCandidateWithConfidencePersons:v42];

              uint64_t v25 = v97;
            }

            uint64_t v11 = v89;
            uint64_t v10 = v90;
            v21 = v93;
            uint64_t v12 = v94;
          }
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v117 objects:v136 count:16];
    }
    while (v10);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v60 = *(id *)(a1 + 72);
  uint64_t v61 = [v60 countByEnumeratingWithState:&v105 objects:v132 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v106;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v106 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = *(void **)(*((void *)&v105 + 1) + 8 * k);
        v66 = *(void **)(a1 + 56);
        v67 = objc_msgSend(v65, "localIdentifier", v87);
        id v68 = [v66 objectForKeyedSubscript:v67];

        if (v68) {
          [v65 setKeyFace:v68];
        }
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v105 objects:v132 count:16];
    }
    while (v62);
  }

  unint64_t v69 = *(void *)(a1 + 128);
  if (v69)
  {
    unint64_t v70 = *MEMORY[0x263F150F8];
    unint64_t v71 = (*MEMORY[0x263F150E0] - v70) / v69;
    if (v71 <= 1) {
      unint64_t v71 = 1;
    }
    do
    {
      unint64_t v72 = v70;
      v70 >>= 1;
    }
    while (v72 > v71);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v86 = *(char **)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      v126 = v86;
      _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[PersonPromoter] highestUserManualOrder %lu", buf, 0xCu);
    }
    id v73 = *(char **)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
    uint64_t v74 = objc_msgSend(*(id *)(a1 + 48), "count", v87);
    uint64_t v75 = *(void *)(a1 + 128);
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v76 = *(id *)(a1 + 80);
    uint64_t v77 = [v76 countByEnumeratingWithState:&v101 objects:v131 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      v79 = (char *)(v74 - v75);
      uint64_t v80 = *(void *)v102;
      unint64_t v81 = *MEMORY[0x263F150E8];
      uint64_t v82 = &_os_log_internal;
      do
      {
        for (uint64_t m = 0; m != v78; ++m)
        {
          if (*(void *)v102 != v80) {
            objc_enumerationMutation(v76);
          }
          v84 = *(void **)(*((void *)&v101 + 1) + 8 * m);
          if ((unint64_t)&v73[v72] >= v81) {
            id v73 = (char *)v81;
          }
          else {
            v73 += v72;
          }
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v85 = v79++;
            *(_DWORD *)buf = 134218498;
            v126 = v85;
            __int16 v127 = 2048;
            v128 = v73;
            __int16 v129 = 2112;
            v130 = v84;
            _os_log_debug_impl(&dword_25934C000, v82, OS_LOG_TYPE_DEBUG, "[PersonPromoter] Setting index %lu (manual order %lu) to person %@.", buf, 0x20u);
          }
          [v84 setManualOrder:v73];
        }
        uint64_t v78 = [v76 countByEnumeratingWithState:&v101 objects:v131 count:16];
      }
      while (v78);
    }

    id v8 = v88;
  }
}

- (id)_interestingPersonsFromVerifiedPersons:(id)a3 unverifiedPersons:(id)a4 updateBlock:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PNPersonPromoter isInQuiescentState](self, "isInQuiescentState") && ![v8 count])
  {
    Class v27 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_433];
    uint64_t v11 = [v9 filteredSetUsingPredicate:v27];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v38 = [v11 count];
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter] No verified persons, result with lower thresholds: %lu", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = v8;
  }
  if ([v11 count])
  {
    uint64_t v12 = [(PNPersonPromoter *)self interestingPersonsFromPersons:v11 updateBlock:v10];
    uint64_t v13 = (void *)[v12 mutableCopy];

    if (v13)
    {
      uint64_t v14 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_436];
      uint64_t v15 = [v11 filteredSetUsingPredicate:v14];

      [v13 unionSet:v15];
      if ((unint64_t)[v13 count] <= 9)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = [v13 count];
          *(_DWORD *)buf = 134218240;
          uint64_t v38 = v16;
          __int16 v39 = 2048;
          uint64_t v40 = 10;
          _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter] No enough interesting persons %lu < %lu, including more persons.", buf, 0x16u);
        }
        uint64_t v17 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"interestingScore" ascending:0];
        float v36 = v17;
        uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
        int v19 = [v11 sortedArrayUsingDescriptors:v18];

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
LABEL_11:
          uint64_t v24 = 0;
          while (1)
          {
            if (*(void *)v32 != v23) {
              objc_enumerationMutation(v20);
            }
            objc_msgSend(v13, "addObject:", *(void *)(*((void *)&v31 + 1) + 8 * v24), (void)v31);
            if ((unint64_t)[v13 count] > 9) {
              break;
            }
            if (v22 == ++v24)
            {
              uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
              if (v22) {
                goto LABEL_11;
              }
              break;
            }
          }
        }
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = [v15 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v38 = v28;
        __int16 v39 = 2112;
        uint64_t v40 = (uint64_t)v15;
        _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[PersonPromoter] previouslyVerifiedPersons (%lu): %@", buf, 0x16u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = [v11 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v38 = v29;
        __int16 v39 = 2112;
        uint64_t v40 = (uint64_t)v11;
        _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[PersonPromoter] verifiedPersons (%lu): %@", buf, 0x16u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = [v13 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v38 = v30;
        __int16 v39 = 2112;
        uint64_t v40 = (uint64_t)v13;
        _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[PersonPromoter] interestingPersons (%lu): %@", buf, 0x16u);
      }
      id v25 = v13;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter] People Home Graph will be empty: Still having no interesting persons", buf, 2u);
    }
    uint64_t v13 = [MEMORY[0x263EFFA08] set];
  }

  return v13;
}

uint64_t __89__PNPersonPromoter__interestingPersonsFromVerifiedPersons_unverifiedPersons_updateBlock___block_invoke_434(uint64_t a1, void *a2)
{
  return [a2 isVerified];
}

BOOL __89__PNPersonPromoter__interestingPersonsFromVerifiedPersons_unverifiedPersons_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 backingMomentIdentifiers];
  if ((unint64_t)[v3 count] < 2)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v4 = [v2 backingFaceIdentifiers];
    if ((unint64_t)[v4 count] < 0xA)
    {
      BOOL v7 = 0;
    }
    else
    {
      float v5 = [v2 sourcePerson];
      if ((unint64_t)[v5 faceCount] < 7)
      {
        BOOL v7 = 0;
      }
      else
      {
        [v2 libraryTimespan];
        BOOL v7 = v6 >= 86400.0;
      }
    }
  }

  return v7;
}

- (BOOL)_personClusterShouldBeVerified:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 quarantined])
  {
    BOOL v5 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      double v23 = *(double *)&v4;
      double v6 = &_os_log_internal;
      BOOL v7 = "[PersonPromoter] Cannot promote quarantined person %@";
      uint32_t v8 = 12;
LABEL_12:
      _os_log_impl(&dword_25934C000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v22, v8);
      BOOL v5 = 0;
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  [v4 sideFaceRatio];
  double v10 = v9;
  if (v9 < 0.5)
  {
    uint64_t v11 = [v4 backingAssetIdentifiers];
    uint64_t v12 = (void *)[v11 mutableCopy];

    uint64_t v13 = [(PNPersonPromoter *)self personClusterManager];
    uint64_t v14 = [v13 assetsToIgnore];
    [v12 minusSet:v14];

    unint64_t v15 = [v12 count];
    LODWORD(v13) = [(PNPersonPromoter *)self isInQuiescentState];
    uint64_t v16 = [v4 backingMomentIdentifiers];
    unint64_t v17 = [v16 count];
    if (v13)
    {
      if (v17 >= 3)
      {
        uint64_t v18 = [v4 backingFaceIdentifiers];
        BOOL v5 = 0;
        if ((unint64_t)[v18 count] < 0xF || v15 <= 0xE) {
          goto LABEL_18;
        }
        double v19 = 604800.0;
LABEL_17:
        [v4 libraryTimespan];
        BOOL v5 = v20 >= v19;
LABEL_18:

LABEL_20:
        goto LABEL_21;
      }
    }
    else if (v17 >= 6)
    {
      uint64_t v18 = [v4 backingFaceIdentifiers];
      BOOL v5 = 0;
      if ((unint64_t)[v18 count] < 0x64 || v15 < 0x32) {
        goto LABEL_18;
      }
      double v19 = 7776000.0;
      goto LABEL_17;
    }
    BOOL v5 = 0;
    goto LABEL_20;
  }
  BOOL v5 = 0;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134218242;
    double v23 = v10;
    __int16 v24 = 2112;
    id v25 = v4;
    double v6 = &_os_log_internal;
    BOOL v7 = "[PersonPromoter] Cannot promote person with too many side faces, %.3f%% - %@";
    uint32_t v8 = 22;
    goto LABEL_12;
  }
LABEL_21:

  return v5;
}

- (id)_sortedUnverifiedPersonsToDedupForVerifiedPersons:(id)a3 type:(unint64_t)a4 updateBlock:(id)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v8 = a3;
  double v9 = (void (**)(id, unsigned char *, double))a5;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v58 = self;
  uint64_t v11 = [(PNPersonPromoter *)self personClusterManager];
  uint64_t v12 = objc_msgSend(v11, "pn_fetchPersonsWithType:", a4);

  if ([v12 count])
  {
    char v71 = 0;
    uint64_t v13 = (void *)MEMORY[0x263EFF980];
    long long v54 = v12;
    uint64_t v14 = [v12 fetchedObjects];
    unint64_t v15 = [v13 arrayWithArray:v14];

    uint64_t v16 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_427];
    long long v57 = v15;
    [v15 filterUsingPredicate:v16];

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v55 = v8;
    obuint64_t j = v8;
    uint64_t v17 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v68;
      uint64_t v49 = *(void *)v68;
      unint64_t v50 = a4;
      while (2)
      {
        uint64_t v20 = 0;
        uint64_t v51 = v18;
        do
        {
          if (*(void *)v68 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v67 + 1) + 8 * v20);
          int v22 = (void *)MEMORY[0x25A2E0AC0]();
          v9[2](v9, &v71, 0.0);
          if (v71)
          {
LABEL_24:
LABEL_25:
            id v36 = 0;
            goto LABEL_48;
          }
          uint64_t v52 = v20;
          context = v22;
          double v23 = [(PNPersonPromoter *)v58 personClusterManager];
          __int16 v24 = objc_msgSend(v23, "pn_fetchCandidatePersonsForPerson:", v21);

          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v25 = v24;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v63 objects:v80 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v64;
            while (2)
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v64 != v28) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v30 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                v9[2](v9, &v71, 0.0);
                if (v71)
                {

                  int v22 = context;
                  goto LABEL_24;
                }
                if (([v30 isVerified] & 1) == 0)
                {
                  long long v31 = (void *)MEMORY[0x25A2E0AC0]();
                  [v57 removeObject:v30];
                  long long v32 = [(PNPersonPromoter *)v58 personClusterManager];
                  v79 = v30;
                  long long v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
                  [v32 mergePersons:v33 withPerson:v21];
                }
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v63 objects:v80 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }

          uint64_t v20 = v52 + 1;
          uint64_t v19 = v49;
          a4 = v50;
        }
        while (v52 + 1 != v51);
        uint64_t v18 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    if (a4)
    {
      long long v34 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sourcePerson.faceCount" ascending:0];
      uint64_t v77 = v34;
      BOOL v35 = &v77;
    }
    else
    {
      long long v34 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sourceFaceGroup.faceCountInFaceGroup" ascending:0];
      uint64_t v78 = v34;
      BOOL v35 = &v78;
    }
    double v37 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v35, 1, v49, v50);
    [v57 sortUsingDescriptors:v37];

    obuint64_t j = (id)objc_opt_new();
    long long v59 = 0u;
    long long v60 = 0u;
    if ([(PNPersonPromoter *)v58 isInQuiescentState]) {
      unint64_t v38 = 7;
    }
    else {
      unint64_t v38 = 25;
    }
    long long v61 = 0uLL;
    long long v62 = 0uLL;
    id v39 = v57;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v59 objects:v76 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v60;
      while (2)
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v60 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          uint64_t v45 = (void *)MEMORY[0x25A2E0AC0]();
          v9[2](v9, &v71, 0.0);
          if (v71)
          {

            goto LABEL_25;
          }
          if ((unint64_t)[obj count] >= 0x180)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
            {
              double v48 = COERCE_DOUBLE([v39 count]);
              *(_DWORD *)buf = 134218240;
              double v73 = v48;
              __int16 v74 = 2048;
              uint64_t v75 = 384;
              _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[PersonPromoter] Too many unverified persons to dedup, truncating the unverified person array. %lu > %lu", buf, 0x16u);
            }
LABEL_44:
            goto LABEL_45;
          }
          if ([v44 faceCount] < v38) {
            goto LABEL_44;
          }
          [obj addObject:v44];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v59 objects:v76 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }
LABEL_45:

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      CFAbsoluteTime v46 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      double v73 = v46 - Current;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter][Perf] Sort Unverified Persons took %fs", buf, 0xCu);
    }
    id v36 = obj;
    obuint64_t j = v36;
LABEL_48:
    uint64_t v12 = v54;
    id v8 = v55;
  }
  else
  {
    id v36 = (id)MEMORY[0x263EFFA68];
  }

  return v36;
}

uint64_t __87__PNPersonPromoter__sortedUnverifiedPersonsToDedupForVerifiedPersons_type_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isVerified] ^ 1;
}

- (id)_verifiedPersonsToProcess
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [(PNPersonPromoter *)self personClusterManager];
  uint64_t v3 = objc_msgSend(v2, "pn_fetchPersonsWithType:", 1);

  if ((unint64_t)[v3 count] < 0x81)
  {
    double v10 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v11 = [v3 fetchedObjects];
    double v9 = [v10 setWithArray:v11];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v15 = [v3 count];
      __int16 v16 = 2048;
      uint64_t v17 = 128;
      _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[PersonPromoter] Too many verified persons to dedup, truncating the verified person array. %lu > %lu", buf, 0x16u);
    }
    id v4 = [v3 fetchedObjects];
    BOOL v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sourcePerson.faceCount" ascending:0];
    uint64_t v13 = v5;
    double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    BOOL v7 = [v4 sortedArrayUsingDescriptors:v6];

    id v8 = objc_msgSend(v7, "subarrayWithRange:", 0, 128);
    double v9 = [MEMORY[0x263EFF9C0] setWithArray:v8];
  }

  return v9;
}

- (id)_newPersonDeduperWithVerifiedPersons:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  __int16 v24 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v25 = *(void *)v32;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(obj);
        }
        BOOL v7 = *(void **)(*((void *)&v31 + 1) + 8 * v6);
        id v8 = [(PNPersonPromoter *)self personClusterManager];
        double v9 = objc_msgSend(v8, "pn_fetchInvalidCandidatePersonsForPerson:", v7);

        if ([v9 count])
        {
          double v10 = objc_opt_new();
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v11 = v9;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v28;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v28 != v14) {
                  objc_enumerationMutation(v11);
                }
                __int16 v16 = [*(id *)(*((void *)&v27 + 1) + 8 * v15) localIdentifier];
                [v10 addObject:v16];

                ++v15;
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v13);
          }

          uint64_t v17 = [v7 localIdentifier];
          [v24 setObject:v10 forKeyedSubscript:v17];
        }
        ++v6;
      }
      while (v6 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v5);
  }

  uint64_t v18 = [PNPersonDeduper alloc];
  uint64_t v19 = [(PNPersonPromoter *)self personClusterManager];
  uint64_t v20 = [(PNPersonDeduper *)v18 initWithPersonClusterManager:v19 andInvalidCandidatesMapping:v24 profile:self->_deduperProfile];

  [(PNPersonDeduper *)v20 setPersonPromoter:self];
  uint64_t v21 = [(PNPersonPromoter *)self delegate];
  [(PNPersonDeduper *)v20 setDelegate:v21];

  return v20;
}

- (id)interestingPersonsFromPersons:(id)a3 detectionType:(signed __int16)a4 updateBlock:(id)a5
{
  int v75 = a4;
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v7 = a3;
  unint64_t v72 = (uint64_t (**)(id, unsigned char *, double))a5;
  char v71 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v70 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v65 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v69 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  id v8 = [(PNPersonPromoter *)self photoLibrary];
  long long v68 = objc_msgSend(v8, "pn_lastAssetDate");

  long long v64 = self->_promoterProfile;
  char v95 = 0;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  double v9 = (PNPersonPromoterProfile *)v7;
  uint64_t v10 = [(PNPersonPromoterProfile *)v9 countByEnumeratingWithState:&v91 objects:v104 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v92;
    obuint64_t j = v9;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v92 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        uint64_t v15 = v72[2](v72, &v95, 0.0);
        if (v95)
        {
          unint64_t v38 = 0;
          double v9 = obj;
          id v39 = obj;
          long long v29 = v64;
          goto LABEL_46;
        }
        __int16 v16 = (void *)MEMORY[0x25A2E0AC0](v15);
        uint64_t v17 = NSNumber;
        uint64_t v18 = [v14 backingMomentIdentifiers];
        uint64_t v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
        [v71 setObject:v19 forKey:v14];

        uint64_t v20 = NSNumber;
        uint64_t v21 = [v14 backingFaceIdentifiers];
        int v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
        [v70 setObject:v22 forKey:v14];

        [(PNPersonPromoter *)self _personTimespan:v14];
        if (v23 > 0.0)
        {
          __int16 v24 = [NSNumber numberWithDouble:v23 / 86400.0];
          [v65 setObject:v24 forKey:v14];
        }
        uint64_t v25 = NSNumber;
        uint64_t v26 = [v14 lastSeenDate];
        [v26 timeIntervalSinceDate:v68];
        long long v28 = [v25 numberWithDouble:fabs(v27) / 86400.0];
        [v69 setObject:v28 forKey:v14];
      }
      double v9 = obj;
      uint64_t v11 = [(PNPersonPromoterProfile *)obj countByEnumeratingWithState:&v91 objects:v104 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke;
  aBlock[3] = &unk_26544EC70;
  long long v29 = v64;
  long long v30 = v64;
  uint64_t v86 = v30;
  id v74 = v71;
  id v87 = v74;
  id v73 = v70;
  id v88 = v73;
  id v31 = v65;
  id v89 = v31;
  id v32 = v69;
  id v90 = v32;
  long long v33 = _Block_copy(aBlock);
  uint64_t v34 = [MEMORY[0x263EFF9C0] set];
  BOOL v35 = (void *)v34;
  id v36 = (uint64_t (*)(void *, uint64_t))v33[2];
  if (v75 == 2)
  {
    id v37 = (id)v36(v33, 0);
    unint64_t v38 = v9;
  }
  else
  {
    id v76 = (void *)v34;
    obja = v9;
    long long v63 = v33;
    uint64_t v40 = v36(v33, 1);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v81 objects:v103 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v82;
      uint64_t v44 = &_os_log_internal;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v82 != v43) {
            objc_enumerationMutation(v40);
          }
          CFAbsoluteTime v46 = *(void **)(*((void *)&v81 + 1) + 8 * j);
          unint64_t v47 = [v40 countForObject:v46];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            [v46 interestingScore];
            *(_DWORD *)buf = 134218498;
            unint64_t v98 = v47;
            __int16 v99 = 2048;
            uint64_t v100 = v48;
            __int16 v101 = 2112;
            long long v102 = v46;
            _os_log_debug_impl(&dword_25934C000, v44, OS_LOG_TYPE_DEBUG, "Normal Distributions: [Highly interesting] count:%lu score:%.2f person:%@", buf, 0x20u);
          }
          if (v47 >= [(PNPersonPromoterProfile *)v30 highlyInterestingPersonNormalDistributionsToMatch])
          {
            [v46 setHighlyInteresting:1];
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v98 = (unint64_t)v46;
              _os_log_impl(&dword_25934C000, v44, OS_LOG_TYPE_INFO, "Normal Distributions: [Highly interesting] Elected person %@", buf, 0xCu);
            }
            [v74 removeObjectForKey:v46];
            [v73 removeObjectForKey:v46];
            [v31 removeObjectForKey:v46];
            [v32 removeObjectForKey:v46];
            [v76 addObject:v46];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v81 objects:v103 count:16];
      }
      while (v42);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v49 = [(PNPersonPromoterProfile *)obja count];
      uint64_t v50 = [v76 count];
      *(_DWORD *)buf = 134218240;
      unint64_t v98 = v49;
      __int16 v99 = 2048;
      uint64_t v100 = v50;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[PersonPromoter] Ran first pass of interestingPersonsFromPersons with %tu persons, found %tu highly interesting.", buf, 0x16u);
    }
    uint64_t v51 = ((void (*)(void *, void))v63[2])(v63, 0);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v77 objects:v96 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v78;
      id v55 = &_os_log_internal;
      do
      {
        for (uint64_t k = 0; k != v53; ++k)
        {
          if (*(void *)v78 != v54) {
            objc_enumerationMutation(v51);
          }
          long long v57 = *(void **)(*((void *)&v77 + 1) + 8 * k);
          unint64_t v58 = [v51 countForObject:v57];
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            [v57 interestingScore];
            *(_DWORD *)buf = 134218498;
            unint64_t v98 = v58;
            __int16 v99 = 2048;
            uint64_t v100 = v59;
            __int16 v101 = 2112;
            long long v102 = v57;
            _os_log_debug_impl(&dword_25934C000, v55, OS_LOG_TYPE_DEBUG, "Normal Distributions: count:%lu score:%.2f person:%@", buf, 0x20u);
          }
          if (v58 >= [(PNPersonPromoterProfile *)v30 interestingPersonNormalDistributionsToMatch])
          {
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v98 = (unint64_t)v57;
              _os_log_impl(&dword_25934C000, v55, OS_LOG_TYPE_INFO, "Normal Distributions: Elected person %@", buf, 0xCu);
            }
            [v76 addObject:v57];
          }
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v77 objects:v96 count:16];
      }
      while (v53);
    }
    long long v29 = v64;
    BOOL v35 = v76;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v60 = [(PNPersonPromoterProfile *)obja count];
      uint64_t v61 = [v76 count];
      *(_DWORD *)buf = 134218240;
      unint64_t v98 = v60;
      __int16 v99 = 2048;
      uint64_t v100 = v61;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[PersonPromoter] Ran second pass of interestingPersonsFromPersons with %tu persons, found %tu interesting.", buf, 0x16u);
    }
    unint64_t v38 = v76;

    double v9 = obja;
    long long v33 = v63;
  }

  id v39 = v86;
LABEL_46:

  return v38;
}

id __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = [MEMORY[0x263F08760] set];
  uint64_t v5 = *(void **)(a1 + 32);
  if (a2) {
    [v5 highlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail];
  }
  else {
    [v5 interestingPersonMomentsCumulativeNormalDistributionUpperTail];
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) interestingPersonMomentsNormalDistributionSigmaFactor];
  double v10 = v9;
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_2;
  v55[3] = &unk_26544EC20;
  id v56 = *(id *)(a1 + 32);
  uint64_t v58 = v7;
  char v59 = a2;
  id v11 = v4;
  id v57 = v11;
  +[PNPersonPromoter cumulativeNormalDistributionWithData:v8 sigmaFactor:v55 usingBlock:v10];
  uint64_t v12 = *(void **)(a1 + 32);
  if (a2) {
    [v12 highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail];
  }
  else {
    [v12 interestingPersonFacesCumulativeNormalDistributionUpperTail];
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) interestingPersonFacesNormalDistributionSigmaFactor];
  double v17 = v16;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_414;
  v50[3] = &unk_26544EC20;
  id v51 = *(id *)(a1 + 32);
  uint64_t v53 = v14;
  char v54 = a2;
  id v18 = v11;
  id v52 = v18;
  +[PNPersonPromoter cumulativeNormalDistributionWithData:v15 sigmaFactor:v50 usingBlock:v17];
  uint64_t v19 = *(void **)(a1 + 32);
  if (a2) {
    [v19 highlyInterestingPersonTimeCumulativeNormalDistributionUpperTail];
  }
  else {
    [v19 interestingPersonTimeCumulativeNormalDistributionUpperTail];
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)(a1 + 56);
  [*(id *)(a1 + 32) interestingPersonTimeNormalDistributionSigmaFactor];
  double v24 = v23;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_415;
  v45[3] = &unk_26544EC20;
  id v46 = *(id *)(a1 + 32);
  uint64_t v48 = v21;
  char v49 = a2;
  id v25 = v18;
  id v47 = v25;
  +[PNPersonPromoter cumulativeNormalDistributionWithData:v22 sigmaFactor:v45 usingBlock:v24];
  uint64_t v26 = *(void **)(a1 + 32);
  if (a2)
  {
    [v26 highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail];
    uint64_t v28 = v27;
    [*(id *)(a1 + 32) highlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail];
  }
  else
  {
    [v26 interestingPersonLastSeenCumulativeNormalDistributionLowerTail];
    uint64_t v28 = v30;
    [*(id *)(a1 + 32) interestingPersonLastSeenCumulativeNormalDistributionUpperTail];
  }
  uint64_t v31 = v29;
  uint64_t v32 = *(void *)(a1 + 64);
  [*(id *)(a1 + 32) interestingPersonLastSeenNormalDistributionSigmaFactor];
  double v34 = v33;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_416;
  v39[3] = &unk_26544EC48;
  id v40 = *(id *)(a1 + 32);
  uint64_t v42 = v28;
  uint64_t v43 = v31;
  char v44 = a2;
  id v35 = v25;
  id v41 = v35;
  +[PNPersonPromoter cumulativeNormalDistributionWithData:v32 sigmaFactor:v39 usingBlock:v34];
  id v36 = v41;
  id v37 = v35;

  return v37;
}

void __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v11 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    [*(id *)(a1 + 32) interestingPersonMomentsCumulativeNormalDistributionUpperTail];
    uint64_t v13 = v12;
    uint64_t v14 = [v11 localIdentifier];
    int v17 = 134219266;
    double v18 = a3;
    __int16 v19 = 2048;
    double v20 = a4;
    __int16 v21 = 2048;
    double v22 = a5;
    __int16 v23 = 2048;
    double v24 = a6;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    uint64_t v28 = v14;
    _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Moments Cumulative Normal Distribution: x:%lf mu:%lf sigma:%lf result:%lf upperTail:%lf person:%@", (uint8_t *)&v17, 0x3Eu);
  }
  [v11 setInterestingScore:a6];
  if (*(double *)(a1 + 48) <= a6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      if (*(unsigned char *)(a1 + 56)) {
        uint64_t v15 = @"[Highly interesting] ";
      }
      else {
        uint64_t v15 = &stru_270753580;
      }
      double v16 = [v11 localIdentifier];
      int v17 = 138412546;
      double v18 = *(double *)&v15;
      __int16 v19 = 2112;
      double v20 = *(double *)&v16;
      _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Moments Cumulative Normal Distribution: %@Elected person %@", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 40) addObject:v11];
  }
}

void __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_414(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    [*(id *)(a1 + 32) interestingPersonFacesCumulativeNormalDistributionUpperTail];
    uint64_t v14 = v13;
    uint64_t v15 = [v11 localIdentifier];
    int v18 = 134219266;
    double v19 = a3;
    __int16 v20 = 2048;
    double v21 = a4;
    __int16 v22 = 2048;
    double v23 = a5;
    __int16 v24 = 2048;
    double v25 = a6;
    __int16 v26 = 2048;
    uint64_t v27 = v14;
    __int16 v28 = 2112;
    uint64_t v29 = v15;
    _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Faces Cumulative Normal Distribution: x:%lf mu:%lf sigma:%lf result:%lf upperTail:%lf person:%@", (uint8_t *)&v18, 0x3Eu);
  }
  [v11 interestingScore];
  [v11 setInterestingScore:v12 + a6];
  if (*(double *)(a1 + 48) <= a6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      if (*(unsigned char *)(a1 + 56)) {
        double v16 = @"[Highly interesting] ";
      }
      else {
        double v16 = &stru_270753580;
      }
      int v17 = [v11 localIdentifier];
      int v18 = 138412546;
      double v19 = *(double *)&v16;
      __int16 v20 = 2112;
      double v21 = *(double *)&v17;
      _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Faces Cumulative Normal Distribution: %@Elected person %@", (uint8_t *)&v18, 0x16u);
    }
    [*(id *)(a1 + 40) addObject:v11];
  }
}

void __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_415(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v11 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    [*(id *)(a1 + 32) interestingPersonTimeCumulativeNormalDistributionUpperTail];
    uint64_t v13 = v12;
    uint64_t v14 = [v11 localIdentifier];
    int v17 = 134219266;
    double v18 = a3;
    __int16 v19 = 2048;
    double v20 = a4;
    __int16 v21 = 2048;
    double v22 = a5;
    __int16 v23 = 2048;
    double v24 = a6;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    __int16 v28 = v14;
    _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Time Cumulative Normal Distribution: x:%lf mu:%lf sigma:%lf result:%lf upperTail:%lf person:%@", (uint8_t *)&v17, 0x3Eu);
  }
  if (*(double *)(a1 + 48) <= a6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      if (*(unsigned char *)(a1 + 56)) {
        uint64_t v15 = @"[Highly interesting] ";
      }
      else {
        uint64_t v15 = &stru_270753580;
      }
      double v16 = [v11 localIdentifier];
      int v17 = 138412546;
      double v18 = *(double *)&v15;
      __int16 v19 = 2112;
      double v20 = *(double *)&v16;
      _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Time Cumulative Normal Distribution: %@Elected person %@", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 40) addObject:v11];
  }
}

void __76__PNPersonPromoter_interestingPersonsFromPersons_detectionType_updateBlock___block_invoke_416(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    [*(id *)(a1 + 32) interestingPersonLastSeenCumulativeNormalDistributionLowerTail];
    uint64_t v14 = v13;
    [*(id *)(a1 + 32) interestingPersonLastSeenCumulativeNormalDistributionUpperTail];
    uint64_t v16 = v15;
    int v17 = [v11 localIdentifier];
    int v20 = 134219522;
    double v21 = a3;
    __int16 v22 = 2048;
    double v23 = a4;
    __int16 v24 = 2048;
    double v25 = a5;
    __int16 v26 = 2048;
    double v27 = a6;
    __int16 v28 = 2048;
    uint64_t v29 = v14;
    __int16 v30 = 2048;
    uint64_t v31 = v16;
    __int16 v32 = 2112;
    double v33 = v17;
    _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Last Seen Cumulative Normal Distribution: x:%lf mu:%lf sigma:%lf result:%lf lowerTail:%lf upperTail:%lf person:%@", (uint8_t *)&v20, 0x48u);
  }
  [v11 interestingScore];
  [v11 setInterestingScore:(1.0 - a6 + v12) / 3.0];
  if (*(double *)(a1 + 48) >= a6 || *(double *)(a1 + 56) <= a6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      if (*(unsigned char *)(a1 + 64)) {
        double v18 = @"[Highly interesting] ";
      }
      else {
        double v18 = &stru_270753580;
      }
      __int16 v19 = [v11 localIdentifier];
      int v20 = 138412546;
      double v21 = *(double *)&v18;
      __int16 v22 = 2112;
      double v23 = *(double *)&v19;
      _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Last Seen Cumulative Normal Distribution: %@Elected person %@", (uint8_t *)&v20, 0x16u);
    }
    [*(id *)(a1 + 40) addObject:v11];
  }
}

- (id)interestingPersonsFromPersons:(id)a3 updateBlock:(id)a4
{
  return [(PNPersonPromoter *)self interestingPersonsFromPersons:a3 detectionType:1 updateBlock:a4];
}

- (double)_personTimespan:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PNPersonPromoter *)self photoLibrary];
  __int16 v32 = v4;
  uint64_t v6 = [v4 backingMomentIdentifiers];
  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = objc_msgSend(v5, "pn_fetchMomentsWithLocalIdentifiers:", v7);

  uint64_t v31 = v8;
  uint64_t v9 = [v8 fetchedObjects];
  double v10 = [(PNPersonPromoter *)self delegate];
  __int16 v30 = (void *)v9;
  id v11 = [v10 densityClusteringForObjects:v9 maximumDistance:2 minimumNumberOfObjects:&__block_literal_global_403 withDistanceBlock:3888000.0];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v11;
  uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v42;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v15 = [v14 firstObject];
        uint64_t v16 = [v15 universalStartDate];
        id v36 = v15;
        int v17 = [v15 universalEndDate];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v18 = v14;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v38;
          do
          {
            uint64_t v22 = 0;
            double v23 = v16;
            __int16 v24 = v17;
            do
            {
              if (*(void *)v38 != v21) {
                objc_enumerationMutation(v18);
              }
              double v25 = *(void **)(*((void *)&v37 + 1) + 8 * v22);
              __int16 v26 = [v25 universalStartDate];
              uint64_t v16 = [v23 earlierDate:v26];

              double v27 = [v25 universalEndDate];
              int v17 = [v24 laterDate:v27];

              ++v22;
              double v23 = v16;
              __int16 v24 = v17;
            }
            while (v20 != v22);
            uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v20);
        }

        [v17 timeIntervalSinceDate:v16];
        double v12 = v12 + v28;
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v35);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

double __36__PNPersonPromoter__personTimespan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 universalStartDate];
  uint64_t v7 = [v5 universalEndDate];

  uint64_t v8 = [v4 universalStartDate];
  uint64_t v9 = [v4 universalEndDate];

  BOOL v10 = [v6 compare:v8] != 1 && objc_msgSend(v8, "compare:", v7) != 1;
  BOOL v11 = [v6 compare:v9] != 1 && objc_msgSend(v9, "compare:", v7) != 1;
  double v12 = 0.0;
  if (!v11 && !v10)
  {
    uint64_t v13 = [v7 earlierDate:v9];
    uint64_t v14 = [v6 laterDate:v8];
    [v13 timeIntervalSinceDate:v14];
    double v12 = fabs(v15);
  }
  return v12;
}

- (id)advancedStatus
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  unint64_t v38 = +[PNUserDefaults promoterStatusMergeCandidateLimit];
  unint64_t v3 = +[PNUserDefaults promoterStatusVerifiedPersonLimit];
  id v4 = objc_opt_new();
  id v5 = [(PNPersonPromoter *)self personClusterManager];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__PNPersonPromoter_advancedStatus__block_invoke;
  aBlock[3] = &unk_26544EBF8;
  id v40 = v5;
  id v56 = v40;
  id v6 = v4;
  id v57 = v6;
  uint64_t v7 = (void (**)(void *, uint64_t, void, uint64_t))_Block_copy(aBlock);
  uint64_t v8 = [(PNPersonPromoter *)self _verifiedPersonsToProcess];
  uint64_t v9 = [(PNPersonPromoter *)self _sortedUnverifiedPersonsToDedupForVerifiedPersons:v8 type:3 updateBlock:&__block_literal_global_374];
  BOOL v10 = +[PNPersonClusterManager personProcessingSortDescriptors];
  id v36 = v8;
  BOOL v11 = [v8 sortedArrayUsingDescriptors:v10];

  if ([v11 count] > v3)
  {
    uint64_t v12 = objc_msgSend(v11, "subarrayWithRange:", 0, v3);

    BOOL v11 = (void *)v12;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v11 count];
    uint64_t v14 = [v9 count];
    *(_DWORD *)buf = 134218240;
    long long v62 = (const char *)v13;
    __int16 v63 = 2048;
    uint64_t v64 = v14;
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter] Executing -[PNPersonPromoter advancedStatus] with %tu verified persons, %tu unverified", buf, 0x16u);
  }
  uint64_t v35 = v9;
  [v6 appendFormat:@"Results with with %tu verified persons, %tu unverified\n\n", objc_msgSend(v11, "count"), objc_msgSend(v9, "count")];
  double v15 = (void *)[v11 mutableCopy];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v11;
  uint64_t v41 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v52;
    long long v42 = v6;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v52 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        [v6 appendFormat:@"Status for %@\n", v17];
        id v18 = objc_msgSend(v40, "pn_fetchCandidatePersonsForPerson:", v17);
        if ([v18 count])
        {
          objc_msgSend(v6, "appendFormat:", @"\tComparing with %lu merge candicates:\n", objc_msgSend(v18, "count"));
          uint64_t v19 = [v18 fetchedObjects];
          uint64_t v20 = +[PNPersonClusterManager personProcessingSortDescriptors];
          uint64_t v21 = [v19 sortedArrayUsingDescriptors:v20];

          if ([v21 count] > v38)
          {
            uint64_t v22 = [v21 subarrayWithRange:0];

            uint64_t v21 = (void *)v22;
          }
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v23 = v21;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v59 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v48;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v48 != v26) {
                  objc_enumerationMutation(v23);
                }
                v7[2](v7, v17, *(void *)(*((void *)&v47 + 1) + 8 * j), 1);
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v47 objects:v59 count:16];
            }
            while (v25);
          }

          id v6 = v42;
          [v42 appendFormat:@"\n"];
        }
        [v15 removeObject:v17];
        if ([v15 count])
        {
          objc_msgSend(v6, "appendFormat:", @"\tComparing with %lu other persons:\n", objc_msgSend(v15, "count"));
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v28 = v15;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v58 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v44;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v44 != v31) {
                  objc_enumerationMutation(v28);
                }
                v7[2](v7, v17, *(void *)(*((void *)&v43 + 1) + 8 * k), 0);
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v58 count:16];
            }
            while (v30);
          }

          id v6 = v42;
          [v42 appendFormat:@"\n"];
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v41);
  }

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v62 = "-[PNPersonPromoter advancedStatus]";
    __int16 v63 = 2112;
    uint64_t v64 = (uint64_t)v6;
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);
  }
  id v33 = v6;

  return v33;
}

void __34__PNPersonPromoter_advancedStatus__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x25A2E0AC0]();
  uint64_t v10 = [*(id *)(a1 + 32) numberOfAssetsInCommonBetweenPerson:v7 andPerson:v8];
  uint64_t v11 = [*(id *)(a1 + 32) numberOfMomentsInCommonBetweenPerson:v7 andPerson:v8];
  unsigned __int16 v44 = 0;
  uint64_t v12 = *(void **)(a1 + 32);
  id v43 = 0;
  [v12 distanceBetweenPerson:v7 andPerson:v8 useCommonMoments:0 minAgeType:&v44 updateBlock:&__block_literal_global error:&v43];
  float v14 = v13;
  id v15 = v43;
  if (v15) {
    [*(id *)(a1 + 40) appendFormat:@"Error: Got an error while getting distances: %@\n", v15];
  }

  unsigned __int16 v42 = 0;
  uint64_t v16 = *(void **)(a1 + 32);
  id v41 = 0;
  [v16 distanceBetweenPerson:v7 andPerson:v8 useCommonMoments:1 minAgeType:&v42 updateBlock:&__block_literal_global_359 error:&v41];
  float v18 = v17;
  id v19 = v41;
  if (v19) {
    [*(id *)(a1 + 40) appendFormat:@"Error: Got an error while getting distances with common moments: %@\n", v19];
  }
  uint64_t v20 = [*(id *)(a1 + 32) assetsOverlapBetweenPerson:v7 andPerson:v8];
  [*(id *)(a1 + 40) appendFormat:@"\t\tDistance: %.3f (ageType:%hu), Distance with common moments %.3f (ageType:%hu), common assets: %tu (asset overlap: %zd), common moments: %tu. for %@\n", v14, v44, v18, v42, v10, v20, v11, v8];
  if (a4)
  {
    uint64_t v21 = objc_msgSend(*(id *)(a1 + 32), "pn_fetchFaceGroupsForPerson:", v8);
    if (([v8 isVerified] & 1) != 0 || objc_msgSend(v21, "count") == 1)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        id v33 = v21;
        id v34 = v19;
        uint64_t v25 = a1;
        uint64_t v35 = v9;
        id v36 = v7;
        uint64_t v26 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v38 != v26) {
              objc_enumerationMutation(v22);
            }
            id v28 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if ([v28 isDirty])
            {
              uint64_t v29 = *(void **)(v25 + 40);
              uint64_t v30 = [v8 localIdentifier];
              uint64_t v31 = [v28 localIdentifier];
              [v29 appendFormat:@"\t\t\tOther person %@ has a dirty cluster %@. Face count in face group: %lu, person face count: %lu\n", v30, v31, objc_msgSend(v28, "faceCountInFaceGroup"), objc_msgSend(v8, "faceCount")];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v24);
        uint64_t v9 = v35;
        id v7 = v36;
        uint64_t v21 = v33;
        id v19 = v34;
      }
    }
    else
    {
      __int16 v32 = *(void **)(a1 + 40);
      id v22 = [v8 localIdentifier];
      [v32 appendFormat:@"Error: Other person %@ should have one face group: %@\n", v22, v21];
    }
  }
}

- (id)_promoteUnverifiedPersons:(id)a3 withVerifiedPersons:(id)a4 updateBlock:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v31 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v11 = objc_opt_new();
  uint64_t v30 = v9;
  uint64_t v12 = (void *)[v9 mutableCopy];
  id v36 = objc_opt_new();
  __int16 v32 = v8;
  unint64_t v35 = [v8 count];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = [v9 count];
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v8 count];
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[PersonPromoter] Executing promoter with %lu verified person, %lu unverified persons", buf, 0x16u);
  }
  if (v35)
  {
    unint64_t v14 = 0;
    *(void *)&long long v13 = 134218240;
    long long v29 = v13;
    while (1)
    {
      context = (void *)MEMORY[0x25A2E0AC0]();
      if (!(v35 - v14 >= 0x180 ? 384 : v35 - v14)) {
        break;
      }
      long long v37 = [v32 subarrayWithRange:v14];
      uint64_t v33 = [v37 count];
      [v36 addObjectsFromArray:v37];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      BOOL v49 = 0;
      BOOL v49 = (unint64_t)[v12 count] < 0x64;
      if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
        goto LABEL_11;
      }
      uint64_t v16 = [v36 allObjects];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __78__PNPersonPromoter__promoteUnverifiedPersons_withVerifiedPersons_updateBlock___block_invoke;
      v42[3] = &unk_26544EBD0;
      v42[4] = buf;
      [v16 enumerateObjectsUsingBlock:v42];

      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
LABEL_11:
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v17 = v36;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v39 != v19) {
                objc_enumerationMutation(v17);
              }
              uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              id v22 = (void *)MEMORY[0x25A2E0AC0]();
              if ([(PNPersonPromoter *)self _personClusterShouldBeVerified:v21])
              {
                [v11 addObject:v21];
                [v12 addObject:v21];
              }
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v18);
        }

        [v17 minusSet:v11];
      }
      else
      {
        uint64_t v23 = &_os_log_internal;
        id v24 = &_os_log_internal;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = [v12 count];
          *(_DWORD *)unsigned __int16 v44 = v29;
          uint64_t v45 = v25;
          __int16 v46 = 2048;
          uint64_t v47 = 100;
          _os_log_impl(&dword_25934C000, v23, OS_LOG_TYPE_INFO, "[PersonPromoter] -[PNPersonPromoter promoteUnverifiedPersonsWithUpdateBlock:] cannot promote anyone has it is over budget: %lu verified persons > %lu budget", v44, 0x16u);
        }
      }
      _Block_object_dispose(buf, 8);

      v14 += v33;
      if (v14 >= v35) {
        goto LABEL_27;
      }
    }
  }
LABEL_27:
  uint64_t v26 = -[PNPersonPromoter _interestingPersonsFromVerifiedPersons:unverifiedPersons:updateBlock:](self, "_interestingPersonsFromVerifiedPersons:unverifiedPersons:updateBlock:", v12, v36, v31, v29);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v27 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    *(double *)&uint8_t buf[4] = v27 - Current;
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[PersonPromoter][Perf] Person Promoter took %fs", buf, 0xCu);
  }

  return v26;
}

unint64_t __78__PNPersonPromoter__promoteUnverifiedPersons_withVerifiedPersons_updateBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t result = [a2 faceCount];
  if (result >= 0x64)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)evaluatePersonPromoterWithUpdateBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [v4 set];
  id v7 = [(PNPersonPromoter *)self _sortedUnverifiedPersonsToDedupForVerifiedPersons:v6 type:0 updateBlock:v5];
  id v8 = [(PNPersonPromoter *)self _promoteUnverifiedPersons:v7 withVerifiedPersons:v6 updateBlock:v5];

  return v8;
}

- (BOOL)promoteUnverifiedPersonsWithUpdateBlock:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"PNPersonPromoterDisabled"];

  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[PersonPromoter] disabled via defaults", v12, 2u);
    }
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(PNPersonPromoter *)self _verifiedPersonsToProcess];
    id v9 = [(PNPersonPromoter *)self _sortedUnverifiedPersonsToDedupForVerifiedPersons:v8 type:3 updateBlock:v4];
    uint64_t v10 = [(PNPersonPromoter *)self _promoteUnverifiedPersons:v9 withVerifiedPersons:v8 updateBlock:v4];
    if ([v10 count]) {
      BOOL v7 = [(PNPersonPromoter *)self _promoteInterestingPersons:v10 updateBlock:v4];
    }
    else {
      BOOL v7 = 1;
    }
  }
  return v7;
}

- (PNPersonPromoter)initWithPhotoLibrary:(id)a3 andDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PNPersonPromoter;
  id v8 = [(PNPersonPromoter *)&v20 init];
  id v9 = v8;
  if (v8)
  {
    [(PNPersonPromoter *)v8 setPhotoLibrary:v6];
    [(PNPersonPromoter *)v9 setDelegate:v7];
    uint64_t v10 = [[PNPersonClusterManager alloc] initWithPhotoLibrary:v6];
    personClusterManager = v9->_personClusterManager;
    v9->_personClusterManager = v10;

    uint64_t v12 = objc_alloc_init(PNPersonPromoterProfile);
    promoterProfile = v9->_promoterProfile;
    v9->_promoterProfile = v12;

    unint64_t v14 = objc_alloc_init(PNPersonDeduperProfile);
    deduperProfile = v9->_deduperProfile;
    v9->_deduperProfile = v14;

    quiescentState = v9->_quiescentState;
    v9->_quiescentState = 0;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    metricsReport = v9->_metricsReport;
    v9->_metricsReport = (NSMutableDictionary *)v17;
  }
  return v9;
}

- (BOOL)isInQuiescentState
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  quiescentState = self->_quiescentState;
  if (!quiescentState)
  {
    id v4 = [(PNPersonPromoter *)self photoLibrary];
    objc_msgSend(v4, "pn_faceProcessingProgress");
    float v6 = v5;

    [NSNumber numberWithInt:v6 >= 0.95];
    id v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_quiescentState;
    self->_quiescentState = v7;

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(NSNumber *)self->_quiescentState BOOLValue];
      uint64_t v10 = @"NO";
      if (v9) {
        uint64_t v10 = @"YES";
      }
      int v12 = 138412290;
      long long v13 = v10;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[PersonPromoter] Executing promoter with quiescent state = %@", (uint8_t *)&v12, 0xCu);
    }
    quiescentState = self->_quiescentState;
  }
  return [(NSNumber *)quiescentState BOOLValue];
}

+ (void)cumulativeNormalDistributionWithData:(id)a3 sigmaFactor:(double)a4 usingBlock:(id)a5
{
  v40[1] = *MEMORY[0x263EF8340];
  id v7 = (NSMapTable *)a3;
  id v8 = (void (**)(id, void, double, double, double, double))a5;
  if ([(NSMapTable *)v7 count])
  {
    uint64_t v33 = NSAllMapTableValues(v7);
    BOOL v9 = objc_msgSend(MEMORY[0x263F087F0], "expressionForConstantValue:");
    uint64_t v10 = (void *)MEMORY[0x263F087F0];
    v40[0] = v9;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
    int v12 = [v10 expressionForFunction:@"average:" arguments:v11];
    long long v13 = [v12 expressionValueWithObject:0 context:0];
    [v13 doubleValue];
    double v15 = v14;

    uint64_t v16 = (void *)MEMORY[0x263F087F0];
    long long v39 = v9;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
    uint64_t v18 = [v16 expressionForFunction:@"median:" arguments:v17];
    uint64_t v19 = [v18 expressionValueWithObject:0 context:0];
    [v19 doubleValue];
    double v21 = v20;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v22 = [(NSMapTable *)v7 keyEnumerator];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      double v25 = v21 * a4;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v22);
          }
          uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          long long v29 = [(NSMapTable *)v7 objectForKey:v28];
          [v29 doubleValue];
          double v31 = v30;
          long double v32 = erfc((v15 - v30) / v25 * 0.707106781);
          v8[2](v8, v28, v31, v15, v25, fmin(v32 * 0.5, 1.0));
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v24);
    }
  }
}

+ (void)probabilityDensityNormalDistributionWithData:(id)a3 sigmaFactor:(double)a4 usingBlock:(id)a5
{
  v44[1] = *MEMORY[0x263EF8340];
  id v7 = (NSMapTable *)a3;
  id v8 = (void (**)(id, void, double, double, double, double, double))a5;
  long long v37 = NSAllMapTableValues(v7);
  BOOL v9 = objc_msgSend(MEMORY[0x263F087F0], "expressionForConstantValue:");
  uint64_t v10 = (void *)MEMORY[0x263F087F0];
  v44[0] = v9;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
  int v12 = [v10 expressionForFunction:@"average:" arguments:v11];
  long long v13 = [v12 expressionValueWithObject:0 context:0];
  [v13 doubleValue];
  double v15 = v14;

  uint64_t v16 = (void *)MEMORY[0x263F087F0];
  id v43 = v9;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  uint64_t v18 = [v16 expressionForFunction:@"stddev:" arguments:v17];
  uint64_t v19 = [v18 expressionValueWithObject:0 context:0];
  [v19 doubleValue];
  double v21 = v20;

  double v22 = v21 * a4;
  double v23 = v22 * (v22 + v22);
  double v24 = exp(-((v15 - v15) * (v15 - v15)) / v23);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  double v25 = [(NSMapTable *)v7 keyEnumerator];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    double v28 = 1.0 / sqrt(v23 * 3.14159265);
    double v29 = v24 * v28;
    uint64_t v30 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v25);
        }
        uint64_t v32 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v33 = [(NSMapTable *)v7 objectForKey:v32];
        [v33 doubleValue];
        double v35 = v34;
        long double v36 = exp(-((v34 - v15) * (v34 - v15)) / v23);
        v8[2](v8, v32, v35, v15, v22, v28 * v36, v29);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v27);
  }
}

+ (unint64_t)numberOfFacesProcessedOnLastRunAtURL:(id)a3
{
  unint64_t v3 = [a1 _personPromoterInformationAtURL:a3];
  id v4 = [v3 objectForKeyedSubscript:@"NumberOfFacesProcessedOnLastRun"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

+ (id)requestSuggestedMePersonIdentifierAtURL:(id)a3 withError:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x263F087E8], "pn_errorWithCode:localizedDescription:", 1, @"Me inference is handled by VU.");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (void)setProcessed:(BOOL)a3 forLibrary:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_msgSend(v6, "pn_persistentStorageDirectoryURL");
  id v8 = [a1 _personPromoterInformationAtURL:v7];
  BOOL v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = v9;
  if (v4)
  {
    [v9 setObject:&unk_27076A338 forKey:@"Version"];
    [v10 setObject:MEMORY[0x263EFFA88] forKey:@"ProcessedInQuiescentState"];
    uint64_t v11 = objc_msgSend(v6, "pn_numberOfFacesWithFaceprints");
    int v12 = [NSNumber numberWithUnsignedInteger:v11];
    [v10 setObject:v12 forKey:@"NumberOfFacesProcessedOnLastRun"];
  }
  else
  {
    [v9 removeObjectForKey:@"Version"];
    [v10 removeObjectForKey:@"ProcessedInQuiescentState"];
  }
  if (([a1 _writePersonPromoterInformation:v10 atURL:v7] & 1) == 0
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    double v14 = v10;
    _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error setting the People Promoter hasProcessed: %@", (uint8_t *)&v13, 0xCu);
  }
}

+ (BOOL)hasProcessedForLibrary:(id)a3
{
  BOOL v4 = objc_msgSend(a3, "pn_persistentStorageDirectoryURL");
  unint64_t v5 = [a1 _personPromoterInformationAtURL:v4];
  id v6 = [v5 objectForKeyedSubscript:@"Version"];
  if ([v6 unsignedIntegerValue] == 15)
  {
    id v7 = [v5 objectForKeyedSubscript:@"ProcessedInQuiescentState"];
    char v8 = [v7 BOOLValue];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)_writePersonPromoterInformation:(id)a3 atURL:(id)a4
{
  id v5 = a3;
  id v6 = [a4 URLByAppendingPathComponent:@"PersonPromoter"];
  char v7 = [v5 writeToURL:v6 atomically:0];

  return v7;
}

+ (id)_personPromoterInformationAtURL:(id)a3
{
  unint64_t v3 = (objc_class *)MEMORY[0x263F08850];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 URLByAppendingPathComponent:@"PersonPromoter"];

  char v7 = [v6 path];
  if (![v5 fileExistsAtPath:v7]
    || (char v8 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v7]) == 0)
  {
    char v8 = [NSDictionary dictionary];
  }

  return v8;
}

+ (BOOL)isEnabled
{
  return 1;
}

- (void)reportMetrics
{
  id v2 = [(PNPersonPromoter *)self metricsReport];
  if ([v2 count]) {
    [MEMORY[0x263F2FA10] sendEvent:@"com.apple.Photos.People.personPromoter" withPayload:v2];
  }
}

- (void)incrementMetricForKey:(id)a3 withValue:(unint64_t)a4
{
  if (a4)
  {
    id v6 = a3;
    char v7 = [(PNPersonPromoter *)self metricsReport];
    char v8 = [v7 objectForKeyedSubscript:v6];
    uint64_t v9 = [v8 unsignedIntegerValue];

    id v11 = [NSNumber numberWithUnsignedInteger:v9 + a4];
    uint64_t v10 = [(PNPersonPromoter *)self metricsReport];
    [v10 setObject:v11 forKeyedSubscript:v6];
  }
}

@end