@interface SEMFTSUpdater
+ (id)indexDirectory:(id)a3;
+ (id)indexName;
+ (id)updaterForIndexSite:(id)a3 localization:(id)a4;
+ (unsigned)supportedDevicePlatformForSet:(id)a3;
- (BOOL)cleanup:(id *)a3;
- (BOOL)clear:(id *)a3;
- (BOOL)commitUpdates:(id *)a3 shouldRebuild:(BOOL *)a4;
- (BOOL)indexUpdatesToSets:(id)a3 changeRegistry:(id)a4 shouldDefer:(id)a5 error:(id *)a6;
- (BOOL)isRebuildRequiredWithAllSets:(id)a3;
- (BOOL)rollbackUpdates:(id *)a3;
- (SEMFTSUpdater)initWithIndexSite:(id)a3 writer:(id)a4;
@end

@implementation SEMFTSUpdater

+ (id)indexName
{
  return @"FTS";
}

+ (id)indexDirectory:(id)a3
{
  return (id)objc_msgSend_ftsDirectoryURL(a3, a2, (uint64_t)a3, v3);
}

+ (id)updaterForIndexSite:(id)a3 localization:(id)a4
{
  id v4 = a3;
  v5 = [SEMFTSWriter alloc];
  v9 = objc_msgSend_ftsDatabaseURL(v4, v6, v7, v8);
  uint64_t v13 = objc_msgSend_dataProtectionClass(v4, v10, v11, v12);
  v15 = objc_msgSend_initWithDatabaseURL_dataProtectionClass_(v5, v14, (uint64_t)v9, v13);

  if (v15)
  {
    id v16 = objc_alloc((Class)objc_opt_class());
    v18 = objc_msgSend_initWithIndexSite_writer_(v16, v17, (uint64_t)v4, (uint64_t)v15);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (SEMFTSUpdater)initWithIndexSite:(id)a3 writer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SEMFTSUpdater;
  v9 = [(SEMFTSUpdater *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_indexSite, a3);
    objc_storeStrong((id *)&v10->_writer, a4);
  }

  return v10;
}

- (BOOL)clear:(id *)a3
{
  return objc_msgSend_clearWithError_(self->_writer, a2, (uint64_t)a3, v3);
}

- (BOOL)commitUpdates:(id *)a3 shouldRebuild:(BOOL *)a4
{
  return MEMORY[0x270F9A6D0](self->_writer, sel_commitChanges_, a3, a4);
}

- (BOOL)rollbackUpdates:(id *)a3
{
  return ((uint64_t (*)(SEMFTSWriter *, char *, id *))MEMORY[0x270F9A6D0])(self->_writer, sel_rollbackChanges_, a3);
}

- (BOOL)cleanup:(id *)a3
{
  return objc_msgSend_cleanup_(self->_writer, a2, (uint64_t)a3, v3);
}

- (BOOL)indexUpdatesToSets:(id)a3 changeRegistry:(id)a4 shouldDefer:(id)a5 error:(id *)a6
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v66 = a4;
  id v63 = a5;
  v9 = (void *)qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    indexSite = self->_indexSite;
    uint64_t v11 = v9;
    *(_DWORD *)buf = 136315650;
    v100 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
    __int16 v101 = 2112;
    v102 = indexSite;
    __int16 v103 = 1024;
    *(_DWORD *)v104 = objc_msgSend_count(v8, v12, v13, v14);
    _os_log_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_INFO, "%s (%@) Enumerating %u sets for updates to FTS", buf, 0x1Cu);
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = v8;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v95, (uint64_t)v110, 16);
  if (v18)
  {
    uint64_t v61 = 0;
    uint64_t v20 = *(void *)v96;
    uint64_t v21 = *MEMORY[0x263F316C8];
    *(void *)&long long v19 = 136315906;
    long long v60 = v19;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v96 != v20) {
          objc_enumerationMutation(obj);
        }
        v23 = *(SEMIndexSite **)(*((void *)&v95 + 1) + 8 * i);
        uint64_t v91 = 0;
        v92 = &v91;
        uint64_t v93 = 0x2020000000;
        char v94 = 1;
        uint64_t v85 = 0;
        v86 = &v85;
        uint64_t v87 = 0x3032000000;
        v88 = sub_25C7F32F4;
        v89 = sub_25C7F3304;
        id v90 = 0;
        uint64_t v81 = 0;
        v82 = &v81;
        uint64_t v83 = 0x2020000000;
        int v84 = 0;
        uint64_t v77 = 0;
        v78 = &v77;
        uint64_t v79 = 0x2020000000;
        int v80 = 0;
        v24 = objc_msgSend_descriptorWithKey_(v23, v16, v21, v17, v60);
        v28 = objc_msgSend_value(v24, v25, v26, v27);

        v29 = qword_26B3549D8;
        BOOL v30 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
        if (v28)
        {
          if (v30)
          {
            *(_DWORD *)buf = 136315650;
            v100 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
            __int16 v101 = 2112;
            v102 = v23;
            __int16 v103 = 2112;
            *(void *)v104 = v28;
            _os_log_impl(&dword_25C7CA000, v29, OS_LOG_TYPE_INFO, "%s Enumerating set: %@ using originAppId: %@", buf, 0x20u);
          }
          v33 = objc_msgSend_bookmarkForSet_(v66, v31, (uint64_t)v23, v32);
          v37 = objc_msgSend_personaIdentifier(v23, v34, v35, v36);
          v67[0] = MEMORY[0x263EF8330];
          v67[1] = 3221225472;
          v67[2] = sub_25C7F330C;
          v67[3] = &unk_2654DE2E8;
          v67[4] = v23;
          id v38 = v33;
          id v68 = v38;
          v73 = &v91;
          id v69 = v66;
          v74 = &v85;
          id v72 = v63;
          v70 = self;
          id v71 = v28;
          v75 = &v81;
          v76 = &v77;
          objc_msgSend_runAsPersonaIdentifier_block_(SEMPersonaUtilities, v39, (uint64_t)v37, (uint64_t)v67);

          v40 = v86;
          if (*((unsigned char *)v92 + 24) && !v86[5])
          {
            v44 = qword_26B3549D8;
            if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
            {
              v45 = self->_indexSite;
              v46 = @"delta";
              if (!v38) {
                v46 = @"full";
              }
              int v47 = *((_DWORD *)v82 + 6);
              int v48 = *((_DWORD *)v78 + 6);
              *(_DWORD *)buf = 136316418;
              v100 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
              __int16 v101 = 2112;
              v102 = v45;
              __int16 v103 = 2112;
              *(void *)v104 = v46;
              *(_WORD *)&v104[8] = 2112;
              v105 = v23;
              __int16 v106 = 1024;
              int v107 = v47;
              __int16 v108 = 1024;
              int v109 = v48;
              _os_log_impl(&dword_25C7CA000, v44, OS_LOG_TYPE_INFO, "%s (%@) Completed %@ enumeration for set: %@ with %u added and %u removed local item instances.", buf, 0x36u);
            }
            int v42 = 0;
            LODWORD(v61) = *((_DWORD *)v82 + 6) + v61;
            HIDWORD(v61) += *((_DWORD *)v78 + 6);
          }
          else
          {
            v41 = qword_26B3549D8;
            if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
            {
              v49 = self->_indexSite;
              v50 = (SEMIndexSite *)v40[5];
              *(_DWORD *)buf = v60;
              v100 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
              __int16 v101 = 2112;
              v102 = v49;
              __int16 v103 = 2112;
              *(void *)v104 = v23;
              *(_WORD *)&v104[8] = 2112;
              v105 = v50;
              _os_log_error_impl(&dword_25C7CA000, v41, OS_LOG_TYPE_ERROR, "%s (%@) Enumeration for set: %@ aborted: %@", buf, 0x2Au);
              v40 = v86;
            }
            int v42 = 1;
            if (a6)
            {
              v43 = (void *)v40[5];
              if (v43) {
                *a6 = v43;
              }
            }
          }
        }
        else
        {
          if (v30)
          {
            *(_DWORD *)buf = 136315394;
            v100 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
            __int16 v101 = 2112;
            v102 = v23;
            _os_log_impl(&dword_25C7CA000, v29, OS_LOG_TYPE_INFO, "%s Skipping set missing source identifier descriptor: %@", buf, 0x16u);
          }
          int v42 = 5;
        }

        _Block_object_dispose(&v77, 8);
        _Block_object_dispose(&v81, 8);
        _Block_object_dispose(&v85, 8);

        _Block_object_dispose(&v91, 8);
        if (v42 != 5 && v42)
        {

          BOOL v51 = 0;
          goto LABEL_36;
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v95, (uint64_t)v110, 16);
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v61 = 0;
  }

  v52 = (void *)qword_26B3549D8;
  BOOL v51 = 1;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    v53 = self->_indexSite;
    v54 = v52;
    int v58 = objc_msgSend_count(obj, v55, v56, v57);
    *(_DWORD *)buf = 136316162;
    v100 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
    __int16 v101 = 2112;
    v102 = v53;
    __int16 v103 = 1024;
    *(_DWORD *)v104 = v58;
    *(_WORD *)&v104[4] = 1024;
    *(_DWORD *)&v104[6] = v61;
    LOWORD(v105) = 1024;
    *(_DWORD *)((char *)&v105 + 2) = HIDWORD(v61);
    _os_log_impl(&dword_25C7CA000, v54, OS_LOG_TYPE_INFO, "%s (%@) Completed enumeration for %u set(s) cumulatively producing %u added and %u removed local item instances from FTS", buf, 0x28u);

    BOOL v51 = 1;
  }
LABEL_36:

  return v51;
}

- (BOOL)isRebuildRequiredWithAllSets:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v5 = objc_msgSend_databaseExists(self->_writer, a2, (uint64_t)a3, v3);
  if ((v5 & 1) == 0)
  {
    v6 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      indexSite = self->_indexSite;
      int v9 = 136315394;
      v10 = "-[SEMFTSUpdater isRebuildRequiredWithAllSets:]";
      __int16 v11 = 2112;
      objc_super v12 = indexSite;
      _os_log_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_INFO, "%s (%@) FTS database index does not exist", (uint8_t *)&v9, 0x16u);
    }
  }
  return v5 ^ 1;
}

+ (unsigned)supportedDevicePlatformForSet:(id)a3
{
  uint64_t v4 = objc_msgSend_itemType(a3, a2, (uint64_t)a3, v3);
  return MEMORY[0x270F9A6D0](SEMFTSWriter, sel_capabilityRequirementForItemType_, v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_indexSite, 0);
}

@end