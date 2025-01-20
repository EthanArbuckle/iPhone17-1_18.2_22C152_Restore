@interface APOdmlEvaluator
- (APOdmlEvaluator)initWithTrainingRowBuilder:(id)a3 recipe:(id)a4 modelURL:(id)a5;
- (APOdmlRecipe)recipe;
- (APOdmlTrainingSetBuilder)builder;
- (BOOL)_setError:(id *)a3 errorCode:(int64_t)a4;
- (NSURL)modelURL;
- (id)_generateMetricsForBatch:(id)a3 preTraining:(id)a4 postTraining:(id)a5 tapAndImpressions:(id)a6 pttrDeltas:(id)a7;
- (id)evaluate:(id *)a3;
- (unint64_t)trainingSetSize;
- (void)setTrainingSetSize:(unint64_t)a3;
@end

@implementation APOdmlEvaluator

- (APOdmlEvaluator)initWithTrainingRowBuilder:(id)a3 recipe:(id)a4 modelURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)APOdmlEvaluator;
  v12 = [(APOdmlEvaluator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_builder, a3);
    objc_storeStrong((id *)&v13->_recipe, a4);
    objc_storeStrong((id *)&v13->_modelURL, a5);
    v13->_trainingSetSize = 0;
  }

  return v13;
}

- (id)evaluate:(id *)a3
{
  v265[1] = *MEMORY[0x1E4F143B8];
  v5 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v261 = objc_opt_class();
    id v6 = *(id *)v261;
    _os_log_impl(&dword_1BBC44000, v5, OS_LOG_TYPE_DEBUG, "[%@] Evaluation begins.", buf, 0xCu);
  }
  v7 = (void *)MEMORY[0x1E4F1E968];
  id v10 = objc_msgSend_modelURL(self, v8, v9);
  v12 = objc_msgSend_modelFromCompiledURL_isCPUOnly_(v7, v11, (uint64_t)v10, 0);

  objc_super v15 = objc_msgSend_recipe(self, v13, v14);
  v18 = objc_msgSend_coreMLRecipe(v15, v16, v17);

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  v22 = objc_msgSend_outputNames(v18, v20, v21);
  v24 = objc_msgSend_setWithArray_(v19, v23, (uint64_t)v22);

  v27 = objc_msgSend_recipe(self, v25, v26);
  v30 = objc_msgSend_shouldShuffle(v27, v28, v29);
  int v33 = objc_msgSend_BOOLValue(v30, v31, v32);

  if (v33)
  {
    v36 = objc_msgSend_configuration(v12, v34, v35);
    v39 = objc_msgSend_shuffle(MEMORY[0x1E4F1E9D0], v37, v38);
    v264 = v39;
    v265[0] = MEMORY[0x1E4F1CC38];
    v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)v265, &v264, 1);
    objc_msgSend_setParameters_(v36, v42, (uint64_t)v41);

    objc_msgSend_setConfiguration_(v12, v43, (uint64_t)v36);
  }
  v44 = objc_msgSend_inputNames(v18, v34, v35);
  v47 = objc_msgSend_builder(self, v45, v46);
  objc_msgSend_addRequiredFeatures_(v47, v48, (uint64_t)v44);

  v51 = objc_msgSend_builder(self, v49, v50);
  v53 = objc_msgSend_generateTrainingSet_(v51, v52, (uint64_t)a3);

  if (!v53 || !objc_msgSend_count(v53, v54, v55))
  {
    v98 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC44000, v98, OS_LOG_TYPE_ERROR, "Failed to find any training rows.", buf, 2u);
    }

    if (!a3 || *a3) {
      goto LABEL_27;
    }
    v100 = &kAPODMLDESPluginNoDataToEvaluate;
LABEL_26:
    objc_msgSend__setError_errorCode_(self, v99, (uint64_t)a3, *v100);
LABEL_27:
    v96 = 0;
    goto LABEL_85;
  }
  v56 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v261 = v53;
    _os_log_impl(&dword_1BBC44000, v56, OS_LOG_TYPE_DEBUG, "Generated the following training rows: %@", buf, 0xCu);
  }

  uint64_t v59 = objc_msgSend_count(v53, v57, v58);
  objc_msgSend_setTrainingSetSize_(self, v60, v59);
  v63 = objc_msgSend_recipe(self, v61, v62);
  v66 = objc_msgSend_batchSize(v63, v64, v65);
  unint64_t v69 = objc_msgSend_unsignedIntegerValue(v66, v67, v68);

  if (!v69)
  {
    v101 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC44000, v101, OS_LOG_TYPE_ERROR, "Batch size should not be zero.", buf, 2u);
    }

    v100 = &kAPODMLDESPluginBatchSizeZero;
    goto LABEL_26;
  }
  v246 = v44;
  unint64_t v72 = objc_msgSend_trainingSetSize(self, v70, v71);
  if (v72 < v69) {
    unint64_t v69 = v72;
  }
  v73 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v261 = v69;
    _os_log_impl(&dword_1BBC44000, v73, OS_LOG_TYPE_DEBUG, "Batch size required: %ld", buf, 0xCu);
  }

  id v74 = objc_alloc(MEMORY[0x1E4F1E910]);
  v248 = v53;
  v76 = objc_msgSend_subarrayWithRange_(v53, v75, 0, v69);
  v78 = objc_msgSend_initWithFeatureProviderArray_(v74, v77, (uint64_t)v76);

  id v79 = objc_alloc(MEMORY[0x1E4F1E9E8]);
  v82 = objc_msgSend_program(v12, v80, v81);
  v85 = objc_msgSend_recipe(self, v83, v84);
  v88 = objc_msgSend_learningRate(v85, v86, v87);
  objc_msgSend_doubleValue(v88, v89, v90);
  id v257 = 0;
  v92 = objc_msgSend_initWithProgram_learningRate_error_(v79, v91, (uint64_t)v82, &v257);
  id v93 = v257;

  if (v93)
  {
    v95 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v261 = v93;
      _os_log_impl(&dword_1BBC44000, v95, OS_LOG_TYPE_ERROR, "Failed to init trainer. Reason: %@", buf, 0xCu);
    }
    v96 = 0;
    i = v92;
    goto LABEL_84;
  }
  id v256 = 0;
  uint64_t v237 = objc_msgSend_evaluateUsingTestData_evaluationMetricNames_error_(v92, v94, (uint64_t)v78, v24, &v256);
  id v102 = v256;
  i = v92;
  if (v102)
  {
    id v93 = v102;
    v105 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v261 = v93;
      _os_log_impl(&dword_1BBC44000, v105, OS_LOG_TYPE_ERROR, "Failed to compute pre training results. Reason: %@", buf, 0xCu);
    }
    v96 = 0;
    goto LABEL_32;
  }
  v247 = v92;
  uint64_t v244 = (uint64_t)v78;
  v235 = v18;
  v236 = v12;
  v106 = objc_msgSend_recipe(self, v103, v104);
  v109 = objc_msgSend_localIterationsCount(v106, v107, v108);
  int v112 = objc_msgSend_intValue(v109, v110, v111);

  if (v112 < 1)
  {
    unint64_t v115 = 0;
    v114 = 0;
    v138 = v248;
LABEL_46:
    id v254 = 0;
    uint64_t v139 = objc_msgSend_evaluateUsingTestData_evaluationMetricNames_error_(v247, v113, v244, v24, &v254);
    id v142 = v254;
    if (v142)
    {
      v143 = OdmlLogForCategory(0xBuLL);
      if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v261 = v142;
        _os_log_impl(&dword_1BBC44000, v143, OS_LOG_TYPE_ERROR, "Failed to compute post training results. Reason: %@", buf, 0xCu);
      }
    }
    v242 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v140, v141);
    v241 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v144, v145);
    long long v250 = 0u;
    long long v251 = 0u;
    long long v252 = 0u;
    long long v253 = 0u;
    id v146 = v138;
    uint64_t v240 = objc_msgSend_countByEnumeratingWithState_objects_count_(v146, v147, (uint64_t)&v250, v259, 16);
    v234 = v139;
    if (v240)
    {
      uint64_t v239 = *(void *)v251;
      v243 = v24;
      id obj = v146;
      while (2)
      {
        uint64_t v148 = 0;
        unint64_t v149 = 0x1E4F1E000uLL;
        do
        {
          if (*(void *)v251 != v239) {
            objc_enumerationMutation(obj);
          }
          v150 = *(void **)(*((void *)&v250 + 1) + 8 * v148);
          id v151 = objc_alloc(*(Class *)(v149 + 2320));
          v258 = v150;
          v153 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v152, (uint64_t)&v258, 1);
          v155 = objc_msgSend_initWithFeatureProviderArray_(v151, v154, (uint64_t)v153);
          id v249 = v142;
          v157 = objc_msgSend_evaluateUsingTestData_evaluationMetricNames_error_(v247, v156, (uint64_t)v155, v243, &v249);
          id v93 = v249;

          if (v93)
          {
            v223 = OdmlLogForCategory(0xBuLL);
            if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v261 = v93;
              _os_log_impl(&dword_1BBC44000, v223, OS_LOG_TYPE_ERROR, "Failed to evaluate row. Reason: %@", buf, 0xCu);
            }
            v96 = 0;
            v18 = v235;
            v12 = v236;
            v24 = v243;
            i = v247;
            v95 = v237;
            v232 = v241;
            goto LABEL_82;
          }
          v160 = v157;
          v161 = objc_msgSend_evaluationMetrics(v157, v158, v159);
          v163 = objc_msgSend_featuresAtIndex_(v161, v162, 0);

          v245 = v163;
          v165 = objc_msgSend_featureValueForName_(v163, v164, @"Identity");
          v166 = OdmlLogForCategory(0xBuLL);
          v167 = v166;
          if (!v165)
          {
            if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBC44000, v167, OS_LOG_TYPE_ERROR, "Failed to compute clientPttr after training.", buf, 2u);
            }

            v96 = 0;
            v18 = v235;
            v12 = v236;
            v24 = v243;
            i = v247;
            v95 = v237;
            v232 = v241;
            v223 = v245;
            goto LABEL_82;
          }
          if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
          {
            v170 = objc_msgSend_multiArrayValue(v165, v168, v169);
            v172 = objc_msgSend_objectAtIndexedSubscript_(v170, v171, 0);
            *(_DWORD *)buf = 138412290;
            *(void *)v261 = v172;
            _os_log_impl(&dword_1BBC44000, v167, OS_LOG_TYPE_DEBUG, "Client pTTR: %@", buf, 0xCu);
          }
          v175 = objc_msgSend_multiArrayValue(v165, v173, v174);
          v177 = objc_msgSend_objectAtIndexedSubscript_(v175, v176, 0);
          objc_msgSend_addObject_(v242, v178, (uint64_t)v177);

          v181 = objc_msgSend_features(v150, v179, v180);
          v183 = objc_msgSend_objectForKeyedSubscript_(v181, v182, @"pTTRLogit");

          if (objc_msgSend_count(v183, v184, v185))
          {
            v188 = objc_msgSend_multiArrayValue(v165, v186, v187);
            v190 = objc_msgSend_objectAtIndexedSubscript_(v188, v189, 0);
            objc_msgSend_doubleValue(v190, v191, v192);
            double v194 = v193;
            v196 = objc_msgSend_objectAtIndexedSubscript_(v183, v195, 0);
            objc_msgSend_doubleValue(v196, v197, v198);
            double v200 = v194 - v199;

            v203 = objc_msgSend_numberWithDouble_(NSNumber, v201, v202, v200);
            objc_msgSend_addObject_(v241, v204, (uint64_t)v203);
          }
          else
          {
            v205 = OdmlLogForCategory(0xBuLL);
            if (os_log_type_enabled(v205, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBC44000, v205, OS_LOG_TYPE_ERROR, "server side PTTR does not exist for a trainingRow", buf, 2u);
            }

            objc_msgSend_addObject_(v241, v206, (uint64_t)&unk_1F15066E0);
          }
          unint64_t v149 = 0x1E4F1E000;

          id v142 = 0;
          ++v148;
        }
        while (v240 != v148);
        id v146 = obj;
        id v142 = 0;
        id v93 = 0;
        v24 = v243;
        uint64_t v240 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v207, (uint64_t)&v250, v259, 16);
        if (v240) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v93 = v142;
    }

    objc_msgSend_array(MEMORY[0x1E4F1C978], v208, v209);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    v210 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v261 = obj;
      _os_log_impl(&dword_1BBC44000, v210, OS_LOG_TYPE_DEBUG, "tapAndImpressionMetrics: %@", buf, 0xCu);
    }

    v96 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v211, v212);
    v157 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v213, v214);
    for (i = v247; v115; --v115)
    {
      int v218 = *v114++;
      LODWORD(v217) = v218;
      v219 = objc_msgSend_numberWithFloat_(NSNumber, v215, v216, v217);
      objc_msgSend_addObject_(v157, v220, (uint64_t)v219);
    }
    objc_msgSend_setValue_forKey_(v96, v215, (uint64_t)v157, @"Deltas");
    v221 = self;
    v95 = v237;
    v223 = objc_msgSend__generateMetricsForBatch_preTraining_postTraining_tapAndImpressions_pttrDeltas_(v221, v222, v244, v237, v234, obj, v241);
    v18 = v235;
    v226 = objc_msgSend_weightNames(v235, v224, v225);
    objc_msgSend_setValue_forKey_(v223, v227, (uint64_t)v226, @"UpdatedModelIndices");

    v230 = objc_msgSend_copy(v223, v228, v229);
    objc_msgSend_setValue_forKey_(v96, v231, (uint64_t)v230, @"Metrics");

    v232 = v241;
    v12 = v236;
LABEL_82:

    v105 = v234;
    v78 = (void *)v244;
    goto LABEL_83;
  }
  v114 = 0;
  unint64_t v115 = 0;
  int v116 = 0;
  while (1)
  {
    id v255 = 0;
    i = v247;
    id v117 = (id)objc_msgSend_trainUsingTrainingData_error_(v247, v113, v244, &v255);
    id v118 = v255;
    if (v118) {
      break;
    }
    v121 = v24;
    v122 = objc_msgSend_copyCurrentTrainingDelta(v247, v119, v120);
    v125 = objc_msgSend_flattenedModelUpdate(v122, v123, v124);

    v128 = objc_msgSend_copyCurrentTrainingDelta(v247, v126, v127);
    objc_msgSend_flattenedModelUpdate(v128, v129, v130);
    id v131 = objc_claimAutoreleasedReturnValue();
    uint64_t v134 = objc_msgSend_bytes(v131, v132, v133);

    if (v114)
    {
      v24 = v121;
      if (v115)
      {
        uint64_t v137 = 0;
        v138 = v248;
        do
        {
          *(float *)&v114[v137] = *(float *)(v134 + 4 * v137) + *(float *)&v114[v137];
          ++v137;
        }
        while (v115 != v137);
        goto LABEL_43;
      }
    }
    else
    {
      unint64_t v115 = (unint64_t)objc_msgSend_length(v125, v135, v136) >> 2;
      v114 = (int *)v134;
      v24 = v121;
    }
    v138 = v248;
LABEL_43:

    if (++v116 == v112) {
      goto LABEL_46;
    }
  }
  id v93 = v118;
  v105 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v261 = v116;
    *(_WORD *)&v261[4] = 1024;
    *(_DWORD *)&v261[6] = v112;
    __int16 v262 = 2112;
    id v263 = v93;
    _os_log_impl(&dword_1BBC44000, v105, OS_LOG_TYPE_ERROR, "Failed to train model at epoch %d/%d. Reason: %@", buf, 0x18u);
  }
  v96 = 0;
  v18 = v235;
  v12 = v236;
  v78 = (void *)v244;
LABEL_32:
  v95 = v237;
LABEL_83:

LABEL_84:
  v44 = v246;
  v53 = v248;
LABEL_85:

  return v96;
}

- (id)_generateMetricsForBatch:(id)a3 preTraining:(id)a4 postTraining:(id)a5 tapAndImpressions:(id)a6 pttrDeltas:(id)a7
{
  id v11 = (void *)MEMORY[0x1E4F1CA60];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v19 = objc_msgSend_dictionary(v11, v17, v18);
  v22 = objc_msgSend_averageLoss(v15, v20, v21);
  objc_msgSend_setValue_forKey_(v19, v23, (uint64_t)v22, @"PreTrainingLoss");

  v25 = objc_msgSend_averageAccuracy_(v15, v24, (uint64_t)v16);

  objc_msgSend_setValue_forKey_(v19, v26, (uint64_t)v25, @"PreTrainingAccuracy");
  uint64_t v29 = objc_msgSend_averageLoss(v14, v27, v28);
  objc_msgSend_setValue_forKey_(v19, v30, (uint64_t)v29, @"PostTrainingLoss");

  uint64_t v32 = objc_msgSend_averageAccuracy_(v14, v31, (uint64_t)v16);

  objc_msgSend_setValue_forKey_(v19, v33, (uint64_t)v32, @"PostTrainingAccuracy");
  objc_msgSend_setValue_forKey_(v19, v34, (uint64_t)v13, @"AdditionalMetrics");

  objc_msgSend_setValue_forKey_(v19, v35, (uint64_t)v12, @"delta_pTTR");

  return v19;
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

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_recipe, 0);

  objc_storeStrong((id *)&self->_builder, 0);
}

@end