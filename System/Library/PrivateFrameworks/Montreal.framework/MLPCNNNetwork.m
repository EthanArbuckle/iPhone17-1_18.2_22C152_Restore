@interface MLPCNNNetwork
- (MLPCNNNetwork)initWithLayers:(id)a3;
- (float)computeLoss:(id)a3;
- (id)computeInference:(id)a3;
- (unint64_t)runInference:(id)a3 databatch:(id)a4 inferredResult:(id)a5 semaphore:(id)a6;
- (void)createLayerKernels;
- (void)runTraining:(id)a3 databatch:(id)a4 iteration:(unint64_t)a5 lossCallback:(id)a6 semaphore:(id)a7;
- (void)setOptimizerParams:(id)a3;
@end

@implementation MLPCNNNetwork

- (MLPCNNNetwork)initWithLayers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MLPCNNNetwork;
  return [(MLPNetwork *)&v4 initWithNetworkType:1 layers:a3];
}

- (void)setOptimizerParams:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v8 = objc_msgSend_options(self, v4, v5, v6);
    v11 = objc_msgSend_exMRL_numberForKey_(v8, v9, (uint64_t)MLPModelTrainerLearningRateKey, v10);
    objc_msgSend_floatValue(v11, v12, v13, v14);
    int v16 = v15;

    v20 = objc_msgSend_options(self, v17, v18, v19);
    v23 = objc_msgSend_exMRL_numberForKey_(v20, v21, (uint64_t)MLPModelTrainerGradientClipMinimum, v22);

    v27 = objc_msgSend_options(self, v24, v25, v26);
    v30 = objc_msgSend_exMRL_numberForKey_(v27, v28, (uint64_t)MLPModelTrainerGradientClipMaximum, v29);

    v31 = [MontrealNNModelOptimizerParam alloc];
    LODWORD(v32) = 1.0;
    LODWORD(v33) = v16;
    id v7 = (id)objc_msgSend_initWithOptimizerType_learningRate_momentum_gradientClipMin_gradientClipMax_(v31, v34, 1, (uint64_t)v23, v30, v33, v32);
  }
  v35.receiver = self;
  v35.super_class = (Class)MLPCNNNetwork;
  [(MLPNetwork *)&v35 setOptimizerParams:v7];
}

- (void)createLayerKernels
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v4 = objc_msgSend_layers(self, a2, v2, v3, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_createKernel(*(void **)(*((void *)&v12 + 1) + 8 * v11++), v6, v7, v8);
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v9);
  }
}

- (void)runTraining:(id)a3 databatch:(id)a4 iteration:(unint64_t)a5 lossCallback:(id)a6 semaphore:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v100 = a6;
  id v99 = a7;
  id v14 = v13;
  objc_msgSend_images(v14, v15, v16, v17);
  v21 = (MPSImageBatch *)objc_claimAutoreleasedReturnValue();
  for (unint64_t i = 0; ; ++i)
  {
    v23 = objc_msgSend_layers(self, v18, v19, v20);
    unint64_t v27 = objc_msgSend_count(v23, v24, v25, v26);

    if (i >= v27) {
      break;
    }
    v31 = (void *)MEMORY[0x19F3BC1E0]();
    objc_super v35 = objc_msgSend_layers(self, v32, v33, v34);
    v38 = objc_msgSend_objectAtIndexedSubscript_(v35, v36, i, v37);

    v42 = objc_msgSend_lossLabels(v14, v39, v40, v41);
    uint64_t v44 = objc_msgSend_forward_input_labels_runInference_(v38, v43, (uint64_t)v12, (uint64_t)v21, v42, 0);

    v21 = (MPSImageBatch *)v44;
  }
  for (unint64_t j = 0; ; ++j)
  {
    v46 = objc_msgSend_labels(v14, v28, v29, v30);
    unint64_t v50 = objc_msgSend_count(v46, v47, v48, v49);

    if (j >= v50) {
      break;
    }
    v54 = (void *)MEMORY[0x19F3BC1E0]();
    v58 = objc_msgSend_lossLabels(v14, v55, v56, v57);
    v61 = objc_msgSend_objectAtIndexedSubscript_(v58, v59, j, v60);

    v65 = objc_msgSend_lossImage(v61, v62, v63, v64);
    objc_msgSend_synchronizeOnCommandBuffer_(v65, v66, (uint64_t)v12, v67);
  }
  v98 = (void *)a5;
  unint64_t v68 = 0;
  for (uint64_t k = -1; ; --k)
  {
    v70 = objc_msgSend_layers(self, v51, v52, v53);
    unint64_t v74 = objc_msgSend_count(v70, v71, v72, v73);

    if (v68 >= v74) {
      break;
    }
    v75 = (void *)MEMORY[0x19F3BC1E0]();
    v79 = objc_msgSend_layers(self, v76, v77, v78);
    uint64_t v83 = objc_msgSend_count(v79, v80, v81, v82);

    v87 = objc_msgSend_layers(self, v84, v85, v86);
    v90 = objc_msgSend_objectAtIndexedSubscript_(v87, v88, k + v83, v89);

    uint64_t v92 = objc_msgSend_backward_inputGradient_(v90, v91, (uint64_t)v12, (uint64_t)v21);

    ++v68;
    v21 = (MPSImageBatch *)v92;
  }
  MPSImageBatchIncrementReadCount(v21, -1);
  objc_initWeak(&location, self);
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = sub_19E328C84;
  v101[3] = &unk_1E599D4C8;
  objc_copyWeak(v105, &location);
  id v93 = v14;
  id v102 = v93;
  id v94 = v100;
  id v104 = v94;
  v105[1] = v98;
  id v95 = v99;
  id v103 = v95;
  objc_msgSend_addCompletedHandler_(v12, v96, (uint64_t)v101, v97);

  objc_destroyWeak(v105);
  objc_destroyWeak(&location);
}

- (float)computeLoss:(id)a3
{
  id v7 = a3;
  unint64_t v8 = 0;
  float v9 = 0.0;
  while (1)
  {
    uint64_t v10 = objc_msgSend_labels(v7, v4, v5, v6);
    unint64_t v14 = objc_msgSend_count(v10, v11, v12, v13);

    if (v8 >= v14) {
      break;
    }
    uint64_t v18 = objc_msgSend_lossLabels(v7, v15, v16, v17);
    v21 = objc_msgSend_objectAtIndexedSubscript_(v18, v19, v8, v20);

    uint64_t v25 = objc_msgSend_lossImage(v21, v22, v23, v24);
    v36[0] = 0;
    v36[1] = 0;
    uint64_t v29 = objc_msgSend_deviceHandler(self, v26, v27, v28);
    uint64_t v33 = objc_msgSend_dataLayout(v29, v30, v31, v32);
    objc_msgSend_readBytes_dataLayout_imageIndex_(v25, v34, (uint64_t)v36, v33, 0);

    float v9 = *(float *)v36 + v9;
    ++v8;
  }

  return v9;
}

- (unint64_t)runInference:(id)a3 databatch:(id)a4 inferredResult:(id)a5 semaphore:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v111 = a5;
  id v110 = a6;
  id v12 = v11;
  uint64_t v19 = objc_msgSend_images(v12, v13, v14, v15);
  unint64_t v20 = 0;
  v112 = 0;
  while (1)
  {
    v21 = objc_msgSend_layers(self, v16, v17, v18);
    unint64_t v25 = objc_msgSend_count(v21, v22, v23, v24);

    if (v20 >= v25) {
      break;
    }
    uint64_t v29 = (void *)MEMORY[0x19F3BC1E0]();
    uint64_t v33 = objc_msgSend_layers(self, v30, v31, v32);
    uint64_t v37 = objc_msgSend_count(v33, v34, v35, v36);

    uint64_t v41 = objc_msgSend_layers(self, v38, v39, v40);
    uint64_t v44 = objc_msgSend_objectAtIndexedSubscript_(v41, v42, v20, v43);

    uint64_t v48 = objc_msgSend_lossLabels(v12, v45, v46, v47);
    uint64_t v50 = objc_msgSend_forward_input_labels_runInference_(v44, v49, (uint64_t)v10, (uint64_t)v19, v48, 1);

    if (v20 == v37 - 1)
    {
      v54 = objc_msgSend_deviceHandler(self, v51, v52, v53);
      v58 = objc_msgSend_i2mKernel(self, v55, v56, v57);
      uint64_t v60 = objc_msgSend_matrixFromImages_i2mKernel_cmdBuf_(v54, v59, v50, (uint64_t)v58, v10);

      v112 = (void *)v60;
    }

    ++v20;
    uint64_t v19 = (void *)v50;
  }
  for (unint64_t i = 0; ; ++i)
  {
    v62 = objc_msgSend_labels(v12, v26, v27, v28);
    unint64_t v66 = objc_msgSend_count(v62, v63, v64, v65);

    if (i >= v66) {
      break;
    }
    v70 = (void *)MEMORY[0x19F3BC1E0]();
    unint64_t v74 = objc_msgSend_lossLabels(v12, v71, v72, v73);
    uint64_t v77 = objc_msgSend_objectAtIndexedSubscript_(v74, v75, i, v76);

    uint64_t v81 = objc_msgSend_lossImage(v77, v78, v79, v80);
    objc_msgSend_synchronizeOnCommandBuffer_(v81, v82, (uint64_t)v10, v83);
  }
  if (v112)
  {
    v84 = objc_msgSend_deviceHandler(self, v67, v68, v69);
    v88 = objc_msgSend_data(v112, v85, v86, v87);
    objc_msgSend_importDataFromGPU_cmdBuf_(v84, v89, (uint64_t)v88, (uint64_t)v10);
  }
  v90 = objc_msgSend_layers(self, v67, v68, v69);
  id v94 = objc_msgSend_lastObject(v90, v91, v92, v93);

  objc_initWeak(&location, self);
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = sub_19E329398;
  v114[3] = &unk_1E599D4F0;
  objc_copyWeak(&v121, &location);
  id v95 = v12;
  id v115 = v95;
  id v113 = v112;
  id v116 = v113;
  id v96 = v94;
  id v117 = v96;
  id v97 = v111;
  id v118 = v97;
  v119 = self;
  id v98 = v110;
  id v120 = v98;
  objc_msgSend_addCompletedHandler_(v10, v99, (uint64_t)v114, v100);
  id v104 = objc_msgSend_images(v95, v101, v102, v103);
  unint64_t v108 = objc_msgSend_count(v104, v105, v106, v107);

  objc_destroyWeak(&v121);
  objc_destroyWeak(&location);

  return v108;
}

- (id)computeInference:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_deviceHandler(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_device(v8, v9, v10, v11);

  uint64_t v16 = objc_msgSend_deviceHandler(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_commandQueue(v16, v17, v18, v19);
  v90 = (void *)v12;

  uint64_t v23 = objc_msgSend_commandBufferFromCommandQueue_(MEMORY[0x1E4F35520], v21, v20, v22);
  uint64_t v89 = v4;
  unint64_t v25 = objc_msgSend_dataBatch_batchSize_network_(MLPDataBatch, v24, (uint64_t)v4, 1, self);
  v88 = (void *)v20;
  uint64_t v32 = objc_msgSend_images(v25, v26, v27, v28);
  uint64_t v33 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v35 = objc_msgSend_layers(self, v29, v30, v31);
    unint64_t v39 = objc_msgSend_count(v35, v36, v37, v38);

    if (i >= v39) {
      break;
    }
    uint64_t v43 = objc_msgSend_layers(self, v40, v41, v42);
    uint64_t v46 = objc_msgSend_objectAtIndexedSubscript_(v43, v44, i, v45);

    uint64_t v50 = objc_msgSend_lossLabels(v25, v47, v48, v49);
    uint64_t v52 = objc_msgSend_forward_input_labels_runInference_(v46, v51, (uint64_t)v23, (uint64_t)v32, v50, 1);

    uint64_t v56 = objc_msgSend_layers(self, v53, v54, v55);
    uint64_t v60 = objc_msgSend_count(v56, v57, v58, v59) - 1;

    if (i == v60)
    {
      uint64_t v64 = objc_msgSend_deviceHandler(self, v61, v62, v63);
      uint64_t v68 = objc_msgSend_i2mKernel(self, v65, v66, v67);
      uint64_t v70 = objc_msgSend_matrixFromImages_i2mKernel_cmdBuf_(v64, v69, v52, (uint64_t)v68, v23);

      uint64_t v33 = (void *)v70;
    }

    uint64_t v32 = (void *)v52;
  }
  if (v33)
  {
    v71 = objc_msgSend_deviceHandler(self, v40, v41, v42);
    v75 = objc_msgSend_data(v33, v72, v73, v74);
    objc_msgSend_importDataFromGPU_cmdBuf_(v71, v76, (uint64_t)v75, (uint64_t)v23);
  }
  uint64_t v94 = 0;
  id v95 = (int **)&v94;
  uint64_t v96 = 0x4812000000;
  id v97 = sub_19E329D30;
  id v98 = sub_19E329D54;
  id v99 = &unk_19E35E9F1;
  v101 = 0;
  uint64_t v102 = 0;
  __p = 0;
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = sub_19E329D6C;
  v91[3] = &unk_1E599D518;
  id v77 = v33;
  id v92 = v77;
  uint64_t v93 = &v94;
  objc_msgSend_addCompletedHandler_(v23, v78, (uint64_t)v91, v79);
  objc_msgSend_commit(v23, v80, v81, v82);
  objc_msgSend_waitUntilCompleted(v23, v83, v84, v85);
  CFArrayRef v86 = sub_19E2628E8(v95 + 6);

  _Block_object_dispose(&v94, 8);
  if (__p)
  {
    v101 = __p;
    operator delete(__p);
  }

  return v86;
}

@end