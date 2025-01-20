@interface APOdmlEspressoFacade
- ($C4732ECC957FA13B9B3DF4A51A95735B)espressoNet;
- (APOdmlEspressoFacade)initWithEspressoNetURL:(id)a3 recipe:(id)a4 error:(id *)a5;
- (APOdmlEspressoIOBufferController)bufferController;
- (APOdmlRecipe)recipe;
- (BOOL)_loadEspressoNet:(const char *)a3 recipe:(id)a4 error:(id *)a5;
- (BOOL)_prepareForTraining:(id *)a3;
- (BOOL)_setErrorPtr:(id *)a3 toError:(id)a4;
- (BOOL)changeEspressoBatchSize:(unint64_t)a3 error:(id *)a4;
- (BOOL)finalizeEspressoPipeline:(id *)a3;
- (BOOL)setError:(id *)a3 errorCode:(int64_t)a4;
- (BOOL)trainWithTrainingSet:(id)a3 error:(id *)a4;
- (NSArray)requiredFeatures;
- (float)_retrieveLossValue;
- (float)accuracyInBatchWithError:(id *)a3;
- (id)_extractRequiredFeatures;
- (id)computeAccuracyAndLoss:(id)a3 error:(id *)a4;
- (id)computeClientPttr:(id)a3 error:(id *)a4;
- (id)retrieveWeights2D:(id *)a3;
- (id)retrieveWeights:(id *)a3;
- (id)setEspressoNetworkFunction;
- (int)_executeEspressoPlan;
- (unint64_t)finalBatchSize;
- (unint64_t)numWeightsInBuffer:(id *)a3;
- (vector<unsigned)_getEspressoBlobShape:(APOdmlEspressoFacade *)self;
- (void)_checkModelOutput:(id)a3;
- (void)_preTrainingSetup;
- (void)dealloc;
- (void)espressoPlan;
- (void)setBufferController:(id)a3;
- (void)setFinalBatchSize:(unint64_t)a3;
- (void)setRecipe:(id)a3;
@end

@implementation APOdmlEspressoFacade

- (APOdmlEspressoFacade)initWithEspressoNetURL:(id)a3 recipe:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)APOdmlEspressoFacade;
  v10 = [(APOdmlEspressoFacade *)&v25 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_recipe, a4);
    objc_msgSend_relativePath(v8, v12, v13);
    id v14 = objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_UTF8String(v14, v15, v16);

    if ((objc_msgSend__loadEspressoNet_recipe_error_(v11, v18, v17, v9, a5) & 1) == 0)
    {
      v23 = 0;
      goto LABEL_6;
    }
    uint64_t v21 = objc_msgSend__extractRequiredFeatures(v11, v19, v20);
    requiredFeatures = v11->_requiredFeatures;
    v11->_requiredFeatures = (NSArray *)v21;
  }
  v23 = v11;
LABEL_6:

  return v23;
}

- (BOOL)_loadEspressoNet:(const char *)a3 recipe:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  espresso_create_context();
  plan = (void *)espresso_create_plan();
  id v9 = ($C4732ECC957FA13B9B3DF4A51A95735B *)malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
  int v10 = espresso_plan_add_network();
  if (v10)
  {
    v11 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v26 = 67109120;
      LODWORD(v27) = v10;
      _os_log_impl(&dword_1BBC44000, v11, OS_LOG_TYPE_ERROR, "Failed to add network to plan with status: %d", (uint8_t *)&v26, 8u);
    }
    v12 = &kAPODMLDESPluginFailedToAddNetworkToPlan;
LABEL_9:

    objc_msgSend_setError_errorCode_(self, v16, (uint64_t)a5, *v12);
    goto LABEL_10;
  }
  int v15 = espresso_network_declare_output();
  if (v15)
  {
    v11 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315394;
      v27 = "pTTR";
      __int16 v28 = 1024;
      int v29 = v15;
      _os_log_impl(&dword_1BBC44000, v11, OS_LOG_TYPE_ERROR, "Failed to declare output %s with status: %d", (uint8_t *)&v26, 0x12u);
    }
    v12 = &kAPODMLDESPluginFailedToDeclarePTTROutput;
    goto LABEL_9;
  }
  objc_msgSend_lossName(v7, v13, v14);
  id v19 = objc_claimAutoreleasedReturnValue();
  uint64_t v22 = objc_msgSend_UTF8String(v19, v20, v21);

  int v23 = espresso_network_declare_output();
  if (!v23)
  {
    self->_espressoNet = v9;
    self->_espressoPlan = plan;
    BOOL v17 = 1;
    goto LABEL_11;
  }
  v24 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    int v26 = 136315394;
    v27 = (const char *)v22;
    __int16 v28 = 1024;
    int v29 = v23;
    _os_log_impl(&dword_1BBC44000, v24, OS_LOG_TYPE_ERROR, "Failed to declare output %s with status: %d", (uint8_t *)&v26, 0x12u);
  }

  objc_msgSend_setError_errorCode_(self, v25, (uint64_t)a5, 8015);
LABEL_10:
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (id)_extractRequiredFeatures
{
  v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2);
  for (uint64_t i = 0; ; ++i)
  {
    objc_msgSend_espressoNet(self, v4, v5);
    uint64_t input_blob_name = espresso_get_input_blob_name();
    if (!input_blob_name) {
      break;
    }
    int v10 = objc_msgSend_stringWithUTF8String_(NSString, v8, input_blob_name);
    objc_msgSend_addObject_(v6, v11, (uint64_t)v10);
  }
  v12 = objc_msgSend_copy(v6, v8, 0);

  return v12;
}

- (BOOL)changeEspressoBatchSize:(unint64_t)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  objc_msgSend_setFinalBatchSize_(self, a2, a3);
  id v9 = objc_msgSend_requiredFeatures(self, v7, v8);
  unint64_t v12 = objc_msgSend_count(v9, v10, v11);
  sub_1BBC58304(v39, v12);
  sub_1BBC58304(v38, v12);
  sub_1BBC58304(v37, v12);
  sub_1BBC58304(v36, v12);
  sub_1BBC58304(v35, v12);
  sub_1BBC58304(v34, v12);
  int v15 = malloc_type_malloc(8 * v12, 0x10040436913F5uLL);
  if (v12)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v9, v13, i);
      id v17 = objc_claimAutoreleasedReturnValue();
      v15[i] = objc_msgSend_UTF8String(v17, v18, v19);
      objc_msgSend__getEspressoBlobShape_(self, v20, (uint64_t)v17);
      uint64_t v21 = *(unsigned char **)buf;
      **(void **)buf = a3;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      int v29 = 0;
      uint64_t v30 = 0;
      __p = 0;
      sub_1BBC583F8(&__p, v21, (uint64_t)v41, (v41 - v21) >> 3);
      nd_shape_to_5d_shape((uint64_t *)&__p, &v31);
      if (__p)
      {
        int v29 = __p;
        operator delete(__p);
      }
      *((_DWORD *)v39[0] + i) = v31;
      *((_DWORD *)v38[0] + i) = HIDWORD(v31);
      *((_DWORD *)v37[0] + i) = v32;
      *((_DWORD *)v36[0] + i) = HIDWORD(v32);
      *((_DWORD *)v35[0] + i) = v33;
      *((_DWORD *)v34[0] + i) = HIDWORD(v33);
      if (*(void *)buf)
      {
        v41 = *(unsigned char **)buf;
        operator delete(*(void **)buf);
      }
    }
  }
  objc_msgSend_espressoNet(self, v13, v14);
  int v26 = v35[0];
  v27 = v34[0];
  int v22 = espresso_network_change_input_blob_shapes_seq_rank();
  free(v15);
  if (v22)
  {
    int v23 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v22;
      _os_log_impl(&dword_1BBC44000, v23, OS_LOG_TYPE_ERROR, "Failed to change input shape with status: %d", buf, 8u);
    }

    objc_msgSend_setError_errorCode_(self, v24, (uint64_t)a4, 8016, v26, v27);
  }
  if (v34[0])
  {
    v34[1] = v34[0];
    operator delete(v34[0]);
  }
  if (v35[0])
  {
    v35[1] = v35[0];
    operator delete(v35[0]);
  }
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v37[0])
  {
    v37[1] = v37[0];
    operator delete(v37[0]);
  }
  if (v38[0])
  {
    v38[1] = v38[0];
    operator delete(v38[0]);
  }
  if (v39[0])
  {
    v39[1] = v39[0];
    operator delete(v39[0]);
  }

  return v22 == 0;
}

- (vector<unsigned)_getEspressoBlobShape:(APOdmlEspressoFacade *)self
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_msgSend_espressoNet(self, v7, v8);
  id v9 = v6;
  objc_msgSend_UTF8String(v9, v10, v11);
  espresso_network_query_blob_shape();
  sub_1BBC4BE98(retstr, 0);

  return result;
}

- (BOOL)finalizeEspressoPipeline:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_msgSend_espressoPlan(self, a2, (uint64_t)a3);
  int v5 = espresso_plan_build();
  if (v5)
  {
    int v6 = v5;
    id v7 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = v6;
      _os_log_impl(&dword_1BBC44000, v7, OS_LOG_TYPE_ERROR, "Build plan failed with status: %d", (uint8_t *)v10, 8u);
    }

    objc_msgSend_setError_errorCode_(self, v8, (uint64_t)a3, 8016);
    return 0;
  }
  else
  {
    return MEMORY[0x1F4181798](self, sel__prepareForTraining_, a3);
  }
}

- (BOOL)_prepareForTraining:(id *)a3
{
  int v5 = [APOdmlEspressoIOBufferController alloc];
  id v7 = (APOdmlEspressoIOBufferController *)objc_msgSend_initWithRequiredFeatures_recipe_(v5, v6, (uint64_t)self->_requiredFeatures, self->_recipe);
  bufferController = self->_bufferController;
  self->_bufferController = v7;

  char v10 = objc_msgSend_bindBuffersTo_error_(self->_bufferController, v9, (uint64_t)self->_espressoNet, a3);
  uint64_t v13 = objc_msgSend_setEspressoNetworkFunction(self, v11, v12);
  objc_msgSend__setErrorPtr_toError_(self, v14, (uint64_t)a3, v13);
  if (v13) {
    char v10 = 0;
  }

  return v10;
}

- (id)setEspressoNetworkFunction
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_msgSend_espressoNet(self, a2, v2);
  int v6 = objc_msgSend_recipe(self, v4, v5);
  objc_msgSend_functionInitName(v6, v7, v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v9, v10, v11);
  int v12 = espresso_network_set_function_name();

  if (v12)
  {
    int v15 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v26 = 67109120;
      int v27 = v12;
      _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "Failed to set subnetwork function name with status: %d", (uint8_t *)&v26, 8u);
    }
    uint64_t v16 = &kAPODMLDESPluginSubnetworkNameFail;
LABEL_13:

    v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v23, @"APODMLDESPluginErrorDomain", *v16, 0);
    goto LABEL_14;
  }
  objc_msgSend_espressoPlan(self, v13, v14);
  int v17 = espresso_plan_execute_sync();
  if (v17)
  {
    int v20 = v17;
    int v15 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v26 = 67109120;
      int v27 = v20;
      _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "Failed to execute sync with status: %d", (uint8_t *)&v26, 8u);
    }
    uint64_t v16 = &kAPODMLDESPluginExecuteSyncFail;
    goto LABEL_13;
  }
  objc_msgSend_espressoNet(self, v18, v19);
  get_main_function_name();
  int v21 = espresso_network_set_function_name();
  if (v21)
  {
    int v22 = v21;
    int v15 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v26 = 67109120;
      int v27 = v22;
      _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_ERROR, "Failed to set main function name with status: %d", (uint8_t *)&v26, 8u);
    }
    uint64_t v16 = &kAPODMLDESPluginMainFunctionNameFail;
    goto LABEL_13;
  }
  v24 = 0;
LABEL_14:

  return v24;
}

- (id)retrieveWeights:(id *)a3
{
  unint64_t v4 = 0;
  unint64_t v5 = 0;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  while (1)
  {
    int v6 = objc_msgSend_recipe(self, a2, (uint64_t)a3);
    id v9 = objc_msgSend_weightNames(v6, v7, v8);
    BOOL v12 = v4 < objc_msgSend_count(v9, v10, v11);

    if (!v12) {
      break;
    }
    int v15 = objc_msgSend_recipe(self, v13, v14);
    v18 = objc_msgSend_weightNames(v15, v16, v17);
    objc_msgSend_objectAtIndexedSubscript_(v18, v19, v4);
    id v20 = objc_claimAutoreleasedReturnValue();
    int v23 = (char *)objc_msgSend_UTF8String(v20, v21, v22);
    sub_1BBC58238(v94, v23);

    v24 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = objc_msgSend_bufferController(self, v25, v26);
      uint64_t v30 = objc_msgSend_weightBuffers(v27, v28, v29);
      uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v30, v31, v4);
      v35 = (float **)objc_msgSend_bufferPointer(v32, v33, v34);
      print_espresso_buffer((char *)v94, v35, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 136315138;
      v98 = p_p;
      _os_log_impl(&dword_1BBC44000, v24, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    v39 = objc_msgSend_bufferController(self, v37, v38);
    uint64_t v42 = objc_msgSend_weightBuffers(v39, v40, v41);
    v44 = objc_msgSend_objectAtIndexedSubscript_(v42, v43, v4);
    uint64_t v47 = objc_msgSend_bufferPointer(v44, v45, v46);
    uint64_t v49 = objc_msgSend_numWeightsInBuffer_(self, v48, v47);

    if (v96 < 0) {
      operator delete(*(void **)v94);
    }
    v5 += v49;
    ++v4;
  }
  if (v5)
  {
    v50 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14);
    LODWORD(__p.__r_.__value_.__l.__data_) = 0;
    sub_1BBC58474(v94, v5, &__p);
    for (unint64_t i = 0; ; ++i)
    {
      v54 = objc_msgSend_recipe(self, v51, v52);
      v57 = objc_msgSend_weightNames(v54, v55, v56);
      BOOL v60 = i < objc_msgSend_count(v57, v58, v59);

      if (!v60) {
        break;
      }
      v63 = objc_msgSend_bufferController(self, v61, v62);
      v66 = objc_msgSend_weightBuffers(v63, v64, v65);
      v68 = objc_msgSend_objectAtIndexedSubscript_(v66, v67, i);
      uint64_t v71 = objc_msgSend_bufferPointer(v68, v69, v70);
      uint64_t v73 = objc_msgSend_numWeightsInBuffer_(self, v72, v71);

      if (v73)
      {
        for (uint64_t j = 0; j != v73; ++j)
        {
          v75 = NSNumber;
          v76 = objc_msgSend_bufferController(self, v51, v52);
          v79 = objc_msgSend_weightBuffers(v76, v77, v78);
          v81 = objc_msgSend_objectAtIndexedSubscript_(v79, v80, i);
          LODWORD(v84) = *(_DWORD *)(*objc_msgSend_bufferPointer(v81, v82, v83) + 4 * j);
          v87 = objc_msgSend_numberWithFloat_(v75, v85, v86, v84);
          objc_msgSend_addObject_(v50, v88, (uint64_t)v87);
        }
      }
    }
    if (*(void *)v94)
    {
      v95 = *(void **)v94;
      operator delete(*(void **)v94);
    }
  }
  else
  {
    v89 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v94 = 0;
      _os_log_impl(&dword_1BBC44000, v89, OS_LOG_TYPE_ERROR, "Failed to find any weight.", v94, 2u);
    }

    objc_msgSend_setError_errorCode_(self, v90, (uint64_t)a3, 8029);
    v50 = 0;
  }

  return v50;
}

- (id)retrieveWeights2D:(id *)a3
{
  objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3);
  id v48 = (id)objc_claimAutoreleasedReturnValue();
  for (unint64_t i = 0; ; ++i)
  {
    id v7 = objc_msgSend_recipe(self, v4, v5);
    char v10 = objc_msgSend_weightNames(v7, v8, v9);
    unint64_t v13 = objc_msgSend_count(v10, v11, v12);

    if (i >= v13) {
      break;
    }
    uint64_t v16 = objc_msgSend_bufferController(self, v14, v15);
    uint64_t v19 = objc_msgSend_weightBuffers(v16, v17, v18);
    int v21 = objc_msgSend_objectAtIndexedSubscript_(v19, v20, i);
    uint64_t v24 = objc_msgSend_bufferPointer(v21, v22, v23);
    uint64_t v26 = objc_msgSend_numWeightsInBuffer_(self, v25, v24);

    uint64_t v31 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v27, v28);
    if (v26)
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        uint64_t v33 = NSNumber;
        uint64_t v34 = objc_msgSend_bufferController(self, v29, v30);
        v37 = objc_msgSend_weightBuffers(v34, v35, v36);
        v39 = objc_msgSend_objectAtIndexedSubscript_(v37, v38, i);
        LODWORD(v42) = *(_DWORD *)(*objc_msgSend_bufferPointer(v39, v40, v41) + 4 * j);
        v45 = objc_msgSend_numberWithFloat_(v33, v43, v44, v42);
        objc_msgSend_addObject_(v31, v46, (uint64_t)v45);
      }
    }
    objc_msgSend_addObject_(v48, v29, (uint64_t)v31);
  }

  return v48;
}

- (unint64_t)numWeightsInBuffer:(id *)a3
{
  unint64_t v4 = objc_msgSend_bufferController(self, a2, (uint64_t)a3);
  int v6 = v4;
  if (v4)
  {
    objc_msgSend_getEspressoBufferShape_(v4, v5, (uint64_t)a3);
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }

  uint64_t v7 = (char *)v16 - (char *)v15;
  if (v16 != v15)
  {
    unint64_t v8 = *v15;
    if ((unint64_t)v7 >= 9)
    {
      unint64_t v9 = v7 >> 3;
      if (v15[(v7 >> 3) - 1] >= 2)
      {
        if (v9 <= 2) {
          unint64_t v9 = 2;
        }
        unint64_t v10 = v9 - 1;
        uint64_t v11 = v15 + 1;
        do
        {
          unint64_t v13 = *v11++;
          uint64_t v12 = v13;
          if (v13 <= 1) {
            uint64_t v12 = 1;
          }
          v8 *= v12;
          --v10;
        }
        while (v10);
      }
    }
    goto LABEL_15;
  }
  unint64_t v8 = 0;
  if (v16) {
LABEL_15:
  }
    operator delete(v15);
  return v8;
}

- (id)computeClientPttr:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v9 = objc_msgSend_bufferController(self, v7, v8);
  **(_DWORD **)objc_msgSend_isTraining(v9, v10, v11) = 0;

  uint64_t v14 = objc_msgSend_bufferController(self, v12, v13);
  uint64_t v17 = objc_msgSend_copy(v6, v15, v16);
  uint64_t v20 = objc_msgSend_espressoNet(self, v18, v19);
  LOBYTE(a4) = objc_msgSend_setInputData_batchSize_network_reportMissingFeature_error_(v14, v21, (uint64_t)v17, 1, v20, 0, a4);

  if (a4)
  {
    objc_msgSend_espressoPlan(self, v22, v23);
    espresso_plan_execute_sync();
    uint64_t v26 = objc_msgSend_bufferController(self, v24, v25);
    uint64_t v29 = *(_DWORD **)objc_msgSend_pTTR(v26, v27, v28);

    LODWORD(v30) = *v29;
    uint64_t v33 = objc_msgSend_numberWithFloat_(NSNumber, v31, v32, v30);
    objc_msgSend__checkModelOutput_(self, v34, (uint64_t)v33);
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

- (void)_checkModelOutput:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  uint64_t v71 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v4, v5);
  objc_msgSend_setValue_forKey_(v71, v6, @"modelOutput", @"featureName");
  if (v72)
  {
    unint64_t v9 = objc_msgSend_stringValue(v72, v7, v8);
    objc_msgSend_setValue_forKey_(v71, v10, (uint64_t)v9, @"featureValue");

    uint64_t v13 = objc_msgSend_recipe(self, v11, v12);
    v68 = objc_msgSend_rangeBoundaryForOutput_(v13, v14, 0);

    uint64_t v17 = objc_msgSend_recipe(self, v15, v16);
    uint64_t v70 = objc_msgSend_rangeBoundaryForOutput_(v17, v18, 1);

    if (v68)
    {
      objc_msgSend_floatValue(v72, v19, v20);
      float v22 = v21;
      objc_msgSend_floatValue(v68, v23, v24);
      if (v22 < v25)
      {
        uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v19, @"APODMLDESPluginErrorDomain", 8040, 0);
        uint64_t v29 = objc_msgSend_copy(v71, v27, v28);
        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v30, (uint64_t)v26, v29);
      }
    }
    if (v70)
    {
      objc_msgSend_floatValue(v72, v19, v20);
      float v32 = v31;
      objc_msgSend_floatValue(v70, v33, v34);
      if (v32 > v35)
      {
        uint64_t v36 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v19, @"APODMLDESPluginErrorDomain", 8039, 0);
        v39 = objc_msgSend_copy(v71, v37, v38);
        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v40, (uint64_t)v36, v39);
      }
    }
    uint64_t v41 = objc_msgSend_recipe(self, v19, v20, v68);
    uint64_t v44 = objc_msgSend_sentinelValuesForOutput(v41, v42, v43);

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v45 = v44;
    uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v73, v77, 16);
    if (v49)
    {
      uint64_t v50 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v74 != v50) {
            objc_enumerationMutation(v45);
          }
          uint64_t v52 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          objc_msgSend_floatValue(v72, v47, v48);
          float v54 = v53;
          objc_msgSend_floatValue(v52, v55, v56);
          if (v54 == v57)
          {
            v58 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v47, @"APODMLDESPluginErrorDomain", 8041, 0);
            v61 = objc_msgSend_copy(v71, v59, v60);
            objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v62, (uint64_t)v58, v61);
          }
        }
        uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v73, v77, 16);
      }
      while (v49);
    }
  }
  else
  {
    v63 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v7, @"APODMLDESPluginErrorDomain", 8041, 0);
    v66 = objc_msgSend_copy(v71, v64, v65);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v67, (uint64_t)v63, v66);
  }
}

- (id)computeAccuracyAndLoss:(id)a3 error:(id *)a4
{
  v62[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v9 = objc_msgSend_bufferController(self, v7, v8);
  **(_DWORD **)objc_msgSend_isTraining(v9, v10, v11) = 0;

  unint64_t v14 = objc_msgSend_finalBatchSize(self, v12, v13);
  unint64_t v17 = objc_msgSend_count(v6, v15, v16);
  float v21 = 0.0;
  float v22 = 0.0;
  unint64_t v60 = v17 / v14;
  if (v14 > v17)
  {
LABEL_11:
    *(float *)&double v20 = v21 / (float)v60;
    uint64_t v52 = objc_msgSend_numberWithFloat_(NSNumber, v18, v19, v20);
    v62[0] = v52;
    *(float *)&double v53 = v22 / (float)v60;
    uint64_t v56 = objc_msgSend_numberWithFloat_(NSNumber, v54, v55, v53);
    v62[1] = v56;
    v58 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v57, (uint64_t)v62, 2);
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = v17 / v14;
    if (v60 <= 1) {
      uint64_t v25 = 1;
    }
    uint64_t v61 = v25;
    while (1)
    {
      int v27 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19);
      uint64_t v28 = v23;
      unint64_t v29 = v14;
      do
      {
        double v30 = objc_msgSend_objectAtIndexedSubscript_(v6, v26, v28);
        objc_msgSend_addObject_(v27, v31, (uint64_t)v30);

        ++v28;
        --v29;
      }
      while (v29);
      uint64_t v33 = objc_msgSend_bufferController(self, v26, v32);
      uint64_t v36 = objc_msgSend_copy(v27, v34, v35);
      uint64_t v39 = objc_msgSend_espressoNet(self, v37, v38);
      char v41 = objc_msgSend_setInputData_batchSize_network_reportMissingFeature_error_(v33, v40, (uint64_t)v36, v14, v39, 0, a4);

      if ((v41 & 1) == 0) {
        break;
      }
      objc_msgSend_espressoPlan(self, v42, v43);
      espresso_plan_execute_sync();
      objc_msgSend_accuracyInBatchWithError_(self, v44, (uint64_t)a4);
      float v48 = v47;
      if (a4)
      {
        if (*a4) {
          break;
        }
      }
      uint64_t v49 = objc_msgSend_bufferController(self, v45, v46);
      float v21 = v21 + v48;
      float v22 = v22 + **(float **)objc_msgSend_loss(v49, v50, v51);

      ++v24;
      v23 += v14;
      if (v24 == v61) {
        goto LABEL_11;
      }
    }

    v58 = 0;
  }

  return v58;
}

- (float)accuracyInBatchWithError:(id *)a3
{
  uint64_t v5 = objc_msgSend_bufferController(self, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_bufferController(self, v6, v7);
  uint64_t v11 = objc_msgSend_pTTR(v8, v9, v10);
  if (v5)
  {
    objc_msgSend_getEspressoBufferShape_(v5, v12, v11);
  }
  else
  {
    std::string __p = 0;
    uint64_t v52 = 0;
  }

  uint64_t v15 = objc_msgSend_bufferController(self, v13, v14);
  uint64_t v18 = objc_msgSend_inputBuffers(v15, v16, v17);
  double v20 = objc_msgSend_objectForKeyedSubscript_(v18, v19, @"Tapped");

  if (!v20)
  {
    uint64_t v23 = objc_msgSend_bufferController(self, v21, v22);
    uint64_t v26 = objc_msgSend_inputBuffers(v23, v24, v25);
    double v20 = objc_msgSend_objectForKeyedSubscript_(v26, v27, @"Tap");
  }
  double v30 = objc_msgSend_bufferPointer(v20, v21, v22);
  if (v30)
  {
    float v31 = 0.0;
    if ((unint64_t)(v52 - (void)__p) >= 0x10)
    {
      unint64_t v32 = *__p;
      if (*__p)
      {
        uint64_t v33 = 0;
        int v34 = 0;
        unint64_t v35 = __p[1];
        do
        {
          uint64_t v36 = objc_msgSend_bufferController(self, v28, v29);
          uint64_t v39 = (float *)(*objc_msgSend_pTTR(v36, v37, v38) + 4 * v33 * v35);

          if (v35 >= 2)
          {
            char v41 = v39 + 1;
            float v42 = *v39;
            uint64_t v43 = 4 * v35 - 4;
            v40 = v39;
            uint64_t v44 = v39 + 1;
            do
            {
              float v45 = *v44++;
              float v46 = v45;
              if (v42 < v45)
              {
                float v42 = v46;
                v40 = v41;
              }
              char v41 = v44;
              v43 -= 4;
            }
            while (v43);
          }
          else
          {
            v40 = v39;
          }
          if (((unint64_t)((char *)v40 - (char *)v39) >> 2) == llroundf(*(float *)(*v30 + 4 * v33))) {
            ++v34;
          }
          ++v33;
        }
        while (v33 != v32);
        float v47 = (float)v34;
      }
      else
      {
        float v47 = 0.0;
      }
      float v31 = v47 / (float)v32;
    }
  }
  else
  {
    float v48 = objc_msgSend_errorForFeatureNotBinded_(MEMORY[0x1E4F28C58], v28, @"Tapped");
    objc_msgSend__setErrorPtr_toError_(self, v49, (uint64_t)a3, v48);

    float v31 = 0.0;
  }

  if (__p) {
    operator delete(__p);
  }
  return v31;
}

- (BOOL)trainWithTrainingSet:(id)a3 error:(id *)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v4 = a3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v83, v93, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v84 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_logTrainingRowFeatures_(APOdmlLogUtility, v6, *(void *)(*((void *)&v83 + 1) + 8 * i));
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v83, v93, 16);
    }
    while (v7);
  }

  objc_msgSend__preTrainingSetup(self, v10, v11);
  unint64_t v81 = objc_msgSend_finalBatchSize(self, v12, v13);
  unint64_t v76 = objc_msgSend_count(v4, v14, v15);
  uint64_t v18 = objc_msgSend_recipe(self, v16, v17);
  float v21 = objc_msgSend_localIterationsCount(v18, v19, v20);
  unint64_t v74 = objc_msgSend_unsignedIntegerValue(v21, v22, v23);

  uint64_t v26 = objc_msgSend_mutableCopy(v4, v24, v25);
  objc_msgSend_printDESRecordRowOrder_iterationNumber_(APOdmlLogUtility, v27, (uint64_t)v26, &unk_1F15066B0);
  if (v74)
  {
    BOOL v75 = 0;
    uint64_t v30 = v76 / v81;
    if (v76 / v81 <= 1) {
      uint64_t v30 = 1;
    }
    uint64_t v77 = 0;
    uint64_t v78 = v30;
    uint64_t v31 = 1;
    while (1)
    {
      unint64_t v32 = objc_msgSend_recipe(self, v28, v29);
      unint64_t v35 = objc_msgSend_shouldShuffle(v32, v33, v34);
      int v38 = objc_msgSend_BOOLValue(v35, v36, v37);

      if (v38)
      {
        objc_msgSend_shuffle(v26, v28, v29);
        v40 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v39, v77);
        objc_msgSend_printDESRecordRowOrder_iterationNumber_(APOdmlLogUtility, v41, (uint64_t)v26, v40);
      }
      if (v81 <= v76) {
        break;
      }
      uint64_t v42 = v31;
LABEL_32:
      uint64_t v31 = v42;
      BOOL v75 = ++v77 >= v74;
      if (v77 == v74) {
        goto LABEL_33;
      }
    }
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    BOOL v46 = __ROR8__(0xCCCCCCCCCCCCCCCDLL * v77, 1) < 0x199999999999999AuLL || v77 == v74 - 1;
    BOOL v79 = v46;
    while (1)
    {
      float v48 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v28, v29);
      uint64_t v49 = v43;
      unint64_t v50 = v81;
      do
      {
        uint64_t v51 = objc_msgSend_objectAtIndexedSubscript_(v26, v47, v49);
        objc_msgSend_addObject_(v48, v52, (uint64_t)v51);

        ++v49;
        --v50;
      }
      while (v50);
      float v54 = objc_msgSend_bufferController(self, v47, v53);
      float v57 = objc_msgSend_copy(v48, v55, v56);
      uint64_t v60 = objc_msgSend_espressoNet(self, v58, v59);
      uint64_t v62 = objc_msgSend_setInputData_batchSize_network_reportMissingFeature_error_(v54, v61, (uint64_t)v57, v81, v60, v31 & 1, a4);

      if ((v62 & 1) == 0) {
        break;
      }
      int v67 = objc_msgSend__executeEspressoPlan(self, v63, v64);
      if (v67)
      {
        uint64_t v71 = OdmlLogForCategory(0xBuLL);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v88 = v77;
          __int16 v89 = 1024;
          LODWORD(v90) = v67;
          _os_log_impl(&dword_1BBC44000, v71, OS_LOG_TYPE_ERROR, "Failed to execute espresso plan for iter %zu due to %d.", buf, 0x12u);
        }

        objc_msgSend_setError_errorCode_(self, v72, (uint64_t)a4, 8027);
        break;
      }
      objc_msgSend__retrieveLossValue(self, v65, v66);
      if (v79)
      {
        float v69 = v68;
        uint64_t v70 = OdmlLogForCategory(0xBuLL);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          uint64_t v88 = v77;
          __int16 v89 = 2048;
          uint64_t v90 = v44;
          __int16 v91 = 2048;
          double v92 = v69;
          _os_log_impl(&dword_1BBC44000, v70, OS_LOG_TYPE_DEFAULT, "iter %04lu batch_num %04lu:\t loss = %f\n", buf, 0x20u);
        }
      }
      LOBYTE(v31) = 0;
      uint64_t v42 = 0;
      ++v44;
      v43 += v81;
      if (v44 == v78) {
        goto LABEL_32;
      }
    }
  }
  else
  {
LABEL_33:
    BOOL v75 = 1;
  }

  return v75;
}

- (float)_retrieveLossValue
{
  v3 = objc_msgSend_bufferController(self, a2, v2);
  float v6 = **(float **)objc_msgSend_loss(v3, v4, v5);

  return v6;
}

- (void)_preTrainingSetup
{
  objc_msgSend_recipe(self, a2, v2);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  float v6 = objc_msgSend_learningRate(v20, v4, v5);
  objc_msgSend_floatValue(v6, v7, v8);
  int v10 = v9;
  uint64_t v13 = objc_msgSend_bufferController(self, v11, v12);
  **(_DWORD **)objc_msgSend_learningRate(v13, v14, v15) = v10;

  objc_msgSend_bufferController(self, v16, v17);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  **(_DWORD **)objc_msgSend_isTraining(v21, v18, v19) = 1065353216;
}

- (int)_executeEspressoPlan
{
  objc_msgSend_espressoPlan(self, a2, v2);

  return espresso_plan_execute_sync();
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

- (BOOL)_setErrorPtr:(id *)a3 toError:(id)a4
{
  if (a3) {
    *a3 = a4;
  }
  return a3 != 0;
}

- (void)dealloc
{
  objc_msgSend_espressoPlan(self, a2, v2);
  espresso_plan_destroy();
  float v6 = objc_msgSend_espressoNet(self, v4, v5);
  free(v6);
  v7.receiver = self;
  v7.super_class = (Class)APOdmlEspressoFacade;
  [(APOdmlEspressoFacade *)&v7 dealloc];
}

- (NSArray)requiredFeatures
{
  return self->_requiredFeatures;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)espressoNet
{
  return self->_espressoNet;
}

- (void)espressoPlan
{
  return self->_espressoPlan;
}

- (APOdmlRecipe)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
}

- (APOdmlEspressoIOBufferController)bufferController
{
  return self->_bufferController;
}

- (void)setBufferController:(id)a3
{
}

- (unint64_t)finalBatchSize
{
  return self->_finalBatchSize;
}

- (void)setFinalBatchSize:(unint64_t)a3
{
  self->_finalBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferController, 0);
  objc_storeStrong((id *)&self->_recipe, 0);

  objc_storeStrong((id *)&self->_requiredFeatures, 0);
}

@end