@interface SEMIndexSiteWriter
- (BOOL)_indexUpdatesToSets:(id)a3 allSetsBlock:(id)a4 shouldDefer:(id)a5;
- (BOOL)_loadChangeRegistry:(id)a3 indexDirectory:(id)a4 createIfNotExists:(BOOL)a5 error:(id *)a6;
- (BOOL)_logCurrentStateWithAllSetsBlock:(id)a3;
- (BOOL)_performVerificationWithAllSetsBlock:(id)a3 shouldDefer:(id)a4;
- (BOOL)_recordSiteInfoObject:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)_resetSiteDirectory;
- (BOOL)_updateIndex:(id)a3 mode:(unsigned __int8)a4 sets:(id)a5 shouldDefer:(id)a6 shouldRebuild:(BOOL *)a7;
- (BOOL)_updateOrRebuildIndex:(id)a3 updatedSets:(id)a4 allSetsBlock:(id)a5 shouldDefer:(id)a6;
- (BOOL)performOperation:(unsigned __int8)a3 updatedSets:(id)a4 allSetsBlock:(id)a5 shouldDefer:(id)a6;
- (BOOL)recordDate:(id)a3 ofOperation:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)recordSchemaVersion:(id)a3 error:(id *)a4;
- (SEMIndexSite)indexSite;
- (SEMIndexSiteWriter)initWithIndexSite:(id)a3 settings:(id)a4;
- (id)_applicableSets:(id)a3 toUpdaterClass:(Class)a4;
- (id)_indexDirectory:(id)a3;
- (id)_loadSiteInfo:(id *)a3;
- (id)_siteInfoObjectForKey:(id)a3 error:(id *)a4;
- (id)description;
- (id)lastRecordedDateOfOperation:(unsigned __int8)a3 error:(id *)a4;
- (id)schemaVersion:(id *)a3;
- (void)_initUpdaterConfiguration;
@end

@implementation SEMIndexSiteWriter

- (SEMIndexSiteWriter)initWithIndexSite:(id)a3 settings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SEMIndexSiteWriter;
  v9 = [(SEMIndexSiteWriter *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_indexSite, a3);
    objc_storeStrong((id *)&v10->_settings, a4);
    objc_msgSend__initUpdaterConfiguration(v10, v11, v12, v13);
  }

  return v10;
}

- (void)_initUpdaterConfiguration
{
  v3 = (SEMIndexUpdaterConfiguration *)objc_opt_new();
  skit = self->_skit;
  self->_skit = v3;

  v5 = self->_skit;
  uint64_t v6 = objc_opt_class();
  objc_msgSend_setUpdaterClass_(v5, v7, v6, v8);
  v9 = (SEMIndexUpdaterConfiguration *)objc_opt_new();
  fts = self->_fts;
  self->_fts = v9;

  v11 = self->_fts;
  uint64_t v13 = objc_opt_class();
  objc_msgSend_setUpdaterClass_(v11, v12, v13, v14);
}

- (id)description
{
  return (id)objc_msgSend_description(self->_indexSite, a2, v2, v3);
}

- (BOOL)performOperation:(unsigned __int8)a3 updatedSets:(id)a4 allSetsBlock:(id)a5 shouldDefer:(id)a6
{
  unsigned int v8 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v14 = a6;
  if (v11)
  {
    uint64_t v15 = 0;
    switch(v8)
    {
      case 1u:
        uint64_t v15 = (uint64_t)v10;
        goto LABEL_4;
      case 2u:
LABEL_4:
        char shouldDefer = objc_msgSend__indexUpdatesToSets_allSetsBlock_shouldDefer_(self, v12, v15, (uint64_t)v11, v14);
        break;
      case 3u:
        char shouldDefer = objc_msgSend__performVerificationWithAllSetsBlock_shouldDefer_(self, v12, (uint64_t)v11, (uint64_t)v14);
        break;
      case 4u:
        char shouldDefer = objc_msgSend__resetSiteDirectory(self, v12, 0, v13);
        break;
      case 5u:
        char shouldDefer = objc_msgSend__logCurrentStateWithAllSetsBlock_(self, v12, (uint64_t)v11, v13);
        break;
      default:
        v19 = (id)qword_26B3549D8;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          sub_25C7FBCF8(v8, v20, v21, v22);
          v25 = (SEMIndexSite *)objc_claimAutoreleasedReturnValue();
          int v26 = 136315394;
          v27 = "-[SEMIndexSiteWriter performOperation:updatedSets:allSetsBlock:shouldDefer:]";
          __int16 v28 = 2112;
          v29 = v25;
          _os_log_error_impl(&dword_25C7CA000, v19, OS_LOG_TYPE_ERROR, "%s Unexpected operation: %@", (uint8_t *)&v26, 0x16u);
        }
        goto LABEL_11;
    }
    BOOL v23 = shouldDefer;
  }
  else
  {
    v17 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      indexSite = self->_indexSite;
      int v26 = 136315650;
      v27 = "-[SEMIndexSiteWriter performOperation:updatedSets:allSetsBlock:shouldDefer:]";
      __int16 v28 = 2112;
      v29 = indexSite;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_error_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_ERROR, "%s (%@) Missing allSets block (updated: %@)", (uint8_t *)&v26, 0x20u);
    }
LABEL_11:
    BOOL v23 = 0;
  }

  return v23;
}

- (id)lastRecordedDateOfOperation:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v6 = sub_25C7FBCF8(a3, a2, a3, (uint64_t)a4);
  unsigned int v8 = objc_msgSend__siteInfoObjectForKey_error_(self, v7, (uint64_t)v6, (uint64_t)a4);

  return v8;
}

- (BOOL)recordDate:(id)a3 ofOperation:(unsigned __int8)a4 error:(id *)a5
{
  unsigned int v6 = a4;
  id v8 = a3;
  uint64_t v12 = sub_25C7FBCF8(v6, v9, v10, v11);
  LOBYTE(a5) = objc_msgSend__recordSiteInfoObject_forKey_error_(self, v13, (uint64_t)v8, (uint64_t)v12, a5);

  return (char)a5;
}

- (id)schemaVersion:(id *)a3
{
  return (id)objc_msgSend__siteInfoObjectForKey_error_(self, a2, @"schemaVersion", (uint64_t)a3);
}

- (BOOL)recordSchemaVersion:(id)a3 error:(id *)a4
{
  return objc_msgSend__recordSiteInfoObject_forKey_error_(self, a2, (uint64_t)a3, @"schemaVersion", a4);
}

- (BOOL)_resetSiteDirectory
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v3 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    indexSite = self->_indexSite;
    *(_DWORD *)buf = 136315394;
    v36 = "-[SEMIndexSiteWriter _resetSiteDirectory]";
    __int16 v37 = 2112;
    v38 = indexSite;
    _os_log_impl(&dword_25C7CA000, v3, OS_LOG_TYPE_INFO, "%s (%@) Resetting all index site state", buf, 0x16u);
  }
  id v8 = objc_msgSend_indexSiteURL(self->_indexSite, v4, v5, v6);
  id v34 = 0;
  char v9 = sub_25C7EFD04(v8, &v34);
  id v10 = v34;

  if ((v9 & 1) == 0)
  {
    BOOL v23 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v26 = self->_indexSite;
      *(_DWORD *)buf = 136315650;
      v36 = "-[SEMIndexSiteWriter _resetSiteDirectory]";
      __int16 v37 = 2112;
      v38 = v26;
      __int16 v39 = 2112;
      uint64_t v40 = (uint64_t)v10;
      v27 = "%s (%@) Failed to remove site directory: %@";
LABEL_15:
      _os_log_error_impl(&dword_25C7CA000, v23, OS_LOG_TYPE_ERROR, v27, buf, 0x20u);
    }
LABEL_16:
    BOOL v24 = 0;
    goto LABEL_17;
  }
  siteInfo = self->_siteInfo;
  self->_siteInfo = 0;

  objc_msgSend__initUpdaterConfiguration(self, v12, v13, v14);
  v18 = objc_msgSend_indexSiteURL(self->_indexSite, v15, v16, v17);
  id v33 = v10;
  v19 = sub_25C7EFC30(v18, &v33);
  id v20 = v33;

  if (v19)
  {
    id v32 = v20;
    char v22 = objc_msgSend__recordSiteInfoObject_forKey_error_(self, v21, 0x2709EA550, @"schemaVersion", &v32);
    id v10 = v32;

    BOOL v23 = qword_26B3549D8;
    if (v22)
    {
      BOOL v24 = 1;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        v25 = self->_indexSite;
        *(_DWORD *)buf = 136315650;
        v36 = "-[SEMIndexSiteWriter _resetSiteDirectory]";
        __int16 v37 = 2112;
        v38 = v25;
        __int16 v39 = 2112;
        uint64_t v40 = 0x2709EA550;
        _os_log_impl(&dword_25C7CA000, v23, OS_LOG_TYPE_INFO, "%s (%@) Index site initialized with schema version: %@", buf, 0x20u);
      }
      goto LABEL_17;
    }
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      v29 = self->_indexSite;
      *(_DWORD *)buf = 136315650;
      v36 = "-[SEMIndexSiteWriter _resetSiteDirectory]";
      __int16 v37 = 2112;
      v38 = v29;
      __int16 v39 = 2112;
      uint64_t v40 = (uint64_t)v10;
      v27 = "%s (%@) Failed to record schema version: %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  __int16 v28 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    id v31 = self->_indexSite;
    *(_DWORD *)buf = 136315650;
    v36 = "-[SEMIndexSiteWriter _resetSiteDirectory]";
    __int16 v37 = 2112;
    v38 = v31;
    __int16 v39 = 2112;
    uint64_t v40 = (uint64_t)v20;
    _os_log_error_impl(&dword_25C7CA000, v28, OS_LOG_TYPE_ERROR, "%s (%@) Failed to recreate site directory: %@", buf, 0x20u);
  }
  BOOL v24 = 0;
  id v10 = v20;
LABEL_17:

  return v24;
}

- (BOOL)_indexUpdatesToSets:(id)a3 allSetsBlock:(id)a4 shouldDefer:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int shouldDefer = objc_msgSend__updateOrRebuildIndex_updatedSets_allSetsBlock_shouldDefer_(self, v11, (uint64_t)self->_skit, (uint64_t)v8, v9, v10);
  int v14 = shouldDefer & objc_msgSend__updateOrRebuildIndex_updatedSets_allSetsBlock_shouldDefer_(self, v13, (uint64_t)self->_fts, (uint64_t)v8, v9, v10);
  if (v14 == 1)
  {
    uint64_t v15 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = @"set updates";
      indexSite = self->_indexSite;
      id v20 = "-[SEMIndexSiteWriter _indexUpdatesToSets:allSetsBlock:shouldDefer:]";
      int v19 = 136315650;
      if (!v8) {
        uint64_t v16 = @"all sets";
      }
      __int16 v21 = 2112;
      char v22 = indexSite;
      __int16 v23 = 2112;
      BOOL v24 = v16;
      _os_log_impl(&dword_25C7CA000, v15, OS_LOG_TYPE_INFO, "%s (%@) Finished indexing %@", (uint8_t *)&v19, 0x20u);
    }
  }

  return v14;
}

- (BOOL)_performVerificationWithAllSetsBlock:(id)a3 shouldDefer:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(void))a3;
  id v7 = a4;
  uint64_t skit = (uint64_t)self->_skit;
  id v9 = v6[2](v6);
  LODWORD(skit) = objc_msgSend__updateIndex_mode_sets_shouldDefer_shouldRebuild_(self, v10, skit, 3, v9, v7, 0);

  uint64_t fts = (uint64_t)self->_fts;
  uint64_t v12 = v6[2](v6);
  LODWORD(fts) = objc_msgSend__updateIndex_mode_sets_shouldDefer_shouldRebuild_(self, v13, fts, 3, v12, v7, 0);

  int v14 = skit & fts;
  if (v14 == 1)
  {
    uint64_t v15 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      indexSite = self->_indexSite;
      int v18 = 136315394;
      int v19 = "-[SEMIndexSiteWriter _performVerificationWithAllSetsBlock:shouldDefer:]";
      __int16 v20 = 2112;
      __int16 v21 = indexSite;
      _os_log_impl(&dword_25C7CA000, v15, OS_LOG_TYPE_INFO, "%s (%@) Finished verification", (uint8_t *)&v18, 0x16u);
    }
  }

  return v14;
}

- (BOOL)_logCurrentStateWithAllSetsBlock:(id)a3
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  v68 = (void (**)(void))a3;
  v73 = v68[2]();
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t fts = self->_fts;
  v111[0] = self->_skit;
  v111[1] = fts;
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v111, 2);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v98, (uint64_t)v112, 16);
  if (v11)
  {
    uint64_t v72 = *(void *)v99;
    char v69 = 1;
    v71 = v6;
    do
    {
      uint64_t v12 = 0;
      uint64_t v75 = v11;
      do
      {
        if (*(void *)v99 != v72) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v98 + 1) + 8 * v12);
        int v14 = objc_msgSend_updaterClass(v13, v8, v9, v10);
        v78 = objc_msgSend_indexName(v14, v15, v16, v17);
        v79 = objc_msgSend__indexDirectory_(self, v18, (uint64_t)v13, v19);
        __int16 v20 = (void *)MEMORY[0x263EFF9C0];
        uint64_t v24 = objc_msgSend_updaterClass(v13, v21, v22, v23);
        uint64_t v26 = objc_msgSend__applicableSets_toUpdaterClass_(self, v25, (uint64_t)v73, v24);
        v77 = objc_msgSend_setWithArray_(v20, v27, v26, v28);
        uint64_t v76 = v12;

        id v97 = 0;
        LOBYTE(v26) = objc_msgSend__loadChangeRegistry_indexDirectory_createIfNotExists_error_(self, v29, (uint64_t)v13, (uint64_t)v79, 0, &v97);
        id v33 = v97;
        if (v26)
        {
          id v34 = objc_msgSend_changeRegistry(v13, v30, v31, v32);
          uint64_t v93 = 0;
          v94 = &v93;
          uint64_t v95 = 0x2020000000;
          int v96 = 0;
          v35 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
          {
            indexSite = self->_indexSite;
            *(_DWORD *)buf = 136315650;
            v104 = "-[SEMIndexSiteWriter _logCurrentStateWithAllSetsBlock:]";
            __int16 v105 = 2112;
            v106 = indexSite;
            __int16 v107 = 2112;
            id v108 = v78;
            _os_log_impl(&dword_25C7CA000, v35, OS_LOG_TYPE_INFO, "%s (%@) [%@] Enumerating all registered bookmarks", buf, 0x20u);
          }
          id v92 = v33;
          v86[0] = MEMORY[0x263EF8330];
          v86[1] = 3221225472;
          v86[2] = sub_25C7FD0F0;
          v86[3] = &unk_2654DE6F8;
          id v37 = v34;
          id v87 = v37;
          v88 = self;
          id v38 = v78;
          id v89 = v38;
          __int16 v39 = v77;
          v90 = v39;
          v91 = &v93;
          v70 = v37;
          int v41 = objc_msgSend_enumerateAllBookmarks_usingBlock_(v37, v40, (uint64_t)&v92, (uint64_t)v86);
          id v74 = v92;

          if ((v41 & 1) == 0)
          {
            v42 = qword_26B3549D8;
            if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
            {
              v66 = self->_indexSite;
              *(_DWORD *)buf = 136315906;
              v104 = "-[SEMIndexSiteWriter _logCurrentStateWithAllSetsBlock:]";
              __int16 v105 = 2112;
              v106 = v66;
              __int16 v107 = 2112;
              id v108 = v38;
              __int16 v109 = 2112;
              *(void *)v110 = v74;
              _os_log_error_impl(&dword_25C7CA000, v42, OS_LOG_TYPE_ERROR, "%s (%@) [%@] Failed to enumerate change registry: %@", buf, 0x2Au);
            }
            char v69 = 0;
          }

          if (v41)
          {
            v43 = (id)qword_26B3549D8;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              v47 = self->_indexSite;
              int v48 = *((_DWORD *)v94 + 6);
              uint64_t v49 = objc_msgSend_count(v39, v44, v45, v46);
              *(_DWORD *)buf = 136316162;
              v50 = @"none";
              if (v49) {
                v50 = v39;
              }
              v104 = "-[SEMIndexSiteWriter _logCurrentStateWithAllSetsBlock:]";
              __int16 v105 = 2112;
              v106 = v47;
              __int16 v107 = 2112;
              id v108 = v38;
              __int16 v109 = 1024;
              *(_DWORD *)v110 = v48;
              *(_WORD *)&v110[4] = 2112;
              *(void *)&v110[6] = v50;
              _os_log_impl(&dword_25C7CA000, v43, OS_LOG_TYPE_INFO, "%s (%@) [%@] Enumerated %u bookmarks for sets excluding %@", buf, 0x30u);
            }

            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            v51 = v39;
            uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v82, (uint64_t)v102, 16);
            if (v53)
            {
              uint64_t v54 = *(void *)v83;
              do
              {
                for (uint64_t i = 0; i != v53; ++i)
                {
                  if (*(void *)v83 != v54) {
                    objc_enumerationMutation(v51);
                  }
                  v56 = *(void **)(*((void *)&v82 + 1) + 8 * i);
                  v57 = (void *)MEMORY[0x261194780]();
                  v61 = objc_msgSend_personaIdentifier(v56, v58, v59, v60);
                  v80[0] = MEMORY[0x263EF8330];
                  v80[1] = 3221225472;
                  v80[2] = sub_25C7FD490;
                  v80[3] = &unk_2654DE720;
                  v80[4] = v56;
                  v80[5] = self;
                  id v81 = v38;
                  objc_msgSend_runAsPersonaIdentifier_block_(SEMPersonaUtilities, v62, (uint64_t)v61, (uint64_t)v80);
                }
                uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v63, (uint64_t)&v82, (uint64_t)v102, 16);
              }
              while (v53);
            }
          }
          _Block_object_dispose(&v93, 8);

          id v33 = v74;
        }
        else
        {
          v64 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
          {
            v65 = self->_indexSite;
            *(_DWORD *)buf = 136315906;
            v104 = "-[SEMIndexSiteWriter _logCurrentStateWithAllSetsBlock:]";
            __int16 v105 = 2112;
            v106 = v65;
            __int16 v107 = 2112;
            id v108 = v78;
            __int16 v109 = 2112;
            *(void *)v110 = v77;
            _os_log_impl(&dword_25C7CA000, v64, OS_LOG_TYPE_INFO, "%s (%@) [%@] Change registry not found with current applicable sets: %@", buf, 0x2Au);
          }
        }

        uint64_t v12 = v76 + 1;
        uint64_t v6 = v71;
      }
      while (v76 + 1 != v75);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v8, (uint64_t)&v98, (uint64_t)v112, 16);
    }
    while (v11);
  }
  else
  {
    char v69 = 1;
  }

  return v69 & 1;
}

- (BOOL)_updateOrRebuildIndex:(id)a3 updatedSets:(id)a4 allSetsBlock:(id)a5 shouldDefer:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(void))a5;
  id v14 = a6;
  char v33 = 0;
  if (v11)
  {
    char shouldRebuild = objc_msgSend__updateIndex_mode_sets_shouldDefer_shouldRebuild_(self, v13, (uint64_t)v10, 1, v11, v14, &v33);
    if (v33) {
      char v16 = 0;
    }
    else {
      char v16 = shouldRebuild;
    }
    if (!v33) {
      goto LABEL_15;
    }
  }
  else
  {
    char v33 = 1;
  }
  uint64_t v17 = v12[2](v12);
  char v16 = objc_msgSend__updateIndex_mode_sets_shouldDefer_shouldRebuild_(self, v18, (uint64_t)v10, 2, v17, v14, &v33);

  if (v33) {
    char v19 = v16;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0)
  {
    __int16 v20 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      indexSite = self->_indexSite;
      uint64_t v25 = objc_msgSend_updaterClass(v10, v21, v22, v23);
      v29 = objc_msgSend_indexName(v25, v26, v27, v28);
      *(_DWORD *)buf = 136315650;
      v35 = "-[SEMIndexSiteWriter _updateOrRebuildIndex:updatedSets:allSetsBlock:shouldDefer:]";
      __int16 v36 = 2112;
      id v37 = indexSite;
      __int16 v38 = 2112;
      __int16 v39 = v29;
      _os_log_impl(&dword_25C7CA000, v20, OS_LOG_TYPE_INFO, "%s (%@) Failed to rebuild %@. Retrying one more time", buf, 0x20u);
    }
    __int16 v30 = v12[2](v12);
    char v16 = objc_msgSend__updateIndex_mode_sets_shouldDefer_shouldRebuild_(self, v31, (uint64_t)v10, 2, v30, v14, 0);
  }
LABEL_15:

  return v16;
}

- (BOOL)_updateIndex:(id)a3 mode:(unsigned __int8)a4 sets:(id)a5 shouldDefer:(id)a6 shouldRebuild:(BOOL *)a7
{
  unsigned int v9 = a4;
  uint64_t v186 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = v13;
  if (!v13 || !(*((unsigned int (**)(id))v13 + 2))(v13))
  {
    __int16 v21 = objc_msgSend_updaterClass(v11, v14, v15, v16);
    v163 = objc_msgSend__indexDirectory_(self, v22, (uint64_t)v11, v23);
    v161 = objc_msgSend_indexName(v21, v24, v25, v26);
    v162 = objc_msgSend__applicableSets_toUpdaterClass_(self, v27, (uint64_t)v12, (uint64_t)v21);
    if (!objc_msgSend_count(v162, v28, v29, v30))
    {
      uint64_t v31 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        indexSite = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        __int16 v176 = 2112;
        v177 = indexSite;
        __int16 v178 = 2112;
        id v179 = v161;
        __int16 v180 = 2112;
        id v181 = v12;
        _os_log_impl(&dword_25C7CA000, v31, OS_LOG_TYPE_INFO, "%s (%@) No sets applicable to %@: %@", buf, 0x2Au);
      }
      __int16 v36 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v32, v33, v34);
      uint64_t v40 = objc_msgSend_path(v163, v37, v38, v39);
      char v43 = objc_msgSend_fileExistsAtPath_(v36, v41, (uint64_t)v40, v42);
      char v44 = v9 == 1 ? 0 : v43;

      uint64_t v45 = v162;
      if ((v44 & 1) == 0)
      {
        BOOL v20 = 1;
LABEL_88:

        goto LABEL_89;
      }
    }
    uint64_t v46 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v50 = self->_indexSite;
      sub_25C7FEEE8(v9, v47, v48, v49);
      id v51 = (id)objc_claimAutoreleasedReturnValue();
      int v55 = objc_msgSend_count(v162, v52, v53, v54);
      int v59 = objc_msgSend_count(v12, v56, v57, v58);
      *(_DWORD *)buf = 136316674;
      v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
      __int16 v176 = 2112;
      v177 = v50;
      __int16 v178 = 2112;
      id v179 = v51;
      __int16 v180 = 2112;
      id v181 = v161;
      __int16 v182 = 1024;
      *(_DWORD *)v183 = v55;
      *(_WORD *)&v183[4] = 1024;
      *(_DWORD *)&v183[6] = v59;
      __int16 v184 = 2112;
      v185 = v162;
      _os_log_impl(&dword_25C7CA000, v46, OS_LOG_TYPE_INFO, "%s (%@) Initiating update mode \"%@\" for %@ with %u / %u applicable set(s): %@", buf, 0x40u);
    }
    id v173 = 0;
    uint64_t v60 = sub_25C7EFC30(v163, &v173);
    id v61 = v173;

    if (!v60)
    {
      long long v82 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        v145 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        __int16 v176 = 2112;
        v177 = v145;
        __int16 v178 = 2112;
        id v179 = v161;
        __int16 v180 = 2112;
        id v181 = v61;
        _os_log_error_impl(&dword_25C7CA000, v82, OS_LOG_TYPE_ERROR, "%s (%@) Failed to resolve %@ directory: %@", buf, 0x2Au);
      }
      BOOL v20 = 0;
      goto LABEL_87;
    }
    v65 = self->_indexSite;
    v66 = objc_msgSend_localization(self->_settings, v62, v63, v64);
    v68 = objc_msgSend_updaterForIndexSite_localization_(v21, v67, (uint64_t)v65, (uint64_t)v66);

    if (!v68)
    {
      long long v83 = (id)qword_26B3549D8;
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        long long v84 = self->_indexSite;
        long long v85 = NSStringFromClass((Class)v21);
        *(_DWORD *)buf = 136315650;
        v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        __int16 v176 = 2112;
        v177 = v84;
        __int16 v178 = 2112;
        id v179 = v85;
        _os_log_impl(&dword_25C7CA000, v83, OS_LOG_TYPE_INFO, "%s (%@) Failed to initialize updater class: %@", buf, 0x20u);
      }
      BOOL v20 = 0;
      goto LABEL_86;
    }
    id v172 = v61;
    char v70 = objc_msgSend__loadChangeRegistry_indexDirectory_createIfNotExists_error_(self, v69, (uint64_t)v11, (uint64_t)v163, 1, &v172);
    id v71 = v172;

    if ((v70 & 1) == 0)
    {
      v86 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        v152 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        __int16 v176 = 2112;
        v177 = v152;
        __int16 v178 = 2112;
        id v179 = v161;
        __int16 v180 = 2112;
        id v181 = v71;
        _os_log_error_impl(&dword_25C7CA000, v86, OS_LOG_TYPE_ERROR, "%s (%@) Failed to load %@ change registry: %@", buf, 0x2Au);
      }
      BOOL v20 = 0;
      id v61 = v71;
      goto LABEL_86;
    }
    v159 = objc_msgSend_changeRegistry(v11, v72, v73, v74);
    if (v17) {
      uint64_t v75 = v17;
    }
    else {
      uint64_t v75 = &unk_2709E0238;
    }
    uint64_t v158 = MEMORY[0x2611949C0](v75);

    if (v9 != 2)
    {
      uint64_t v77 = (uint64_t)v162;
      if (v9 != 3)
      {
        int v87 = 0;
        goto LABEL_45;
      }
      id v171 = v71;
      char v78 = objc_msgSend_cleanupWithAllSets_error_(v159, v76, (uint64_t)v162, (uint64_t)&v171);
      id v61 = v171;

      if ((v78 & 1) == 0)
      {
        id v81 = SEMAdministrator;
        v88 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
        {
          id v89 = self->_indexSite;
          *(_DWORD *)buf = 136315906;
          v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
          __int16 v176 = 2112;
          v177 = v89;
          __int16 v178 = 2112;
          id v179 = v161;
          __int16 v180 = 2112;
          id v181 = v61;
          _os_log_impl(&dword_25C7CA000, v88, OS_LOG_TYPE_INFO, "%s (%@) %@ rebuild required after registry cleanup failed: %@", buf, 0x2Au);
        }
        id v71 = v61;
        goto LABEL_41;
      }
      if ((objc_msgSend_isRebuildRequiredWithAllSets_(v68, v79, (uint64_t)v162, v80) & 1) == 0)
      {
        v146 = qword_26B3549D8;
        BOOL v20 = 1;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
        {
          v147 = self->_indexSite;
          *(_DWORD *)buf = 136315650;
          v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
          __int16 v176 = 2112;
          v177 = v147;
          __int16 v178 = 2112;
          id v179 = v161;
          _os_log_impl(&dword_25C7CA000, v146, OS_LOG_TYPE_INFO, "%s (%@) %@ rebuild not required", buf, 0x20u);
        }
        goto LABEL_85;
      }
      id v71 = v61;
    }
    id v81 = SEMAdministrator;
LABEL_41:
    isa = v81[63].isa;
    if (os_log_type_enabled(isa, OS_LOG_TYPE_INFO))
    {
      uint64_t v93 = self->_indexSite;
      *(_DWORD *)buf = 136315650;
      v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
      __int16 v176 = 2112;
      v177 = v93;
      __int16 v178 = 2112;
      id v179 = v161;
      _os_log_impl(&dword_25C7CA000, isa, OS_LOG_TYPE_INFO, "%s (%@) Clearing %@", buf, 0x20u);
    }
    id v170 = v71;
    char v94 = objc_msgSend_clear_(v68, v91, (uint64_t)&v170, v92, v158);
    id v95 = v170;

    if ((v94 & 1) == 0)
    {
      v123 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        v124 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        __int16 v176 = 2112;
        v177 = v124;
        __int16 v178 = 2112;
        id v179 = v161;
        __int16 v180 = 2112;
        id v181 = v95;
        _os_log_impl(&dword_25C7CA000, v123, OS_LOG_TYPE_INFO, "%s (%@) Failed to clear %@: %@", buf, 0x2Au);
        v123 = qword_26B3549D8;
      }
      v125 = v123;
      if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
      {
        v129 = self->_indexSite;
        v130 = objc_msgSend_path(v163, v126, v127, v128);
        *(_DWORD *)buf = 136315906;
        v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        __int16 v176 = 2112;
        v177 = v129;
        __int16 v178 = 2112;
        id v179 = v161;
        __int16 v180 = 2112;
        id v181 = v130;
        _os_log_impl(&dword_25C7CA000, v125, OS_LOG_TYPE_INFO, "%s (%@) Force removing bad index directory %@ at location %@", buf, 0x2Au);
      }
      id v169 = v95;
      char v131 = sub_25C7EFD04(v163, &v169);
      id v61 = v169;

      v132 = (id)qword_26B3549D8;
      BOOL v133 = os_log_type_enabled(v132, OS_LOG_TYPE_INFO);
      if (v131)
      {
        if (v133)
        {
          v137 = self->_indexSite;
          v138 = objc_msgSend_path(v163, v134, v135, v136);
          *(_DWORD *)buf = 136315906;
          v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
          __int16 v176 = 2112;
          v177 = v137;
          __int16 v178 = 2112;
          id v179 = v161;
          __int16 v180 = 2112;
          id v181 = v138;
          _os_log_impl(&dword_25C7CA000, v132, OS_LOG_TYPE_INFO, "%s (%@) Removed bad index %@ at path %@", buf, 0x2Au);
        }
        if (a7)
        {
          BOOL v20 = 0;
          *a7 = 1;
          goto LABEL_85;
        }
      }
      else
      {
        if (v133)
        {
          v143 = self->_indexSite;
          v144 = objc_msgSend_path(v163, v134, v135, v136);
          *(_DWORD *)buf = 136316162;
          v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
          __int16 v176 = 2112;
          v177 = v143;
          __int16 v178 = 2112;
          id v179 = v161;
          __int16 v180 = 2112;
          id v181 = v144;
          __int16 v182 = 2112;
          *(void *)v183 = v61;
          _os_log_impl(&dword_25C7CA000, v132, OS_LOG_TYPE_INFO, "%s (%@) Failed to remove bad index %@ at path %@: %@", buf, 0x34u);
        }
      }
      goto LABEL_74;
    }
    objc_msgSend_clearAllBookmarks(v159, v96, v97, v98);
    int v87 = 1;
    id v71 = v95;
    uint64_t v77 = (uint64_t)v162;
LABEL_45:
    id v168 = v71;
    char v99 = objc_msgSend_indexUpdatesToSets_changeRegistry_shouldDefer_error_(v68, v76, v77, (uint64_t)v159, v158, &v168, v158);
    id v100 = v168;

    v102 = v100;
    if ((v99 & 1) == 0)
    {
      uint64_t v113 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        v155 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        __int16 v176 = 2112;
        v177 = v155;
        __int16 v178 = 2112;
        id v179 = v161;
        __int16 v180 = 2112;
        id v181 = v102;
        _os_log_error_impl(&dword_25C7CA000, v113, OS_LOG_TYPE_ERROR, "%s (%@) %@ Update failed: %@ Rolling back updates", buf, 0x2Au);
      }
      objc_msgSend_rollbackAllBookmarkUpdates(v159, v114, v115, v116);
      if (a7) {
        *a7 = 1;
      }
      id v167 = v102;
      char v119 = objc_msgSend_rollbackUpdates_(v68, v117, (uint64_t)&v167, v118);
      id v61 = v167;

      if (v119) {
        goto LABEL_74;
      }
      v120 = qword_26B3549D8;
      if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_74;
      }
      v121 = self->_indexSite;
      *(_DWORD *)buf = 136315906;
      v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
      __int16 v176 = 2112;
      v177 = v121;
      __int16 v178 = 2112;
      id v179 = v161;
      __int16 v180 = 2112;
      id v181 = v61;
      v122 = "%s (%@) Failed to rollback %@ updates: %@";
      goto LABEL_58;
    }
    id v166 = v100;
    char shouldRebuild = objc_msgSend_commitUpdates_shouldRebuild_(v68, v101, (uint64_t)&v166, (uint64_t)a7);
    id v104 = v166;

    __int16 v107 = v104;
    if (shouldRebuild)
    {
      id v165 = v104;
      char v108 = objc_msgSend_commitAllBookmarkUpdates_(v159, v105, (uint64_t)&v165, v106);
      id v109 = v165;

      __int16 v107 = v109;
      if (v108)
      {
        if (v87)
        {
          id v164 = v109;
          char v112 = objc_msgSend_cleanup_(v68, v110, (uint64_t)&v164, v111);
          id v61 = v164;

          if (v112)
          {
            BOOL v20 = 1;
LABEL_85:

            uint64_t v17 = (void *)v158;
LABEL_86:

LABEL_87:
            uint64_t v45 = v162;
            goto LABEL_88;
          }
          v120 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
          {
            v154 = self->_indexSite;
            *(_DWORD *)buf = 136315906;
            v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
            __int16 v176 = 2112;
            v177 = v154;
            __int16 v178 = 2112;
            id v179 = v161;
            __int16 v180 = 2112;
            id v181 = v61;
            v122 = "%s (%@) Failed to cleanup %@: %@";
LABEL_58:
            _os_log_error_impl(&dword_25C7CA000, v120, OS_LOG_TYPE_ERROR, v122, buf, 0x2Au);
          }
LABEL_74:
          BOOL v20 = 0;
          goto LABEL_85;
        }
        BOOL v20 = 1;
LABEL_84:
        id v61 = v107;
        goto LABEL_85;
      }
      v148 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        v157 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        __int16 v176 = 2112;
        v177 = v157;
        __int16 v178 = 2112;
        id v179 = v161;
        __int16 v180 = 2112;
        id v181 = v107;
        _os_log_error_impl(&dword_25C7CA000, v148, OS_LOG_TYPE_ERROR, "%s (%@) Failed to commit %@ change registry transaction: %@", buf, 0x2Au);
      }
      objc_msgSend_rollbackAllBookmarkUpdates(v159, v149, v150, v151);
    }
    else
    {
      v139 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        v156 = self->_indexSite;
        *(_DWORD *)buf = 136315906;
        v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
        __int16 v176 = 2112;
        v177 = v156;
        __int16 v178 = 2112;
        id v179 = v161;
        __int16 v180 = 2112;
        id v181 = v107;
        _os_log_error_impl(&dword_25C7CA000, v139, OS_LOG_TYPE_ERROR, "%s (%@) Failed to commit %@ updates: %@", buf, 0x2Au);
      }
      objc_msgSend_rollbackAllBookmarkUpdates(v159, v140, v141, v142);
    }
    BOOL v20 = 0;
    if (a7) {
      *a7 = 1;
    }
    goto LABEL_84;
  }
  int v18 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    char v19 = self->_indexSite;
    *(_DWORD *)buf = 136315394;
    v175 = "-[SEMIndexSiteWriter _updateIndex:mode:sets:shouldDefer:shouldRebuild:]";
    __int16 v176 = 2112;
    v177 = v19;
    _os_log_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_INFO, "%s (%@) Exiting after deferral signal", buf, 0x16u);
  }
  BOOL v20 = 0;
LABEL_89:

  return v20;
}

- (BOOL)_loadChangeRegistry:(id)a3 indexDirectory:(id)a4 createIfNotExists:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v15 = objc_msgSend_changeRegistry(v10, v12, v13, v14);

  if (!v15)
  {
    if (!a5)
    {
      char v19 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v16, v17, v18);
      __int16 v21 = objc_msgSend_fileURLWithPath_relativeToURL_(NSURL, v20, @"Registry", (uint64_t)v11);
      uint64_t v25 = objc_msgSend_path(v21, v22, v23, v24);
      int v28 = objc_msgSend_fileExistsAtPath_(v19, v26, (uint64_t)v25, v27);

      if (!v28) {
        goto LABEL_8;
      }
    }
    id v29 = objc_alloc(MEMORY[0x263F31778]);
    uint64_t v33 = objc_msgSend_dataProtectionClass(self->_indexSite, v30, v31, v32);
    id v37 = objc_msgSend_initWithFilename_directory_protectionClass_error_(v29, v34, @"Registry", (uint64_t)v11, v33, a6);
    if (!v37)
    {
LABEL_8:
      BOOL v38 = 0;
      goto LABEL_7;
    }
    objc_msgSend_setChangeRegistry_(v10, v35, (uint64_t)v37, v36);
  }
  BOOL v38 = 1;
LABEL_7:

  return v38;
}

- (id)_indexDirectory:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_updaterClass(v4, v5, v6, v7);
  id v11 = objc_msgSend_indexDirectory_(v8, v9, (uint64_t)self->_indexSite, v10);

  return v11;
}

- (id)_applicableSets:(id)a3 toUpdaterClass:(Class)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v55 = a3;
  id v56 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v57 = objc_msgSend_currentPersonaIdentifier(SEMPersonaUtilities, v6, v7, v8);
  int IsDefault = objc_msgSend_currentPersonaIsDefault(SEMPersonaUtilities, v9, v10, v11);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v13 = v55;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v58, (uint64_t)v70, 16);
  if (v17)
  {
    uint64_t v19 = *(void *)v59;
    *(void *)&long long v18 = 136315906;
    long long v54 = v18;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v59 != v19) {
          objc_enumerationMutation(v13);
        }
        __int16 v21 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend_supportedDevicePlatformForSet_(a4, v15, (uint64_t)v21, v16, v54);
        if (objc_msgSend_isSupportedDevicePlatform_(self->_settings, v23, v22, v24))
        {
          uint64_t v26 = objc_msgSend_personaIdentifier(v21, v15, v25, v16);
          BOOL v27 = v26 == 0;

          if (!v27)
          {
            if (!IsDefault
              || (objc_msgSend_personaIdentifier(v21, v28, v29, v30),
                  uint64_t v31 = objc_claimAutoreleasedReturnValue(),
                  char isEqual = objc_msgSend_isEqual_(v57, v32, (uint64_t)v31, v33),
                  v31,
                  (isEqual & 1) == 0))
            {
              v35 = objc_msgSend_personaIdentifier(v21, v28, v29, v30);
              char isUserPersonaIdentifier = objc_msgSend_isUserPersonaIdentifier_(SEMPersonaUtilities, v36, (uint64_t)v35, v37);

              if ((isUserPersonaIdentifier & 1) == 0)
              {
                uint64_t v46 = qword_26B3549D8;
                if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
                  continue;
                }
                indexSite = self->_indexSite;
                *(_DWORD *)buf = 136315650;
                uint64_t v63 = "-[SEMIndexSiteWriter _applicableSets:toUpdaterClass:]";
                __int16 v64 = 2112;
                v65 = indexSite;
                __int16 v66 = 2112;
                v67 = v21;
                uint64_t v48 = v46;
                uint64_t v49 = "%s (%@) Ignoring set with persona which is not a valid user of this device: %@";
                uint32_t v50 = 32;
                goto LABEL_22;
              }
            }
          }
          int v39 = objc_msgSend_type(self->_indexSite, v28, v29, v30);
          if (v39 == 2)
          {
            if (!objc_msgSend_isInUserVault(v21, v15, v40, v16)) {
              continue;
            }
            uint64_t v42 = objc_msgSend_personaIdentifier(v21, v15, v41, v16);
            char v45 = objc_msgSend_isEqual_(v57, v43, (uint64_t)v42, v44);

            if (v45)
            {
LABEL_17:
              objc_msgSend_addObject_(v56, v15, (uint64_t)v21, v16);
              continue;
            }
            uint64_t v51 = qword_26B3549D8;
            if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
            {
              v52 = self->_indexSite;
              *(_DWORD *)buf = v54;
              uint64_t v63 = "-[SEMIndexSiteWriter _applicableSets:toUpdaterClass:]";
              __int16 v64 = 2112;
              v65 = v52;
              __int16 v66 = 2112;
              v67 = v57;
              __int16 v68 = 2112;
              char v69 = v21;
              uint64_t v48 = v51;
              uint64_t v49 = "%s (%@) Ignoring set with persona not equal to current persona (%@): %@";
              uint32_t v50 = 42;
LABEL_22:
              _os_log_error_impl(&dword_25C7CA000, v48, OS_LOG_TYPE_ERROR, v49, buf, v50);
              continue;
            }
          }
          else if (v39 == 1 && (objc_msgSend_isInUserVault(v21, v15, v40, v16) & 1) == 0)
          {
            goto LABEL_17;
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v58, (uint64_t)v70, 16);
    }
    while (v17);
  }

  return v56;
}

- (id)_loadSiteInfo:(id *)a3
{
  siteInfo = self->_siteInfo;
  if (!siteInfo)
  {
    uint64_t v6 = [SEMDictionaryLog alloc];
    uint64_t v10 = objc_msgSend_indexSiteURL(self->_indexSite, v7, v8, v9);
    Only_error = (SEMDictionaryLog *)objc_msgSend_initWithFilename_directory_readOnly_error_(v6, v11, @"Site", (uint64_t)v10, 0, a3);
    id v13 = self->_siteInfo;
    self->_siteInfo = Only_error;

    siteInfo = self->_siteInfo;
  }
  return siteInfo;
}

- (BOOL)_recordSiteInfoObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v12 = objc_msgSend__loadSiteInfo_(self, v10, (uint64_t)a5, v11);

  if (v12) {
    char v14 = objc_msgSend_writeUpdatedObject_forKey_error_(self->_siteInfo, v13, (uint64_t)v8, (uint64_t)v9, a5);
  }
  else {
    char v14 = 0;
  }

  return v14;
}

- (id)_siteInfoObjectForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v9 = objc_msgSend__loadSiteInfo_(self, v7, (uint64_t)a4, v8);

  if (v9)
  {
    id v12 = objc_msgSend_objectForKey_(self->_siteInfo, v10, (uint64_t)v6, v11);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (SEMIndexSite)indexSite
{
  return self->_indexSite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSite, 0);
  objc_storeStrong((id *)&self->_fts, 0);
  objc_storeStrong((id *)&self->_skit, 0);
  objc_storeStrong((id *)&self->_siteInfo, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end