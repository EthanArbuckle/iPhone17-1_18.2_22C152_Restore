@interface MLPConvolutionLayer
- (MLPConvolutionLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 inputChannels:(unint64_t)a5 kernelWidth:(unint64_t)a6 kernelHeight:(unint64_t)a7 kernelStride:(unint64_t)a8 outputChannels:(unint64_t)a9 neuronType:(int)a10 neuronParams:(id)a11;
- (MLPConvolutionLayer)initWithName:(id)a3 parameters:(id *)a4;
- (MLPConvolutionLayer)initWithName:(id)a3 previousLayer:(id)a4 kernelWidth:(unint64_t)a5 kernelHeight:(unint64_t)a6 kernelStride:(unint64_t)a7 outputChannels:(unint64_t)a8 neuronType:(int)a9 neuronParams:(id)a10;
- (MLPModelConvolutionDataSource)dataSource;
- (const)initialBias;
- (const)initialWeights;
- (id)backward:(id)a3 inputGradient:(id)a4;
- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6;
- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5;
- (void)createKernel;
- (void)setDataSource:(id)a3;
- (void)setInitialBias:(const void *)a3;
- (void)setInitialWeights:(const void *)a3;
- (void)updatePrimaryCurrentState:(id)a3 index:(id)a4 inference:(BOOL)a5;
@end

@implementation MLPConvolutionLayer

- (MLPConvolutionLayer)initWithName:(id)a3 previousLayer:(id)a4 kernelWidth:(unint64_t)a5 kernelHeight:(unint64_t)a6 kernelStride:(unint64_t)a7 outputChannels:(unint64_t)a8 neuronType:(int)a9 neuronParams:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a10;
  uint64_t v22 = objc_msgSend_outputLength(v17, v19, v20, v21);
  uint64_t v26 = objc_msgSend_outputChannels(v17, v23, v24, v25);
  v28 = (MLPConvolutionLayer *)objc_msgSend_initWithName_inputLength_inputChannels_kernelWidth_kernelHeight_kernelStride_outputChannels_neuronType_neuronParams_(self, v27, (uint64_t)v16, v22, v26, a5, a6, a7, a8, a9, v18);

  return v28;
}

- (MLPConvolutionLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 inputChannels:(unint64_t)a5 kernelWidth:(unint64_t)a6 kernelHeight:(unint64_t)a7 kernelStride:(unint64_t)a8 outputChannels:(unint64_t)a9 neuronType:(int)a10 neuronParams:(id)a11
{
  id v17 = a3;
  id v18 = a11;
  v50.receiver = self;
  v50.super_class = (Class)MLPConvolutionLayer;
  v19 = [(MLPImageLayer *)&v50 initWithLayerType:3 name:v17 neuronType:a10 neuronParams:v18];
  uint64_t v22 = v19;
  if (v19)
  {
    objc_msgSend_setInputLength_(v19, v20, a4, v21);
    objc_msgSend_setInputChannels_(v22, v23, a5, v24);
    objc_msgSend_setKernelWidth_(v22, v25, a6, v26);
    objc_msgSend_setKernelHeight_(v22, v27, a7, v28);
    objc_msgSend_setKernelStride_(v22, v29, a8, v30);
    objc_msgSend_setOutputChannels_(v22, v31, a9, v32);
    uint64_t v36 = objc_msgSend_inputLength(v22, v33, v34, v35);
    uint64_t v40 = objc_msgSend_kernelWidth(v22, v37, v38, v39);
    uint64_t v44 = objc_msgSend_kernelStride(v22, v41, v42, v43);
    uint64_t v46 = objc_msgSend_computeOutputLengthWithInputLength_kernelWidth_kernelStride_(v22, v45, v36, v40, v44);
    objc_msgSend_setOutputLength_(v22, v47, v46, v48);
  }

  return v22;
}

- (MLPConvolutionLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v6 = a3;
  v42.receiver = self;
  v42.super_class = (Class)MLPConvolutionLayer;
  v7 = [(MLPImageLayer *)&v42 initWithLayerType:3 name:v6 parameters:a4];
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setInputLength_(v7, v8, a4->var9[0][0], v9);
    objc_msgSend_setInputChannels_(v10, v11, a4->var9[0][2], v12);
    objc_msgSend_setKernelWidth_(v10, v13, a4->var11[0], v14);
    objc_msgSend_setKernelHeight_(v10, v15, a4->var11[1], v16);
    objc_msgSend_setKernelStride_(v10, v17, a4->var11[2], v18);
    objc_msgSend_setOutputChannels_(v10, v19, a4->var10[0][0], v20);
    uint64_t v24 = objc_msgSend_inputLength(v10, v21, v22, v23);
    uint64_t v28 = objc_msgSend_kernelWidth(v10, v25, v26, v27);
    uint64_t v32 = objc_msgSend_kernelStride(v10, v29, v30, v31);
    uint64_t v34 = objc_msgSend_computeOutputLengthWithInputLength_kernelWidth_kernelStride_(v10, v33, v24, v28, v32);
    objc_msgSend_setOutputLength_(v10, v35, v34, v36);
    objc_msgSend_setInitialWeights_(v10, v37, (uint64_t)a4->var13[0], v38);
    objc_msgSend_setInitialBias_(v10, v39, (uint64_t)a4->var14[0], v40);
  }

  return v10;
}

- (void)updatePrimaryCurrentState:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  batch = (MPSStateBatch *)a3;
  id v8 = a4;
  if (a5)
  {
    MPSStateBatchIncrementReadCount(batch, -1);
  }
  else
  {
    MPSStateBatchIncrementReadCount(batch, 1);
    uint64_t v12 = objc_msgSend_primaryCurrentStates(self, v9, v10, v11);
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)batch, (uint64_t)v8);
  }
}

- (void)createKernel
{
  v5 = objc_msgSend_network(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_deviceHandler(v5, v6, v7, v8);
  v134 = objc_msgSend_device(v9, v10, v11, v12);

  objc_msgSend_layerType(self, v13, v14, v15);
  v132 = (objc_class *)objc_opt_class();
  objc_msgSend_layerType(self, v16, v17, v18);
  v130 = (objc_class *)objc_opt_class();
  v133 = objc_msgSend_paddingWithMethod_(MEMORY[0x1E4F35900], v19, 0, v20);
  uint64_t v24 = objc_msgSend_network(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_optimizerParams(v24, v25, v26, v27);
  objc_msgSend_learningRate(v28, v29, v30, v31);
  int v33 = v32;

  v131 = [MLPModelConvolutionDataSource alloc];
  uint64_t v129 = objc_msgSend_kernelWidth(self, v34, v35, v36);
  uint64_t v40 = objc_msgSend_kernelHeight(self, v37, v38, v39);
  uint64_t v44 = objc_msgSend_inputChannels(self, v41, v42, v43);
  uint64_t v48 = objc_msgSend_outputChannels(self, v45, v46, v47);
  uint64_t v52 = objc_msgSend_kernelStride(self, v49, v50, v51);
  v56 = objc_msgSend_name(self, v53, v54, v55);
  uint64_t v60 = objc_msgSend_initialWeights(self, v57, v58, v59);
  uint64_t v64 = objc_msgSend_initialBias(self, v61, v62, v63);
  v68 = objc_msgSend_network(self, v65, v66, v67);
  v72 = objc_msgSend_deviceHandler(v68, v69, v70, v71);
  int v136 = 841731191;
  uint64_t v135 = 0x3F7FBE773F666666;
  int v137 = v33;
  v74 = objc_msgSend_initWithKernelWidth_kernelHeight_inputFeatureChannels_outputFeatureChannels_stride_kernelParamsBinaryName_initialWeights_initialBias_deviceHandler_optimizerOptions_(v131, v73, v129, v40, v44, v48, v52, v56, v60, v64, v72, &v135);

  objc_msgSend_setDataSource_(self, v75, (uint64_t)v74, v76);
  id v77 = [v132 alloc];
  v79 = objc_msgSend_initWithDevice_weights_(v77, v78, (uint64_t)v134, (uint64_t)v74);
  objc_msgSend_setPadding_(v79, v80, (uint64_t)v133, v81);
  objc_msgSend_setForwardKernel_(self, v82, (uint64_t)v79, v83);
  id v84 = [v130 alloc];
  v86 = objc_msgSend_initWithDevice_weights_(v84, v85, (uint64_t)v134, (uint64_t)v74);
  objc_msgSend_setPadding_(v86, v87, (uint64_t)v133, v88);
  objc_msgSend_setPrimaryGradientKernel_(self, v89, (uint64_t)v86, v90);
  if (objc_msgSend_neuronType(self, v91, v92, v93))
  {
    v97 = (void *)MEMORY[0x1E4F35930];
    uint64_t v98 = objc_msgSend_neuronType(self, v94, v95, v96);
    objc_msgSend_neuronA(self, v99, v100, v101);
    int v103 = v102;
    objc_msgSend_neuronB(self, v104, v105, v106);
    int v108 = v107;
    objc_msgSend_neuronC(self, v109, v110, v111);
    LODWORD(v113) = v112;
    LODWORD(v114) = v103;
    LODWORD(v115) = v108;
    v118 = objc_msgSend_cnnNeuronDescriptorWithType_a_b_c_(v97, v116, v98, v117, v114, v115, v113);
    id v119 = objc_alloc(MEMORY[0x1E4F35470]);
    v121 = objc_msgSend_initWithDevice_neuronDescriptor_(v119, v120, (uint64_t)v134, (uint64_t)v118);
    objc_msgSend_setSecondaryForwardKernel_(self, v122, (uint64_t)v121, v123);

    id v124 = objc_alloc(MEMORY[0x1E4F35480]);
    v126 = objc_msgSend_initWithDevice_neuronDescriptor_(v124, v125, (uint64_t)v134, (uint64_t)v118);
    objc_msgSend_setSecondaryGradientKernel_(self, v127, (uint64_t)v126, v128);
  }
}

- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v14 = objc_msgSend_forwardKernel(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_secondaryForwardKernel(self, v15, v16, v17);
  objc_msgSend_updateInputToFirstKernel_inference_(self, v19, (uint64_t)v10, v6);
  id v33 = 0;
  uint64_t v21 = objc_msgSend_encodeBatchToCommandBuffer_sourceImages_destinationStates_destinationStateIsTemporary_(v14, v20, (uint64_t)v9, (uint64_t)v10, &v33, 1);
  id v22 = v33;
  objc_msgSend_updatePrimaryCurrentState_inference_(self, v23, (uint64_t)v22, v6);
  id v24 = v21;

  uint64_t v26 = v24;
  if (v18)
  {
    uint64_t v31 = v14;
    objc_msgSend_updateInputToSecondKernel_inference_(self, v25, (uint64_t)v24, v6);
    id v32 = 0;
    uint64_t v26 = objc_msgSend_encodeBatchToCommandBuffer_sourceImages_destinationStates_destinationStateIsTemporary_(v18, v27, (uint64_t)v9, (uint64_t)v24, &v32, 1);
    id v28 = v32;
    objc_msgSend_updateSecondaryCurrentState_inference_(self, v29, (uint64_t)v28, v6);

    uint64_t v14 = v31;
  }

  return v26;
}

- (id)backward:(id)a3 inputGradient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = objc_msgSend_secondaryGradientKernel(self, v8, v9, v10);
  uint64_t v15 = v7;
  if (v14)
  {
    uint64_t v16 = objc_msgSend_inputToSecondKernel(self, v11, v12, v13);
    uint64_t v20 = objc_msgSend_secondaryCurrentState(self, v17, v18, v19);
    uint64_t v15 = objc_msgSend_encodeBatchToCommandBuffer_sourceGradients_sourceImages_gradientStates_(v14, v21, (uint64_t)v6, (uint64_t)v7, v16, v20);
  }
  id v22 = objc_msgSend_forwardKernel(self, v11, v12, v13);
  uint64_t v26 = objc_msgSend_primaryGradientKernel(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_inputToFirstKernel(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_primaryCurrentState(self, v31, v32, v33);
  objc_msgSend_encodeBatchToCommandBuffer_sourceGradients_sourceImages_gradientStates_(v26, v35, (uint64_t)v6, (uint64_t)v15, v30, v34);
  id v68 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v39 = objc_msgSend_primaryCurrentState(self, v36, v37, v38);
  uint64_t v42 = objc_msgSend_objectAtIndex_(v39, v40, 0, v41);
  uint64_t v46 = objc_msgSend_dataSource(self, v43, v44, v45);
  id v48 = (id)objc_msgSend_updateWithCommandBuffer_gradientState_(v46, v47, (uint64_t)v6, (uint64_t)v42);

  uint64_t v52 = objc_msgSend_dataSource(self, v49, v50, v51);
  v56 = objc_msgSend_state(v52, v53, v54, v55);
  objc_msgSend_reloadWeightsAndBiasesWithCommandBuffer_state_(v22, v57, (uint64_t)v6, (uint64_t)v56);

  v61 = objc_msgSend_dataSource(self, v58, v59, v60);
  v65 = objc_msgSend_state(v61, v62, v63, v64);
  objc_msgSend_reloadWeightsAndBiasesWithCommandBuffer_state_(v26, v66, (uint64_t)v6, (uint64_t)v65);

  return v68;
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  bzero(v96, 0x2C0uLL);
  uint64_t v97 = 0;
  v96[4] = 0;
  v96[5] = 0;
  v96[0] = 11;
  if (objc_msgSend_neuronType(self, v10, v11, v12) == 1)
  {
    uint64_t v16 = 5;
  }
  else
  {
    if (objc_msgSend_neuronType(self, v13, v14, v15) != 3) {
      goto LABEL_6;
    }
    uint64_t v16 = 1;
  }
  uint64_t v97 = v16;
LABEL_6:
  uint64_t v17 = objc_msgSend_dataSource(self, v13, v14, v15);
  objc_msgSend_weightsInWHIOOrder(v17, v18, v19, v20);
  id v95 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v24 = objc_msgSend_dataSource(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_sizeWeights(v24, v25, v26, v27);
  sub_19E3107A4(v28);
  uint64_t v30 = v29;

  id v31 = v95;
  uint64_t v35 = (const void *)objc_msgSend_bytes(v31, v32, v33, v34);
  uint64_t v39 = objc_msgSend_dataSource(self, v36, v37, v38);
  uint64_t v43 = objc_msgSend_sizeWeights(v39, v40, v41, v42);
  memcpy(v30, v35, 4 * v43);

  uint64_t v106 = v30;
  uint64_t v47 = objc_msgSend_dataSource(self, v44, v45, v46);
  uint64_t v51 = objc_msgSend_sizeBias(v47, v48, v49, v50);
  sub_19E3107A4(v51);
  v53 = v52;

  v57 = objc_msgSend_dataSource(self, v54, v55, v56);
  objc_msgSend_biasBuffer(v57, v58, v59, v60);
  id v61 = objc_claimAutoreleasedReturnValue();
  v65 = (const void *)objc_msgSend_contents(v61, v62, v63, v64);
  v69 = objc_msgSend_dataSource(self, v66, v67, v68);
  uint64_t v73 = objc_msgSend_sizeBias(v69, v70, v71, v72);
  memcpy(v53, v65, 4 * v73);

  int v107 = v53;
  int v98 = objc_msgSend_inputLength(self, v74, v75, v76);
  int v99 = 1;
  int v100 = objc_msgSend_inputChannels(self, v77, v78, v79);
  int v101 = objc_msgSend_outputChannels(self, v80, v81, v82);
  int v102 = objc_msgSend_kernelWidth(self, v83, v84, v85);
  int v103 = objc_msgSend_kernelHeight(self, v86, v87, v88);
  int v104 = objc_msgSend_kernelStride(self, v89, v90, v91);
  int v105 = 1;
  uint64_t v93 = objc_msgSend_generateNode_model_weightIter_params_(self, v92, (uint64_t)v8, (uint64_t)v9, a5, v96);

  return v93;
}

- (MLPModelConvolutionDataSource)dataSource
{
  return (MLPModelConvolutionDataSource *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDataSource:(id)a3
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
}

@end