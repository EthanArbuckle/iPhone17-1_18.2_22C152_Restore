@interface PGShareBackFacesSource
- (BOOL)prepareSourceWithGraph:(id)a3;
- (PGShareBackFacesSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4;
- (PGShareBackFacesSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4 faceIdentification:(id)a5;
- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6;
@end

@implementation PGShareBackFacesSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIdentification, 0);
  objc_storeStrong((id *)&self->_childPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_meLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v125 objects:v138 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v126;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v126 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v125 + 1) + 8 * i) localIdentifier];
        if (v17) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v125 objects:v138 count:16];
    }
    while (v14);
  }

  if ([v11 count])
  {
    v18 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    uint64_t v137 = *MEMORY[0x1E4F394A8];
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v137 count:1];
    [v18 setFetchPropertySets:v19];

    v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"faceAdjustmentVersion");
    [v18 setInternalPredicate:v20];

    v21 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v11 options:v18];
    if ([v21 count])
    {
      v97 = self;
      v94 = v21;
      v95 = v18;
      v22 = [MEMORY[0x1E4F39050] fetchFacesGroupedByAssetLocalIdentifierForAssets:v21 options:0];
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      v96 = v22;
      v24 = [v22 allValues];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v121 objects:v134 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v122;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v122 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = [*(id *)(*((void *)&v121 + 1) + 8 * j) fetchedObjects];
            [v23 addObjectsFromArray:v29];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v121 objects:v134 count:16];
        }
        while (v26);
      }

      if ([v23 count])
      {
        p_isa = (id *)&v97->super.super.isa;
        faceIdentificatiouint64_t n = v97->_faceIdentification;
        id v120 = 0;
        v32 = [(CLSFaceIdentificationProtocol *)faceIdentification requestIdentificationOfFaces:v23 error:&v120];
        v33 = v120;
        v34 = v33;
        if (v33)
        {
          if (a6) {
            *a6 = v33;
          }
          v35 = [(PGShareBackSource *)v97 loggingConnection];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v136 = v34;
            _os_log_error_impl(&dword_1D1805000, v35, OS_LOG_TYPE_ERROR, "[PGShareBackFacesSource] Error while getting classification results for faces: %@", buf, 0xCu);
          }
          id v36 = 0;
        }
        else if ([v32 count])
        {
          v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          id v93 = v10;
          v92 = v32;
          if ([v10 count])
          {
            v38 = v35;
            long long v118 = 0u;
            long long v119 = 0u;
            long long v116 = 0u;
            long long v117 = 0u;
            obuint64_t j = v10;
            uint64_t v39 = [obj countByEnumeratingWithState:&v116 objects:v133 count:16];
            if (v39)
            {
              uint64_t v40 = v39;
              uint64_t v41 = *(void *)v117;
              do
              {
                for (uint64_t k = 0; k != v40; ++k)
                {
                  if (*(void *)v117 != v41) {
                    objc_enumerationMutation(obj);
                  }
                  v43 = [*(id *)(*((void *)&v116 + 1) + 8 * k) collection];
                  v44 = [v43 personNodes];
                  v45 = [v44 localIdentifiers];
                  [v38 unionSet:v45];
                }
                uint64_t v40 = [obj countByEnumeratingWithState:&v116 objects:v133 count:16];
              }
              while (v40);
            }

            p_isa = (id *)&v97->super.super.isa;
            v46 = [(PGShareBackSource *)v97 loggingConnection];
            v35 = v38;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v136 = v38;
              _os_log_impl(&dword_1D1805000, v46, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] Persons to match: %@", buf, 0xCu);
            }

            v34 = 0;
            id v10 = v93;
            v32 = v92;
          }
          uint64_t v47 = [p_isa[3] length];
          if ([v35 count] | v47)
          {
            uint64_t v87 = v47;
            id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v112 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            v48 = v12;
            uint64_t v49 = [v48 countByEnumeratingWithState:&v112 objects:v132 count:16];
            if (!v49) {
              goto LABEL_101;
            }
            uint64_t v50 = *(void *)v113;
            v89 = v48;
            uint64_t v81 = *(void *)v113;
            while (1)
            {
              uint64_t v51 = 0;
              uint64_t v84 = v49;
              do
              {
                if (*(void *)v113 != v50)
                {
                  uint64_t v52 = v51;
                  objc_enumerationMutation(v48);
                  uint64_t v51 = v52;
                }
                uint64_t v86 = v51;
                v53 = *(void **)(*((void *)&v112 + 1) + 8 * v51);
                long long v108 = 0u;
                long long v109 = 0u;
                long long v110 = 0u;
                long long v111 = 0u;
                v54 = [v53 localIdentifier];
                v55 = [v96 objectForKeyedSubscript:v54];

                v56 = v55;
                uint64_t v57 = [v55 countByEnumeratingWithState:&v108 objects:v131 count:16];
                if (!v57)
                {

                  goto LABEL_88;
                }
                int v58 = 0;
                uint64_t v59 = *(void *)v109;
                v91 = v35;
                v88 = v56;
                uint64_t v83 = *(void *)v109;
                while (2)
                {
                  uint64_t v60 = 0;
                  uint64_t v82 = v57;
                  do
                  {
                    int v90 = v58;
                    if (*(void *)v109 != v59)
                    {
                      uint64_t v61 = v60;
                      objc_enumerationMutation(v56);
                      uint64_t v60 = v61;
                    }
                    uint64_t v85 = v60;
                    v62 = [*(id *)(*((void *)&v108 + 1) + 8 * v60) localIdentifier];
                    v63 = [v32 objectForKeyedSubscript:v62];

                    long long v106 = 0u;
                    long long v107 = 0u;
                    long long v104 = 0u;
                    long long v105 = 0u;
                    v64 = v35;
                    uint64_t v65 = [v64 countByEnumeratingWithState:&v104 objects:v130 count:16];
                    if (v65)
                    {
                      uint64_t v66 = v65;
                      uint64_t v67 = *(void *)v105;
                      while (2)
                      {
                        for (uint64_t m = 0; m != v66; ++m)
                        {
                          if (*(void *)v105 != v67) {
                            objc_enumerationMutation(v64);
                          }
                          v69 = [v63 objectForKeyedSubscript:*(void *)(*((void *)&v104 + 1) + 8 * m)];

                          if (v69)
                          {

                            goto LABEL_98;
                          }
                        }
                        uint64_t v66 = [v64 countByEnumeratingWithState:&v104 objects:v130 count:16];
                        if (v66) {
                          continue;
                        }
                        break;
                      }
                    }

                    if ((unsigned __int16)v90 == 64)
                    {
LABEL_98:
                      LOWORD(v58) = 64;
                      id v10 = v93;
                      v35 = v91;
LABEL_99:

                      v32 = v92;
                      v34 = 0;
LABEL_100:
                      v77 = [PGShareBackSuggesterResult alloc];
                      uint64_t v78 = (unsigned __int16)v58;
                      v48 = v89;
                      v79 = [(PGShareBackSuggesterResult *)v77 initWithInputs:v89 processingValue:v78 momentNodes:v10];
                      [v36 addObject:v79];

                      goto LABEL_101;
                    }
                    id v10 = v93;
                    v35 = v91;
                    if (v87)
                    {
                      v70 = v97;
                      v71 = [v63 objectForKeyedSubscript:v97->_meLocalIdentifier];

                      LOWORD(v58) = 32;
                      if (v71 || (unsigned __int16)v90 == 32) {
                        goto LABEL_99;
                      }
                    }
                    else
                    {
                      v70 = v97;
                      if ((unsigned __int16)v90 == 32)
                      {
                        LOWORD(v58) = 32;
                        goto LABEL_99;
                      }
                    }
                    long long v102 = 0u;
                    long long v103 = 0u;
                    long long v100 = 0u;
                    long long v101 = 0u;
                    obja = v70->_childPersonLocalIdentifiers;
                    uint64_t v72 = [(NSSet *)obja countByEnumeratingWithState:&v100 objects:v129 count:16];
                    if (v72)
                    {
                      uint64_t v73 = v72;
                      uint64_t v74 = *(void *)v101;
                      while (2)
                      {
                        for (uint64_t n = 0; n != v73; ++n)
                        {
                          if (*(void *)v101 != v74) {
                            objc_enumerationMutation(obja);
                          }
                          v76 = [v63 objectForKeyedSubscript:*(void *)(*((void *)&v100 + 1) + 8 * n)];

                          if (v76)
                          {
                            int v58 = 0x4000;
                            v35 = v91;
                            goto LABEL_83;
                          }
                        }
                        uint64_t v73 = [(NSSet *)obja countByEnumeratingWithState:&v100 objects:v129 count:16];
                        if (v73) {
                          continue;
                        }
                        break;
                      }
                      v35 = v91;
                    }
                    int v58 = v90;
LABEL_83:

                    uint64_t v60 = v85 + 1;
                    uint64_t v59 = v83;
                    v32 = v92;
                    v34 = 0;
                    v56 = v88;
                  }
                  while (v85 + 1 != v82);
                  uint64_t v57 = [v88 countByEnumeratingWithState:&v108 objects:v131 count:16];
                  uint64_t v59 = v83;
                  if (v57) {
                    continue;
                  }
                  break;
                }

                if ((_WORD)v58) {
                  goto LABEL_100;
                }
LABEL_88:
                uint64_t v51 = v86 + 1;
                uint64_t v50 = v81;
                v48 = v89;
              }
              while (v86 + 1 != v84);
              uint64_t v49 = [v89 countByEnumeratingWithState:&v112 objects:v132 count:16];
              if (!v49) {
                goto LABEL_101;
              }
            }
          }
          v48 = [p_isa loggingConnection];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] No persons to match", buf, 2u);
          }
          id v36 = (id)MEMORY[0x1E4F1CBF0];
LABEL_101:
        }
        else
        {
          v35 = [(PGShareBackSource *)v97 loggingConnection];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] No classification results for faces", buf, 2u);
          }
          id v36 = (id)MEMORY[0x1E4F1CBF0];
        }
      }
      else
      {
        v34 = [(PGShareBackSource *)v97 loggingConnection];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] No faces for assets", buf, 2u);
        }
        id v36 = (id)MEMORY[0x1E4F1CBF0];
      }

      v21 = v94;
      v18 = v95;
      v37 = v96;
    }
    else
    {
      v37 = [(PGShareBackSource *)self loggingConnection];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v136 = v11;
        _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] No assets with faces processed for asset local identifiers: %@", buf, 0xCu);
      }
      id v36 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v18 = [(PGShareBackSource *)self loggingConnection];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] No assets to process", buf, 2u);
    }
    id v36 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v36;
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [a3 meNodeWithFallbackInferredMeNode];
  v5 = v4;
  if (v4)
  {
    if (([v4 isMeNode] & 1) == 0)
    {
      v6 = [(PGShareBackSource *)self loggingConnection];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        v22 = v5;
        _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "[PGShareBackFacesSource] No meNode set, using inferred meNode %@", (uint8_t *)&v21, 0xCu);
      }
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8 = [v5 localIdentifier];
    meLocalIdentifier = self->_meLocalIdentifier;
    self->_meLocalIdentifier = v8;

    id v10 = [v5 collection];
    v11 = [v10 childPersonNodes];
    id v12 = [v11 localIdentifiers];
    [v7 unionSet:v12];

    uint64_t v13 = [v10 inferredChildPersonNodes];
    uint64_t v14 = [v13 localIdentifiers];
    [v7 unionSet:v14];

    if ([v7 count])
    {
      uint64_t v15 = [(PGShareBackSource *)self loggingConnection];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v7 debugDescription];
        int v21 = 138412290;
        v22 = v16;
        _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_DEFAULT, "[PGShareBackFacesSource] Child persons to check %@", (uint8_t *)&v21, 0xCu);
      }
    }
  }
  else
  {
    v17 = [(PGShareBackSource *)self loggingConnection];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_DEFAULT, "[PGShareBackFacesSource] Couldn't infer device owner", (uint8_t *)&v21, 2u);
    }

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  v18 = (NSSet *)[v7 copy];
  childPersonLocalIdentifiers = self->_childPersonLocalIdentifiers;
  self->_childPersonLocalIdentifiers = v18;

  return 1;
}

- (PGShareBackFacesSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4 faceIdentification:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PGShareBackFacesSource;
  v11 = [(PGShareBackSource *)&v14 initWithLoggingConnection:a3];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a4);
    objc_storeStrong((id *)&v12->_faceIdentification, a5);
  }

  return v12;
}

- (PGShareBackFacesSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v6 isSystemPhotoLibrary];
  id v9 = (Class *)0x1E4F76C88;
  if (!v8) {
    id v9 = (Class *)0x1E4F76C90;
  }
  id v10 = objc_alloc_init(*v9);
  v11 = [(PGShareBackFacesSource *)self initWithLoggingConnection:v7 photoLibrary:v6 faceIdentification:v10];

  return v11;
}

@end