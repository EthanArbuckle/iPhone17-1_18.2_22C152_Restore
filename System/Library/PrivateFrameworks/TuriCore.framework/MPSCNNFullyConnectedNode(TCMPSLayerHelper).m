@interface MPSCNNFullyConnectedNode(TCMPSLayerHelper)
+ (id)createFullyConnected:()TCMPSLayerHelper inputFeatureChannels:outputFeatureChannels:inputHeight:inputWidth:weights:biases:label:updateWeights:device:cmdQueue:;
- (id)tc_weightsData;
- (void)setTc_weightsData:()TCMPSLayerHelper;
@end

@implementation MPSCNNFullyConnectedNode(TCMPSLayerHelper)

- (void)setTc_weightsData:()TCMPSLayerHelper
{
}

- (id)tc_weightsData
{
  return objc_getAssociatedObject(a1, &kWeightsKey);
}

+ (id)createFullyConnected:()TCMPSLayerHelper inputFeatureChannels:outputFeatureChannels:inputHeight:inputWidth:weights:biases:label:updateWeights:device:cmdQueue:
{
  id v30 = a3;
  id v32 = a8;
  id v31 = a9;
  id v33 = a10;
  id v15 = a12;
  id v16 = a13;
  v17 = [TCMPSConvolutionWeights alloc];
  id v18 = v33;
  uint64_t v19 = [v18 UTF8String];
  id v20 = v32;
  uint64_t v21 = [v20 bytes];
  id v22 = v31;
  v34[0] = 0;
  long long v35 = xmmword_2246B8350;
  uint64_t v36 = 0x3F7FBE773F666666;
  int v37 = 841731191;
  LOBYTE(v26) = a11;
  v23 = -[TCMPSConvolutionWeights initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:](v17, "initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:", a7, a6, a4, a5, 0, 1, 0.0, 0.0, 1, v19, v15, v16, v26, v21, [v22 bytes], v34);
  v24 = [MEMORY[0x263F13148] nodeWithSource:v30 weights:v23];
  objc_msgSend(v24, "setTc_weightsData:", v23);

  return v24;
}

@end