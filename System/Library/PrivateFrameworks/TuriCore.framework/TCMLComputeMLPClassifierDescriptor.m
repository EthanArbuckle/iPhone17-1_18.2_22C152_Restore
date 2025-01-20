@interface TCMLComputeMLPClassifierDescriptor
- (BOOL)isComplete;
- (MLCTensor)fcFinalTensor;
- (MLCTensor)inputTensor;
- (NSArray)layerSizes;
- (NSDictionary)tensors;
- (id)addFullyConnectedLayerWithIndex:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6;
- (id)fullyConnectedLayerForIndex:(unint64_t)a3 outputChannels:(unint64_t)a4;
- (unint64_t)outputChannels;
- (void)setFcFinalTensor:(id)a3;
- (void)setInputTensor:(id)a3;
- (void)setLayerSizes:(id)a3;
- (void)setOutputChannels:(unint64_t)a3;
- (void)setTensors:(id)a3;
@end

@implementation TCMLComputeMLPClassifierDescriptor

- (BOOL)isComplete
{
  v3 = [(TCMLComputeMLPClassifierDescriptor *)self inputTensor];

  if (!v3 || ![(TCMLComputeMLPClassifierDescriptor *)self outputChannels]) {
    return 0;
  }
  v4 = [(TCMLComputeMLPClassifierDescriptor *)self layerSizes];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)fullyConnectedLayerForIndex:(unint64_t)a3 outputChannels:(unint64_t)a4
{
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"fc%lu_bias", a3);
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"fc%lu_weight", a3);
  v9 = [(TCMLComputeMLPClassifierDescriptor *)self tensors];
  v10 = [v9 objectForKeyedSubscript:v7];

  v11 = [(TCMLComputeMLPClassifierDescriptor *)self tensors];
  v12 = [v11 objectForKeyedSubscript:v8];

  v13 = [v12 descriptor];
  v14 = [v13 shape];
  v15 = [v14 objectAtIndexedSubscript:1];
  unint64_t v16 = [v15 unsignedIntegerValue] / a4;

  v17 = [MEMORY[0x263F105B0] descriptorWithKernelWidth:1 kernelHeight:1 inputFeatureChannelCount:v16 outputFeatureChannelCount:a4];
  v18 = [MEMORY[0x263F105D0] layerWithWeights:v12 biases:v10 descriptor:v17];

  return v18;
}

- (id)addFullyConnectedLayerWithIndex:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  v12 = [(TCMLComputeMLPClassifierDescriptor *)self fullyConnectedLayerForIndex:a3 outputChannels:a4];
  v13 = [v10 nodeWithLayer:v12 source:v11];

  v14 = [MEMORY[0x263F10588] descriptorWithType:1 a:0.0];
  v15 = [MEMORY[0x263F10590] layerWithDescriptor:v14];
  unint64_t v16 = [v10 nodeWithLayer:v15 source:v13];

  return v16;
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

- (NSArray)layerSizes
{
  return self->_layerSizes;
}

- (void)setLayerSizes:(id)a3
{
}

- (NSDictionary)tensors
{
  return self->_tensors;
}

- (void)setTensors:(id)a3
{
}

- (MLCTensor)fcFinalTensor
{
  return self->_fcFinalTensor;
}

- (void)setFcFinalTensor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fcFinalTensor, 0);
  objc_storeStrong((id *)&self->_tensors, 0);
  objc_storeStrong((id *)&self->_layerSizes, 0);
  objc_storeStrong((id *)&self->_inputTensor, 0);
}

@end