@interface SEMFTSMatcher
- (SEMFTSMatcher)initWithFTSAccessProvider:(id)a3;
- (id)_allFTSRecordsWithExternalIds:(id)a3 database:(id)a4 error:(id *)a5;
- (id)_matchFTSRecordsWithSearchCriteria:(id)a3 database:(id)a4 error:(id *)a5;
- (id)searchFTSWithCriteria:(id)a3 error:(id *)a4;
@end

@implementation SEMFTSMatcher

- (SEMFTSMatcher)initWithFTSAccessProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SEMFTSMatcher;
  v6 = [(SEMFTSMatcher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ftsAccessProvider, a3);
  }

  return v7;
}

- (id)searchFTSWithCriteria:(id)a3 error:(id *)a4
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!objc_msgSend_isUserVaultEnabled(SEMSettings, v7, v8, v9)) {
    goto LABEL_5;
  }
  int IsDefault = objc_msgSend_currentPersonaIsDefault(SEMPersonaUtilities, v10, v11, v12);
  v14 = (void *)qword_26B3549D8;
  BOOL v15 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
  if (!IsDefault)
  {
    if (v15)
    {
      v85 = v14;
      v89 = sub_25C7FBC68(2u, v86, v87, v88);
      v93 = objc_msgSend_currentPersonaIdentifier(SEMPersonaUtilities, v90, v91, v92);
      *(_DWORD *)buf = 136315650;
      v116 = "-[SEMFTSMatcher searchFTSWithCriteria:error:]";
      __int16 v117 = 2112;
      id v118 = v89;
      __int16 v119 = 2112;
      v120 = v93;
      _os_log_impl(&dword_25C7CA000, v85, OS_LOG_TYPE_INFO, "%s FTS targeting %@ for persona: %@", buf, 0x20u);

      objc_msgSend_ftsDatabaseReadAccessWithIndexSiteType_(self->_ftsAccessProvider, v94, 2, v95);
    }
    else
    {
      objc_msgSend_ftsDatabaseReadAccessWithIndexSiteType_(self->_ftsAccessProvider, v10, 2, v12);
    }
    goto LABEL_6;
  }
  if (v15)
  {
    v16 = v14;
    v20 = objc_msgSend_currentPersonaIdentifier(SEMPersonaUtilities, v17, v18, v19);
    *(_DWORD *)buf = 136315394;
    v116 = "-[SEMFTSMatcher searchFTSWithCriteria:error:]";
    __int16 v117 = 2112;
    id v118 = v20;
    _os_log_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_INFO, "%s Current persona (%@) is default. Will not attempt to search a UserVault index", buf, 0x16u);

    objc_msgSend_ftsDatabaseReadAccessWithIndexSiteType_(self->_ftsAccessProvider, v21, 1, v22);
  }
  else
  {
LABEL_5:
    objc_msgSend_ftsDatabaseReadAccessWithIndexSiteType_(self->_ftsAccessProvider, v10, 1, v12);
  }
  v23 = LABEL_6:;
  id v112 = 0;
  v25 = objc_msgSend__matchFTSRecordsWithSearchCriteria_database_error_(self, v24, (uint64_t)v6, (uint64_t)v23, &v112);
  id v26 = v112;
  if (v25) {
    BOOL v30 = v26 == 0;
  }
  else {
    BOOL v30 = 0;
  }
  if (!v30)
  {
    v31 = v26;
    v32 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v116 = "-[SEMFTSMatcher searchFTSWithCriteria:error:]";
      __int16 v117 = 2112;
      id v118 = v31;
      _os_log_error_impl(&dword_25C7CA000, v32, OS_LOG_TYPE_ERROR, "%s FTS search failed due to error: %@", buf, 0x16u);
      if (a4)
      {
LABEL_12:
        if (v31) {
          *a4 = v31;
        }
      }
    }
    else if (a4)
    {
      goto LABEL_12;
    }

LABEL_15:
    v33 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_48;
  }
  if (!objc_msgSend_count(v25, v27, v28, v29))
  {
    v96 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v116 = "-[SEMFTSMatcher searchFTSWithCriteria:error:]";
      _os_log_impl(&dword_25C7CA000, v96, OS_LOG_TYPE_INFO, "%s No records returned from FTS query", buf, 0xCu);
    }
    goto LABEL_15;
  }
  uint64_t v102 = (uint64_t)v23;
  id v34 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v38 = objc_msgSend_count(v25, v35, v36, v37);
  v41 = objc_msgSend_initWithCapacity_(v34, v39, v38, v40);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v101 = v25;
  id v42 = v25;
  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v108, (uint64_t)v114, 16);
  if (v44)
  {
    uint64_t v48 = v44;
    uint64_t v49 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v109 != v49) {
          objc_enumerationMutation(v42);
        }
        v51 = objc_msgSend_externalId(*(void **)(*((void *)&v108 + 1) + 8 * i), v45, v46, v47);
        objc_msgSend_addObject_(v41, v52, (uint64_t)v51, v53);
      }
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v108, (uint64_t)v114, 16);
    }
    while (v48);
  }

  v57 = objc_msgSend_allObjects(v41, v54, v55, v56);
  id v107 = 0;
  v23 = (void *)v102;
  v59 = objc_msgSend__allFTSRecordsWithExternalIds_database_error_(self, v58, (uint64_t)v57, v102, &v107);
  id v60 = v107;

  if (!v59 || v60)
  {
    v97 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v116 = "-[SEMFTSMatcher searchFTSWithCriteria:error:]";
      __int16 v117 = 2112;
      id v118 = v60;
      _os_log_error_impl(&dword_25C7CA000, v97, OS_LOG_TYPE_ERROR, "%s externalId search failed due to error: %@", buf, 0x16u);
    }
    v33 = (void *)MEMORY[0x263EFFA68];
    if (a4)
    {
      v25 = v101;
      if (v60) {
        *a4 = v60;
      }
    }
    else
    {
      v25 = v101;
    }
  }
  else
  {
    v99 = 0;
    id v100 = v6;
    id v61 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v65 = objc_msgSend_count(v59, v62, v63, v64);
    v33 = objc_msgSend_initWithCapacity_(v61, v66, v65, v67);
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v71 = objc_msgSend_allKeys(v59, v68, v69, v70);
    uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v103, (uint64_t)v113, 16);
    if (v73)
    {
      uint64_t v76 = v73;
      uint64_t v77 = *(void *)v104;
      do
      {
        for (uint64_t j = 0; j != v76; ++j)
        {
          if (*(void *)v104 != v77) {
            objc_enumerationMutation(v71);
          }
          v79 = objc_msgSend_objectForKey_(v59, v74, *(void *)(*((void *)&v103 + 1) + 8 * j), v75, v99, v100);
          v82 = objc_msgSend_resultFromFTSRecords_(SEMAppCustomVocabularySearchResult, v80, (uint64_t)v79, v81);

          if (v82) {
            objc_msgSend_addObject_(v33, v83, (uint64_t)v82, v84);
          }
        }
        uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v74, (uint64_t)&v103, (uint64_t)v113, 16);
      }
      while (v76);
    }

    id v6 = v100;
    v25 = v101;
    v23 = (void *)v102;
    id v60 = v99;
  }

LABEL_48:
  return v33;
}

- (id)_matchFTSRecordsWithSearchCriteria:(id)a3 database:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v15 = objc_msgSend_commandCriteriaFromSearchTerms(v7, v9, v10, v11);
  if (v15)
  {
    v16 = objc_msgSend_commandCriteriaFromFilters(v7, v12, v13, v14);
    uint64_t v19 = objc_msgSend_arrayByAddingObjectsFromArray_(v16, v17, (uint64_t)v15, v18);
    uint64_t v22 = objc_msgSend_criterionWithANDSubCriteria_(SEMSQLCommandCriterion, v20, (uint64_t)v19, v21);

    id v26 = objc_msgSend_tableName(SEMFTSRecord, v23, v24, v25);
    uint64_t v29 = objc_msgSend_builderWithTableName_(SEMDatabaseSelect, v27, (uint64_t)v26, v28);

    objc_msgSend_setCommandCriterion_(v29, v30, (uint64_t)v22, v31);
    v35 = objc_msgSend_build(v29, v32, v33, v34);
    id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v37 = objc_opt_class();
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = sub_25C7F1D40;
    v43[3] = &unk_2654DE270;
    id v38 = v36;
    id v44 = v38;
    int v40 = objc_msgSend_enumerateRecordResultsOfSelect_recordClass_error_usingBlock_(v8, v39, (uint64_t)v35, v37, a5, v43);

    if (v40) {
      id v41 = v38;
    }
    else {
      id v41 = 0;
    }
  }
  else
  {
    id v41 = 0;
  }

  return v41;
}

- (id)_allFTSRecordsWithExternalIds:(id)a3 database:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v13 = objc_msgSend_count(v7, v10, v11, v12);
  v16 = objc_msgSend_initWithCapacity_(v9, v14, v13, v15);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v17 = v7;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v52, (uint64_t)v56, 16);
  if (v19)
  {
    uint64_t v22 = v19;
    uint64_t v23 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(v17);
        }
        uint64_t v25 = objc_msgSend_encodedExternalIdString_(SEMFTSRecord, v20, *(void *)(*((void *)&v52 + 1) + 8 * i), v21);
        objc_msgSend_addObject_(v16, v26, (uint64_t)v25, v27);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v52, (uint64_t)v56, 16);
    }
    while (v22);
  }

  uint64_t v29 = objc_msgSend_criterionWithColumnName_INColumnValues_(SEMSQLCommandCriterion, v28, 0x2709E0BF0, (uint64_t)v16);
  uint64_t v33 = objc_msgSend_tableName(SEMFTSRecord, v30, v31, v32);
  id v36 = objc_msgSend_builderWithTableName_(SEMDatabaseSelect, v34, (uint64_t)v33, v35);

  objc_msgSend_setCommandCriterion_(v36, v37, (uint64_t)v29, v38);
  id v42 = objc_msgSend_build(v36, v39, v40, v41);
  id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v44 = objc_opt_class();
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = sub_25C7F1FFC;
  v50[3] = &unk_2654DE270;
  id v45 = v43;
  id v51 = v45;
  int v47 = objc_msgSend_enumerateRecordResultsOfSelect_recordClass_error_usingBlock_(v8, v46, (uint64_t)v42, v44, a5, v50);

  if (v47) {
    id v48 = v45;
  }
  else {
    id v48 = 0;
  }

  return v48;
}

- (void).cxx_destruct
{
}

@end