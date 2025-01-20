@interface MPSCNNConvolutionNode(TCMPSLayerHelper)
+ (id)createConvolutional:()TCMPSLayerHelper kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:;
- (id)tc_weightsData;
- (void)setTc_weightsData:()TCMPSLayerHelper;
@end

@implementation MPSCNNConvolutionNode(TCMPSLayerHelper)

- (void)setTc_weightsData:()TCMPSLayerHelper
{
}

- (id)tc_weightsData
{
  return objc_getAssociatedObject(a1, &kWeightsKey);
}

+ (id)createConvolutional:()TCMPSLayerHelper kernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:strideWidth:strideHeight:paddingWidth:paddingHeight:weights:biases:label:updateWeights:device:cmdQueue:
{
  id v34 = a3;
  id v36 = a12;
  id v35 = a13;
  id v37 = a14;
  id v38 = a16;
  id v18 = a17;
  v19 = [TCMPSConvolutionWeights alloc];
  id v20 = v37;
  uint64_t v21 = [v20 UTF8String];
  id v22 = v36;
  uint64_t v23 = [v22 bytes];
  id v24 = v35;
  v39[0] = 0;
  long long v40 = xmmword_2246B8350;
  uint64_t v41 = 0x3F7FBE773F666666;
  int v42 = 841731191;
  LOBYTE(v29) = a15;
  v25 = -[TCMPSConvolutionWeights initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:](v19, "initWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:neuronType:strideX:strideY:neuronA:neuronB:kernelParamsBinaryName:device:cmd_queue:updateWeights:init_weight_ptr:init_bias_ptr:optimizerOptions:", a4, a5, a6, a7, 0, a8, 0.0, 0.0, a9, v21, v38, v18, v29, v23, [v24 bytes], v39);
  v26 = [MEMORY[0x263F13128] nodeWithSource:v34 weights:v25];
  v27 = [[TCMPSConvolutionPadding alloc] initWithParams:a10 paddingHeight:a11 strideWidth:a8 strideHeight:a9];
  [v26 setPaddingPolicy:v27];
  objc_msgSend(v26, "setTc_weightsData:", v25);

  return v26;
}

@end