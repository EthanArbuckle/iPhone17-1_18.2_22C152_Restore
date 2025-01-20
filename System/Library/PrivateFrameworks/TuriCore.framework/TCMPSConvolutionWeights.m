@interface TCMPSConvolutionWeights
- (BOOL)load;
- (BOOL)updateWeights;
- (MPSCNNConvolutionWeightsAndBiasesState)state;
- (MPSVector)biasMomentumVector;
- (MPSVector)biasVelocityVector;
- (MPSVector)weightMomentumVector;
- (MPSVector)weightVelocityVector;
- (TCMPSConvolutionWeights)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 neuronType:(int)a7 neuronA:(float)a8 neuronB:(float)a9 stride:(unint64_t)a10 kernelParamsBinaryName:(const char *)a11 device:(id)a12 cmd_queue:(id)a13 init_weight_ptr:(float *)a14 init_bias_ptr:(float *)a15 optimizerOptions:(OptimizerOptions *)a16;
- (TCMPSConvolutionWeights)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 neuronType:(int)a7 strideX:(unint64_t)a8 strideY:(unint64_t)a9 neuronA:(float)a10 neuronB:(float)a11 kernelParamsBinaryName:(const char *)a12 device:(id)a13 cmd_queue:(id)a14 init_weight_ptr:(float *)a15 init_bias_ptr:(float *)a16 optimizerOptions:(OptimizerOptions *)a17;
- (TCMPSConvolutionWeights)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 neuronType:(int)a7 strideX:(unint64_t)a8 strideY:(unint64_t)a9 neuronA:(float)a10 neuronB:(float)a11 kernelParamsBinaryName:(const char *)a12 device:(id)a13 cmd_queue:(id)a14 updateWeights:(BOOL)a15 init_weight_ptr:(float *)a16 init_bias_ptr:(float *)a17 optimizerOptions:(OptimizerOptions *)a18;
- (TCMPSConvolutionWeightsOptimizing)optimizer;
- (float)biasTerms;
- (id).cxx_construct;
- (id)descriptor;
- (id)label;
- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4;
- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4 sourceState:(id)a5;
- (id)weightShape;
- (unint64_t)biasSize;
- (unint64_t)weightSize;
- (unsigned)dataType;
- (void)checkpointWithCommandQueue:(id)a3;
- (void)loadBias:(float *)a3;
- (void)loadWeight:(float *)a3;
- (void)setLearningRate:(float)a3;
- (void)set_cq:(id)a3;
- (void)weights;
@end

@implementation TCMPSConvolutionWeights

- (TCMPSConvolutionWeights)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 neuronType:(int)a7 neuronA:(float)a8 neuronB:(float)a9 stride:(unint64_t)a10 kernelParamsBinaryName:(const char *)a11 device:(id)a12 cmd_queue:(id)a13 init_weight_ptr:(float *)a14 init_bias_ptr:(float *)a15 optimizerOptions:(OptimizerOptions *)a16
{
  long long v16 = *(_OWORD *)&a16->sgdMomentum;
  v18[0] = *(_OWORD *)&a16->useSGD;
  v18[1] = v16;
  return -[TCMPSConvolutionWeights initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:init_weight_ptr:init_bias_ptr:optimizerOptions:](self, "initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:init_weight_ptr:init_bias_ptr:optimizerOptions:", a3, a4, a5, a6, *(void *)&a7, a10, a11, a12, a13, a14, a15, v18);
}

- (TCMPSConvolutionWeights)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 neuronType:(int)a7 strideX:(unint64_t)a8 strideY:(unint64_t)a9 neuronA:(float)a10 neuronB:(float)a11 kernelParamsBinaryName:(const char *)a12 device:(id)a13 cmd_queue:(id)a14 init_weight_ptr:(float *)a15 init_bias_ptr:(float *)a16 optimizerOptions:(OptimizerOptions *)a17
{
  long long v17 = *(_OWORD *)&a17->sgdMomentum;
  v20[0] = *(_OWORD *)&a17->useSGD;
  v20[1] = v17;
  LOBYTE(v19) = 1;
  return -[TCMPSConvolutionWeights initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:](self, "initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:", a3, a4, a5, a6, *(void *)&a7, a8, a9, a12, a13, a14, v19, a15, a16, v20);
}

- (TCMPSConvolutionWeights)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 neuronType:(int)a7 strideX:(unint64_t)a8 strideY:(unint64_t)a9 neuronA:(float)a10 neuronB:(float)a11 kernelParamsBinaryName:(const char *)a12 device:(id)a13 cmd_queue:(id)a14 updateWeights:(BOOL)a15 init_weight_ptr:(float *)a16 init_bias_ptr:(float *)a17 optimizerOptions:(OptimizerOptions *)a18
{
  uint64_t v21 = *(void *)&a7;
  id v27 = a13;
  id v77 = a14;
  v78.receiver = self;
  v78.super_class = (Class)TCMPSConvolutionWeights;
  v28 = [(TCMPSConvolutionWeights *)&v78 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->weightBuffer, a14);
    long long v30 = *(_OWORD *)&a18->useSGD;
    *(_OWORD *)&v29->_optimizerOptions.useSGD = *(_OWORD *)&a18->sgdMomentum;
    *(_OWORD *)((char *)&v29->sizeBias + 4) = v30;
    LOBYTE(v29->biasBuffer) = a15;
    v29->_unint64_t outputFeatureChannels = a6;
    v29->_inputFeatureChannels = a5;
    v29->_kernelHeight = a4;
    v29->_kernelWidth = a3;
    MEMORY[0x22A614700](&v29->_kernelParamsBinaryName, a12);
    uint64_t v31 = [MEMORY[0x263F13118] cnnConvolutionDescriptorWithKernelWidth:a3 kernelHeight:a4 inputFeatureChannels:a5 outputFeatureChannels:a6];
    convDesc = v29->_convDesc;
    v29->_convDesc = (MPSCNNConvolutionDescriptor *)v31;

    [(MPSCNNConvolutionDescriptor *)v29->_convDesc setStrideInPixelsX:a8];
    [(MPSCNNConvolutionDescriptor *)v29->_convDesc setStrideInPixelsY:a9];
    *(float *)&double v33 = a10;
    *(float *)&double v34 = a11;
    v35 = [MEMORY[0x263F13398] cnnNeuronDescriptorWithType:v21 a:v33 b:v34];
    [(MPSCNNConvolutionDescriptor *)v29->_convDesc setFusedNeuronDescriptor:v35];
    uint64_t v36 = 4 * v29->_outputFeatureChannels;
    uint64_t v37 = v36 * v29->_inputFeatureChannels * v29->_kernelHeight * v29->_kernelWidth;
    *(void *)&v29->_kernelParamsBinaryName.__r_.var0 = v36;
    v29->_kernelParamsBinaryName.var0 = v37;
    LODWORD(v38) = HIDWORD(v29->sizeWeights);
    LODWORD(v39) = v29->sizeWeights;
    *(float *)&double v40 = -*(float *)&v38;
    LODWORD(v41) = 1.0;
    v42 = objc_msgSend(MEMORY[0x263F133A8], "optimizerDescriptorWithLearningRate:gradientRescale:applyGradientClipping:gradientClipMax:gradientClipMin:regularizationType:regularizationScale:", *(float *)&v38 > 0.0, 2 * (*(float *)&v29->_seed != 0.0), v39, v41, v38, v40);
    if (BYTE4(v29->sizeBias))
    {
      id v43 = objc_alloc(MEMORY[0x263F133B0]);
      LODWORD(v44) = *(_DWORD *)&v29->_optimizerOptions.useSGD;
      uint64_t v45 = [v43 initWithDevice:v27 momentumScale:0 useNestrovMomentum:v42 optimizerDescriptor:v44];
    }
    else
    {
      id v46 = objc_alloc(MEMORY[0x263F133A0]);
      *(float *)&double v47 = v29->_optimizerOptions.weightDecay;
      uint64_t v45 = [v46 initWithDevice:v27 beta1:0 beta2:v42 epsilon:v29->_optimizerOptions.learningRate timeStep:v29->_optimizerOptions.gradientClipping optimizerDescriptor:v47];
    }
    v48 = *(void **)&v29->_updateWeights;
    *(void *)&v29->_updateWeights = v45;

    uint64_t v49 = [v27 newBufferWithLength:4 * v29->_inputFeatureChannels * v29->_kernelHeight * v29->_kernelWidth * v29->_outputFeatureChannels options:0];
    v50 = *(void **)&v29->_optimizerOptions.adamBeta1;
    *(void *)&v29->_optimizerOptions.adamBeta1 = v49;

    uint64_t v51 = [v27 newBufferWithLength:4 * v29->_inputFeatureChannels * v29->_kernelHeight * v29->_kernelWidth * v29->_outputFeatureChannels options:0];
    weightMomentumBuffer = v29->weightMomentumBuffer;
    v29->weightMomentumBuffer = (MTLBuffer *)v51;

    unint64_t v53 = v29->_inputFeatureChannels * v29->_kernelHeight * v29->_kernelWidth * v29->_outputFeatureChannels;
    if (a16) {
      uint64_t v54 = [v27 newBufferWithBytes:a16 length:4 * v53 options:0];
    }
    else {
      uint64_t v54 = [v27 newBufferWithLength:4 * v53 options:0];
    }
    weightVelocityBuffer = v29->weightVelocityBuffer;
    v29->weightVelocityBuffer = (MTLBuffer *)v54;

    unint64_t outputFeatureChannels = v29->_outputFeatureChannels;
    if (a17) {
      uint64_t v57 = [v27 newBufferWithBytes:a17 length:4 * outputFeatureChannels options:0];
    }
    else {
      uint64_t v57 = [v27 newBufferWithLength:4 * outputFeatureChannels options:0];
    }
    biasVelocityBuffer = v29->biasVelocityBuffer;
    v29->biasVelocityBuffer = (MTLBuffer *)v57;

    uint64_t v59 = [v27 newBufferWithLength:4 * v29->_outputFeatureChannels options:0];
    v60 = *(void **)&v29->_optimizerOptions.adamEpsilon;
    *(void *)&v29->_optimizerOptions.adamEpsilon = v59;

    uint64_t v61 = [v27 newBufferWithLength:4 * v29->_outputFeatureChannels options:0];
    biasMomentumBuffer = v29->biasMomentumBuffer;
    v29->biasMomentumBuffer = (MTLBuffer *)v61;

    uint64_t v63 = [objc_alloc(MEMORY[0x263F13130]) initWithWeights:v29->weightVelocityBuffer biases:v29->biasVelocityBuffer];
    cq = v29->cq;
    v29->cq = (MTLCommandQueue *)v63;

    v65 = [MEMORY[0x263F133F0] vectorDescriptorWithLength:v29->_kernelHeight * v29->_inputFeatureChannels * v29->_kernelWidth * v29->_outputFeatureChannels dataType:268435488];
    uint64_t v66 = [objc_alloc(MEMORY[0x263F133E8]) initWithBuffer:*(void *)&v29->_optimizerOptions.adamBeta1 descriptor:v65];
    state = v29->_state;
    v29->_state = (MPSCNNConvolutionWeightsAndBiasesState *)v66;

    uint64_t v68 = [objc_alloc(MEMORY[0x263F133E8]) initWithBuffer:v29->weightMomentumBuffer descriptor:v65];
    optimizer = v29->_optimizer;
    v29->_optimizer = (TCMPSConvolutionWeightsOptimizing *)v68;

    v70 = [MEMORY[0x263F133F0] vectorDescriptorWithLength:v29->_outputFeatureChannels dataType:268435488];
    uint64_t v71 = [objc_alloc(MEMORY[0x263F133E8]) initWithBuffer:*(void *)&v29->_optimizerOptions.adamEpsilon descriptor:v70];
    weightMomentumVector = v29->_weightMomentumVector;
    v29->_weightMomentumVector = (MPSVector *)v71;

    uint64_t v73 = [objc_alloc(MEMORY[0x263F133E8]) initWithBuffer:v29->biasMomentumBuffer descriptor:v70];
    weightVelocityVector = v29->_weightVelocityVector;
    v29->_weightVelocityVector = (MPSVector *)v73;

    v75 = v29;
  }

  return v29;
}

- (unsigned)dataType
{
  return 268435488;
}

- (void)setLearningRate:(float)a3
{
  *(float *)&self->sizeWeights = a3;
}

- (unint64_t)weightSize
{
  return (unint64_t)self->_kernelParamsBinaryName.var0 >> 2;
}

- (id)weightShape
{
  v9[4] = *MEMORY[0x263EF8340];
  v3 = [NSNumber numberWithUnsignedInteger:self->_outputFeatureChannels];
  v9[0] = v3;
  v4 = [NSNumber numberWithUnsignedInteger:self->_kernelHeight];
  v9[1] = v4;
  v5 = [NSNumber numberWithUnsignedInteger:self->_kernelWidth];
  v9[2] = v5;
  v6 = [NSNumber numberWithUnsignedInteger:self->_inputFeatureChannels];
  v9[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  return v7;
}

- (unint64_t)biasSize
{
  return *(void *)&self->_kernelParamsBinaryName.__r_.var0 >> 2;
}

- (id)descriptor
{
  return self->_convDesc;
}

- (void)weights
{
  return (void *)[(MTLBuffer *)self->weightVelocityBuffer contents];
}

- (float)biasTerms
{
  return (float *)[(MTLBuffer *)self->biasVelocityBuffer contents];
}

- (BOOL)load
{
  return 1;
}

- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (LOBYTE(self->biasBuffer))
  {
    v8 = [(TCMPSConvolutionWeights *)self optimizer];
    [v8 encodeToCommandBuffer:v6 convolutionGradientState:v7 convolutionWeights:self];
  }
  v9 = [(TCMPSConvolutionWeights *)self state];

  return v9;
}

- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4 sourceState:(id)a5
{
  v5 = -[TCMPSConvolutionWeights updateWithCommandBuffer:gradientState:](self, "updateWithCommandBuffer:gradientState:", a3, a4, a5);
  return v5;
}

- (void)set_cq:(id)a3
{
}

- (void)checkpointWithCommandQueue:(id)a3
{
  id v4 = [a3 commandBuffer];
  v3 = [v4 blitCommandEncoder];
  [v3 endEncoding];
  [v4 commit];
  [v4 waitUntilCompleted];
}

- (void)loadWeight:(float *)a3
{
  v5 = (void *)[(MTLBuffer *)self->weightVelocityBuffer contents];
  size_t var0 = self->_kernelParamsBinaryName.var0;
  memcpy(v5, a3, var0);
}

- (void)loadBias:(float *)a3
{
  v5 = (void *)[(MTLBuffer *)self->biasVelocityBuffer contents];
  size_t v6 = *(void *)&self->_kernelParamsBinaryName.__r_.var0;
  memcpy(v5, a3, v6);
}

- (id)label
{
  p_kernelParamsBinaryName = &self->_kernelParamsBinaryName;
  if (*((char *)&self->_kernelParamsBinaryName.__r_.__value_.var0.__l + 23) < 0) {
    p_kernelParamsBinaryName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_kernelParamsBinaryName->__r_.__value_.var0.__l.__data_;
  }
  return (id)[NSString stringWithUTF8String:p_kernelParamsBinaryName];
}

- (MPSCNNConvolutionWeightsAndBiasesState)state
{
  return (MPSCNNConvolutionWeightsAndBiasesState *)self->cq;
}

- (TCMPSConvolutionWeightsOptimizing)optimizer
{
  return *(TCMPSConvolutionWeightsOptimizing **)&self->_updateWeights;
}

- (MPSVector)weightMomentumVector
{
  return (MPSVector *)self->_state;
}

- (MPSVector)weightVelocityVector
{
  return (MPSVector *)self->_optimizer;
}

- (MPSVector)biasMomentumVector
{
  return self->_weightMomentumVector;
}

- (MPSVector)biasVelocityVector
{
  return self->_weightVelocityVector;
}

- (BOOL)updateWeights
{
  return (BOOL)self->biasBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightVelocityVector, 0);
  objc_storeStrong((id *)&self->_weightMomentumVector, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_updateWeights, 0);
  objc_storeStrong((id *)&self->cq, 0);
  objc_storeStrong((id *)&self->weightBuffer, 0);
  objc_storeStrong((id *)&self->biasVelocityBuffer, 0);
  objc_storeStrong((id *)&self->weightVelocityBuffer, 0);
  objc_storeStrong((id *)&self->biasMomentumBuffer, 0);
  objc_storeStrong((id *)&self->weightMomentumBuffer, 0);
  objc_storeStrong((id *)&self->_optimizerOptions.adamEpsilon, 0);
  objc_storeStrong((id *)&self->_optimizerOptions.adamBeta1, 0);
  if (*((char *)&self->_kernelParamsBinaryName.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_kernelParamsBinaryName.__r_.__value_.var0.__l.__data_);
  }
  objc_storeStrong((id *)&self->_convDesc, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0uLL;
  *((void *)self + 8) = 0;
  *((unsigned char *)self + 92) = 0;
  *((_OWORD *)self + 6) = xmmword_2246B8350;
  *((void *)self + 14) = 0x3F7FBE773F666666;
  *((_DWORD *)self + 30) = 841731191;
  return self;
}

@end