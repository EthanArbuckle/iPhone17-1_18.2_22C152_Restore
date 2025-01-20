@interface MLPDenseLayer
- (MLPDenseLayer)initWithName:(id)a3 numInputs:(unint64_t)a4 numOutputs:(unint64_t)a5 neuronType:(int)a6 neuronParams:(id)a7;
- (MLPDenseLayer)initWithName:(id)a3 parameters:(id *)a4;
- (MLPDenseLayer)initWithName:(id)a3 previousLayer:(id)a4 numOutputs:(unint64_t)a5 neuronType:(int)a6 neuronParams:(id)a7;
- (MLPOptimizer)optimizerBiases;
- (MLPOptimizer)optimizerWeights;
- (MPSMatrix)weights;
- (MPSVector)biasVector;
- (NSArray)mlpOptimizers;
- (const)initialBias;
- (const)initialWeights;
- (id)backward:(id)a3 index:(id)a4 inputGradientMatrix:(id)a5;
- (id)backward:(id)a3 inputGradient:(id)a4;
- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6;
- (id)forward:(id)a3 inputMatrix:(id)a4 index:(id)a5 runInference:(BOOL)a6;
- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5;
- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5;
- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6;
- (void)createKernel;
- (void)setBiasVector:(id)a3;
- (void)setInitialBias:(const void *)a3;
- (void)setInitialWeights:(const void *)a3;
- (void)setOptimizerBiases:(id)a3;
- (void)setOptimizerWeights:(id)a3;
- (void)setWeights:(id)a3;
@end

@implementation MLPDenseLayer

- (MLPDenseLayer)initWithName:(id)a3 previousLayer:(id)a4 numOutputs:(unint64_t)a5 neuronType:(int)a6 neuronParams:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v13;
    uint64_t v19 = objc_msgSend_outputChannels(v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_outputLength(v15, v20, v21, v22) * v19;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v25, *MEMORY[0x1E4F1C3B8], @"Could not extract info from previous layer", 0);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v30);
    }
    uint64_t v23 = objc_msgSend_numOutputs(v13, v25, v26, v27);
  }
  v28 = (MLPDenseLayer *)objc_msgSend_initWithName_numInputs_numOutputs_neuronType_neuronParams_(self, v24, (uint64_t)v12, v23, a5, v8, v14);

  return v28;
}

- (MLPDenseLayer)initWithName:(id)a3 numInputs:(unint64_t)a4 numOutputs:(unint64_t)a5 neuronType:(int)a6 neuronParams:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a7;
  v29.receiver = self;
  v29.super_class = (Class)MLPDenseLayer;
  id v14 = [(MLPMatrixLayer *)&v29 initWithLayerType:6 name:v12 neuronType:v8 neuronParams:v13];
  uint64_t v17 = v14;
  if (v14)
  {
    objc_msgSend_setNumInputs_(v14, v15, a4, v16);
    objc_msgSend_setNumOutputs_(v17, v18, a5, v19);
    objc_msgSend_setInputLength_(v17, v20, 1, v21);
    objc_msgSend_setInputChannels_(v17, v22, a4, v23);
    objc_msgSend_setOutputLength_(v17, v24, 1, v25);
    objc_msgSend_setOutputChannels_(v17, v26, a5, v27);
  }

  return v17;
}

- (MLPDenseLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MLPDenseLayer;
  v7 = [(MLPMatrixLayer *)&v34 initWithLayerType:6 name:v6 parameters:a4];
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setNumInputs_(v7, v8, a4->var9[0][0], v9);
    objc_msgSend_setNumOutputs_(v10, v11, a4->var10[0][0], v12);
    objc_msgSend_setInputLength_(v10, v13, 1, v14);
    uint64_t v18 = objc_msgSend_numInputs(v10, v15, v16, v17);
    objc_msgSend_setInputChannels_(v10, v19, v18, v20);
    objc_msgSend_setOutputLength_(v10, v21, 1, v22);
    uint64_t v26 = objc_msgSend_numOutputs(v10, v23, v24, v25);
    objc_msgSend_setOutputChannels_(v10, v27, v26, v28);
    objc_msgSend_setInitialWeights_(v10, v29, (uint64_t)a4->var13[0], v30);
    objc_msgSend_setInitialBias_(v10, v31, (uint64_t)a4->var14[0], v32);
  }

  return v10;
}

- (NSArray)mlpOptimizers
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_optimizerWeights(self, a2, v2, v3);
  v13[0] = v5;
  uint64_t v9 = objc_msgSend_optimizerBiases(self, v6, v7, v8);
  v13[1] = v9;
  v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v13, 2);

  return (NSArray *)v11;
}

- (void)createKernel
{
  v5 = objc_msgSend_network(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_deviceHandler(v5, v6, v7, v8);
  id v13 = objc_msgSend_device(v9, v10, v11, v12);

  id v14 = objc_alloc(MEMORY[0x1E4F35648]);
  uint64_t v17 = objc_msgSend_initWithDevice_(v14, v15, (uint64_t)v13, v16);
  objc_msgSend_setForwardKernel_(self, v18, (uint64_t)v17, v19);

  id v20 = objc_alloc(MEMORY[0x1E4F35650]);
  uint64_t v23 = objc_msgSend_initWithDevice_(v20, v21, (uint64_t)v13, v22);
  objc_msgSend_setPrimaryGradientKernel_(self, v24, (uint64_t)v23, v25);

  objc_super v29 = objc_msgSend_network(self, v26, v27, v28);
  v33 = objc_msgSend_deviceHandler(v29, v30, v31, v32);
  uint64_t v37 = objc_msgSend_numInputs(self, v34, v35, v36);
  uint64_t v41 = objc_msgSend_numOutputs(self, v38, v39, v40);
  uint64_t v45 = objc_msgSend_initialWeights(self, v42, v43, v44);
  LODWORD(v46) = 1017370378;
  v48 = objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(v33, v47, v37, v41, v45, 1, v46);
  objc_msgSend_setWeights_(self, v49, (uint64_t)v48, v50);

  v54 = objc_msgSend_network(self, v51, v52, v53);
  v58 = objc_msgSend_deviceHandler(v54, v55, v56, v57);
  uint64_t v62 = objc_msgSend_numOutputs(self, v59, v60, v61);
  uint64_t v66 = objc_msgSend_initialBias(self, v63, v64, v65);
  v68 = objc_msgSend_biasVectorWithLength_stdDev_values_(v58, v67, v62, v66, 0.0);
  objc_msgSend_setBiasVector_(self, v69, (uint64_t)v68, v70);

  v151[0] = MEMORY[0x1E4F143A8];
  v151[1] = 3221225472;
  v151[2] = sub_19E32CDD0;
  v151[3] = &unk_1E599D1D0;
  v151[4] = self;
  v71 = (void *)MEMORY[0x19F3BC450](v151);
  v75 = objc_msgSend_network(self, v72, v73, v74);
  v77 = objc_msgSend_optimizerWithNetwork_momentum_velocity_(MLPOptimizer, v76, (uint64_t)v75, (uint64_t)v71, v71);
  objc_msgSend_setOptimizerWeights_(self, v78, (uint64_t)v77, v79);

  v150[0] = MEMORY[0x1E4F143A8];
  v150[1] = 3221225472;
  v150[2] = sub_19E32CEF0;
  v150[3] = &unk_1E599D1D0;
  v150[4] = self;
  v80 = (void *)MEMORY[0x19F3BC450](v150);
  v84 = objc_msgSend_network(self, v81, v82, v83);
  v86 = objc_msgSend_optimizerWithNetwork_momentum_velocity_(MLPOptimizer, v85, (uint64_t)v84, (uint64_t)v80, v80);
  objc_msgSend_setOptimizerBiases_(self, v87, (uint64_t)v86, v88);

  if (objc_msgSend_neuronType(self, v89, v90, v91))
  {
    id v92 = objc_alloc(MEMORY[0x1E4F35668]);
    v95 = objc_msgSend_initWithDevice_(v92, v93, (uint64_t)v13, v94);
    objc_msgSend_setSecondaryForwardKernel_(self, v96, (uint64_t)v95, v97);
    uint64_t v101 = objc_msgSend_neuronType(self, v98, v99, v100);
    objc_msgSend_neuronA(self, v102, v103, v104);
    int v106 = v105;
    objc_msgSend_neuronB(self, v107, v108, v109);
    int v111 = v110;
    objc_msgSend_neuronC(self, v112, v113, v114);
    LODWORD(v116) = v115;
    LODWORD(v117) = v106;
    LODWORD(v118) = v111;
    objc_msgSend_setNeuronType_parameterA_parameterB_parameterC_(v95, v119, v101, v120, v117, v118, v116);
    id v121 = objc_alloc(MEMORY[0x1E4F35670]);
    v124 = objc_msgSend_initWithDevice_(v121, v122, (uint64_t)v13, v123);
    objc_msgSend_setSecondaryGradientKernel_(self, v125, (uint64_t)v124, v126);
    uint64_t v130 = objc_msgSend_neuronType(self, v127, v128, v129);
    objc_msgSend_neuronA(self, v131, v132, v133);
    int v135 = v134;
    objc_msgSend_neuronB(self, v136, v137, v138);
    int v140 = v139;
    objc_msgSend_neuronC(self, v141, v142, v143);
    LODWORD(v145) = v144;
    LODWORD(v146) = v135;
    LODWORD(v147) = v140;
    objc_msgSend_setNeuronType_parameterA_parameterB_parameterC_(v124, v148, v130, v149, v146, v147, v145);
  }
}

- (id)forward:(id)a3 inputMatrix:(id)a4 index:(id)a5 runInference:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v16 = objc_msgSend_forwardKernel(self, v13, v14, v15);
  objc_msgSend_updateInputMatrixToFirstKernel_index_inference_(self, v17, (uint64_t)v11, (uint64_t)v12, v6);
  uint64_t v21 = objc_msgSend_network(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_deviceHandler(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_rows(v11, v26, v27, v28);
  uint64_t v33 = objc_msgSend_numOutputs(self, v30, v31, v32);
  uint64_t v35 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v25, v34, v29, v33, v10);

  uint64_t v39 = objc_msgSend_weights(self, v36, v37, v38);
  uint64_t v43 = objc_msgSend_biasVector(self, v40, v41, v42);
  objc_msgSend_encodeToCommandBuffer_inputMatrix_weightMatrix_biasVector_resultMatrix_(v16, v44, (uint64_t)v10, (uint64_t)v11, v39, v43, v35);

  v49 = objc_msgSend_secondaryForwardKernel(self, v45, v46, v47);
  if (v49)
  {
    objc_msgSend_updateInputMatrixToSecondKernel_index_inference_(self, v48, (uint64_t)v35, (uint64_t)v12, v6);
    uint64_t v53 = objc_msgSend_network(self, v50, v51, v52);
    uint64_t v57 = objc_msgSend_deviceHandler(v53, v54, v55, v56);
    uint64_t v61 = objc_msgSend_rows(v11, v58, v59, v60);
    uint64_t v65 = objc_msgSend_numOutputs(self, v62, v63, v64);
    objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v57, v66, v61, v65, v10);
    id v67 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_encodeToCommandBuffer_inputMatrix_biasVector_resultMatrix_(v49, v68, (uint64_t)v10, (uint64_t)v35, 0, v67);
  }
  else
  {
    id v67 = v35;
  }
  id v69 = v67;

  return v69;
}

- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v14 = objc_msgSend_network(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_deviceHandler(v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_network(self, v19, v20, v21);
  uint64_t v26 = objc_msgSend_i2mKernel(v22, v23, v24, v25);
  uint64_t v28 = objc_msgSend_tempMatrixFromImages_i2mKernel_cmdBuf_(v18, v27, (uint64_t)v10, (uint64_t)v26, v9);

  uint64_t v30 = objc_msgSend_forward_inputMatrix_index_runInference_(self, v29, (uint64_t)v9, (uint64_t)v28, &unk_1EF0B3610, v6);
  objc_super v34 = objc_msgSend_network(self, v31, v32, v33);
  uint64_t v38 = objc_msgSend_deviceHandler(v34, v35, v36, v37);
  uint64_t v42 = objc_msgSend_network(self, v39, v40, v41);
  uint64_t v46 = objc_msgSend_m2iKernel(v42, v43, v44, v45);
  uint64_t v50 = objc_msgSend_numOutputs(self, v47, v48, v49);
  uint64_t v52 = objc_msgSend_imageBatchFromMatrix_m2iKernel_cmdBuf_width_height_channels_(v38, v51, (uint64_t)v30, (uint64_t)v46, v9, 1, 1, v50);

  return v52;
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v49 = a5;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v16 = objc_msgSend_count(v11, v13, v14, v15);
  uint64_t v19 = objc_msgSend_arrayWithCapacity_(v12, v17, v16, v18);
  uint64_t v23 = objc_msgSend_inputMatrixToSecondKernel(self, v20, v21, v22);
  objc_msgSend_removeAllObjects(v23, v24, v25, v26);

  uint64_t v30 = objc_msgSend_inputMatrixToFirstKernel(self, v27, v28, v29);
  objc_msgSend_removeAllObjects(v30, v31, v32, v33);

  for (unint64_t i = 0; i < objc_msgSend_count(v11, v34, v35, v36); ++i)
  {
    uint64_t v40 = objc_msgSend_objectAtIndexedSubscript_(v11, v38, i, v39);
    uint64_t v43 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v41, i, v42);
    uint64_t v45 = objc_msgSend_forward_inputMatrix_index_runInference_(self, v44, (uint64_t)v10, (uint64_t)v40, v43, v6);

    objc_msgSend_addObject_(v19, v46, (uint64_t)v45, v47);
  }

  return v19;
}

- (id)backward:(id)a3 index:(id)a4 inputGradientMatrix:(id)a5
{
  v124[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v123 = a4;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_rows(v9, v10, v11, v12);
  uint64_t v20 = objc_msgSend_secondaryGradientKernel(self, v14, v15, v16);
  if (v20)
  {
    uint64_t v21 = objc_msgSend_network(self, v17, v18, v19);
    uint64_t v25 = objc_msgSend_deviceHandler(v21, v22, v23, v24);
    uint64_t v29 = objc_msgSend_numOutputs(self, v26, v27, v28);
    uint64_t v31 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v25, v30, v13, v29, v8);

    uint64_t v35 = objc_msgSend_inputMatrixToSecondKernel(self, v32, v33, v34);
    uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)v123, v37);
    objc_msgSend_encodeToCommandBuffer_gradientMatrix_inputMatrix_biasVector_resultGradientForDataMatrix_resultGradientForBiasVector_(v20, v39, (uint64_t)v8, (uint64_t)v9, v38, 0, v31, 0);
  }
  else
  {
    uint64_t v31 = v9;
  }
  v124[0] = v31;
  uint64_t v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)v124, 1);
  sub_19E310690(v40);

  uint64_t v44 = objc_msgSend_primaryGradientKernel(self, v41, v42, v43);
  uint64_t v48 = objc_msgSend_network(self, v45, v46, v47);
  uint64_t v52 = objc_msgSend_deviceHandler(v48, v49, v50, v51);
  uint64_t v56 = objc_msgSend_numInputs(self, v53, v54, v55);
  v58 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v52, v57, v13, v56, v8);

  uint64_t v62 = objc_msgSend_network(self, v59, v60, v61);
  uint64_t v66 = objc_msgSend_deviceHandler(v62, v63, v64, v65);
  uint64_t v70 = objc_msgSend_numInputs(self, v67, v68, v69);
  uint64_t v74 = objc_msgSend_numOutputs(self, v71, v72, v73);
  v76 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v66, v75, v70, v74, v8);

  v80 = objc_msgSend_network(self, v77, v78, v79);
  v84 = objc_msgSend_deviceHandler(v80, v81, v82, v83);
  uint64_t v88 = objc_msgSend_numOutputs(self, v85, v86, v87);
  uint64_t v90 = objc_msgSend_vectorWithLength_cmdBuf_(v84, v89, v88, (uint64_t)v8);

  uint64_t v94 = objc_msgSend_weights(self, v91, v92, v93);
  objc_msgSend_encodeGradientForDataToCommandBuffer_gradientMatrix_weightMatrix_resultGradientForDataMatrix_(v44, v95, (uint64_t)v8, (uint64_t)v31, v94, v58);

  uint64_t v99 = objc_msgSend_inputMatrixToFirstKernel(self, v96, v97, v98);
  v102 = objc_msgSend_objectForKeyedSubscript_(v99, v100, (uint64_t)v123, v101);
  objc_msgSend_encodeGradientForWeightsAndBiasToCommandBuffer_gradientMatrix_inputMatrix_resultGradientForWeightMatrix_resultGradientForBiasVector_(v44, v103, (uint64_t)v8, (uint64_t)v31, v102, v76, v90);

  v107 = objc_msgSend_optimizerBiases(self, v104, v105, v106);
  int v111 = objc_msgSend_biasVector(self, v108, v109, v110);
  objc_msgSend_encodeToCommandBuffer_inputGradientVector_inputValuesVector_(v107, v112, (uint64_t)v8, (uint64_t)v90, v111);

  double v116 = objc_msgSend_optimizerWeights(self, v113, v114, v115);
  uint64_t v120 = objc_msgSend_weights(self, v117, v118, v119);
  objc_msgSend_encodeToCommandBuffer_inputGradientMatrix_inputValuesMatrix_(v116, v121, (uint64_t)v8, (uint64_t)v76, v120);

  return v58;
}

- (id)backward:(id)a3 inputGradient:(id)a4
{
  id v6 = a3;
  id v63 = a4;
  id v10 = objc_msgSend_network(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_deviceHandler(v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_network(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_i2mKernel(v18, v19, v20, v21);
  uint64_t v24 = objc_msgSend_tempMatrixFromImages_i2mKernel_cmdBuf_(v14, v23, (uint64_t)v63, (uint64_t)v22, v6);

  uint64_t v62 = (void *)v24;
  uint64_t v26 = objc_msgSend_backward_index_inputGradientMatrix_(self, v25, (uint64_t)v6, (uint64_t)&unk_1EF0B3610, v24);
  uint64_t v30 = objc_msgSend_network(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_deviceHandler(v30, v31, v32, v33);
  uint64_t v38 = objc_msgSend_network(self, v35, v36, v37);
  uint64_t v42 = objc_msgSend_m2iKernel(v38, v39, v40, v41);
  uint64_t v46 = objc_msgSend_previousLayer(self, v43, v44, v45);
  uint64_t v50 = objc_msgSend_outputLength(v46, v47, v48, v49);
  uint64_t v54 = objc_msgSend_previousLayer(self, v51, v52, v53);
  uint64_t v58 = objc_msgSend_outputChannels(v54, v55, v56, v57);
  uint64_t v60 = objc_msgSend_imageBatchFromMatrix_m2iKernel_cmdBuf_width_height_channels_(v34, v59, (uint64_t)v26, (uint64_t)v42, v6, v50, 1, v58);

  return v60;
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v15 = objc_msgSend_count(v10, v12, v13, v14);
  uint64_t v21 = objc_msgSend_arrayWithCapacity_(v11, v16, v15, v17);
  for (unint64_t i = 0; i < objc_msgSend_count(v10, v18, v19, v20); ++i)
  {
    uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v10, v23, i, v24);
    uint64_t v28 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v26, i, v27);
    uint64_t v30 = objc_msgSend_backward_index_inputGradientMatrix_(self, v29, (uint64_t)v8, (uint64_t)v28, v25);

    objc_msgSend_addObject_(v21, v31, (uint64_t)v30, v32);
  }

  return v21;
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  v181[1] = *MEMORY[0x1E4F143B8];
  id v170 = a3;
  id v171 = a4;
  bzero(v173, 0x2C0uLL);
  v173[4] = 0;
  v173[5] = 0;
  v173[0] = 0;
  uint64_t v11 = objc_msgSend_neuronType(self, v8, v9, v10);
  v173[7] = objc_msgSend_montrealTypeFromMPSNeuronType_(self, v12, v11, v13);
  uint64_t v17 = objc_msgSend_weights(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_rows(v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend_weights(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_columns(v25, v26, v27, v28);
  sub_19E3107A4(v29 * v21);
  uint64_t v31 = v30;

  uint64_t v35 = objc_msgSend_numOutputs(self, v32, v33, v34);
  sub_19E3107A4(v35);
  uint64_t v37 = v36;
  int v174 = objc_msgSend_numInputs(self, v38, v39, v40);
  int v175 = objc_msgSend_numOutputs(self, v41, v42, v43);
  uint64_t v47 = objc_msgSend_weights(self, v44, v45, v46);
  uint64_t v51 = objc_msgSend_rows(v47, v48, v49, v50);

  uint64_t v55 = objc_msgSend_weights(self, v52, v53, v54);
  uint64_t v169 = objc_msgSend_columns(v55, v56, v57, v58);

  uint64_t v62 = objc_msgSend_weights(self, v59, v60, v61);
  uint64_t v66 = objc_msgSend_rowBytes(v62, v63, v64, v65);

  uint64_t v70 = objc_msgSend_network(self, v67, v68, v69);
  uint64_t v74 = objc_msgSend_deviceHandler(v70, v71, v72, v73);
  v167 = objc_msgSend_device(v74, v75, v76, v77);

  v81 = objc_msgSend_network(self, v78, v79, v80);
  v85 = objc_msgSend_deviceHandler(v81, v82, v83, v84);
  v166 = a5;
  v89 = objc_msgSend_commandQueue(v85, v86, v87, v88);

  v168 = v89;
  uint64_t v93 = objc_msgSend_commandBuffer(v89, v90, v91, v92);
  uint64_t v97 = objc_msgSend_weights(self, v94, v95, v96);

  if (v97)
  {
    uint64_t v101 = objc_msgSend_network(self, v98, v99, v100);
    uint64_t v105 = objc_msgSend_deviceHandler(v101, v102, v103, v104);
    uint64_t v109 = objc_msgSend_weights(self, v106, v107, v108);
    uint64_t v113 = objc_msgSend_data(v109, v110, v111, v112);
    objc_msgSend_importDataFromGPU_cmdBuf_(v105, v114, (uint64_t)v113, (uint64_t)v93);
  }
  uint64_t v115 = objc_msgSend_biasVector(self, v98, v99, v100);

  if (v115)
  {
    uint64_t v119 = objc_msgSend_network(self, v116, v117, v118);
    id v123 = objc_msgSend_deviceHandler(v119, v120, v121, v122);
    v127 = objc_msgSend_biasVector(self, v124, v125, v126);
    v131 = objc_msgSend_data(v127, v128, v129, v130);
    objc_msgSend_importDataFromGPU_cmdBuf_(v123, v132, (uint64_t)v131, (uint64_t)v93);
  }
  v172[0] = MEMORY[0x1E4F143A8];
  v172[1] = 3221225472;
  v172[2] = sub_19E32E594;
  v172[3] = &unk_1E599D6A0;
  v172[4] = self;
  v172[5] = v51;
  v172[6] = v169;
  v172[7] = v31;
  v172[8] = v66;
  v172[9] = v37;
  objc_msgSend_addCompletedHandler_(v93, v116, (uint64_t)v172, v118);
  objc_msgSend_commit(v93, v133, v134, v135);
  objc_msgSend_waitUntilCompleted(v93, v136, v137, v138);
  uint64_t v176 = v31;
  uint64_t v177 = v37;
  v180[0] = &unk_1EF0B3628;
  v180[1] = &unk_1EF0B3628;
  int v139 = NSNumber;
  uint64_t v143 = objc_msgSend_numInputs(self, v140, v141, v142);
  double v146 = objc_msgSend_numberWithUnsignedInteger_(v139, v144, v143, v145);
  v180[2] = v146;
  v148 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v147, (uint64_t)v180, 3);
  v181[0] = v148;
  v150 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v149, (uint64_t)v181, 1);

  v178[0] = &unk_1EF0B3628;
  v178[1] = &unk_1EF0B3628;
  v151 = NSNumber;
  uint64_t v155 = objc_msgSend_numOutputs(self, v152, v153, v154);
  v158 = objc_msgSend_numberWithUnsignedInteger_(v151, v156, v155, v157);
  v178[2] = v158;
  v160 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v159, (uint64_t)v178, 3);
  v179 = v160;
  v162 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v161, (uint64_t)&v179, 1);

  v164 = objc_msgSend_generateNode_model_weightIter_params_inputChunks_outputChunks_(self, v163, (uint64_t)v170, (uint64_t)v171, v166, v173, v150, v162);

  return v164;
}

- (MPSMatrix)weights
{
  return (MPSMatrix *)objc_getProperty(self, a2, 168, 1);
}

- (void)setWeights:(id)a3
{
}

- (MPSVector)biasVector
{
  return (MPSVector *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBiasVector:(id)a3
{
}

- (MLPOptimizer)optimizerWeights
{
  return (MLPOptimizer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setOptimizerWeights:(id)a3
{
}

- (MLPOptimizer)optimizerBiases
{
  return (MLPOptimizer *)objc_getProperty(self, a2, 192, 1);
}

- (void)setOptimizerBiases:(id)a3
{
}

- (const)initialWeights
{
  return self->_initialWeights;
}

- (void)setInitialWeights:(const void *)a3
{
  self->_initialWeights = a3;
}

- (const)initialBias
{
  return self->_initialBias;
}

- (void)setInitialBias:(const void *)a3
{
  self->_initialBias = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerBiases, 0);
  objc_storeStrong((id *)&self->_optimizerWeights, 0);
  objc_storeStrong((id *)&self->_biasVector, 0);

  objc_storeStrong((id *)&self->_weights, 0);
}

@end