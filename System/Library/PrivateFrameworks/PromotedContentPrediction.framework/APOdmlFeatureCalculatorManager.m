@interface APOdmlFeatureCalculatorManager
- (APOdmlFeatureCalculatorManager)initWithActivity:(id)a3;
- (APOdmlXpcLifecycleHandler)lifeCycleHandler;
- (NSArray)assetManagerTypes;
- (NSArray)placementTypes;
- (NSMutableArray)calculatorErrors;
- (NSMutableArray)validFeatureCalculators;
- (NSOperationQueue)operationQueue;
- (OS_xpc_object)xpc_activity;
- (id)parseErrorInfo:(id)a3 calculator:(id)a4;
- (id)taskDeferred;
- (void)calculateAllFeatures:(id)a3;
- (void)iterateThroughCalculators:(id)a3;
- (void)runFeatureCalculator:(id)a3;
- (void)setAssetManagerTypes:(id)a3;
- (void)setCalculatorErrors:(id)a3;
- (void)setLifeCycleHandler:(id)a3;
- (void)setPlacementTypes:(id)a3;
- (void)setValidFeatureCalculators:(id)a3;
- (void)setXpc_activity:(id)a3;
@end

@implementation APOdmlFeatureCalculatorManager

- (APOdmlFeatureCalculatorManager)initWithActivity:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)APOdmlFeatureCalculatorManager;
  v6 = [(APOdmlFeatureCalculatorManager *)&v38 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpc_activity, a3);
    v8 = [APOdmlXpcLifecycleHandler alloc];
    uint64_t v10 = objc_msgSend_initWithActivity_(v8, v9, (uint64_t)v5);
    lifeCycleHandler = v7->_lifeCycleHandler;
    v7->_lifeCycleHandler = (APOdmlXpcLifecycleHandler *)v10;

    v12 = (void *)MEMORY[0x1E4F1C978];
    v14 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v13, 0);
    uint64_t v16 = objc_msgSend_arrayWithObjects_(v12, v15, (uint64_t)v14, 0);
    placementTypes = v7->_placementTypes;
    v7->_placementTypes = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1C978];
    v20 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v19, 0);
    v22 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v21, 1);
    uint64_t v24 = objc_msgSend_arrayWithObjects_(v18, v23, (uint64_t)v20, v22, 0);
    assetManagerTypes = v7->_assetManagerTypes;
    v7->_assetManagerTypes = (NSArray *)v24;

    uint64_t v28 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v26, v27);
    calculatorErrors = v7->_calculatorErrors;
    v7->_calculatorErrors = (NSMutableArray *)v28;

    uint64_t v32 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v30, v31);
    validFeatureCalculators = v7->_validFeatureCalculators;
    v7->_validFeatureCalculators = (NSMutableArray *)v32;

    v34 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v34;

    objc_msgSend_setMaxConcurrentOperationCount_(v7->_operationQueue, v36, 1);
  }

  return v7;
}

- (void)calculateAllFeatures:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  objc_msgSend_placementTypes(self, v4, v5);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v54, v59, 16);
  if (v46)
  {
    uint64_t v45 = *(void *)v55;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v55 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = v9;
        uint64_t v10 = *(void **)(*((void *)&v54 + 1) + 8 * v9);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        v11 = objc_msgSend_assetManagerTypes(self, v7, v8);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v50, v58, 16);
        if (v13)
        {
          uint64_t v16 = v13;
          uint64_t v17 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v51 != v17) {
                objc_enumerationMutation(v11);
              }
              v19 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              uint64_t v20 = objc_msgSend_unsignedIntegerValue(v10, v14, v15);
              uint64_t v23 = objc_msgSend_unsignedIntegerValue(v19, v21, v22);
              uint64_t v24 = [APOdmlFeatureCalculator alloc];
              uint64_t v27 = objc_msgSend_xpc_activity(self, v25, v26);
              v29 = objc_msgSend_initWithActivity_placementType_assetManagerType_(v24, v28, (uint64_t)v27, v20, v23);

              uint64_t v32 = objc_msgSend_validFeatureCalculators(self, v30, v31);
              objc_msgSend_addObject_(v32, v33, (uint64_t)v29);
            }
            uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v50, v58, 16);
          }
          while (v16);
        }

        uint64_t v9 = v47 + 1;
      }
      while (v47 + 1 != v46);
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v54, v59, 16);
    }
    while (v46);
  }

  objc_super v38 = objc_msgSend_taskDeferred(self, v34, v35);
  if (v38)
  {
    v39 = objc_msgSend_operationQueue(self, v36, v37);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = sub_1BBC64EA0;
    v48[3] = &unk_1E624A9F8;
    v40 = v43;
    id v49 = v43;
    objc_msgSend_addOperationWithBlock_(v39, v41, (uint64_t)v48);
  }
  else
  {
    v42 = self;
    v40 = v43;
    objc_msgSend_iterateThroughCalculators_(v42, v36, (uint64_t)v43);
  }
}

- (id)taskDeferred
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_lifeCycleHandler(self, a2, v2);
  int IsDeferred = objc_msgSend_taskIsDeferred(v4, v5, v6);

  if (IsDeferred)
  {
    uint64_t v10 = OdmlLogForCategory(3uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138477827;
      id v30 = (id)objc_opt_class();
      id v11 = v30;
      v12 = "[%{private}@] Device Knowledge task previously deferred. Bailing out...";
LABEL_8:
      uint64_t v24 = v10;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      _os_log_impl(&dword_1BBC44000, v24, v25, v12, (uint8_t *)&v29, 0xCu);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  uint64_t v13 = objc_msgSend_lifeCycleHandler(self, v8, v9);
  int shouldDefer = objc_msgSend_shouldDefer(v13, v14, v15);

  if (shouldDefer)
  {
    v19 = objc_msgSend_lifeCycleHandler(self, v17, v18);
    int v22 = objc_msgSend_deferTask(v19, v20, v21);

    uint64_t v23 = OdmlLogForCategory(3uLL);
    uint64_t v10 = v23;
    if (!v22)
    {
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      int v29 = 138477827;
      id v30 = (id)objc_opt_class();
      id v11 = v30;
      v12 = "[%{private}@] ERROR: failed to defer task while iterating through calculators.";
      uint64_t v24 = v10;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      goto LABEL_9;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138477827;
      id v30 = (id)objc_opt_class();
      id v11 = v30;
      v12 = "[%{private}@] Device Knowledge task has been deferred. Bailing out...";
      goto LABEL_8;
    }
LABEL_10:

    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v26, @"APOdmlFeatureCalculatorErrorDomain", 1003, 0);
    goto LABEL_12;
  }
  uint64_t v27 = 0;
LABEL_12:

  return v27;
}

- (void)iterateThroughCalculators:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_validFeatureCalculators(self, v5, v6);
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);

  if (!v10)
  {
    uint64_t v13 = OdmlLogForCategory(3uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v27 = (id)objc_opt_class();
      id v14 = v27;
      _os_log_impl(&dword_1BBC44000, v13, OS_LOG_TYPE_ERROR, "[%{private}@] No valid feature calculators found.", buf, 0xCu);
    }
    uint64_t v17 = objc_msgSend_operationQueue(self, v15, v16);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1BBC65298;
    v24[3] = &unk_1E624A9F8;
    id v25 = v4;
    objc_msgSend_addOperationWithBlock_(v17, v18, (uint64_t)v24);
  }
  v19 = objc_msgSend_validFeatureCalculators(self, v11, v12);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1BBC652B0;
  v22[3] = &unk_1E624AA70;
  v22[4] = self;
  id v23 = v4;
  id v20 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(v19, v21, (uint64_t)v22);
}

- (void)runFeatureCalculator:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = 0;
  *(void *)&long long v8 = 138478595;
  long long v77 = v8;
  unint64_t v9 = 0x1E4F28000uLL;
  do
  {
    uint64_t v10 = objc_msgSend_taskDeferred(self, v4, v5, v77);
    uint64_t v13 = v10;
    if (v10)
    {
      id v14 = objc_msgSend_userInfo(v10, v11, v12);
      uint64_t v17 = objc_msgSend_mutableCopy(v14, v15, v16);
      v19 = objc_msgSend_parseErrorInfo_calculator_(self, v18, (uint64_t)v17, v6);

      int v22 = objc_msgSend_calculatorErrors(self, v20, v21);
      id v23 = *(void **)(v9 + 3160);
      uint64_t v26 = objc_msgSend_domain(v13, v24, v25);
      uint64_t v29 = objc_msgSend_code(v13, v27, v28);
      uint64_t v31 = objc_msgSend_errorWithDomain_code_userInfo_(v23, v30, (uint64_t)v26, v29, v19);
      objc_msgSend_addObject_(v22, v32, (uint64_t)v31);
    }
    else
    {
      v19 = objc_msgSend_createAndSaveVector_(v6, v11, v7);
      v33 = OdmlLogForCategory(3uLL);
      v34 = v33;
      if (v19)
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = objc_opt_class();
          id v78 = v35;
          uint64_t v38 = objc_msgSend_placementType(v6, v36, v37);
          uint64_t v41 = objc_msgSend_assetManagerType(v6, v39, v40);
          v44 = objc_msgSend_debugDescription(v19, v42, v43);
          *(_DWORD *)buf = 138478851;
          v82 = v35;
          __int16 v83 = 2048;
          uint64_t v84 = v38;
          unint64_t v9 = 0x1E4F28000uLL;
          __int16 v85 = 2048;
          uint64_t v86 = v41;
          __int16 v87 = 2048;
          uint64_t v88 = v7;
          __int16 v89 = 2112;
          v90 = v44;
          _os_log_impl(&dword_1BBC44000, v34, OS_LOG_TYPE_ERROR, "[%{private}@] ERROR: failed to calculate features for placement type: %lu, asset manager type: %lu and vector type: %lu due to %@", buf, 0x34u);
        }
        uint64_t v47 = objc_msgSend_userInfo(v19, v45, v46);
        long long v50 = objc_msgSend_mutableCopy(v47, v48, v49);
        int v22 = objc_msgSend_parseErrorInfo_calculator_(self, v51, (uint64_t)v50, v6);

        long long v54 = objc_msgSend_calculatorErrors(self, v52, v53);
        long long v55 = *(void **)(v9 + 3160);
        v58 = objc_msgSend_domain(v19, v56, v57);
        uint64_t v61 = objc_msgSend_code(v19, v59, v60);
        v63 = objc_msgSend_errorWithDomain_code_userInfo_(v55, v62, (uint64_t)v58, v61, v22);
        objc_msgSend_addObject_(v54, v64, (uint64_t)v63);

        unint64_t v9 = 0x1E4F28000;
      }
      else
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v65 = objc_opt_class();
          id v66 = v65;
          uint64_t v69 = objc_msgSend_placementType(v6, v67, v68);
          uint64_t v72 = objc_msgSend_assetManagerType(v6, v70, v71);
          *(_DWORD *)buf = v77;
          v82 = v65;
          __int16 v83 = 2048;
          uint64_t v84 = v69;
          unint64_t v9 = 0x1E4F28000;
          __int16 v85 = 2048;
          uint64_t v86 = v72;
          __int16 v87 = 2048;
          uint64_t v88 = v7;
          _os_log_impl(&dword_1BBC44000, v34, OS_LOG_TYPE_DEFAULT, "[%{private}@] Successfully calculated features for placement type: %lu, asset manager type: %lu and vector type: %lu", buf, 0x2Au);
        }
        v75 = objc_msgSend_operationQueue(self, v73, v74);
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = sub_1BBC65A1C;
        v79[3] = &unk_1E624A800;
        id v80 = v6;
        objc_msgSend_addOperationWithBlock_(v75, v76, (uint64_t)v79);

        int v22 = v80;
      }
    }

    ++v7;
  }
  while (v7 != 3);
}

- (id)parseErrorInfo:(id)a3 calculator:(id)a4
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = NSNumber;
    id v8 = a4;
    uint64_t v11 = objc_msgSend_placementType(v8, v9, v10);
    uint64_t v13 = objc_msgSend_numberWithUnsignedLong_(v7, v12, v11);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"placementType");

    uint64_t v15 = NSNumber;
    uint64_t v18 = objc_msgSend_assetManagerType(v8, v16, v17);

    id v20 = objc_msgSend_numberWithUnsignedLong_(v15, v19, v18);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, @"assetManagerType");
  }
  else
  {
    int v22 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v23 = a4;
    id v24 = [v22 alloc];
    v40[0] = @"placementType";
    uint64_t v25 = NSNumber;
    uint64_t v28 = objc_msgSend_placementType(v23, v26, v27);
    id v20 = objc_msgSend_numberWithUnsignedLong_(v25, v29, v28);
    v41[0] = v20;
    v40[1] = @"assetManagerType";
    id v30 = NSNumber;
    uint64_t v33 = objc_msgSend_assetManagerType(v23, v31, v32);

    uint64_t v35 = objc_msgSend_numberWithUnsignedLong_(v30, v34, v33);
    v41[1] = v35;
    uint64_t v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v36, (uint64_t)v41, v40, 2);
    id v6 = objc_msgSend_initWithDictionary_(v24, v38, (uint64_t)v37);
  }

  return v6;
}

- (OS_xpc_object)xpc_activity
{
  return self->_xpc_activity;
}

- (void)setXpc_activity:(id)a3
{
}

- (APOdmlXpcLifecycleHandler)lifeCycleHandler
{
  return self->_lifeCycleHandler;
}

- (void)setLifeCycleHandler:(id)a3
{
}

- (NSArray)placementTypes
{
  return self->_placementTypes;
}

- (void)setPlacementTypes:(id)a3
{
}

- (NSArray)assetManagerTypes
{
  return self->_assetManagerTypes;
}

- (void)setAssetManagerTypes:(id)a3
{
}

- (NSMutableArray)calculatorErrors
{
  return self->_calculatorErrors;
}

- (void)setCalculatorErrors:(id)a3
{
}

- (NSMutableArray)validFeatureCalculators
{
  return self->_validFeatureCalculators;
}

- (void)setValidFeatureCalculators:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_validFeatureCalculators, 0);
  objc_storeStrong((id *)&self->_calculatorErrors, 0);
  objc_storeStrong((id *)&self->_assetManagerTypes, 0);
  objc_storeStrong((id *)&self->_placementTypes, 0);
  objc_storeStrong((id *)&self->_lifeCycleHandler, 0);

  objc_storeStrong((id *)&self->_xpc_activity, 0);
}

@end