@interface MLPLayer
+ (id)layerWithMontrealNode:(id)a3 modelContainer:(void *)a4;
- (MLPLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 neuronType:(int)a5 neuronParams:(id)a6;
- (MLPLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 parameters:(id *)a5;
- (MLPLayer)initWithName:(id)a3 parameters:(id *)a4;
- (MLPLayer)nextLayer;
- (MLPLayer)previousLayer;
- (MLPNetwork)network;
- (MPSKernel)forwardKernel;
- (MPSKernel)primaryGradientKernel;
- (MPSKernel)secondaryForwardKernel;
- (MPSKernel)secondaryGradientKernel;
- (MontrealNNModelNode)node;
- (NSString)name;
- (float)neuronA;
- (float)neuronB;
- (float)neuronC;
- (id)backward:(id)a3 inputGradient:(id)a4;
- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6;
- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5;
- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5 params:(id *)a6 inputChunks:(id)a7 outputChunks:(id)a8;
- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5;
- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6;
- (int)mpsNeuronTypeFromMontrealType:(int64_t)a3;
- (int)neuronType;
- (int64_t)montrealTypeFromMPSNeuronType:(int)a3;
- (unint64_t)inputChannels;
- (unint64_t)inputLength;
- (unint64_t)layerType;
- (unint64_t)outputChannels;
- (unint64_t)outputLength;
- (void)createKernel;
- (void)printMatrix:(id)a3 name:(id)a4 cmdBuf:(id)a5;
- (void)setForwardKernel:(id)a3;
- (void)setInputChannels:(unint64_t)a3;
- (void)setInputLength:(unint64_t)a3;
- (void)setNetwork:(id)a3;
- (void)setNextLayer:(id)a3;
- (void)setNode:(id)a3;
- (void)setOutputChannels:(unint64_t)a3;
- (void)setOutputLength:(unint64_t)a3;
- (void)setPreviousLayer:(id)a3;
- (void)setPrimaryGradientKernel:(id)a3;
- (void)setSecondaryForwardKernel:(id)a3;
- (void)setSecondaryGradientKernel:(id)a3;
- (void)updatePreviousLayer:(id)a3 nextLayer:(id)a4 network:(id)a5;
@end

@implementation MLPLayer

- (MLPLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 neuronType:(int)a5 neuronParams:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v42.receiver = self;
  v42.super_class = (Class)MLPLayer;
  v13 = [(MLPLayer *)&v42 init];
  v14 = v13;
  if (v13)
  {
    v13->_layerType = a3;
    objc_storeStrong((id *)&v13->_name, a4);
    v14->_neuronType = a5;
    if (objc_msgSend_count(v12, v15, v16, v17))
    {
      v21 = objc_msgSend_objectAtIndexedSubscript_(v12, v18, 0, v20);
      objc_msgSend_floatValue(v21, v22, v23, v24);
      v14->_neuronA = v25;
    }
    if ((unint64_t)objc_msgSend_count(v12, v18, v19, v20) >= 2)
    {
      v29 = objc_msgSend_objectAtIndexedSubscript_(v12, v26, 1, v28);
      objc_msgSend_floatValue(v29, v30, v31, v32);
      v14->_neuronB = v33;
    }
    if ((unint64_t)objc_msgSend_count(v12, v26, v27, v28) >= 3)
    {
      v36 = objc_msgSend_objectAtIndexedSubscript_(v12, v34, 2, v35);
      objc_msgSend_floatValue(v36, v37, v38, v39);
      v14->_neuronC = v40;
    }
  }

  return v14;
}

- (MLPLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 parameters:(id *)a5
{
  id v8 = a4;
  uint64_t v11 = objc_msgSend_mpsNeuronTypeFromMontrealType_(self, v9, a5->var7[0], v10);
  v13 = (MLPLayer *)objc_msgSend_initWithLayerType_name_neuronType_neuronParams_(self, v12, a3, (uint64_t)v8, v11, 0);

  return v13;
}

- (MLPLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1CA00];
  v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v7, v9, @"You must override %@ in a subclass", v10, v8);
  objc_msgSend_exceptionWithName_reason_userInfo_(v6, v12, *MEMORY[0x1E4F1C3B8], (uint64_t)v11, 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

+ (id)layerWithMontrealNode:(id)a3 modelContainer:(void *)a4
{
  id v5 = a3;
  id v8 = v5;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  memset(v50, 0, sizeof(v50));
  if (v5)
  {
    objc_msgSend_parameters_(v5, v6, (uint64_t)a4, v7);
    v9 = 0;
    switch(*(void *)&v50[0])
    {
      case 0:
        goto LABEL_5;
      case 2:
        if (*((void *)&v51 + 1) == 6)
        {
          v45 = [MLPDropoutLayer alloc];
          v14 = objc_msgSend_name(v8, v46, v47, v48);
          uint64_t v16 = objc_msgSend_initWithName_parameters_(v45, v49, (uint64_t)v14, (uint64_t)v50);
          goto LABEL_6;
        }
        if (*((void *)&v51 + 1) == 4)
        {
          v30 = [MLPLossLayer alloc];
          v14 = objc_msgSend_name(v8, v31, v32, v33);
          uint64_t v16 = objc_msgSend_initWithName_parameters_(v30, v34, (uint64_t)v14, (uint64_t)v50);
          goto LABEL_6;
        }
        v9 = 0;
        break;
      case 4:
      case 0x17:
        uint64_t v10 = [MLPEmbeddingLayer alloc];
        v14 = objc_msgSend_name(v8, v11, v12, v13);
        uint64_t v16 = objc_msgSend_initWithName_parameters_(v10, v15, (uint64_t)v14, (uint64_t)v50);
        goto LABEL_6;
      case 5:
        uint64_t v35 = [MLPLSTMLayer alloc];
        v14 = objc_msgSend_name(v8, v36, v37, v38);
        uint64_t v16 = objc_msgSend_initWithName_parameters_(v35, v39, (uint64_t)v14, (uint64_t)v50);
        goto LABEL_6;
      case 0xBLL:
        float v25 = [MLPConvolutionLayer alloc];
        v14 = objc_msgSend_name(v8, v26, v27, v28);
        uint64_t v16 = objc_msgSend_initWithName_parameters_(v25, v29, (uint64_t)v14, (uint64_t)v50);
        goto LABEL_6;
      case 0xCLL:
        float v40 = [MLPPoolingLayer alloc];
        v14 = objc_msgSend_name(v8, v41, v42, v43);
        uint64_t v16 = objc_msgSend_initWithName_parameters_(v40, v44, (uint64_t)v14, (uint64_t)v50);
        goto LABEL_6;
      default:
        break;
    }
  }
  else
  {
    bzero(v50, 0x2C0uLL);
LABEL_5:
    uint64_t v17 = [MLPDenseLayer alloc];
    v14 = objc_msgSend_name(v8, v18, v19, v20);
    uint64_t v16 = objc_msgSend_initWithName_parameters_(v17, v21, (uint64_t)v14, (uint64_t)v50);
LABEL_6:
    v9 = (void *)v16;

    if (v9) {
      objc_msgSend_setNode_(v9, v22, (uint64_t)v8, v23);
    }
  }

  return v9;
}

- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v13 = NSString;
  v14 = NSStringFromSelector(a2);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v13, v15, @"You must override %@ in a subclass", v16, v14);
  objc_msgSend_exceptionWithName_reason_userInfo_(v12, v18, *MEMORY[0x1E4F1C3B8], (uint64_t)v17, 0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v19);
}

- (id)backward:(id)a3 inputGradient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  id v9 = NSString;
  id v10 = NSStringFromSelector(a2);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v9, v11, @"You must override %@ in a subclass", v12, v10);
  objc_msgSend_exceptionWithName_reason_userInfo_(v8, v14, *MEMORY[0x1E4F1C3B8], (uint64_t)v13, 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v15);
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v13 = NSString;
  v14 = NSStringFromSelector(a2);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v13, v15, @"You must override %@ in a subclass", v16, v14);
  objc_msgSend_exceptionWithName_reason_userInfo_(v12, v18, *MEMORY[0x1E4F1C3B8], (uint64_t)v17, 0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v19);
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = NSString;
  uint64_t v13 = NSStringFromSelector(a2);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v12, v14, @"You must override %@ in a subclass", v15, v13);
  objc_msgSend_exceptionWithName_reason_userInfo_(v11, v17, *MEMORY[0x1E4F1C3B8], (uint64_t)v16, 0);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v18);
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1CA00];
  id v10 = NSString;
  id v11 = NSStringFromSelector(a2);
  v14 = objc_msgSend_stringWithFormat_(v10, v12, @"You must override %@ in a subclass", v13, v11);
  objc_msgSend_exceptionWithName_reason_userInfo_(v9, v15, *MEMORY[0x1E4F1C3B8], (uint64_t)v14, 0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5 params:(id *)a6 inputChunks:(id)a7 outputChunks:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = [MontrealNNGenerateNode alloc];
  uint64_t v22 = objc_msgSend_weightFormat(v15, v19, v20, v21);
  uint64_t v24 = objc_msgSend_initWithParameters_weightDataFormat_(v18, v23, (uint64_t)a6, v22);
  v26 = objc_msgSend_createInputs_inputChunks_nodeName_(MontrealNNModelTensor, v25, (uint64_t)a6, (uint64_t)v16, v14);
  uint64_t v28 = objc_msgSend_createOutputs_outputChunks_nodeName_(MontrealNNModelTensor, v27, (uint64_t)a6, (uint64_t)v17, v14);
  objc_msgSend_addInputs_(v15, v29, (uint64_t)v26, v30);
  objc_msgSend_addOutputs_(v15, v31, (uint64_t)v28, v32);
  v36 = objc_msgSend_node(self, v33, v34, v35);
  *a5 = objc_msgSend_generateNode_node_weightIter_inputs_outputs_(v24, v37, (uint64_t)v14, (uint64_t)v36, *a5, v26, v28);

  return v24;
}

- (void)createKernel
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  v3 = NSString;
  v4 = NSStringFromSelector(a2);
  id v7 = objc_msgSend_stringWithFormat_(v3, v5, @"You must override %@ in a subclass", v6, v4);
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v8, *MEMORY[0x1E4F1C3B8], (uint64_t)v7, 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (void)updatePreviousLayer:(id)a3 nextLayer:(id)a4 network:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_setPreviousLayer_(self, v10, (uint64_t)v16, v11);
  objc_msgSend_setNextLayer_(self, v12, (uint64_t)v8, v13);
  objc_msgSend_setNetwork_(self, v14, (uint64_t)v9, v15);
}

- (void)printMatrix:(id)a3 name:(id)a4 cmdBuf:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = objc_msgSend_network(self, v11, v12, v13);
    id v18 = objc_msgSend_deviceHandler(v14, v15, v16, v17);
    uint64_t v22 = objc_msgSend_data(v8, v19, v20, v21);
    objc_msgSend_importDataFromGPU_cmdBuf_(v18, v23, (uint64_t)v22, (uint64_t)v10);

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_19E26811C;
    v26[3] = &unk_1E599D1A8;
    id v27 = v8;
    id v28 = v9;
    objc_msgSend_addCompletedHandler_(v10, v24, (uint64_t)v26, v25);
  }
}

- (int)mpsNeuronTypeFromMontrealType:(int64_t)a3
{
  if ((unint64_t)a3 >= 9 || ((0x177u >> a3) & 1) == 0) {
    sub_19E15DB6C(@"Cannot translate Montreal Activation type to MPS: %tu", (uint64_t)a2, a3, v3, v4, v5, v6, v7, a3);
  }
  return dword_19E351C10[a3];
}

- (int64_t)montrealTypeFromMPSNeuronType:(int)a3
{
  if (a3 >= 6 || ((0x3Bu >> a3) & 1) == 0) {
    sub_19E15DB6C(@"Cannot translate MPS Activation type to Montreal: %d", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, *(uint64_t *)&a3);
  }
  return qword_19E351C38[a3];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)layerType
{
  return self->_layerType;
}

- (MontrealNNModelNode)node
{
  return (MontrealNNModelNode *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNode:(id)a3
{
}

- (int)neuronType
{
  return self->_neuronType;
}

- (float)neuronA
{
  return self->_neuronA;
}

- (float)neuronB
{
  return self->_neuronB;
}

- (float)neuronC
{
  return self->_neuronC;
}

- (unint64_t)inputLength
{
  return self->_inputLength;
}

- (void)setInputLength:(unint64_t)a3
{
  self->_inputLength = a3;
}

- (unint64_t)inputChannels
{
  return self->_inputChannels;
}

- (void)setInputChannels:(unint64_t)a3
{
  self->_inputChannels = a3;
}

- (unint64_t)outputChannels
{
  return self->_outputChannels;
}

- (void)setOutputChannels:(unint64_t)a3
{
  self->_outputChannels = a3;
}

- (unint64_t)outputLength
{
  return self->_outputLength;
}

- (void)setOutputLength:(unint64_t)a3
{
  self->_outputLength = a3;
}

- (MPSKernel)forwardKernel
{
  return (MPSKernel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setForwardKernel:(id)a3
{
}

- (MPSKernel)secondaryForwardKernel
{
  return (MPSKernel *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSecondaryForwardKernel:(id)a3
{
}

- (MPSKernel)primaryGradientKernel
{
  return (MPSKernel *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPrimaryGradientKernel:(id)a3
{
}

- (MPSKernel)secondaryGradientKernel
{
  return (MPSKernel *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSecondaryGradientKernel:(id)a3
{
}

- (MLPLayer)previousLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousLayer);

  return (MLPLayer *)WeakRetained;
}

- (void)setPreviousLayer:(id)a3
{
}

- (MLPLayer)nextLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextLayer);

  return (MLPLayer *)WeakRetained;
}

- (void)setNextLayer:(id)a3
{
}

- (MLPNetwork)network
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_network);

  return (MLPNetwork *)WeakRetained;
}

- (void)setNetwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_network);
  objc_destroyWeak((id *)&self->_nextLayer);
  objc_destroyWeak((id *)&self->_previousLayer);
  objc_storeStrong((id *)&self->_secondaryGradientKernel, 0);
  objc_storeStrong((id *)&self->_primaryGradientKernel, 0);
  objc_storeStrong((id *)&self->_secondaryForwardKernel, 0);
  objc_storeStrong((id *)&self->_forwardKernel, 0);
  objc_storeStrong((id *)&self->_node, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end