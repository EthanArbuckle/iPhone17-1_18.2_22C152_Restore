@interface APOdmlFeatureStorage
- (APOdmlFeatureStorage)initWithExperimentID:(id)a3 treatmentID:(id)a4 deploymentID:(int)a5 trialNamespace:(id)a6;
- (NSString)experimentID;
- (NSString)treatmentID;
- (NSString)trialNamespace;
- (id)featureForName:(id)a3;
- (id)featureForName:(id)a3 backgroundContext:(id)a4;
- (id)featuresForName:(id)a3 fetchLimit:(unint64_t)a4 backgroundContext:(id)a5;
- (id)saveFeatureFromObject:(id)a3 withName:(id)a4;
- (id)vectorsForName:(id)a3 lookbackWindow:(id)a4;
- (int)deploymentID;
- (void)deleteExpiredFeaturesForName:(id)a3 lookbackWindow:(id)a4;
- (void)setDeploymentID:(int)a3;
- (void)setExperimentID:(id)a3;
- (void)setTreatmentID:(id)a3;
- (void)setTrialNamespace:(id)a3;
@end

@implementation APOdmlFeatureStorage

- (APOdmlFeatureStorage)initWithExperimentID:(id)a3 treatmentID:(id)a4 deploymentID:(int)a5 trialNamespace:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)APOdmlFeatureStorage;
  v14 = [(APOdmlCoreDataStorage *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_experimentID, a3);
    objc_storeStrong((id *)&v15->_treatmentID, a4);
    v15->_deploymentID = a5;
    objc_storeStrong((id *)&v15->_trialNamespace, a6);
  }

  return v15;
}

- (id)featureForName:(id)a3 backgroundContext:(id)a4
{
  v4 = objc_msgSend_featuresForName_fetchLimit_backgroundContext_(self, a2, (uint64_t)a3, 1, a4);
  v7 = v4;
  if (v4)
  {
    v8 = objc_msgSend_firstObject(v4, v5, v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)featureForName:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8 = objc_msgSend_storePrecheck(v5, v6, v7);
  if (v8)
  {
    v9 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      id v10 = *(id *)&buf[4];
      _os_log_impl(&dword_1BBC44000, v9, OS_LOG_TYPE_ERROR, "[%@] Get feature failed; CoreData failed to load with the following error: %@.",
        buf,
        0x16u);
    }
    id v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, @"APOdmlFeatureStorageErrorDomain", 5004, 0);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v13, (uint64_t)v12, 0);

    objc_sync_exit(v5);
    id v14 = 0;
  }
  else
  {
    objc_sync_exit(v5);

    objc_super v17 = objc_msgSend_persistentContainer(v5, v15, v16);
    v20 = (APOdmlFeatureStorage *)objc_msgSend_newBackgroundContext(v17, v18, v19);

    v22 = objc_msgSend_featureForName_backgroundContext_(v5, v21, (uint64_t)v4, v20);
    v23 = v22;
    if (v22)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v30 = sub_1BBC4EC0C;
      v31 = sub_1BBC4EC1C;
      id v32 = 0;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1BBC4EC24;
      v26[3] = &unk_1E624A828;
      v28 = buf;
      id v27 = v22;
      objc_msgSend_performBlockAndWait_(v20, v24, (uint64_t)v26);
      id v14 = *(id *)(*(void *)&buf[8] + 40);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v14 = 0;
    }

    v5 = v20;
  }

  return v14;
}

- (id)vectorsForName:(id)a3 lookbackWindow:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v47 = a4;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  v9 = objc_msgSend_storePrecheck(v6, v7, v8);
  if (v9)
  {
    id v10 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      id v11 = *(id *)&buf[4];
      _os_log_impl(&dword_1BBC44000, v10, OS_LOG_TYPE_ERROR, "[%@] Vector retrieval failed; CoreData failed to load with the following error: %@.",
        buf,
        0x16u);
    }
    objc_sync_exit(v6);
    id v12 = 0;
  }
  else
  {
    objc_sync_exit(v6);

    v15 = objc_msgSend_persistentContainer(v6, v13, v14);
    v18 = (APOdmlFeatureStorage *)objc_msgSend_newBackgroundContext(v15, v16, v17);

    v20 = objc_msgSend_featuresForName_fetchLimit_backgroundContext_(v6, v19, (uint64_t)v45, 0, v18);
    v46 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v21, v22);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v23 = v20;
    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v49, v57, 16);
    if (v27)
    {
      uint64_t v28 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v50 != v28) {
            objc_enumerationMutation(v23);
          }
          v30 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if (v30)
          {
            v31 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v25, v26);
            v34 = objc_msgSend_createdAt(v30, v32, v33);
            objc_msgSend_timeIntervalSinceDate_(v31, v35, (uint64_t)v34);
            double v37 = v36;

            objc_msgSend_doubleValue(v47, v38, v39);
            if (v37 <= v40)
            {
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              v54 = sub_1BBC4EC0C;
              v55 = sub_1BBC4EC1C;
              id v56 = 0;
              v48[0] = MEMORY[0x1E4F143A8];
              v48[1] = 3221225472;
              v48[2] = sub_1BBC4F01C;
              v48[3] = &unk_1E624A828;
              v48[4] = v30;
              v48[5] = buf;
              objc_msgSend_performBlockAndWait_(v18, v25, (uint64_t)v48);
              objc_msgSend_addObject_(v46, v41, *(void *)(*(void *)&buf[8] + 40));
              _Block_object_dispose(buf, 8);
            }
          }
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v49, v57, 16);
      }
      while (v27);
    }

    id v12 = objc_msgSend_copy(v46, v42, v43);
    uint64_t v6 = v18;
  }

  return v12;
}

- (id)featuresForName:(id)a3 fetchLimit:(unint64_t)a4 backgroundContext:(id)a5
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v70 = a5;
  v9 = self;
  objc_sync_enter(v9);
  id v12 = objc_msgSend_storePrecheck(v9, v10, v11);
  if (v12)
  {
    id v13 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      id v15 = v14;
      _os_log_impl(&dword_1BBC44000, v13, OS_LOG_TYPE_ERROR, "[%@] Get feature failed; CoreData failed to load with the following error: %@.",
        buf,
        0x16u);
    }
    uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v16, @"APOdmlFeatureStorageErrorDomain", 5004, 0);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v18, (uint64_t)v17, 0);
  }
  else
  {
    uint64_t v17 = 0;
  }

  objc_sync_exit(v9);
  if (v12)
  {
    id v20 = 0;
  }
  else
  {
    v21 = objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x1E4F1C0D0], v19, @"Feature");
    uint64_t v22 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v25 = objc_msgSend_deploymentID(v9, v23, v24);
    uint64_t v28 = objc_msgSend_experimentID(v9, v26, v27);
    v31 = objc_msgSend_treatmentID(v9, v29, v30);
    uint64_t v33 = objc_msgSend_predicateWithFormat_(v22, v32, @"(deploymentID == %d) AND (experimentID == %@) AND (treatmentID == %@) AND (featureType == %@)", v25, v28, v31, v8);

    objc_msgSend_setPredicate_(v21, v34, (uint64_t)v33);
    double v36 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v35, @"createdAt", 0);
    v90[0] = v36;
    v38 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v90, 1);
    objc_msgSend_setSortDescriptors_(v21, v39, (uint64_t)v38);

    if (a4)
    {
      objc_msgSend_setFetchLimit_(v21, v40, a4);
      v41 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a4;
        id v43 = v42;
        _os_log_impl(&dword_1BBC44000, v41, OS_LOG_TYPE_DEFAULT, "[%@] Fetching Features from CoreData with a fetch limit of %lu", buf, 0x16u);
      }
    }
    else
    {
      v41 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v44 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v44;
        id v45 = v44;
        _os_log_impl(&dword_1BBC44000, v41, OS_LOG_TYPE_DEFAULT, "[%@] Fetching Features from CoreData with no fetch limit.", buf, 0xCu);
      }
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v87 = sub_1BBC4EC0C;
    v88 = sub_1BBC4EC1C;
    id v89 = 0;
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = sub_1BBC4EC0C;
    v80 = sub_1BBC4EC1C;
    id v81 = 0;
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = sub_1BBC4F7AC;
    v71[3] = &unk_1E624A850;
    v74 = &v76;
    id v72 = v70;
    id v46 = v21;
    id v73 = v46;
    v75 = buf;
    objc_msgSend_performBlockAndWait_(v72, v47, (uint64_t)v71);
    long long v50 = (void *)v77[5];
    if (v50 && objc_msgSend_count(v50, v48, v49))
    {
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        long long v51 = OdmlLogForCategory(4uLL);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          long long v52 = objc_opt_class();
          uint64_t v53 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v82 = 138412546;
          id v83 = v52;
          __int16 v84 = 2112;
          uint64_t v85 = v53;
          id v54 = v52;
          _os_log_impl(&dword_1BBC44000, v51, OS_LOG_TYPE_ERROR, "[%@] NSFetchRequest failed with error: %@", v82, 0x16u);
        }
        uint64_t v56 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v55, @"APOdmlFeatureStorageErrorDomain", 5006, 0);

        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v57, v56, 0);
        id v20 = 0;
        uint64_t v17 = (void *)v56;
      }
      else
      {
        v65 = OdmlLogForCategory(0);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          id v66 = (id)objc_opt_class();
          uint64_t v69 = objc_msgSend_count((void *)v77[5], v67, v68);
          *(_DWORD *)v82 = 138412546;
          id v83 = v66;
          __int16 v84 = 2048;
          uint64_t v85 = v69;
          _os_log_impl(&dword_1BBC44000, v65, OS_LOG_TYPE_DEFAULT, "[%@] Fetched %lu Features from CoreData", v82, 0x16u);
        }
        id v20 = (id)v77[5];
      }
    }
    else
    {
      uint64_t v58 = OdmlLogForCategory(4uLL);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v59 = objc_opt_class();
        *(_DWORD *)v82 = 138412546;
        id v83 = v59;
        __int16 v84 = 2112;
        uint64_t v85 = (uint64_t)v8;
        id v60 = v59;
        _os_log_impl(&dword_1BBC44000, v58, OS_LOG_TYPE_ERROR, "[%@] Failed to retrieve feature %@", v82, 0x16u);
      }
      uint64_t v62 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v61, @"APOdmlFeatureStorageErrorDomain", 5005, 0);

      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v63, v62, 0);
      id v20 = 0;
      uint64_t v17 = (void *)v62;
    }

    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(buf, 8);
  }

  return v20;
}

- (id)saveFeatureFromObject:(id)a3 withName:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  objc_msgSend_storePrecheck(v8, v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    id v12 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      id v13 = *(id *)&buf[4];
      _os_log_impl(&dword_1BBC44000, v12, OS_LOG_TYPE_ERROR, "[%@] Save feature failed; CoreData failed to load with the following error: %@.",
        buf,
        0x16u);
    }
    id v15 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v14, @"APOdmlFeatureStorageErrorDomain", 5007, 0);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v16, (uint64_t)v15, 0);
    id v17 = v11;
  }
  else
  {
    id v15 = 0;
  }

  objc_sync_exit(v8);
  if (!v11)
  {
    id v20 = objc_msgSend_persistentContainer(v8, v18, v19);
    id v23 = objc_msgSend_newBackgroundContext(v20, v21, v22);

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v46 = sub_1BBC4EC0C;
    id v47 = sub_1BBC4EC1C;
    id v48 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_1BBC4FBDC;
    v35[3] = &unk_1E624A878;
    id v24 = v23;
    id v36 = v24;
    double v37 = v8;
    id v38 = v7;
    id v39 = v6;
    double v40 = buf;
    objc_msgSend_performBlockAndWait_(v24, v25, (uint64_t)v35);
    uint64_t v26 = *(void **)(*(void *)&buf[8] + 40);
    if (v26)
    {
      uint64_t v27 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_opt_class();
        uint64_t v29 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v41 = 138412546;
        v42 = v28;
        __int16 v43 = 2112;
        uint64_t v44 = v29;
        id v30 = v28;
        _os_log_impl(&dword_1BBC44000, v27, OS_LOG_TYPE_ERROR, "[%@] Failed to save object with error: %@", v41, 0x16u);
      }
      uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v31, @"APOdmlFeatureStorageErrorDomain", 5008, 0);

      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v33, v32, 0);
      uint64_t v26 = *(void **)(*(void *)&buf[8] + 40);
      id v15 = (void *)v32;
    }
    id v11 = v26;

    _Block_object_dispose(buf, 8);
  }

  return v11;
}

- (void)deleteExpiredFeaturesForName:(id)a3 lookbackWindow:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v49 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  obj = v6;
  v9 = objc_msgSend_storePrecheck(v6, v7, v8);
  if (v9)
  {
    uint64_t v10 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      id v11 = *(id *)&buf[4];
      _os_log_impl(&dword_1BBC44000, v10, OS_LOG_TYPE_ERROR, "[%@] Delete feature failed; CoreData failed to load with the following error: %@.",
        buf,
        0x16u);
    }
    objc_sync_exit(v6);
  }
  else
  {
    objc_sync_exit(v6);

    uint64_t v14 = objc_msgSend_persistentContainer(v6, v12, v13);
    id v6 = (APOdmlFeatureStorage *)objc_msgSend_newBackgroundContext(v14, v15, v16);

    objc_msgSend_featuresForName_fetchLimit_backgroundContext_(obj, v17, (uint64_t)v47, 0, v6);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v56, v68, 16);
    if (v22)
    {
      uint64_t v23 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v57 != v23) {
            objc_enumerationMutation(v18);
          }
          uint64_t v25 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if (v25)
          {
            uint64_t v26 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v20, v21);
            uint64_t v29 = objc_msgSend_createdAt(v25, v27, v28);
            objc_msgSend_timeIntervalSinceDate_(v26, v30, (uint64_t)v29);
            double v32 = v31;

            objc_msgSend_doubleValue(v49, v33, v34);
            if (v32 >= v35)
            {
              v53[0] = MEMORY[0x1E4F143A8];
              v53[1] = 3221225472;
              v53[2] = sub_1BBC50198;
              v53[3] = &unk_1E624A8A0;
              id v54 = v6;
              v55 = v25;
              objc_msgSend_performBlockAndWait_(v54, v36, (uint64_t)v53);
            }
          }
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v56, v68, 16);
      }
      while (v22);
    }

    if (objc_msgSend_hasChanges(v6, v37, v38))
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v65 = sub_1BBC4EC0C;
      id v66 = sub_1BBC4EC1C;
      id v67 = 0;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = sub_1BBC501A4;
      v50[3] = &unk_1E624A8C8;
      long long v51 = v6;
      long long v52 = buf;
      objc_msgSend_performBlockAndWait_(v51, v39, (uint64_t)v50);
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        double v40 = OdmlLogForCategory(0);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = objc_opt_class();
          uint64_t v42 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)id v60 = 138412546;
          v61 = v41;
          __int16 v62 = 2112;
          uint64_t v63 = v42;
          id v43 = v41;
          _os_log_impl(&dword_1BBC44000, v40, OS_LOG_TYPE_ERROR, "[%@] Failed to delete expired objects with error: %@", v60, 0x16u);
        }
        id v45 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v44, @"APOdmlFeatureStorageErrorDomain", 5009, 0);
        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v46, (uint64_t)v45, 0);
      }
      _Block_object_dispose(buf, 8);
    }
  }
}

- (int)deploymentID
{
  return self->_deploymentID;
}

- (void)setDeploymentID:(int)a3
{
  self->_deploymentID = a3;
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (void)setExperimentID:(id)a3
{
}

- (NSString)treatmentID
{
  return self->_treatmentID;
}

- (void)setTreatmentID:(id)a3
{
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (void)setTrialNamespace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialNamespace, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);

  objc_storeStrong((id *)&self->_experimentID, 0);
}

@end