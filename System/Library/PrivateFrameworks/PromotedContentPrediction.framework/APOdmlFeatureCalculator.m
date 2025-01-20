@interface APOdmlFeatureCalculator
- (APOdmlAssetManager)assetManager;
- (APOdmlFeatureCalculator)initWithActivity:(id)a3 placementType:(unint64_t)a4 assetManagerType:(unint64_t)a5;
- (APOdmlFeatureCalculator)initWithPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4;
- (APOdmlXpcLifecycleHandler)task;
- (NSDate)creationTime;
- (NSString)version;
- (NSURL)assetPath;
- (id)_vectorKeyForType:(unint64_t)a3;
- (id)createAndSaveVector:(unint64_t)a3;
- (id)createAndSaveVectorWithBuilder:(id)a3 vectorType:(unint64_t)a4;
- (unint64_t)assetManagerType;
- (unint64_t)placementType;
- (void)setAssetManager:(id)a3;
- (void)setAssetPath:(id)a3;
- (void)setCreationTime:(id)a3;
- (void)setTask:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation APOdmlFeatureCalculator

- (APOdmlFeatureCalculator)initWithPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)APOdmlFeatureCalculator;
  v8 = [(APOdmlFeatureCalculator *)&v37 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v6, v7);
    creationTime = v8->_creationTime;
    v8->_creationTime = (NSDate *)v9;

    v8->_assetManagerType = a4;
    v8->_placementType = a3;
    v13 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, v11, v12);
    uint64_t v15 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v13, v14, a3, a4);
    assetManager = v8->_assetManager;
    v8->_assetManager = (APOdmlAssetManager *)v15;

    uint64_t v18 = objc_msgSend_pathForFactor_isDirectory_(v8->_assetManager, v17, @"AppVectors", 0);
    assetPath = v8->_assetPath;
    v8->_assetPath = (NSURL *)v18;

    v20 = NSString;
    v21 = [APOdmlSettings alloc];
    v23 = objc_msgSend_initWithPlacementType_assetManagerType_(v21, v22, a3, a4);
    uint64_t v26 = objc_msgSend_odmlVersion(v23, v24, v25);
    uint64_t v28 = objc_msgSend_stringWithFormat_(v20, v27, @"%d", v26);
    version = v8->_version;
    v8->_version = (NSString *)v28;
  }
  v30 = OdmlLogForCategory(3uLL);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = objc_opt_class();
    id v32 = v31;
    v35 = objc_msgSend_assetPath(v8, v33, v34);
    *(_DWORD *)buf = 138412546;
    v39 = v31;
    __int16 v40 = 2112;
    v41 = v35;
    _os_log_impl(&dword_1BBC44000, v30, OS_LOG_TYPE_DEFAULT, "[%@]: Asset Path: %@", buf, 0x16u);
  }
  return v8;
}

- (APOdmlFeatureCalculator)initWithActivity:(id)a3 placementType:(unint64_t)a4 assetManagerType:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v10 = (APOdmlFeatureCalculator *)objc_msgSend_initWithPlacementType_assetManagerType_(self, v9, a4, a5);
  if (v10)
  {
    v11 = [APOdmlXpcLifecycleHandler alloc];
    uint64_t v13 = objc_msgSend_initWithActivity_(v11, v12, (uint64_t)v8);
    task = v10->_task;
    v10->_task = (APOdmlXpcLifecycleHandler *)v13;
  }
  uint64_t v15 = OdmlLogForCategory(3uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_opt_class();
    id v17 = v16;
    v20 = objc_msgSend_assetPath(v10, v18, v19);
    int v22 = 138412546;
    v23 = v16;
    __int16 v24 = 2112;
    uint64_t v25 = v20;
    _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_DEFAULT, "[%@]: Asset Path: %@", (uint8_t *)&v22, 0x16u);
  }
  return v10;
}

- (id)createAndSaveVector:(unint64_t)a3
{
  v5 = objc_msgSend_assetManager(self, a2, a3);
  uint64_t v7 = objc_msgSend_doubleValueForFactor_(v5, v6, @"LookbackWindow");

  v10 = objc_msgSend_assetManager(self, v8, v9);
  uint64_t v12 = objc_msgSend_longValueForFactor_(v10, v11, @"MaxQueryElements");

  uint64_t v15 = objc_msgSend_assetManager(self, v13, v14);
  id v17 = objc_msgSend_doubleValueForFactor_(v15, v16, @"ExponentialDecayConstant");

  v20 = objc_msgSend_assetManager(self, v18, v19);
  int v22 = objc_msgSend_BOOLeanValueForFactor_(v20, v21, @"WeightByDuration");

  id v23 = objc_alloc((Class)objc_opt_class());
  uint64_t v26 = objc_msgSend_version(self, v24, v25);
  v29 = objc_msgSend_task(self, v27, v28);
  BOOL v37 = objc_msgSend_assetManagerType(self, v30, v31) == 1;
  isCounterfactual = objc_msgSend_initWithVersion_lookbackPeriod_maxQueryElements_task_exponentialDecayConstant_weightByDuration_isCounterfactual_(v23, v32, (uint64_t)v26, v7, v12, v29, v17, v22, v37);

  v35 = objc_msgSend_createAndSaveVectorWithBuilder_vectorType_(self, v34, (uint64_t)isCounterfactual, a3);

  return v35;
}

- (id)createAndSaveVectorWithBuilder:(id)a3 vectorType:(unint64_t)a4
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = objc_msgSend__vectorKeyForType_(self, v7, a4);
  uint64_t v9 = [APOdmlAppVectorsFile alloc];
  uint64_t v12 = objc_msgSend_assetPath(self, v10, v11);
  uint64_t v15 = objc_msgSend_version(self, v13, v14);
  id v17 = objc_msgSend_initForReadingContentsOfURL_version_(v9, v16, (uint64_t)v12, v15);

  if (v17)
  {
    if (objc_msgSend_numberOfVectors(v17, v18, v19))
    {
      v20 = v17;
    }
    else
    {
      v35 = OdmlLogForCategory(3uLL);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v150 = objc_opt_class();
        id v36 = *(id *)v150;
        _os_log_impl(&dword_1BBC44000, v35, OS_LOG_TYPE_DEFAULT, "[%@]: Default AppVectors empty; attempting to fall back to SRP default file.",
          buf,
          0xCu);
      }
      v39 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, v37, v38);
      uint64_t v42 = objc_msgSend_assetManagerType(self, v40, v41);
      v44 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v39, v43, 0, v42);
      v20 = objc_msgSend_pathForFactor_isDirectory_(v44, v45, @"AppVectors", 0);

      v46 = [APOdmlAppVectorsFile alloc];
      v49 = objc_msgSend_version(self, v47, v48);
      uint64_t v51 = objc_msgSend_initForReadingContentsOfURL_version_(v46, v50, (uint64_t)v20, v49);

      if (!v51)
      {
        v114 = OdmlLogForCategory(3uLL);
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          v115 = objc_opt_class();
          id v116 = v115;
          v119 = objc_msgSend_creationTime(self, v117, v118);
          *(_DWORD *)buf = 138412546;
          *(void *)v150 = v115;
          *(_WORD *)&v150[8] = 2112;
          *(void *)&v150[10] = v119;
          _os_log_impl(&dword_1BBC44000, v114, OS_LOG_TYPE_ERROR, "[%@ %@] ERROR: Could not open default app vectors file.", buf, 0x16u);
        }
        v121 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v120, @"APOdmlFeatureCalculatorErrorDomain", 1001, 0);
        v123 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E4F1C9E8], v122, (uint64_t)v8, @"featureName");
        BOOL v126 = objc_msgSend_assetManagerType(self, v124, v125) == 1;
        objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v127, (uint64_t)v121, v123, v126);
        id v34 = v121;

        goto LABEL_38;
      }

      v20 = (void *)v51;
    }
    id v147 = v6;
    if (v147)
    {
      unint64_t v143 = a4;
      uint64_t v144 = (uint64_t)v8;
      v52 = v20;
      id v145 = v6;
      v53 = 0;
      int v54 = -1;
      for (unsigned int i = 1; ; ++i)
      {
        v56 = (void *)MEMORY[0x1C1864650]();
        uint64_t v59 = objc_msgSend_task(self, v57, v58);
        if (v59)
        {
          v62 = (void *)v59;
          int shouldDefer = objc_msgSend_shouldDefer(self->_task, v60, v61);

          if (shouldDefer)
          {
            if (objc_msgSend_deferTask(self->_task, v60, v61)) {
              break;
            }
          }
        }
        v64 = objc_msgSend_nextVector(v20, v60, v61);

        if (!v64)
        {
          id v148 = 0;
          v53 = objc_msgSend_retrieveVector_(v147, v70, (uint64_t)&v148);
          id v71 = v148;
          v72 = OdmlLogForCategory(3uLL);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            v73 = objc_opt_class();
            v74 = NSString;
            id v146 = v73;
            uint64_t v77 = objc_msgSend_assetManagerType(self, v75, v76);
            v79 = objc_msgSend_descriptionForAssetManagerType_(v74, v78, v77);
            v80 = NSString;
            uint64_t v83 = objc_msgSend_placementType(self, v81, v82);
            v85 = objc_msgSend_descriptionForPlacementType_(v80, v84, v83);
            v87 = objc_msgSend_descriptionForVectorBuilderType_(NSString, v86, v143);
            v90 = objc_msgSend_arrayOfNumbers(v53, v88, v89);
            *(_DWORD *)buf = 138413314;
            *(void *)v150 = v73;
            *(_WORD *)&v150[8] = 2112;
            *(void *)&v150[10] = v79;
            __int16 v151 = 2112;
            v152 = v85;
            __int16 v153 = 2112;
            v154 = v87;
            __int16 v155 = 2112;
            v156 = v90;
            _os_log_impl(&dword_1BBC44000, v72, OS_LOG_TYPE_DEFAULT, "[%@] Final %@ %@ %@: %@", buf, 0x34u);
          }
          id v8 = (void *)v144;
          v92 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E4F1C9E8], v91, v144, @"featureName");
          BOOL v96 = objc_msgSend_assetManagerType(self, v93, v94) == 1;
          if (v71)
          {
            objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v95, (uint64_t)v71, v92, v96);
          }
          else
          {
            objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v95, 0, v92, v96);
            v112 = objc_msgSend_assetManager(self, v110, v111);
            objc_msgSend_saveFeatureFromObject_withName_(v112, v113, (uint64_t)v53, v144);
            id v71 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v6 = v145;
          v20 = v52;
          id v34 = v71;

          goto LABEL_37;
        }
        if (!(v54 + 100 * (i / 0x64)))
        {
          v66 = OdmlLogForCategory(3uLL);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v69 = objc_msgSend_adamID(v64, v67, v68);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v150 = i;
            *(_WORD *)&v150[4] = 2048;
            *(void *)&v150[6] = v69;
            _os_log_impl(&dword_1BBC44000, v66, OS_LOG_TYPE_DEFAULT, "Processing element %d: %llu", buf, 0x12u);
          }
        }
        objc_msgSend_addAppVector_(v147, v65, (uint64_t)v64);
        --v54;
        v53 = v64;
      }
      v128 = OdmlLogForCategory(3uLL);
      if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
      {
        v129 = objc_opt_class();
        id v130 = v129;
        v133 = objc_msgSend_creationTime(self, v131, v132);
        *(_DWORD *)buf = 138412546;
        *(void *)v150 = v129;
        *(_WORD *)&v150[8] = 2112;
        *(void *)&v150[10] = v133;
        _os_log_impl(&dword_1BBC44000, v128, OS_LOG_TYPE_DEFAULT, "[%@ %@] We are no longer in an acceptable state to continue processing. Deferring task...", buf, 0x16u);
      }
      v135 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v134, @"APOdmlFeatureCalculatorErrorDomain", 1003, 0);
      v137 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E4F1C9E8], v136, (uint64_t)v8, @"featureName");
      BOOL v140 = objc_msgSend_assetManagerType(self, v138, v139) == 1;
      objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v141, (uint64_t)v135, v137, v140);
      id v34 = v135;

      id v6 = v145;
    }
    else
    {
      v97 = OdmlLogForCategory(3uLL);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        v98 = objc_opt_class();
        id v99 = v98;
        v102 = objc_msgSend_creationTime(self, v100, v101);
        *(_DWORD *)buf = 138412546;
        *(void *)v150 = v98;
        *(_WORD *)&v150[8] = 2112;
        *(void *)&v150[10] = v102;
        _os_log_impl(&dword_1BBC44000, v97, OS_LOG_TYPE_ERROR, "[%@ %@] ERROR: Unable to create a vector builder.", buf, 0x16u);
      }
      v104 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v103, @"APOdmlFeatureCalculatorErrorDomain", 1002, 0);
      v53 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E4F1C9E8], v105, (uint64_t)v8, @"featureName");
      BOOL v108 = objc_msgSend_assetManagerType(self, v106, v107) == 1;
      objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v109, (uint64_t)v104, v53, v108);
      id v34 = v104;
    }
LABEL_37:
  }
  else
  {
    v21 = OdmlLogForCategory(3uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = objc_opt_class();
      id v23 = v22;
      uint64_t v26 = objc_msgSend_creationTime(self, v24, v25);
      *(_DWORD *)buf = 138412546;
      *(void *)v150 = v22;
      *(_WORD *)&v150[8] = 2112;
      *(void *)&v150[10] = v26;
      _os_log_impl(&dword_1BBC44000, v21, OS_LOG_TYPE_ERROR, "[%@ %@] ERROR: Could not open app vectors file.", buf, 0x16u);
    }
    uint64_t v28 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v27, @"APOdmlFeatureCalculatorErrorDomain", 1001, 0);
    v20 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E4F1C9E8], v29, (uint64_t)v8, @"featureName");
    BOOL v32 = objc_msgSend_assetManagerType(self, v30, v31) == 1;
    objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v33, (uint64_t)v28, v20, v32);
    id v34 = v28;
  }
LABEL_38:

  return v34;
}

- (id)_vectorKeyForType:(unint64_t)a3
{
  v3 = (id *)kAPOdmlFeatureTypeInstalledAppVectorKey;
  v4 = kAPOdmlFeatureTypeAppDownloadVectorKey;
  if (a3 != 1) {
    v4 = kAPOdmlFeatureTypeAppUsageVectorKey;
  }
  if (a3 != 2) {
    v3 = (id *)v4;
  }
  return *v3;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSURL)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
}

- (unint64_t)assetManagerType
{
  return self->_assetManagerType;
}

- (unint64_t)placementType
{
  return self->_placementType;
}

- (APOdmlXpcLifecycleHandler)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (NSDate)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(id)a3
{
}

- (APOdmlAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_creationTime, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

@end