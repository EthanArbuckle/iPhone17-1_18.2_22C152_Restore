@interface MLPMatrixLayer
- (MLPMatrixLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 neuronType:(int)a5 neuronParams:(id)a6;
- (MLPMatrixLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 parameters:(id *)a5;
- (NSMutableDictionary)inputMatrixToFirstKernel;
- (NSMutableDictionary)inputMatrixToSecondKernel;
- (unint64_t)numInputs;
- (unint64_t)numOutputs;
- (void)allocateInputDictionaries;
- (void)setInputMatrixToFirstKernel:(id)a3;
- (void)setInputMatrixToSecondKernel:(id)a3;
- (void)setNumInputs:(unint64_t)a3;
- (void)setNumOutputs:(unint64_t)a3;
- (void)updateInputMatrixToFirstKernel:(id)a3 index:(id)a4 inference:(BOOL)a5;
- (void)updateInputMatrixToSecondKernel:(id)a3 index:(id)a4 inference:(BOOL)a5;
@end

@implementation MLPMatrixLayer

- (MLPMatrixLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 neuronType:(int)a5 neuronParams:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MLPMatrixLayer;
  v12 = [(MLPLayer *)&v18 initWithLayerType:a3 name:v10 neuronType:v7 neuronParams:v11];
  v16 = v12;
  if (v12) {
    objc_msgSend_allocateInputDictionaries(v12, v13, v14, v15);
  }

  return v16;
}

- (MLPMatrixLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 parameters:(id *)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MLPMatrixLayer;
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
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputMatrixToSecondKernel_(self, v5, (uint64_t)v12, v6);

  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputMatrixToFirstKernel_(self, v10, (uint64_t)v13, v11);
}

- (void)updateInputMatrixToFirstKernel:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  id v17 = a3;
  id v11 = a4;
  if (!a5)
  {
    objc_msgSend_incrementReadCount(v17, v8, v9, v10);
    objc_super v15 = objc_msgSend_inputMatrixToFirstKernel(self, v12, v13, v14);
    objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v17, (uint64_t)v11);
  }
}

- (void)updateInputMatrixToSecondKernel:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  id v17 = a3;
  id v11 = a4;
  if (!a5)
  {
    objc_msgSend_incrementReadCount(v17, v8, v9, v10);
    objc_super v15 = objc_msgSend_inputMatrixToSecondKernel(self, v12, v13, v14);
    objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v17, (uint64_t)v11);
  }
}

- (unint64_t)numInputs
{
  return self->_numInputs;
}

- (void)setNumInputs:(unint64_t)a3
{
  self->_numInputs = a3;
}

- (unint64_t)numOutputs
{
  return self->_numOutputs;
}

- (void)setNumOutputs:(unint64_t)a3
{
  self->_numOutputs = a3;
}

- (NSMutableDictionary)inputMatrixToSecondKernel
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInputMatrixToSecondKernel:(id)a3
{
}

- (NSMutableDictionary)inputMatrixToFirstKernel
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInputMatrixToFirstKernel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMatrixToFirstKernel, 0);

  objc_storeStrong((id *)&self->_inputMatrixToSecondKernel, 0);
}

@end