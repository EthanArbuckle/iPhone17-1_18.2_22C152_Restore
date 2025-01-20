@interface TCMPSVgg16Block1
- (MPSCNNConvolutionNode)conv1;
- (MPSCNNConvolutionNode)conv2;
- (MPSCNNNeuronReLUNode)relu1;
- (MPSCNNNeuronReLUNode)relu2;
- (MPSCNNPoolingAverageNode)pooling;
- (MPSNNImageNode)features;
- (MPSNNImageNode)output;
- (TCMPSVgg16Block1)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8;
- (id)backwardPass:(id)a3;
- (void)setConv1:(id)a3;
- (void)setConv2:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setLearningRate:(float)a3;
- (void)setOutput:(id)a3;
- (void)setPooling:(id)a3;
- (void)setRelu1:(id)a3;
- (void)setRelu2:(id)a3;
@end

@implementation TCMPSVgg16Block1

- (TCMPSVgg16Block1)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v101 = a3;
  id v97 = a4;
  id v99 = a5;
  id v98 = a6;
  id v14 = a7;
  id v100 = a8;
  v102.receiver = self;
  v102.super_class = (Class)TCMPSVgg16Block1;
  v15 = [(TCMPSVgg16Block1 *)&v102 init];
  if (v15)
  {
    v16 = (void *)MEMORY[0x263F13128];
    v94 = [v14 conv1];
    uint64_t v17 = [v94 kernelWidth];
    v91 = [v14 conv1];
    uint64_t v18 = [v91 kernelHeight];
    v89 = [v14 conv1];
    uint64_t v19 = [v89 inputFeatureChannels];
    v87 = [v14 conv1];
    uint64_t v77 = [v87 outputFeatureChannels];
    v85 = [v14 conv1];
    uint64_t v73 = [v85 strideWidth];
    v83 = [v14 conv1];
    uint64_t v69 = [v83 strideHeight];
    v81 = [v14 conv1];
    uint64_t v67 = [v81 paddingWidth];
    v79 = [v14 conv1];
    uint64_t v63 = [v79 paddingHeight];
    [NSString stringWithFormat:@"%@%@", v101, @"conv_1_weight"];
    v71 = uint64_t v61 = v19;
    v75 = [v100 objectForKeyedSubscript:v71];
    v65 = [NSString stringWithFormat:@"%@%@", v101, @"conv_1_bias"];
    v20 = [v100 objectForKeyedSubscript:v65];
    v21 = [v14 conv1];
    v22 = [v21 label];
    v23 = [v14 conv1];
    LOBYTE(v57) = [v23 updateWeights];
    uint64_t v24 = [v16 createConvolutional:v97 kernelWidth:v17 kernelHeight:v18 inputFeatureChannels:v61 outputFeatureChannels:v77 strideWidth:v73 strideHeight:v69 paddingWidth:v67 paddingHeight:v63 weights:v75 biases:v20 label:v22 updateWeights:v57 device:v99 cmdQueue:v98];
    conv1 = v15->_conv1;
    v15->_conv1 = (MPSCNNConvolutionNode *)v24;

    v26 = (void *)MEMORY[0x263F13190];
    v27 = [(MPSCNNConvolutionNode *)v15->_conv1 resultImage];
    uint64_t v28 = [v26 nodeWithSource:v27];
    relu1 = v15->_relu1;
    v15->_relu1 = (MPSCNNNeuronReLUNode *)v28;

    v30 = (void *)MEMORY[0x263F13128];
    v95 = [(MPSCNNNeuronReLUNode *)v15->_relu1 resultImage];
    v92 = [v14 conv2];
    uint64_t v31 = [v92 kernelWidth];
    v90 = [v14 conv2];
    uint64_t v32 = [v90 kernelHeight];
    v88 = [v14 conv2];
    uint64_t v78 = [v88 inputFeatureChannels];
    v86 = [v14 conv2];
    uint64_t v74 = [v86 outputFeatureChannels];
    v84 = [v14 conv2];
    uint64_t v70 = [v84 strideWidth];
    v82 = [v14 conv2];
    uint64_t v66 = [v82 strideHeight];
    v80 = [v14 conv2];
    uint64_t v64 = [v80 paddingWidth];
    v76 = [v14 conv2];
    uint64_t v60 = [v76 paddingHeight];
    [NSString stringWithFormat:@"%@%@", v101, @"conv_2_weight"];
    v68 = uint64_t v59 = v32;
    v72 = [v100 objectForKeyedSubscript:v68];
    v62 = [NSString stringWithFormat:@"%@%@", v101, @"conv_2_bias"];
    v33 = [v100 objectForKeyedSubscript:v62];
    v34 = [v14 conv2];
    v35 = [v34 label];
    v36 = [v14 conv2];
    LOBYTE(v58) = [v36 updateWeights];
    uint64_t v37 = [v30 createConvolutional:v95 kernelWidth:v31 kernelHeight:v59 inputFeatureChannels:v78 outputFeatureChannels:v74 strideWidth:v70 strideHeight:v66 paddingWidth:v64 paddingHeight:v60 weights:v72 biases:v33 label:v35 updateWeights:v58 device:v99 cmdQueue:v98];
    conv2 = v15->_conv2;
    v15->_conv2 = (MPSCNNConvolutionNode *)v37;

    v39 = (void *)MEMORY[0x263F13190];
    v40 = [(MPSCNNConvolutionNode *)v15->_conv2 resultImage];
    uint64_t v41 = [v39 nodeWithSource:v40];
    relu2 = v15->_relu2;
    v15->_relu2 = (MPSCNNNeuronReLUNode *)v41;

    id v93 = objc_alloc(MEMORY[0x263F131B0]);
    v96 = [(MPSCNNNeuronReLUNode *)v15->_relu2 resultImage];
    v43 = [v14 pooling];
    uint64_t v44 = [v43 kernelSize];
    v45 = [v14 pooling];
    uint64_t v46 = [v45 kernelSize];
    v47 = [v14 pooling];
    uint64_t v48 = [v47 strideSize];
    v49 = [v14 pooling];
    uint64_t v50 = objc_msgSend(v93, "initWithSource:kernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:", v96, v44, v46, v48, objc_msgSend(v49, "strideSize"));
    pooling = v15->_pooling;
    v15->_pooling = (MPSCNNPoolingAverageNode *)v50;

    uint64_t v52 = [(MPSCNNPoolingAverageNode *)v15->_pooling resultImage];
    output = v15->_output;
    v15->_output = (MPSNNImageNode *)v52;

    uint64_t v54 = [(MPSCNNNeuronReLUNode *)v15->_relu2 resultImage];
    features = v15->_features;
    v15->_features = (MPSNNImageNode *)v54;
  }
  return v15;
}

- (id)backwardPass:(id)a3
{
  v4 = [(MPSCNNPoolingAverageNode *)self->_pooling gradientFilterWithSource:a3];
  relu2 = self->_relu2;
  v6 = [v4 resultImage];
  v7 = [(MPSCNNNeuronReLUNode *)relu2 gradientFilterWithSource:v6];

  conv2 = self->_conv2;
  v9 = [v7 resultImage];
  v10 = [(MPSCNNConvolutionNode *)conv2 gradientFilterWithSource:v9];

  relu1 = self->_relu1;
  v12 = [v10 resultImage];
  v13 = [(MPSCNNNeuronReLUNode *)relu1 gradientFilterWithSource:v12];

  conv1 = self->_conv1;
  v15 = [v13 resultImage];
  v16 = [(MPSCNNConvolutionNode *)conv1 gradientFilterWithSource:v15];

  uint64_t v17 = [v16 resultImage];

  return v17;
}

- (void)setLearningRate:(float)a3
{
  id v7 = [(MPSCNNConvolutionNode *)self->_conv1 tc_weightsData];
  *(float *)&double v5 = a3;
  [v7 setLearningRate:v5];

  id v8 = [(MPSCNNConvolutionNode *)self->_conv2 tc_weightsData];
  *(float *)&double v6 = a3;
  [v8 setLearningRate:v6];
}

- (MPSNNImageNode)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (MPSNNImageNode)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (MPSCNNConvolutionNode)conv1
{
  return self->_conv1;
}

- (void)setConv1:(id)a3
{
}

- (MPSCNNNeuronReLUNode)relu1
{
  return self->_relu1;
}

- (void)setRelu1:(id)a3
{
}

- (MPSCNNConvolutionNode)conv2
{
  return self->_conv2;
}

- (void)setConv2:(id)a3
{
}

- (MPSCNNNeuronReLUNode)relu2
{
  return self->_relu2;
}

- (void)setRelu2:(id)a3
{
}

- (MPSCNNPoolingAverageNode)pooling
{
  return self->_pooling;
}

- (void)setPooling:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pooling, 0);
  objc_storeStrong((id *)&self->_relu2, 0);
  objc_storeStrong((id *)&self->_conv2, 0);
  objc_storeStrong((id *)&self->_relu1, 0);
  objc_storeStrong((id *)&self->_conv1, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

@end