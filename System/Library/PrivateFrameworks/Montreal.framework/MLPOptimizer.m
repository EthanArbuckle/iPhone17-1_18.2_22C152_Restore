@interface MLPOptimizer
+ (id)optimizerWithNetwork:(id)a3 momentum:(id)a4 velocity:(id)a5;
- (MLPNetwork)network;
- (MLPOptimizer)initWithNetwork:(id)a3 mpsOptimizer:(id)a4;
- (MPSNNOptimizer)mpsOptimizer;
- (void)encodeToCommandBuffer:(id)a3 inputGradientMatrix:(id)a4 inputValuesMatrix:(id)a5;
- (void)encodeToCommandBuffer:(id)a3 inputGradientVector:(id)a4 inputValuesVector:(id)a5;
@end

@implementation MLPOptimizer

+ (id)optimizerWithNetwork:(id)a3 momentum:(id)a4 velocity:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13 = objc_msgSend_optimizerParams(v7, v10, v11, v12);
  uint64_t v17 = objc_msgSend_optimizerType(v13, v14, v15, v16);

  if (v17 == 1)
  {
    v18 = [MLPOptimizerAdam alloc];
    uint64_t v20 = objc_msgSend_initWithNetwork_momentum_velocity_(v18, v19, (uint64_t)v7, (uint64_t)v8, v9);
  }
  else
  {
    v21 = [MLPOptimizerSGD alloc];
    uint64_t v20 = objc_msgSend_initWithNetwork_momentum_(v21, v22, (uint64_t)v7, (uint64_t)v8);
  }
  v23 = (void *)v20;

  return v23;
}

- (MLPOptimizer)initWithNetwork:(id)a3 mpsOptimizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MLPOptimizer;
  id v8 = [(MLPOptimizer *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_network, v6);
    objc_storeStrong((id *)&v9->_mpsOptimizer, a4);
  }

  return v9;
}

- (void)encodeToCommandBuffer:(id)a3 inputGradientVector:(id)a4 inputValuesVector:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = NSString;
  v13 = NSStringFromSelector(a2);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v12, v14, @"%@ not implemented in a subclass", v15, v13);
  objc_msgSend_exceptionWithName_reason_userInfo_(v11, v17, *MEMORY[0x1E4F1C3B8], (uint64_t)v16, 0);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v18);
}

- (void)encodeToCommandBuffer:(id)a3 inputGradientMatrix:(id)a4 inputValuesMatrix:(id)a5
{
  id v36 = a3;
  id v8 = a4;
  id v9 = a5;
  v13 = objc_msgSend_network(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_deviceHandler(v13, v14, v15, v16);
  uint64_t v20 = objc_msgSend_matrixToVector_(v17, v18, (uint64_t)v8, v19);
  v24 = objc_msgSend_network(self, v21, v22, v23);
  v28 = objc_msgSend_deviceHandler(v24, v25, v26, v27);
  v31 = objc_msgSend_matrixToVector_(v28, v29, (uint64_t)v9, v30);
  objc_msgSend_encodeToCommandBuffer_inputGradientVector_inputValuesVector_(self, v32, (uint64_t)v36, (uint64_t)v20, v31);

  objc_msgSend_resetReadCount(v8, v33, v34, v35);
}

- (MPSNNOptimizer)mpsOptimizer
{
  return (MPSNNOptimizer *)objc_getProperty(self, a2, 8, 1);
}

- (MLPNetwork)network
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_network);

  return (MLPNetwork *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_network);

  objc_storeStrong((id *)&self->_mpsOptimizer, 0);
}

@end