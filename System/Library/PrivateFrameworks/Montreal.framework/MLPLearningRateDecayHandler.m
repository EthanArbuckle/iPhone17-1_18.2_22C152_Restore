@interface MLPLearningRateDecayHandler
- (BOOL)stairCase;
- (MLPLearningRateDecayHandler)initWithLearningRate:(float)a3 decaySteps:(unint64_t)a4 decayRate:(float)a5 stairCase:(BOOL)a6;
- (MLPLearningRateDecayHandlerDelegate)delegate;
- (float)decayRate;
- (float)decayedLearningRate;
- (float)learningRate;
- (unint64_t)decaySteps;
- (unint64_t)globalSteps;
- (void)setDecayedLearningRate:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setGlobalSteps:(unint64_t)a3;
- (void)updateGlobalStep;
@end

@implementation MLPLearningRateDecayHandler

- (MLPLearningRateDecayHandler)initWithLearningRate:(float)a3 decaySteps:(unint64_t)a4 decayRate:(float)a5 stairCase:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MLPLearningRateDecayHandler;
  result = [(MLPLearningRateDecayHandler *)&v11 init];
  if (result)
  {
    result->_decaySteps = a4;
    result->_learningRate = a3;
    result->_decayRate = a5;
    result->_stairCase = a6;
    result->_decayedLearningRate = a3;
  }
  return result;
}

- (void)updateGlobalStep
{
  uint64_t v5 = objc_msgSend_globalSteps(self, a2, v2, v3);
  objc_msgSend_setGlobalSteps_(self, v6, v5 + 1, v7);
  objc_msgSend_decayedLearningRate(self, v8, v9, v10);
  if (v14 > 0.0001)
  {
    unint64_t v15 = objc_msgSend_globalSteps(self, v11, v12, v13);
    if (!(v15 % objc_msgSend_decaySteps(self, v16, v17, v18)))
    {
      unint64_t v22 = objc_msgSend_globalSteps(self, v19, v20, v21);
      float v26 = (float)(v22 / objc_msgSend_decaySteps(self, v23, v24, v25));
      objc_msgSend_stairCase(self, v27, v28, v29);
      objc_msgSend_learningRate(self, v30, v31, v32);
      float v34 = v33;
      objc_msgSend_decayRate(self, v35, v36, v37);
      *(float *)&double v39 = powf(v38, v26) * v34;
      objc_msgSend_setDecayedLearningRate_(self, v40, v41, v42, v39);
      objc_msgSend_delegate(self, v43, v44, v45);
      id v51 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decayedLearningRate(self, v46, v47, v48);
      objc_msgSend_decayHandler_didUpdateLearningRate_(v51, v49, (uint64_t)self, v50);
    }
  }
}

- (float)learningRate
{
  return self->_learningRate;
}

- (unint64_t)decaySteps
{
  return self->_decaySteps;
}

- (float)decayRate
{
  return self->_decayRate;
}

- (BOOL)stairCase
{
  return self->_stairCase;
}

- (float)decayedLearningRate
{
  return self->_decayedLearningRate;
}

- (void)setDecayedLearningRate:(float)a3
{
  self->_decayedLearningRate = a3;
}

- (unint64_t)globalSteps
{
  return self->_globalSteps;
}

- (void)setGlobalSteps:(unint64_t)a3
{
  self->_globalSteps = a3;
}

- (MLPLearningRateDecayHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MLPLearningRateDecayHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end