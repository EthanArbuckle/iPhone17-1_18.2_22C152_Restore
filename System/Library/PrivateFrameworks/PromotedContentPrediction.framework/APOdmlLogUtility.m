@interface APOdmlLogUtility
+ (id)printInSegments:(id)a3 log:(id)a4 isPlugin:(BOOL)a5;
+ (id)printModelDeltasInSegments:(id)a3 isPlugin:(BOOL)a4;
+ (void)logModelInputWithAdamID:(id)a3 adamID:(id)a4;
+ (void)logTrainingRowFeatures:(id)a3;
+ (void)logWithLoggerKey:(id)a3 message:(id)a4 category:(unint64_t)a5;
+ (void)printDESRecordInSegments:(id)a3 isPlugin:(BOOL)a4 rowID:(id)a5;
+ (void)printDESRecordRowOrder:(id)a3 iterationNumber:(id)a4;
@end

@implementation APOdmlLogUtility

+ (void)logWithLoggerKey:(id)a3 message:(id)a4 category:(unint64_t)a5
{
  v25[3] = *MEMORY[0x1E4F143B8];
  v25[0] = a3;
  v24[0] = @"loggerKey";
  v24[1] = @"uniqueIdentifier";
  v7 = (void *)MEMORY[0x1E4F29128];
  id v8 = a4;
  id v9 = a3;
  v12 = objc_msgSend_UUID(v7, v10, v11);
  v15 = objc_msgSend_UUIDString(v12, v13, v14);
  v24[2] = @"message";
  v25[1] = v15;
  v25[2] = v8;
  v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v25, v24, 3);

  v18 = OdmlLogForCategory(a5);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend_mlJSONString(v17, v19, v20);
    int v22 = 138477827;
    v23 = v21;
    _os_log_impl(&dword_1BBC44000, v18, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v22, 0xCu);
  }
}

+ (void)logModelInputWithAdamID:(id)a3 adamID:(id)a4
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v8 = objc_msgSend_mlDictionaryForJSON(a3, v6, v7);
  uint64_t v11 = objc_msgSend_mutableCopy(v8, v9, v10);

  if (v11)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v11, v12, (uint64_t)v5, @"adamID");
    v28[0] = @"adFeatures";
    v27[0] = @"loggerKey";
    v27[1] = @"uniqueIdentifier";
    v15 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v13, v14);
    v18 = objc_msgSend_UUIDString(v15, v16, v17);
    v27[2] = @"message";
    v28[1] = v18;
    v28[2] = v11;
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v28, v27, 3);

    v21 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend_description(v20, v22, v23);
      int v25 = 138477827;
      v26 = v24;
      _os_log_impl(&dword_1BBC44000, v21, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    uint64_t v20 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1BBC44000, v20, OS_LOG_TYPE_ERROR, "Model inputs: Cannot Parse the Inputs.", (uint8_t *)&v25, 2u);
    }
  }
}

+ (void)logTrainingRowFeatures:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  objc_msgSend_features(v3, v4, v5);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v27, v31, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9);
        uint64_t v17 = objc_msgSend_rowID(v3, v15, v16);
        objc_msgSend_setValue_forKey_(v14, v18, (uint64_t)v17, @"trainingRowID");

        v21 = objc_msgSend_features(v3, v19, v20);
        uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, v13);
        objc_msgSend_setValue_forKey_(v14, v24, (uint64_t)v23, v13);

        objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v25, @"TrainingRowFeatures", v14, 11);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v27, v31, 16);
    }
    while (v10);
  }
}

+ (void)printDESRecordRowOrder:(id)a3 iterationNumber:(id)a4
{
  id v23 = a3;
  id v5 = a4;
  id v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v6, v7);
  if (objc_msgSend_count(v23, v9, v10))
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v11, @"index_%lu", v12);
      v15 = objc_msgSend_objectAtIndexedSubscript_(v23, v14, v12);
      v18 = objc_msgSend_rowID(v15, v16, v17);
      objc_msgSend_setValue_forKey_(v8, v19, (uint64_t)v18, v13);

      ++v12;
    }
    while (v12 < objc_msgSend_count(v23, v20, v21));
  }
  objc_msgSend_setValue_forKey_(v8, v11, (uint64_t)v5, @"IterationNumber");
  objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v22, @"RowOrder", v8, 11);
}

+ (void)printDESRecordInSegments:(id)a3 isPlugin:(BOOL)a4 rowID:(id)a5
{
  BOOL v6 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v32 = a5;
  if (!v32)
  {
    uint64_t v9 = OdmlLogForCategory(9uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v35 = (id)objc_opt_class();
      id v10 = v35;
      _os_log_impl(&dword_1BBC44000, v9, OS_LOG_TYPE_DEFAULT, "%{private}@]: Generating random DES record ID for logging presave.", buf, 0xCu);
    }
    uint64_t v13 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v11, v12);
    objc_msgSend_UUIDString(v13, v14, v15);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v7;
  v33 = objc_msgSend_mlJSONStringWithPrettyPrint_(v7, v8, 0);
  unint64_t v18 = objc_msgSend_length(v33, v16, v17);
  uint64_t v21 = 0;
  if (v6) {
    unint64_t v22 = 11;
  }
  else {
    unint64_t v22 = 9;
  }
  unint64_t v23 = v18 / 5;
  do
  {
    unint64_t v24 = v21 * v23;
    unint64_t v25 = v23;
    if (v21 == 4) {
      unint64_t v25 = objc_msgSend_length(v33, v19, v20) - v24;
    }
    v26 = OdmlLogForCategory(v22);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      long long v27 = objc_opt_class();
      ++v21;
      id v28 = v27;
      long long v30 = objc_msgSend_substringWithRange_(v33, v29, v24, v25);
      *(_DWORD *)buf = 138478851;
      id v35 = v27;
      __int16 v36 = 2113;
      id v37 = v32;
      __int16 v38 = 2049;
      uint64_t v39 = v21;
      __int16 v40 = 2049;
      uint64_t v41 = 5;
      __int16 v42 = 2113;
      v43 = v30;
      _os_log_impl(&dword_1BBC44000, v26, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Unarchived DES Record Dictionary %{private}@ (%{private}lu of %{private}lu): %{private}@", buf, 0x34u);
    }
    else
    {
      ++v21;
    }
  }
  while (v21 != 5);
}

+ (id)printModelDeltasInSegments:(id)a3 isPlugin:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = objc_msgSend_mlJSONString(a3, a2, (uint64_t)a3);
  id v8 = objc_msgSend_printInSegments_log_isPlugin_(a1, v7, @"Model deltas", v6, v4);

  return v8;
}

+ (id)printInSegments:(id)a3 log:(id)a4 isPlugin:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v7 = a4;
  id v8 = NSNumber;
  uint64_t v11 = objc_msgSend_length(v7, v9, v10);
  uint64_t v13 = objc_msgSend_numberWithUnsignedInteger_(v8, v12, v11);
  objc_msgSend_floatValue(v13, v14, v15);
  v19 = objc_msgSend_numberWithDouble_(v8, v17, v18, ceilf(v16 / 30000.0));

  objc_msgSend_floatValue(v19, v20, v21);
  if (v24 < 1.0)
  {

    v19 = &unk_1F15066C8;
  }
  v43 = v19;
  uint64_t v25 = objc_msgSend_unsignedIntegerValue(v19, v22, v23);
  id v28 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v26, v27);
  objc_msgSend_UUIDString(v28, v29, v30);
  id v44 = (id)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    uint64_t v33 = 0;
    if (v5) {
      unint64_t v34 = 11;
    }
    else {
      unint64_t v34 = 9;
    }
    do
    {
      uint64_t v35 = 30000 * v33;
      uint64_t v36 = 30000;
      if (v33 == v25 - 1) {
        uint64_t v36 = objc_msgSend_length(v7, v31, v32) - v35;
      }
      id v37 = OdmlLogForCategory(v34);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v38 = objc_opt_class();
        ++v33;
        id v39 = v38;
        uint64_t v41 = objc_msgSend_substringWithRange_(v7, v40, v35, v36);
        *(_DWORD *)buf = 138479107;
        v47 = v38;
        __int16 v48 = 2112;
        id v49 = v45;
        __int16 v50 = 2113;
        id v51 = v44;
        __int16 v52 = 2049;
        uint64_t v53 = v33;
        __int16 v54 = 2049;
        uint64_t v55 = v25;
        __int16 v56 = 2113;
        v57 = v41;
        _os_log_impl(&dword_1BBC44000, v37, OS_LOG_TYPE_DEFAULT, "[%{private}@]: %@ %{private}@ (%{private}lu of %{private}lu): %{private}@", buf, 0x3Eu);
      }
      else
      {
        ++v33;
      }
    }
    while (v33 != v25);
  }

  return v44;
}

@end