@interface MLPNetwork
+ (MLPNetwork)networkWithLayers:(id)a3 inputLength:(unint64_t)a4 inputHeight:(unint64_t)a5 inputChannels:(unint64_t)a6 batchSize:(unint64_t)a7 lossBatchSize:(unint64_t)a8 options:(id)a9 deviceHandler:(id)a10 optimizerParams:(id)a11;
- (BOOL)computeLossOnInference;
- (MLPDeviceHandler)deviceHandler;
- (MLPNetwork)initWithLayers:(id)a3;
- (MLPNetwork)initWithNetworkType:(unint64_t)a3 layers:(id)a4;
- (MPSImageCopyToMatrix)i2mKernel;
- (MPSMatrixCopyToImage)m2iKernel;
- (MontrealNNModelOptimizerParam)optimizerParams;
- (NSArray)layers;
- (NSDictionary)options;
- (id)computeInference:(id)a3;
- (unint64_t)batchSize;
- (unint64_t)inputChannels;
- (unint64_t)inputHeight;
- (unint64_t)inputLength;
- (unint64_t)lossBatchSize;
- (unint64_t)networkType;
- (unint64_t)runInference:(id)a3 databatch:(id)a4 inferredResult:(id)a5 semaphore:(id)a6;
- (void)createLayerKernels;
- (void)generateModelContainer;
- (void)runTraining:(id)a3 databatch:(id)a4 iteration:(unint64_t)a5 lossCallback:(id)a6 semaphore:(id)a7;
- (void)setBatchSize:(unint64_t)a3;
- (void)setComputeLossOnInference:(BOOL)a3;
- (void)setDeviceHandler:(id)a3;
- (void)setI2mKernel:(id)a3;
- (void)setInputChannels:(unint64_t)a3;
- (void)setInputHeight:(unint64_t)a3;
- (void)setInputLength:(unint64_t)a3;
- (void)setLayers:(id)a3;
- (void)setLossBatchSize:(unint64_t)a3;
- (void)setM2iKernel:(id)a3;
- (void)setNetworkType:(unint64_t)a3;
- (void)setOptimizerParams:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation MLPNetwork

+ (MLPNetwork)networkWithLayers:(id)a3 inputLength:(unint64_t)a4 inputHeight:(unint64_t)a5 inputChannels:(unint64_t)a6 batchSize:(unint64_t)a7 lossBatchSize:(unint64_t)a8 options:(id)a9 deviceHandler:(id)a10 optimizerParams:(id)a11
{
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v198 = a9;
  id v199 = a10;
  id v197 = a11;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  id v17 = v16;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v200, (uint64_t)v204, 16);
  if (v22)
  {
    uint64_t v23 = *(void *)v201;
LABEL_3:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v201 != v23) {
        objc_enumerationMutation(v17);
      }
      if (objc_msgSend_layerType(*(void **)(*((void *)&v200 + 1) + 8 * v24), v19, v20, v21) == 8) {
        break;
      }
      if (v22 == ++v24)
      {
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v200, (uint64_t)v204, 16);
        if (v22) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v25 = [MLPSeqNetwork alloc];
    v28 = objc_msgSend_initWithLayers_(v25, v26, (uint64_t)v17, v27);

    if (v28) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v31 = [MLPCNNNetwork alloc];
  v28 = objc_msgSend_initWithLayers_(v31, v32, (uint64_t)v17, v33);
LABEL_12:
  objc_msgSend_setOptions_(v28, v29, (uint64_t)v198, v30);
  uint64_t v36 = objc_msgSend_exMRL_BOOLForKey_(v198, v34, (uint64_t)MLPModelTrainerComputeLossOnEvaluationKey, v35);
  objc_msgSend_setComputeLossOnInference_(v28, v37, v36, v38);
  objc_msgSend_setDeviceHandler_(v28, v39, (uint64_t)v199, v40);
  id v41 = objc_alloc(MEMORY[0x1E4F35570]);
  v45 = objc_msgSend_device(v199, v42, v43, v44);
  uint64_t v49 = objc_msgSend_dataLayout(v199, v46, v47, v48);
  v51 = objc_msgSend_initWithDevice_dataLayout_(v41, v50, (uint64_t)v45, v49);
  objc_msgSend_setI2mKernel_(v28, v52, (uint64_t)v51, v53);

  id v54 = objc_alloc(MEMORY[0x1E4F35630]);
  v58 = objc_msgSend_device(v199, v55, v56, v57);
  uint64_t v62 = objc_msgSend_dataLayout(v199, v59, v60, v61);
  v64 = objc_msgSend_initWithDevice_dataLayout_(v54, v63, (uint64_t)v58, v62);
  objc_msgSend_setM2iKernel_(v28, v65, (uint64_t)v64, v66);

  objc_msgSend_setOptimizerParams_(v28, v67, (uint64_t)v197, v68);
  objc_msgSend_setInputLength_(v28, v69, a4, v70);
  objc_msgSend_setInputHeight_(v28, v71, a5, v72);
  objc_msgSend_setInputChannels_(v28, v73, a6, v74);
  objc_msgSend_setBatchSize_(v28, v75, a7, v76);
  objc_msgSend_setLossBatchSize_(v28, v77, a8, v78);
  if (objc_msgSend_count(v17, v79, v80, v81))
  {
    if (objc_msgSend_count(v17, v82, v83, v84) == 1)
    {
      v87 = 0;
    }
    else
    {
      v87 = objc_msgSend_objectAtIndexedSubscript_(v17, v85, 1, v86);
    }
    v88 = objc_msgSend_objectAtIndexedSubscript_(v17, v85, 0, v86);
    objc_msgSend_updatePreviousLayer_nextLayer_network_(v88, v89, 0, (uint64_t)v87, v28);
    if (!objc_msgSend_inputLength(v88, v90, v91, v92))
    {
      uint64_t v96 = objc_msgSend_name(v88, v93, v94, v95);
      sub_19E15DB6C(@"Input length for layer %@ is 0", v97, v98, v99, v100, v101, v102, v103, v96);
    }
    if (!objc_msgSend_inputChannels(v88, v93, v94, v95))
    {
      uint64_t v107 = objc_msgSend_name(v88, v104, v105, v106);
      sub_19E15DB6C(@"Input channels for layer %@ is 0", v108, v109, v110, v111, v112, v113, v114, v107);
    }
    if (!objc_msgSend_outputLength(v88, v104, v105, v106))
    {
      uint64_t v118 = objc_msgSend_name(v88, v115, v116, v117);
      sub_19E15DB6C(@"Output length for layer %@ is 0", v119, v120, v121, v122, v123, v124, v125, v118);
    }
    if (!objc_msgSend_outputChannels(v88, v115, v116, v117))
    {
      uint64_t v129 = objc_msgSend_name(v88, v126, v127, v128);
      sub_19E15DB6C(@"Output channels for layer %@ is 0", v130, v131, v132, v133, v134, v135, v136, v129);
    }

    for (uint64_t i = 2; i - 1 < (unint64_t)objc_msgSend_count(v17, v137, v138, v139); ++i)
    {
      if (i - 1 >= (unint64_t)(objc_msgSend_count(v17, v82, v83, v84) - 1))
      {
        v143 = 0;
      }
      else
      {
        v143 = objc_msgSend_objectAtIndexedSubscript_(v17, v141, i, v142);
      }
      v144 = objc_msgSend_objectAtIndexedSubscript_(v17, v141, i - 2, v142);
      v147 = objc_msgSend_objectAtIndexedSubscript_(v17, v145, i - 1, v146);
      objc_msgSend_updatePreviousLayer_nextLayer_network_(v147, v148, (uint64_t)v144, (uint64_t)v143, v28);
      if (!objc_msgSend_inputLength(v147, v149, v150, v151))
      {
        uint64_t v155 = objc_msgSend_name(v147, v152, v153, v154);
        sub_19E15DB6C(@"Input length for layer %@ is 0", v156, v157, v158, v159, v160, v161, v162, v155);
      }
      if (!objc_msgSend_inputChannels(v147, v152, v153, v154))
      {
        uint64_t v166 = objc_msgSend_name(v147, v163, v164, v165);
        sub_19E15DB6C(@"Input channels for layer %@ is 0", v167, v168, v169, v170, v171, v172, v173, v166);
      }
      if (!objc_msgSend_outputLength(v147, v163, v164, v165))
      {
        uint64_t v177 = objc_msgSend_name(v147, v174, v175, v176);
        sub_19E15DB6C(@"Output length for layer %@ is 0", v178, v179, v180, v181, v182, v183, v184, v177);
      }
      if (!objc_msgSend_outputChannels(v147, v174, v175, v176))
      {
        uint64_t v188 = objc_msgSend_name(v147, v185, v186, v187);
        sub_19E15DB6C(@"Output channels for layer %@ is 0", v189, v190, v191, v192, v193, v194, v195, v188);
      }
    }
  }
  objc_msgSend_createLayerKernels(v28, v82, v83, v84);

  return (MLPNetwork *)v28;
}

- (MLPNetwork)initWithLayers:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  v6 = NSString;
  v7 = NSStringFromSelector(a2);
  v10 = objc_msgSend_stringWithFormat_(v6, v8, @"%@ not implemented in a subclass", v9, v7);
  objc_msgSend_exceptionWithName_reason_userInfo_(v5, v11, *MEMORY[0x1E4F1C3B8], (uint64_t)v10, 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (MLPNetwork)initWithNetworkType:(unint64_t)a3 layers:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLPNetwork;
  v10 = [(MLPNetwork *)&v14 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9);
    layers = v10->_layers;
    v10->_layers = (NSArray *)v11;

    v10->_networkType = a3;
  }

  return v10;
}

- (void)generateModelContainer
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_options(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)MLPModelGenerateFormatKey, v7);

  v82 = v8;
  unsigned int isEqualToString = objc_msgSend_isEqualToString_(v8, v9, (uint64_t)MLPModelGenerateFormatJSON, v10);
  uint64_t v11 = [MontrealNNGenerateModel alloc];
  objc_super v14 = objc_msgSend_initWithWeightFormat_(v11, v12, isEqualToString, v13);
  uint64_t v92 = 1;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  objc_msgSend_layers(self, v15, v16, v17);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v88, (uint64_t)v93, 16);
  if (v20)
  {
    uint64_t v21 = *(void *)v89;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v89 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        uint64_t v24 = (void *)MEMORY[0x19F3BC1E0]();
        v28 = objc_msgSend_name(v23, v25, v26, v27);
        uint64_t v30 = objc_msgSend_generateNode_model_weightIter_(v23, v29, (uint64_t)v28, (uint64_t)v14, &v92);

        if (isEqualToString)
        {
          if (v30)
          {
            objc_msgSend_parameters(v30, v31, v32, v33);
            sub_19E14FE84((uint64_t)v86);
            objc_msgSend_parameters(v30, v34, v35, v36);
          }
          else
          {
            bzero(v85, 0x2C0uLL);
            sub_19E14FE84((uint64_t)v86);
            bzero(v85, 0x2C0uLL);
          }
          sub_19E14FE84((uint64_t)&v87);
        }
        if (v30)
        {
          objc_msgSend_merge_(v14, v31, (uint64_t)v30, v33);
          if (v19)
          {
            uint64_t v40 = objc_msgSend_node(v30, v37, v38, v39);
            uint64_t v44 = objc_msgSend_inputs(v40, v41, v42, v43);
            uint64_t v47 = objc_msgSend_objectAtIndex_(v44, v45, 0, v46);
            objc_msgSend_removeInput_(v14, v48, (uint64_t)v47, v49);

            uint64_t v53 = objc_msgSend_node(v19, v50, v51, v52);
            uint64_t v57 = objc_msgSend_outputs(v53, v54, v55, v56);
            uint64_t v60 = objc_msgSend_objectAtIndex_(v57, v58, 0, v59);
            objc_msgSend_removeOutput_(v14, v61, (uint64_t)v60, v62);

            uint64_t v66 = objc_msgSend_node(v19, v63, v64, v65);
            uint64_t v70 = objc_msgSend_outputs(v66, v67, v68, v69);
            v73 = objc_msgSend_objectAtIndex_(v70, v71, 0, v72);
            objc_msgSend_setInput_inputIndex_(v30, v74, (uint64_t)v73, 0);
          }
          id v75 = v30;

          v19 = v75;
        }

        if (!v30)
        {

          ModelContainer = 0;
          goto LABEL_20;
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v76, (uint64_t)&v88, (uint64_t)v93, 16);
      if (v20) {
        continue;
      }
      break;
    }
  }

  ModelContainer = objc_msgSend_generateModelContainer(v14, v77, v78, v79);
LABEL_20:

  return ModelContainer;
}

- (void)runTraining:(id)a3 databatch:(id)a4 iteration:(unint64_t)a5 lossCallback:(id)a6 semaphore:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v15 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v16 = NSString;
  uint64_t v17 = NSStringFromSelector(a2);
  uint64_t v20 = objc_msgSend_stringWithFormat_(v16, v18, @"%@ not implemented in a subclass", v19, v17);
  objc_msgSend_exceptionWithName_reason_userInfo_(v15, v21, *MEMORY[0x1E4F1C3B8], (uint64_t)v20, 0);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v22);
}

- (unint64_t)runInference:(id)a3 databatch:(id)a4 inferredResult:(id)a5 semaphore:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1E4F1CA00];
  v15 = NSString;
  uint64_t v16 = NSStringFromSelector(a2);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v15, v17, @"%@ not implemented in a subclass", v18, v16);
  objc_msgSend_exceptionWithName_reason_userInfo_(v14, v20, *MEMORY[0x1E4F1C3B8], (uint64_t)v19, 0);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v21);
}

- (id)computeInference:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  id v6 = NSString;
  uint64_t v7 = NSStringFromSelector(a2);
  id v10 = objc_msgSend_stringWithFormat_(v6, v8, @"%@ not implemented in a subclass", v9, v7);
  objc_msgSend_exceptionWithName_reason_userInfo_(v5, v11, *MEMORY[0x1E4F1C3B8], (uint64_t)v10, 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (void)createLayerKernels
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = NSString;
  id v4 = NSStringFromSelector(a2);
  uint64_t v7 = objc_msgSend_stringWithFormat_(v3, v5, @"%@ not implemented in a subclass", v6, v4);
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v8, *MEMORY[0x1E4F1C3B8], (uint64_t)v7, 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOptions:(id)a3
{
}

- (NSArray)layers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLayers:(id)a3
{
}

- (unint64_t)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(unint64_t)a3
{
  self->_networkType = a3;
}

- (MLPDeviceHandler)deviceHandler
{
  return (MLPDeviceHandler *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceHandler:(id)a3
{
}

- (MPSImageCopyToMatrix)i2mKernel
{
  return (MPSImageCopyToMatrix *)objc_getProperty(self, a2, 48, 1);
}

- (void)setI2mKernel:(id)a3
{
}

- (MPSMatrixCopyToImage)m2iKernel
{
  return (MPSMatrixCopyToImage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setM2iKernel:(id)a3
{
}

- (MontrealNNModelOptimizerParam)optimizerParams
{
  return (MontrealNNModelOptimizerParam *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOptimizerParams:(id)a3
{
}

- (unint64_t)inputLength
{
  return self->_inputLength;
}

- (void)setInputLength:(unint64_t)a3
{
  self->_inputLength = a3;
}

- (unint64_t)inputHeight
{
  return self->_inputHeight;
}

- (void)setInputHeight:(unint64_t)a3
{
  self->_inputHeight = a3;
}

- (unint64_t)inputChannels
{
  return self->_inputChannels;
}

- (void)setInputChannels:(unint64_t)a3
{
  self->_inputChannels = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)lossBatchSize
{
  return self->_lossBatchSize;
}

- (void)setLossBatchSize:(unint64_t)a3
{
  self->_lossBatchSize = a3;
}

- (BOOL)computeLossOnInference
{
  return self->_computeLossOnInference;
}

- (void)setComputeLossOnInference:(BOOL)a3
{
  self->_computeLossOnInference = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerParams, 0);
  objc_storeStrong((id *)&self->_m2iKernel, 0);
  objc_storeStrong((id *)&self->_i2mKernel, 0);
  objc_storeStrong((id *)&self->_deviceHandler, 0);
  objc_storeStrong((id *)&self->_layers, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end