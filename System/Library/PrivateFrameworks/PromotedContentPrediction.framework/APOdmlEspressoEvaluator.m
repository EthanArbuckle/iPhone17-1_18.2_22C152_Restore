@interface APOdmlEspressoEvaluator
- (APOdmlEspressoEvaluator)initWithTrainingRowBuilder:(id)a3 recipe:(id)a4 netURL:(id)a5;
- (APOdmlRecipe)recipe;
- (APOdmlTrainingSetBuilder)builder;
- (BOOL)_setError:(id *)a3 errorCode:(int64_t)a4;
- (NSURL)netURL;
- (id)_computeModelDeltas:(id)a3 weightsAfter:(id)a4 error:(id *)a5;
- (id)_evaluate:(id)a3 error:(id *)a4;
- (id)_generateMetrics:(id)a3 postTrainingMetrics:(id)a4 tapAndImpressionMetrics:(id)a5 deltaPttrMetrics:(id)a6;
- (id)evaluate:(id *)a3;
- (unint64_t)trainingSetSize;
- (void)setTrainingSetSize:(unint64_t)a3;
@end

@implementation APOdmlEspressoEvaluator

- (APOdmlEspressoEvaluator)initWithTrainingRowBuilder:(id)a3 recipe:(id)a4 netURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)APOdmlEspressoEvaluator;
  v12 = [(APOdmlEspressoEvaluator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_builder, a3);
    objc_storeStrong((id *)&v13->_recipe, a4);
    objc_storeStrong((id *)&v13->_netURL, a5);
    v13->_trainingSetSize = 0;
  }

  return v13;
}

- (id)evaluate:(id *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v5 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v58 = 138412290;
    id v59 = (id)objc_opt_class();
    id v6 = v59;
    _os_log_impl(&dword_1BBC44000, v5, OS_LOG_TYPE_DEFAULT, "[%@]: Evaluation begins.", (uint8_t *)&v58, 0xCu);
  }
  id v9 = objc_msgSend_netURL(self, v7, v8);
  id v11 = objc_msgSend__evaluate_error_(self, v10, (uint64_t)v9, a3);

  if (v11)
  {
    v14 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13);
    objc_super v15 = NSNumber;
    uint64_t v18 = objc_msgSend_trainingSetSize(self, v16, v17);
    v20 = objc_msgSend_numberWithUnsignedInteger_(v15, v19, v18);
    objc_msgSend_setValue_forKey_(v14, v21, (uint64_t)v20, @"NumRows");

    v24 = objc_msgSend_recipe(self, v22, v23);
    v27 = objc_msgSend_batchSize(v24, v25, v26);
    objc_msgSend_setValue_forKey_(v14, v28, (uint64_t)v27, @"BatchSize");

    v31 = objc_msgSend_recipe(self, v29, v30);
    v34 = objc_msgSend_localIterationsCount(v31, v32, v33);
    objc_msgSend_setValue_forKey_(v14, v35, (uint64_t)v34, @"LocalIterationsCount");

    v38 = objc_msgSend_recipe(self, v36, v37);
    v41 = objc_msgSend_learningRate(v38, v39, v40);
    objc_msgSend_setValue_forKey_(v14, v42, (uint64_t)v41, @"LearningRate");

    v43 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v58) = 0;
      _os_log_impl(&dword_1BBC44000, v43, OS_LOG_TYPE_DEFAULT, "Preparing to evaluate with the following inputs", (uint8_t *)&v58, 2u);
    }

    objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v44, @"TrainingParameters", v14, 11);
    v46 = objc_msgSend_objectForKey_(v11, v45, @"Metrics");
    v49 = objc_msgSend_recipe(self, v47, v48);
    v52 = objc_msgSend_weightNames(v49, v50, v51);
    objc_msgSend_setValue_forKey_(v46, v53, (uint64_t)v52, @"UpdatedModelIndices");

    v56 = objc_msgSend_copy(v11, v54, v55);
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

- (id)_evaluate:(id)a3 error:(id *)a4
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v160 = v6;
    _os_log_impl(&dword_1BBC44000, v7, OS_LOG_TYPE_DEFAULT, "Evaluation in C begins with netpath: %@", buf, 0xCu);
  }

  uint64_t v8 = [APOdmlEspressoFacade alloc];
  id v11 = objc_msgSend_recipe(self, v9, v10);
  uint64_t v13 = objc_msgSend_initWithEspressoNetURL_recipe_error_(v8, v12, (uint64_t)v6, v11, a4);

  if (!v13)
  {
    v25 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC44000, v25, OS_LOG_TYPE_ERROR, "Failed to initialize the Espresso network.", buf, 2u);
    }
    goto LABEL_54;
  }
  v16 = objc_msgSend_builder(self, v14, v15);
  v19 = objc_msgSend_requiredFeatures(v13, v17, v18);
  objc_msgSend_addRequiredFeatures_(v16, v20, (uint64_t)v19);

  uint64_t v23 = objc_msgSend_builder(self, v21, v22);
  v25 = objc_msgSend_generateTrainingSet_(v23, v24, (uint64_t)a4);

  if (!v25 || !objc_msgSend_count(v25, v26, v27))
  {
    v120 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC44000, v120, OS_LOG_TYPE_ERROR, "Failed to find any training row.", buf, 2u);
    }

    if (a4 && !*a4) {
      objc_msgSend__setError_errorCode_(self, v121, (uint64_t)a4, 8012);
    }
    goto LABEL_54;
  }
  v28 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v160 = v25;
    _os_log_impl(&dword_1BBC44000, v28, OS_LOG_TYPE_DEFAULT, "Generated the following training rows: %@", buf, 0xCu);
  }

  uint64_t v31 = objc_msgSend_count(v25, v29, v30);
  objc_msgSend_setTrainingSetSize_(self, v32, v31);
  v35 = objc_msgSend_recipe(self, v33, v34);
  v38 = objc_msgSend_batchSize(v35, v36, v37);
  unint64_t v41 = objc_msgSend_unsignedIntegerValue(v38, v39, v40);

  if (!v41)
  {
    v122 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC44000, v122, OS_LOG_TYPE_ERROR, "Batch size should not be zero.", buf, 2u);
    }

    objc_msgSend__setError_errorCode_(self, v123, (uint64_t)a4, 8037);
LABEL_54:
    v115 = 0;
    goto LABEL_55;
  }
  if (objc_msgSend_trainingSetSize(self, v42, v43) < v41) {
    unint64_t v41 = objc_msgSend_trainingSetSize(self, v44, v45);
  }
  if (objc_msgSend_changeEspressoBatchSize_error_(v13, v44, v41, a4))
  {
    if (objc_msgSend_finalizeEspressoPipeline_(v13, v46, (uint64_t)a4))
    {
      v47 = OdmlLogForCategory(0xBuLL);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBC44000, v47, OS_LOG_TYPE_DEFAULT, "Weights after initialization:\n", buf, 2u);
      }

      uint64_t v152 = objc_msgSend_retrieveWeights_(v13, v48, (uint64_t)a4);
      if (!v152)
      {
        v127 = OdmlLogForCategory(0xBuLL);
        if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBC44000, v127, OS_LOG_TYPE_ERROR, "Failed to find any weights before training.", buf, 2u);
        }

        objc_msgSend__setError_errorCode_(self, v128, (uint64_t)a4, 8029);
        v115 = 0;
        goto LABEL_94;
      }
      uint64_t v51 = objc_msgSend_retrieveWeights2D_(v13, v49, (uint64_t)a4);
      if (!v51)
      {
        v129 = OdmlLogForCategory(0xBuLL);
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBC44000, v129, OS_LOG_TYPE_ERROR, "Failed to retrieve weights by preserving the shape.", buf, 2u);
        }

        objc_msgSend__setError_errorCode_(self, v130, (uint64_t)a4, 8029);
        v115 = 0;
        goto LABEL_93;
      }
      objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v50, @"ModelWeightsBeforeTraining", v51, 11);
      v147 = v51;
      v148 = objc_msgSend_computeAccuracyAndLoss_error_(v13, v52, (uint64_t)v25, a4);
      if (v148)
      {
        if (objc_msgSend_trainWithTrainingSet_error_(v13, v53, (uint64_t)v25, a4))
        {
          uint64_t v140 = objc_msgSend_computeAccuracyAndLoss_error_(v13, v54, (uint64_t)v25, a4);
          if (v140)
          {
            uint64_t v55 = OdmlLogForCategory(0xBuLL);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBC44000, v55, OS_LOG_TYPE_DEFAULT, "Weights after training:\n", buf, 2u);
            }

            uint64_t v58 = objc_msgSend_retrieveWeights_(v13, v56, (uint64_t)a4);
            v139 = v58;
            if (v58)
            {
              uint64_t v60 = objc_msgSend_retrieveWeights2D_(v13, v57, (uint64_t)a4);
              v138 = v60;
              if (v60)
              {
                objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v59, @"ModelWeightsAfterTraining", v60, 11);
                uint64_t v137 = objc_msgSend__computeModelDeltas_weightsAfter_error_(self, v61, v152, v58, 0);
                unint64_t v62 = 0x1E4F1C000uLL;
                v144 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v63, v64);
                v145 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v65, v66);
                v146 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v67, v68);
                long long v156 = 0u;
                long long v157 = 0u;
                long long v154 = 0u;
                long long v155 = 0u;
                obj = v25;
                uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v69, (uint64_t)&v154, v158, 16);
                if (v72)
                {
                  uint64_t v143 = *(void *)v155;
                  while (2)
                  {
                    uint64_t v73 = 0;
                    uint64_t v142 = v72;
                    do
                    {
                      if (*(void *)v155 != v143) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v149 = v73;
                      v74 = *(void **)(*((void *)&v154 + 1) + 8 * v73);
                      v75 = objc_msgSend_array(*(void **)(v62 + 2632), v70, v71);
                      v150 = v75;
                      objc_msgSend_addObject_(v75, v76, (uint64_t)v74);
                      v153 = objc_msgSend_computeClientPttr_error_(v13, v77, (uint64_t)v75, a4);
                      if (!v153)
                      {
                        v135 = OdmlLogForCategory(0xBuLL);
                        if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1BBC44000, v135, OS_LOG_TYPE_ERROR, "Failed to compute clientPttr after training.", buf, 2u);
                        }

                        v115 = 0;
                        v118 = obj;
                        goto LABEL_85;
                      }
                      v78 = OdmlLogForCategory(0xBuLL);
                      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v160 = v153;
                        _os_log_impl(&dword_1BBC44000, v78, OS_LOG_TYPE_DEFAULT, "clientPttr: %@", buf, 0xCu);
                      }

                      objc_msgSend_addObject_(v144, v79, (uint64_t)v153);
                      v82 = objc_msgSend_features(v74, v80, v81);
                      v151 = objc_msgSend_objectForKeyedSubscript_(v82, v83, @"pTTRLogit");

                      if (objc_msgSend_count(v151, v84, v85))
                      {
                        v87 = objc_msgSend_objectAtIndexedSubscript_(v151, v86, 0);
                        v88 = NSNumber;
                        objc_msgSend_floatValue(v153, v89, v90);
                        float v92 = v91;
                        objc_msgSend_floatValue(v87, v93, v94);
                        *(float *)&double v96 = v92 - v95;
                        v99 = objc_msgSend_numberWithFloat_(v88, v97, v98, v96);
                        v100 = OdmlLogForCategory(0xBuLL);
                        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          v160 = v99;
                          _os_log_impl(&dword_1BBC44000, v100, OS_LOG_TYPE_DEFAULT, "deltaPttr: %@", buf, 0xCu);
                        }

                        objc_msgSend_addObject_(v145, v101, (uint64_t)v99);
                      }
                      else
                      {
                        v102 = OdmlLogForCategory(0xBuLL);
                        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1BBC44000, v102, OS_LOG_TYPE_ERROR, "server side PTTR does not exist for a trainingRow", buf, 2u);
                        }

                        v87 = objc_msgSend_numberWithFloat_(NSNumber, v103, v104, 0.0);
                        objc_msgSend_addObject_(v145, v105, (uint64_t)v87);
                      }

                      v108 = objc_msgSend_builder(self, v106, v107);
                      v110 = objc_msgSend_metricsForTrainingRow_withClientPttr_(v108, v109, (uint64_t)v74, v153);

                      objc_msgSend_addObject_(v146, v111, (uint64_t)v110);
                      uint64_t v73 = v149 + 1;
                      unint64_t v62 = 0x1E4F1C000;
                    }
                    while (v142 != v149 + 1);
                    uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v154, v158, 16);
                    if (v72) {
                      continue;
                    }
                    break;
                  }
                }

                v112 = OdmlLogForCategory(0xBuLL);
                if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v160 = v146;
                  _os_log_impl(&dword_1BBC44000, v112, OS_LOG_TYPE_DEFAULT, "tapAndImpressionMetrics: %@", buf, 0xCu);
                }

                v115 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v113, v114);
                objc_msgSend_setValue_forKey_(v115, v116, v137, @"Deltas");
                v118 = objc_msgSend__generateMetrics_postTrainingMetrics_tapAndImpressionMetrics_deltaPttrMetrics_(self, v117, (uint64_t)v148, v140, v146, v145);
                objc_msgSend_setValue_forKey_(v115, v119, (uint64_t)v118, @"Metrics");
LABEL_85:

                v136 = v137;
              }
              else
              {
                v136 = OdmlLogForCategory(0xBuLL);
                if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BBC44000, v136, OS_LOG_TYPE_ERROR, "Failed to retrieve weights after training by preserving the shape.", buf, 2u);
                }
                v115 = 0;
              }

              v134 = v138;
            }
            else
            {
              v134 = OdmlLogForCategory(0xBuLL);
              if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBC44000, v134, OS_LOG_TYPE_ERROR, "Failed to find any weight after training.", buf, 2u);
              }
              v115 = 0;
            }

            v133 = v139;
          }
          else
          {
            v133 = OdmlLogForCategory(0xBuLL);
            if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBC44000, v133, OS_LOG_TYPE_ERROR, "Failed to compute accuracy and loss after training.", buf, 2u);
            }
            v115 = 0;
          }

          v131 = v140;
          goto LABEL_92;
        }
        v131 = OdmlLogForCategory(0xBuLL);
        if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v132 = "Failed to train the model";
          goto LABEL_74;
        }
      }
      else
      {
        v131 = OdmlLogForCategory(0xBuLL);
        if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v132 = "Failed to find preTrainingMetrics.";
LABEL_74:
          _os_log_impl(&dword_1BBC44000, v131, OS_LOG_TYPE_ERROR, v132, buf, 2u);
        }
      }
      v115 = 0;
LABEL_92:

      uint64_t v51 = v147;
LABEL_93:

LABEL_94:
      v125 = v152;
      goto LABEL_95;
    }
    v125 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v126 = "Failed to finalize the Espresso pipeline.";
      goto LABEL_62;
    }
  }
  else
  {
    v125 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v126 = "Failed to change input shape.";
LABEL_62:
      _os_log_impl(&dword_1BBC44000, v125, OS_LOG_TYPE_ERROR, v126, buf, 2u);
    }
  }
  v115 = 0;
LABEL_95:

LABEL_55:

  return v115;
}

- (id)_computeModelDeltas:(id)a3 weightsAfter:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = objc_msgSend_count(v8, v10, v11);
  if (v12 != objc_msgSend_count(v9, v13, v14)) {
    objc_msgSend__setError_errorCode_(self, v15, (uint64_t)a5, 8029);
  }
  v19 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v15, v16);
  for (unint64_t i = 0; i < objc_msgSend_count(v8, v17, v18); ++i)
  {
    uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v8, v21, i);
    objc_msgSend_floatValue(v23, v24, v25);
    float v27 = v26;

    v29 = objc_msgSend_objectAtIndexedSubscript_(v9, v28, i);
    objc_msgSend_floatValue(v29, v30, v31);
    float v33 = v32;

    *(float *)&double v34 = v33 - v27;
    uint64_t v37 = objc_msgSend_numberWithFloat_(NSNumber, v35, v36, v34);
    objc_msgSend_addObject_(v19, v38, (uint64_t)v37);
  }
  v39 = objc_msgSend_copy(v19, v21, v22);

  return v39;
}

- (id)_generateMetrics:(id)a3 postTrainingMetrics:(id)a4 tapAndImpressionMetrics:(id)a5 deltaPttrMetrics:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v15 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14);
  if (objc_msgSend_count(v9, v16, v17) == 2)
  {
    v20 = objc_msgSend_objectAtIndexedSubscript_(v9, v18, 0);
    objc_msgSend_setValue_forKey_(v15, v21, (uint64_t)v20, @"PreTrainingAccuracy");

    uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v9, v22, 1);
    objc_msgSend_setValue_forKey_(v15, v24, (uint64_t)v23, @"PreTrainingLoss");
  }
  if (objc_msgSend_count(v10, v18, v19) == 2)
  {
    float v26 = objc_msgSend_objectAtIndexedSubscript_(v10, v25, 0);
    objc_msgSend_setValue_forKey_(v15, v27, (uint64_t)v26, @"PostTrainingAccuracy");

    v29 = objc_msgSend_objectAtIndexedSubscript_(v10, v28, 1);
    objc_msgSend_setValue_forKey_(v15, v30, (uint64_t)v29, @"PostTrainingLoss");
  }
  objc_msgSend_setValue_forKey_(v15, v25, (uint64_t)v11, @"AdditionalMetrics");
  objc_msgSend_setValue_forKey_(v15, v31, (uint64_t)v12, @"delta_pTTR");

  return v15;
}

- (BOOL)_setError:(id *)a3 errorCode:(int64_t)a4
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, @"APODMLDESPluginErrorDomain", a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (unint64_t)trainingSetSize
{
  return self->_trainingSetSize;
}

- (void)setTrainingSetSize:(unint64_t)a3
{
  self->_trainingSetSize = a3;
}

- (APOdmlTrainingSetBuilder)builder
{
  return self->_builder;
}

- (APOdmlRecipe)recipe
{
  return self->_recipe;
}

- (NSURL)netURL
{
  return self->_netURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netURL, 0);
  objc_storeStrong((id *)&self->_recipe, 0);

  objc_storeStrong((id *)&self->_builder, 0);
}

@end