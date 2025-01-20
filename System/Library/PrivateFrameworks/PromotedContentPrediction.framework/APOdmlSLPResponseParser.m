@interface APOdmlSLPResponseParser
+ (BOOL)isValidResponse:(id)a3;
+ (id)convertArrayToFeatureValue:(id)a3;
+ (id)convertStringToFeatureValue:(id)a3;
+ (id)convertToFeatureValue:(id)a3;
+ (id)parseFeature:(id)a3 withTopLevelKey:(id)a4 forKey:(id)a5;
+ (id)parseFeatureDictionaryForFeatureValues:(id)a3;
+ (id)parseResponseForFeatureValues:(id)a3;
@end

@implementation APOdmlSLPResponseParser

+ (BOOL)isValidResponse:(id)a3
{
  v3 = objc_msgSend_objectForKey_(a3, a2, @"odmlEnabled");

  return v3 != 0;
}

+ (id)parseResponseForFeatureValues:(id)a3
{
  v4 = objc_msgSend_objectForKey_(a3, a2, @"features");
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend_count(v4, v5, v6))
  {
    v8 = objc_msgSend_parseFeatureDictionaryForFeatureValues_(a1, v7, (uint64_t)v4);
    if (objc_msgSend_count(v8, v9, v10)) {
      id v11 = v8;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)parseFeatureDictionaryForFeatureValues:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v5, v6);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v8 = v4;
  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v45, v55, 16);
  if (v44)
  {
    uint64_t v10 = *(void *)v46;
    id v11 = @"value";
    v42 = v7;
    uint64_t v43 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1C1864650]();
        v16 = objc_msgSend_objectForKey_(v8, v15, v13);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v19 = objc_msgSend_objectForKey_(v8, v18, v13);
          v21 = objc_msgSend_parseFeature_withTopLevelKey_forKey_(a1, v20, (uint64_t)v19, v13, v11);

          objc_msgSend_addEntriesFromDictionary_(v7, v22, (uint64_t)v21);
        }
        else
        {
          v21 = OdmlLogForCategory(5uLL);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v23 = objc_opt_class();
            id v24 = v23;
            objc_msgSend_objectForKey_(v8, v25, v13);
            v26 = v11;
            id v27 = v8;
            v29 = id v28 = a1;
            *(_DWORD *)buf = 138412802;
            v50 = v23;
            __int16 v51 = 2112;
            v52 = v29;
            __int16 v53 = 2112;
            uint64_t v54 = v13;
            _os_log_impl(&dword_1BBC44000, v21, OS_LOG_TYPE_ERROR, "[%@] Failed to parse feature %@ with key %@", buf, 0x20u);

            a1 = v28;
            id v8 = v27;
            id v11 = v26;

            v7 = v42;
            uint64_t v10 = v43;
          }
        }
      }
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v30, (uint64_t)&v45, v55, 16);
    }
    while (v44);
  }

  v31 = OdmlLogForCategory(5uLL);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_opt_class();
    id v33 = v32;
    objc_msgSend_mlJSONString(v7, v34, v35);
    v37 = id v36 = v8;
    *(_DWORD *)buf = 138412546;
    v50 = v32;
    __int16 v51 = 2112;
    v52 = v37;
    _os_log_impl(&dword_1BBC44000, v31, OS_LOG_TYPE_DEFAULT, "[%@] Successfully parsed feature dictionary: %@", buf, 0x16u);

    id v8 = v36;
  }

  v40 = objc_msgSend_copy(v7, v38, v39);

  return v40;
}

+ (id)parseFeature:(id)a3 withTopLevelKey:(id)a4 forKey:(id)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v12 = objc_msgSend_objectForKey_(v8, v11, (uint64_t)v10);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v38 = v10;
    id v39 = v8;
    v14 = objc_msgSend_stringByAppendingString_(v9, v13, @"_");

    v17 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v15, v16);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v37 = v12;
    id v18 = v12;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v40, v44, 16);
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          v25 = (void *)MEMORY[0x1C1864650]();
          id v27 = objc_msgSend_stringByAppendingString_(v14, v26, v24);
          v29 = objc_msgSend_parseFeature_withTopLevelKey_forKey_(a1, v28, (uint64_t)v18, v27, v24);
          objc_msgSend_addEntriesFromDictionary_(v17, v30, (uint64_t)v29);
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v31, (uint64_t)&v40, v44, 16);
      }
      while (v21);
    }

    v34 = objc_msgSend_copy(v17, v32, v33);
    id v10 = v38;
    id v8 = v39;
    v12 = v37;
  }
  else
  {
    id v45 = v9;
    v17 = objc_msgSend_convertToFeatureValue_(a1, v13, (uint64_t)v12);
    v46[0] = v17;
    v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v46, &v45, 1);
    v14 = v9;
  }

  return v34;
}

+ (id)convertToFeatureValue:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend_convertStringToFeatureValue_(a1, v5, (uint64_t)v4);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = objc_msgSend_convertArrayToFeatureValue_(a1, v7, (uint64_t)v4);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)MEMORY[0x1E4F1E950];
        objc_msgSend_doubleValue(v4, v8, v9);
        uint64_t v6 = objc_msgSend_featureValueWithDouble_(v10, v11, v12);
      }
      else
      {
        uint64_t v13 = OdmlLogForCategory(5uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412546;
          id v19 = (id)objc_opt_class();
          __int16 v20 = 2112;
          id v21 = v4;
          id v14 = v19;
          _os_log_impl(&dword_1BBC44000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Failed to convert the following to an MLFeatureValue: %@", (uint8_t *)&v18, 0x16u);
        }
        uint64_t v6 = objc_msgSend_undefinedFeatureValueWithType_(MEMORY[0x1E4F1E950], v15, 2);
      }
    }
  }
  uint64_t v16 = (void *)v6;

  return v16;
}

+ (id)convertStringToFeatureValue:(id)a3
{
  id v3 = a3;
  int v6 = objc_msgSend_containsOnlyDecimalCharacters(v3, v4, v5);
  uint64_t v9 = (void *)MEMORY[0x1E4F1E950];
  if (v6)
  {
    objc_msgSend_doubleValue(v3, v7, v8);
    double v11 = v10;

    id v14 = objc_msgSend_featureValueWithDouble_(v9, v12, v13, v11);
  }
  else
  {
    id v14 = objc_msgSend_featureValueWithString_(MEMORY[0x1E4F1E950], v7, (uint64_t)v3);
  }

  return v14;
}

+ (id)convertArrayToFeatureValue:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5))
  {
    uint64_t v8 = objc_msgSend_firstObject(v3, v6, v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v11 = objc_msgSend_firstObject(v3, v9, v10);
      char v14 = objc_msgSend_containsOnlyDecimalCharacters(v11, v12, v13);

      if ((v14 & 1) == 0)
      {
        v17 = (void *)MEMORY[0x1E4F1E950];
        int v18 = objc_msgSend_sequenceWithStringArray_(MEMORY[0x1E4F1E9F0], v15, (uint64_t)v3);
        __int16 v20 = objc_msgSend_featureValueWithSequence_(v17, v19, (uint64_t)v18);
        goto LABEL_11;
      }
    }
    else
    {
    }
    int v18 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v15, v16);
    if (objc_msgSend_count(v3, v26, v27))
    {
      unint64_t v30 = 0;
      do
      {
        v31 = NSNumber;
        v32 = objc_msgSend_objectAtIndexedSubscript_(v3, v28, v30);
        objc_msgSend_doubleValue(v32, v33, v34);
        v37 = objc_msgSend_numberWithDouble_(v31, v35, v36);
        objc_msgSend_addObject_(v18, v38, (uint64_t)v37);

        ++v30;
      }
      while (v30 < objc_msgSend_count(v3, v39, v40));
    }
    long long v41 = (void *)MEMORY[0x1E4F1E950];
    long long v42 = (void *)MEMORY[0x1E4F1E9A8];
    long long v43 = objc_msgSend_copy(v18, v28, v29);
    id v45 = objc_msgSend_multiarrayFromArray_(v42, v44, (uint64_t)v43);
    __int16 v20 = objc_msgSend_featureValueWithMultiArray_(v41, v46, (uint64_t)v45);
  }
  else
  {
    id v21 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v22 = (void *)MEMORY[0x1E4F1E9A8];
    int v18 = objc_msgSend_array(MEMORY[0x1E4F1C978], v6, v7);
    uint64_t v24 = objc_msgSend_multiarrayFromArray_(v22, v23, (uint64_t)v18);
    __int16 v20 = objc_msgSend_featureValueWithMultiArray_(v21, v25, (uint64_t)v24);
  }
LABEL_11:

  return v20;
}

@end