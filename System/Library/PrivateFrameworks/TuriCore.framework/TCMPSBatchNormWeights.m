@interface TCMPSBatchNormWeights
- (BOOL)load;
- (BOOL)updateGammaAndBetaWithBatchNormalizationState:(id)a3;
- (MPSCNNNormalizationGammaAndBetaState)gammaBetaState;
- (MPSCNNNormalizationMeanAndVarianceState)meanVarianceState;
- (MPSVector)betaMomentumVector;
- (MPSVector)betaVelocityVector;
- (MPSVector)gammaMomentumVector;
- (MPSVector)gammaVelocityVector;
- (MPSVector)movingMeanVector;
- (MPSVector)movingVarianceVector;
- (NSString)internalLabel;
- (TCMPSBatchNormWeights)initWithChannels:(unint64_t)a3 kernelParamsBinaryName:(const char *)a4 device:(id)a5 cmd_queue:(id)a6 gamma:(float *)a7 beta:(float *)a8 moving_avg:(float *)a9 moving_var:(float *)a10 optimizerOptions:(OptimizerOptions *)a11 batchNormEpsilon:(float)a12;
- (TCMPSConvolutionWeightsOptimizing)optimizer;
- (float)beta;
- (float)epsilon;
- (float)gamma;
- (float)mean;
- (float)variance;
- (id).cxx_construct;
- (id)label;
- (id)updateGammaAndBetaWithCommandBuffer:(id)a3 batchNormalizationState:(id)a4;
- (unint64_t)numberOfFeatureChannels;
- (void)loadBeta:(float *)a3;
- (void)loadGamma:(float *)a3;
- (void)loadMovingAvg:(float *)a3;
- (void)loadMovingVar:(float *)a3;
- (void)setInternalLabel:(id)a3;
- (void)setLearningRate:(float)a3;
- (void)set_cq:(id)a3;
@end

@implementation TCMPSBatchNormWeights

- (TCMPSBatchNormWeights)initWithChannels:(unint64_t)a3 kernelParamsBinaryName:(const char *)a4 device:(id)a5 cmd_queue:(id)a6 gamma:(float *)a7 beta:(float *)a8 moving_avg:(float *)a9 moving_var:(float *)a10 optimizerOptions:(OptimizerOptions *)a11 batchNormEpsilon:(float)a12
{
  id v19 = a5;
  id v82 = a6;
  v86.receiver = self;
  v86.super_class = (Class)TCMPSBatchNormWeights;
  v20 = [(TCMPSBatchNormWeights *)&v86 init];
  v21 = v20;
  if (v20)
  {
    long long v22 = *(_OWORD *)&a11->sgdMomentum;
    *(_OWORD *)&v20->_optimizerOptions.useSGD = *(_OWORD *)&a11->useSGD;
    *(_OWORD *)&v20->_optimizerOptions.sgdMomentum = v22;
    v20->_batchNormEpsilon = a12;
    objc_storeStrong((id *)&v20->mov_var_updater, a6);
    MEMORY[0x22A614700](&v21->_kernelParamsBinaryName, a4);
    LODWORD(__p[0]) = 0;
    std::vector<float>::vector(v85, a3, __p);
    v23 = v85[0];
    int v83 = 1065353216;
    std::vector<float>::vector(__p, a3, &v83);
    v24 = __p[0];
    v21->t = 0.0;
    v21->_channels = a3;
    *(float *)&double v25 = v21->_optimizerOptions.gradientClipping;
    *(float *)&double v26 = v21->_optimizerOptions.learningRate;
    *(float *)&double v27 = -*(float *)&v25;
    LODWORD(v28) = 1.0;
    v81 = objc_msgSend(MEMORY[0x263F133A8], "optimizerDescriptorWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:", *(float *)&v25 > 0.0, 2 * (v21->_optimizerOptions.weightDecay != 0.0), v26, v28, v25, v27);
    if (v21->_optimizerOptions.useSGD)
    {
      id v29 = objc_alloc(MEMORY[0x263F133B0]);
      *(float *)&double v30 = v21->_optimizerOptions.sgdMomentum;
      uint64_t v31 = [v29 initWithDevice:v19 momentumScale:0 useNestrovMomentum:v81 optimizerDescriptor:v30];
    }
    else
    {
      id v32 = objc_alloc(MEMORY[0x263F133A0]);
      *(float *)&double v33 = v21->_optimizerOptions.adamEpsilon;
      uint64_t v31 = [v32 initWithDevice:v19 beta1:0 beta2:v81 epsilon:v21->_optimizerOptions.adamBeta1 timeStep:v21->_optimizerOptions.adamBeta2 optimizerDescriptor:v33];
    }
    gammaBetaState = v21->_gammaBetaState;
    v21->_gammaBetaState = (MPSCNNNormalizationGammaAndBetaState *)v31;

    LODWORD(v35) = -1110651696;
    LODWORD(v36) = 1.0;
    LODWORD(v37) = -1.0;
    v38 = [MEMORY[0x263F133A8] optimizerDescriptorWithLearningRate:2 gradientRescale:v35 regularizationType:v36 regularizationScale:v37];
    uint64_t v39 = [objc_alloc(MEMORY[0x263F133B0]) initWithDevice:v19 momentumScale:0 useNestrovMomentum:v38 optimizerDescriptor:0.0];
    sgdGamma = v21->sgdGamma;
    v21->sgdGamma = (MPSNNOptimizerStochasticGradientDescent *)v39;

    uint64_t v41 = [objc_alloc(MEMORY[0x263F133B0]) initWithDevice:v19 momentumScale:0 useNestrovMomentum:v38 optimizerDescriptor:0.0];
    sgdBeta = v21->sgdBeta;
    v21->sgdBeta = (MPSNNOptimizerStochasticGradientDescent *)v41;

    uint64_t v43 = [v19 newBufferWithBytes:v23 length:4 * a3 options:0];
    cq = v21->cq;
    v21->cq = (MTLCommandQueue *)v43;

    uint64_t v45 = [v19 newBufferWithBytes:v23 length:4 * a3 options:0];
    gammaMomentumBuffer = v21->gammaMomentumBuffer;
    v21->gammaMomentumBuffer = (MTLBuffer *)v45;

    if (a7) {
      uint64_t v47 = [v19 newBufferWithBytes:a7 length:4 * a3 options:0];
    }
    else {
      uint64_t v47 = [v19 newBufferWithBytes:v24 length:4 * a3 options:0];
    }
    gammaVelocityBuffer = v21->gammaVelocityBuffer;
    v21->gammaVelocityBuffer = (MTLBuffer *)v47;

    uint64_t v49 = [v19 newBufferWithBytes:v23 length:4 * a3 options:0];
    v50 = *(void **)&v21->use_sgd_opt;
    *(void *)&v21->use_sgd_opt = v49;

    uint64_t v51 = [v19 newBufferWithBytes:v23 length:4 * a3 options:0];
    betaMomentumBuffer = v21->betaMomentumBuffer;
    v21->betaMomentumBuffer = (MTLBuffer *)v51;

    if (a8) {
      uint64_t v53 = [v19 newBufferWithBytes:a8 length:4 * a3 options:0];
    }
    else {
      uint64_t v53 = [v19 newBufferWithBytes:v23 length:4 * a3 options:0];
    }
    betaVelocityBuffer = v21->betaVelocityBuffer;
    v21->betaVelocityBuffer = (MTLBuffer *)v53;

    if (a9) {
      uint64_t v55 = [v19 newBufferWithBytes:a9 length:4 * a3 options:0];
    }
    else {
      uint64_t v55 = [v19 newBufferWithBytes:v23 length:4 * a3 options:0];
    }
    betaBuffer = v21->betaBuffer;
    v21->betaBuffer = (MTLBuffer *)v55;

    if (a10) {
      uint64_t v57 = [v19 newBufferWithBytes:a10 length:4 * a3 options:0];
    }
    else {
      uint64_t v57 = [v19 newBufferWithBytes:v24 length:4 * a3 options:0];
    }
    gammaBuffer = v21->gammaBuffer;
    v21->gammaBuffer = (MTLBuffer *)v57;

    uint64_t v59 = [objc_alloc(MEMORY[0x263F131A0]) initWithGamma:v21->gammaVelocityBuffer beta:v21->betaVelocityBuffer];
    movingMeanBuffer = v21->movingMeanBuffer;
    v21->movingMeanBuffer = (MTLBuffer *)v59;

    uint64_t v61 = [objc_alloc(MEMORY[0x263F131A8]) initWithMean:v21->betaBuffer variance:v21->gammaBuffer];
    label = v21->_label;
    v21->_label = (NSString *)v61;

    v21->_betaMomentumPointer = (float *)[*(id *)&v21->use_sgd_opt contents];
    v21->_betaVelocityPointer = (float *)[(MTLBuffer *)v21->betaMomentumBuffer contents];
    v21->_betaPointer = (float *)[(MTLBuffer *)v21->betaVelocityBuffer contents];
    v21->_gammaMomentumPointer = (float *)[(MTLCommandQueue *)v21->cq contents];
    v21->_gammaVelocityPointer = (float *)[(MTLBuffer *)v21->gammaMomentumBuffer contents];
    v21->_gammaPointer = (float *)[(MTLBuffer *)v21->gammaVelocityBuffer contents];
    v21->_movingMeanPointer = (float *)[(MTLBuffer *)v21->betaBuffer contents];
    v21->_movingVariancePointer = (float *)[(MTLBuffer *)v21->gammaBuffer contents];
    uint64_t v63 = [MEMORY[0x263F133F0] vectorDescriptorWithLength:a3 dataType:268435488];
    v64 = *(void **)&v21->_kernelParamsBinaryName.__r_.var0;
    *(void *)&v21->_kernelParamsBinaryName.__r_.var0 = v63;

    uint64_t v65 = [objc_alloc(MEMORY[0x263F133E8]) initWithBuffer:v21->cq descriptor:*(void *)&v21->_kernelParamsBinaryName.__r_.var0];
    meanVarianceState = v21->_meanVarianceState;
    v21->_meanVarianceState = (MPSCNNNormalizationMeanAndVarianceState *)v65;

    uint64_t v67 = [objc_alloc(MEMORY[0x263F133E8]) initWithBuffer:v21->gammaMomentumBuffer descriptor:*(void *)&v21->_kernelParamsBinaryName.__r_.var0];
    gammaMomentumVector = v21->_gammaMomentumVector;
    v21->_gammaMomentumVector = (MPSVector *)v67;

    uint64_t v69 = [objc_alloc(MEMORY[0x263F133E8]) initWithBuffer:*(void *)&v21->use_sgd_opt descriptor:*(void *)&v21->_kernelParamsBinaryName.__r_.var0];
    optimizer = v21->_optimizer;
    v21->_optimizer = (TCMPSConvolutionWeightsOptimizing *)v69;

    uint64_t v71 = [objc_alloc(MEMORY[0x263F133E8]) initWithBuffer:v21->betaMomentumBuffer descriptor:*(void *)&v21->_kernelParamsBinaryName.__r_.var0];
    betaMomentumVector = v21->_betaMomentumVector;
    v21->_betaMomentumVector = (MPSVector *)v71;

    uint64_t v73 = [objc_alloc(MEMORY[0x263F133E8]) initWithBuffer:v21->betaBuffer descriptor:*(void *)&v21->_kernelParamsBinaryName.__r_.var0];
    gammaVelocityVector = v21->_gammaVelocityVector;
    v21->_gammaVelocityVector = (MPSVector *)v73;

    uint64_t v75 = [objc_alloc(MEMORY[0x263F133E8]) initWithBuffer:v21->gammaBuffer descriptor:*(void *)&v21->_kernelParamsBinaryName.__r_.var0];
    betaVelocityVector = v21->_betaVelocityVector;
    v21->_betaVelocityVector = (MPSVector *)v75;

    uint64_t v77 = objc_msgSend(NSString, "stringWithCString:encoding:", a4, objc_msgSend(NSString, "defaultCStringEncoding"));
    movingVarianceBuffer = v21->movingVarianceBuffer;
    v21->movingVarianceBuffer = (MTLBuffer *)v77;

    v79 = v21;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v85[0])
    {
      v85[1] = v85[0];
      operator delete(v85[0]);
    }
  }

  return v21;
}

- (void)set_cq:(id)a3
{
}

- (unint64_t)numberOfFeatureChannels
{
  return self->_channels;
}

- (float)gamma
{
  return self->_gammaPointer;
}

- (float)beta
{
  return self->_betaPointer;
}

- (float)mean
{
  return self->_movingMeanPointer;
}

- (float)variance
{
  return self->_movingVariancePointer;
}

- (float)epsilon
{
  return self->_batchNormEpsilon;
}

- (BOOL)load
{
  return 1;
}

- (id)label
{
  return self->movingVarianceBuffer;
}

- (void)setLearningRate:(float)a3
{
  self->_optimizerOptions.learningRate = a3;
}

- (BOOL)updateGammaAndBetaWithBatchNormalizationState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 gradientForBeta];
  uint64_t v6 = [v5 contents];

  id v7 = [v4 gradientForGamma];
  uint64_t v8 = [v7 contents];

  id v9 = [v4 mean];
  uint64_t v10 = [v9 contents];

  id v11 = [v4 variance];
  uint64_t v12 = [v11 contents];

  adamBeta1 = self->_optimizerOptions.adamBeta1;
  adamBeta2 = self->_optimizerOptions.adamBeta2;
  float v15 = self->t + 1.0;
  self->t = v15;
  unint64_t channels = self->_channels;
  if (channels)
  {
    float v17 = 1.0 - powf(adamBeta1, v15);
    float v18 = powf(adamBeta2, v15);
    uint64_t v19 = 0;
    float v20 = sqrtf(1.0 - v18);
    float v21 = 1.0 - adamBeta1;
    betaMomentumPointer = self->_betaMomentumPointer;
    betaVelocityPointer = self->_betaVelocityPointer;
    float v24 = 1.0 - adamBeta2;
    float v25 = (float)-(float)(self->_optimizerOptions.learningRate * v20) / v17;
    gammaVelocityPointer = self->_gammaVelocityPointer;
    gammaMomentumPointer = self->_gammaMomentumPointer;
    betaPointer = self->_betaPointer;
    gammaPointer = self->_gammaPointer;
    movingVariancePointer = self->_movingVariancePointer;
    movingMeanPointer = self->_movingMeanPointer;
    do
    {
      betaMomentumPointer[v19] = (float)(v21 * *(float *)(v6 + 4 * v19)) + (float)(adamBeta1 * betaMomentumPointer[v19]);
      float v32 = (float)(*(float *)(v6 + 4 * v19) * (float)(v24 * *(float *)(v6 + 4 * v19)))
          + (float)(adamBeta2 * betaVelocityPointer[v19]);
      betaVelocityPointer[v19] = v32;
      betaPointer[v19] = betaPointer[v19]
                       + (float)(v25
                               * (float)(betaMomentumPointer[v19]
                                       / (float)(self->_optimizerOptions.adamEpsilon + sqrtf(v32))));
      gammaMomentumPointer[v19] = (float)(v21 * *(float *)(v8 + 4 * v19))
                                + (float)(adamBeta1 * gammaMomentumPointer[v19]);
      float v33 = (float)(*(float *)(v8 + 4 * v19) * (float)(v24 * *(float *)(v8 + 4 * v19)))
          + (float)(adamBeta2 * gammaVelocityPointer[v19]);
      gammaVelocityPointer[v19] = v33;
      gammaPointer[v19] = gammaPointer[v19]
                        + (float)(v25
                                * (float)(gammaMomentumPointer[v19]
                                        / (float)(self->_optimizerOptions.adamEpsilon + sqrtf(v33))));
      movingMeanPointer[v19] = movingMeanPointer[v19]
                             - (float)((float)(movingMeanPointer[v19] - *(float *)(v10 + 4 * v19)) * v24);
      movingVariancePointer[v19] = movingVariancePointer[v19]
                                 - (float)((float)(movingVariancePointer[v19] - *(float *)(v12 + 4 * v19)) * v24);
      ++v19;
    }
    while (channels != v19);
  }

  return 1;
}

- (id)updateGammaAndBetaWithCommandBuffer:(id)a3 batchNormalizationState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F133E8]);
  id v9 = [v7 mean];
  uint64_t v10 = (void *)[v8 initWithBuffer:v9 descriptor:*(void *)&self->_kernelParamsBinaryName.__r_.var0];

  id v11 = objc_alloc(MEMORY[0x263F133E8]);
  uint64_t v12 = [v7 variance];
  v13 = (void *)[v11 initWithBuffer:v12 descriptor:*(void *)&self->_kernelParamsBinaryName.__r_.var0];

  sgdGamma = self->sgdGamma;
  float v15 = [(TCMPSBatchNormWeights *)self movingMeanVector];
  v16 = [(TCMPSBatchNormWeights *)self movingMeanVector];
  [(MPSNNOptimizerStochasticGradientDescent *)sgdGamma encodeToCommandBuffer:v6 inputGradientVector:v10 inputValuesVector:v15 inputMomentumVector:0 resultValuesVector:v16];

  sgdBeta = self->sgdBeta;
  float v18 = [(TCMPSBatchNormWeights *)self movingVarianceVector];
  uint64_t v19 = [(TCMPSBatchNormWeights *)self movingVarianceVector];
  [(MPSNNOptimizerStochasticGradientDescent *)sgdBeta encodeToCommandBuffer:v6 inputGradientVector:v13 inputValuesVector:v18 inputMomentumVector:0 resultValuesVector:v19];

  [(MPSCNNNormalizationGammaAndBetaState *)self->_gammaBetaState encodeToCommandBuffer:v6 batchNormalizationState:v7 batchNormData:self];
  float v20 = [(TCMPSBatchNormWeights *)self gammaBetaState];

  return v20;
}

- (void)loadBeta:(float *)a3
{
}

- (void)loadGamma:(float *)a3
{
}

- (void)loadMovingAvg:(float *)a3
{
}

- (void)loadMovingVar:(float *)a3
{
}

- (NSString)internalLabel
{
  return (NSString *)self->movingVarianceBuffer;
}

- (void)setInternalLabel:(id)a3
{
}

- (MPSCNNNormalizationGammaAndBetaState)gammaBetaState
{
  return (MPSCNNNormalizationGammaAndBetaState *)self->movingMeanBuffer;
}

- (MPSCNNNormalizationMeanAndVarianceState)meanVarianceState
{
  return (MPSCNNNormalizationMeanAndVarianceState *)self->_label;
}

- (TCMPSConvolutionWeightsOptimizing)optimizer
{
  return (TCMPSConvolutionWeightsOptimizing *)self->_gammaBetaState;
}

- (MPSVector)gammaMomentumVector
{
  return (MPSVector *)self->_meanVarianceState;
}

- (MPSVector)betaMomentumVector
{
  return (MPSVector *)self->_optimizer;
}

- (MPSVector)gammaVelocityVector
{
  return self->_gammaMomentumVector;
}

- (MPSVector)betaVelocityVector
{
  return self->_betaMomentumVector;
}

- (MPSVector)movingMeanVector
{
  return self->_gammaVelocityVector;
}

- (MPSVector)movingVarianceVector
{
  return self->_betaVelocityVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betaVelocityVector, 0);
  objc_storeStrong((id *)&self->_gammaVelocityVector, 0);
  objc_storeStrong((id *)&self->_betaMomentumVector, 0);
  objc_storeStrong((id *)&self->_gammaMomentumVector, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
  objc_storeStrong((id *)&self->_meanVarianceState, 0);
  objc_storeStrong((id *)&self->_gammaBetaState, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->movingMeanBuffer, 0);
  objc_storeStrong((id *)&self->movingVarianceBuffer, 0);
  objc_storeStrong((id *)&self->betaBuffer, 0);
  objc_storeStrong((id *)&self->gammaBuffer, 0);
  objc_storeStrong((id *)&self->betaVelocityBuffer, 0);
  objc_storeStrong((id *)&self->gammaVelocityBuffer, 0);
  objc_storeStrong((id *)&self->betaMomentumBuffer, 0);
  objc_storeStrong((id *)&self->gammaMomentumBuffer, 0);
  objc_storeStrong((id *)&self->use_sgd_opt, 0);
  objc_storeStrong((id *)&self->cq, 0);
  objc_storeStrong((id *)&self->mov_var_updater, 0);
  objc_storeStrong((id *)&self->mov_avg_updater, 0);
  objc_storeStrong((id *)&self->sgdBeta, 0);
  objc_storeStrong((id *)&self->sgdGamma, 0);
  objc_storeStrong((id *)&self->adamBeta, 0);
  objc_storeStrong((id *)&self->adamGamma, 0);
  objc_storeStrong((id *)&self->vDesc, 0);
  objc_storeStrong((id *)&self->_kernelParamsBinaryName.var0, 0);
  objc_storeStrong((id *)&self->_kernelParamsBinaryName.__r_.var0, 0);
  if (*((char *)&self->_kernelParamsBinaryName.__r_.__value_.var0.__l + 23) < 0)
  {
    data = self->_kernelParamsBinaryName.__r_.__value_.var0.__l.__data_;
    operator delete(data);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 80) = 0;
  *(_OWORD *)((char *)self + 84) = xmmword_2246B8350;
  *(void *)((char *)self + 100) = 0x3F7FBE773F666666;
  *((_DWORD *)self + 27) = 841731191;
  *((_OWORD *)self + 8) = 0uLL;
  *((void *)self + 15) = 0;
  return self;
}

@end