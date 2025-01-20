@interface APOdmlEspressoIOBufferController
- ($FD4688982923A924290ECB669CAF1EC2)isTraining;
- ($FD4688982923A924290ECB669CAF1EC2)learningRate;
- ($FD4688982923A924290ECB669CAF1EC2)loss;
- ($FD4688982923A924290ECB669CAF1EC2)pTTR;
- (APOdmlEspressoIOBufferController)initWithRequiredFeatures:(id)a3 recipe:(id)a4;
- (APOdmlRecipe)recipe;
- (BOOL)_bindBuffer:(id *)a3 espressoNet:(id *)a4 bufferName:(id)a5 bufferType:(int)a6;
- (BOOL)_setError:(id *)a3 errorCode:(int64_t)a4;
- (BOOL)_setErrorPtr:(id *)a3 toError:(id)a4;
- (BOOL)bindBuffersTo:(id *)a3 error:(id *)a4;
- (BOOL)imputeFeature:(id)a3 network:(id *)a4 offsetIndex:(unint64_t)a5 error:(id *)a6;
- (BOOL)setFeatureDataForRow:(id)a3 offsetIndex:(unint64_t)a4 featureName:(id)a5 error:(id *)a6;
- (BOOL)setInputData:(id)a3 batchSize:(unint64_t)a4 network:(id *)a5 reportMissingFeature:(BOOL)a6 error:(id *)a7;
- (NSArray)weightBuffers;
- (NSDictionary)inputBuffers;
- (vector<unsigned)getEspressoBufferShape:(APOdmlEspressoIOBufferController *)self;
- (void)dealloc;
- (void)reportMissingFeatureError:(id)a3;
@end

@implementation APOdmlEspressoIOBufferController

- (APOdmlEspressoIOBufferController)initWithRequiredFeatures:(id)a3 recipe:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v42 = a4;
  v47.receiver = self;
  v47.super_class = (Class)APOdmlEspressoIOBufferController;
  v7 = [(APOdmlEspressoIOBufferController *)&v47 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_recipe, a4);
    v8->_pTTR = ($FD4688982923A924290ECB669CAF1EC2 *)malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
    v8->_loss = ($FD4688982923A924290ECB669CAF1EC2 *)malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
    v8->_isTraining = ($FD4688982923A924290ECB669CAF1EC2 *)malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
    v8->_learningRate = ($FD4688982923A924290ECB669CAF1EC2 *)malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
    v11 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v12 = v6;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v43, v48, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v44;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v43 + 1) + 8 * v16);
          v18 = malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
          v20 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], v19, (uint64_t)v18);
          objc_msgSend_setObject_forKeyedSubscript_(v11, v21, (uint64_t)v20, v17);

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v22, (uint64_t)&v43, v48, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)&v8->_inputBuffers, v11);
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v23, v24);
    v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
    for (unint64_t i = 0; ; ++i)
    {
      v29 = objc_msgSend_recipe(v8, v25, v26);
      v32 = objc_msgSend_weightNames(v29, v30, v31);
      BOOL v35 = i < objc_msgSend_count(v32, v33, v34);

      if (!v35) {
        break;
      }
      v36 = malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
      v38 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], v37, (uint64_t)v36);
      objc_msgSend_addObject_(v27, v39, (uint64_t)v38);
    }
    weightBuffers = v8->_weightBuffers;
    v8->_weightBuffers = v27;
  }
  return v8;
}

- (BOOL)bindBuffersTo:(id *)a3 error:(id *)a4
{
  v87 = a4;
  unint64_t v5 = 0;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  while (1)
  {
    id v6 = objc_msgSend_recipe(self, a2, (uint64_t)a3, v87);
    v9 = objc_msgSend_weightNames(v6, v7, v8);
    unint64_t v12 = objc_msgSend_count(v9, v10, v11);

    if (v5 >= v12) {
      break;
    }
    uint64_t v15 = objc_msgSend_recipe(self, v13, v14);
    v18 = objc_msgSend_weightNames(v15, v16, v17);
    objc_msgSend_objectAtIndexedSubscript_(v18, v19, v5);
    id v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v20, v21, v22);
    v25 = objc_msgSend_weightBuffers(self, v23, v24);
    v27 = objc_msgSend_objectAtIndexedSubscript_(v25, v26, v5);
    objc_msgSend_bufferPointer(v27, v28, v29);
    int v30 = espresso_network_bind_buffer_to_global();

    ++v5;
    if (v30)
    {
      uint64_t v31 = OdmlLogForCategory(0xBuLL);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v95 = v30;
        _os_log_impl(&dword_1BBC44000, v31, OS_LOG_TYPE_ERROR, "Failed initialize weights with status: %d", buf, 8u);
      }

      if (v87)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v32, @"APODMLDESPluginErrorDomain", 8025, 0);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        BOOL result = 0;
        id *v87 = v33;
        return result;
      }
      return 0;
    }
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  BOOL v35 = objc_msgSend_inputBuffers(self, v13, v14);
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v89, v93, 16);
  if (v39)
  {
    uint64_t v40 = *(void *)v90;
    while (2)
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v90 != v40) {
          objc_enumerationMutation(v35);
        }
        uint64_t v42 = *(void *)(*((void *)&v89 + 1) + 8 * i);
        long long v43 = objc_msgSend_inputBuffers(self, v37, v38);
        long long v45 = objc_msgSend_objectForKeyedSubscript_(v43, v44, v42);
        uint64_t v48 = objc_msgSend_bufferPointer(v45, v46, v47);

        if ((objc_msgSend__bindBuffer_espressoNet_bufferName_bufferType_(self, v49, v48, a3, v42, 0) & 1) == 0)
        {
          v85 = objc_msgSend_errorForFeatureNotBinded_(MEMORY[0x1E4F28C58], v37, v42);
          objc_msgSend__setErrorPtr_toError_(self, v86, (uint64_t)v87, v85);

          return 0;
        }
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v37, (uint64_t)&v89, v93, 16);
      if (v39) {
        continue;
      }
      break;
    }
  }

  uint64_t v52 = objc_msgSend_pTTR(self, v50, v51);
  if (objc_msgSend__bindBuffer_espressoNet_bufferName_bufferType_(self, v53, v52, a3, @"pTTR", 1))
  {
    uint64_t v56 = objc_msgSend_loss(self, v54, v55);
    v59 = objc_msgSend_recipe(self, v57, v58);
    v62 = objc_msgSend_lossName(v59, v60, v61);
    LOBYTE(v56) = objc_msgSend__bindBuffer_espressoNet_bufferName_bufferType_(self, v63, v56, a3, v62, 1);

    if (v56)
    {
      uint64_t isTraining = objc_msgSend_isTraining(self, v64, v65);
      v69 = objc_msgSend_recipe(self, v67, v68);
      v72 = objc_msgSend_isTrainingName(v69, v70, v71);
      LOBYTE(isTraining) = objc_msgSend__bindBuffer_espressoNet_bufferName_bufferType_(self, v73, isTraining, a3, v72, 2);

      if (isTraining)
      {
        uint64_t v76 = objc_msgSend_learningRate(self, v74, v75);
        v79 = objc_msgSend_recipe(self, v77, v78);
        v82 = objc_msgSend_learningRateName(v79, v80, v81);
        LOBYTE(v76) = objc_msgSend__bindBuffer_espressoNet_bufferName_bufferType_(self, v83, v76, a3, v82, 2);

        if (v76) {
          return 1;
        }
        objc_msgSend__setError_errorCode_(self, v84, (uint64_t)v87, 8024);
      }
      else
      {
        objc_msgSend__setError_errorCode_(self, v74, (uint64_t)v87, 8023);
      }
    }
    else
    {
      objc_msgSend__setError_errorCode_(self, v64, (uint64_t)v87, 8022);
    }
  }
  else
  {
    objc_msgSend__setError_errorCode_(self, v54, (uint64_t)v87, 8021);
  }
  return 0;
}

- (BOOL)_bindBuffer:(id *)a3 espressoNet:(id *)a4 bufferName:(id)a5 bufferType:(int)a6
{
  id v7 = a5;
  objc_msgSend_UTF8String(v7, v8, v9);
  if (a6 < 2)
  {
    int v10 = espresso_network_bind_buffer();
  }
  else if (a6 == 2)
  {
    int v10 = espresso_network_bind_buffer_to_global();
  }
  else
  {
    int v10 = -1;
  }
  BOOL v11 = v10 == 0;

  return v11;
}

- (BOOL)setInputData:(id)a3 batchSize:(unint64_t)a4 network:(id *)a5 reportMissingFeature:(BOOL)a6 error:(id *)a7
{
  BOOL v36 = a6;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  unint64_t v33 = a4;
  if (a4)
  {
    BOOL v34 = 0;
    uint64_t v12 = 0;
    long long v13 = 0uLL;
    do
    {
      long long v41 = v13;
      long long v42 = v13;
      long long v39 = v13;
      long long v40 = v13;
      uint64_t v14 = objc_msgSend_inputBuffers(self, v9, v10, v33);
      id obj = v14;
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v39, v43, 16);
      if (v17)
      {
        uint64_t v18 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v40 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            v21 = objc_msgSend_objectAtIndexedSubscript_(v11, v16, v12);
            uint64_t v24 = objc_msgSend_features(v21, v22, v23);
            uint64_t v26 = objc_msgSend_objectForKey_(v24, v25, v20);
            BOOL v27 = v26 == 0;

            if (v27)
            {
              if (v36) {
                objc_msgSend_reportMissingFeatureError_(self, v28, v20);
              }
              if (!objc_msgSend_imputeFeature_network_offsetIndex_error_(self, v28, v20, a5, v12, a7))
              {
LABEL_18:

                goto LABEL_19;
              }
            }
            else
            {
              uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(v11, v28, v12);
              char v31 = objc_msgSend_setFeatureDataForRow_offsetIndex_featureName_error_(self, v30, (uint64_t)v29, v12, v20, a7);

              if ((v31 & 1) == 0) {
                goto LABEL_18;
              }
            }
          }
          uint64_t v14 = obj;
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v39, v43, 16);
          if (v17) {
            continue;
          }
          break;
        }
      }

      BOOL v34 = ++v12 >= v33;
      long long v13 = 0uLL;
    }
    while (v12 != v33);
  }
  BOOL v34 = 1;
LABEL_19:

  return v34;
}

- (BOOL)imputeFeature:(id)a3 network:(id *)a4 offsetIndex:(unint64_t)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v12 = objc_msgSend_inputBuffers(self, v10, v11);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v9);
  uint64_t v17 = (uint64_t *)objc_msgSend_bufferPointer(v14, v15, v16);

  objc_msgSend_getEspressoBufferShape_(self, v18, (uint64_t)v17);
  uint64_t v19 = *(void *)(v28 - 8);
  if (v19)
  {
    uint64_t v20 = __p;
    uint64_t v21 = *v17;
    if (v19 == 1) {
      *(_DWORD *)(v21 + 4 * a5) = 2143289344;
    }
    else {
      memset_pattern16((void *)(v21 + 4 * v19 * a5), &unk_1BBC74100, 4 * v19);
    }
LABEL_9:
    operator delete(v20);
    goto LABEL_10;
  }
  uint64_t v22 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v9;
    _os_log_impl(&dword_1BBC44000, v22, OS_LOG_TYPE_ERROR, "Unable to resolve feature name %@", buf, 0xCu);
  }

  uint64_t v24 = objc_msgSend_errorForFeatureNotFound_(MEMORY[0x1E4F28C58], v23, (uint64_t)v9);
  objc_msgSend__setErrorPtr_toError_(self, v25, (uint64_t)a6, v24);

  uint64_t v20 = __p;
  if (__p) {
    goto LABEL_9;
  }
LABEL_10:

  return v19 != 0;
}

- (BOOL)setFeatureDataForRow:(id)a3 offsetIndex:(unint64_t)a4 featureName:(id)a5 error:(id *)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v14 = objc_msgSend_features(v10, v12, v13);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v11);
  unint64_t v19 = objc_msgSend_count(v16, v17, v18);

  if (v19)
  {
    uint64_t v22 = objc_msgSend_inputBuffers(self, v20, v21);
    uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)v11);
    BOOL v27 = objc_msgSend_bufferPointer(v24, v25, v26);
    unint64_t v61 = a4;

    objc_msgSend_getEspressoBufferShape_(self, v28, (uint64_t)v27);
    uint64_t v31 = *(void *)(v64 - 8);
    BOOL v32 = v19 == v31;
    if (v19 == v31)
    {
      if (v19 >= 2)
      {
        uint64_t v33 = 0;
        uint64_t v34 = 4 * v19 * v61;
        do
        {
          BOOL v35 = objc_msgSend_features(v10, v29, v30, v61);
          v37 = objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)v11);
          long long v39 = objc_msgSend_objectAtIndexedSubscript_(v37, v38, v33);

          objc_msgSend_floatValue(v39, v40, v41);
          *(_DWORD *)(*v27 + v34 + 4 * v33) = v42;

          ++v33;
        }
        while (v19 != v33);
LABEL_16:
        if (__p) {
          operator delete(__p);
        }
        goto LABEL_18;
      }
      long long v43 = objc_msgSend_features(v10, v29, v30, v61);
      long long v45 = objc_msgSend_objectForKeyedSubscript_(v43, v44, (uint64_t)v11);
      uint64_t v48 = objc_msgSend_firstObject(v45, v46, v47);

      objc_msgSend_floatValue(v48, v49, v50);
      *(_DWORD *)(*v27 + 4 * v62) = v51;
    }
    else
    {
      uint64_t v56 = OdmlLogForCategory(0xBuLL);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v66 = v11;
        __int16 v67 = 2048;
        unint64_t v68 = v19;
        __int16 v69 = 2048;
        uint64_t v70 = v31;
        _os_log_impl(&dword_1BBC44000, v56, OS_LOG_TYPE_ERROR, "Device has feature %@ with size %lu but model expects size %lu", buf, 0x20u);
      }

      uint64_t v48 = objc_msgSend_errorForFeatureShapeMismatch_(MEMORY[0x1E4F28C58], v58, (uint64_t)v11);
      objc_msgSend__setErrorPtr_toError_(self, v59, (uint64_t)a6, v48);
    }

    goto LABEL_16;
  }
  uint64_t v52 = OdmlLogForCategory(0xBuLL);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v66 = v11;
    _os_log_impl(&dword_1BBC44000, v52, OS_LOG_TYPE_ERROR, "Unable to resolve feature name %@", buf, 0xCu);
  }

  v54 = objc_msgSend_errorForFeatureNotFound_(MEMORY[0x1E4F28C58], v53, (uint64_t)v11);
  objc_msgSend__setErrorPtr_toError_(self, v55, (uint64_t)a6, v54);

  BOOL v32 = 0;
LABEL_18:

  return v32;
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

- (BOOL)_setErrorPtr:(id *)a3 toError:(id)a4
{
  if (a3) {
    *a3 = a4;
  }
  return a3 != 0;
}

- (void)reportMissingFeatureError:(id)a3
{
  id v13 = a3;
  v4 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v3, @"APODMLDESPluginErrorDomain", 8038, 0);
  id v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v5, v6);
  objc_msgSend_setValue_forKey_(v7, v8, (uint64_t)v13, @"featureName");
  id v11 = objc_msgSend_copy(v7, v9, v10);
  objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v12, (uint64_t)v4, v11);
}

- (void)dealloc
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_pTTR(self, a2, v2);
  free(v4);
  id v7 = objc_msgSend_loss(self, v5, v6);
  free(v7);
  uint64_t isTraining = objc_msgSend_isTraining(self, v8, v9);
  free(isTraining);
  id v13 = objc_msgSend_learningRate(self, v11, v12);
  free(v13);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v16 = objc_msgSend_weightBuffers(self, v14, v15);
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v31, v35, 16);
  if (v20)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v16);
        }
        uint64_t v23 = objc_msgSend_bufferPointer(*(void **)(*((void *)&v31 + 1) + 8 * v22), v18, v19);
        if (v23)
        {
          free(v23);
        }
        else
        {
          uint64_t v24 = OdmlLogForCategory(0xBuLL);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBC44000, v24, OS_LOG_TYPE_ERROR, "Weight buffer is released too early.", buf, 2u);
          }
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v31, v35, 16);
    }
    while (v20);
  }

  BOOL v27 = objc_msgSend_inputBuffers(self, v25, v26);
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v27, v28, (uint64_t)&unk_1F14FE738);

  v29.receiver = self;
  v29.super_class = (Class)APOdmlEspressoIOBufferController;
  [(APOdmlEspressoIOBufferController *)&v29 dealloc];
}

- (vector<unsigned)getEspressoBufferShape:(APOdmlEspressoIOBufferController *)self
{
  return (vector<unsigned long, std::allocator<unsigned long>> *)sub_1BBC4BE98(retstr, 0);
}

- (NSDictionary)inputBuffers
{
  return self->_inputBuffers;
}

- ($FD4688982923A924290ECB669CAF1EC2)pTTR
{
  return self->_pTTR;
}

- ($FD4688982923A924290ECB669CAF1EC2)loss
{
  return self->_loss;
}

- ($FD4688982923A924290ECB669CAF1EC2)isTraining
{
  return self->_isTraining;
}

- ($FD4688982923A924290ECB669CAF1EC2)learningRate
{
  return self->_learningRate;
}

- (NSArray)weightBuffers
{
  return self->_weightBuffers;
}

- (APOdmlRecipe)recipe
{
  return self->_recipe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_weightBuffers, 0);

  objc_storeStrong((id *)&self->_inputBuffers, 0);
}

@end