@interface APOdmlTrainingRow
- (APOdmlTrainingRow)initWithFeatures:(id)a3;
- (BOOL)isValidFeature:(id)a3 featureName:(id)a4 min:(id)a5 max:(id)a6 sentinelValues:(id)a7;
- (BOOL)isValidRow:(id)a3;
- (NSDictionary)features;
- (NSSet)featureNames;
- (NSString)rowID;
- (id)featureValueForName:(id)a3;
- (void)reportError:(int64_t)a3 name:(id)a4 value:(id)a5;
- (void)setRowID:(id)a3;
@end

@implementation APOdmlTrainingRow

- (APOdmlTrainingRow)initWithFeatures:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APOdmlTrainingRow;
  v6 = [(APOdmlTrainingRow *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_features, a3);
  }

  return v7;
}

- (BOOL)isValidRow:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  objc_msgSend_features(self, v5, v6);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v28, v32, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v27 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v13 = objc_msgSend_rangeBoundaryForFeature_upperBound_(v4, v9, v12, 0);
        v15 = objc_msgSend_rangeBoundaryForFeature_upperBound_(v4, v14, v12, 1);
        v17 = objc_msgSend_sentinelValuesForFeature_(v4, v16, v12);
        v20 = objc_msgSend_features(self, v18, v19);
        v22 = objc_msgSend_objectForKey_(v20, v21, v12);
        LODWORD(v12) = objc_msgSend_isValidFeature_featureName_min_max_sentinelValues_(self, v23, (uint64_t)v22, v12, v13, v15, v17);

        if (!v12)
        {
          BOOL v24 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v28, v32, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v24 = 1;
LABEL_11:

  return v24;
}

- (BOOL)isValidFeature:(id)a3 featureName:(id)a4 min:(id)a5 max:(id)a6 sentinelValues:(id)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v17 = v12;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v63, v68, 16);
  if (!v19)
  {
    LOBYTE(v25) = 1;
    goto LABEL_24;
  }
  uint64_t v22 = v19;
  v56 = self;
  id v57 = v13;
  uint64_t v23 = *(void *)v64;
  id v58 = v15;
  uint64_t v54 = *(void *)v64;
  while (2)
  {
    uint64_t v24 = 0;
    uint64_t v55 = v22;
    do
    {
      if (*(void *)v64 != v23) {
        objc_enumerationMutation(v17);
      }
      v25 = *(void **)(*((void *)&v63 + 1) + 8 * v24);
      if (!v25)
      {
        id v13 = v57;
        objc_msgSend_reportError_name_value_(v56, v20, 8044, v57, 0);
        goto LABEL_24;
      }
      if (v14)
      {
        objc_msgSend_floatValue(*(void **)(*((void *)&v63 + 1) + 8 * v24), v20, v21);
        float v27 = v26;
        objc_msgSend_floatValue(v14, v28, v29);
        if (v27 < v30)
        {
          v53 = &kAPODMLDESPluginFeatureMinExceeded;
LABEL_28:
          id v13 = v57;
          objc_msgSend_reportError_name_value_(v56, v20, *v53, v57, v25);
          LOBYTE(v25) = 0;
          goto LABEL_24;
        }
      }
      if (v15)
      {
        objc_msgSend_floatValue(v25, v20, v21);
        float v32 = v31;
        objc_msgSend_floatValue(v15, v33, v34);
        if (v32 > v35)
        {
          v53 = &kAPODMLDESPluginFeatureMaxExceeded;
          goto LABEL_28;
        }
      }
      id v36 = v14;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v37 = v16;
      id v38 = v16;
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v59, v67, 16);
      if (v40)
      {
        uint64_t v43 = v40;
        uint64_t v44 = *(void *)v60;
        while (2)
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v60 != v44) {
              objc_enumerationMutation(v38);
            }
            v46 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            objc_msgSend_floatValue(v25, v41, v42);
            float v48 = v47;
            objc_msgSend_floatValue(v46, v49, v50);
            if (v48 == v51)
            {
              id v13 = v57;
              objc_msgSend_reportError_name_value_(v56, v41, 8044, v57, v25);

              LOBYTE(v25) = 0;
              id v14 = v36;
              id v15 = v58;
              id v16 = v37;
              goto LABEL_24;
            }
          }
          uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v59, v67, 16);
          if (v43) {
            continue;
          }
          break;
        }
      }

      ++v24;
      uint64_t v23 = v54;
      id v14 = v36;
      id v15 = v58;
      id v16 = v37;
    }
    while (v24 != v55);
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v63, v68, 16);
    LOBYTE(v25) = 1;
    id v13 = v57;
    if (v22) {
      continue;
    }
    break;
  }
LABEL_24:

  return (char)v25;
}

- (void)reportError:(int64_t)a3 name:(id)a4 value:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F28C58];
  id v8 = a5;
  id v9 = a4;
  objc_msgSend_errorWithDomain_code_userInfo_(v7, v10, @"APODMLDESPluginErrorDomain", a3, 0);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v11, v12);
  objc_msgSend_setValue_forKey_(v13, v14, (uint64_t)v9, @"featureName");

  objc_msgSend_setValue_forKey_(v13, v15, (uint64_t)v8, @"featureValue");
  v18 = objc_msgSend_copy(v13, v16, v17);
  objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v19, (uint64_t)v20, v18);
}

- (NSSet)featureNames
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = objc_msgSend_features(self, a2, v2);
  v7 = objc_msgSend_allKeys(v4, v5, v6);
  id v9 = objc_msgSend_setWithArray_(v3, v8, (uint64_t)v7);

  return (NSSet *)v9;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_features(self, v5, v6);
  id v9 = objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v4);

  uint64_t v12 = objc_msgSend_twoDimensionalMultiarrayFromArray_(MEMORY[0x1E4F1E9A8], v10, (uint64_t)v9);
  if (v12)
  {
    id v13 = objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E4F1E950], v11, (uint64_t)v12);
  }
  else
  {
    id v14 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_1BBC44000, v14, OS_LOG_TYPE_ERROR, "Failed to initialize feature value for %@", (uint8_t *)&v16, 0xCu);
    }

    id v13 = 0;
  }

  return v13;
}

- (NSDictionary)features
{
  return self->_features;
}

- (NSString)rowID
{
  return self->_rowID;
}

- (void)setRowID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowID, 0);

  objc_storeStrong((id *)&self->_features, 0);
}

@end