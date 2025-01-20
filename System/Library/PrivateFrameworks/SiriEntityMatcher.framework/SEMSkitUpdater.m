@interface SEMSkitUpdater
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
- (SEMSkitUpdater)initWithIndexSite:(id)a3 localization:(id)a4 writer:(id)a5;
- (id)_allMetaContent:(id)a3;
@end

@implementation SEMSkitUpdater

+ (id)indexName
{
  return @"SKIT";
}

+ (id)indexDirectory:(id)a3
{
  v4 = objc_msgSend_skitDirectoryURL(a3, a2, (uint64_t)a3, v3);
  return v4;
}

+ (id)updaterForIndexSite:(id)a3 localization:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [SEMSkitWriter alloc];
  v10 = objc_msgSend_indexDirectory_(SEMSkitUpdater, v8, (uint64_t)v5, v9);
  uint64_t v14 = objc_msgSend_dataProtectionClass(v5, v11, v12, v13);
  v16 = objc_msgSend_initWithSkitDirectoryURL_dataProtectionClass_flushThreshold_(v7, v15, (uint64_t)v10, v14, 5242880);

  if (v16)
  {
    id v17 = objc_alloc((Class)objc_opt_class());
    v19 = objc_msgSend_initWithIndexSite_localization_writer_(v17, v18, (uint64_t)v5, (uint64_t)v6, v16);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (SEMSkitUpdater)initWithIndexSite:(id)a3 localization:(id)a4 writer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SEMSkitUpdater;
  uint64_t v12 = [(SEMSkitUpdater *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_indexSite, a3);
    objc_storeStrong((id *)&v13->_writer, a5);
    objc_storeStrong((id *)&v13->_localization, a4);
  }

  return v13;
}

- (BOOL)clear:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v6 = objc_msgSend_clearWithError_(self->_writer, a2, (uint64_t)a3, v3);
  if (v6)
  {
    unint64_t v7 = sub_25C81F234();
    v8 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = sub_25C7F5180(v7);
      int v12 = 136315394;
      uint64_t v13 = "-[SEMSkitUpdater clear:]";
      __int16 v14 = 2112;
      objc_super v15 = v9;
      _os_log_impl(&dword_25C7CA000, v8, OS_LOG_TYPE_INFO, "%s Setting transaction index features: %@", (uint8_t *)&v12, 0x16u);
    }
    LOBYTE(v6) = objc_msgSend_setTransactionIndexFeatures_error_(self->_writer, v10, v7, (uint64_t)a3);
  }
  return v6;
}

- (BOOL)commitUpdates:(id *)a3 shouldRebuild:(BOOL *)a4
{
  BOOL v7 = 0;
  int v5 = objc_msgSend_commitChanges_error_(self->_writer, a2, (uint64_t)&v7, (uint64_t)a3);
  if (a4 && v5) {
    *a4 = v7;
  }
  return v5;
}

- (BOOL)rollbackUpdates:(id *)a3
{
  return ((uint64_t (*)(SEMSkitWriter *, char *, id *))MEMORY[0x270F9A6D0])(self->_writer, sel_rollbackChanges_, a3);
}

- (BOOL)cleanup:(id *)a3
{
  return objc_msgSend_cleanup_(self->_writer, a2, (uint64_t)a3, v3);
}

- (BOOL)indexUpdatesToSets:(id)a3 changeRegistry:(id)a4 shouldDefer:(id)a5 error:(id *)a6
{
  uint64_t v141 = *MEMORY[0x263EF8340];
  id v77 = a3;
  id v85 = a4;
  id v84 = a5;
  uint64_t v122 = 0;
  v123 = &v122;
  uint64_t v124 = 0x3032000000;
  v125 = sub_25C80CFF0;
  v126 = sub_25C80D000;
  id v127 = 0;
  localization = self->_localization;
  id obj = 0;
  id v121 = 0;
  uint64_t MorphunAssetForSiriLanguage_error = objc_msgSend_locateMorphunAssetForSiriLanguage_error_(localization, v10, (uint64_t)&v121, (uint64_t)&obj);
  id v78 = v121;
  objc_storeStrong(&v127, obj);
  if ((unint64_t)(MorphunAssetForSiriLanguage_error - 1) >= 0x2C)
  {
    v60 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_siriLanguageCode(self->_localization, v61, v62, v63);
      v73 = (SEMIndexSite *)objc_claimAutoreleasedReturnValue();
      uint64_t v74 = v123[5];
      *(_DWORD *)buf = 136315650;
      v129 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
      __int16 v130 = 2112;
      v131 = v73;
      __int16 v132 = 2112;
      *(void *)v133 = v74;
      _os_log_error_impl(&dword_25C7CA000, v60, OS_LOG_TYPE_ERROR, "%s Cannot update SKIT without Morphun asset for Siri language: %@ error: %@", buf, 0x20u);
    }
    goto LABEL_33;
  }
  writer = self->_writer;
  __int16 v14 = (id *)(v123 + 5);
  id v119 = (id)v123[5];
  char v15 = objc_msgSend_setTransactionLocale_assetPath_error_(writer, v12, MorphunAssetForSiriLanguage_error, (uint64_t)v78, &v119);
  objc_storeStrong(v14, v119);
  uint64_t v16 = qword_26B3549D8;
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      v75 = (SEMIndexSite *)v123[5];
      *(_DWORD *)buf = 136315394;
      v129 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
      __int16 v130 = 2112;
      v131 = v75;
      _os_log_error_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_ERROR, "%s Failed to set SKIT transaction locale. error: %@", buf, 0x16u);
    }
LABEL_33:
    BOOL v64 = 0;
    if (a6)
    {
      v65 = (void *)v123[5];
      if (v65)
      {
        BOOL v64 = 0;
        *a6 = v65;
      }
    }
    goto LABEL_41;
  }
  id v17 = (id)qword_26B3549D8;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    indexSite = self->_indexSite;
    int v22 = objc_msgSend_count(v77, v18, v19, v20);
    *(_DWORD *)buf = 136315650;
    v129 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
    __int16 v130 = 2112;
    v131 = indexSite;
    __int16 v132 = 1024;
    *(_DWORD *)v133 = v22;
    _os_log_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_INFO, "%s (%@) Enumerating %u set(s) for updates to SKIT", buf, 0x1Cu);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v81 = v77;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v23, (uint64_t)&v115, (uint64_t)v140, 16);
  if (v24)
  {
    int v79 = 0;
    uint64_t v80 = 0;
    uint64_t v83 = *(void *)v116;
    uint64_t v82 = *MEMORY[0x263F316C8];
    *(void *)&long long v25 = 136315906;
    long long v76 = v25;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v116 != v83) {
          objc_enumerationMutation(v81);
        }
        v27 = *(SEMIndexSite **)(*((void *)&v115 + 1) + 8 * i);
        uint64_t v111 = 0;
        v112 = &v111;
        uint64_t v113 = 0x2020000000;
        char v114 = 1;
        uint64_t v107 = 0;
        v108 = &v107;
        uint64_t v109 = 0x2020000000;
        int v110 = 0;
        uint64_t v103 = 0;
        v104 = &v103;
        uint64_t v105 = 0x2020000000;
        int v106 = 0;
        uint64_t v99 = 0;
        v100 = &v99;
        uint64_t v101 = 0x2020000000;
        int v102 = 0;
        v28 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v129 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
          __int16 v130 = 2112;
          v131 = v27;
          _os_log_impl(&dword_25C7CA000, v28, OS_LOG_TYPE_INFO, "%s Enumerating set: %@", buf, 0x16u);
        }
        v31 = objc_msgSend_descriptorWithKey_(v27, v29, v82, v30, v76);
        v35 = objc_msgSend_value(v31, v32, v33, v34);

        v39 = objc_msgSend_personaIdentifier(v27, v36, v37, v38);
        v42 = objc_msgSend_bookmarkForSet_(v85, v40, (uint64_t)v27, v41);
        v87[0] = MEMORY[0x263EF8330];
        v87[1] = 3221225472;
        v87[2] = sub_25C80D008;
        v87[3] = &unk_2654DEE30;
        v87[4] = v27;
        id v43 = v42;
        id v88 = v43;
        v94 = &v111;
        id v89 = v85;
        v95 = &v122;
        id v93 = v84;
        v90 = self;
        v96 = &v107;
        v97 = &v103;
        v98 = &v99;
        id v44 = v35;
        id v91 = v44;
        id v45 = v39;
        id v92 = v45;
        objc_msgSend_runAsPersonaIdentifier_block_(SEMPersonaUtilities, v46, (uint64_t)v45, (uint64_t)v87);
        v47 = v123;
        if (*((unsigned char *)v112 + 24) && !v123[5])
        {
          v51 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
          {
            v52 = self->_indexSite;
            v53 = @"delta";
            if (!v43) {
              v53 = @"full";
            }
            int v54 = *((_DWORD *)v108 + 6);
            int v55 = *((_DWORD *)v104 + 6);
            int v56 = *((_DWORD *)v100 + 6);
            *(_DWORD *)buf = 136316674;
            v129 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
            __int16 v130 = 2112;
            v131 = v52;
            __int16 v132 = 2112;
            *(void *)v133 = v53;
            *(_WORD *)&v133[8] = 2112;
            v134 = v27;
            *(_WORD *)v135 = 1024;
            *(_DWORD *)&v135[2] = v54;
            __int16 v136 = 1024;
            int v137 = v55;
            __int16 v138 = 1024;
            int v139 = v56;
            _os_log_impl(&dword_25C7CA000, v51, OS_LOG_TYPE_INFO, "%s (%@) Completed %@ enumeration for set: %@ with %u added, %u modified, and %u removed shared item(s).", buf, 0x3Cu);
          }
          v79 += *((_DWORD *)v108 + 6);
          LODWORD(v80) = *((_DWORD *)v104 + 6) + v80;
          HIDWORD(v80) += *((_DWORD *)v100 + 6);
          int v49 = 1;
        }
        else
        {
          v48 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
          {
            v58 = self->_indexSite;
            v59 = (SEMIndexSite *)v47[5];
            *(_DWORD *)buf = v76;
            v129 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
            __int16 v130 = 2112;
            v131 = v58;
            __int16 v132 = 2112;
            *(void *)v133 = v27;
            *(_WORD *)&v133[8] = 2112;
            v134 = v59;
            _os_log_error_impl(&dword_25C7CA000, v48, OS_LOG_TYPE_ERROR, "%s (%@) Enumeration for set: %@ aborted: %@", buf, 0x2Au);
            v47 = v123;
          }
          int v49 = 0;
          if (a6)
          {
            v50 = (void *)v47[5];
            if (v50)
            {
              int v49 = 0;
              *a6 = v50;
            }
          }
        }

        _Block_object_dispose(&v99, 8);
        _Block_object_dispose(&v103, 8);
        _Block_object_dispose(&v107, 8);
        _Block_object_dispose(&v111, 8);
        if (!v49)
        {
          BOOL v64 = 0;
          v66 = v81;
          goto LABEL_40;
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v57, (uint64_t)&v115, (uint64_t)v140, 16);
      if (v24) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v79 = 0;
    uint64_t v80 = 0;
  }

  v66 = (id)qword_26B3549D8;
  BOOL v64 = 1;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    v70 = self->_indexSite;
    int v71 = objc_msgSend_count(v81, v67, v68, v69);
    *(_DWORD *)buf = 136316418;
    v129 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]";
    __int16 v130 = 2112;
    v131 = v70;
    __int16 v132 = 1024;
    *(_DWORD *)v133 = v71;
    *(_WORD *)&v133[4] = 1024;
    *(_DWORD *)&v133[6] = v79;
    LOWORD(v134) = 1024;
    *(_DWORD *)((char *)&v134 + 2) = v80;
    HIWORD(v134) = 1024;
    *(_DWORD *)v135 = HIDWORD(v80);
    BOOL v64 = 1;
    _os_log_impl(&dword_25C7CA000, v66, OS_LOG_TYPE_INFO, "%s (%@) Completed enumeration for %u set(s) cumulatively producing %u added, %u modified, and %u removed shared item(s) from SKIT", buf, 0x2Eu);
  }
LABEL_40:

LABEL_41:
  _Block_object_dispose(&v122, 8);

  return v64;
}

- (BOOL)isRebuildRequiredWithAllSets:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  int v5 = objc_msgSend_siriLanguageCode(self->_localization, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_supportedLocaleFromLanguageCode_(SEMLocalization, v6, (uint64_t)v5, v7);
  uint64_t v12 = objc_msgSend_indexLocale(self->_writer, v9, v10, v11);
  if (v8 != v12)
  {
    uint64_t v24 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      indexSite = self->_indexSite;
      v27 = sub_25C8009D0(v12, v25);
      v29 = sub_25C8009D0(v8, v28);
      *(_DWORD *)buf = 136316162;
      id v43 = "-[SEMSkitUpdater isRebuildRequiredWithAllSets:]";
      __int16 v44 = 2112;
      id v45 = indexSite;
      __int16 v46 = 2112;
      id v47 = v27;
      __int16 v48 = 2112;
      int v49 = v29;
      __int16 v50 = 2112;
      v51 = v5;
      _os_log_impl(&dword_25C7CA000, v24, OS_LOG_TYPE_INFO, "%s (%@) SKIT index (locale: %@) inconsistent with Siri setting (locale: %@, language code: %@)", buf, 0x34u);
    }
    goto LABEL_12;
  }
  int v13 = sub_25C81F234();
  if (objc_msgSend_indexFeatures(self->_writer, v14, v15, v16) != v13)
  {
    uint64_t v24 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = self->_indexSite;
      char v34 = objc_msgSend_indexFeatures(self->_writer, v30, v31, v32);
      v35 = sub_25C7F5180(v34);
      v36 = sub_25C7F5180(v13);
      *(_DWORD *)buf = 136315906;
      id v43 = "-[SEMSkitUpdater isRebuildRequiredWithAllSets:]";
      __int16 v44 = 2112;
      id v45 = v33;
      __int16 v46 = 2112;
      id v47 = v35;
      __int16 v48 = 2112;
      int v49 = v36;
      _os_log_impl(&dword_25C7CA000, v24, OS_LOG_TYPE_INFO, "%s (%@) Prior index features: %@ inconsistent with Trial index features: %@", buf, 0x2Au);
    }
LABEL_12:

    BOOL v22 = 1;
    goto LABEL_18;
  }
  char v41 = 0;
  writer = self->_writer;
  id v40 = 0;
  char shouldMerge_error = objc_msgSend_shouldMerge_error_(writer, v17, (uint64_t)&v41, (uint64_t)&v40);
  id v20 = v40;
  if (shouldMerge_error)
  {
    if (v41)
    {
      v21 = qword_26B3549D8;
      BOOL v22 = 1;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        v23 = self->_indexSite;
        *(_DWORD *)buf = 136315394;
        id v43 = "-[SEMSkitUpdater isRebuildRequiredWithAllSets:]";
        __int16 v44 = 2112;
        id v45 = v23;
        _os_log_impl(&dword_25C7CA000, v21, OS_LOG_TYPE_INFO, "%s (%@) SKIT merge is required", buf, 0x16u);
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    uint64_t v37 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      v39 = self->_indexSite;
      *(_DWORD *)buf = 136315650;
      id v43 = "-[SEMSkitUpdater isRebuildRequiredWithAllSets:]";
      __int16 v44 = 2112;
      id v45 = v39;
      __int16 v46 = 2112;
      id v47 = v20;
      _os_log_error_impl(&dword_25C7CA000, v37, OS_LOG_TYPE_ERROR, "%s (%@) Failed to check SKIT should_merge - triggering rebuild. error: %@", buf, 0x20u);
    }
    BOOL v22 = 1;
  }

LABEL_18:
  return v22;
}

+ (unsigned)supportedDevicePlatformForSet:(id)a3
{
  id v3 = a3;
  int v7 = objc_msgSend_itemType(v3, v4, v5, v6);
  unsigned __int8 v8 = sub_25C820EEC(v7);

  return v8;
}

- (id)_allMetaContent:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_allLocalInstances(a3, a2, (uint64_t)a3, v3);
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    id v8 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v12 = objc_msgSend_count(v4, v9, v10, v11);
    uint64_t v15 = objc_msgSend_initWithCapacity_(v8, v13, v12, v14);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v4;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v28, (uint64_t)v32, 16);
    if (v21)
    {
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v16);
          }
          v26 = objc_msgSend_metaContent(*(void **)(*((void *)&v28 + 1) + 8 * i), v18, v19, v20, (void)v28);
          if (v26) {
            objc_msgSend_addObject_(v15, v24, (uint64_t)v26, v25);
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v28, (uint64_t)v32, 16);
      }
      while (v21);
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localization, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_indexSite, 0);
}

@end