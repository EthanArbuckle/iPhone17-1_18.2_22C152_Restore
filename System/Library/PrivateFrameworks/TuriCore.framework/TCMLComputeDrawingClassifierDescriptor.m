@interface TCMLComputeDrawingClassifierDescriptor
- (BOOL)isComplete;
- (MLCTensor)inputTensor;
- (MLCTensor)outputTensor;
- (NSDictionary)weights;
- (id)addConvLayer:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6;
- (id)addDenseLayer:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6;
- (unint64_t)outputChannels;
- (void)setInputTensor:(id)a3;
- (void)setOutputChannels:(unint64_t)a3;
- (void)setOutputTensor:(id)a3;
- (void)setWeights:(id)a3;
@end

@implementation TCMLComputeDrawingClassifierDescriptor

- (BOOL)isComplete
{
  v3 = [(TCMLComputeDrawingClassifierDescriptor *)self inputTensor];

  return v3 && [(TCMLComputeDrawingClassifierDescriptor *)self outputChannels] != 0;
}

- (id)addConvLayer:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  v46[2] = *MEMORY[0x263EF8340];
  v10 = NSString;
  id v43 = a6;
  id v11 = a5;
  v45 = objc_msgSend(v10, "stringWithFormat:", @"drawing_conv%lu_bias", a3);
  v44 = objc_msgSend(NSString, "stringWithFormat:", @"drawing_conv%lu_weight", a3);
  v12 = [(TCMLComputeDrawingClassifierDescriptor *)self weights];
  v42 = [v12 objectForKeyedSubscript:v45];

  v13 = [(TCMLComputeDrawingClassifierDescriptor *)self weights];
  v14 = [v13 objectForKeyedSubscript:v44];

  v15 = [v14 descriptor];
  v16 = [v15 shape];
  v17 = [v16 objectAtIndexedSubscript:1];
  unint64_t v18 = [v17 unsignedIntegerValue] / a4;

  v19 = [v14 descriptor];
  v20 = [v19 shape];
  v21 = [v20 objectAtIndexedSubscript:2];
  uint64_t v22 = [v21 unsignedIntegerValue];

  v23 = [v14 descriptor];
  v24 = [v23 shape];
  v25 = [v24 objectAtIndexedSubscript:3];
  uint64_t v26 = [v25 unsignedIntegerValue];

  v27 = (void *)MEMORY[0x263F105B0];
  v28 = [NSNumber numberWithUnsignedInteger:v22];
  v46[0] = v28;
  v29 = [NSNumber numberWithUnsignedInteger:v26];
  v46[1] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
  v31 = [v27 descriptorWithKernelSizes:v30 inputFeatureChannelCount:v18 outputFeatureChannelCount:a4 strides:&unk_26D796890 paddingPolicy:0 paddingSizes:0];

  v32 = [MEMORY[0x263F105B8] layerWithWeights:v14 biases:v42 descriptor:v31];
  v33 = [v43 nodeWithLayer:v32 source:v11];

  v34 = (void *)MEMORY[0x263F10590];
  v35 = [MEMORY[0x263F10588] descriptorWithType:1 a:0.0];
  v36 = [v34 layerWithDescriptor:v35];

  v37 = [v43 nodeWithLayer:v36 source:v33];
  v38 = [MEMORY[0x263F10628] maxPoolingDescriptorWithKernelSizes:&unk_26D7968A8 strides:&unk_26D7968C0 paddingPolicy:1 paddingSizes:0];
  v39 = [MEMORY[0x263F10630] layerWithDescriptor:v38];
  v40 = [v43 nodeWithLayer:v39 source:v37];

  return v40;
}

- (id)addDenseLayer:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  v10 = NSString;
  id v11 = a6;
  id v12 = a5;
  uint64_t v26 = objc_msgSend(v10, "stringWithFormat:", @"drawing_dense%lu_bias", a3);
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"drawing_dense%lu_weight", a3);
  v14 = [(TCMLComputeDrawingClassifierDescriptor *)self weights];
  v15 = [v14 objectForKeyedSubscript:v26];

  v16 = [(TCMLComputeDrawingClassifierDescriptor *)self weights];
  v17 = [v16 objectForKeyedSubscript:v13];

  unint64_t v18 = [v17 descriptor];
  v19 = [v18 shape];
  v20 = [v19 objectAtIndexedSubscript:1];
  unint64_t v21 = [v20 unsignedIntegerValue] / a4;

  uint64_t v22 = [MEMORY[0x263F105B0] descriptorWithKernelSizes:&unk_26D7968D8 inputFeatureChannelCount:v21 outputFeatureChannelCount:a4 strides:&unk_26D7968F0 paddingPolicy:0 paddingSizes:0];
  v23 = [MEMORY[0x263F105D0] layerWithWeights:v17 biases:v15 descriptor:v22];
  v24 = [v11 nodeWithLayer:v23 source:v12];

  return v24;
}

- (MLCTensor)inputTensor
{
  return self->_inputTensor;
}

- (void)setInputTensor:(id)a3
{
}

- (MLCTensor)outputTensor
{
  return self->_outputTensor;
}

- (void)setOutputTensor:(id)a3
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
  objc_storeStrong((id *)&self->_outputTensor, 0);
  objc_storeStrong((id *)&self->_inputTensor, 0);
}

@end