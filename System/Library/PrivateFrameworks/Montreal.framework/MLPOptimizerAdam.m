@interface MLPOptimizerAdam
- (MLPOptimizerAdam)initWithNetwork:(id)a3 momentum:(id)a4 velocity:(id)a5;
- (MPSVector)momentum;
- (MPSVector)velocity;
- (void)encodeToCommandBuffer:(id)a3 inputGradientVector:(id)a4 inputValuesVector:(id)a5;
- (void)setMomentum:(id)a3;
- (void)setVelocity:(id)a3;
@end

@implementation MLPOptimizerAdam

- (MLPOptimizerAdam)initWithNetwork:(id)a3 momentum:(id)a4 velocity:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(void))a4;
  v10 = (void (**)(void))a5;
  v14 = objc_msgSend_deviceHandler(v8, v11, v12, v13);
  v18 = objc_msgSend_device(v14, v15, v16, v17);

  v22 = objc_msgSend_optimizerParams(v8, v19, v20, v21);
  v23 = (void *)MEMORY[0x1E4F35940];
  objc_msgSend_learningRate(v22, v24, v25, v26);
  v29 = objc_msgSend_optimizerDescriptorWithLearningRate_gradientRescale_regularizationType_regularizationScale_(v23, v27, 0, v28);
  v36 = objc_msgSend_gradientClipMin(v22, v30, v31, v32);
  if (v36)
  {
    v37 = objc_msgSend_gradientClipMax(v22, v33, v34, v35);

    if (v37)
    {
      objc_msgSend_setApplyGradientClipping_(v29, v38, 1, v39);
      v43 = objc_msgSend_gradientClipMin(v22, v40, v41, v42);
      objc_msgSend_floatValue(v43, v44, v45, v46);
      objc_msgSend_setGradientClipMin_(v29, v47, v48, v49);

      v53 = objc_msgSend_gradientClipMax(v22, v50, v51, v52);
      objc_msgSend_floatValue(v53, v54, v55, v56);
      objc_msgSend_setGradientClipMax_(v29, v57, v58, v59);
    }
  }
  id v60 = objc_alloc(MEMORY[0x1E4F35938]);
  LODWORD(v61) = 841731191;
  v63 = objc_msgSend_initWithDevice_beta1_beta2_epsilon_timeStep_optimizerDescriptor_(v60, v62, (uint64_t)v18, 0, v29, 0.899999976, 0.999000013, v61);
  v70.receiver = self;
  v70.super_class = (Class)MLPOptimizerAdam;
  v64 = [(MLPOptimizer *)&v70 initWithNetwork:v8 mpsOptimizer:v63];
  if (v64)
  {
    uint64_t v65 = v9[2](v9);
    momentum = v64->_momentum;
    v64->_momentum = (MPSVector *)v65;

    uint64_t v67 = v10[2](v10);
    velocity = v64->_velocity;
    v64->_velocity = (MPSVector *)v67;
  }
  return v64;
}

- (void)encodeToCommandBuffer:(id)a3 inputGradientVector:(id)a4 inputValuesVector:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_mpsOptimizer(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_momentum(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_velocity(self, v18, v19, v20);
  objc_msgSend_encodeToCommandBuffer_inputGradientVector_inputValuesVector_inputMomentumVector_inputVelocityVector_resultValuesVector_(v13, v22, (uint64_t)v23, (uint64_t)v8, v9, v17, v21, v9);
}

- (MPSVector)momentum
{
  return (MPSVector *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMomentum:(id)a3
{
}

- (MPSVector)velocity
{
  return (MPSVector *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVelocity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_velocity, 0);

  objc_storeStrong((id *)&self->_momentum, 0);
}

@end