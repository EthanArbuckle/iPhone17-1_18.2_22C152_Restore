@interface APOdmlFeatureValidator
- (id)imputeFeature:(id)a3;
- (id)imputeMissingFeatures:(id)a3;
- (id)missingFeatures:(id)a3 inputDescriptions:(id)a4;
- (id)validateFeatureProvider:(id)a3 inputDescriptions:(id)a4;
- (id)validateFeatures:(id)a3 predictionModel:(id)a4;
- (void)reportMissingFeatureError:(id)a3;
@end

@implementation APOdmlFeatureValidator

- (id)validateFeatures:(id)a3 predictionModel:(id)a4
{
  id v6 = a3;
  v9 = objc_msgSend_modelDescription(a4, v7, v8);
  v12 = objc_msgSend_inputDescriptionsByName(v9, v10, v11);
  v15 = objc_msgSend_allValues(v12, v13, v14);

  if (objc_msgSend_count(v6, v16, v17))
  {
    unint64_t v20 = 0;
    do
    {
      v21 = objc_msgSend_objectAtIndexedSubscript_(v6, v18, v20);
      v23 = objc_msgSend_validateFeatureProvider_inputDescriptions_(self, v22, (uint64_t)v21, v15);
      objc_msgSend_setObject_atIndexedSubscript_(v6, v24, (uint64_t)v23, v20);

      ++v20;
    }
    while (v20 < objc_msgSend_count(v6, v25, v26));
  }
  v27 = objc_msgSend_copy(v6, v18, v19);

  return v27;
}

- (id)validateFeatureProvider:(id)a3 inputDescriptions:(id)a4
{
  id v6 = a3;
  uint64_t v8 = objc_msgSend_missingFeatures_inputDescriptions_(self, v7, (uint64_t)v6, a4);
  objc_msgSend_reportMissingFeatureError_(self, v9, (uint64_t)v8);
  uint64_t v11 = objc_msgSend_imputeMissingFeatures_(self, v10, (uint64_t)v8);
  uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13);
  uint64_t v17 = objc_msgSend_dictionary(v6, v15, v16);

  objc_msgSend_addEntriesFromDictionary_(v14, v18, (uint64_t)v17);
  objc_msgSend_addEntriesFromDictionary_(v14, v19, (uint64_t)v11);
  id v20 = objc_alloc(MEMORY[0x1E4F1E930]);
  v23 = objc_msgSend_copy(v14, v21, v22);
  v25 = objc_msgSend_initWithDictionary_error_(v20, v24, (uint64_t)v23, 0);

  return v25;
}

- (id)missingFeatures:(id)a3 inputDescriptions:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v9 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v6;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v30, v34, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v10);
        }
        v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend_dictionary(v5, v13, v14, (void)v30);
        uint64_t v22 = objc_msgSend_name(v18, v20, v21);
        v24 = objc_msgSend_objectForKey_(v19, v23, (uint64_t)v22);

        if (!v24) {
          objc_msgSend_addObject_(v9, v25, (uint64_t)v18);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v30, v34, 16);
    }
    while (v15);
  }

  v28 = objc_msgSend_copy(v9, v26, v27);

  return v28;
}

- (id)imputeMissingFeatures:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v5, v6);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, v26, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_imputeFeature_(self, v11, (uint64_t)v15, (void)v22);
        uint64_t v19 = objc_msgSend_name(v15, v17, v18);
        objc_msgSend_setValue_forKey_(v7, v20, (uint64_t)v16, v19);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v22, v26, 16);
    }
    while (v12);
  }

  return v7;
}

- (id)imputeFeature:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v6 = objc_msgSend_multiArrayConstraint(v3, v4, v5);
  v9 = objc_msgSend_shape(v6, v7, v8);
  unint64_t v12 = objc_msgSend_count(v9, v10, v11);

  if (v12 < 3)
  {
    uint64_t v27 = objc_msgSend_multiArrayConstraint(v3, v13, v14);
    long long v30 = objc_msgSend_shape(v27, v28, v29);
    uint64_t v33 = objc_msgSend_count(v30, v31, v32) - 1;

    v36 = objc_msgSend_multiArrayConstraint(v3, v34, v35);
    v39 = objc_msgSend_shape(v36, v37, v38);
    v41 = objc_msgSend_objectAtIndexedSubscript_(v39, v40, v33);

    v44 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v42, v43);
    if ((int)objc_msgSend_intValue(v41, v45, v46) >= 1)
    {
      int v49 = 0;
      do
      {
        v50 = objc_msgSend_notANumber(MEMORY[0x1E4F28C28], v47, v48);
        objc_msgSend_addObject_(v44, v51, (uint64_t)v50);

        ++v49;
      }
      while (v49 < (int)objc_msgSend_intValue(v41, v52, v53));
    }
    v54 = objc_msgSend_multiArrayConstraint(v3, v47, v48);
    v57 = objc_msgSend_shape(v54, v55, v56);
    uint64_t v60 = objc_msgSend_count(v57, v58, v59);

    if (v60 == 1) {
      objc_msgSend_multiarrayFromArray_(MEMORY[0x1E4F1E9A8], v61, (uint64_t)v44);
    }
    else {
    uint64_t v26 = objc_msgSend_twoDimensionalMultiarrayFromArray_(MEMORY[0x1E4F1E9A8], v61, (uint64_t)v44);
    }
  }
  else
  {
    uint64_t v15 = OdmlLogForCategory(6uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = v16;
      id v20 = objc_msgSend_multiArrayConstraint(v3, v18, v19);
      long long v23 = objc_msgSend_shape(v20, v21, v22);
      int v63 = 138412546;
      v64 = v16;
      __int16 v65 = 2048;
      uint64_t v66 = objc_msgSend_count(v23, v24, v25);
      _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "[%@] Unexpected shape length: %lu", (uint8_t *)&v63, 0x16u);
    }
    uint64_t v26 = 0;
  }

  return v26;
}

- (void)reportMissingFeatureError:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a3;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v23, v27, 16);
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v5, @"APOdmlPredictionErrorDomain", 4004, 0);
        uint64_t v13 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v11, v12);
        uint64_t v16 = objc_msgSend_name(v9, v14, v15);
        objc_msgSend_setValue_forKey_(v13, v17, (uint64_t)v16, @"featureName");

        id v20 = objc_msgSend_copy(v13, v18, v19);
        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v21, (uint64_t)v10, v20);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v23, v27, 16);
    }
    while (v6);
  }
}

@end