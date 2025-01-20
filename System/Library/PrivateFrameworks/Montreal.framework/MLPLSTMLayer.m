@interface MLPLSTMLayer
- (MLPLSTMLayer)initWithName:(id)a3 inputSize:(unint64_t)a4 outputSize:(unint64_t)a5 weightAttributes:(unint64_t)a6;
- (MLPLSTMLayer)initWithName:(id)a3 parameters:(id *)a4;
- (MPSLSTMDescriptor)lstmDesc;
- (MPSRNNMatrixTrainingLayer)filter;
- (NSArray)srcMatrices;
- (NSMutableArray)optimizers;
- (NSMutableArray)trainingStates;
- (NSMutableArray)weightGradients;
- (NSMutableArray)weights;
- (float)initialBias_0;
- (float)initialBias_1;
- (float)initialWeights_0;
- (float)initialWeights_1;
- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5;
- (id)matrixIDToString:(unint64_t)a3;
- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5;
- (id)seqBackwardCombinedMatrix:(id)a3 inputGradient:(id)a4;
- (id)seqBackwardDifferentMatrices:(id)a3 inputGradient:(id)a4;
- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6;
- (id)seqForwardCombinedMatrix:(id)a3 input:(id)a4;
- (id)seqForwardDifferentMatrices:(id)a3 input:(id)a4;
- (int)cellGateActivation;
- (int)cellToOutputActivation;
- (int)forgetGateActivation;
- (int)inputGateActivation;
- (int)outputGateActivation;
- (unint64_t)inputSize;
- (unint64_t)outputSize;
- (unint64_t)weightAttributes;
- (void)createKernel;
- (void)exportWeightsWithWeightMatrix:(id)a3 weightID:(unint64_t)a4 destination:(float *)a5 recurrent:(BOOL)a6;
- (void)populateActivation:(int *)a3 montrealActivationType:(int64_t)a4;
- (void)setCellGateActivation:(int)a3;
- (void)setCellToOutputActivation:(int)a3;
- (void)setFilter:(id)a3;
- (void)setForgetGateActivation:(int)a3;
- (void)setInitialBias_0:(float *)a3;
- (void)setInitialBias_1:(float *)a3;
- (void)setInitialWeights_0:(float *)a3;
- (void)setInitialWeights_1:(float *)a3;
- (void)setInputGateActivation:(int)a3;
- (void)setInputSize:(unint64_t)a3;
- (void)setLstmDesc:(id)a3;
- (void)setOptimizers:(id)a3;
- (void)setOutputGateActivation:(int)a3;
- (void)setOutputSize:(unint64_t)a3;
- (void)setSrcMatrices:(id)a3;
- (void)setTrainingStates:(id)a3;
- (void)setWeightAttributes:(unint64_t)a3;
- (void)setWeightGradients:(id)a3;
- (void)setWeights:(id)a3;
- (void)updateSourceMatrix:(id)a3 inference:(BOOL)a4;
@end

@implementation MLPLSTMLayer

- (MLPLSTMLayer)initWithName:(id)a3 inputSize:(unint64_t)a4 outputSize:(unint64_t)a5 weightAttributes:(unint64_t)a6
{
  id v10 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MLPLSTMLayer;
  v11 = [(MLPLayer *)&v38 initWithLayerType:8 name:v10 neuronType:0 neuronParams:0];
  v14 = v11;
  if (v11)
  {
    objc_msgSend_setInputLength_(v11, v12, 1, v13);
    objc_msgSend_setInputSize_(v14, v15, a4, v16);
    objc_msgSend_setOutputLength_(v14, v17, 1, v18);
    objc_msgSend_setOutputSize_(v14, v19, a5, v20);
    objc_msgSend_setInputChannels_(v14, v21, a4, v22);
    objc_msgSend_setOutputChannels_(v14, v23, a5, v24);
    objc_msgSend_setWeightAttributes_(v14, v25, a6, v26);
    objc_msgSend_setInputGateActivation_(v14, v27, 3, v28);
    objc_msgSend_setForgetGateActivation_(v14, v29, 3, v30);
    objc_msgSend_setCellGateActivation_(v14, v31, 5, v32);
    objc_msgSend_setOutputGateActivation_(v14, v33, 3, v34);
    objc_msgSend_setCellToOutputActivation_(v14, v35, 5, v36);
  }

  return v14;
}

- (MLPLSTMLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v6 = a3;
  v8 = (MLPLSTMLayer *)objc_msgSend_initWithName_inputSize_outputSize_weightAttributes_(self, v7, (uint64_t)v6, a4->var9[0][0], a4->var10[0][0], a4->var8);
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setInitialWeights_0_(v8, v9, (uint64_t)a4->var13[0], v10);
    objc_msgSend_setInitialWeights_1_(v11, v12, (uint64_t)a4->var13[1], v13);
    objc_msgSend_setInitialBias_0_(v11, v14, (uint64_t)a4->var14[0], v15);
    objc_msgSend_setInitialBias_1_(v11, v16, (uint64_t)a4->var14[1], v17);
    objc_msgSend_populateActivation_montrealActivationType_(v11, v18, (uint64_t)&v11->_inputGateActivation, a4->var7[0]);
    objc_msgSend_populateActivation_montrealActivationType_(v11, v19, (uint64_t)&v11->_forgetGateActivation, a4->var7[1]);
    objc_msgSend_populateActivation_montrealActivationType_(v11, v20, (uint64_t)&v11->_cellGateActivation, a4->var7[2]);
    objc_msgSend_populateActivation_montrealActivationType_(v11, v21, (uint64_t)&v11->_outputGateActivation, a4->var7[3]);
    objc_msgSend_populateActivation_montrealActivationType_(v11, v22, (uint64_t)&v11->_cellToOutputActivation, a4->var7[4]);
  }

  return v11;
}

- (void)populateActivation:(int *)a3 montrealActivationType:(int64_t)a4
{
  if (a4) {
    *a3 = objc_msgSend_mpsNeuronTypeFromMontrealType_(self, a2, a4, a4);
  }
}

- (void)createKernel
{
  v283 = self;
  v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  objc_msgSend_setOptimizers_(self, v6, (uint64_t)v5, v7);

  v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
  objc_msgSend_setWeights_(self, v12, (uint64_t)v11, v13);

  uint64_t v17 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16);
  objc_msgSend_setWeightGradients_(v283, v18, (uint64_t)v17, v19);

  v23 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v20, v21, v22);
  objc_msgSend_setTrainingStates_(v283, v24, (uint64_t)v23, v25);

  v29 = objc_msgSend_network(v283, v26, v27, v28);
  v33 = objc_msgSend_deviceHandler(v29, v30, v31, v32);
  v37 = objc_msgSend_device(v33, v34, v35, v36);

  v282 = &v283;
  objc_super v38 = (void *)MEMORY[0x1E4F35610];
  uint64_t v42 = objc_msgSend_inputSize(v283, v39, v40, v41);
  uint64_t v46 = objc_msgSend_outputSize(v283, v43, v44, v45);
  v48 = objc_msgSend_createLSTMDescriptorWithInputFeatureChannels_outputFeatureChannels_(v38, v47, v42, v46);
  objc_msgSend_setLstmDesc_(v283, v49, (uint64_t)v48, v50);

  uint64_t v54 = objc_msgSend_inputGateActivation(v283, v51, v52, v53);
  uint64_t v58 = objc_msgSend_inputSize(v283, v55, v56, v57);
  uint64_t v62 = objc_msgSend_outputSize(v283, v59, v60, v61);
  v63 = sub_19E316620((void ***)&v282, 3, v54, v58, v62);
  v67 = objc_msgSend_lstmDesc(v283, v64, v65, v66);
  objc_msgSend_setInputGateInputWeights_(v67, v68, (uint64_t)v63, v69);

  uint64_t v73 = objc_msgSend_outputSize(v283, v70, v71, v72);
  uint64_t v77 = objc_msgSend_outputSize(v283, v74, v75, v76);
  v78 = sub_19E316620((void ***)&v282, 4, 0, v73, v77);
  v82 = objc_msgSend_lstmDesc(v283, v79, v80, v81);
  objc_msgSend_setInputGateRecurrentWeights_(v82, v83, (uint64_t)v78, v84);

  uint64_t v88 = objc_msgSend_forgetGateActivation(v283, v85, v86, v87);
  uint64_t v92 = objc_msgSend_inputSize(v283, v89, v90, v91);
  uint64_t v96 = objc_msgSend_outputSize(v283, v93, v94, v95);
  v97 = sub_19E316620((void ***)&v282, 7, v88, v92, v96);
  v101 = objc_msgSend_lstmDesc(v283, v98, v99, v100);
  objc_msgSend_setForgetGateInputWeights_(v101, v102, (uint64_t)v97, v103);

  uint64_t v107 = objc_msgSend_outputSize(v283, v104, v105, v106);
  uint64_t v111 = objc_msgSend_outputSize(v283, v108, v109, v110);
  v112 = sub_19E316620((void ***)&v282, 8, 0, v107, v111);
  v116 = objc_msgSend_lstmDesc(v283, v113, v114, v115);
  objc_msgSend_setForgetGateRecurrentWeights_(v116, v117, (uint64_t)v112, v118);

  uint64_t v122 = objc_msgSend_cellGateActivation(v283, v119, v120, v121);
  uint64_t v126 = objc_msgSend_inputSize(v283, v123, v124, v125);
  uint64_t v130 = objc_msgSend_outputSize(v283, v127, v128, v129);
  v131 = sub_19E316620((void ***)&v282, 11, v122, v126, v130);
  v135 = objc_msgSend_lstmDesc(v283, v132, v133, v134);
  objc_msgSend_setCellGateInputWeights_(v135, v136, (uint64_t)v131, v137);

  uint64_t v141 = objc_msgSend_outputSize(v283, v138, v139, v140);
  uint64_t v145 = objc_msgSend_outputSize(v283, v142, v143, v144);
  v146 = sub_19E316620((void ***)&v282, 12, 0, v141, v145);
  v150 = objc_msgSend_lstmDesc(v283, v147, v148, v149);
  objc_msgSend_setCellGateRecurrentWeights_(v150, v151, (uint64_t)v146, v152);

  uint64_t v156 = objc_msgSend_outputGateActivation(v283, v153, v154, v155);
  uint64_t v160 = objc_msgSend_inputSize(v283, v157, v158, v159);
  uint64_t v164 = objc_msgSend_outputSize(v283, v161, v162, v163);
  v165 = sub_19E316620((void ***)&v282, 15, v156, v160, v164);
  v169 = objc_msgSend_lstmDesc(v283, v166, v167, v168);
  objc_msgSend_setOutputGateInputWeights_(v169, v170, (uint64_t)v165, v171);

  uint64_t v175 = objc_msgSend_outputSize(v283, v172, v173, v174);
  uint64_t v179 = objc_msgSend_outputSize(v283, v176, v177, v178);
  v180 = sub_19E316620((void ***)&v282, 16, 0, v175, v179);
  v184 = objc_msgSend_lstmDesc(v283, v181, v182, v183);
  objc_msgSend_setOutputGateRecurrentWeights_(v184, v185, (uint64_t)v180, v186);

  uint64_t v190 = objc_msgSend_cellToOutputActivation(v283, v187, v188, v189);
  v194 = objc_msgSend_lstmDesc(v283, v191, v192, v193);
  objc_msgSend_setCellToOutputNeuronType_(v194, v195, v190, v196);

  v200 = objc_msgSend_lstmDesc(v283, v197, v198, v199);
  objc_msgSend_setUseFloat32Weights_(v200, v201, 1, v202);

  id v203 = objc_alloc(MEMORY[0x1E4F35970]);
  v207 = objc_msgSend_lstmDesc(v283, v204, v205, v206);
  v211 = objc_msgSend_weights(v283, v208, v209, v210);
  v213 = objc_msgSend_initWithDevice_rnnDescriptor_trainableWeights_(v203, v212, (uint64_t)v37, (uint64_t)v207, v211);
  objc_msgSend_setFilter_(v283, v214, (uint64_t)v213, v215);

  v219 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v216, v217, v218);
  v223 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v220, v221, v222);
  v227 = objc_msgSend_filter(v283, v224, v225, v226);
  objc_msgSend_createWeightMatrices_(v227, v228, (uint64_t)v219, v229);

  v279[0] = MEMORY[0x1E4F143A8];
  v279[1] = 3221225472;
  v279[2] = sub_19E31679C;
  v279[3] = &unk_1E599D380;
  id v230 = v223;
  id v280 = v230;
  v281 = v283;
  v269 = (void *)MEMORY[0x19F3BC450](v279);
  v234 = objc_msgSend_filter(v283, v231, v232, v233);
  v238 = objc_msgSend_weightGradients(v283, v235, v236, v237);
  objc_msgSend_createWeightGradientMatrices_dataType_(v234, v239, (uint64_t)v238, 268435488);

  id v240 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v244 = objc_msgSend_count(v219, v241, v242, v243);
  v247 = objc_msgSend_initWithCapacity_(v240, v245, v244, v246);
  objc_msgSend_setOptimizers_(v283, v248, (uint64_t)v247, v249, v223);

  for (unint64_t i = 0; i < objc_msgSend_count(v219, v250, v251, v252); ++i)
  {
    v278[0] = MEMORY[0x1E4F143A8];
    v278[1] = 3221225472;
    v278[2] = sub_19E316828;
    v278[3] = &unk_1E599D3A8;
    v278[4] = v283;
    v254 = (void *)MEMORY[0x19F3BC450](v278);
    v258 = objc_msgSend_network(v283, v255, v256, v257);
    v274[0] = MEMORY[0x1E4F143A8];
    v274[1] = 3221225472;
    v274[2] = sub_19E316950;
    v274[3] = &unk_1E599D3D0;
    id v259 = v254;
    id v276 = v259;
    id v275 = v219;
    unint64_t v277 = i;
    v270[0] = MEMORY[0x1E4F143A8];
    v270[1] = 3221225472;
    v270[2] = sub_19E316968;
    v270[3] = &unk_1E599D3F8;
    id v271 = v269;
    id v260 = v259;
    id v272 = v260;
    unint64_t v273 = i;
    v262 = objc_msgSend_optimizerWithNetwork_momentum_velocity_(MLPOptimizer, v261, (uint64_t)v258, (uint64_t)v274, v270);

    v266 = objc_msgSend_optimizers(v283, v263, v264, v265);
    objc_msgSend_addObject_(v266, v267, (uint64_t)v262, v268);
  }
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  objc_msgSend_updateSourceMatrix_inference_(self, v11, (uint64_t)v10, v6);
  uint64_t v15 = objc_msgSend_trainingStates(self, v12, v13, v14);
  objc_msgSend_removeAllObjects(v15, v16, v17, v18);

  uint64_t v22 = objc_msgSend_nextLayer(self, v19, v20, v21);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    objc_msgSend_seqForwardDifferentMatrices_input_(self, v24, (uint64_t)v9, (uint64_t)v10);
  }
  else {
  uint64_t v28 = objc_msgSend_seqForwardCombinedMatrix_input_(self, v24, (uint64_t)v9, (uint64_t)v10);
  }
  if (v6)
  {
    objc_msgSend_trainingStates(self, v25, v26, v27);
    v29 = (MPSStateBatch *)objc_claimAutoreleasedReturnValue();
    MPSStateBatchIncrementReadCount(v29, -1);

    v33 = objc_msgSend_trainingStates(self, v30, v31, v32);
    objc_msgSend_removeAllObjects(v33, v34, v35, v36);
  }

  return v28;
}

- (id)seqForwardDifferentMatrices:(id)a3 input:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA48];
  id v72 = v7;
  uint64_t v12 = objc_msgSend_count(v7, v9, v10, v11);
  uint64_t v15 = objc_msgSend_arrayWithCapacity_(v8, v13, v12, v14);
  uint64_t v19 = objc_msgSend_network(self, v16, v17, v18);
  v23 = objc_msgSend_deviceHandler(v19, v20, v21, v22);
  uint64_t v71 = objc_msgSend_device(v23, v24, v25, v26);

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v27 = v72;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v73, (uint64_t)v77, 16);
  if (v32)
  {
    uint64_t v33 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v74 != v33) {
          objc_enumerationMutation(v27);
        }
        uint64_t v35 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        uint64_t v36 = objc_msgSend_network(self, v29, v30, v31, v71);
        uint64_t v40 = objc_msgSend_deviceHandler(v36, v37, v38, v39);
        uint64_t v44 = objc_msgSend_rows(v35, v41, v42, v43);
        uint64_t v48 = objc_msgSend_outputSize(self, v45, v46, v47);
        uint64_t v50 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v40, v49, v44, v48, v6);

        objc_msgSend_addObject_(v15, v51, (uint64_t)v50, v52);
      }
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v73, (uint64_t)v77, 16);
    }
    while (v32);
  }

  uint64_t v56 = objc_msgSend_filter(self, v53, v54, v55);
  uint64_t v60 = objc_msgSend_trainingStates(self, v57, v58, v59);
  v64 = objc_msgSend_weights(self, v61, v62, v63);
  objc_msgSend_encodeForwardSequenceToCommandBuffer_sourceMatrices_destinationMatrices_trainingStates_weights_(v56, v65, (uint64_t)v6, (uint64_t)v27, v15, v60, v64);

  uint64_t v69 = objc_msgSend_copy(v15, v66, v67, v68);

  return v69;
}

- (id)seqForwardCombinedMatrix:(id)a3 input:(id)a4
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v12 = objc_msgSend_count(v7, v9, v10, v11);
  uint64_t v15 = objc_msgSend_arrayWithCapacity_(v8, v13, v12, v14);
  uint64_t v19 = objc_msgSend_network(self, v16, v17, v18);
  v23 = objc_msgSend_deviceHandler(v19, v20, v21, v22);
  id v27 = objc_msgSend_device(v23, v24, v25, v26);

  uint64_t v31 = 0;
  for (unint64_t i = 0; i < objc_msgSend_count(v7, v28, v29, v30); ++i)
  {
    uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(v7, v33, i, v35);
    v31 += objc_msgSend_rows(v36, v37, v38, v39);
  }
  uint64_t v40 = objc_msgSend_network(self, v33, v34, v35);
  uint64_t v44 = objc_msgSend_deviceHandler(v40, v41, v42, v43);
  uint64_t v48 = objc_msgSend_outputSize(self, v45, v46, v47);
  uint64_t v50 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v44, v49, v31, v48, v6);

  unint64_t v54 = objc_msgSend_count(v7, v51, v52, v53);
  __p = 0;
  if (v54)
  {
    if (v54 >> 61) {
      sub_19E13D694();
    }
    size_t v58 = 8 * v54;
    uint64_t v59 = operator new(8 * v54);
    __p = v59;
    bzero(v59, v58);
  }
  else
  {
    uint64_t v59 = 0;
  }
  uint64_t v60 = 0;
  for (unint64_t j = 0; j < objc_msgSend_count(v7, v55, v56, v57); ++j)
  {
    objc_msgSend_addObject_(v15, v62, (uint64_t)v50, v64);
    *((void *)v59 + j) = objc_msgSend_rowBytes(v50, v65, v66, v67) * v60;
    v70 = objc_msgSend_objectAtIndexedSubscript_(v7, v68, j, v69);
    v60 += objc_msgSend_rows(v70, v71, v72, v73);
  }
  long long v74 = objc_msgSend_filter(self, v62, v63, v64);
  uint64_t v78 = objc_msgSend_trainingStates(self, v75, v76, v77);
  v82 = objc_msgSend_weights(self, v79, v80, v81);
  objc_msgSend_encodeForwardSequenceToCommandBuffer_sourceMatrices_sourceOffsets_destinationMatrices_destinationOffsets_trainingStates_recurrentInputState_recurrentOutputStates_weights_(v74, v83, (uint64_t)v6, (uint64_t)v7, 0, v15, v59, v78, 0, 0, v82);

  v88[0] = v50;
  v85 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v84, (uint64_t)v88, 1);
  if (__p) {
    operator delete(__p);
  }

  return v85;
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_nextLayer(self, v11, v12, v13);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    objc_msgSend_seqBackwardDifferentMatrices_inputGradient_(self, v16, (uint64_t)v8, (uint64_t)v10);
  }
  else {
  uint64_t v20 = objc_msgSend_seqBackwardCombinedMatrix_inputGradient_(self, v16, (uint64_t)v8, (uint64_t)v10);
  }
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v22 = objc_msgSend_weights(self, v17, v18, v19);
    unint64_t v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (i >= v26) {
      break;
    }
    uint64_t v30 = objc_msgSend_weights(self, v27, v28, v29);
    uint64_t v33 = objc_msgSend_objectAtIndexedSubscript_(v30, v31, i, v32);

    v37 = objc_msgSend_weightGradients(self, v34, v35, v36);
    uint64_t v40 = objc_msgSend_objectAtIndexedSubscript_(v37, v38, i, v39);

    uint64_t v44 = objc_msgSend_optimizers(self, v41, v42, v43);
    uint64_t v47 = objc_msgSend_objectAtIndexedSubscript_(v44, v45, i, v46);

    objc_msgSend_encodeToCommandBuffer_inputGradientMatrix_inputValuesMatrix_(v47, v48, (uint64_t)v8, (uint64_t)v40, v33);
  }

  return v20;
}

- (id)seqBackwardDifferentMatrices:(id)a3 inputGradient:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA48];
  id v76 = v7;
  uint64_t v12 = objc_msgSend_count(v7, v9, v10, v11);
  uint64_t v15 = objc_msgSend_arrayWithCapacity_(v8, v13, v12, v14);
  uint64_t v19 = objc_msgSend_network(self, v16, v17, v18);
  v23 = objc_msgSend_deviceHandler(v19, v20, v21, v22);
  long long v75 = objc_msgSend_device(v23, v24, v25, v26);

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v27 = v76;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v77, (uint64_t)v81, 16);
  if (v32)
  {
    uint64_t v33 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v78 != v33) {
          objc_enumerationMutation(v27);
        }
        uint64_t v35 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        uint64_t v36 = objc_msgSend_network(self, v29, v30, v31);
        uint64_t v40 = objc_msgSend_deviceHandler(v36, v37, v38, v39);
        uint64_t v44 = objc_msgSend_rows(v35, v41, v42, v43);
        uint64_t v48 = objc_msgSend_inputSize(self, v45, v46, v47);
        uint64_t v50 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v40, v49, v44, v48, v6);

        objc_msgSend_addObject_(v15, v51, (uint64_t)v50, v52);
      }
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v77, (uint64_t)v81, 16);
    }
    while (v32);
  }

  uint64_t v56 = objc_msgSend_filter(self, v53, v54, v55);
  uint64_t v60 = objc_msgSend_srcMatrices(self, v57, v58, v59);
  uint64_t v64 = objc_msgSend_weightGradients(self, v61, v62, v63);
  uint64_t v68 = objc_msgSend_trainingStates(self, v65, v66, v67);
  uint64_t v72 = objc_msgSend_weights(self, v69, v70, v71);
  objc_msgSend_encodeGradientSequenceToCommandBuffer_forwardSources_sourceGradients_destinationGradients_weightGradients_trainingStates_weights_(v56, v73, (uint64_t)v6, (uint64_t)v60, v27, v15, v64, v68, v72);

  return v15;
}

- (id)seqBackwardCombinedMatrix:(id)a3 inputGradient:(id)a4
{
  id v163 = a3;
  id v6 = a4;
  v166 = objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0, v8);
  id v9 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v13 = objc_msgSend_srcMatrices(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_count(v13, v14, v15, v16);
  uint64_t v164 = objc_msgSend_arrayWithCapacity_(v9, v18, v17, v19);

  uint64_t v20 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v24 = objc_msgSend_srcMatrices(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_count(v24, v25, v26, v27);
  objc_msgSend_arrayWithCapacity_(v20, v29, v28, v30);
  id v162 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v34 = objc_msgSend_network(self, v31, v32, v33);
  uint64_t v38 = objc_msgSend_deviceHandler(v34, v35, v36, v37);
  uint64_t v160 = objc_msgSend_device(v38, v39, v40, v41);

  uint64_t v45 = objc_msgSend_srcMatrices(self, v42, v43, v44);
  unint64_t v49 = objc_msgSend_count(v45, v46, v47, v48);
  if (v49)
  {
    if (v49 >> 61) {
      sub_19E13D694();
    }
    size_t v50 = 8 * v49;
    __p = operator new(8 * v49);
    bzero(__p, v50);
  }
  else
  {
    __p = 0;
  }

  v51 = (void *)MEMORY[0x1E4F35640];
  uint64_t v55 = objc_msgSend_columns(v166, v52, v53, v54);
  uint64_t v59 = objc_msgSend_rowBytes(v166, v56, v57, v58);
  uint64_t v63 = objc_msgSend_dataType(v166, v60, v61, v62);
  uint64_t v167 = objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(v51, v64, 1, v55, v59, v63);
  uint64_t v159 = v6;
  v161 = objc_msgSend_data(v166, v65, v66, v67);
  uint64_t v168 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v72 = objc_msgSend_srcMatrices(self, v68, v69, v70);
    unint64_t v76 = objc_msgSend_count(v72, v73, v74, v75);

    if (i >= v76) {
      break;
    }
    *((void *)__p + i) = v168;
    long long v80 = objc_msgSend_srcMatrices(self, v77, v78, v79);
    v83 = objc_msgSend_objectAtIndexedSubscript_(v80, v81, i, v82);
    uint64_t v87 = objc_msgSend_rows(v83, v84, v85, v86);
    uint64_t v91 = objc_msgSend_rowBytes(v166, v88, v89, v90);

    uint64_t v95 = objc_msgSend_srcMatrices(self, v92, v93, v94);
    v98 = objc_msgSend_objectAtIndexedSubscript_(v95, v96, i, v97);
    uint64_t v102 = objc_msgSend_rows(v98, v99, v100, v101);
    objc_msgSend_setRows_(v167, v103, v102, v104);

    id v105 = objc_alloc(MEMORY[0x1E4F35618]);
    uint64_t v107 = objc_msgSend_initWithBuffer_descriptor_(v105, v106, (uint64_t)v161, (uint64_t)v167);
    objc_msgSend_addObject_(v164, v108, (uint64_t)v107, v109);
    v113 = objc_msgSend_network(self, v110, v111, v112);
    v117 = objc_msgSend_deviceHandler(v113, v114, v115, v116);
    uint64_t v121 = objc_msgSend_srcMatrices(self, v118, v119, v120);
    uint64_t v124 = objc_msgSend_objectAtIndexedSubscript_(v121, v122, i, v123);
    uint64_t v128 = objc_msgSend_rows(v124, v125, v126, v127);
    uint64_t v132 = objc_msgSend_inputSize(self, v129, v130, v131);
    uint64_t v134 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v117, v133, v128, v132, v163);

    objc_msgSend_addObject_(v162, v135, (uint64_t)v134, v136);
    v168 += v91 * v87;
  }
  uint64_t v137 = objc_msgSend_filter(self, v77, v78, v79);
  uint64_t v141 = objc_msgSend_srcMatrices(self, v138, v139, v140);
  uint64_t v145 = objc_msgSend_weightGradients(self, v142, v143, v144);
  uint64_t v149 = objc_msgSend_trainingStates(self, v146, v147, v148);
  v153 = objc_msgSend_weights(self, v150, v151, v152);
  objc_msgSend_encodeGradientSequenceToCommandBuffer_forwardSources_forwardSourceOffsets_sourceGradients_sourceGradientOffsets_destinationGradients_destinationOffsets_weightGradients_trainingStates_recurrentInputState_recurrentOutputStates_weights_(v137, v154, (uint64_t)v163, (uint64_t)v141, 0, v164, __p, v162, 0, v145, v149, 0, 0, v153);

  objc_msgSend_decrementReadCount(v166, v155, v156, v157);
  if (__p) {
    operator delete(__p);
  }

  return v162;
}

- (void)updateSourceMatrix:(id)a3 inference:(BOOL)a4
{
  id v8 = a3;
  if (!a4)
  {
    sub_19E310690(v8);
    objc_msgSend_setSrcMatrices_(self, v6, (uint64_t)v8, v7);
  }
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  uint64_t v281 = *MEMORY[0x1E4F143B8];
  unint64_t v273 = self;
  a3;
  a4;
  uint64_t v10 = objc_msgSend_network(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_deviceHandler(v10, v11, v12, v13);
  objc_msgSend_device(v14, v15, v16, v17);
  objc_claimAutoreleasedReturnValue();

  uint64_t v21 = objc_msgSend_network(v273, v18, v19, v20);
  uint64_t v25 = objc_msgSend_deviceHandler(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_commandQueue(v25, v26, v27, v28);

  id v272 = objc_msgSend_commandBuffer(v29, v30, v31, v32);
  bzero(v267, 0x2C0uLL);
  v267[5] = 0;
  v267[4] = 0;
  v267[0] = 5;
  v267[15] = objc_msgSend_weightAttributes(v273, v33, v34, v35) | 0x80;
  uint64_t v36 = v273;
  uint64_t v40 = objc_msgSend_inputGateActivation(v273, v37, v38, v39);
  v267[7] = objc_msgSend_montrealTypeFromMPSNeuronType_(v36, v41, v40, v42);
  uint64_t v43 = v273;
  uint64_t v47 = objc_msgSend_forgetGateActivation(v273, v44, v45, v46);
  v267[8] = objc_msgSend_montrealTypeFromMPSNeuronType_(v43, v48, v47, v49);
  size_t v50 = v273;
  uint64_t v54 = objc_msgSend_cellGateActivation(v273, v51, v52, v53);
  v267[9] = objc_msgSend_montrealTypeFromMPSNeuronType_(v50, v55, v54, v56);
  uint64_t v57 = v273;
  uint64_t v61 = objc_msgSend_outputGateActivation(v273, v58, v59, v60);
  v267[10] = objc_msgSend_montrealTypeFromMPSNeuronType_(v57, v62, v61, v63);
  uint64_t v64 = v273;
  uint64_t v68 = objc_msgSend_cellToOutputActivation(v273, v65, v66, v67);
  v267[11] = objc_msgSend_montrealTypeFromMPSNeuronType_(v64, v69, v68, v70);
  int v268 = objc_msgSend_inputSize(v273, v71, v72, v73);
  int v269 = objc_msgSend_outputSize(v273, v74, v75, v76);
  long long v80 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v77, v78, v79);
  v266[0] = &v273;
  v266[1] = &v272;
  long long v262 = 0u;
  long long v263 = 0u;
  long long v264 = 0u;
  long long v265 = 0u;
  uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B3698, v81, (uint64_t)&v262, (uint64_t)v280, 16);
  if (v85)
  {
    uint64_t v86 = *(void *)v263;
    do
    {
      for (uint64_t i = 0; i != v85; ++i)
      {
        if (*(void *)v263 != v86) {
          objc_enumerationMutation(&unk_1EF0B3698);
        }
        uint64_t v88 = *(void **)(*((void *)&v262 + 1) + 8 * i);
        uint64_t v89 = objc_msgSend_network(v273, v82, v83, v84);
        uint64_t v93 = objc_msgSend_deviceHandler(v89, v90, v91, v92);
        uint64_t v97 = objc_msgSend_outputSize(v273, v94, v95, v96);
        uint64_t v101 = objc_msgSend_inputSize(v273, v98, v99, v100);
        uint64_t v103 = objc_msgSend_weightMatrixFixedRowBytesWithRows_columns_(v93, v102, v97, v101);

        objc_msgSend_setObject_forKeyedSubscript_(v80, v104, (uint64_t)v103, (uint64_t)v88);
        sub_19E318BE0((uint64_t)v266, v88, v103);
      }
      uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B3698, v82, (uint64_t)&v262, (uint64_t)v280, 16);
    }
    while (v85);
  }
  long long v260 = 0u;
  long long v261 = 0u;
  long long v258 = 0u;
  long long v259 = 0u;
  uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B36B0, v82, (uint64_t)&v258, (uint64_t)v279, 16);
  if (v108)
  {
    uint64_t v109 = *(void *)v259;
    do
    {
      for (uint64_t j = 0; j != v108; ++j)
      {
        if (*(void *)v259 != v109) {
          objc_enumerationMutation(&unk_1EF0B36B0);
        }
        uint64_t v111 = *(void **)(*((void *)&v258 + 1) + 8 * j);
        uint64_t v112 = objc_msgSend_network(v273, v105, v106, v107);
        uint64_t v116 = objc_msgSend_deviceHandler(v112, v113, v114, v115);
        uint64_t v120 = objc_msgSend_outputSize(v273, v117, v118, v119);
        uint64_t v124 = objc_msgSend_outputSize(v273, v121, v122, v123);
        uint64_t v126 = objc_msgSend_weightMatrixFixedRowBytesWithRows_columns_(v116, v125, v120, v124);

        objc_msgSend_setObject_forKeyedSubscript_(v80, v127, (uint64_t)v126, (uint64_t)v111);
        sub_19E318BE0((uint64_t)v266, v111, v126);
      }
      uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B36B0, v105, (uint64_t)&v258, (uint64_t)v279, 16);
    }
    while (v108);
  }
  long long v256 = 0u;
  long long v257 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  uint64_t v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B36C8, v105, (uint64_t)&v254, (uint64_t)v278, 16);
  if (v131)
  {
    uint64_t v132 = *(void *)v255;
    do
    {
      for (uint64_t k = 0; k != v131; ++k)
      {
        if (*(void *)v255 != v132) {
          objc_enumerationMutation(&unk_1EF0B36C8);
        }
        uint64_t v134 = *(void **)(*((void *)&v254 + 1) + 8 * k);
        v135 = objc_msgSend_network(v273, v128, v129, v130);
        uint64_t v139 = objc_msgSend_deviceHandler(v135, v136, v137, v138);
        uint64_t v143 = objc_msgSend_outputSize(v273, v140, v141, v142);
        uint64_t v145 = objc_msgSend_weightMatrixFixedRowBytesWithRows_columns_(v139, v144, 1, v143);

        objc_msgSend_setObject_forKeyedSubscript_(v80, v146, (uint64_t)v145, (uint64_t)v134);
        sub_19E318BE0((uint64_t)v266, v134, v145);
      }
      uint64_t v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B36C8, v128, (uint64_t)&v254, (uint64_t)v278, 16);
    }
    while (v131);
  }
  objc_msgSend_commit(v272, v128, v129, v130);
  objc_msgSend_waitUntilCompleted(v272, v147, v148, v149);
  if ((objc_msgSend_weightAttributes(v273, v150, v151, v152) & 0x20) != 0)
  {
    uint64_t v201 = objc_msgSend_outputSize(v273, v153, v154, v155);
    uint64_t v205 = objc_msgSend_inputSize(v273, v202, v203, v204);
    uint64_t v209 = objc_msgSend_outputSize(v273, v206, v207, v208);
    sub_19E3107A4(4 * v201 * (v209 + v205));
    uint64_t v211 = v210;
    uint64_t v270 = v210;
    long long v250 = 0u;
    long long v251 = 0u;
    long long v252 = 0u;
    long long v253 = 0u;
    uint64_t v215 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B3698, v212, (uint64_t)&v250, (uint64_t)v277, 16);
    if (v215)
    {
      uint64_t v216 = *(void *)v251;
      do
      {
        for (uint64_t m = 0; m != v215; ++m)
        {
          if (*(void *)v251 != v216) {
            objc_enumerationMutation(&unk_1EF0B3698);
          }
          uint64_t v218 = *(void **)(*((void *)&v250 + 1) + 8 * m);
          v219 = v273;
          v220 = objc_msgSend_objectForKeyedSubscript_(v80, v213, (uint64_t)v218, v214);
          uint64_t v224 = objc_msgSend_unsignedIntegerValue(v218, v221, v222, v223);
          objc_msgSend_exportWeightsWithWeightMatrix_weightID_destination_recurrent_(v219, v225, (uint64_t)v220, v224, v211, 0);
        }
        uint64_t v215 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B3698, v213, (uint64_t)&v250, (uint64_t)v277, 16);
      }
      while (v215);
    }
    long long v248 = 0u;
    long long v249 = 0u;
    long long v246 = 0u;
    long long v247 = 0u;
    uint64_t v226 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B36B0, v213, (uint64_t)&v246, (uint64_t)v276, 16);
    if (v226)
    {
      uint64_t v227 = *(void *)v247;
      do
      {
        for (uint64_t n = 0; n != v226; ++n)
        {
          if (*(void *)v247 != v227) {
            objc_enumerationMutation(&unk_1EF0B36B0);
          }
          uint64_t v229 = *(void **)(*((void *)&v246 + 1) + 8 * n);
          id v230 = v273;
          v231 = objc_msgSend_objectForKeyedSubscript_(v80, v187, (uint64_t)v229, v189);
          uint64_t v235 = objc_msgSend_unsignedIntegerValue(v229, v232, v233, v234);
          objc_msgSend_exportWeightsWithWeightMatrix_weightID_destination_recurrent_(v230, v236, (uint64_t)v231, v235, v211, 1);
        }
        uint64_t v226 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B36B0, v187, (uint64_t)&v246, (uint64_t)v276, 16);
      }
      while (v226);
    }
  }
  else
  {
    uint64_t v156 = objc_msgSend_outputSize(v273, v153, v154, v155);
    uint64_t v160 = objc_msgSend_inputSize(v273, v157, v158, v159);
    sub_19E3107A4(4 * v156 * v160);
    uint64_t v162 = v161;
    uint64_t v166 = objc_msgSend_outputSize(v273, v163, v164, v165);
    uint64_t v170 = objc_msgSend_outputSize(v273, v167, v168, v169);
    sub_19E3107A4(4 * v166 * v170);
    uint64_t v172 = v171;
    uint64_t v270 = v162;
    uint64_t v271 = v171;
    long long v242 = 0u;
    long long v243 = 0u;
    long long v244 = 0u;
    long long v245 = 0u;
    uint64_t v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B3698, v173, (uint64_t)&v242, (uint64_t)v275, 16);
    if (v176)
    {
      uint64_t v177 = *(void *)v243;
      do
      {
        for (iuint64_t i = 0; ii != v176; ++ii)
        {
          if (*(void *)v243 != v177) {
            objc_enumerationMutation(&unk_1EF0B3698);
          }
          uint64_t v179 = *(void **)(*((void *)&v242 + 1) + 8 * ii);
          v180 = v273;
          v181 = objc_msgSend_objectForKeyedSubscript_(v80, v174, (uint64_t)v179, v175);
          uint64_t v185 = objc_msgSend_unsignedIntegerValue(v179, v182, v183, v184);
          objc_msgSend_exportWeightsWithWeightMatrix_weightID_destination_recurrent_(v180, v186, (uint64_t)v181, v185, v162, 0);
        }
        uint64_t v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B3698, v174, (uint64_t)&v242, (uint64_t)v275, 16);
      }
      while (v176);
    }
    long long v240 = 0u;
    long long v241 = 0u;
    long long v238 = 0u;
    long long v239 = 0u;
    uint64_t v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B36B0, v174, (uint64_t)&v238, (uint64_t)v274, 16);
    if (v190)
    {
      uint64_t v191 = *(void *)v239;
      do
      {
        for (juint64_t j = 0; jj != v190; ++jj)
        {
          if (*(void *)v239 != v191) {
            objc_enumerationMutation(&unk_1EF0B36B0);
          }
          uint64_t v193 = *(void **)(*((void *)&v238 + 1) + 8 * jj);
          v194 = v273;
          v195 = objc_msgSend_objectForKeyedSubscript_(v80, v187, (uint64_t)v193, v189);
          uint64_t v199 = objc_msgSend_unsignedIntegerValue(v193, v196, v197, v198);
          objc_msgSend_exportWeightsWithWeightMatrix_weightID_destination_recurrent_(v194, v200, (uint64_t)v195, v199, v172, 1);
        }
        uint64_t v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0B36B0, v187, (uint64_t)&v238, (uint64_t)v274, 16);
      }
      while (v190);
    }
  }
  objc_msgSend_outputSize(v273, v187, v188, v189);
  operator new[]();
}

- (void)exportWeightsWithWeightMatrix:(id)a3 weightID:(unint64_t)a4 destination:(float *)a5 recurrent:(BOOL)a6
{
  id v541 = a3;
  objc_msgSend_data(v541, v9, v10, v11);
  id v12 = objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_contents(v12, v13, v14, v15);

  char v20 = objc_msgSend_weightAttributes(self, v17, v18, v19);
  unint64_t v27 = objc_msgSend_weightAttributes(self, v21, v22, v23) & 0x10;
  switch(a4)
  {
    case 3uLL:
      if ((v20 & 0x20) != 0)
      {
        objc_msgSend_outputSize(self, v24, v25, v26);
        objc_msgSend_inputSize(self, v405, v406, v407);
        objc_msgSend_outputSize(self, v408, v409, v410);
        uint64_t v414 = objc_msgSend_inputSize(self, v411, v412, v413);
        uint64_t v418 = objc_msgSend_outputSize(self, v415, v416, v417);
        if (objc_msgSend_rows(v541, v419, v420, v421))
        {
          unint64_t v425 = 0;
          uint64_t v426 = 4 * (v418 + v414);
          do
          {
            if (objc_msgSend_columns(v541, v422, v423, v424))
            {
              unint64_t v430 = 0;
              do
              {
                a5[v430] = *(float *)(v16 + 4 * (v430 + v425 * objc_msgSend_columns(v541, v427, v428, v429)));
                ++v430;
              }
              while (objc_msgSend_columns(v541, v431, v432, v433) > v430);
            }
            ++v425;
            a5 = (float *)((char *)a5 + v426);
          }
          while (objc_msgSend_rows(v541, v427, v428, v429) > v425);
        }
      }
      else
      {
        objc_msgSend_inputSize(self, v24, v25, v26);
        objc_msgSend_outputSize(self, v28, v29, v30);
        objc_msgSend_outputSize(self, v31, v32, v33);
        objc_msgSend_outputSize(self, v34, v35, v36);
        if (objc_msgSend_rows(v541, v37, v38, v39))
        {
          unint64_t v43 = 0;
          uint64_t v44 = 0;
          do
          {
            if (objc_msgSend_columns(v541, v40, v41, v42))
            {
              unint64_t v48 = 0;
              do
              {
                a5[v44 + v48] = *(float *)(v16 + 4 * (v48 + v43 * objc_msgSend_columns(v541, v45, v46, v47)));
                ++v48;
              }
              while (objc_msgSend_columns(v541, v49, v50, v51) > v48);
              v44 += v48;
            }
            ++v43;
          }
          while (objc_msgSend_rows(v541, v45, v46, v47) > v43);
        }
      }
      break;
    case 4uLL:
      if ((v20 & 0x20) != 0)
      {
        objc_msgSend_outputSize(self, v24, v25, v26);
        objc_msgSend_inputSize(self, v371, v372, v373);
        objc_msgSend_outputSize(self, v374, v375, v376);
        uint64_t v380 = objc_msgSend_inputSize(self, v377, v378, v379);
        uint64_t v384 = objc_msgSend_inputSize(self, v381, v382, v383);
        uint64_t v388 = objc_msgSend_outputSize(self, v385, v386, v387);
        if (objc_msgSend_rows(v541, v389, v390, v391))
        {
          unint64_t v395 = 0;
          v396 = &a5[v380];
          uint64_t v397 = 4 * (v388 + v384);
          do
          {
            if (objc_msgSend_columns(v541, v392, v393, v394))
            {
              unint64_t v401 = 0;
              do
              {
                v396[v401] = *(float *)(v16 + 4 * (v401 + v395 * objc_msgSend_columns(v541, v398, v399, v400)));
                ++v401;
              }
              while (objc_msgSend_columns(v541, v402, v403, v404) > v401);
            }
            ++v395;
            v396 = (float *)((char *)v396 + v397);
          }
          while (objc_msgSend_rows(v541, v398, v399, v400) > v395);
        }
      }
      else
      {
        objc_msgSend_inputSize(self, v24, v25, v26);
        objc_msgSend_outputSize(self, v146, v147, v148);
        objc_msgSend_outputSize(self, v149, v150, v151);
        objc_msgSend_outputSize(self, v152, v153, v154);
        if (objc_msgSend_rows(v541, v155, v156, v157))
        {
          unint64_t v161 = 0;
          uint64_t v162 = 0;
          do
          {
            if (objc_msgSend_columns(v541, v158, v159, v160))
            {
              unint64_t v166 = 0;
              do
              {
                a5[v162 + v166] = *(float *)(v16 + 4 * (v166 + v161 * objc_msgSend_columns(v541, v163, v164, v165)));
                ++v166;
              }
              while (objc_msgSend_columns(v541, v167, v168, v169) > v166);
              v162 += v166;
            }
            ++v161;
          }
          while (objc_msgSend_rows(v541, v163, v164, v165) > v161);
        }
      }
      break;
    case 6uLL:
      if (objc_msgSend_outputSize(self, v24, v25, v26))
      {
        unint64_t v181 = 0;
        do
        {
          float v182 = *(float *)(v16 + 4 * v181);
          objc_msgSend_outputSize(self, v178, v179, v180);
          a5[v181++] = v182;
        }
        while (objc_msgSend_outputSize(self, v183, v184, v185) > v181);
      }
      break;
    case 7uLL:
      if ((v20 & 0x20) != 0)
      {
        uint64_t v471 = objc_msgSend_outputSize(self, v24, v25, v26);
        uint64_t v475 = objc_msgSend_inputSize(self, v472, v473, v474);
        uint64_t v479 = objc_msgSend_outputSize(self, v476, v477, v478);
        uint64_t v483 = objc_msgSend_inputSize(self, v480, v481, v482);
        uint64_t v487 = objc_msgSend_outputSize(self, v484, v485, v486);
        if (objc_msgSend_rows(v541, v488, v489, v490))
        {
          unint64_t v494 = 0;
          v495 = &a5[(v471 << (v27 >> 4)) * (v479 + v475)];
          uint64_t v496 = 4 * (v487 + v483);
          do
          {
            if (objc_msgSend_columns(v541, v491, v492, v493))
            {
              unint64_t v500 = 0;
              do
              {
                v495[v500] = *(float *)(v16 + 4 * (v500 + v494 * objc_msgSend_columns(v541, v497, v498, v499)));
                ++v500;
              }
              while (objc_msgSend_columns(v541, v501, v502, v503) > v500);
            }
            ++v494;
            v495 = (float *)((char *)v495 + v496);
          }
          while (objc_msgSend_rows(v541, v497, v498, v499) > v494);
        }
      }
      else
      {
        uint64_t v212 = objc_msgSend_inputSize(self, v24, v25, v26);
        uint64_t v216 = objc_msgSend_outputSize(self, v213, v214, v215);
        objc_msgSend_outputSize(self, v217, v218, v219);
        objc_msgSend_outputSize(self, v220, v221, v222);
        if (objc_msgSend_rows(v541, v223, v224, v225))
        {
          unint64_t v229 = 0;
          uint64_t v230 = v216 * (v212 << (v27 >> 4));
          do
          {
            if (objc_msgSend_columns(v541, v226, v227, v228))
            {
              unint64_t v234 = 0;
              do
              {
                a5[v230 + v234] = *(float *)(v16 + 4 * (v234 + v229 * objc_msgSend_columns(v541, v231, v232, v233)));
                ++v234;
              }
              while (objc_msgSend_columns(v541, v235, v236, v237) > v234);
              v230 += v234;
            }
            ++v229;
          }
          while (objc_msgSend_rows(v541, v231, v232, v233) > v229);
        }
      }
      break;
    case 8uLL:
      if ((v20 & 0x20) != 0)
      {
        uint64_t v334 = objc_msgSend_outputSize(self, v24, v25, v26);
        uint64_t v338 = objc_msgSend_inputSize(self, v335, v336, v337);
        uint64_t v342 = objc_msgSend_outputSize(self, v339, v340, v341);
        uint64_t v346 = objc_msgSend_inputSize(self, v343, v344, v345);
        uint64_t v350 = objc_msgSend_inputSize(self, v347, v348, v349);
        uint64_t v354 = objc_msgSend_outputSize(self, v351, v352, v353);
        if (objc_msgSend_rows(v541, v355, v356, v357))
        {
          unint64_t v361 = 0;
          v362 = &a5[(v334 << (v27 >> 4)) * (v342 + v338) + v346];
          uint64_t v363 = 4 * (v354 + v350);
          do
          {
            if (objc_msgSend_columns(v541, v358, v359, v360))
            {
              unint64_t v367 = 0;
              do
              {
                v362[v367] = *(float *)(v16 + 4 * (v367 + v361 * objc_msgSend_columns(v541, v364, v365, v366)));
                ++v367;
              }
              while (objc_msgSend_columns(v541, v368, v369, v370) > v367);
            }
            ++v361;
            v362 = (float *)((char *)v362 + v363);
          }
          while (objc_msgSend_rows(v541, v364, v365, v366) > v361);
        }
      }
      else
      {
        objc_msgSend_inputSize(self, v24, v25, v26);
        objc_msgSend_outputSize(self, v120, v121, v122);
        uint64_t v126 = objc_msgSend_outputSize(self, v123, v124, v125);
        uint64_t v130 = objc_msgSend_outputSize(self, v127, v128, v129);
        if (objc_msgSend_rows(v541, v131, v132, v133))
        {
          unint64_t v137 = 0;
          uint64_t v138 = v130 * (v126 << (v27 >> 4));
          do
          {
            if (objc_msgSend_columns(v541, v134, v135, v136))
            {
              unint64_t v142 = 0;
              do
              {
                a5[v138 + v142] = *(float *)(v16 + 4 * (v142 + v137 * objc_msgSend_columns(v541, v139, v140, v141)));
                ++v142;
              }
              while (objc_msgSend_columns(v541, v143, v144, v145) > v142);
              v138 += v142;
            }
            ++v137;
          }
          while (objc_msgSend_rows(v541, v139, v140, v141) > v137);
        }
      }
      break;
    case 0xAuLL:
      if (objc_msgSend_outputSize(self, v24, v25, v26))
      {
        unint64_t v173 = 0;
        do
        {
          float v174 = *(float *)(v16 + 4 * v173);
          a5[v173 + (objc_msgSend_outputSize(self, v170, v171, v172) << (v27 >> 4))] = v174;
          ++v173;
        }
        while (objc_msgSend_outputSize(self, v175, v176, v177) > v173);
      }
      break;
    case 0xBuLL:
      if ((v20 & 0x20) != 0)
      {
        uint64_t v504 = objc_msgSend_outputSize(self, v24, v25, v26);
        uint64_t v508 = objc_msgSend_inputSize(self, v505, v506, v507);
        uint64_t v512 = objc_msgSend_outputSize(self, v509, v510, v511);
        uint64_t v516 = objc_msgSend_inputSize(self, v513, v514, v515);
        uint64_t v520 = objc_msgSend_outputSize(self, v517, v518, v519);
        if (objc_msgSend_rows(v541, v521, v522, v523))
        {
          unint64_t v527 = 0;
          v528 = &a5[(v504 << ((v27 >> 4) ^ 1u)) * (v512 + v508)];
          uint64_t v529 = 4 * (v520 + v516);
          do
          {
            if (objc_msgSend_columns(v541, v524, v525, v526))
            {
              unint64_t v533 = 0;
              do
              {
                v528[v533] = *(float *)(v16 + 4 * (v533 + v527 * objc_msgSend_columns(v541, v530, v531, v532)));
                ++v533;
              }
              while (objc_msgSend_columns(v541, v534, v535, v536) > v533);
            }
            ++v527;
            v528 = (float *)((char *)v528 + v529);
          }
          while (objc_msgSend_rows(v541, v530, v531, v532) > v527);
        }
      }
      else
      {
        uint64_t v238 = objc_msgSend_inputSize(self, v24, v25, v26);
        uint64_t v242 = objc_msgSend_outputSize(self, v239, v240, v241);
        objc_msgSend_outputSize(self, v243, v244, v245);
        objc_msgSend_outputSize(self, v246, v247, v248);
        if (objc_msgSend_rows(v541, v249, v250, v251))
        {
          unint64_t v255 = 0;
          uint64_t v256 = v242 * (v238 << ((v27 >> 4) ^ 1u));
          do
          {
            if (objc_msgSend_columns(v541, v252, v253, v254))
            {
              unint64_t v260 = 0;
              do
              {
                a5[v256 + v260] = *(float *)(v16 + 4 * (v260 + v255 * objc_msgSend_columns(v541, v257, v258, v259)));
                ++v260;
              }
              while (objc_msgSend_columns(v541, v261, v262, v263) > v260);
              v256 += v260;
            }
            ++v255;
          }
          while (objc_msgSend_rows(v541, v257, v258, v259) > v255);
        }
      }
      break;
    case 0xCuLL:
      if ((v20 & 0x20) != 0)
      {
        uint64_t v434 = objc_msgSend_outputSize(self, v24, v25, v26);
        uint64_t v438 = objc_msgSend_inputSize(self, v435, v436, v437);
        uint64_t v442 = objc_msgSend_outputSize(self, v439, v440, v441);
        uint64_t v446 = objc_msgSend_inputSize(self, v443, v444, v445);
        uint64_t v450 = objc_msgSend_inputSize(self, v447, v448, v449);
        uint64_t v454 = objc_msgSend_outputSize(self, v451, v452, v453);
        if (objc_msgSend_rows(v541, v455, v456, v457))
        {
          unint64_t v461 = 0;
          v462 = &a5[(v434 << ((v27 >> 4) ^ 1u)) * (v442 + v438) + v446];
          uint64_t v463 = 4 * (v454 + v450);
          do
          {
            if (objc_msgSend_columns(v541, v458, v459, v460))
            {
              unint64_t v467 = 0;
              do
              {
                v462[v467] = *(float *)(v16 + 4 * (v467 + v461 * objc_msgSend_columns(v541, v464, v465, v466)));
                ++v467;
              }
              while (objc_msgSend_columns(v541, v468, v469, v470) > v467);
            }
            ++v461;
            v462 = (float *)((char *)v462 + v463);
          }
          while (objc_msgSend_rows(v541, v464, v465, v466) > v461);
        }
      }
      else
      {
        objc_msgSend_inputSize(self, v24, v25, v26);
        objc_msgSend_outputSize(self, v186, v187, v188);
        uint64_t v192 = objc_msgSend_outputSize(self, v189, v190, v191);
        uint64_t v196 = objc_msgSend_outputSize(self, v193, v194, v195);
        if (objc_msgSend_rows(v541, v197, v198, v199))
        {
          unint64_t v203 = 0;
          uint64_t v204 = v196 * (v192 << ((v27 >> 4) ^ 1u));
          do
          {
            if (objc_msgSend_columns(v541, v200, v201, v202))
            {
              unint64_t v208 = 0;
              do
              {
                a5[v204 + v208] = *(float *)(v16 + 4 * (v208 + v203 * objc_msgSend_columns(v541, v205, v206, v207)));
                ++v208;
              }
              while (objc_msgSend_columns(v541, v209, v210, v211) > v208);
              v204 += v208;
            }
            ++v203;
          }
          while (objc_msgSend_rows(v541, v205, v206, v207) > v203);
        }
      }
      break;
    case 0xEuLL:
      if (objc_msgSend_outputSize(self, v24, v25, v26))
      {
        unint64_t v115 = 0;
        do
        {
          float v116 = *(float *)(v16 + 4 * v115);
          a5[v115 + (objc_msgSend_outputSize(self, v112, v113, v114) << ((v27 >> 4) ^ 1u))] = v116;
          ++v115;
        }
        while (objc_msgSend_outputSize(self, v117, v118, v119) > v115);
      }
      break;
    case 0xFuLL:
      if ((v20 & 0x20) != 0)
      {
        uint64_t v264 = objc_msgSend_outputSize(self, v24, v25, v26);
        uint64_t v268 = objc_msgSend_inputSize(self, v265, v266, v267);
        uint64_t v272 = objc_msgSend_outputSize(self, v269, v270, v271);
        uint64_t v276 = objc_msgSend_inputSize(self, v273, v274, v275);
        uint64_t v280 = objc_msgSend_outputSize(self, v277, v278, v279);
        if (objc_msgSend_rows(v541, v281, v282, v283))
        {
          unint64_t v287 = 0;
          v288 = &a5[3 * v264 * (v272 + v268)];
          uint64_t v289 = 4 * (v280 + v276);
          do
          {
            if (objc_msgSend_columns(v541, v284, v285, v286))
            {
              unint64_t v293 = 0;
              do
              {
                v288[v293] = *(float *)(v16 + 4 * (v293 + v287 * objc_msgSend_columns(v541, v290, v291, v292)));
                ++v293;
              }
              while (objc_msgSend_columns(v541, v294, v295, v296) > v293);
            }
            ++v287;
            v288 = (float *)((char *)v288 + v289);
          }
          while (objc_msgSend_rows(v541, v290, v291, v292) > v287);
        }
      }
      else
      {
        uint64_t v60 = objc_msgSend_inputSize(self, v24, v25, v26);
        uint64_t v64 = objc_msgSend_outputSize(self, v61, v62, v63);
        objc_msgSend_outputSize(self, v65, v66, v67);
        objc_msgSend_outputSize(self, v68, v69, v70);
        if (objc_msgSend_rows(v541, v71, v72, v73))
        {
          unint64_t v77 = 0;
          uint64_t v78 = 3 * v60 * v64;
          do
          {
            if (objc_msgSend_columns(v541, v74, v75, v76))
            {
              unint64_t v82 = 0;
              do
              {
                a5[v78 + v82] = *(float *)(v16 + 4 * (v82 + v77 * objc_msgSend_columns(v541, v79, v80, v81)));
                ++v82;
              }
              while (objc_msgSend_columns(v541, v83, v84, v85) > v82);
              v78 += v82;
            }
            ++v77;
          }
          while (objc_msgSend_rows(v541, v79, v80, v81) > v77);
        }
      }
      break;
    case 0x10uLL:
      if ((v20 & 0x20) != 0)
      {
        uint64_t v297 = objc_msgSend_outputSize(self, v24, v25, v26);
        uint64_t v301 = objc_msgSend_inputSize(self, v298, v299, v300);
        uint64_t v305 = objc_msgSend_outputSize(self, v302, v303, v304);
        uint64_t v309 = objc_msgSend_inputSize(self, v306, v307, v308);
        uint64_t v313 = objc_msgSend_inputSize(self, v310, v311, v312);
        uint64_t v317 = objc_msgSend_outputSize(self, v314, v315, v316);
        if (objc_msgSend_rows(v541, v318, v319, v320))
        {
          unint64_t v324 = 0;
          v325 = &a5[3 * v297 * (v305 + v301) + v309];
          uint64_t v326 = 4 * (v317 + v313);
          do
          {
            if (objc_msgSend_columns(v541, v321, v322, v323))
            {
              unint64_t v330 = 0;
              do
              {
                v325[v330] = *(float *)(v16 + 4 * (v330 + v324 * objc_msgSend_columns(v541, v327, v328, v329)));
                ++v330;
              }
              while (objc_msgSend_columns(v541, v331, v332, v333) > v330);
            }
            ++v324;
            v325 = (float *)((char *)v325 + v326);
          }
          while (objc_msgSend_rows(v541, v327, v328, v329) > v324);
        }
      }
      else
      {
        objc_msgSend_inputSize(self, v24, v25, v26);
        objc_msgSend_outputSize(self, v86, v87, v88);
        uint64_t v92 = objc_msgSend_outputSize(self, v89, v90, v91);
        uint64_t v96 = objc_msgSend_outputSize(self, v93, v94, v95);
        if (objc_msgSend_rows(v541, v97, v98, v99))
        {
          unint64_t v103 = 0;
          uint64_t v104 = 3 * v92 * v96;
          do
          {
            if (objc_msgSend_columns(v541, v100, v101, v102))
            {
              unint64_t v108 = 0;
              do
              {
                a5[v104 + v108] = *(float *)(v16 + 4 * (v108 + v103 * objc_msgSend_columns(v541, v105, v106, v107)));
                ++v108;
              }
              while (objc_msgSend_columns(v541, v109, v110, v111) > v108);
              v104 += v108;
            }
            ++v103;
          }
          while (objc_msgSend_rows(v541, v105, v106, v107) > v103);
        }
      }
      break;
    case 0x12uLL:
      if (objc_msgSend_outputSize(self, v24, v25, v26))
      {
        unint64_t v55 = 0;
        do
        {
          float v56 = *(float *)(v16 + 4 * v55);
          a5[3 * objc_msgSend_outputSize(self, v52, v53, v54) + v55++] = v56;
        }
        while (objc_msgSend_outputSize(self, v57, v58, v59) > v55);
      }
      break;
    default:
      v537 = (void *)MEMORY[0x1E4F1CA00];
      v538 = objc_msgSend_stringWithFormat_(NSString, v24, @"Unknown weight ID %tu", v26, a4);
      objc_msgSend_exceptionWithName_reason_userInfo_(v537, v539, *MEMORY[0x1E4F1C3B8], (uint64_t)v538, 0);
      id v540 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v540);
  }
}

- (id)matrixIDToString:(unint64_t)a3
{
  if (a3 - 3 > 0xF) {
    return @"Unknown Matrix ID";
  }
  else {
    return off_1E599D418[a3 - 3];
  }
}

- (unint64_t)inputSize
{
  return self->_inputSize;
}

- (void)setInputSize:(unint64_t)a3
{
  self->_inputSize = a3;
}

- (unint64_t)outputSize
{
  return self->_outputSize;
}

- (void)setOutputSize:(unint64_t)a3
{
  self->_outputSize = a3;
}

- (int)inputGateActivation
{
  return self->_inputGateActivation;
}

- (void)setInputGateActivation:(int)a3
{
  self->_inputGateActivatiouint64_t n = a3;
}

- (int)forgetGateActivation
{
  return self->_forgetGateActivation;
}

- (void)setForgetGateActivation:(int)a3
{
  self->_forgetGateActivatiouint64_t n = a3;
}

- (int)cellGateActivation
{
  return self->_cellGateActivation;
}

- (void)setCellGateActivation:(int)a3
{
  self->_cellGateActivatiouint64_t n = a3;
}

- (int)outputGateActivation
{
  return self->_outputGateActivation;
}

- (void)setOutputGateActivation:(int)a3
{
  self->_outputGateActivatiouint64_t n = a3;
}

- (int)cellToOutputActivation
{
  return self->_cellToOutputActivation;
}

- (void)setCellToOutputActivation:(int)a3
{
  self->_cellToOutputActivatiouint64_t n = a3;
}

- (MPSLSTMDescriptor)lstmDesc
{
  return (MPSLSTMDescriptor *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLstmDesc:(id)a3
{
}

- (MPSRNNMatrixTrainingLayer)filter
{
  return (MPSRNNMatrixTrainingLayer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setFilter:(id)a3
{
}

- (NSMutableArray)optimizers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setOptimizers:(id)a3
{
}

- (NSMutableArray)weights
{
  return (NSMutableArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setWeights:(id)a3
{
}

- (NSMutableArray)weightGradients
{
  return (NSMutableArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setWeightGradients:(id)a3
{
}

- (NSMutableArray)trainingStates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setTrainingStates:(id)a3
{
}

- (float)initialWeights_0
{
  return self->_initialWeights_0;
}

- (void)setInitialWeights_0:(float *)a3
{
  self->_initialWeights_0 = a3;
}

- (float)initialWeights_1
{
  return self->_initialWeights_1;
}

- (void)setInitialWeights_1:(float *)a3
{
  self->_initialWeights_1 = a3;
}

- (float)initialBias_0
{
  return self->_initialBias_0;
}

- (void)setInitialBias_0:(float *)a3
{
  self->_initialBias_0 = a3;
}

- (float)initialBias_1
{
  return self->_initialBias_1;
}

- (void)setInitialBias_1:(float *)a3
{
  self->_initialBias_1 = a3;
}

- (unint64_t)weightAttributes
{
  return self->_weightAttributes;
}

- (void)setWeightAttributes:(unint64_t)a3
{
  self->_weightAttributes = a3;
}

- (NSArray)srcMatrices
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSrcMatrices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srcMatrices, 0);
  objc_storeStrong((id *)&self->_trainingStates, 0);
  objc_storeStrong((id *)&self->_weightGradients, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_optimizers, 0);
  objc_storeStrong((id *)&self->_filter, 0);

  objc_storeStrong((id *)&self->_lstmDesc, 0);
}

@end