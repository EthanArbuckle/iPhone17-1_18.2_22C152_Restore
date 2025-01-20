@interface APOdmlTrainingRowBiomeQuery
+ (void)combineRecords:(id)a3 andSaveTo:(id)a4;
+ (void)trainingRowsFromBiomeEvent:(id)a3 recordID:(id)a4 requiredFeatures:(id)a5 andSaveTo:(id)a6;
+ (void)validateRows:(id)a3 recipe:(id)a4;
- (APOdmlBiomeSQLQuery)rawQuery;
- (APOdmlRecipe)recipe;
- (APOdmlTrainingRowBiomeQuery)initWithRecipe:(id)a3;
- (id)makeQuery;
- (void)setRawQuery:(id)a3;
- (void)setRecipe:(id)a3;
@end

@implementation APOdmlTrainingRowBiomeQuery

- (APOdmlTrainingRowBiomeQuery)initWithRecipe:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APOdmlTrainingRowBiomeQuery;
  v5 = [(APOdmlTrainingRowBiomeQuery *)&v10 init];
  if (v5)
  {
    v6 = objc_alloc_init(APOdmlBiomeSQLQuery);
    objc_msgSend_setRawQuery_(v5, v7, (uint64_t)v6);

    objc_msgSend_setRecipe_(v5, v8, (uint64_t)v4);
  }

  return v5;
}

- (id)makeQuery
{
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_1BBC6903C;
  v60 = sub_1BBC6904C;
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  id v61 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = sub_1BBC6903C;
  v54 = sub_1BBC6904C;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5);
  id v55 = (id)objc_claimAutoreleasedReturnValue();
  v6 = BiomeLibrary();
  v9 = objc_msgSend_AdPlatforms(v6, v7, v8);
  v12 = objc_msgSend_ODML(v9, v10, v11);
  v15 = objc_msgSend_TrainingRows(v12, v13, v14);

  v18 = objc_msgSend_publisher(v15, v16, v17);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_1BBC6912C;
  v49[3] = &unk_1E624AF70;
  v49[4] = self;
  v49[5] = &v56;
  id v20 = (id)objc_msgSend_sinkWithCompletion_receiveInput_(v18, v19, (uint64_t)&unk_1F14FE7F8, v49);

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  v24 = objc_msgSend_recipe(self, v22, v23);
  v27 = objc_msgSend_coreMLRecipe(v24, v25, v26);
  v30 = objc_msgSend_inputNames(v27, v28, v29);
  v32 = objc_msgSend_setWithArray_(v21, v31, (uint64_t)v30);

  v33 = (void *)v57[5];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1BBC691B4;
  v46[3] = &unk_1E624AF98;
  v46[4] = self;
  id v34 = v32;
  id v47 = v34;
  v48 = &v50;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v33, v35, (uint64_t)v46);
  v36 = objc_opt_class();
  uint64_t v37 = v51[5];
  v40 = objc_msgSend_recipe(self, v38, v39);
  objc_msgSend_validateRows_recipe_(v36, v41, v37, v40);

  v44 = objc_msgSend_copy((void *)v51[5], v42, v43);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);

  return v44;
}

+ (void)combineRecords:(id)a3 andSaveTo:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v9 = objc_msgSend_adamID(v5, v7, v8);

  if (!v9)
  {
    v24 = OdmlLogForCategory(0xCuLL);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    int v81 = 138412290;
    id v82 = (id)objc_opt_class();
    id v67 = v82;
    _os_log_impl(&dword_1BBC44000, v24, OS_LOG_TYPE_ERROR, "[%@] Invalid training row. No Adam ID provided.", (uint8_t *)&v81, 0xCu);
LABEL_20:

    goto LABEL_21;
  }
  v12 = objc_msgSend_allKeys(v6, v10, v11);
  v15 = objc_msgSend_recordID(v5, v13, v14);
  int v17 = objc_msgSend_containsObject_(v12, v16, (uint64_t)v15);

  if (!v17)
  {
    v24 = objc_msgSend_dictionaryRepresentation(v5, v18, v19);
    objc_msgSend_recordID(v5, v74, v75);
    id v67 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v76, (uint64_t)v24, v67);
    goto LABEL_20;
  }
  id v20 = objc_msgSend_recordID(v5, v18, v19);
  v22 = objc_msgSend_objectForKeyedSubscript_(v6, v21, (uint64_t)v20);
  v24 = objc_msgSend_objectForKeyedSubscript_(v22, v23, @"AdRecords");

  v27 = objc_msgSend_allKeys(v24, v25, v26);
  v30 = objc_msgSend_adamID(v5, v28, v29);
  int v32 = objc_msgSend_containsObject_(v27, v31, (uint64_t)v30);

  if (!v32)
  {
    objc_msgSend_dictionaryRepresentation(v5, v33, v34);
    id v67 = (id)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend_objectForKeyedSubscript_(v67, v77, @"AdRecords");
    v72 = objc_msgSend_adamID(v5, v78, v79);
    objc_msgSend_setObject_forKeyedSubscript_(v24, v80, (uint64_t)v70, v72);
    goto LABEL_19;
  }
  if (objc_msgSend_impressed(v5, v33, v34))
  {
    uint64_t v37 = objc_msgSend_adamID(v5, v35, v36);
    uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v24, v38, (uint64_t)v37);
    objc_msgSend_setObject_forKeyedSubscript_(v39, v40, MEMORY[0x1E4F1CC38], @"Impressed");
  }
  if (objc_msgSend_tapped(v5, v35, v36))
  {
    uint64_t v43 = objc_msgSend_adamID(v5, v41, v42);
    v45 = objc_msgSend_objectForKeyedSubscript_(v24, v44, (uint64_t)v43);
    objc_msgSend_setObject_forKeyedSubscript_(v45, v46, MEMORY[0x1E4F1CC38], @"Tapped");
  }
  if (objc_msgSend_dupe(v5, v41, v42))
  {
    v49 = objc_msgSend_adamID(v5, v47, v48);
    v51 = objc_msgSend_objectForKeyedSubscript_(v24, v50, (uint64_t)v49);
    objc_msgSend_setObject_forKeyedSubscript_(v51, v52, MEMORY[0x1E4F1CC38], @"Dupe");
  }
  if (objc_msgSend_installed(v5, v47, v48))
  {
    id v55 = objc_msgSend_adamID(v5, v53, v54);
    v57 = objc_msgSend_objectForKeyedSubscript_(v24, v56, (uint64_t)v55);
    objc_msgSend_setObject_forKeyedSubscript_(v57, v58, MEMORY[0x1E4F1CC38], @"AppInstalled");
  }
  if (objc_msgSend_hasErrorCode(v5, v53, v54))
  {
    objc_msgSend_errorCode(v5, v59, v60);
    if (v63 != (double)0)
    {
      v64 = NSNumber;
      objc_msgSend_errorCode(v5, v61, v62);
      objc_msgSend_numberWithDouble_(v64, v65, v66);
      id v67 = (id)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend_adamID(v5, v68, v69);
      v72 = objc_msgSend_objectForKeyedSubscript_(v24, v71, (uint64_t)v70);
      objc_msgSend_setObject_forKeyedSubscript_(v72, v73, (uint64_t)v67, @"rerankingErrorCode");
LABEL_19:

      goto LABEL_20;
    }
  }
LABEL_21:
}

+ (void)trainingRowsFromBiomeEvent:(id)a3 recordID:(id)a4 requiredFeatures:(id)a5 andSaveTo:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v12 = objc_msgSend_trainingRowsFromDESRecord_featuresRequired_(APOdmlTrainingSetBuilder, v11, (uint64_t)a3, a5);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1BBC6971C;
  v16[3] = &unk_1E624AFC0;
  id v13 = v9;
  id v17 = v13;
  objc_msgSend_enumerateObjectsUsingBlock_(v12, v14, (uint64_t)v16);
  if (v12) {
    objc_msgSend_addObjectsFromArray_(v10, v15, (uint64_t)v12);
  }
}

+ (void)validateRows:(id)a3 recipe:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28E60];
  id v7 = a3;
  id v10 = objc_msgSend_indexSet(v6, v8, v9);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = sub_1BBC69898;
  v18 = &unk_1E624AFE8;
  id v19 = v5;
  id v20 = v10;
  id v11 = v10;
  id v12 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(v7, v13, (uint64_t)&v15);
  objc_msgSend_removeObjectsAtIndexes_(v7, v14, (uint64_t)v11, v15, v16, v17, v18);
}

- (APOdmlBiomeSQLQuery)rawQuery
{
  return self->_rawQuery;
}

- (void)setRawQuery:(id)a3
{
}

- (APOdmlRecipe)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);

  objc_storeStrong((id *)&self->_rawQuery, 0);
}

@end