@interface TCMLComputeActivityClassifierDescriptor
- (BOOL)isComplete;
- (MLCTensor)inputTensor;
- (MLCTensor)outputTensor;
- (NSDictionary)weights;
- (id)addBatchNormLayerWithSource:(id)a3 graph:(id)a4;
- (id)addConvLayerWithOutputChannels:(unint64_t)a3 source:(id)a4 graph:(id)a5;
- (id)addDenseLayerWithIndex:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6;
- (id)addLSTMLayerWithInputSize:(unint64_t)a3 outputSize:(unint64_t)a4 source:(id)a5 graph:(id)a6;
- (unint64_t)outputChannels;
- (void)setInputTensor:(id)a3;
- (void)setOutputChannels:(unint64_t)a3;
- (void)setOutputTensor:(id)a3;
- (void)setWeights:(id)a3;
@end

@implementation TCMLComputeActivityClassifierDescriptor

- (BOOL)isComplete
{
  v3 = [(TCMLComputeActivityClassifierDescriptor *)self inputTensor];

  if (!v3) {
    return 0;
  }
  v4 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)addLSTMLayerWithInputSize:(unint64_t)a3 outputSize:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  v54[4] = *MEMORY[0x263EF8340];
  id v46 = a6;
  id v45 = a5;
  v10 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v50 = [v10 objectForKeyedSubscript:@"lstm_i2h_i_weight"];

  v11 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v49 = [v11 objectForKeyedSubscript:@"lstm_i2h_c_weight"];

  v12 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v48 = [v12 objectForKeyedSubscript:@"lstm_i2h_f_weight"];

  v13 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v47 = [v13 objectForKeyedSubscript:@"lstm_i2h_o_weight"];

  v54[0] = v50;
  v54[1] = v48;
  v54[2] = v49;
  v54[3] = v47;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:4];
  uint64_t v15 = [v14 mutableCopy];

  v16 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v44 = [v16 objectForKeyedSubscript:@"lstm_h2h_i_weight"];

  v17 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v43 = [v17 objectForKeyedSubscript:@"lstm_h2h_c_weight"];

  v18 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v42 = [v18 objectForKeyedSubscript:@"lstm_h2h_f_weight"];

  v19 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v41 = [v19 objectForKeyedSubscript:@"lstm_h2h_o_weight"];

  v53[0] = v44;
  v53[1] = v42;
  v53[2] = v43;
  v53[3] = v41;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];
  v21 = (void *)[v20 mutableCopy];

  v22 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v40 = [v22 objectForKeyedSubscript:@"lstm_h2h_i_bias"];

  v23 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v39 = [v23 objectForKeyedSubscript:@"lstm_h2h_c_bias"];

  v24 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v38 = [v24 objectForKeyedSubscript:@"lstm_h2h_f_bias"];

  v25 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v26 = [v25 objectForKeyedSubscript:@"lstm_h2h_o_bias"];

  v52[0] = v40;
  v52[1] = v38;
  v52[2] = v39;
  v52[3] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:4];
  v28 = (void *)[v27 mutableCopy];

  v29 = [MEMORY[0x263F105F8] descriptorWithInputSize:a3 hiddenSize:a4 layerCount:1 usesBiases:1 isBidirectional:0 dropout:0.0];
  v30 = [MEMORY[0x263F10588] descriptorWithType:3];
  v31 = [MEMORY[0x263F10588] descriptorWithType:5];
  v32 = (void *)MEMORY[0x263F10600];
  v51[0] = v30;
  v51[1] = v30;
  v51[2] = v31;
  v51[3] = v30;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:4];
  v34 = (void *)v15;
  v35 = [v32 layerWithDescriptor:v29 inputWeights:v15 hiddenWeights:v21 peepholeWeights:0 biases:v28 gateActivations:v33 outputResultActivation:v31];

  id v37 = [v46 nodeWithLayer:v35 source:v45];

  return v37;
}

- (id)addConvLayerWithOutputChannels:(unint64_t)a3 source:(id)a4 graph:(id)a5
{
  v36[2] = *MEMORY[0x263EF8340];
  id v34 = a5;
  id v33 = a4;
  v8 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v32 = [v8 objectForKeyedSubscript:@"conv_bias"];

  v9 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v10 = [v9 objectForKeyedSubscript:@"conv_weight"];

  v11 = [v10 descriptor];
  v12 = [v11 shape];
  v13 = [v12 objectAtIndexedSubscript:1];
  unint64_t v14 = [v13 unsignedIntegerValue] / a3;

  uint64_t v15 = [v10 descriptor];
  v16 = [v15 shape];
  v17 = [v16 objectAtIndexedSubscript:3];
  uint64_t v18 = [v17 unsignedIntegerValue];

  v19 = (void *)MEMORY[0x263F105B0];
  v36[0] = &unk_26D7965C0;
  v20 = [NSNumber numberWithUnsignedInteger:v18];
  v36[1] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  v35[0] = &unk_26D7965C0;
  v22 = [NSNumber numberWithUnsignedInteger:v18];
  v35[1] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  v24 = [v19 descriptorWithKernelSizes:v21 inputFeatureChannelCount:v14 outputFeatureChannelCount:a3 strides:v23 paddingPolicy:0 paddingSizes:&unk_26D796830];

  v25 = [MEMORY[0x263F105B8] layerWithWeights:v10 biases:v32 descriptor:v24];
  v26 = [v34 nodeWithLayer:v25 source:v33];

  v27 = (void *)MEMORY[0x263F10590];
  v28 = [MEMORY[0x263F10588] descriptorWithType:1 a:0.0];
  v29 = [v27 layerWithDescriptor:v28];

  v30 = [v34 nodeWithLayer:v29 source:v26];

  return v30;
}

- (id)addDenseLayerWithIndex:(unint64_t)a3 outputChannels:(unint64_t)a4 source:(id)a5 graph:(id)a6
{
  v10 = NSString;
  id v11 = a6;
  id v12 = a5;
  v26 = objc_msgSend(v10, "stringWithFormat:", @"dense%lu_bias", a3);
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"dense%lu_weight", a3);
  unint64_t v14 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  uint64_t v15 = [v14 objectForKeyedSubscript:v26];

  v16 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v17 = [v16 objectForKeyedSubscript:v13];

  uint64_t v18 = [v17 descriptor];
  v19 = [v18 shape];
  v20 = [v19 objectAtIndexedSubscript:1];
  unint64_t v21 = [v20 unsignedIntegerValue] / a4;

  v22 = [MEMORY[0x263F105B0] descriptorWithKernelSizes:&unk_26D796848 inputFeatureChannelCount:v21 outputFeatureChannelCount:a4 strides:&unk_26D796860 paddingPolicy:1 paddingSizes:&unk_26D796878];
  v23 = [MEMORY[0x263F105B8] layerWithWeights:v17 biases:v15 descriptor:v22];
  v24 = [v11 nodeWithLayer:v23 source:v12];

  return v24;
}

- (id)addBatchNormLayerWithSource:(id)a3 graph:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v9 = [v8 objectForKeyedSubscript:@"bn_running_mean"];

  v10 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  id v11 = [v10 objectForKeyedSubscript:@"bn_running_var"];

  id v12 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  v13 = [v12 objectForKeyedSubscript:@"bn_beta"];

  unint64_t v14 = [(TCMLComputeActivityClassifierDescriptor *)self weights];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"bn_gamma"];

  v16 = [v9 descriptor];
  v17 = [v16 shape];
  uint64_t v18 = [v17 objectAtIndexedSubscript:1];
  uint64_t v19 = [v18 unsignedIntegerValue];

  LODWORD(v20) = 925353388;
  LODWORD(v21) = 1063675494;
  v22 = [MEMORY[0x263F105A8] layerWithFeatureChannelCount:v19 mean:v9 variance:v11 beta:v13 gamma:v15 varianceEpsilon:v20 momentum:v21];
  v23 = [v6 nodeWithLayer:v22 source:v7];

  v24 = (void *)MEMORY[0x263F10590];
  v25 = [MEMORY[0x263F10588] descriptorWithType:1 a:0.0];
  v26 = [v24 layerWithDescriptor:v25];

  v27 = [v6 nodeWithLayer:v26 source:v23];

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

- (MLCTensor)outputTensor
{
  return self->_outputTensor;
}

- (void)setOutputTensor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTensor, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_inputTensor, 0);
}

@end