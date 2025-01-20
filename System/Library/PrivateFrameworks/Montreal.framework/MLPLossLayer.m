@interface MLPLossLayer
- (MLPLossLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 inputChannels:(unint64_t)a5 neuronType:(int)a6 neuronParams:(id)a7;
- (MLPLossLayer)initWithName:(id)a3 parameters:(id *)a4;
- (MLPLossLayer)initWithName:(id)a3 previousLayer:(id)a4 neuronType:(int)a5 neuronParams:(id)a6;
- (MPSMatrixCopy)matrixLargeCopyFilter;
- (MPSMatrixCopy)matrixSingleCopyFilter;
- (MPSMatrixLogSoftMax)matrixLogSoftMax;
- (MPSMatrixNeuron)negativeNeuron;
- (MPSMatrixSoftMax)matrixSoftMax;
- (MPSNDArrayMultiplication)multiplication;
- (MPSNDArrayReductionSum)reductionSum;
- (id)backward:(id)a3 inputGradient:(id)a4;
- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6;
- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5;
- (id)imageInferenceForward:(id)a3 input:(id)a4 lossLabels:(id)a5;
- (id)imageTrainingForward:(id)a3 input:(id)a4 lossLabels:(id)a5;
- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5;
- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6;
- (id)seqForward:(id)a3 inputMatrix:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6;
- (id)seqInferenceForward:(id)a3 inputMatrix:(id)a4 dataBatch:(id)a5;
- (id)seqTrainingForward:(id)a3 inputMatrix:(id)a4 dataBatch:(id)a5 computeLossGradient:(BOOL)a6;
- (id)seqTrainingForward:(id)a3 subMatrix:(id)a4 reductionSumResults:(id)a5 alphaVec:(id)a6 labels:(id)a7 rowOffset:(unint64_t)a8 computeNRows:(unint64_t)a9 computeLossGradient:(BOOL)a10;
- (void)createKernel;
- (void)setMatrixLargeCopyFilter:(id)a3;
- (void)setMatrixLogSoftMax:(id)a3;
- (void)setMatrixSingleCopyFilter:(id)a3;
- (void)setMatrixSoftMax:(id)a3;
- (void)setMultiplication:(id)a3;
- (void)setNegativeNeuron:(id)a3;
- (void)setReductionSum:(id)a3;
- (void)updatePreviousLayer:(id)a3 nextLayer:(id)a4 network:(id)a5;
@end

@implementation MLPLossLayer

- (MLPLossLayer)initWithName:(id)a3 previousLayer:(id)a4 neuronType:(int)a5 neuronParams:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v16 = objc_msgSend_outputLength(v11, v13, v14, v15);
  uint64_t v20 = objc_msgSend_outputChannels(v11, v17, v18, v19);
  v22 = (MLPLossLayer *)objc_msgSend_initWithName_inputLength_inputChannels_neuronType_neuronParams_(self, v21, (uint64_t)v10, v16, v20, v7, v12);

  return v22;
}

- (MLPLossLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 inputChannels:(unint64_t)a5 neuronType:(int)a6 neuronParams:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MLPLossLayer;
  uint64_t v14 = [(MLPImageLayer *)&v25 initWithLayerType:2 name:v12 neuronType:v8 neuronParams:v13];
  v17 = v14;
  if (v14)
  {
    objc_msgSend_setInputLength_(v14, v15, a4, v16);
    objc_msgSend_setOutputLength_(v17, v18, a4, v19);
    objc_msgSend_setInputChannels_(v17, v20, a5, v21);
    objc_msgSend_setOutputChannels_(v17, v22, a5, v23);
  }

  return v17;
}

- (MLPLossLayer)initWithName:(id)a3 parameters:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MLPLossLayer;
  return [(MLPImageLayer *)&v5 initWithLayerType:2 name:a3 parameters:a4];
}

- (void)updatePreviousLayer:(id)a3 nextLayer:(id)a4 network:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v51.receiver = self;
  v51.super_class = (Class)MLPLossLayer;
  [(MLPLayer *)&v51 updatePreviousLayer:v8 nextLayer:v9 network:v10];
  uint64_t v14 = objc_msgSend_previousLayer(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_outputLength(v14, v15, v16, v17);
  objc_msgSend_setInputLength_(self, v19, v18, v20);

  v24 = objc_msgSend_previousLayer(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_outputLength(v24, v25, v26, v27);
  objc_msgSend_setOutputLength_(self, v29, v28, v30);

  v34 = objc_msgSend_previousLayer(self, v31, v32, v33);
  uint64_t v38 = objc_msgSend_outputChannels(v34, v35, v36, v37);
  objc_msgSend_setInputChannels_(self, v39, v38, v40);

  v44 = objc_msgSend_previousLayer(self, v41, v42, v43);
  uint64_t v48 = objc_msgSend_outputChannels(v44, v45, v46, v47);
  objc_msgSend_setOutputChannels_(self, v49, v48, v50);
}

- (void)createKernel
{
  objc_super v5 = objc_msgSend_network(self, a2, v2, v3);
  id v9 = objc_msgSend_deviceHandler(v5, v6, v7, v8);
  objc_msgSend_device(v9, v10, v11, v12);
  id v116 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = objc_msgSend_network(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_networkType(v16, v17, v18, v19);

  if (v20 == 1)
  {
    uint64_t v22 = objc_msgSend_cnnLossDescriptorWithType_reductionType_(MEMORY[0x1E4F35460], v21, 2, 1);
    uint64_t v26 = objc_msgSend_network(self, v23, v24, v25);
    *(float *)&double v30 = 1.0 / (float)(unint64_t)objc_msgSend_batchSize(v26, v27, v28, v29);
    objc_msgSend_setWeight_(v22, v31, v32, v33, v30);

    id v34 = objc_alloc(MEMORY[0x1E4F35450]);
    uint64_t v36 = objc_msgSend_initWithDevice_lossDescriptor_(v34, v35, (uint64_t)v116, (uint64_t)v22);
    objc_msgSend_setForwardKernel_(self, v37, (uint64_t)v36, v38);
    id v39 = objc_alloc(MEMORY[0x1E4F35500]);
    uint64_t v42 = objc_msgSend_initWithDevice_(v39, v40, (uint64_t)v116, v41);
    objc_msgSend_setSecondaryForwardKernel_(self, v43, (uint64_t)v42, v44);
  }
  else
  {
    id v45 = objc_alloc(MEMORY[0x1E4F35678]);
    uint64_t v48 = objc_msgSend_initWithDevice_(v45, v46, (uint64_t)v116, v47);
    objc_msgSend_setMatrixSoftMax_(self, v49, (uint64_t)v48, v50);

    id v51 = objc_alloc(MEMORY[0x1E4F35658]);
    v54 = objc_msgSend_initWithDevice_(v51, v52, (uint64_t)v116, v53);
    objc_msgSend_setMatrixLogSoftMax_(self, v55, (uint64_t)v54, v56);

    id v57 = objc_alloc(MEMORY[0x1E4F357E0]);
    v60 = objc_msgSend_initWithDevice_(v57, v58, (uint64_t)v116, v59);
    objc_msgSend_setMultiplication_(self, v61, (uint64_t)v60, v62);

    id v63 = objc_alloc(MEMORY[0x1E4F35878]);
    v65 = objc_msgSend_initWithDevice_axis_(v63, v64, (uint64_t)v116, 0);
    objc_msgSend_setReductionSum_(self, v66, (uint64_t)v65, v67);

    v71 = objc_msgSend_defaultAllocator(MEMORY[0x1E4F35690], v68, v69, v70);
    v75 = objc_msgSend_reductionSum(self, v72, v73, v74);
    objc_msgSend_setDestinationArrayAllocator_(v75, v76, (uint64_t)v71, v77);

    id v78 = objc_alloc(MEMORY[0x1E4F35668]);
    v81 = objc_msgSend_initWithDevice_(v78, v79, (uint64_t)v116, v80);
    objc_msgSend_setNegativeNeuron_(self, v82, (uint64_t)v81, v83);

    v87 = objc_msgSend_negativeNeuron(self, v84, v85, v86);
    LODWORD(v88) = -1.0;
    objc_msgSend_setNeuronType_parameterA_parameterB_parameterC_(v87, v89, 2, v90, v88, 0.0, 0.0);

    id v91 = objc_alloc(MEMORY[0x1E4F35620]);
    v95 = objc_msgSend_network(self, v92, v93, v94);
    uint64_t v99 = objc_msgSend_lossBatchSize(v95, v96, v97, v98);
    uint64_t v103 = objc_msgSend_inputChannels(self, v100, v101, v102);
    v105 = objc_msgSend_initWithDevice_copyRows_copyColumns_sourcesAreTransposed_destinationsAreTransposed_(v91, v104, (uint64_t)v116, v99, v103, 0, 0);
    objc_msgSend_setMatrixLargeCopyFilter_(self, v106, (uint64_t)v105, v107);

    id v108 = objc_alloc(MEMORY[0x1E4F35620]);
    uint64_t v112 = objc_msgSend_inputChannels(self, v109, v110, v111);
    uint64_t v22 = objc_msgSend_initWithDevice_copyRows_copyColumns_sourcesAreTransposed_destinationsAreTransposed_(v108, v113, (uint64_t)v116, 1, v112, 0, 0);
    objc_msgSend_setMatrixSingleCopyFilter_(self, v114, (uint64_t)v22, v115);
  }
}

- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  if (v6) {
    objc_msgSend_imageInferenceForward_input_lossLabels_(self, v12, (uint64_t)v10, (uint64_t)v11, v13);
  }
  else {
  uint64_t v14 = objc_msgSend_imageTrainingForward_input_lossLabels_(self, v12, (uint64_t)v10, (uint64_t)v11, v13);
  }

  return v14;
}

- (id)imageTrainingForward:(id)a3 input:(id)a4 lossLabels:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_network(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_deviceHandler(v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_device(v18, v19, v20, v21);

  id v23 = v9;
  uint64_t v27 = objc_msgSend_forwardKernel(self, v24, v25, v26);
  uint64_t v29 = objc_msgSend_encodeBatchToCommandBuffer_sourceImages_labels_(v27, v28, (uint64_t)v8, (uint64_t)v23, v10);

  return v29;
}

- (id)imageInferenceForward:(id)a3 input:(id)a4 lossLabels:(id)a5
{
  id v8 = a3;
  id v9 = (MPSImageBatch *)a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_network(self, v11, v12, v13);
  int v18 = objc_msgSend_computeLossOnInference(v14, v15, v16, v17);

  if (v18)
  {
    uint64_t v21 = objc_msgSend_objectAtIndex_(v9, v19, 0, v20);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      MPSImageBatchIncrementReadCount(v9, 1);
    }
    id v24 = (id)objc_msgSend_imageTrainingForward_input_lossLabels_(self, v23, (uint64_t)v8, (uint64_t)v9, v10);
  }
  uint64_t v25 = v9;
  uint64_t v29 = objc_msgSend_secondaryForwardKernel(self, v26, v27, v28);
  v31 = objc_msgSend_encodeBatchToCommandBuffer_sourceImages_(v29, v30, (uint64_t)v8, (uint64_t)v25);

  return v31;
}

- (id)seqForward:(id)a3 inputMatrix:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  if (v6) {
    objc_msgSend_seqInferenceForward_inputMatrix_dataBatch_(self, v12, (uint64_t)v10, (uint64_t)v11, v13);
  }
  else {
  uint64_t v14 = objc_msgSend_seqTrainingForward_inputMatrix_dataBatch_computeLossGradient_(self, v12, (uint64_t)v10, (uint64_t)v11, v13, 1);
  }

  return v14;
}

- (id)seqTrainingForward:(id)a3 inputMatrix:(id)a4 dataBatch:(id)a5 computeLossGradient:(BOOL)a6
{
  BOOL v6 = a6;
  id v119 = a3;
  id v122 = a4;
  v124 = self;
  id v116 = a5;
  id v13 = objc_msgSend_network(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_deviceHandler(v13, v14, v15, v16);
  v118 = objc_msgSend_device(v17, v18, v19, v20);

  v117 = objc_msgSend_data(v122, v21, v22, v23);
  unint64_t v123 = objc_msgSend_rows(v122, v24, v25, v26);
  objc_msgSend_combinedLossLabels(v116, v27, v28, v29);
  uint64_t v137 = 0;
  v138 = &v137;
  int v140 = 0;
  v121 = uint64_t v139 = 0x2020000000;
  uint64_t v33 = objc_msgSend_labels(v121, v30, v31, v32);
  uint64_t v37 = objc_msgSend_count(v33, v34, v35, v36);
  uint64_t v41 = objc_msgSend_labels(v121, v38, v39, v40);
  uint64_t v45 = objc_msgSend_count(v41, v42, v43, v44);
  uint64_t v46 = (float *)operator new(8uLL);
  *uint64_t v46 = 1.0 / (float)(unint64_t)v37;
  v46[1] = -1.0 / (float)(unint64_t)v45;
  __p = v46;

  uint64_t v50 = objc_msgSend_network(v124, v47, v48, v49);
  v54 = objc_msgSend_deviceHandler(v50, v51, v52, v53);
  uint64_t v115 = objc_msgSend_biasVectorWithLength_stdDev_values_(v54, v55, 2, (uint64_t)__p, 0.0);

  if (v6)
  {
    uint64_t v59 = objc_msgSend_network(v124, v56, v57, v58);
    id v63 = objc_msgSend_deviceHandler(v59, v60, v61, v62);
    uint64_t v67 = objc_msgSend_inputChannels(v124, v64, v65, v66);
    uint64_t v69 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v63, v68, v123, v67, v119);
  }
  else
  {
    uint64_t v69 = 0;
  }
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = sub_19E31D6E0;
  v125[3] = &unk_1E599D4A0;
  id v112 = v118;
  id v126 = v112;
  id v70 = v122;
  id v127 = v70;
  v134 = &v137;
  unint64_t v135 = v123;
  id v110 = v117;
  id v128 = v110;
  id v71 = v121;
  id v129 = v71;
  v130 = v124;
  id v111 = v119;
  id v131 = v111;
  id v108 = v115;
  id v132 = v108;
  BOOL v136 = v6;
  id v114 = v69;
  id v133 = v114;
  v72 = (void (**)(void, void, void, void, void))MEMORY[0x19F3BC450](v125);
  v113 = objc_msgSend_network(v124, v73, v74, v75);
  uint64_t v79 = objc_msgSend_lossBatchSize(v113, v76, v77, v78);
  uint64_t v83 = objc_msgSend_network(v124, v80, v81, v82);
  unint64_t v87 = objc_msgSend_lossBatchSize(v83, v84, v85, v86);
  id v91 = objc_msgSend_matrixLargeCopyFilter(v124, v88, v89, v90);
  v95 = objc_msgSend_largeReductionSumResult(v71, v92, v93, v94);
  ((void (**)(void, uint64_t, unint64_t, void *, void *))v72)[2](v72, v79, v123 / v87, v91, v95);

  uint64_t v99 = *((unsigned int *)v138 + 6);
  uint64_t v100 = v123 - v99;
  if (v123 != v99)
  {
    uint64_t v101 = objc_msgSend_matrixSingleCopyFilter(v124, v96, v97, v98, v108, v110, v111, v112);
    v105 = objc_msgSend_smallReductionSumResult(v71, v102, v103, v104);
    ((void (**)(void, uint64_t, uint64_t, void *, void *))v72)[2](v72, 1, v100, v101, v105);
  }
  objc_msgSend_decrementReadCount(v70, v96, v97, v98, v108);
  id v106 = v114;

  operator delete(__p);
  _Block_object_dispose(&v137, 8);

  return v106;
}

- (id)seqTrainingForward:(id)a3 subMatrix:(id)a4 reductionSumResults:(id)a5 alphaVec:(id)a6 labels:(id)a7 rowOffset:(unint64_t)a8 computeNRows:(unint64_t)a9 computeLossGradient:(BOOL)a10
{
  v224[2] = *MEMORY[0x1E4F143B8];
  id v220 = a3;
  id v16 = a4;
  id v214 = a5;
  id v210 = a6;
  id v17 = a7;
  v218 = v16;
  uint64_t v208 = objc_msgSend_columns(v16, v18, v19, v20);
  uint64_t v205 = objc_msgSend_rowBytes(v16, v21, v22, v23);
  uint64_t v27 = objc_msgSend_network(self, v24, v25, v26);
  uint64_t v31 = objc_msgSend_deviceHandler(v27, v28, v29, v30);
  v215 = objc_msgSend_device(v31, v32, v33, v34);

  id v35 = objc_alloc(MEMORY[0x1E4F35688]);
  uint64_t v39 = objc_msgSend_outputChannels(self, v36, v37, v38);
  v211 = objc_msgSend_initWithDevice_count_rows_columns_transpose_(v35, v40, (uint64_t)v215, 2, a9, v39, 0);
  uint64_t v44 = objc_msgSend_network(self, v41, v42, v43);
  uint64_t v48 = objc_msgSend_deviceHandler(v44, v45, v46, v47);
  uint64_t v52 = objc_msgSend_outputChannels(self, v49, v50, v51);
  v216 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v48, v53, a9, v52, v220);

  uint64_t v57 = objc_msgSend_network(self, v54, v55, v56);
  uint64_t v61 = objc_msgSend_deviceHandler(v57, v58, v59, v60);
  uint64_t v65 = objc_msgSend_outputChannels(self, v62, v63, v64);
  v217 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v61, v66, a9, v65, v220);

  id v70 = objc_msgSend_network(self, v67, v68, v69);
  uint64_t v74 = objc_msgSend_deviceHandler(v70, v71, v72, v73);
  uint64_t v78 = objc_msgSend_outputChannels(self, v75, v76, v77);
  v219 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v74, v79, a9, v78, v220);

  objc_msgSend_incrementReadCount(v16, v80, v81, v82);
  uint64_t v86 = objc_msgSend_matrixSoftMax(self, v83, v84, v85);
  v222[1] = 0;
  v222[2] = 0;
  v222[0] = a8;
  objc_msgSend_setSourceMatrixOrigin_(v86, v87, (uint64_t)v222, v88);

  v92 = objc_msgSend_matrixLogSoftMax(self, v89, v90, v91);
  v221[1] = 0;
  v221[2] = 0;
  v221[0] = a8;
  objc_msgSend_setSourceMatrixOrigin_(v92, v93, (uint64_t)v221, v94);

  uint64_t v98 = objc_msgSend_matrixSoftMax(self, v95, v96, v97);
  objc_msgSend_setSourceRows_(v98, v99, a9, v100);

  uint64_t v104 = objc_msgSend_matrixLogSoftMax(self, v101, v102, v103);
  objc_msgSend_setSourceRows_(v104, v105, a9, v106);

  id v110 = objc_msgSend_matrixSoftMax(self, v107, v108, v109);
  objc_msgSend_encodeToCommandBuffer_inputMatrix_resultMatrix_(v110, v111, (uint64_t)v220, (uint64_t)v16, v216);

  uint64_t v115 = objc_msgSend_matrixLogSoftMax(self, v112, v113, v114);
  objc_msgSend_encodeToCommandBuffer_inputMatrix_resultMatrix_(v115, v116, (uint64_t)v220, (uint64_t)v16, v217);

  v120 = objc_msgSend_negativeNeuron(self, v117, v118, v119);
  objc_msgSend_encodeToCommandBuffer_inputMatrix_biasVector_resultMatrix_(v120, v121, (uint64_t)v220, (uint64_t)v217, 0, v219);

  unint64_t v128 = objc_msgSend_outputChannels(self, v122, v123, v124) * a9;
  if (!v128)
  {
    id v129 = 0;
    if (!a9) {
      goto LABEL_8;
    }
LABEL_6:
    for (uint64_t i = 0; i != a9; ++i)
    {
      uint64_t v131 = objc_msgSend_outputChannels(self, v125, v126, v127);
      v134 = objc_msgSend_objectAtIndexedSubscript_(v17, v132, i, v133);
      v129[objc_msgSend_unsignedIntegerValue(v134, v135, v136, v137) + v131 * i] = 1065353216;
    }
    goto LABEL_8;
  }
  if (v128 >> 62) {
    sub_19E13D694();
  }
  id v129 = operator new(4 * v128);
  bzero(v129, 4 * v128);
  if (a9) {
    goto LABEL_6;
  }
LABEL_8:
  v138 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v125, a9, v127);
  v224[0] = v138;
  uint64_t v139 = NSNumber;
  uint64_t v143 = objc_msgSend_outputChannels(self, v140, v141, v142);
  v146 = objc_msgSend_numberWithUnsignedInteger_(v139, v144, v143, v145);
  v224[1] = v146;
  v213 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v147, (uint64_t)v224, 2);

  v207 = objc_msgSend_descriptorWithDataType_shape_(MEMORY[0x1E4F35720], v148, 268435488, (uint64_t)v213);
  id v149 = objc_alloc(MEMORY[0x1E4F35690]);
  v151 = objc_msgSend_initWithDevice_descriptor_(v149, v150, (uint64_t)v215, (uint64_t)v207);
  objc_msgSend_writeBytes_strideBytes_(v151, v152, (uint64_t)v129, 0);
  v153 = (void *)MEMORY[0x1E4F35720];
  uint64_t v157 = objc_msgSend_columns(v219, v154, v155, v156);
  uint64_t v161 = objc_msgSend_rows(v219, v158, v159, v160);
  v206 = objc_msgSend_descriptorWithDataType_dimensionSizes_(v153, v162, 268435488, v157, v161, 0);
  v212 = objc_msgSend_ndArrayWithCommandBuffer_descriptor_aliasing_(v219, v163, (uint64_t)v220, (uint64_t)v206, 2);
  v167 = objc_msgSend_multiplication(self, v164, v165, v166);
  v169 = objc_msgSend_encodeToCommandBuffer_primarySourceArray_secondarySourceArray_(v167, v168, (uint64_t)v220, (uint64_t)v212, v151);

  v173 = objc_msgSend_reductionSum(self, v170, v171, v172);
  v175 = objc_msgSend_encodeToCommandBuffer_sourceArray_(v173, v174, (uint64_t)v220, (uint64_t)v169);

  objc_msgSend_addObject_(v214, v176, (uint64_t)v175, v177);
  if (a10)
  {
    v209 = objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(MEMORY[0x1E4F35640], v178, a9, v208, v205, 268435488);
    v182 = objc_msgSend_matrixWithCommandBuffer_descriptor_aliasing_(v151, v181, (uint64_t)v220, (uint64_t)v209, 0);
    v186 = objc_msgSend_network(self, v183, v184, v185);
    v190 = objc_msgSend_deviceHandler(v186, v187, v188, v189);
    v192 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v190, v191, a9, v208, v220);

    v223[0] = v216;
    v223[1] = v182;
    v194 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v193, (uint64_t)v223, 2);
    objc_msgSend_encodeToCommandBuffer_sourceMatrices_resultMatrix_scaleVector_offsetVector_biasVector_startIndex_(v211, v195, (uint64_t)v220, (uint64_t)v194, v192, v210, 0, 0, 0);
  }
  else
  {
    v192 = 0;
  }
  objc_msgSend_resetReadCount(v216, v178, v179, v180);
  objc_msgSend_resetReadCount(v217, v196, v197, v198);
  objc_msgSend_resetReadCount(v219, v199, v200, v201);
  objc_msgSend_setReadCount_(v169, v202, 0, v203);

  if (v129) {
    operator delete(v129);
  }

  return v192;
}

- (id)seqInferenceForward:(id)a3 inputMatrix:(id)a4 dataBatch:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_network(self, v11, v12, v13);
  int v18 = objc_msgSend_computeLossOnInference(v14, v15, v16, v17);

  if (v18)
  {
    objc_msgSend_incrementReadCount(v9, v19, v20, v21);
    id v23 = (id)objc_msgSend_seqTrainingForward_inputMatrix_dataBatch_computeLossGradient_(self, v22, (uint64_t)v8, (uint64_t)v9, v10, 0);
  }
  id v24 = objc_msgSend_matrixSoftMax(self, v19, v20, v21);
  memset(v69, 0, sizeof(v69));
  objc_msgSend_setSourceMatrixOrigin_(v24, v25, (uint64_t)v69, v26);

  uint64_t v30 = objc_msgSend_matrixSoftMax(self, v27, v28, v29);
  objc_msgSend_setSourceRows_(v30, v31, -1, v32);

  uint64_t v36 = objc_msgSend_network(self, v33, v34, v35);
  uint64_t v40 = objc_msgSend_deviceHandler(v36, v37, v38, v39);
  uint64_t v44 = objc_msgSend_device(v40, v41, v42, v43);

  uint64_t v48 = objc_msgSend_network(self, v45, v46, v47);
  uint64_t v52 = objc_msgSend_deviceHandler(v48, v49, v50, v51);
  uint64_t v56 = objc_msgSend_rows(v9, v53, v54, v55);
  uint64_t v60 = objc_msgSend_columns(v9, v57, v58, v59);
  uint64_t v62 = objc_msgSend_matrixWithRows_columns_cmdBuf_(v52, v61, v56, v60, v8);

  uint64_t v66 = objc_msgSend_matrixSoftMax(self, v63, v64, v65);
  objc_msgSend_encodeToCommandBuffer_inputMatrix_resultMatrix_(v66, v67, (uint64_t)v8, (uint64_t)v9, v62);

  return v62;
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v16 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15);
  uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(v11, v17, 0, v18);
  uint64_t v21 = objc_msgSend_seqForward_inputMatrix_dataBatch_runInference_(self, v20, (uint64_t)v10, (uint64_t)v19, v12, v6);

  objc_msgSend_addObject_(v16, v22, (uint64_t)v21, v23);

  return v16;
}

- (id)backward:(id)a3 inputGradient:(id)a4
{
  id v4 = a4;

  return v4;
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  bzero(v12, 0x2C0uLL);
  v12[4] = 0;
  v12[5] = 0;
  v12[0] = 2;
  v12[7] = 4;
  id v10 = objc_msgSend_generateNode_model_weightIter_params_(self, v9, (uint64_t)a3, (uint64_t)a4, a5, v12);

  return v10;
}

- (MPSNDArrayMultiplication)multiplication
{
  return (MPSNDArrayMultiplication *)objc_getProperty(self, a2, 168, 1);
}

- (void)setMultiplication:(id)a3
{
}

- (MPSNDArrayReductionSum)reductionSum
{
  return (MPSNDArrayReductionSum *)objc_getProperty(self, a2, 176, 1);
}

- (void)setReductionSum:(id)a3
{
}

- (MPSMatrixSoftMax)matrixSoftMax
{
  return (MPSMatrixSoftMax *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMatrixSoftMax:(id)a3
{
}

- (MPSMatrixLogSoftMax)matrixLogSoftMax
{
  return (MPSMatrixLogSoftMax *)objc_getProperty(self, a2, 192, 1);
}

- (void)setMatrixLogSoftMax:(id)a3
{
}

- (MPSMatrixNeuron)negativeNeuron
{
  return (MPSMatrixNeuron *)objc_getProperty(self, a2, 200, 1);
}

- (void)setNegativeNeuron:(id)a3
{
}

- (MPSMatrixCopy)matrixLargeCopyFilter
{
  return (MPSMatrixCopy *)objc_getProperty(self, a2, 208, 1);
}

- (void)setMatrixLargeCopyFilter:(id)a3
{
}

- (MPSMatrixCopy)matrixSingleCopyFilter
{
  return (MPSMatrixCopy *)objc_getProperty(self, a2, 216, 1);
}

- (void)setMatrixSingleCopyFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matrixSingleCopyFilter, 0);
  objc_storeStrong((id *)&self->_matrixLargeCopyFilter, 0);
  objc_storeStrong((id *)&self->_negativeNeuron, 0);
  objc_storeStrong((id *)&self->_matrixLogSoftMax, 0);
  objc_storeStrong((id *)&self->_matrixSoftMax, 0);
  objc_storeStrong((id *)&self->_reductionSum, 0);

  objc_storeStrong((id *)&self->_multiplication, 0);
}

@end