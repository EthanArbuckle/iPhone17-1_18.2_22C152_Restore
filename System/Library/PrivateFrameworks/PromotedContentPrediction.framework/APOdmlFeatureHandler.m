@interface APOdmlFeatureHandler
- (APOdmlAssetManager)assetManager;
- (APOdmlFeatureHandler)initWithResponses:(id)a3 assetManager:(id)a4 model:(id)a5;
- (BOOL)isTwoDimensional;
- (BOOL)isTwoDimensional:(id)a3;
- (MLArrayBatchProvider)batchInput;
- (MLFeatureValue)appDownloadVector;
- (MLFeatureValue)appUsageVector;
- (MLFeatureValue)installedAppVector;
- (MLFeatureValue)userQueryVector;
- (id)_translateFeaturesToTwoDimensional:(id)a3;
- (id)adSpecificFeatures:(id)a3;
- (id)computeUserQueryVectorWithResponses:(id)a3;
- (id)featuresForResponse:(id)a3 adSpecificFeatures:(id)a4;
- (void)addOnDeviceFeaturesToDictionary:(id)a3;
- (void)fetchOnDeviceFeatures;
- (void)saveFeaturesFromResponse:(id)a3;
- (void)saveUserQueryVector;
- (void)setAppDownloadVector:(id)a3;
- (void)setAppUsageVector:(id)a3;
- (void)setInstalledAppVector:(id)a3;
- (void)setUserQueryVector:(id)a3;
@end

@implementation APOdmlFeatureHandler

- (APOdmlFeatureHandler)initWithResponses:(id)a3 assetManager:(id)a4 model:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v82.receiver = self;
  v82.super_class = (Class)APOdmlFeatureHandler;
  v11 = [(APOdmlFeatureHandler *)&v82 init];
  v12 = v11;
  if (v11)
  {
    id v67 = v9;
    objc_storeStrong((id *)&v11->_assetManager, a4);
    id v65 = v10;
    v12->_isTwoDimensional = objc_msgSend_isTwoDimensional_(v12, v13, (uint64_t)v10);
    objc_msgSend_fetchOnDeviceFeatures(v12, v14, v15);
    v17 = objc_msgSend_valueForKey_(v8, v16, @"odmlResponse");
    v19 = objc_msgSend_computeUserQueryVectorWithResponses_(v12, v18, (uint64_t)v17);
    objc_msgSend_setUserQueryVector_(v12, v20, (uint64_t)v19);

    v21 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1BBC5F254;
    block[3] = &unk_1E624A800;
    v66 = v12;
    v22 = v12;
    v81 = v22;
    dispatch_async(v21, block);

    uint64_t v24 = objc_msgSend_valueForKey_(v8, v23, @"adamID");
    v27 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26);
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v68 = v8;
    id v28 = v8;
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v76, v83, 16);
    if (v30)
    {
      uint64_t v32 = v30;
      uint64_t v33 = *(void *)v77;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v77 != v33) {
            objc_enumerationMutation(v28);
          }
          v35 = objc_msgSend_adSpecificFeatures_(v22, v31, *(void *)(*((void *)&v76 + 1) + 8 * v34));
          objc_msgSend_addObject_(v27, v36, (uint64_t)v35);

          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v76, v83, 16);
      }
      while (v32);
    }

    v37 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v40 = objc_msgSend_count(v17, v38, v39);
    v42 = objc_msgSend_arrayWithCapacity_(v37, v41, v40);
    v69 = (void *)v24;
    if (objc_msgSend_count(v17, v43, v44))
    {
      unint64_t v46 = 0;
      do
      {
        v47 = objc_msgSend_objectAtIndexedSubscript_(v17, v45, v46);
        v49 = objc_msgSend_objectAtIndexedSubscript_(v27, v48, v46);
        v51 = objc_msgSend_featuresForResponse_adSpecificFeatures_(v22, v50, (uint64_t)v47, v49);

        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = sub_1BBC5F25C;
        v70[3] = &unk_1E624A9B0;
        id v71 = v51;
        id v72 = v69;
        unint64_t v75 = v46;
        v73 = v22;
        id v52 = v17;
        id v74 = v52;
        id v53 = v51;
        dispatch_async(v21, v70);

        objc_msgSend_addObject_(v42, v54, (uint64_t)v53);
        ++v46;
      }
      while (v46 < objc_msgSend_count(v52, v55, v56));
    }
    v57 = objc_alloc_init(APOdmlFeatureValidator);
    id v10 = v65;
    v59 = objc_msgSend_validateFeatures_predictionModel_(v57, v58, (uint64_t)v42, v65);
    id v60 = objc_alloc(MEMORY[0x1E4F1E910]);
    uint64_t v62 = objc_msgSend_initWithFeatureProviderArray_(v60, v61, (uint64_t)v59);
    batchInput = v22->_batchInput;
    v22->_batchInput = (MLArrayBatchProvider *)v62;

    id v9 = v67;
    id v8 = v68;
    v12 = v66;
  }

  return v12;
}

- (id)adSpecificFeatures:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v6 = (const void *)objc_msgSend_UTF8String(@"DupeFirstOrganic", v4, v5);
  v7 = objc_getAssociatedObject(v3, v6);
  id v10 = (const void *)objc_msgSend_UTF8String(@"Installed", v8, v9);
  v11 = objc_getAssociatedObject(v3, v10);
  v16 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13);
  if (v7)
  {
    v17 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend_adamID(v3, v18, v19);
      int v23 = objc_msgSend_BOOLValue(v7, v21, v22);
      uint64_t v24 = @" not ";
      if (v23) {
        uint64_t v24 = @" ";
      }
      int v41 = 138412546;
      v42 = v20;
      __int16 v43 = 2112;
      uint64_t v44 = v24;
      _os_log_impl(&dword_1BBC44000, v17, OS_LOG_TYPE_ERROR, "Ad %@ is%@dupe.", (uint8_t *)&v41, 0x16u);
    }
    uint64_t v26 = objc_msgSend_featureValueOfTypeDouble_(MEMORY[0x1E4F1E950], v25, (uint64_t)v7);
    objc_msgSend_setValue_forKey_(v16, v27, (uint64_t)v26, @"DupeFirstOrganic");
  }
  if (v11)
  {
    id v28 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend_adamID(v3, v29, v30);
      int v34 = objc_msgSend_BOOLValue(v11, v32, v33);
      v35 = @" not ";
      if (v34) {
        v35 = @" ";
      }
      int v41 = 138412546;
      v42 = v31;
      __int16 v43 = 2112;
      uint64_t v44 = v35;
      _os_log_impl(&dword_1BBC44000, v28, OS_LOG_TYPE_ERROR, "Ad %@ is%@installed.", (uint8_t *)&v41, 0x16u);
    }
    v37 = objc_msgSend_featureValueOfTypeDouble_(MEMORY[0x1E4F1E950], v36, (uint64_t)v11);
    objc_msgSend_setValue_forKey_(v16, v38, (uint64_t)v37, @"Installed");
  }
  uint64_t v39 = objc_msgSend_copy(v16, v14, v15);

  return v39;
}

- (id)featuresForResponse:(id)a3 adSpecificFeatures:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  int isTwoDimensional = objc_msgSend_isTwoDimensional(self, v8, v9);
  uint64_t v13 = objc_msgSend_featureValues(v7, v11, v12);

  if (isTwoDimensional)
  {
    v16 = objc_msgSend__translateFeaturesToTwoDimensional_(self, v14, (uint64_t)v13);
    uint64_t v19 = objc_msgSend_mutableCopy(v16, v17, v18);
  }
  else
  {
    uint64_t v19 = objc_msgSend_mutableCopy(v13, v14, v15);
  }

  objc_msgSend_addOnDeviceFeaturesToDictionary_(self, v20, (uint64_t)v19);
  if (objc_msgSend_isTwoDimensional(self, v21, v22))
  {
    uint64_t v24 = objc_msgSend__translateFeaturesToTwoDimensional_(self, v23, (uint64_t)v6);
    v27 = objc_msgSend_mutableCopy(v24, v25, v26);

    objc_msgSend_addEntriesFromDictionary_(v19, v28, (uint64_t)v27);
  }
  else
  {
    objc_msgSend_addEntriesFromDictionary_(v19, v23, (uint64_t)v6);
  }
  id v29 = objc_alloc(MEMORY[0x1E4F1E930]);
  uint64_t v32 = objc_msgSend_copy(v19, v30, v31);
  id v40 = 0;
  int v34 = objc_msgSend_initWithDictionary_error_(v29, v33, (uint64_t)v32, &v40);
  id v35 = v40;

  if (!v34 || v35)
  {
    v36 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v42 = v37;
      __int16 v43 = 2112;
      id v44 = v35;
      id v38 = v37;
      _os_log_impl(&dword_1BBC44000, v36, OS_LOG_TYPE_ERROR, "[%@] Error constructing FeatureProvider from ODMLResponseV2: %@", buf, 0x16u);
    }
  }

  return v34;
}

- (id)computeUserQueryVectorWithResponses:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v86 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v87, v91, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v88 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = objc_msgSend_featureValues(*(void **)(*((void *)&v87 + 1) + 8 * i), v8, v9);
        uint64_t v15 = objc_msgSend_objectForKey_(v13, v14, @"queryVector");

        v16 = [APOdmlVector alloc];
        v17 = NSString;
        v20 = objc_msgSend_assetManager(self, v18, v19);
        uint64_t v23 = objc_msgSend_odmlVersion(v20, v21, v22);
        v25 = objc_msgSend_stringWithFormat_(v17, v24, @"%d", v23);
        id v28 = objc_msgSend_multiArrayValue(v15, v26, v27);
        uint64_t v31 = objc_msgSend_arrayFromMultiarray(v28, v29, v30);
        uint64_t v33 = objc_msgSend_initWithVersion_andArray_(v16, v32, (uint64_t)v25, v31);

        objc_msgSend_addObject_(v86, v34, (uint64_t)v33);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v87, v91, 16);
    }
    while (v10);
  }

  id v35 = (void *)MEMORY[0x1E4F1CA48];
  id v38 = objc_msgSend_assetManager(self, v36, v37);
  id v40 = objc_msgSend_featuresForName_(v38, v39, @"queryVector");
  v42 = objc_msgSend_arrayWithArray_(v35, v41, (uint64_t)v40);

  if (!v42 || !objc_msgSend_count(v42, v43, v44))
  {
    uint64_t v45 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v43, @"APOdmlPredictionErrorDomain", 4008, 0);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v46, (uint64_t)v45, 0);
  }
  v47 = objc_msgSend_arrayByAddingObjectsFromArray_(v42, v43, (uint64_t)v86);
  if (objc_msgSend_count(v47, v48, v49))
  {
    v51 = objc_msgSend_objectAtIndexedSubscript_(v47, v50, 0);
    if ((unint64_t)objc_msgSend_count(v47, v52, v53) < 2
      || (unint64_t)objc_msgSend_count(v47, v54, v55) < 2)
    {
      v59 = v51;
    }
    else
    {
      unint64_t v56 = 1;
      do
      {
        v57 = objc_msgSend_objectAtIndexedSubscript_(v47, v54, v56);
        v59 = objc_msgSend_vectorAdd_(v51, v58, (uint64_t)v57);

        ++v56;
        v51 = v59;
      }
      while (v56 < objc_msgSend_count(v47, v60, v61));
    }
    objc_msgSend_magnitude(v59, v54, v55);
    *(float *)&double v63 = 1.0 / v62;
    v66 = objc_msgSend_scalarMultiply_(v59, v64, v65, v63);
    char isTwoDimensional = objc_msgSend_isTwoDimensional(self, v67, v68);
    v70 = (void *)MEMORY[0x1E4F1E9A8];
    id v74 = objc_msgSend_arrayOfNumbers(v66, v71, v72);
    if (isTwoDimensional) {
      objc_msgSend_twoDimensionalMultiarrayFromArray_(v70, v73, (uint64_t)v74);
    }
    else {
    long long v77 = objc_msgSend_multiarrayFromArray_(v70, v73, (uint64_t)v74);
    }

    if (objc_msgSend_count(v77, v78, v79) < 1)
    {
      v81 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v80, @"APOdmlPredictionErrorDomain", 4009, 0);
      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v82, (uint64_t)v81, 0);

      long long v76 = 0;
    }
    else
    {
      long long v76 = objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E4F1E950], v80, (uint64_t)v77);
    }
  }
  else
  {
    v59 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v50, @"APOdmlPredictionErrorDomain", 4009, 0);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v75, (uint64_t)v59, 0);
    long long v76 = 0;
  }

  return v76;
}

- (void)fetchOnDeviceFeatures
{
  v4 = objc_msgSend_assetManager(self, a2, v2);
  objc_msgSend_featureForName_(v4, v5, @"appUsageVector");
  id v56 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = objc_msgSend_assetManager(self, v6, v7);
  uint64_t v10 = objc_msgSend_featureForName_(v8, v9, @"appDownloadVector");

  uint64_t v13 = objc_msgSend_assetManager(self, v11, v12);
  uint64_t v15 = objc_msgSend_featureForName_(v13, v14, @"installedAppVector");

  char isTwoDimensional = objc_msgSend_isTwoDimensional(self, v16, v17);
  uint64_t v19 = (void *)MEMORY[0x1E4F1E9A8];
  uint64_t v23 = objc_msgSend_arrayOfNumbers(v56, v20, v21);
  if (isTwoDimensional) {
    objc_msgSend_twoDimensionalMultiarrayFromArray_(v19, v22, (uint64_t)v23);
  }
  else {
  uint64_t v24 = objc_msgSend_multiarrayFromArray_(v19, v22, (uint64_t)v23);
  }

  char v27 = objc_msgSend_isTwoDimensional(self, v25, v26);
  id v28 = (void *)MEMORY[0x1E4F1E9A8];
  uint64_t v32 = objc_msgSend_arrayOfNumbers(v10, v29, v30);
  if (v27) {
    objc_msgSend_twoDimensionalMultiarrayFromArray_(v28, v31, (uint64_t)v32);
  }
  else {
  uint64_t v33 = objc_msgSend_multiarrayFromArray_(v28, v31, (uint64_t)v32);
  }

  char v36 = objc_msgSend_isTwoDimensional(self, v34, v35);
  uint64_t v37 = (void *)MEMORY[0x1E4F1E9A8];
  int v41 = objc_msgSend_arrayOfNumbers(v15, v38, v39);
  if (v36) {
    objc_msgSend_twoDimensionalMultiarrayFromArray_(v37, v40, (uint64_t)v41);
  }
  else {
  v42 = objc_msgSend_multiarrayFromArray_(v37, v40, (uint64_t)v41);
  }

  if (objc_msgSend_count(v24, v43, v44))
  {
    v47 = objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E4F1E950], v45, (uint64_t)v24);
    objc_msgSend_setAppUsageVector_(self, v48, (uint64_t)v47);
  }
  if (objc_msgSend_count(v33, v45, v46))
  {
    v51 = objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E4F1E950], v49, (uint64_t)v33);
    objc_msgSend_setAppDownloadVector_(self, v52, (uint64_t)v51);
  }
  if (objc_msgSend_count(v42, v49, v50))
  {
    v54 = objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E4F1E950], v53, (uint64_t)v42);
    objc_msgSend_setInstalledAppVector_(self, v55, (uint64_t)v54);
  }
}

- (void)addOnDeviceFeaturesToDictionary:(id)a3
{
  id v48 = a3;
  if (objc_msgSend_isTwoDimensional(self, v4, v5))
  {
    id v8 = objc_msgSend_copy(v48, v6, v7);
    uint64_t v10 = objc_msgSend__translateFeaturesToTwoDimensional_(self, v9, (uint64_t)v8);
    uint64_t v13 = objc_msgSend_mutableCopy(v10, v11, v12);
    objc_msgSend_addEntriesFromDictionary_(v48, v14, (uint64_t)v13);
  }
  uint64_t v15 = objc_msgSend_appUsageVector(self, v6, v7);

  if (v15)
  {
    uint64_t v18 = objc_msgSend_appUsageVector(self, v16, v17);
    objc_msgSend_setValue_forKey_(v48, v19, (uint64_t)v18, @"appUsageVector");

    uint64_t v22 = objc_msgSend_appUsageVector(self, v20, v21);
    objc_msgSend_setValue_forKey_(v48, v23, (uint64_t)v22, @"AppUsageVector");
  }
  uint64_t v24 = objc_msgSend_appDownloadVector(self, v16, v17);

  if (v24)
  {
    char v27 = objc_msgSend_appDownloadVector(self, v25, v26);
    objc_msgSend_setValue_forKey_(v48, v28, (uint64_t)v27, @"appDownloadVector");

    uint64_t v31 = objc_msgSend_appDownloadVector(self, v29, v30);
    objc_msgSend_setValue_forKey_(v48, v32, (uint64_t)v31, @"AppDownloadVector");
  }
  uint64_t v33 = objc_msgSend_installedAppVector(self, v25, v26);

  if (v33)
  {
    char v36 = objc_msgSend_installedAppVector(self, v34, v35);
    objc_msgSend_setValue_forKey_(v48, v37, (uint64_t)v36, @"installedAppVector");

    id v40 = objc_msgSend_installedAppVector(self, v38, v39);
    objc_msgSend_setValue_forKey_(v48, v41, (uint64_t)v40, @"AppInstalledVector");
  }
  v42 = objc_msgSend_userQueryVector(self, v34, v35);

  uint64_t v45 = v48;
  if (v42)
  {
    uint64_t v46 = objc_msgSend_userQueryVector(self, v43, v44);
    objc_msgSend_setValue_forKey_(v48, v47, (uint64_t)v46, @"userQueryVector");

    uint64_t v45 = v48;
  }
}

- (BOOL)isTwoDimensional:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend_modelDescription(a3, a2, (uint64_t)a3);
  id v6 = objc_msgSend_inputDescriptionsByName(v3, v4, v5);
  uint64_t v9 = objc_msgSend_allValues(v6, v7, v8);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v9;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v25, v29, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = objc_msgSend_multiArrayConstraint(*(void **)(*((void *)&v25 + 1) + 8 * i), v12, v13, (void)v25);
        v20 = objc_msgSend_shape(v17, v18, v19);
        unint64_t v23 = objc_msgSend_count(v20, v21, v22);

        if (v23 > 1)
        {
          LOBYTE(v14) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v25, v29, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v14;
}

- (id)_translateFeaturesToTwoDimensional:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v6 = objc_msgSend_mutableCopy(v3, v4, v5);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v35, v39, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v6, v9, v13);
        if (objc_msgSend_type(v14, v15, v16) == 5)
        {
          uint64_t v19 = (void *)MEMORY[0x1E4F1E950];
          v20 = (void *)MEMORY[0x1E4F1E9A8];
          uint64_t v21 = objc_msgSend_multiArrayValue(v14, v17, v18);
          uint64_t v24 = objc_msgSend_arrayFromMultiarray(v21, v22, v23);
          long long v26 = objc_msgSend_twoDimensionalMultiarrayFromArray_(v20, v25, (uint64_t)v24);
          long long v28 = objc_msgSend_featureValueWithMultiArray_(v19, v27, (uint64_t)v26);

          objc_msgSend_setObject_forKeyedSubscript_(v6, v29, (uint64_t)v28, v13);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v35, v39, 16);
    }
    while (v10);
  }

  uint64_t v32 = objc_msgSend_copy(v6, v30, v31);

  return v32;
}

- (void)saveFeaturesFromResponse:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v41 = a3;
  objc_msgSend_featureValues(v41, v4, v5);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v42, v46, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v40 = *(void *)v43;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v42 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend_featureValues(v41, v8, v9);
        uint64_t v15 = objc_msgSend_valueForKey_(v13, v14, v12);

        uint64_t v16 = [APOdmlVector alloc];
        uint64_t v17 = NSString;
        v20 = objc_msgSend_assetManager(self, v18, v19);
        uint64_t v23 = objc_msgSend_odmlVersion(v20, v21, v22);
        long long v25 = objc_msgSend_stringWithFormat_(v17, v24, @"%d", v23);
        long long v28 = objc_msgSend_multiArrayValue(v15, v26, v27);
        uint64_t v31 = objc_msgSend_arrayFromMultiarray(v28, v29, v30);
        uint64_t v33 = objc_msgSend_initWithVersion_andArray_(v16, v32, (uint64_t)v25, v31);

        long long v36 = objc_msgSend_assetManager(self, v34, v35);
        id v38 = (id)objc_msgSend_saveFeatureFromObject_withName_(v36, v37, (uint64_t)v33, v12);

        ++v11;
      }
      while (v10 != v11);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v42, v46, 16);
    }
    while (v10);
  }
}

- (void)saveUserQueryVector
{
  v4 = objc_msgSend_userQueryVector(self, a2, v2);

  if (v4)
  {
    uint64_t v5 = [APOdmlVector alloc];
    id v6 = NSString;
    uint64_t v9 = objc_msgSend_assetManager(self, v7, v8);
    uint64_t v12 = objc_msgSend_odmlVersion(v9, v10, v11);
    uint64_t v14 = objc_msgSend_stringWithFormat_(v6, v13, @"%d", v12);
    uint64_t v17 = objc_msgSend_userQueryVector(self, v15, v16);
    v20 = objc_msgSend_multiArrayValue(v17, v18, v19);
    uint64_t v23 = objc_msgSend_arrayFromMultiarray(v20, v21, v22);
    id v30 = (id)objc_msgSend_initWithVersion_andArray_(v5, v24, (uint64_t)v14, v23);

    uint64_t v27 = objc_msgSend_assetManager(self, v25, v26);
    id v29 = (id)objc_msgSend_saveFeatureFromObject_withName_(v27, v28, (uint64_t)v30, @"userQueryVector");
  }
}

- (MLArrayBatchProvider)batchInput
{
  return self->_batchInput;
}

- (APOdmlAssetManager)assetManager
{
  return self->_assetManager;
}

- (BOOL)isTwoDimensional
{
  return self->_isTwoDimensional;
}

- (MLFeatureValue)appUsageVector
{
  return self->_appUsageVector;
}

- (void)setAppUsageVector:(id)a3
{
}

- (MLFeatureValue)appDownloadVector
{
  return self->_appDownloadVector;
}

- (void)setAppDownloadVector:(id)a3
{
}

- (MLFeatureValue)installedAppVector
{
  return self->_installedAppVector;
}

- (void)setInstalledAppVector:(id)a3
{
}

- (MLFeatureValue)userQueryVector
{
  return self->_userQueryVector;
}

- (void)setUserQueryVector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userQueryVector, 0);
  objc_storeStrong((id *)&self->_installedAppVector, 0);
  objc_storeStrong((id *)&self->_appDownloadVector, 0);
  objc_storeStrong((id *)&self->_appUsageVector, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);

  objc_storeStrong((id *)&self->_batchInput, 0);
}

@end