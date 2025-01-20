@interface APOdmlAssetManager
- (APOdmlAssetManager)initWithNamespace:(id)a3 andClient:(id)a4;
- (APOdmlFeatureStorage)featureStorage;
- (APOdmlUnfairLock)modelCacheLock;
- (NSCache)modelCache;
- (NSString)experimentID;
- (NSString)odmlNamespace;
- (NSString)treatmentID;
- (NSString)trialNamespace;
- (TRIClient)trialClient;
- (TRIExperimentIdentifiers)trialIdentifiers;
- (id)BOOLeanValueForFactor:(id)a3;
- (id)currentMLModel;
- (id)doubleValueForFactor:(id)a3;
- (id)featureForName:(id)a3;
- (id)featuresForName:(id)a3;
- (id)longValueForFactor:(id)a3;
- (id)pathForFactor:(id)a3 isDirectory:(BOOL)a4;
- (id)saveFeatureFromObject:(id)a3 withName:(id)a4;
- (id)stringValueForFactor:(id)a3;
- (int)deploymentID;
- (int)odmlVersion;
- (void)deleteExpiredFeaturesForName:(id)a3 lookbackWindow:(id)a4;
- (void)setFeatureStorage:(id)a3;
@end

@implementation APOdmlAssetManager

- (id)currentMLModel
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = 0x1E4F1C000uLL;
  v5 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, v2);
  v8 = objc_msgSend_trialClient(self, v6, v7);

  if (v8)
  {
    v10 = objc_msgSend_pathForFactor_isDirectory_(self, v9, @"PTTRMLModel", 1);
    v13 = objc_msgSend_modelCache(self, v11, v12);
    v15 = objc_msgSend_objectForKey_(v13, v14, (uint64_t)v10);

    if (v15)
    {
      v17 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_opt_class();
        id v19 = v18;
        v22 = objc_msgSend_description(v10, v20, v21);
        *(_DWORD *)buf = 138412546;
        id v78 = v18;
        __int16 v79 = 2112;
        v80 = v22;
        _os_log_impl(&dword_1BBC44000, v17, OS_LOG_TYPE_DEFAULT, "[%@] Returning cached model for %@.", buf, 0x16u);

        unint64_t v4 = 0x1E4F1C000;
      }
    }
    else
    {
      v27 = objc_msgSend_BOOLeanValueForFactor_(self, v16, @"PredictionUsesCPUOnly");
      uint64_t v30 = objc_msgSend_BOOLValue(v27, v28, v29);

      uint64_t v32 = objc_msgSend_modelFromCompiledURL_isCPUOnly_(MEMORY[0x1E4F1E968], v31, (uint64_t)v10, v30);
      if (!v32)
      {
        v71 = OdmlLogForCategory(0);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v78 = (id)objc_opt_class();
          id v72 = v78;
          _os_log_impl(&dword_1BBC44000, v71, OS_LOG_TYPE_ERROR, "[%@] Could not open model.", buf, 0xCu);
        }
        v41 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v73, @"APOdmlRerankingErrorDomain", 2010, 0);
        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsReranking, v74, (uint64_t)v41, 0);
        v15 = 0;
        v48 = @"ERROR: Could not find valid model description.";
        goto LABEL_15;
      }
      v15 = (void *)v32;
      v17 = objc_msgSend_modelCache(self, v33, v34);
      objc_msgSend_setObject_forKey_(v17, v35, (uint64_t)v15, v10);
    }

    v38 = objc_msgSend_modelDescription(v15, v36, v37);
    v41 = objc_msgSend_metadata(v38, v39, v40);

    v43 = objc_msgSend_objectForKey_(v41, v42, @"MLModelDescriptionKey");
    v45 = v43;
    if (v43 && (objc_msgSend_isEqualToString_(v43, v44, (uint64_t)&stru_1F14FE8B8) & 1) == 0)
    {
      v49 = NSString;
      v50 = objc_msgSend_trialNamespace(self, v46, v47);
      objc_msgSend_stringWithFormat_(v49, v51, @"MLModel for namespace %@: %@", v50, v45);
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = @"ERROR: Could not find valid model description.";
    }

LABEL_15:
    v76[0] = @"MLModel";
    v75[0] = @"loggerKey";
    v75[1] = @"uniqueIdentifier";
    v54 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v52, v53);
    v57 = objc_msgSend_UUIDString(v54, v55, v56);
    v75[2] = @"message";
    v76[1] = v57;
    v76[2] = v48;
    v59 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v58, (uint64_t)v76, v75, 3);

    v60 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v63 = objc_msgSend_description(v59, v61, v62);
      *(_DWORD *)buf = 138412290;
      id v78 = v63;
      _os_log_impl(&dword_1BBC44000, v60, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v65 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v64, @"APOdmlRerankingErrorDomain", 2101, 0);
    v68 = objc_msgSend_date(*(void **)(v4 + 2504), v66, v67);
    objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v69, (uint64_t)v65, 1, 0, v5, v68);

    goto LABEL_18;
  }
  v23 = OdmlLogForCategory(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v78 = (id)objc_opt_class();
    id v24 = v78;
    _os_log_impl(&dword_1BBC44000, v23, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for MLModel.", buf, 0xCu);
  }
  v10 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v25, @"APOdmlRerankingErrorDomain", 2009, 0);
  objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsReranking, v26, (uint64_t)v10, 0);
  v15 = 0;
LABEL_18:

  return v15;
}

- (NSCache)modelCache
{
  modelCache = self->_modelCache;
  if (!modelCache)
  {
    v5 = objc_msgSend_modelCacheLock(self, a2, v2);
    objc_msgSend_lock(v5, v6, v7);

    if (!self->_modelCache)
    {
      v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
      v11 = self->_modelCache;
      self->_modelCache = v10;

      objc_msgSend_setCountLimit_(self->_modelCache, v12, 3);
    }
    v13 = objc_msgSend_modelCacheLock(self, v8, v9);
    objc_msgSend_unlock(v13, v14, v15);

    modelCache = self->_modelCache;
  }

  return modelCache;
}

- (APOdmlUnfairLock)modelCacheLock
{
  return self->_modelCacheLock;
}

- (id)BOOLeanValueForFactor:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_trialClient(self, v5, v6);

  if (v7)
  {
    v10 = objc_msgSend_trialClient(self, v8, v9);
    v13 = objc_msgSend_trialNamespace(self, v11, v12);
    uint64_t v15 = objc_msgSend_levelForFactor_withNamespaceName_(v10, v14, (uint64_t)v4, v13);

    if (v15)
    {
      v18 = NSNumber;
      uint64_t v19 = objc_msgSend_BOOLeanValue(v15, v16, v17);
      uint64_t v21 = objc_msgSend_numberWithBool_(v18, v20, v19);
      v22 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_opt_class();
        id v24 = v23;
        v27 = objc_msgSend_trialNamespace(self, v25, v26);
        int v35 = 138413058;
        id v36 = v23;
        __int16 v37 = 2112;
        id v38 = v4;
        __int16 v39 = 2112;
        uint64_t v40 = v27;
        __int16 v41 = 2112;
        v42 = v21;
        _os_log_impl(&dword_1BBC44000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Boolean value for factor %@ in namespace %@: %@", (uint8_t *)&v35, 0x2Au);
      }
    }
    else
    {
      v22 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class();
        id v30 = v29;
        v33 = objc_msgSend_trialNamespace(self, v31, v32);
        int v35 = 138412802;
        id v36 = v29;
        __int16 v37 = 2112;
        id v38 = v4;
        __int16 v39 = 2112;
        uint64_t v40 = v33;
        _os_log_impl(&dword_1BBC44000, v22, OS_LOG_TYPE_ERROR, "[%@] Level not found for factor %@ in namespace %@", (uint8_t *)&v35, 0x20u);
      }
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v15 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v35 = 138412546;
      id v36 = (id)objc_opt_class();
      __int16 v37 = 2112;
      id v38 = v4;
      id v28 = v36;
      _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for %@", (uint8_t *)&v35, 0x16u);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)pathForFactor:(id)a3 isDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v9 = objc_msgSend_trialClient(self, v7, v8);

  if (v9)
  {
    uint64_t v12 = objc_msgSend_trialClient(self, v10, v11);
    uint64_t v15 = objc_msgSend_trialNamespace(self, v13, v14);
    uint64_t v17 = objc_msgSend_levelForFactor_withNamespaceName_(v12, v16, (uint64_t)v6, v15);

    if (v17)
    {
      if (v4) {
        objc_msgSend_directoryValue(v17, v18, v19);
      }
      else {
      v20 = objc_msgSend_fileValue(v17, v18, v19);
      }
      v25 = v20;
      if (v20)
      {
        if (!objc_msgSend_hasPath(v20, v21, v22)
          || (v33 = (void *)MEMORY[0x1E4F1CB10],
              objc_msgSend_path(v25, v31, v32),
              uint64_t v34 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_fileURLWithPath_(v33, v35, (uint64_t)v34),
              id v24 = objc_claimAutoreleasedReturnValue(),
              v34,
              !v24))
        {
          id v36 = OdmlLogForCategory(0);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            int v50 = 138412290;
            id v51 = (id)objc_opt_class();
            id v37 = v51;
            _os_log_impl(&dword_1BBC44000, v36, OS_LOG_TYPE_ERROR, "[%@] Asset URL not found.", (uint8_t *)&v50, 0xCu);
          }
          id v24 = 0;
        }
        id v38 = OdmlLogForCategory(0);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v39 = objc_opt_class();
          id v40 = v39;
          uint64_t v43 = objc_msgSend_trialNamespace(self, v41, v42);
          int v50 = 138413058;
          id v51 = v39;
          __int16 v52 = 2112;
          id v53 = v6;
          __int16 v54 = 2112;
          v55 = v43;
          __int16 v56 = 2112;
          v57 = v24;
          _os_log_impl(&dword_1BBC44000, v38, OS_LOG_TYPE_DEFAULT, "[%@] Path for factor %@ in namespace %@: %@", (uint8_t *)&v50, 0x2Au);
        }
      }
      else
      {
        id v38 = OdmlLogForCategory(0);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v44 = objc_opt_class();
          id v45 = v44;
          v48 = objc_msgSend_trialNamespace(self, v46, v47);
          int v50 = 138412802;
          id v51 = v44;
          __int16 v52 = 2112;
          id v53 = v6;
          __int16 v54 = 2112;
          v55 = v48;
          _os_log_impl(&dword_1BBC44000, v38, OS_LOG_TYPE_ERROR, "[%@] File not found for level %@ in namespace %@", (uint8_t *)&v50, 0x20u);
        }
        id v24 = 0;
      }
    }
    else
    {
      v25 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = objc_opt_class();
        id v27 = v26;
        id v30 = objc_msgSend_trialNamespace(self, v28, v29);
        int v50 = 138412802;
        id v51 = v26;
        __int16 v52 = 2112;
        id v53 = v6;
        __int16 v54 = 2112;
        v55 = v30;
        _os_log_impl(&dword_1BBC44000, v25, OS_LOG_TYPE_ERROR, "[%@] Level not found for factor %@ in namespace %@", (uint8_t *)&v50, 0x20u);
      }
      id v24 = 0;
    }
  }
  else
  {
    uint64_t v17 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v50 = 138412546;
      id v51 = (id)objc_opt_class();
      __int16 v52 = 2112;
      id v53 = v6;
      id v23 = v51;
      _os_log_impl(&dword_1BBC44000, v17, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for %@", (uint8_t *)&v50, 0x16u);
    }
    id v24 = 0;
  }

  return v24;
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (APOdmlAssetManager)initWithNamespace:(id)a3 andClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)APOdmlAssetManager;
  uint64_t v9 = [(APOdmlAssetManager *)&v32 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_trialNamespace, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_trialClient, a4);
      uint64_t v12 = objc_msgSend_experimentIdentifiersWithNamespaceName_(v8, v11, (uint64_t)v7);
      trialIdentifiers = v10->_trialIdentifiers;
      v10->_trialIdentifiers = (TRIExperimentIdentifiers *)v12;

      uint64_t v14 = [APOdmlFeatureStorage alloc];
      uint64_t v17 = objc_msgSend_experimentId(v10->_trialIdentifiers, v15, v16);
      v20 = objc_msgSend_treatmentId(v10->_trialIdentifiers, v18, v19);
      uint64_t v23 = objc_msgSend_deploymentId(v10->_trialIdentifiers, v21, v22);
      uint64_t v25 = objc_msgSend_initWithExperimentID_treatmentID_deploymentID_trialNamespace_(v14, v24, (uint64_t)v17, v20, v23, v7);
      featureStorage = v10->_featureStorage;
      v10->_featureStorage = (APOdmlFeatureStorage *)v25;

      id v27 = [APOdmlUnfairLock alloc];
      uint64_t v29 = objc_msgSend_initWithOptions_(v27, v28, 1);
      modelCacheLock = v10->_modelCacheLock;
      v10->_modelCacheLock = (APOdmlUnfairLock *)v29;
    }
  }

  return v10;
}

- (int)deploymentID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend_trialIdentifiers(self, a2, v2);

  if (v4)
  {
    id v7 = objc_msgSend_trialIdentifiers(self, v5, v6);
    int v10 = objc_msgSend_deploymentId(v7, v8, v9);

    return v10;
  }
  else
  {
    uint64_t v12 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = (id)objc_opt_class();
      id v13 = v15;
      _os_log_impl(&dword_1BBC44000, v12, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial identifiers, cannot find deploymentID.", (uint8_t *)&v14, 0xCu);
    }
    return -1;
  }
}

- (NSString)experimentID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend_trialIdentifiers(self, a2, v2);

  if (v4)
  {
    id v7 = objc_msgSend_trialIdentifiers(self, v5, v6);
    int v10 = objc_msgSend_experimentId(v7, v8, v9);
  }
  else
  {
    uint64_t v11 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = (id)objc_opt_class();
      id v12 = v15;
      _os_log_impl(&dword_1BBC44000, v11, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial identifiers, cannot find experimentID.", (uint8_t *)&v14, 0xCu);
    }
    int v10 = 0;
  }

  return (NSString *)v10;
}

- (NSString)treatmentID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend_trialIdentifiers(self, a2, v2);

  if (v4)
  {
    id v7 = objc_msgSend_trialIdentifiers(self, v5, v6);
    int v10 = objc_msgSend_treatmentId(v7, v8, v9);
  }
  else
  {
    uint64_t v11 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = (id)objc_opt_class();
      id v12 = v15;
      _os_log_impl(&dword_1BBC44000, v11, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial identifiers, cannot find treatmentID.", (uint8_t *)&v14, 0xCu);
    }
    int v10 = 0;
  }

  return (NSString *)v10;
}

- (NSString)odmlNamespace
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend_trialNamespace(self, a2, v2);

  if (v4)
  {
    id v7 = NSString;
    id v8 = objc_msgSend_trialNamespace(self, v5, v6);
    int v10 = objc_msgSend_stringWithString_(v7, v9, (uint64_t)v8);
  }
  else
  {
    uint64_t v11 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = (id)objc_opt_class();
      id v12 = v15;
      _os_log_impl(&dword_1BBC44000, v11, OS_LOG_TYPE_ERROR, "[%@] No namespace initialized with AssetManager; namespace not found.",
        (uint8_t *)&v14,
        0xCu);
    }
    int v10 = 0;
  }

  return (NSString *)v10;
}

- (int)odmlVersion
{
  return 4;
}

- (id)doubleValueForFactor:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_trialClient(self, v5, v6);

  if (v7)
  {
    int v10 = objc_msgSend_trialClient(self, v8, v9);
    id v13 = objc_msgSend_trialNamespace(self, v11, v12);
    id v15 = objc_msgSend_levelForFactor_withNamespaceName_(v10, v14, (uint64_t)v4, v13);

    if (v15)
    {
      v18 = NSNumber;
      objc_msgSend_doubleValue(v15, v16, v17);
      uint64_t v21 = objc_msgSend_numberWithDouble_(v18, v19, v20);
      uint64_t v22 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = objc_opt_class();
        id v24 = v23;
        id v27 = objc_msgSend_trialNamespace(self, v25, v26);
        int v35 = 138413058;
        id v36 = v23;
        __int16 v37 = 2112;
        id v38 = v4;
        __int16 v39 = 2112;
        id v40 = v27;
        __int16 v41 = 2112;
        uint64_t v42 = v21;
        _os_log_impl(&dword_1BBC44000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Double value for factor %@ in namespace %@: %@", (uint8_t *)&v35, 0x2Au);
      }
    }
    else
    {
      uint64_t v22 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class();
        id v30 = v29;
        v33 = objc_msgSend_trialNamespace(self, v31, v32);
        int v35 = 138412802;
        id v36 = v29;
        __int16 v37 = 2112;
        id v38 = v4;
        __int16 v39 = 2112;
        id v40 = v33;
        _os_log_impl(&dword_1BBC44000, v22, OS_LOG_TYPE_ERROR, "[%@] Level not found for factor %@ in namespace %@", (uint8_t *)&v35, 0x20u);
      }
      uint64_t v21 = 0;
    }
  }
  else
  {
    id v15 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v35 = 138412546;
      id v36 = (id)objc_opt_class();
      __int16 v37 = 2112;
      id v38 = v4;
      id v28 = v36;
      _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for %@", (uint8_t *)&v35, 0x16u);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)longValueForFactor:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_trialClient(self, v5, v6);

  if (v7)
  {
    int v10 = objc_msgSend_trialClient(self, v8, v9);
    id v13 = objc_msgSend_trialNamespace(self, v11, v12);
    id v15 = objc_msgSend_levelForFactor_withNamespaceName_(v10, v14, (uint64_t)v4, v13);

    if (v15)
    {
      v18 = NSNumber;
      uint64_t v19 = objc_msgSend_longValue(v15, v16, v17);
      uint64_t v21 = objc_msgSend_numberWithLong_(v18, v20, v19);
      uint64_t v22 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = objc_opt_class();
        id v24 = v23;
        id v27 = objc_msgSend_trialNamespace(self, v25, v26);
        int v35 = 138413058;
        id v36 = v23;
        __int16 v37 = 2112;
        id v38 = v4;
        __int16 v39 = 2112;
        id v40 = v27;
        __int16 v41 = 2112;
        uint64_t v42 = v21;
        _os_log_impl(&dword_1BBC44000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Long value for factor %@ in namespace %@: %@", (uint8_t *)&v35, 0x2Au);
      }
    }
    else
    {
      uint64_t v22 = OdmlLogForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class();
        id v30 = v29;
        v33 = objc_msgSend_trialNamespace(self, v31, v32);
        int v35 = 138412802;
        id v36 = v29;
        __int16 v37 = 2112;
        id v38 = v4;
        __int16 v39 = 2112;
        id v40 = v33;
        _os_log_impl(&dword_1BBC44000, v22, OS_LOG_TYPE_ERROR, "[%@] Level not found for factor %@ in namespace %@", (uint8_t *)&v35, 0x20u);
      }
      uint64_t v21 = 0;
    }
  }
  else
  {
    id v15 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v35 = 138412546;
      id v36 = (id)objc_opt_class();
      __int16 v37 = 2112;
      id v38 = v4;
      id v28 = v36;
      _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for %@", (uint8_t *)&v35, 0x16u);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)stringValueForFactor:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_trialClient(self, v5, v6);

  if (!v7)
  {
    id v15 = OdmlLogForCategory(0);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      id v28 = 0;
      goto LABEL_12;
    }
    int v35 = 138412546;
    id v36 = (id)objc_opt_class();
    __int16 v37 = 2112;
    id v38 = v4;
    uint64_t v17 = v36;
    _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for %@", (uint8_t *)&v35, 0x16u);
LABEL_10:

    goto LABEL_11;
  }
  int v10 = objc_msgSend_trialClient(self, v8, v9);
  id v13 = objc_msgSend_trialNamespace(self, v11, v12);
  id v15 = objc_msgSend_levelForFactor_withNamespaceName_(v10, v14, (uint64_t)v4, v13);

  uint64_t v16 = OdmlLogForCategory(0);
  uint64_t v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_opt_class();
      id v30 = v29;
      v33 = objc_msgSend_trialNamespace(self, v31, v32);
      int v35 = 138412802;
      id v36 = v29;
      __int16 v37 = 2112;
      id v38 = v4;
      __int16 v39 = 2112;
      id v40 = v33;
      _os_log_impl(&dword_1BBC44000, v17, OS_LOG_TYPE_ERROR, "[%@] Level not found for factor %@ in namespace %@", (uint8_t *)&v35, 0x20u);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_opt_class();
    id v19 = v18;
    uint64_t v22 = objc_msgSend_trialNamespace(self, v20, v21);
    uint64_t v25 = objc_msgSend_stringValue(v15, v23, v24);
    int v35 = 138413058;
    id v36 = v18;
    __int16 v37 = 2112;
    id v38 = v4;
    __int16 v39 = 2112;
    id v40 = v22;
    __int16 v41 = 2112;
    uint64_t v42 = v25;
    _os_log_impl(&dword_1BBC44000, v17, OS_LOG_TYPE_DEFAULT, "[%@] String value for factor %@ in namespace %@: %@", (uint8_t *)&v35, 0x2Au);
  }
  id v28 = objc_msgSend_stringValue(v15, v26, v27);
LABEL_12:

  return v28;
}

- (id)saveFeatureFromObject:(id)a3 withName:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v10 = objc_msgSend_featureStorage(self, v8, v9);

  if (v10)
  {
    id v13 = objc_msgSend_featureStorage(self, v11, v12);
    id v15 = objc_msgSend_saveFeatureFromObject_withName_(v13, v14, (uint64_t)v6, v7);
  }
  else
  {
    uint64_t v16 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412546;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2112;
      id v23 = v7;
      id v17 = v21;
      _os_log_impl(&dword_1BBC44000, v16, OS_LOG_TYPE_ERROR, "[%@] Nil value for FeatureStorage, cannot save feature %@", (uint8_t *)&v20, 0x16u);
    }
    id v15 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v18, @"APOdmlFeatureStorageErrorDomain", 5016, 0);
  }

  return v15;
}

- (id)featureForName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_featureStorage(self, v5, v6);

  if (v7)
  {
    int v10 = objc_msgSend_featureStorage(self, v8, v9);
    uint64_t v12 = objc_msgSend_featureForName_(v10, v11, (uint64_t)v4);
  }
  else
  {
    id v13 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2112;
      id v19 = v4;
      id v14 = v17;
      _os_log_impl(&dword_1BBC44000, v13, OS_LOG_TYPE_ERROR, "[%@] Nil value for FeatureStorage, cannot retrieve feature %@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)featuresForName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_featureStorage(self, v5, v6);

  if (v7)
  {
    int v10 = objc_msgSend_featureStorage(self, v8, v9);
    uint64_t v12 = objc_msgSend_doubleValueForFactor_(self, v11, @"LookbackWindow");
    id v14 = objc_msgSend_vectorsForName_lookbackWindow_(v10, v13, (uint64_t)v4, v12);
  }
  else
  {
    id v15 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412546;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2112;
      id v21 = v4;
      id v16 = v19;
      _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "[%@] Nil value for FeatureStorage, cannot retrieve feature %@", (uint8_t *)&v18, 0x16u);
    }
    id v14 = 0;
  }

  return v14;
}

- (void)deleteExpiredFeaturesForName:(id)a3 lookbackWindow:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_featureStorage(self, v7, v8);

  if (v9)
  {
    uint64_t v12 = objc_msgSend_featureStorage(self, v10, v11);
    objc_msgSend_deleteExpiredFeaturesForName_lookbackWindow_(v12, v13, (uint64_t)v14, v6);
  }
}

- (TRIExperimentIdentifiers)trialIdentifiers
{
  return self->_trialIdentifiers;
}

- (APOdmlFeatureStorage)featureStorage
{
  return self->_featureStorage;
}

- (void)setFeatureStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelCacheLock, 0);
  objc_storeStrong((id *)&self->_featureStorage, 0);
  objc_storeStrong((id *)&self->_trialNamespace, 0);
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);

  objc_storeStrong((id *)&self->_modelCache, 0);
}

@end