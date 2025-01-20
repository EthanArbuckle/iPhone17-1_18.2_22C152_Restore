@interface PHACameraSmartSharingTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)libraryScopeLocalIdentifier;
- (NSString)name;
- (PHLibraryScope)libraryScope;
- (double)period;
- (id)_libraryScopeToUseWithGraphManager:(id)a3 error:(id *)a4;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)setLibraryScope:(id)a3;
- (void)setLibraryScopeLocalIdentifier:(id)a3;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHACameraSmartSharingTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryScope, 0);

  objc_storeStrong((id *)&self->_libraryScopeLocalIdentifier, 0);
}

- (void)setLibraryScope:(id)a3
{
}

- (PHLibraryScope)libraryScope
{
  return self->_libraryScope;
}

- (void)setLibraryScopeLocalIdentifier:(id)a3
{
}

- (NSString)libraryScopeLocalIdentifier
{
  return self->_libraryScopeLocalIdentifier;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHACameraSmartSharingTask timeoutFatal:]", "PHACameraSmartSharingTask.m", 278, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHACameraSmartSharingTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![v9 isCancelledWithProgress:0.0])
  {
    v10 = [v8 workingContext];
    v11 = [v10 loggingConnection];

    v99 = a5;
    v12 = [(PHACameraSmartSharingTask *)self _libraryScopeToUseWithGraphManager:v8 error:a5];
    if (v12)
    {
      v98 = v8;
      v13 = [v8 photoLibrary];
      v14 = [v13 librarySpecificFetchOptions];

      id v108 = objc_alloc_init(MEMORY[0x1E4F1B980]);
      v15 = (void *)MEMORY[0x1E4F392E8];
      v106 = v14;
      v16 = (void *)[v14 copy];
      v17 = [v15 fetchParticipantsInShare:v12 options:v16];

      unint64_t v18 = 0x1E4F1C000uLL;
      id v112 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v134 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v134 objects:v145 count:16];
      id v107 = v9;
      if (v20)
      {
        uint64_t v22 = v20;
        uint64_t v113 = *(void *)v135;
        uint64_t v102 = *MEMORY[0x1E4F1ADC8];
        uint64_t v101 = *MEMORY[0x1E4F1AEE0];
        uint64_t v100 = *MEMORY[0x1E4F1AE08];
        *(void *)&long long v21 = 138478339;
        long long v97 = v21;
        uint64_t v23 = MEMORY[0x1E4F1CBF0];
        oslog = v11;
        id v103 = v19;
        v104 = v12;
LABEL_10:
        uint64_t v24 = 0;
        uint64_t v105 = v22;
        while (1)
        {
          if (*(void *)v135 != v113)
          {
            uint64_t v25 = v24;
            objc_enumerationMutation(v19);
            uint64_t v24 = v25;
          }
          uint64_t v115 = v24;
          v26 = *(void **)(*((void *)&v134 + 1) + 8 * v24);
          context = (void *)MEMORY[0x1D26057A0]();
          if ([v9 isCancelledWithProgress:0.5])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v141 = 139;
              *(_WORD *)&v141[4] = 2080;
              *(void *)&v141[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAna"
                                    "lysis/Framework/Storytelling/Tasks/SharedLibraryTasks/PHACameraSmartSharingTask.m";
              _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            id v8 = v98;
            if (v99 && !*v99)
            {
              id *v99 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
            }
            LOBYTE(a5) = 0;
            char v79 = 0;
            char v80 = 1;
            id v81 = v19;
            goto LABEL_98;
          }
          if ([v26 isCurrentUser]) {
            goto LABEL_55;
          }
          id v114 = objc_alloc_init(*(Class *)(v18 + 2688));
          v117 = v26;
          if ([v26 acceptanceStatus] != 2)
          {
            if (![v12 libraryScopeInLocalMode])
            {
              v47 = v114;
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                v48 = v11;
                int v49 = [v117 acceptanceStatus];
                *(_DWORD *)buf = 138412546;
                *(void *)v141 = v117;
                *(_WORD *)&v141[8] = 1024;
                *(_DWORD *)&v141[10] = v49;
                _os_log_impl(&dword_1D21F2000, v48, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Not scanning for participant:%@ acceptanceStatus:%d", buf, 0x12u);
              }
              goto LABEL_54;
            }
            v27 = v11;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              int v28 = [v26 acceptanceStatus];
              *(_DWORD *)buf = 138412546;
              *(void *)v141 = v26;
              *(_WORD *)&v141[8] = 1024;
              *(_DWORD *)&v141[10] = v28;
              _os_log_impl(&dword_1D21F2000, v27, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Allowed scan because of local mode, participant:%@ acceptance status:%d", buf, 0x12u);
            }
          }
          v29 = (void *)MEMORY[0x1E4F391F0];
          v30 = objc_msgSend(v106, "copy", v97);
          v31 = [v29 fetchPersonForShareParticipant:v26 options:v30];

          if (![v31 count] && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v141 = v26;
            _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Missing PHPerson for share participant:%@", buf, 0xCu);
          }
          long long v132 = 0u;
          long long v133 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          id v32 = v31;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v130 objects:v144 count:16];
          if (!v33) {
            break;
          }
          uint64_t v34 = v33;
          v35 = 0;
          uint64_t v36 = *(void *)v131;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v131 != v36) {
                objc_enumerationMutation(v32);
              }
              v38 = *(void **)(*((void *)&v130 + 1) + 8 * i);
              v39 = [v38 linkedContactWithKeysToFetch:v23];
              v40 = [v39 identifier];
              uint64_t v41 = [v40 length];

              if (v41)
              {
                uint64_t v42 = [v39 identifier];

                v35 = (void *)v42;
              }
              else if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)v141 = v117;
                *(_WORD *)&v141[8] = 2112;
                *(void *)&v141[10] = v38;
                _os_log_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Missing contact for for share participant:%@ person:%@", buf, 0x16u);
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v130 objects:v144 count:16];
          }
          while (v34);

          v11 = oslog;
          unint64_t v18 = 0x1E4F1C000;
          if (!v35) {
            goto LABEL_37;
          }
          v43 = v114;
          [v114 addObject:v35];
LABEL_47:
          id v51 = objc_alloc_init(*(Class *)(v18 + 2688));
          v52 = [v117 phoneNumber];
          if ([v52 length])
          {
            v53 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v52];
            [v51 addObject:v53];
          }
          v110 = v51;
          id v54 = objc_alloc_init(*(Class *)(v18 + 2688));
          v55 = [v117 emailAddress];
          if ([v55 length]) {
            [v54 addObject:v55];
          }
          id v56 = objc_alloc(MEMORY[0x1E4F38FB8]);
          v57 = [v43 allObjects];
          v111 = v52;
          uint64_t v58 = [v56 initWithPhoneNumber:v52 emailAddress:v55 contactIdentifiers:v57];

          [v112 addObject:v58];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138478083;
            *(void *)v141 = v58;
            *(_WORD *)&v141[8] = 2112;
            *(void *)&v141[10] = v117;
            _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Added identify %{private}@ for participant:%@", buf, 0x16u);
          }
          v109 = (void *)v58;
          id v59 = objc_alloc(MEMORY[0x1E4F1B908]);
          v139[0] = v102;
          v139[1] = v101;
          v139[2] = v100;
          v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:3];
          v61 = (void *)[v59 initWithKeysToFetch:v60];

          v62 = (void *)MEMORY[0x1E4F1B8F8];
          v47 = v114;
          v63 = [v114 allObjects];
          v64 = [v62 predicateForContactsWithIdentifiers:v63];
          [v61 setPredicate:v64];

          id v129 = 0;
          v123[0] = MEMORY[0x1E4F143A8];
          v123[1] = 3221225472;
          v123[2] = __72__PHACameraSmartSharingTask_runWithGraphManager_progressReporter_error___block_invoke;
          v123[3] = &unk_1E6917418;
          id v124 = v54;
          id v125 = v112;
          v126 = v11;
          v127 = v117;
          id v128 = v110;
          id v65 = v54;
          id v66 = v110;
          [v108 enumerateContactsWithFetchRequest:v61 error:&v129 usingBlock:v123];
          id v67 = v129;

          v11 = oslog;
          id v19 = v103;
          v12 = v104;
          unint64_t v18 = 0x1E4F1C000;
          uint64_t v22 = v105;
          id v9 = v107;
LABEL_54:

LABEL_55:
          uint64_t v24 = v115 + 1;
          if (v115 + 1 == v22)
          {
            uint64_t v22 = [v19 countByEnumeratingWithState:&v134 objects:v145 count:16];
            if (v22) {
              goto LABEL_10;
            }
            goto LABEL_57;
          }
        }

LABEL_37:
        v43 = v114;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(void *)v141 = v117;
          _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Unable to retrieve contact for share participant %{private}@, falling back to lookup by email/phone number.", buf, 0xCu);
        }
        v44 = [v117 emailAddress];
        v45 = [v117 phoneNumber];
        v46 = [v108 allContactIDsMatchingEmailAddress:v44 orPhoneNumber:v45];

        if ([v46 count])
        {
          [v114 addObjectsFromArray:v46];
        }
        else
        {
          v50 = v11;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v68 = [v117 emailAddress];
            v69 = [v117 phoneNumber];
            *(_DWORD *)buf = v97;
            *(void *)v141 = v117;
            *(_WORD *)&v141[8] = 2113;
            *(void *)&v141[10] = v68;
            __int16 v142 = 2113;
            v143 = v69;
            _os_log_error_impl(&dword_1D21F2000, v50, OS_LOG_TYPE_ERROR, "PHACameraSmartSharingTask: Unable to retrieve fallback contact IDs for share participant %{private}@ with email %{private}@ or phone number %{private}@", buf, 0x20u);
          }
          v43 = v114;
        }

        v35 = 0;
        goto LABEL_47;
      }
LABEL_57:
      v70 = (void *)MEMORY[0x1E4F1CBF0];

      if (![v112 count] && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v141 = v12;
        _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: No share participants to auto-share with for libraryScope %@", buf, 0xCu);
      }
      uint64_t v71 = objc_msgSend(v98, "homeCircularRegions", v97);
      v72 = (void *)v71;
      if (v71) {
        v73 = (void *)v71;
      }
      else {
        v73 = v70;
      }
      id v74 = v73;

      if ([v98 isReady])
      {
        uint64_t v75 = [v98 recentFrequentLocationRegions];
        v76 = (void *)v75;
        if (v75) {
          v77 = (void *)v75;
        }
        else {
          v77 = v70;
        }
        id v78 = v77;
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: graph manager not ready, smart sharing cache will be missing frequent location data", buf, 2u);
        }
        id v78 = (id)MEMORY[0x1E4F1CBF0];
      }
      id v83 = v19;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      id v81 = v74;
      uint64_t v84 = [v81 countByEnumeratingWithState:&v119 objects:v138 count:16];
      if (v84)
      {
        uint64_t v85 = *(void *)v120;
        while (2)
        {
          for (uint64_t j = 0; j != v84; ++j)
          {
            if (*(void *)v120 != v85) {
              objc_enumerationMutation(v81);
            }
            v87 = *(void **)(*((void *)&v119 + 1) + 8 * j);
            [v87 center];
            double v89 = v88;
            [v87 center];
            if ([MEMORY[0x1E4F76D08] isLocationShiftRequiredForCoordinate:v89])
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                *(void *)v141 = v87;
                _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: locationShiftingRequired needed for location: %{private}@", buf, 0xCu);
              }
              uint64_t v84 = 1;
              goto LABEL_93;
            }
          }
          uint64_t v84 = [v81 countByEnumeratingWithState:&v119 objects:v138 count:16];
          if (v84) {
            continue;
          }
          break;
        }
      }
LABEL_93:

      id v90 = objc_alloc(MEMORY[0x1E4F38FC0]);
      v91 = [v12 localIdentifier];
      v92 = [v112 allObjects];
      v93 = (void *)[v90 initWithLibraryScopeIdentifier:v91 identities:v92 homeLocations:v81 frequentLocations:v78 locationShiftingRequired:v84];

      a5 = (id *)MEMORY[0x1E4F38FC0];
      v94 = [v98 photoLibrary];
      LOBYTE(a5) = [a5 storeMetadata:v93 forPhotoLibrary:v94 error:v99];

      if (a5)
      {
        id v8 = v98;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(void *)v141 = v93;
          _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Successfully generated smart sharing cache: %{private}@", buf, 0xCu);
        }
      }
      else
      {
        id v8 = v98;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v96 = v99;
          if (v99) {
            v96 = *v99;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)v141 = v96;
          _os_log_error_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_ERROR, "PHACameraSmartSharingTask: Error writing metadata: %@", buf, 0xCu);
        }
      }

      char v80 = 0;
      char v79 = 1;
      id v19 = v83;
LABEL_98:

      if ((v79 & 1) == 0)
      {
        LOBYTE(a5) = 0;
        id v9 = v107;
        goto LABEL_108;
      }
      id v9 = v107;
      if (v80)
      {
LABEL_101:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v141 = 270;
          *(_WORD *)&v141[4] = 2080;
          *(void *)&v141[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysi"
                                "s/Framework/Storytelling/Tasks/SharedLibraryTasks/PHACameraSmartSharingTask.m";
          _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        if (v99 && !*v99)
        {
          [MEMORY[0x1E4F71EB8] errorForCode:-4];
          LOBYTE(a5) = 0;
          id *v99 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          LOBYTE(a5) = 0;
        }
        goto LABEL_108;
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_ERROR, "PHACameraSmartSharingTask: No existing active scope, not generating cache.", buf, 2u);
      }
      LOBYTE(a5) = 0;
    }
    if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0, v97)) {
      goto LABEL_101;
    }
LABEL_108:

    goto LABEL_109;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v141 = 125;
    *(_WORD *)&v141[4] = 2080;
    *(void *)&v141[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Fram"
                          "ework/Storytelling/Tasks/SharedLibraryTasks/PHACameraSmartSharingTask.m";
    _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  if (a5)
  {
    if (*a5)
    {
      LOBYTE(a5) = 0;
    }
    else
    {
      v82 = a5;
      [MEMORY[0x1E4F71EB8] errorForCode:-4];
      LOBYTE(a5) = 0;
      id *v82 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_109:

  return (char)a5;
}

void __72__PHACameraSmartSharingTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v36 = a2;
  v3 = [v36 emailAddresses];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v46;
    *(void *)&long long v5 = 138478083;
    long long v34 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "value", v34);
        if (([*(id *)(a1 + 32) containsObject:v9] & 1) == 0)
        {
          id v10 = objc_alloc(MEMORY[0x1E4F38FB8]);
          v11 = [v36 identifier];
          id v56 = v11;
          v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
          v13 = (void *)[v10 initWithPhoneNumber:0 emailAddress:v9 contactIdentifiers:v12];

          [*(id *)(a1 + 40) addObject:v13];
          v14 = *(NSObject **)(a1 + 48);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = *(void *)(a1 + 56);
            *(_DWORD *)buf = v34;
            id v53 = v13;
            __int16 v54 = 2112;
            uint64_t v55 = v15;
            _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Added additional identify %{private}@ for participant:%@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v6);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v16 = [v36 phoneNumbers];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v42;
    *(void *)&long long v18 = 138478083;
    long long v35 = v18;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * j), "value", v35);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v23 = *(id *)(a1 + 64);
        uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v50 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v38;
LABEL_19:
          uint64_t v27 = 0;
          while (1)
          {
            if (*(void *)v38 != v26) {
              objc_enumerationMutation(v23);
            }
            if ([*(id *)(*((void *)&v37 + 1) + 8 * v27) isLikePhoneNumber:v22]) {
              break;
            }
            if (v25 == ++v27)
            {
              uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v50 count:16];
              if (v25) {
                goto LABEL_19;
              }
              goto LABEL_25;
            }
          }
        }
        else
        {
LABEL_25:

          id v28 = objc_alloc(MEMORY[0x1E4F38FB8]);
          v29 = [v22 stringValue];
          v30 = [v36 identifier];
          int v49 = v30;
          v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
          id v23 = (id)[v28 initWithPhoneNumber:v29 emailAddress:0 contactIdentifiers:v31];

          [*(id *)(a1 + 40) addObject:v23];
          id v32 = *(NSObject **)(a1 + 48);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = *(void *)(a1 + 56);
            *(_DWORD *)buf = v35;
            id v53 = v23;
            __int16 v54 = 2112;
            uint64_t v55 = v33;
            _os_log_impl(&dword_1D21F2000, v32, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Added additional identify %{private}@ for participant:%@", buf, 0x16u);
          }
        }
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v19);
  }
}

- (id)_libraryScopeToUseWithGraphManager:(id)a3 error:(id *)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PHACameraSmartSharingTask *)self libraryScope];

  if (!v7)
  {
    id v8 = [v6 photoLibrary];
    id v9 = [v8 librarySpecificFetchOptions];

    [v9 setFetchLimit:1];
    id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    v27[0] = v10;
    v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
    v27[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    [v9 setSortDescriptors:v12];

    v13 = [v6 workingContext];
    v14 = [v13 loggingConnection];

    uint64_t v15 = (void *)MEMORY[0x1E4F39110];
    if (!self->_libraryScopeLocalIdentifier)
    {
      uint64_t v20 = (void *)[v9 copy];
      long long v21 = [v15 fetchActiveLibraryScopeWithOptions:v20];
      uint64_t v19 = [v21 firstObject];

      goto LABEL_8;
    }
    libraryScopeLocalIdentifier = self->_libraryScopeLocalIdentifier;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&libraryScopeLocalIdentifier count:1];
    uint64_t v17 = (void *)[v9 copy];
    long long v18 = [v15 fetchLibraryScopesWithLocalIdentifiers:v16 options:v17];
    uint64_t v19 = [v18 firstObject];

    if (v19)
    {
LABEL_9:
      [(PHACameraSmartSharingTask *)self setLibraryScope:v19];

      goto LABEL_10;
    }
    uint64_t v20 = [NSString stringWithFormat:@"Cannot find library scope for localIdentifier: %@", self->_libraryScopeLocalIdentifier];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v20;
      _os_log_error_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      if (a4) {
        goto LABEL_6;
      }
    }
    else if (a4)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 9, v20);
      uint64_t v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

      goto LABEL_9;
    }
    uint64_t v19 = 0;
    goto LABEL_8;
  }
LABEL_10:
  uint64_t v22 = [(PHACameraSmartSharingTask *)self libraryScope];

  return v22;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 photoLibrary];
  char v6 = [v5 isSystemPhotoLibrary];

  if ((v6 & 1) == 0)
  {
    id v9 = [v4 workingContext];
    id v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      v11 = "PHACameraSmartSharingTask: Task is running on a non system photo library: not running Camera Smart Sharing job";
      v12 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
LABEL_9:

    BOOL v8 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [(PHACameraSmartSharingTask *)self _libraryScopeToUseWithGraphManager:v4 error:0];

  if (!v7)
  {
    v13 = [v4 workingContext];
    id v10 = [v13 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      v11 = "PHACameraSmartSharingTask: Task is running without an active library scope: not running Camera Smart Sharing job";
      v12 = (uint8_t *)&v15;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (int)priority
{
  return 0;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  return 86400.0;
}

- (NSString)name
{
  return (NSString *)@"CameraSmartSharing";
}

@end