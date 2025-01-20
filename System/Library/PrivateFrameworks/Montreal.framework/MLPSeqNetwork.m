@interface MLPSeqNetwork
- (MLPLearningRateDecayHandler)seqLearningRateDecayHandler;
- (MLPSeqNetwork)initWithLayers:(id)a3;
- (float)computeLoss:(id)a3;
- (id)computeInference:(id)a3;
- (unint64_t)runInference:(id)a3 databatch:(id)a4 inferredResult:(id)a5 semaphore:(id)a6;
- (void)createLayerKernels;
- (void)decayHandler:(id)a3 didUpdateLearningRate:(float)a4;
- (void)runTraining:(id)a3 databatch:(id)a4 iteration:(unint64_t)a5 lossCallback:(id)a6 semaphore:(id)a7;
- (void)setOptimizerParams:(id)a3;
- (void)setSeqLearningRateDecayHandler:(id)a3;
@end

@implementation MLPSeqNetwork

- (MLPSeqNetwork)initWithLayers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MLPSeqNetwork;
  return [(MLPNetwork *)&v4 initWithNetworkType:2 layers:a3];
}

- (void)setOptimizerParams:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v8 = objc_msgSend_options(self, v4, v5, v6);
    v11 = objc_msgSend_exMRL_stringForKey_(v8, v9, (uint64_t)MLPModelTrainerOptimizerAlgorithmKey, v10);

    if (v11)
    {
      if (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)MLPModelTrainerOptimizerAdam, v14)) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = 2;
      }
    }
    else
    {
      uint64_t v15 = 2;
    }
    v16 = objc_msgSend_options(self, v12, v13, v14);
    v19 = objc_msgSend_exMRL_numberForKey_(v16, v17, (uint64_t)MLPModelTrainerLearningRateKey, v18);
    objc_msgSend_floatValue(v19, v20, v21, v22);
    int v24 = v23;

    v28 = objc_msgSend_options(self, v25, v26, v27);
    v31 = objc_msgSend_exMRL_numberForKey_(v28, v29, (uint64_t)MLPModelTrainerOptimizerMomentumKey, v30);
    objc_msgSend_floatValue(v31, v32, v33, v34);
    int v36 = v35;

    v40 = objc_msgSend_options(self, v37, v38, v39);
    v43 = objc_msgSend_exMRL_numberForKey_(v40, v41, (uint64_t)MLPModelTrainerGradientClipMinimum, v42);

    v47 = objc_msgSend_options(self, v44, v45, v46);
    v50 = objc_msgSend_exMRL_numberForKey_(v47, v48, (uint64_t)MLPModelTrainerGradientClipMaximum, v49);

    v51 = [MontrealNNModelOptimizerParam alloc];
    LODWORD(v52) = v24;
    LODWORD(v53) = v36;
    id v7 = (id)objc_msgSend_initWithOptimizerType_learningRate_momentum_gradientClipMin_gradientClipMax_(v51, v54, v15, (uint64_t)v43, v50, v52, v53);
  }
  v55.receiver = self;
  v55.super_class = (Class)MLPSeqNetwork;
  [(MLPNetwork *)&v55 setOptimizerParams:v7];
}

- (void)createLayerKernels
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v5 = objc_msgSend_layers(self, a2, v2, v3, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v76, (uint64_t)v80, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v77 != v11) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_createKernel(*(void **)(*((void *)&v76 + 1) + 8 * i), v7, v8, v9);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v76, (uint64_t)v80, 16);
    }
    while (v10);
  }

  v16 = objc_msgSend_optimizerParams(self, v13, v14, v15);
  BOOL v20 = objc_msgSend_optimizerType(v16, v17, v18, v19) == 2;

  if (v20)
  {
    int v24 = objc_msgSend_options(self, v21, v22, v23);
    uint64_t v27 = objc_msgSend_exMRL_numberForKey_(v24, v25, (uint64_t)MLPModelTrainerLearningRateDecayRateKey, v26);

    objc_msgSend_floatValue(v27, v28, v29, v30);
    if (v34 < 0.0)
    {
LABEL_18:

      return;
    }
    int v35 = objc_msgSend_options(self, v31, v32, v33);
    uint64_t v38 = objc_msgSend_exMRL_numberForKey_(v35, v36, (uint64_t)MLPModelTrainerLearningRateDecayStepsKey, v37);

    uint64_t v42 = objc_msgSend_options(self, v39, v40, v41);
    uint64_t v45 = objc_msgSend_exMRL_numberForKey_(v42, v43, (uint64_t)MLPModelTrainerLearningRateDecayRateKey, v44);

    uint64_t v49 = objc_msgSend_options(self, v46, v47, v48);
    double v52 = objc_msgSend_exMRL_numberForKey_(v49, v50, (uint64_t)MLPModelTrainerLearningRateDecayStairCaseKey, v51);

    if (v38)
    {
      uint64_t v56 = objc_msgSend_unsignedIntegerValue(v38, v53, v54, v55);
      if (v45) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v56 = 1000;
      if (v45)
      {
LABEL_12:
        objc_msgSend_floatValue(v45, v53, v54, v55);
        if (v52)
        {
LABEL_13:
          uint64_t v57 = objc_msgSend_BOOLValue(v52, v53, v54, v55);
LABEL_17:
          v58 = [MLPLearningRateDecayHandler alloc];
          v62 = objc_msgSend_optimizerParams(self, v59, v60, v61);
          objc_msgSend_learningRate(v62, v63, v64, v65);
          v67 = objc_msgSend_initWithLearningRate_decaySteps_decayRate_stairCase_(v58, v66, v56, v57);
          objc_msgSend_setSeqLearningRateDecayHandler_(self, v68, (uint64_t)v67, v69);

          v73 = objc_msgSend_seqLearningRateDecayHandler(self, v70, v71, v72);
          objc_msgSend_setDelegate_(v73, v74, (uint64_t)self, v75);

          goto LABEL_18;
        }
LABEL_16:
        uint64_t v57 = 1;
        goto LABEL_17;
      }
    }
    if (v52) {
      goto LABEL_13;
    }
    goto LABEL_16;
  }
}

- (void)runTraining:(id)a3 databatch:(id)a4 iteration:(unint64_t)a5 lossCallback:(id)a6 semaphore:(id)a7
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v95 = a6;
  id v96 = a7;
  id v13 = v12;
  BOOL v20 = objc_msgSend_matrix(v13, v14, v15, v16);
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v22 = objc_msgSend_layers(self, v17, v18, v19);
    unint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (i >= v26) {
      break;
    }
    uint64_t v30 = (void *)MEMORY[0x19F3BC1E0]();
    float v34 = objc_msgSend_layers(self, v31, v32, v33);
    uint64_t v37 = objc_msgSend_objectAtIndexedSubscript_(v34, v35, i, v36);

    uint64_t v39 = objc_msgSend_seqForward_input_dataBatch_runInference_(v37, v38, (uint64_t)v11, (uint64_t)v20, v13, 0);

    BOOL v20 = (void *)v39;
  }
  objc_msgSend_combinedLossLabels(v13, v27, v28, v29);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  v97 = long long v110 = 0u;
  v43 = objc_msgSend_largeReductionSumResult(v97, v40, v41, v42);
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v109, (uint64_t)v114, 16);
  if (v47)
  {
    uint64_t v48 = *(void *)v110;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v110 != v48) {
          objc_enumerationMutation(v43);
        }
        objc_msgSend_synchronizeOnCommandBuffer_(*(void **)(*((void *)&v109 + 1) + 8 * v49++), v45, (uint64_t)v11, v46);
      }
      while (v47 != v49);
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v45, (uint64_t)&v109, (uint64_t)v114, 16);
    }
    while (v47);
  }

  long long v108 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v105 = 0u;
  double v53 = objc_msgSend_smallReductionSumResult(v97, v50, v51, v52);
  uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v105, (uint64_t)v113, 16);
  if (v57)
  {
    uint64_t v58 = *(void *)v106;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v106 != v58) {
          objc_enumerationMutation(v53);
        }
        objc_msgSend_synchronizeOnCommandBuffer_(*(void **)(*((void *)&v105 + 1) + 8 * v59++), v55, (uint64_t)v11, v56);
      }
      while (v57 != v59);
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v55, (uint64_t)&v105, (uint64_t)v113, 16);
    }
    while (v57);
  }

  unint64_t v63 = 0;
  for (uint64_t j = -1; ; --j)
  {
    uint64_t v65 = objc_msgSend_layers(self, v60, v61, v62);
    BOOL v69 = v63 < objc_msgSend_count(v65, v66, v67, v68);

    if (!v69) {
      break;
    }
    v70 = (void *)MEMORY[0x19F3BC1E0]();
    v74 = objc_msgSend_layers(self, v71, v72, v73);
    uint64_t v78 = objc_msgSend_count(v74, v75, v76, v77);

    v82 = objc_msgSend_layers(self, v79, v80, v81);
    v85 = objc_msgSend_objectAtIndexedSubscript_(v82, v83, j + v78, v84);

    uint64_t v87 = objc_msgSend_seqBackward_dataBatch_inputGradient_(v85, v86, (uint64_t)v11, (uint64_t)v13, v20);

    ++v63;
    BOOL v20 = (void *)v87;
  }
  objc_initWeak(&location, self);
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = sub_19E26103C;
  v98[3] = &unk_1E599D110;
  objc_copyWeak(v103, &location);
  id v88 = v97;
  id v99 = v88;
  id v89 = v13;
  id v100 = v89;
  id v90 = v95;
  id v102 = v90;
  v103[1] = (id)a5;
  id v91 = v96;
  id v101 = v91;
  objc_msgSend_addCompletedHandler_(v11, v92, (uint64_t)v98, v93);

  objc_destroyWeak(v103);
  objc_destroyWeak(&location);
}

- (float)computeLoss:(id)a3
{
  float v16 = 0.0;
  objc_super v4 = objc_msgSend_combinedLossLabels(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_largeReductionSumResult(v4, v5, v6, v7, &v16);
  sub_19E261214(&v15, v8, 0x20uLL);

  id v12 = objc_msgSend_smallReductionSumResult(v4, v9, v10, v11);
  sub_19E261214(&v15, v12, 1uLL);

  float v13 = v16;
  return v13;
}

- (unint64_t)runInference:(id)a3 databatch:(id)a4 inferredResult:(id)a5 semaphore:(id)a6
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v96 = a5;
  id v97 = a6;
  id v12 = v11;
  uint64_t v19 = objc_msgSend_matrix(v12, v13, v14, v15);
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v21 = objc_msgSend_layers(self, v16, v17, v18, v96);
    unint64_t v25 = objc_msgSend_count(v21, v22, v23, v24);

    if (i >= v25) {
      break;
    }
    unint64_t v26 = (void *)MEMORY[0x19F3BC1E0]();
    uint64_t v30 = objc_msgSend_layers(self, v27, v28, v29);
    uint64_t v33 = objc_msgSend_objectAtIndexedSubscript_(v30, v31, i, v32);

    uint64_t v35 = objc_msgSend_seqForward_input_dataBatch_runInference_(v33, v34, (uint64_t)v10, (uint64_t)v19, v12, 1);

    uint64_t v19 = (void *)v35;
  }
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v36 = v19;
  uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v115, (uint64_t)v121, 16);
  if (v38)
  {
    uint64_t v39 = *(void *)v116;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v116 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void **)(*((void *)&v115 + 1) + 8 * v40);
        uint64_t v42 = (void *)MEMORY[0x19F3BC1E0]();
        uint64_t v46 = objc_msgSend_deviceHandler(self, v43, v44, v45);
        v50 = objc_msgSend_data(v41, v47, v48, v49);
        objc_msgSend_importDataFromGPU_cmdBuf_(v46, v51, (uint64_t)v50, (uint64_t)v10);

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v52, (uint64_t)&v115, (uint64_t)v121, 16);
    }
    while (v38);
  }

  objc_msgSend_combinedLossLabels(v12, v53, v54, v55);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  v98 = long long v112 = 0u;
  uint64_t v59 = objc_msgSend_largeReductionSumResult(v98, v56, v57, v58);
  uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v111, (uint64_t)v120, 16);
  if (v63)
  {
    uint64_t v64 = *(void *)v112;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v112 != v64) {
          objc_enumerationMutation(v59);
        }
        objc_msgSend_synchronizeOnCommandBuffer_(*(void **)(*((void *)&v111 + 1) + 8 * v65++), v61, (uint64_t)v10, v62);
      }
      while (v63 != v65);
      uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v61, (uint64_t)&v111, (uint64_t)v120, 16);
    }
    while (v63);
  }

  long long v110 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v107 = 0u;
  BOOL v69 = objc_msgSend_smallReductionSumResult(v98, v66, v67, v68);
  uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v107, (uint64_t)v119, 16);
  if (v73)
  {
    uint64_t v74 = *(void *)v108;
    do
    {
      uint64_t v75 = 0;
      do
      {
        if (*(void *)v108 != v74) {
          objc_enumerationMutation(v69);
        }
        objc_msgSend_synchronizeOnCommandBuffer_(*(void **)(*((void *)&v107 + 1) + 8 * v75++), v71, (uint64_t)v10, v72);
      }
      while (v73 != v75);
      uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v71, (uint64_t)&v107, (uint64_t)v119, 16);
    }
    while (v73);
  }

  long long v79 = objc_msgSend_layers(self, v76, v77, v78);
  v83 = objc_msgSend_lastObject(v79, v80, v81, v82);

  objc_initWeak(&location, self);
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = sub_19E261B68;
  v99[3] = &unk_1E599D138;
  objc_copyWeak(&v105, &location);
  id v84 = v36;
  id v100 = v84;
  id v85 = v12;
  id v101 = v85;
  id v86 = v83;
  id v102 = v86;
  id v87 = v96;
  id v103 = v87;
  id v88 = v97;
  id v104 = v88;
  objc_msgSend_addCompletedHandler_(v10, v89, (uint64_t)v99, v90);
  unint64_t v94 = objc_msgSend_labelsCount(v85, v91, v92, v93);

  objc_destroyWeak(&v105);
  objc_destroyWeak(&location);

  return v94;
}

- (id)computeInference:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v84 = a3;
  uint64_t v7 = objc_msgSend_deviceHandler(self, v4, v5, v6);
  uint64_t v82 = objc_msgSend_device(v7, v8, v9, v10);

  uint64_t v14 = objc_msgSend_deviceHandler(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_commandQueue(v14, v15, v16, v17);

  v83 = (void *)v18;
  uint64_t v21 = objc_msgSend_commandBufferFromCommandQueue_(MEMORY[0x1E4F35520], v19, v18, v20);
  uint64_t v23 = objc_msgSend_dataBatch_batchSize_network_(MLPDataBatch, v22, (uint64_t)v84, 1, self);
  uint64_t v30 = objc_msgSend_matrix(v23, v24, v25, v26);
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v32 = objc_msgSend_layers(self, v27, v28, v29, v82);
    unint64_t v36 = objc_msgSend_count(v32, v33, v34, v35);

    if (i >= v36) {
      break;
    }
    uint64_t v40 = objc_msgSend_layers(self, v37, v38, v39);
    v43 = objc_msgSend_objectAtIndexedSubscript_(v40, v41, i, v42);

    uint64_t v45 = objc_msgSend_seqForward_input_dataBatch_runInference_(v43, v44, (uint64_t)v21, (uint64_t)v30, v23, 1);

    uint64_t v30 = (void *)v45;
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v46 = v30;
  uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v99, (uint64_t)v103, 16);
  if (v51)
  {
    uint64_t v52 = *(void *)v100;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v100 != v52) {
          objc_enumerationMutation(v46);
        }
        uint64_t v54 = *(void **)(*((void *)&v99 + 1) + 8 * j);
        uint64_t v55 = objc_msgSend_deviceHandler(self, v48, v49, v50);
        uint64_t v59 = objc_msgSend_data(v54, v56, v57, v58);
        objc_msgSend_importDataFromGPU_cmdBuf_(v55, v60, (uint64_t)v59, (uint64_t)v21);
      }
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v99, (uint64_t)v103, 16);
    }
    while (v51);
  }

  uint64_t v64 = objc_msgSend_layers(self, v61, v62, v63);
  uint64_t v68 = objc_msgSend_lastObject(v64, v65, v66, v67);

  uint64_t v90 = 0;
  id v91 = (int **)&v90;
  uint64_t v92 = 0x4812000000;
  uint64_t v93 = sub_19E2624E0;
  unint64_t v94 = sub_19E262504;
  id v95 = &unk_19E35E9F1;
  id v97 = 0;
  uint64_t v98 = 0;
  __p = 0;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = sub_19E26251C;
  v85[3] = &unk_1E599D160;
  id v69 = v46;
  id v86 = v69;
  id v70 = v23;
  id v87 = v70;
  id v89 = &v90;
  id v71 = v68;
  id v88 = v71;
  objc_msgSend_addCompletedHandler_(v21, v72, (uint64_t)v85, v73);
  objc_msgSend_commit(v21, v74, v75, v76);
  objc_msgSend_waitUntilCompleted(v21, v77, v78, v79);
  CFArrayRef v80 = sub_19E2628E8(v91 + 6);

  _Block_object_dispose(&v90, 8);
  if (__p)
  {
    id v97 = __p;
    operator delete(__p);
  }

  return v80;
}

- (void)decayHandler:(id)a3 didUpdateLearningRate:(float)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v6 = objc_msgSend_layers(self, a2, (uint64_t)a3, v4);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend_conformsToProtocol_(v13, v8, (uint64_t)&unk_1EF0B6850, v9))
        {
          id v14 = v13;
          uint64_t v18 = objc_msgSend_mlpOptimizers(v14, v15, v16, v17);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v19 = v18;
          uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v28, (uint64_t)v36, 16);
          if (v24)
          {
            uint64_t v26 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v29 != v26) {
                  objc_enumerationMutation(v19);
                }
                *(float *)&double v25 = a4;
                objc_msgSend_updateLearningRate_(*(void **)(*((void *)&v28 + 1) + 8 * j), v21, v22, v23, v25);
              }
              uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v28, (uint64_t)v36, 16);
            }
            while (v24);
          }
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v32, (uint64_t)v37, 16);
    }
    while (v10);
  }
}

- (MLPLearningRateDecayHandler)seqLearningRateDecayHandler
{
  return (MLPLearningRateDecayHandler *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSeqLearningRateDecayHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end