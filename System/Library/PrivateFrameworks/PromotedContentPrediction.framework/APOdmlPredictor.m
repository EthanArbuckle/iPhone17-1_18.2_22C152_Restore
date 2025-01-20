@interface APOdmlPredictor
- (APOdmlAssetManager)assetManager;
- (APOdmlFeatureHandler)featureHandler;
- (APOdmlPredictor)initWithResponses:(id)a3 assetManager:(id)a4 model:(id)a5;
- (MLModel)predictionModel;
- (NSArray)adamIDs;
- (id)predictTapThroughRate;
- (void)localOutputLog:(id)a3 adamID:(id)a4;
- (void)validateOutput:(id)a3 adamID:(id)a4;
@end

@implementation APOdmlPredictor

- (APOdmlPredictor)initWithResponses:(id)a3 assetManager:(id)a4 model:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)APOdmlPredictor;
  v12 = [(APOdmlPredictor *)&v31 init];
  if (!v12) {
    goto LABEL_3;
  }
  uint64_t v13 = objc_msgSend_valueForKey_(v8, v11, @"adamID");
  adamIDs = v12->_adamIDs;
  v12->_adamIDs = (NSArray *)v13;

  objc_storeStrong((id *)&v12->_assetManager, a4);
  objc_storeStrong((id *)&v12->_predictionModel, a5);
  v17 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v15, v16);
  v18 = [APOdmlFeatureHandler alloc];
  uint64_t v20 = objc_msgSend_initWithResponses_assetManager_model_(v18, v19, (uint64_t)v8, v9, v10);
  featureHandler = v12->_featureHandler;
  v12->_featureHandler = (APOdmlFeatureHandler *)v20;

  v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v22, @"APOdmlRerankingErrorDomain", 2102, 0);
  v26 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v24, v25);
  objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v27, (uint64_t)v23, 1, 0, v17, v26);

  v28 = v12->_featureHandler;
  if (!v28) {
    v29 = 0;
  }
  else {
LABEL_3:
  }
    v29 = v12;

  return v29;
}

- (id)predictTapThroughRate
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_featureHandler(self, a2, v2);
  v7 = objc_msgSend_batchInput(v4, v5, v6);

  if (v7)
  {
    id v10 = objc_msgSend_predictionModel(self, v8, v9);
    v11 = OdmlLogForCategory(5uLL);
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    uint64_t v13 = OdmlLogForCategory(5uLL);
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Batch PTTR Prediction", (const char *)&unk_1BBC77EAD, buf, 2u);
    }

    v17 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v15, v16);
    uint64_t v20 = objc_msgSend_featureHandler(self, v18, v19);
    v23 = objc_msgSend_batchInput(v20, v21, v22);
    id v89 = 0;
    uint64_t v25 = objc_msgSend_predictionsFromBatch_error_(v10, v24, (uint64_t)v23, &v89);
    id v26 = v89;

    v27 = OdmlLogForCategory(5uLL);
    v28 = v27;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v28, OS_SIGNPOST_INTERVAL_END, v12, "Batch PTTR Prediction", (const char *)&unk_1BBC77EAD, buf, 2u);
    }

    if (v26 || !v25)
    {
      v80 = OdmlLogForCategory(5uLL);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v81 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v91 = v81;
        __int16 v92 = 2112;
        id v93 = v26;
        id v82 = v81;
        _os_log_impl(&dword_1BBC44000, v80, OS_LOG_TYPE_ERROR, "[%@] Error predicting tap through rate: %@", buf, 0x16u);
      }
      v75 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v83, @"APOdmlPredictionErrorDomain", 4002, 0);
      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v84, (uint64_t)v75, 0);
      v74 = 0;
    }
    else
    {
      v88 = v10;
      uint64_t v30 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v29, @"APOdmlRerankingErrorDomain", 2103, 0);
      v33 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v31, v32);
      v86 = (void *)v30;
      v87 = v17;
      objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v34, v30, 1, 0, v17, v33);

      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v35, 0, 0);
      v38 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v36, v37);
      if (objc_msgSend_count(v25, v39, v40) >= 1)
      {
        uint64_t v43 = 0;
        do
        {
          v44 = objc_msgSend_featuresAtIndex_(v25, v41, v43);
          v47 = objc_msgSend_featureNames(v44, v45, v46);
          v50 = objc_msgSend_anyObject(v47, v48, v49);

          v52 = objc_msgSend_featureValueForName_(v44, v51, (uint64_t)v50);
          v55 = v52;
          if (v52)
          {
            v56 = objc_msgSend_multiArrayValue(v52, v53, v54);
            uint64_t v59 = objc_msgSend_count(v56, v57, v58);

            if (v59 >= 1)
            {
              v62 = objc_msgSend_multiArrayValue(v55, v60, v61);
              v64 = objc_msgSend_objectAtIndexedSubscript_(v62, v63, 0);

              v67 = objc_msgSend_adamIDs(self, v65, v66);
              v69 = objc_msgSend_objectAtIndexedSubscript_(v67, v68, v43);
              objc_msgSend_validateOutput_adamID_(self, v70, (uint64_t)v64, v69);

              objc_msgSend_addObject_(v38, v71, (uint64_t)v64);
            }
          }

          ++v43;
        }
        while (v43 < objc_msgSend_count(v25, v72, v73));
      }
      v74 = objc_msgSend_copy(v38, v41, v42);

      v75 = 0;
      v17 = v87;
      id v10 = v88;
      id v26 = 0;
    }
  }
  else
  {
    v76 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v91 = (id)objc_opt_class();
      id v77 = v91;
      _os_log_impl(&dword_1BBC44000, v76, OS_LOG_TYPE_ERROR, "[%@] Cannot predict because input is nil.", buf, 0xCu);
    }
    v75 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v78, @"APOdmlPredictionErrorDomain", 4001, 0);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v79, (uint64_t)v75, 0);
    v74 = 0;
  }

  return v74;
}

- (void)validateOutput:(id)a3 adamID:(id)a4
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9);
  objc_msgSend_setValue_forKey_(v10, v11, @"modelOutput", @"featureName");
  if (v6)
  {
    v14 = objc_msgSend_stringValue(v6, v12, v13);
    objc_msgSend_setValue_forKey_(v10, v15, (uint64_t)v14, @"featureValue");

    v18 = objc_msgSend_copy(v10, v16, v17);
    objc_msgSend_localOutputLog_adamID_(self, v19, (uint64_t)v18, v7);

    uint64_t v22 = objc_msgSend_assetManager(self, v20, v21);
    v24 = objc_msgSend_stringValueForFactor_(v22, v23, @"ModelOutputConfig");

    if (v24)
    {
      id v26 = objc_msgSend_dataUsingEncoding_(v24, v25, 4);
      id v99 = 0;
      v28 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v27, (uint64_t)v26, 0, &v99);
      id v30 = v99;
      if (!v30)
      {
        __int16 v92 = v26;
        v33 = objc_msgSend_objectForKeyedSubscript_(v28, v29, @"min");
        if (v33)
        {
          objc_msgSend_floatValue(v6, v31, v32);
          float v35 = v34;
          objc_msgSend_floatValue(v33, v36, v37);
          if (v35 < v38)
          {
            v39 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v31, @"APODMLDESPluginErrorDomain", 4006, 0);
            uint64_t v42 = objc_msgSend_copy(v10, v40, v41);
            objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v43, (uint64_t)v39, v42);
          }
        }
        v90 = v33;
        id v93 = v24;
        id v94 = v7;
        uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v28, v31, @"max");
        if (v46)
        {
          objc_msgSend_floatValue(v6, v44, v45);
          float v48 = v47;
          objc_msgSend_floatValue(v46, v49, v50);
          if (v48 > v51)
          {
            v52 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v44, @"APODMLDESPluginErrorDomain", 4005, 0);
            v55 = objc_msgSend_copy(v10, v53, v54);
            objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v56, (uint64_t)v52, v55);
          }
        }
        id v89 = v46;
        v57 = v6;
        id v91 = v28;
        uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v28, v44, @"sentinelValueSet");
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v95, v100, 16);
        if (v60)
        {
          uint64_t v63 = v60;
          uint64_t v64 = *(void *)v96;
          do
          {
            for (uint64_t i = 0; i != v63; ++i)
            {
              if (*(void *)v96 != v64) {
                objc_enumerationMutation(v58);
              }
              uint64_t v66 = *(void **)(*((void *)&v95 + 1) + 8 * i);
              if (v66)
              {
                v67 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v61, v62);
                char isEqual = objc_msgSend_isEqual_(v66, v68, (uint64_t)v67);

                if ((isEqual & 1) == 0)
                {
                  objc_msgSend_floatValue(v57, v61, v62);
                  float v71 = v70;
                  objc_msgSend_floatValue(v66, v72, v73);
                  if (v71 == v74)
                  {
                    v75 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v61, @"APODMLDESPluginErrorDomain", 4007, 0);
                    v78 = objc_msgSend_copy(v10, v76, v77);
                    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v79, (uint64_t)v75, v78);
                  }
                }
              }
            }
            uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v95, v100, 16);
          }
          while (v63);
        }

        id v6 = v57;
        v24 = v93;
        id v7 = v94;
        v28 = v91;
        id v26 = v92;
        id v30 = 0;
      }
    }
  }
  else
  {
    v80 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v12, @"APODMLDESPluginErrorDomain", 4007, 0);
    v83 = objc_msgSend_copy(v10, v81, v82);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v84, (uint64_t)v80, v83);

    v87 = objc_msgSend_copy(v10, v85, v86);
    objc_msgSend_localOutputLog_adamID_(self, v88, (uint64_t)v87, v7);
  }
}

- (void)localOutputLog:(id)a3 adamID:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  objc_msgSend_dictionaryWithDictionary_(v5, v7, (uint64_t)a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v10, v8, (uint64_t)v6, @"adamID");

  objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v9, @"InferenceModelOutput", v10, 5);
}

- (MLModel)predictionModel
{
  return self->_predictionModel;
}

- (APOdmlAssetManager)assetManager
{
  return self->_assetManager;
}

- (APOdmlFeatureHandler)featureHandler
{
  return self->_featureHandler;
}

- (NSArray)adamIDs
{
  return self->_adamIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamIDs, 0);
  objc_storeStrong((id *)&self->_featureHandler, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);

  objc_storeStrong((id *)&self->_predictionModel, 0);
}

@end