@interface APOdmlTrainingSetBuilder
+ (BOOL)_extractFeaturesFromDataBlob:(id)a3 featuresRequired:(id)a4 andSaveTo:(id)a5;
+ (id)_gatherFeaturesFromAdRecord:(id)a3 requiredFeatures:(id)a4;
+ (id)classesForDataDict;
+ (id)trainingRowsFromDESRecord:(id)a3 featuresRequired:(id)a4;
+ (id)translateFeatureKeyToDESKey:(id)a3;
- (APOdmlRecipe)recipe;
- (APOdmlTrainingSetBuilder)initWithLocalRecords:(id)a3 recipe:(id)a4;
- (BOOL)setError:(id *)a3 errorCode:(int64_t)a4;
- (BOOL)setErrorPtr:(id *)a3 toError:(id)a4;
- (NSArray)augmentedRecords;
- (NSArray)localRecords;
- (NSSet)requiredFeatures;
- (id)_combineRows:(id)a3 augmentedRows:(id)a4;
- (id)generateTrainingSet:(id *)a3;
- (id)metricsForTrainingRow:(id)a3 withClientPttr:(id)a4;
- (id)parseRowsFromRecords:(id)a3 recordIDs:(id)a4;
- (unint64_t)trainingSetCount;
- (void)_preprocessAugmentedDESRecords:(id)a3 andAddMetadataTo:(id)a4 addRecordIDsTo:(id)a5;
- (void)addRequiredFeatures:(id)a3;
- (void)setRequiredFeatures:(id)a3;
@end

@implementation APOdmlTrainingSetBuilder

- (APOdmlTrainingSetBuilder)initWithLocalRecords:(id)a3 recipe:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)APOdmlTrainingSetBuilder;
  v11 = [(APOdmlTrainingSetBuilder *)&v19 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v9, v10);
    requiredFeatures = v11->_requiredFeatures;
    v11->_requiredFeatures = (NSSet *)v12;

    objc_storeStrong((id *)&v11->_recipe, a4);
    objc_storeStrong((id *)&v11->_localRecords, a3);
    uint64_t v16 = objc_msgSend_augmentedDESRecords(v8, v14, v15);
    augmentedRecords = v11->_augmentedRecords;
    v11->_augmentedRecords = (NSArray *)v16;
  }
  return v11;
}

+ (id)classesForDataDict
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  return (id)objc_msgSend_setWithObjects_(v2, v9, v3, v4, v5, v6, v7, v8, 0);
}

- (id)generateTrainingSet:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_requiredFeatures(self, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_count(v5, v6, v7);

  if (v8)
  {
    v11 = objc_msgSend_recipe(self, v9, v10);
    v14 = objc_msgSend_augmentedDESRecordsRatio(v11, v12, v13);

    uint64_t v15 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v56) = 0;
      _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_DEFAULT, "Generating Training Set", (uint8_t *)&v56, 2u);
    }

    uint64_t v16 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v19 = objc_msgSend_localRecords(self, v17, v18);
      int v56 = 138412290;
      v57 = v19;
      _os_log_impl(&dword_1BBC44000, v16, OS_LOG_TYPE_DEFAULT, "Local records: %@", (uint8_t *)&v56, 0xCu);
    }
    v20 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend_augmentedRecords(self, v21, v22);
      int v56 = 138412290;
      v57 = v23;
      _os_log_impl(&dword_1BBC44000, v20, OS_LOG_TYPE_DEFAULT, "Augmented records: %@", (uint8_t *)&v56, 0xCu);
    }
    v24 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v56 = 138412290;
      v57 = v14;
      _os_log_impl(&dword_1BBC44000, v24, OS_LOG_TYPE_DEFAULT, "Sampling ratio: %@", (uint8_t *)&v56, 0xCu);
    }

    uint64_t v27 = objc_msgSend_localRecords(self, v25, v26);
    if (v27 && (v30 = (void *)v27, int v31 = objc_msgSend_intValue(v14, v28, v29), v30, v31 == 1))
    {
      v32 = objc_msgSend_localRecords(self, v28, v29);
    }
    else
    {
      v33 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v28, v29);
      v36 = objc_msgSend_augmentedRecords(self, v34, v35);
      v39 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v37, v38);
      objc_msgSend__preprocessAugmentedDESRecords_andAddMetadataTo_addRecordIDsTo_(self, v40, (uint64_t)v36, v33, v39);
      uint64_t v43 = objc_msgSend_localRecords(self, v41, v42);
      if (v43 && (v46 = (void *)v43, int v47 = objc_msgSend_intValue(v14, v44, v45), v46, v47))
      {
        v48 = objc_msgSend_parseRowsFromRecords_recordIDs_(self, v44, (uint64_t)v36, v39);
        v51 = objc_msgSend_localRecords(self, v49, v50);
        v32 = objc_msgSend__combineRows_augmentedRows_(self, v52, (uint64_t)v51, v48);
      }
      else
      {
        v32 = objc_msgSend_parseRowsFromRecords_recordIDs_(self, v44, (uint64_t)v36, v39);
      }
    }
  }
  else
  {
    v53 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v56) = 0;
      _os_log_impl(&dword_1BBC44000, v53, OS_LOG_TYPE_DEFAULT, "No features are required by the model.", (uint8_t *)&v56, 2u);
    }

    objc_msgSend_setError_errorCode_(self, v54, (uint64_t)a3, 8000);
    v32 = 0;
  }

  return v32;
}

- (id)parseRowsFromRecords:(id)a3 recordIDs:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v56 = a4;
  uint64_t v58 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8);
  if (objc_msgSend_count(v6, v9, v10))
  {
    unint64_t v12 = 0;
    v55 = v6;
    do
    {
      uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(v6, v11, v12);
      uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(v56, v14, v12);
      uint64_t v18 = objc_msgSend_UUIDString(v15, v16, v17);

      objc_msgSend_printDESRecordInSegments_isPlugin_rowID_(APOdmlLogUtility, v19, v13, 1, v18);
      v20 = objc_opt_class();
      v23 = objc_msgSend_requiredFeatures(self, v21, v22);
      v57 = (void *)v13;
      v25 = objc_msgSend_trainingRowsFromDESRecord_featuresRequired_(v20, v24, v13, v23);

      if (objc_msgSend_count(v25, v26, v27) && objc_msgSend_count(v25, v28, v29))
      {
        unint64_t v31 = 0;
        do
        {
          v32 = objc_msgSend_objectAtIndexedSubscript_(v25, v30, v31);
          v34 = objc_msgSend_stringWithFormat_(NSString, v33, @"_%ld", v31);
          v36 = objc_msgSend_stringByAppendingString_(v18, v35, (uint64_t)v34);

          objc_msgSend_setRowID_(v32, v37, (uint64_t)v36);
          v40 = objc_msgSend_recipe(self, v38, v39);
          int isValidRow = objc_msgSend_isValidRow_(v32, v41, (uint64_t)v40);

          if (isValidRow) {
            objc_msgSend_addObject_(v58, v43, (uint64_t)v32);
          }

          ++v31;
        }
        while (v31 < objc_msgSend_count(v25, v44, v45));
      }

      ++v12;
      id v6 = v55;
    }
    while (v12 < objc_msgSend_count(v55, v46, v47));
  }
  v48 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v60 = objc_msgSend_count(v58, v49, v50);
    _os_log_impl(&dword_1BBC44000, v48, OS_LOG_TYPE_DEFAULT, "Extracted %lu valid training rows from DES record.", buf, 0xCu);
  }

  v53 = objc_msgSend_copy(v58, v51, v52);

  return v53;
}

+ (id)trainingRowsFromDESRecord:(id)a3 featuresRequired:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v9 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8);
  uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11);
  uint64_t v13 = objc_opt_class();
  uint64_t v15 = objc_msgSend_objectForKey_(v5, v14, @"OnDeviceFeatures");
  uint64_t v43 = (void *)v12;
  LODWORD(v13) = objc_msgSend__extractFeaturesFromDataBlob_featuresRequired_andSaveTo_(v13, v16, (uint64_t)v15, v6, v12);

  if (v13)
  {
    uint64_t v42 = v9;
    id v41 = v5;
    uint64_t v18 = objc_msgSend_objectForKey_(v5, v17, @"AdRecords");
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v44, v48, 16);
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v45 != v24) {
            objc_enumerationMutation(v18);
          }
          uint64_t v26 = objc_msgSend_objectForKey_(v18, v21, *(void *)(*((void *)&v44 + 1) + 8 * i));
          uint64_t v27 = objc_opt_class();
          unint64_t v31 = objc_msgSend__gatherFeaturesFromAdRecord_requiredFeatures_(v27, v28, (uint64_t)v26, v6);
          if (v31)
          {
            v32 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v29, v30);
            objc_msgSend_addEntriesFromDictionary_(v32, v33, (uint64_t)v31);
            objc_msgSend_addEntriesFromDictionary_(v32, v34, (uint64_t)v43);
            uint64_t v35 = [APOdmlTrainingRow alloc];
            v37 = objc_msgSend_initWithFeatures_(v35, v36, (uint64_t)v32);
            objc_msgSend_addObject_(v42, v38, (uint64_t)v37);
          }
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v44, v48, 16);
      }
      while (v23);
    }
    v9 = v42;
    uint64_t v39 = objc_msgSend_copy(v42, v21, v22);

    id v5 = v41;
  }
  else
  {
    uint64_t v39 = 0;
  }

  return v39;
}

- (id)_combineRows:(id)a3 augmentedRows:(id)a4
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v116 = a4;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v122, v127, 16);
  float v11 = 0.0;
  float v12 = 0.0;
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v123;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v123 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = objc_msgSend_features(*(void **)(*((void *)&v122 + 1) + 8 * i), v9, v10);
        objc_super v19 = objc_msgSend_recipe(self, v17, v18);
        uint64_t v22 = objc_msgSend_augmentedDESRecordsTargetKey(v19, v20, v21);
        uint64_t v24 = objc_msgSend_objectForKey_(v16, v23, (uint64_t)v22);
        uint64_t v27 = objc_msgSend_firstObject(v24, v25, v26);

        if (objc_msgSend_BOOLValue(v27, v28, v29)) {
          float v12 = v12 + 1.0;
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v122, v127, 16);
    }
    while (v13);
  }
  v114 = v6;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v30 = v116;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v118, v126, 16);
  if (v32)
  {
    uint64_t v35 = v32;
    uint64_t v36 = *(void *)v119;
    float v11 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v119 != v36) {
          objc_enumerationMutation(v30);
        }
        uint64_t v38 = objc_msgSend_features(*(void **)(*((void *)&v118 + 1) + 8 * j), v33, v34);
        id v41 = objc_msgSend_recipe(self, v39, v40);
        long long v44 = objc_msgSend_augmentedDESRecordsTargetKey(v41, v42, v43);
        long long v46 = objc_msgSend_objectForKey_(v38, v45, (uint64_t)v44);
        uint64_t v49 = objc_msgSend_firstObject(v46, v47, v48);

        if (objc_msgSend_BOOLValue(v49, v50, v51)) {
          float v11 = v11 + 1.0;
        }
      }
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v118, v126, 16);
    }
    while (v35);
  }

  v53 = objc_msgSend_arrayByAddingObjectsFromArray_(v114, v52, (uint64_t)v30);
  id v56 = objc_msgSend_recipe(self, v54, v55);
  v59 = objc_msgSend_augmentedDESRecordsTruePercentage(v56, v57, v58);
  objc_msgSend_floatValue(v59, v60, v61);
  float v63 = v62;

  uint64_t v66 = objc_msgSend_count(v114, v64, v65);
  uint64_t v69 = objc_msgSend_count(v30, v67, v68);
  v115 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v70, v71);
  v117 = v53;
  unint64_t v74 = objc_msgSend_count(v53, v72, v73);
  v77 = objc_msgSend_recipe(self, v75, v76);
  v80 = objc_msgSend_augmentedDESRecordsLimit(v77, v78, v79);
  unint64_t v83 = objc_msgSend_unsignedLongValue(v80, v81, v82);

  if (v74 >= v83) {
    unint64_t v86 = v83;
  }
  else {
    unint64_t v86 = v74;
  }
  if (v86)
  {
    unint64_t v87 = v86;
    uint64_t v88 = 0;
    float v89 = (float)(v12 + v11) / v63;
    float v90 = (float)(unint64_t)(v69 + v66) - (float)(v12 + v11);
    if (v89 >= (float)(v90 / (float)(1.0 - v63))) {
      float v89 = v90 / (float)(1.0 - v63);
    }
    float v91 = (float)(v63 * v89) / (float)(v12 + v11);
    double v92 = (float)((float)((float)(1.0 - v63) * v89) / v90);
    double v93 = v91;
    while (1)
    {
      v94 = objc_msgSend_objectAtIndexedSubscript_(v117, v84, v88);
      double v95 = drand48();
      v98 = objc_msgSend_features(v94, v96, v97);
      v101 = objc_msgSend_recipe(self, v99, v100);
      v104 = objc_msgSend_augmentedDESRecordsTargetKey(v101, v102, v103);
      v106 = objc_msgSend_objectForKey_(v98, v105, (uint64_t)v104);
      v109 = objc_msgSend_firstObject(v106, v107, v108);

      if (!v109) {
        goto LABEL_31;
      }
      if (objc_msgSend_BOOLValue(v109, v110, v111)) {
        break;
      }
      if (v95 <= v92) {
        goto LABEL_31;
      }
LABEL_32:

      if (v87 == ++v88) {
        goto LABEL_33;
      }
    }
    if (v95 > v93) {
      goto LABEL_32;
    }
LABEL_31:
    objc_msgSend_addObject_(v115, v110, (uint64_t)v94);
    goto LABEL_32;
  }
LABEL_33:
  v112 = objc_msgSend_copy(v115, v84, v85);

  return v112;
}

- (void)_preprocessAugmentedDESRecords:(id)a3 andAddMetadataTo:(id)a4 addRecordIDsTo:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v22, v26, 16);
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v23;
    while (1)
    {
      if (*(void *)v23 != v15) {
        objc_enumerationMutation(v7);
      }
      uint64_t v16 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v12, v13);
      objc_msgSend_addObject_(v9, v17, (uint64_t)v16);
      uint64_t v20 = objc_msgSend_dictionary(MEMORY[0x1E4F1C9E8], v18, v19);
      objc_msgSend_addObject_(v8, v21, (uint64_t)v20);

      if (!--v14)
      {
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v12, (uint64_t)&v22, v26, 16);
        if (!v14) {
          break;
        }
      }
    }
  }
}

- (void)addRequiredFeatures:(id)a3
{
  objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], a2, (uint64_t)a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequiredFeatures_(self, v4, (uint64_t)v5);
}

+ (id)_gatherFeaturesFromAdRecord:(id)a3 requiredFeatures:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = objc_msgSend_objectForKey_(v5, v7, @"Tapped");
  uint64_t v10 = objc_msgSend_objectForKey_(v5, v9, @"Impressed");
  if ((objc_msgSend_BOOLValue(v8, v11, v12) & 1) != 0 || objc_msgSend_BOOLValue(v10, v13, v14))
  {
    uint64_t v15 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14);
    uint64_t v16 = objc_opt_class();
    if (objc_msgSend__extractFeaturesFromDataBlob_featuresRequired_andSaveTo_(v16, v17, (uint64_t)v5, v6, v15)&& (uint64_t v18 = objc_opt_class(), objc_msgSend_objectForKey_(v5, v19, @"ServerResponse"), v20 = objc_claimAutoreleasedReturnValue(), LODWORD(v18) = objc_msgSend__extractFeaturesFromDataBlob_featuresRequired_andSaveTo_(v18, v21, (uint64_t)v20, v6, v15), v20, v18))
    {
      long long v24 = objc_msgSend_copy(v15, v22, v23);
    }
    else
    {
      long long v24 = 0;
    }
  }
  else
  {
    long long v24 = 0;
  }

  return v24;
}

+ (BOOL)_extractFeaturesFromDataBlob:(id)a3 featuresRequired:(id)a4 andSaveTo:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_allKeys(v8, v11, v12);
  uint64_t v16 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v14, v15);
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = sub_1BBC52050;
  v70[3] = &unk_1E624A8F0;
  id v73 = a1;
  id v17 = v13;
  id v71 = v17;
  id v18 = v16;
  id v72 = v18;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v19, (uint64_t)v70);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v22 = objc_msgSend_allKeys(v18, v20, v21);
  uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v66, v79, 16);
  if (!v65)
  {
    BOOL v51 = 1;
    goto LABEL_27;
  }
  id v60 = a1;
  id v61 = v17;
  id v62 = v9;
  id v63 = v18;
  uint64_t v25 = *(void *)v67;
  v64 = v22;
LABEL_3:
  uint64_t v26 = 0;
  while (1)
  {
    if (*(void *)v67 != v25) {
      objc_enumerationMutation(v22);
    }
    uint64_t v27 = *(void *)(*((void *)&v66 + 1) + 8 * v26);
    v28 = objc_msgSend_objectForKeyedSubscript_(v18, v24, v27, v60);
    id v30 = objc_msgSend_objectForKeyedSubscript_(v8, v29, (uint64_t)v28);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    uint64_t v33 = objc_msgSend_arrayOfNumbers(v30, v31, v32);
LABEL_10:
    id v36 = (id)v33;
    objc_msgSend_setObject_forKeyedSubscript_(v10, v34, v33, v27);
LABEL_11:

LABEL_12:
    if (v65 == ++v26)
    {
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v66, v79, 16);
      uint64_t v65 = v50;
      if (!v50)
      {
        BOOL v51 = 1;
        goto LABEL_25;
      }
      goto LABEL_3;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v78 = v30;
    uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v35, (uint64_t)&v78, 1);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_setObject_forKeyedSubscript_(v10, v49, (uint64_t)v30, v27);
    }
    else {
      objc_msgSend_setValue_forKey_(v10, v49, 0, v27);
    }
    goto LABEL_12;
  }
  id v36 = v30;
  if (objc_msgSend_type(v36, v37, v38) == 5)
  {
    objc_msgSend_multiArrayValue(v36, v39, v40);
    uint64_t v42 = v41 = v8;
    objc_msgSend_arrayFromMultiarray(v42, v43, v44);
    uint64_t v45 = v25;
    long long v47 = v46 = v10;
    objc_msgSend_setObject_forKeyedSubscript_(v46, v48, (uint64_t)v47, v27);

    id v10 = v46;
    uint64_t v25 = v45;

    id v8 = v41;
    id v18 = v63;
    long long v22 = v64;
    goto LABEL_11;
  }
  uint64_t v52 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    v53 = v22;
    v54 = objc_opt_class();
    id v55 = v54;
    uint64_t v58 = objc_msgSend_type(v36, v56, v57);
    *(_DWORD *)buf = 138412546;
    v75 = v54;
    long long v22 = v53;
    __int16 v76 = 2048;
    uint64_t v77 = v58;
    _os_log_impl(&dword_1BBC44000, v52, OS_LOG_TYPE_ERROR, "[%@]: MLFeatureValue type %ld is not supported.", buf, 0x16u);
  }
  BOOL v51 = 0;
LABEL_25:
  id v17 = v61;
  id v9 = v62;
LABEL_27:

  return v51;
}

+ (id)translateFeatureKeyToDESKey:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"AppDownloadVector"))
  {
    objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v5, @"appDownloadVector", 0, 0);
LABEL_8:
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v3, v5, @"AppInstalledVector"))
  {
    objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v6, @"installedAppVector", 0, 0);
    goto LABEL_8;
  }
  if ((objc_msgSend_isEqualToString_(v3, v6, @"AppUsageVector") & 1) != 0
    || objc_msgSend_isEqualToString_(v3, v7, @"appUsageVector"))
  {
    objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v7, @"appUsageVector", 0, 0);
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v3, v7, @"DupeFirstOrganic"))
  {
    uint64_t v12 = kAPOdmlIsDupeKey;
LABEL_22:
    id v8 = *v12;
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v3, v11, @"Installed"))
  {
    uint64_t v12 = kAPOdmlAppInstalledKey;
    goto LABEL_22;
  }
  if (objc_msgSend_isEqualToString_(v3, v13, @"Impressed"))
  {
    uint64_t v12 = kAPOdmlImpressedKey;
    goto LABEL_22;
  }
  if ((objc_msgSend_isEqualToString_(v3, v14, @"Tapped") & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v15, @"Tap") & 1) != 0
    || objc_msgSend_isEqualToString_(v3, v16, @"label_input_0"))
  {
    uint64_t v12 = kAPOdmlTappedKey;
    goto LABEL_22;
  }
  id v8 = (__CFString *)v3;
LABEL_9:
  id v9 = v8;

  return v9;
}

- (id)metricsForTrainingRow:(id)a3 withClientPttr:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_msgSend_dictionary(v5, v8, v9);
  uint64_t v13 = objc_msgSend_features(v7, v11, v12);

  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"Tap");
  id v17 = objc_msgSend_objectAtIndexedSubscript_(v15, v16, 0);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v18, (uint64_t)v17, @"tap");

  objc_msgSend_setObject_forKeyedSubscript_(v10, v19, MEMORY[0x1E4F1CC38], @"impression");
  objc_msgSend_setObject_forKeyedSubscript_(v10, v20, (uint64_t)v6, @"on-device_pTTR");

  uint64_t v23 = objc_msgSend_copy(v10, v21, v22);

  return v23;
}

- (BOOL)setError:(id *)a3 errorCode:(int64_t)a4
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, @"APODMLDESPluginErrorDomain", a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (BOOL)setErrorPtr:(id *)a3 toError:(id)a4
{
  if (a3) {
    *a3 = a4;
  }
  return a3 != 0;
}

- (unint64_t)trainingSetCount
{
  return self->_trainingSetCount;
}

- (NSSet)requiredFeatures
{
  return self->_requiredFeatures;
}

- (void)setRequiredFeatures:(id)a3
{
}

- (APOdmlRecipe)recipe
{
  return self->_recipe;
}

- (NSArray)localRecords
{
  return self->_localRecords;
}

- (NSArray)augmentedRecords
{
  return self->_augmentedRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_augmentedRecords, 0);
  objc_storeStrong((id *)&self->_localRecords, 0);
  objc_storeStrong((id *)&self->_recipe, 0);

  objc_storeStrong((id *)&self->_requiredFeatures, 0);
}

@end