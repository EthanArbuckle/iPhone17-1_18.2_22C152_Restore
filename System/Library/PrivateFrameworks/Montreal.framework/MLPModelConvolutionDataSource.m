@interface MLPModelConvolutionDataSource
- (BOOL)load;
- (MLPDeviceHandler)deviceHandler;
- (MLPModelConvolutionDataSource)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 stride:(unint64_t)a7 kernelParamsBinaryName:(id)a8 initialWeights:(const void *)a9 initialBias:(const void *)a10 deviceHandler:(id)a11 optimizerOptions:(MLPModelOptimizerOptions)a12;
- (MLPModelOptimizerOptions)optimizerOptions;
- (MPSCNNConvolutionDescriptor)convDesc;
- (MPSCNNConvolutionWeightsAndBiasesState)state;
- (MPSNNOptimizerAdam)optimizer;
- (MPSVector)biasMomentumVector;
- (MPSVector)biasVelocityVector;
- (MPSVector)weightMomentumVector;
- (MPSVector)weightVelocityVector;
- (MTLBuffer)biasBuffer;
- (MTLBuffer)weightBuffer;
- (NSData)weightsInWHIOOrder;
- (NSString)kernelParamsBinaryName;
- (const)initialBias;
- (const)initialWeights;
- (float)biasTerms;
- (id).cxx_construct;
- (id)descriptor;
- (id)label;
- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4;
- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4 sourceState:(id)a5;
- (unint64_t)inputFeatureChannels;
- (unint64_t)kernelHeight;
- (unint64_t)kernelWidth;
- (unint64_t)outputFeatureChannels;
- (unint64_t)sizeBias;
- (unint64_t)sizeWeights;
- (unsigned)dataType;
- (unsigned)seed;
- (void)bootstrapBias:(id *)a3 length:(unint64_t)a4 device:(id)a5 stdDev:(float)a6 values:(const void *)a7;
- (void)bootstrapBuffer:(id)a3 length:(unint64_t)a4 device:(id)a5 stdDev:(float)a6;
- (void)bootstrapWeights:(id *)a3 length:(unint64_t)a4 device:(id)a5 stdDev:(float)a6 values:(const void *)a7;
- (void)setInitialBias:(const void *)a3;
- (void)setInitialWeights:(const void *)a3;
- (void)weights;
@end

@implementation MLPModelConvolutionDataSource

- (MLPModelConvolutionDataSource)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 stride:(unint64_t)a7 kernelParamsBinaryName:(id)a8 initialWeights:(const void *)a9 initialBias:(const void *)a10 deviceHandler:(id)a11 optimizerOptions:(MLPModelOptimizerOptions)a12
{
  id v19 = a8;
  id v113 = a11;
  v114.receiver = self;
  v114.super_class = (Class)MLPModelConvolutionDataSource;
  v20 = [(MLPModelConvolutionDataSource *)&v114 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deviceHandler, a11);
    v21->_optimizerOptions = *v115;
    v21->_unint64_t outputFeatureChannels = a6;
    v21->_inputFeatureChannels = a5;
    v21->_kernelHeight = a4;
    v21->_kernelWidth = a3;
    objc_storeStrong((id *)&v21->_kernelParamsBinaryName, a8);
    v21->_initialWeights = a9;
    v21->_initialBias = a10;
    uint64_t v23 = objc_msgSend_cnnConvolutionDescriptorWithKernelWidth_kernelHeight_inputFeatureChannels_outputFeatureChannels_(MEMORY[0x1E4F353F0], v22, a3, a4, a5, a6);
    convDesc = v21->_convDesc;
    v21->_convDesc = (MPSCNNConvolutionDescriptor *)v23;

    objc_msgSend_setStrideInPixelsX_(v21->_convDesc, v25, a7, v26);
    objc_msgSend_setStrideInPixelsY_(v21->_convDesc, v27, 1, v28);
    unint64_t outputFeatureChannels = v21->_outputFeatureChannels;
    unint64_t v30 = v21->_inputFeatureChannels * outputFeatureChannels * v21->_kernelHeight * v21->_kernelWidth;
    v21->_uint64_t sizeBias = outputFeatureChannels;
    v21->_uint64_t sizeWeights = v30;
    *(float *)&double v31 = v21->_optimizerOptions.learningRate;
    LODWORD(v32) = 925353388;
    LODWORD(v33) = 1.0;
    id v36 = (id)objc_msgSend_optimizerDescriptorWithLearningRate_gradientRescale_regularizationType_regularizationScale_(MEMORY[0x1E4F35940], v34, 0, v35, v31, v33, v32);
    id v37 = objc_alloc(MEMORY[0x1E4F35938]);
    v41 = objc_msgSend_deviceHandler(v21, v38, v39, v40);
    v45 = objc_msgSend_device(v41, v42, v43, v44);
    *(float *)&double v46 = v21->_optimizerOptions.adamEpsilon;
    uint64_t v48 = objc_msgSend_initWithDevice_beta1_beta2_epsilon_timeStep_optimizerDescriptor_(v37, v47, (uint64_t)v45, 0, v36, v21->_optimizerOptions.adamBeta1, v21->_optimizerOptions.adamBeta2, v46);
    optimizer = v21->_optimizer;
    v21->_optimizer = (MPSNNOptimizerAdam *)v48;

    uint64_t sizeWeights = v21->_sizeWeights;
    v54 = objc_msgSend_deviceHandler(v21, v51, v52, v53);
    v58 = objc_msgSend_device(v54, v55, v56, v57);
    uint64_t v62 = objc_msgSend_initialWeights(v21, v59, v60, v61);
    LODWORD(v63) = 1017370378;
    objc_msgSend_bootstrapWeights_length_device_stdDev_values_(v21, v64, (uint64_t)&v21->_weightBuffer, sizeWeights, v58, v62, v63);

    uint64_t sizeBias = v21->_sizeBias;
    v69 = objc_msgSend_deviceHandler(v21, v66, v67, v68);
    v73 = objc_msgSend_device(v69, v70, v71, v72);
    uint64_t v77 = objc_msgSend_initialBias(v21, v74, v75, v76);
    objc_msgSend_bootstrapBias_length_device_stdDev_values_(v21, v78, (uint64_t)&v21->_biasBuffer, sizeBias, v73, v77, 0.0);

    id v79 = objc_alloc(MEMORY[0x1E4F35418]);
    uint64_t v81 = objc_msgSend_initWithWeights_biases_(v79, v80, (uint64_t)v21->_weightBuffer, (uint64_t)v21->_biasBuffer);
    state = v21->_state;
    v21->_state = (MPSCNNConvolutionWeightsAndBiasesState *)v81;

    v86 = objc_msgSend_deviceHandler(v21, v83, v84, v85);
    uint64_t v88 = objc_msgSend_biasVectorWithLength_stdDev_values_(v86, v87, v21->_sizeWeights, 0, 0.0);
    weightMomentumVector = v21->_weightMomentumVector;
    v21->_weightMomentumVector = (MPSVector *)v88;

    v93 = objc_msgSend_deviceHandler(v21, v90, v91, v92);
    uint64_t v95 = objc_msgSend_biasVectorWithLength_stdDev_values_(v93, v94, v21->_sizeWeights, 0, 0.0);
    weightVelocityVector = v21->_weightVelocityVector;
    v21->_weightVelocityVector = (MPSVector *)v95;

    v100 = objc_msgSend_deviceHandler(v21, v97, v98, v99);
    uint64_t v102 = objc_msgSend_biasVectorWithLength_stdDev_values_(v100, v101, v21->_sizeBias, 0, 0.0);
    biasMomentumVector = v21->_biasMomentumVector;
    v21->_biasMomentumVector = (MPSVector *)v102;

    v107 = objc_msgSend_deviceHandler(v21, v104, v105, v106);
    uint64_t v109 = objc_msgSend_biasVectorWithLength_stdDev_values_(v107, v108, v21->_sizeBias, 0, 0.0);
    biasVelocityVector = v21->_biasVelocityVector;
    v21->_biasVelocityVector = (MPSVector *)v109;

    v111 = v21;
  }

  return v21;
}

- (unsigned)dataType
{
  return 268435488;
}

- (id)descriptor
{
  return self->_convDesc;
}

- (void)weights
{
  objc_msgSend_weightBuffer(self, a2, v2, v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_contents(v4, v5, v6, v7);

  return v8;
}

- (void)bootstrapBuffer:(id)a3 length:(unint64_t)a4 device:(id)a5 stdDev:(float)a6
{
  id v9 = a3;
  v16 = (float *)objc_msgSend_contents(v9, v10, v11, v12);
  if (a6 <= 0.0)
  {
    size_t v19 = objc_msgSend_length(v9, v13, v14, v15);
    bzero(v16, v19);
  }
  else
  {
    LODWORD(v20) = 0;
    *((float *)&v20 + 1) = a6;
    for (char i = 0; a4; --a4)
    {
      v17 = objc_msgSend_deviceHandler(self, v13, v14, v15, v20);
      float v18 = sub_19E238C94((uint64_t)&v20, (uint64_t)v17 + 8, (float *)&v20);

      *v16++ = v18;
    }
  }
}

- (void)bootstrapWeights:(id *)a3 length:(unint64_t)a4 device:(id)a5 stdDev:(float)a6 values:(const void *)a7
{
  id v36 = a5;
  v13 = objc_msgSend_newBufferWithLength_options_(v36, v12, 4 * a4, 0);
  id v14 = *a3;
  *a3 = v13;

  id v15 = *a3;
  uint64_t v19 = objc_msgSend_contents(v15, v16, v17, v18);
  if (a7)
  {
    unint64_t outputFeatureChannels = self->_outputFeatureChannels;
    if (outputFeatureChannels)
    {
      unint64_t kernelHeight = self->_kernelHeight;
      if (kernelHeight)
      {
        unint64_t kernelWidth = self->_kernelWidth;
        if (kernelWidth)
        {
          unint64_t inputFeatureChannels = self->_inputFeatureChannels;
          if (inputFeatureChannels)
          {
            for (uint64_t i = 0; i != outputFeatureChannels; ++i)
            {
              uint64_t v27 = 0;
              uint64_t v28 = (char *)a7;
              uint64_t v29 = v19;
              do
              {
                uint64_t v30 = 0;
                double v31 = v28;
                double v32 = (_DWORD *)v29;
                do
                {
                  double v33 = v31;
                  v34 = v32;
                  unint64_t v35 = inputFeatureChannels;
                  do
                  {
                    *v34++ = *v33;
                    v33 += kernelHeight * kernelWidth;
                    --v35;
                  }
                  while (v35);
                  ++v30;
                  v32 += inputFeatureChannels;
                  ++v31;
                }
                while (v30 != kernelWidth);
                ++v27;
                v29 += 4 * kernelWidth * inputFeatureChannels;
                v28 += 4 * kernelWidth;
              }
              while (v27 != kernelHeight);
              v19 += 4 * kernelHeight * kernelWidth * inputFeatureChannels;
              a7 = (char *)a7 + 4 * inputFeatureChannels * kernelHeight * kernelWidth;
            }
          }
        }
      }
    }
  }
  else
  {
    *(float *)&double v21 = a6;
    objc_msgSend_bootstrapBuffer_length_device_stdDev_(self, v20, (uint64_t)*a3, a4, v36, v21);
  }
}

- (void)bootstrapBias:(id *)a3 length:(unint64_t)a4 device:(id)a5 stdDev:(float)a6 values:(const void *)a7
{
  id v26 = a5;
  v13 = objc_msgSend_newBufferWithLength_options_(v26, v12, 4 * a4, 0);
  id v14 = *a3;
  *a3 = v13;

  id v15 = *a3;
  uint64_t v19 = objc_msgSend_contents(v15, v16, v17, v18);
  id v23 = *a3;
  if (a7)
  {
    v24 = (void *)v19;
    size_t v25 = objc_msgSend_length(*a3, v20, (uint64_t)v23, v21);
    memcpy(v24, a7, v25);
  }
  else
  {
    *(float *)&double v22 = a6;
    objc_msgSend_bootstrapBuffer_length_device_stdDev_(self, v20, (uint64_t)v23, a4, v26, v22);
  }
}

- (NSData)weightsInWHIOOrder
{
  unint64_t v5 = objc_msgSend_sizeWeights(self, a2, v2, v3);
  unint64_t v9 = v5;
  if (v5)
  {
    if (v5 >> 62) {
      sub_19E13D694();
    }
    size_t v10 = 4 * v5;
    uint64_t v11 = (char *)operator new(4 * v5);
    unint64_t v9 = (unint64_t)&v11[4 * v9];
    bzero(v11, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }
  objc_msgSend_load(self, v6, v7, v8);
  uint64_t v15 = objc_msgSend_weights(self, v12, v13, v14);
  unint64_t outputFeatureChannels = self->_outputFeatureChannels;
  if (outputFeatureChannels)
  {
    unint64_t kernelHeight = self->_kernelHeight;
    if (kernelHeight)
    {
      unint64_t kernelWidth = self->_kernelWidth;
      if (kernelWidth)
      {
        unint64_t inputFeatureChannels = self->_inputFeatureChannels;
        if (inputFeatureChannels)
        {
          uint64_t v21 = 0;
          v16 = (const char *)(4 * inputFeatureChannels);
          double v22 = v11;
          do
          {
            uint64_t v23 = 0;
            uint64_t v24 = v15;
            size_t v25 = v22;
            do
            {
              uint64_t v26 = 0;
              uint64_t v27 = v24;
              uint64_t v28 = v25;
              do
              {
                uint64_t v29 = (int *)v27;
                uint64_t v30 = v28;
                unint64_t v31 = inputFeatureChannels;
                do
                {
                  int v32 = *v29++;
                  *uint64_t v30 = v32;
                  v30 += kernelHeight * kernelWidth;
                  --v31;
                }
                while (v31);
                ++v26;
                ++v28;
                v27 += (uint64_t)v16;
              }
              while (v26 != kernelWidth);
              ++v23;
              v25 += kernelWidth;
              v24 += 4 * kernelWidth * inputFeatureChannels;
            }
            while (v23 != kernelHeight);
            ++v21;
            v22 += 4 * inputFeatureChannels * kernelHeight * kernelWidth;
            v15 += 4 * kernelHeight * kernelWidth * inputFeatureChannels;
          }
          while (v21 != outputFeatureChannels);
        }
      }
    }
  }
  double v33 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v16, (uint64_t)v11, v9 - (void)v11);
  if (v11) {
    operator delete(v11);
  }

  return (NSData *)v33;
}

- (float)biasTerms
{
  objc_msgSend_biasBuffer(self, a2, v2, v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (float *)objc_msgSend_contents(v4, v5, v6, v7);

  return v8;
}

- (BOOL)load
{
  unint64_t v5 = objc_msgSend_deviceHandler(self, a2, v2, v3);
  unint64_t v9 = objc_msgSend_commandQueue(v5, v6, v7, v8);
  objc_msgSend_checkpointWithCommandQueue_(self, v10, (uint64_t)v9, v11);

  return 1;
}

- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v45 = a4;
  unint64_t v9 = objc_msgSend_optimizer(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_state(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_weightMomentumVector(self, v14, v15, v16);
  v47[0] = v17;
  uint64_t v21 = objc_msgSend_biasMomentumVector(self, v18, v19, v20);
  v47[1] = v21;
  uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v47, 2);
  uint64_t v27 = objc_msgSend_weightVelocityVector(self, v24, v25, v26);
  v46[0] = v27;
  unint64_t v31 = objc_msgSend_biasVelocityVector(self, v28, v29, v30);
  v46[1] = v31;
  double v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v32, (uint64_t)v46, 2);
  id v37 = objc_msgSend_state(self, v34, v35, v36);
  objc_msgSend_encodeToCommandBuffer_convolutionGradientState_convolutionSourceState_inputMomentumVectors_inputVelocityVectors_resultState_(v9, v38, (uint64_t)v44, (uint64_t)v45, v13, v23, v33, v37);

  v42 = objc_msgSend_state(self, v39, v40, v41);

  return v42;
}

- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4 sourceState:(id)a5
{
  unint64_t v5 = objc_msgSend_updateWithCommandBuffer_gradientState_(self, a2, (uint64_t)a3, (uint64_t)a4, a5);

  return v5;
}

- (id)label
{
  return (id)((uint64_t (*)(MLPModelConvolutionDataSource *, char *))MEMORY[0x1F4181798])(self, sel_kernelParamsBinaryName);
}

- (unint64_t)outputFeatureChannels
{
  return self->_outputFeatureChannels;
}

- (unint64_t)inputFeatureChannels
{
  return self->_inputFeatureChannels;
}

- (unint64_t)kernelHeight
{
  return self->_kernelHeight;
}

- (unint64_t)kernelWidth
{
  return self->_kernelWidth;
}

- (MPSCNNConvolutionDescriptor)convDesc
{
  return (MPSCNNConvolutionDescriptor *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)kernelParamsBinaryName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)sizeBias
{
  return self->_sizeBias;
}

- (unint64_t)sizeWeights
{
  return self->_sizeWeights;
}

- (unsigned)seed
{
  return self->_seed;
}

- (MLPModelOptimizerOptions)optimizerOptions
{
  objc_copyCppObjectAtomic(v2, &self->_optimizerOptions, (void (__cdecl *)(void *, const void *))sub_19E30F6BC);
  result.learningRate = v6;
  result.adamEpsilon = v5;
  result.adamBeta2 = v4;
  result.adamBeta1 = v3;
  return result;
}

- (MTLBuffer)weightBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 80, 1);
}

- (MTLBuffer)biasBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 88, 1);
}

- (MLPDeviceHandler)deviceHandler
{
  return (MLPDeviceHandler *)objc_getProperty(self, a2, 96, 1);
}

- (const)initialWeights
{
  return self->_initialWeights;
}

- (void)setInitialWeights:(const void *)a3
{
  self->_initialWeights = a3;
}

- (const)initialBias
{
  return self->_initialBias;
}

- (void)setInitialBias:(const void *)a3
{
  self->_initialBias = a3;
}

- (MPSCNNConvolutionWeightsAndBiasesState)state
{
  return self->_state;
}

- (MPSNNOptimizerAdam)optimizer
{
  return self->_optimizer;
}

- (MPSVector)weightMomentumVector
{
  return self->_weightMomentumVector;
}

- (MPSVector)weightVelocityVector
{
  return self->_weightVelocityVector;
}

- (MPSVector)biasMomentumVector
{
  return self->_biasMomentumVector;
}

- (MPSVector)biasVelocityVector
{
  return self->_biasVelocityVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasVelocityVector, 0);
  objc_storeStrong((id *)&self->_biasMomentumVector, 0);
  objc_storeStrong((id *)&self->_weightVelocityVector, 0);
  objc_storeStrong((id *)&self->_weightMomentumVector, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_deviceHandler, 0);
  objc_storeStrong((id *)&self->_biasBuffer, 0);
  objc_storeStrong((id *)&self->_weightBuffer, 0);
  objc_storeStrong((id *)&self->_kernelParamsBinaryName, 0);

  objc_storeStrong((id *)&self->_convDesc, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 168) = xmmword_19E354D00;
  return self;
}

@end