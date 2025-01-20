@interface PGShareBackPetSource
- (BOOL)prepareSourceWithGraph:(id)a3;
- (PGShareBackPetSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4;
- (PGShareBackPetSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4 faceIdentification:(id)a5;
- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6;
@end

@implementation PGShareBackPetSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIdentification, 0);
  objc_storeStrong((id *)&self->_petPersonLocalIdentifiersToCheck, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v93 objects:v104 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v94 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v93 + 1) + 8 * i) localIdentifier];
        if (v17) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v93 objects:v104 count:16];
    }
    while (v14);
  }

  if ([v11 count])
  {
    v18 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    uint64_t v103 = *MEMORY[0x1E4F394A8];
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
    [v18 setFetchPropertySets:v19];

    v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"faceAdjustmentVersion");
    [v18 setInternalPredicate:v20];

    v21 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v11 options:v18];
    if ([v21 count])
    {
      id v75 = v10;
      v22 = a6;
      v73 = self;
      v23 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      [v23 setIncludedDetectionTypes:&unk_1F28D38E8];
      v71 = v23;
      v72 = v21;
      v24 = [MEMORY[0x1E4F39050] fetchFacesGroupedByAssetLocalIdentifierForAssets:v21 options:v23];
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      v74 = v24;
      v26 = [v24 allValues];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v89 objects:v100 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v90;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v90 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = [*(id *)(*((void *)&v89 + 1) + 8 * j) fetchedObjects];
            [v25 addObjectsFromArray:v31];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v89 objects:v100 count:16];
        }
        while (v28);
      }

      if ([v25 count])
      {
        v32 = v73;
        faceIdentification = v73->_faceIdentification;
        id v88 = 0;
        v34 = [(CLSFaceIdentificationProtocol *)faceIdentification requestIdentificationOfFaces:v25 error:&v88];
        v35 = v88;
        v36 = v35;
        if (v35)
        {
          if (v22) {
            id *v22 = v35;
          }
          v37 = [(PGShareBackSource *)v73 loggingConnection];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v102 = v36;
            _os_log_error_impl(&dword_1D1805000, v37, OS_LOG_TYPE_ERROR, "[PGShareBackPetSource] Error while getting classification results for faces: %@", buf, 0xCu);
          }
          v38 = 0;
          id v10 = v75;
        }
        else
        {
          id v10 = v75;
          if ([v34 count])
          {
            id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v84 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            v37 = v12;
            uint64_t v41 = [v37 countByEnumeratingWithState:&v84 objects:v99 count:16];
            if (v41)
            {
              v69 = v34;
              uint64_t v42 = *(void *)v85;
              v67 = v37;
              uint64_t v61 = *(void *)v85;
              do
              {
                uint64_t v43 = 0;
                uint64_t v62 = v41;
                do
                {
                  if (*(void *)v85 != v42)
                  {
                    uint64_t v44 = v43;
                    objc_enumerationMutation(v37);
                    uint64_t v43 = v44;
                  }
                  uint64_t v64 = v43;
                  v45 = *(void **)(*((void *)&v84 + 1) + 8 * v43);
                  long long v80 = 0u;
                  long long v81 = 0u;
                  long long v82 = 0u;
                  long long v83 = 0u;
                  v46 = [v45 localIdentifier];
                  v47 = [v74 objectForKeyedSubscript:v46];

                  obuint64_t j = v47;
                  uint64_t v65 = [v47 countByEnumeratingWithState:&v80 objects:v98 count:16];
                  if (v65)
                  {
                    uint64_t v48 = *(void *)v81;
                    uint64_t v63 = *(void *)v81;
                    do
                    {
                      uint64_t v49 = 0;
                      v50 = v69;
                      do
                      {
                        if (*(void *)v81 != v48)
                        {
                          uint64_t v51 = v49;
                          objc_enumerationMutation(obj);
                          uint64_t v49 = v51;
                        }
                        uint64_t v66 = v49;
                        v52 = [*(id *)(*((void *)&v80 + 1) + 8 * v49) localIdentifier];
                        v53 = [v50 objectForKeyedSubscript:v52];

                        long long v78 = 0u;
                        long long v79 = 0u;
                        long long v76 = 0u;
                        long long v77 = 0u;
                        v54 = v32->_petPersonLocalIdentifiersToCheck;
                        uint64_t v55 = [(NSSet *)v54 countByEnumeratingWithState:&v76 objects:v97 count:16];
                        if (v55)
                        {
                          uint64_t v56 = v55;
                          uint64_t v57 = *(void *)v77;
                          while (2)
                          {
                            for (uint64_t k = 0; k != v56; ++k)
                            {
                              if (*(void *)v77 != v57) {
                                objc_enumerationMutation(v54);
                              }
                              v59 = [v53 objectForKeyedSubscript:*(void *)(*((void *)&v76 + 1) + 8 * k)];

                              if (v59)
                              {

                                v37 = v67;
                                id v10 = v75;
                                v60 = [[PGShareBackSuggesterResult alloc] initWithInputs:v67 processingValue:512 momentNodes:v75];
                                v38 = v68;
                                [v68 addObject:v60];

                                v36 = 0;
                                goto LABEL_66;
                              }
                            }
                            uint64_t v56 = [(NSSet *)v54 countByEnumeratingWithState:&v76 objects:v97 count:16];
                            if (v56) {
                              continue;
                            }
                            break;
                          }
                        }

                        uint64_t v49 = v66 + 1;
                        id v10 = v75;
                        v32 = v73;
                        v37 = v67;
                        v36 = 0;
                        v50 = v69;
                        uint64_t v48 = v63;
                      }
                      while (v66 + 1 != v65);
                      uint64_t v65 = [obj countByEnumeratingWithState:&v80 objects:v98 count:16];
                    }
                    while (v65);
                  }

                  uint64_t v43 = v64 + 1;
                  uint64_t v42 = v61;
                }
                while (v64 + 1 != v62);
                uint64_t v41 = [v37 countByEnumeratingWithState:&v84 objects:v99 count:16];
              }
              while (v41);
              v38 = v68;
LABEL_66:
              v34 = v69;
            }
            else
            {
              v38 = v68;
            }
          }
          else
          {
            v37 = [(PGShareBackSource *)v73 loggingConnection];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No classification results for faces", buf, 2u);
            }
            v38 = (void *)MEMORY[0x1E4F1CBF0];
          }
        }
      }
      else
      {
        v36 = [(PGShareBackSource *)v73 loggingConnection];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No pet faces for assets", buf, 2u);
        }
        v38 = (void *)MEMORY[0x1E4F1CBF0];
        id v10 = v75;
      }

      v39 = v71;
      v21 = v72;
    }
    else
    {
      v39 = [(PGShareBackSource *)self loggingConnection];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v102 = v11;
        _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No assets with faces processed for asset local identifiers: %@", buf, 0xCu);
      }
      v38 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v18 = [(PGShareBackSource *)self loggingConnection];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No assets to process", buf, 2u);
    }
    v38 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v38;
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  id v4 = a3;
  v5 = [(PGShareBackSource *)self loggingConnection];
  v6 = [v4 meNode];

  if (v6)
  {
    v7 = [v6 collection];
    v8 = [v7 ownedPetNodes];

    if ([v8 count])
    {
      id v9 = [v8 localIdentifiers];
      if ([(NSSet *)v9 count])
      {
        petPersonLocalIdentifiersToChecuint64_t k = self->_petPersonLocalIdentifiersToCheck;
        self->_petPersonLocalIdentifiersToChecuint64_t k = v9;
        v11 = v9;

        BOOL v12 = 1;
LABEL_14:

        goto LABEL_15;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[PGShareBackPetSource] No pet local identifiers available", v14, 2u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No pets available", v15, 2u);
    }
    BOOL v12 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No me node available, unable to infer user's pets", buf, 2u);
  }
  BOOL v12 = 0;
LABEL_15:

  return v12;
}

- (PGShareBackPetSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4 faceIdentification:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PGShareBackPetSource;
  v11 = [(PGShareBackSource *)&v14 initWithLoggingConnection:a3];
  BOOL v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a4);
    objc_storeStrong((id *)&v12->_faceIdentification, a5);
  }

  return v12;
}

- (PGShareBackPetSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v6 isSystemPhotoLibrary];
  id v9 = (Class *)0x1E4F76C88;
  if (!v8) {
    id v9 = (Class *)0x1E4F76C90;
  }
  id v10 = objc_alloc_init(*v9);
  v11 = [(PGShareBackPetSource *)self initWithLoggingConnection:v7 photoLibrary:v6 faceIdentification:v10];

  return v11;
}

@end