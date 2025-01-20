@interface MLPImageLayer
- (MLPImageLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 neuronType:(int)a5 neuronParams:(id)a6;
- (MLPImageLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 parameters:(id *)a5;
- (NSArray)inputToFirstKernel;
- (NSArray)inputToSecondKernel;
- (NSArray)primaryCurrentState;
- (NSArray)secondaryCurrentState;
- (NSMutableDictionary)inputImagesToFirstKernel;
- (NSMutableDictionary)inputImagesToSecondKernel;
- (NSMutableDictionary)primaryCurrentStates;
- (NSMutableDictionary)secondaryCurrentStates;
- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5 params:(id *)a6;
- (void)allocateInputDictionaries;
- (void)updateInputToFirstKernel:(id)a3 index:(id)a4 inference:(BOOL)a5;
- (void)updateInputToFirstKernel:(id)a3 inference:(BOOL)a4;
- (void)updateInputToSecondKernel:(id)a3 index:(id)a4 inference:(BOOL)a5;
- (void)updateInputToSecondKernel:(id)a3 inference:(BOOL)a4;
- (void)updatePrimaryCurrentState:(id)a3 index:(id)a4 inference:(BOOL)a5;
- (void)updatePrimaryCurrentState:(id)a3 inference:(BOOL)a4;
- (void)updateSecondaryCurrentState:(id)a3 index:(id)a4 inference:(BOOL)a5;
- (void)updateSecondaryCurrentState:(id)a3 inference:(BOOL)a4;
@end

@implementation MLPImageLayer

- (MLPImageLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 neuronType:(int)a5 neuronParams:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MLPImageLayer;
  v12 = [(MLPLayer *)&v18 initWithLayerType:a3 name:v10 neuronType:v7 neuronParams:v11];
  v16 = v12;
  if (v12) {
    objc_msgSend_allocateInputDictionaries(v12, v13, v14, v15);
  }

  return v16;
}

- (MLPImageLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 parameters:(id *)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MLPImageLayer;
  v9 = [(MLPLayer *)&v15 initWithLayerType:a3 name:v8 parameters:a5];
  v13 = v9;
  if (v9) {
    objc_msgSend_allocateInputDictionaries(v9, v10, v11, v12);
  }

  return v13;
}

- (void)allocateInputDictionaries
{
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  inputImagesToSecondKernel = self->_inputImagesToSecondKernel;
  self->_inputImagesToSecondKernel = v5;

  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
  id v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  inputImagesToFirstKernel = self->_inputImagesToFirstKernel;
  self->_inputImagesToFirstKernel = v10;

  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13, v14);
  objc_super v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  primaryCurrentStates = self->_primaryCurrentStates;
  self->_primaryCurrentStates = v15;

  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v17, v18, v19);
  v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  secondaryCurrentStates = self->_secondaryCurrentStates;
  self->_secondaryCurrentStates = v20;
}

- (NSArray)inputToSecondKernel
{
  v4 = objc_msgSend_inputImagesToSecondKernel(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)&unk_1EF0B34A8, v6);

  return (NSArray *)v7;
}

- (NSArray)inputToFirstKernel
{
  v4 = objc_msgSend_inputImagesToFirstKernel(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)&unk_1EF0B34A8, v6);

  return (NSArray *)v7;
}

- (NSArray)primaryCurrentState
{
  v4 = objc_msgSend_primaryCurrentStates(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)&unk_1EF0B34A8, v6);

  return (NSArray *)v7;
}

- (NSArray)secondaryCurrentState
{
  v4 = objc_msgSend_secondaryCurrentStates(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)&unk_1EF0B34A8, v6);

  return (NSArray *)v7;
}

- (void)updateInputToFirstKernel:(id)a3 inference:(BOOL)a4
{
}

- (void)updateInputToFirstKernel:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  batch = (MPSImageBatch *)a3;
  id v10 = a4;
  if (!a5)
  {
    uint64_t v11 = objc_msgSend_objectAtIndex_(batch, v8, 0, v9);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      MPSImageBatchIncrementReadCount(batch, 1);
    }
    v16 = objc_msgSend_inputImagesToFirstKernel(self, v13, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)batch, (uint64_t)v10);
  }
}

- (void)updateInputToSecondKernel:(id)a3 inference:(BOOL)a4
{
}

- (void)updateInputToSecondKernel:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  batch = (MPSImageBatch *)a3;
  id v10 = a4;
  if (!a5)
  {
    uint64_t v11 = objc_msgSend_objectAtIndex_(batch, v8, 0, v9);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      MPSImageBatchIncrementReadCount(batch, 1);
    }
    v16 = objc_msgSend_inputImagesToSecondKernel(self, v13, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)batch, (uint64_t)v10);
  }
}

- (void)updatePrimaryCurrentState:(id)a3 inference:(BOOL)a4
{
}

- (void)updatePrimaryCurrentState:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  batch = (MPSStateBatch *)a3;
  id v11 = a4;
  if (a5)
  {
    MPSStateBatchIncrementReadCount(batch, -1);
  }
  else
  {
    uint64_t v12 = objc_msgSend_primaryCurrentStates(self, v8, v9, v10);
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)batch, (uint64_t)v11);
  }
}

- (void)updateSecondaryCurrentState:(id)a3 inference:(BOOL)a4
{
}

- (void)updateSecondaryCurrentState:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  batch = (MPSStateBatch *)a3;
  id v11 = a4;
  if (a5)
  {
    MPSStateBatchIncrementReadCount(batch, -1);
  }
  else
  {
    uint64_t v12 = objc_msgSend_secondaryCurrentStates(self, v8, v9, v10);
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)batch, (uint64_t)v11);
  }
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5 params:(id *)a6
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v54 = a4;
  uint64_t v10 = NSNumber;
  uint64_t v14 = objc_msgSend_inputLength(self, v11, v12, v13);
  v17 = objc_msgSend_numberWithUnsignedInteger_(v10, v15, v14, v16);
  v57[0] = v17;
  v57[1] = &unk_1EF0B34C0;
  uint64_t v18 = NSNumber;
  uint64_t v22 = objc_msgSend_inputChannels(self, v19, v20, v21);
  v25 = objc_msgSend_numberWithUnsignedInteger_(v18, v23, v22, v24);
  v57[2] = v25;
  v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)v57, 3);
  v58[0] = v27;
  v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v58, 1);

  v30 = NSNumber;
  uint64_t v34 = objc_msgSend_outputLength(self, v31, v32, v33);
  v37 = objc_msgSend_numberWithUnsignedInteger_(v30, v35, v34, v36);
  v55[0] = v37;
  v55[1] = &unk_1EF0B34C0;
  v38 = NSNumber;
  uint64_t v42 = objc_msgSend_outputChannels(self, v39, v40, v41);
  v45 = objc_msgSend_numberWithUnsignedInteger_(v38, v43, v42, v44);
  v55[2] = v45;
  v47 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v46, (uint64_t)v55, 3);
  v56 = v47;
  v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v48, (uint64_t)&v56, 1);

  v51 = objc_msgSend_generateNode_model_weightIter_params_inputChunks_outputChunks_(self, v50, (uint64_t)v53, (uint64_t)v54, a5, a6, v29, v49);

  return v51;
}

- (NSMutableDictionary)inputImagesToSecondKernel
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (NSMutableDictionary)inputImagesToFirstKernel
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (NSMutableDictionary)primaryCurrentStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (NSMutableDictionary)secondaryCurrentStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryCurrentStates, 0);
  objc_storeStrong((id *)&self->_primaryCurrentStates, 0);
  objc_storeStrong((id *)&self->_inputImagesToFirstKernel, 0);

  objc_storeStrong((id *)&self->_inputImagesToSecondKernel, 0);
}

@end