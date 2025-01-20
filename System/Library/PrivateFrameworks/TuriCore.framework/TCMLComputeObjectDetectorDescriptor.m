@interface TCMLComputeObjectDetectorDescriptor
- (BOOL)isComplete;
- (MLCTensor)inputTensor;
- (NSDictionary)weights;
- (id)addCommonLayersWithIndex:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6;
- (id)batchNormLayerForIndex:(unint64_t)a3;
- (id)convLayerForIndex:(unint64_t)a3 outputChannels:(unint64_t)a4;
- (unint64_t)outputChannels;
- (void)setInputTensor:(id)a3;
- (void)setOutputChannels:(unint64_t)a3;
- (void)setWeights:(id)a3;
@end

@implementation TCMLComputeObjectDetectorDescriptor

- (BOOL)isComplete
{
  v3 = [(TCMLComputeObjectDetectorDescriptor *)self inputTensor];

  if (!v3 || ![(TCMLComputeObjectDetectorDescriptor *)self outputChannels]) {
    return 0;
  }
  v4 = [(TCMLComputeObjectDetectorDescriptor *)self weights];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)convLayerForIndex:(unint64_t)a3 outputChannels:(unint64_t)a4
{
  v32[2] = *MEMORY[0x263EF8340];
  v31 = objc_msgSend(NSString, "stringWithFormat:", @"conv%lu_bias", a3);
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"conv%lu_weight", a3);
  v8 = [(TCMLComputeObjectDetectorDescriptor *)self weights];
  v9 = [v8 objectForKeyedSubscript:v31];

  v10 = [(TCMLComputeObjectDetectorDescriptor *)self weights];
  v11 = [v10 objectForKeyedSubscript:v7];

  v12 = [v11 descriptor];
  v13 = [v12 shape];
  v14 = [v13 objectAtIndexedSubscript:1];
  unint64_t v15 = [v14 unsignedIntegerValue] / a4;

  v16 = [v11 descriptor];
  v17 = [v16 shape];
  v18 = [v17 objectAtIndexedSubscript:2];
  uint64_t v19 = [v18 unsignedIntegerValue];

  v20 = [v11 descriptor];
  v21 = [v20 shape];
  v22 = [v21 objectAtIndexedSubscript:3];
  uint64_t v23 = [v22 unsignedIntegerValue];

  v24 = (void *)MEMORY[0x263F105B0];
  v25 = [NSNumber numberWithUnsignedInteger:v19];
  v32[0] = v25;
  v26 = [NSNumber numberWithUnsignedInteger:v23];
  v32[1] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  v28 = [v24 descriptorWithKernelSizes:v27 inputFeatureChannelCount:v15 outputFeatureChannelCount:a4 strides:&unk_26D796B90 paddingPolicy:0 paddingSizes:&unk_26D796BA8];

  v29 = [MEMORY[0x263F105B8] layerWithWeights:v11 biases:v9 descriptor:v28];

  return v29;
}

- (id)batchNormLayerForIndex:(unint64_t)a3
{
  v24 = objc_msgSend(NSString, "stringWithFormat:", @"batchnorm%lu_gamma", a3);
  uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"batchnorm%lu_beta", a3);
  BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"batchnorm%lu_running_var", a3);
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"batchnorm%lu_running_mean", a3);
  v7 = [(TCMLComputeObjectDetectorDescriptor *)self weights];
  v8 = [v7 objectForKeyedSubscript:v24];

  v9 = [(TCMLComputeObjectDetectorDescriptor *)self weights];
  v10 = [v9 objectForKeyedSubscript:v23];

  v11 = [(TCMLComputeObjectDetectorDescriptor *)self weights];
  v12 = [v11 objectForKeyedSubscript:v5];

  v13 = [(TCMLComputeObjectDetectorDescriptor *)self weights];
  v14 = [v13 objectForKeyedSubscript:v6];

  unint64_t v15 = [v14 descriptor];
  v16 = [v15 shape];
  v17 = [v16 objectAtIndexedSubscript:1];
  uint64_t v18 = [v17 unsignedIntegerValue];

  LODWORD(v19) = 925353388;
  LODWORD(v20) = 1063675494;
  v21 = [MEMORY[0x263F105A8] layerWithFeatureChannelCount:v18 mean:v14 variance:v12 beta:v10 gamma:v8 varianceEpsilon:v19 momentum:v20];

  return v21;
}

- (id)addCommonLayersWithIndex:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  v12 = [(TCMLComputeObjectDetectorDescriptor *)self convLayerForIndex:a3 outputChannels:a4];
  v13 = [v10 nodeWithLayer:v12 source:v11];

  v14 = [(TCMLComputeObjectDetectorDescriptor *)self batchNormLayerForIndex:a3];
  unint64_t v15 = [v10 nodeWithLayer:v14 source:v13];
  LODWORD(v16) = 1036831949;
  v17 = [MEMORY[0x263F10588] descriptorWithType:1 a:v16];
  uint64_t v18 = [MEMORY[0x263F10590] layerWithDescriptor:v17];
  double v19 = [v10 nodeWithLayer:v18 source:v15];
  double v20 = v19;
  if (a3 > 5)
  {
    id v27 = v19;
  }
  else
  {
    if (a3 == 5) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = 2;
    }
    v22 = [MEMORY[0x263F10628] poolingDescriptorWithType:1 kernelSize:2 stride:v21];
    [MEMORY[0x263F10630] layerWithDescriptor:v22];
    v29 = v15;
    uint64_t v23 = v14;
    v24 = v13;
    v26 = v25 = v12;
    id v27 = [v10 nodeWithLayer:v26 source:v20];

    v12 = v25;
    v13 = v24;
    v14 = v23;
    unint64_t v15 = v29;
  }
  return v27;
}

- (MLCTensor)inputTensor
{
  return self->_inputTensor;
}

- (void)setInputTensor:(id)a3
{
}

- (unint64_t)outputChannels
{
  return self->_outputChannels;
}

- (void)setOutputChannels:(unint64_t)a3
{
  self->_outputChannels = a3;
}

- (NSDictionary)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_inputTensor, 0);
}

@end