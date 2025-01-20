@interface TCMPSVgg16Block2
- (MPSCNNConvolutionNode)conv1;
- (MPSCNNConvolutionNode)conv2;
- (MPSCNNConvolutionNode)conv3;
- (MPSCNNNeuronReLUNode)relu1;
- (MPSCNNNeuronReLUNode)relu2;
- (MPSCNNNeuronReLUNode)relu3;
- (MPSCNNPoolingAverageNode)pooling;
- (MPSNNImageNode)features;
- (MPSNNImageNode)output;
- (TCMPSVgg16Block2)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8;
- (id)backwardPass:(id)a3;
- (void)setConv1:(id)a3;
- (void)setConv2:(id)a3;
- (void)setConv3:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setLearningRate:(float)a3;
- (void)setOutput:(id)a3;
- (void)setPooling:(id)a3;
- (void)setRelu1:(id)a3;
- (void)setRelu2:(id)a3;
- (void)setRelu3:(id)a3;
@end

@implementation TCMPSVgg16Block2

- (TCMPSVgg16Block2)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v133 = a3;
  id v129 = a4;
  id v131 = a5;
  id v130 = a6;
  id v14 = a7;
  id v132 = a8;
  v134.receiver = self;
  v134.super_class = (Class)TCMPSVgg16Block2;
  v15 = [(TCMPSVgg16Block2 *)&v134 init];
  if (v15)
  {
    v16 = (void *)MEMORY[0x263F13128];
    v125 = [v14 conv1];
    uint64_t v17 = [v125 kernelWidth];
    v121 = [v14 conv1];
    uint64_t v18 = [v121 kernelHeight];
    v118 = [v14 conv1];
    uint64_t v19 = [v118 inputFeatureChannels];
    v115 = [v14 conv1];
    uint64_t v100 = [v115 outputFeatureChannels];
    v112 = [v14 conv1];
    uint64_t v94 = [v112 strideWidth];
    v109 = [v14 conv1];
    uint64_t v88 = [v109 strideHeight];
    v106 = [v14 conv1];
    uint64_t v85 = [v106 paddingWidth];
    v103 = [v14 conv1];
    uint64_t v79 = [v103 paddingHeight];
    v91 = [NSString stringWithFormat:@"%@%@", v133, @"conv_1_weight"];
    v97 = [v132 objectForKeyedSubscript:v91];
    v82 = [NSString stringWithFormat:@"%@%@", v133, @"conv_1_bias"];
    v20 = [v132 objectForKeyedSubscript:v82];
    v21 = [v14 conv1];
    v22 = [v21 label];
    v23 = [v14 conv1];
    LOBYTE(v70) = [v23 updateWeights];
    uint64_t v24 = [v16 createConvolutional:v129 kernelWidth:v17 kernelHeight:v18 inputFeatureChannels:v19 outputFeatureChannels:v100 strideWidth:v94 strideHeight:v88 paddingWidth:v85 paddingHeight:v79 weights:v97 biases:v20 label:v22 updateWeights:v70 device:v131 cmdQueue:v130];
    conv1 = v15->_conv1;
    v15->_conv1 = (MPSCNNConvolutionNode *)v24;

    v26 = (void *)MEMORY[0x263F13190];
    v27 = [(MPSCNNConvolutionNode *)v15->_conv1 resultImage];
    uint64_t v28 = [v26 nodeWithSource:v27];
    relu1 = v15->_relu1;
    v15->_relu1 = (MPSCNNNeuronReLUNode *)v28;

    v30 = (void *)MEMORY[0x263F13128];
    v126 = [(MPSCNNNeuronReLUNode *)v15->_relu1 resultImage];
    v122 = [v14 conv2];
    uint64_t v31 = [v122 kernelWidth];
    v119 = [v14 conv2];
    uint64_t v32 = [v119 kernelHeight];
    v116 = [v14 conv2];
    uint64_t v101 = [v116 inputFeatureChannels];
    v113 = [v14 conv2];
    uint64_t v95 = [v113 outputFeatureChannels];
    v110 = [v14 conv2];
    uint64_t v89 = [v110 strideWidth];
    v107 = [v14 conv2];
    uint64_t v83 = [v107 strideHeight];
    v104 = [v14 conv2];
    uint64_t v80 = [v104 paddingWidth];
    v98 = [v14 conv2];
    uint64_t v75 = [v98 paddingHeight];
    [NSString stringWithFormat:@"%@%@", v133, @"conv_2_weights"];
    v86 = uint64_t v73 = v32;
    v92 = [v132 objectForKeyedSubscript:v86];
    v77 = [NSString stringWithFormat:@"%@%@", v133, @"conv_2_biases"];
    v33 = [v132 objectForKeyedSubscript:v77];
    v34 = [v14 conv2];
    v35 = [v34 label];
    v36 = [v14 conv2];
    LOBYTE(v71) = [v36 updateWeights];
    uint64_t v37 = [v30 createConvolutional:v126 kernelWidth:v31 kernelHeight:v73 inputFeatureChannels:v101 outputFeatureChannels:v95 strideWidth:v89 strideHeight:v83 paddingWidth:v80 paddingHeight:v75 weights:v92 biases:v33 label:v35 updateWeights:v71 device:v131 cmdQueue:v130];
    conv2 = v15->_conv2;
    v15->_conv2 = (MPSCNNConvolutionNode *)v37;

    v39 = (void *)MEMORY[0x263F13190];
    v40 = [(MPSCNNConvolutionNode *)v15->_conv2 resultImage];
    uint64_t v41 = [v39 nodeWithSource:v40];
    relu2 = v15->_relu2;
    v15->_relu2 = (MPSCNNNeuronReLUNode *)v41;

    v43 = (void *)MEMORY[0x263F13128];
    v127 = [(MPSCNNNeuronReLUNode *)v15->_relu2 resultImage];
    v123 = [v14 conv2];
    uint64_t v44 = [v123 kernelWidth];
    v120 = [v14 conv2];
    uint64_t v45 = [v120 kernelHeight];
    v117 = [v14 conv2];
    uint64_t v102 = [v117 inputFeatureChannels];
    v114 = [v14 conv2];
    uint64_t v96 = [v114 outputFeatureChannels];
    v111 = [v14 conv2];
    uint64_t v90 = [v111 strideWidth];
    v108 = [v14 conv2];
    uint64_t v84 = [v108 strideHeight];
    v105 = [v14 conv2];
    uint64_t v81 = [v105 paddingWidth];
    v99 = [v14 conv2];
    uint64_t v76 = [v99 paddingHeight];
    [NSString stringWithFormat:@"%@%@", v133, @"conv_3_weights"];
    v87 = uint64_t v74 = v45;
    v93 = [v132 objectForKeyedSubscript:v87];
    v78 = [NSString stringWithFormat:@"%@%@", v133, @"conv_3_biases"];
    v46 = [v132 objectForKeyedSubscript:v78];
    v47 = [v14 conv2];
    v48 = [v47 label];
    v49 = [v14 conv2];
    LOBYTE(v72) = [v49 updateWeights];
    uint64_t v50 = [v43 createConvolutional:v127 kernelWidth:v44 kernelHeight:v74 inputFeatureChannels:v102 outputFeatureChannels:v96 strideWidth:v90 strideHeight:v84 paddingWidth:v81 paddingHeight:v76 weights:v93 biases:v46 label:v48 updateWeights:v72 device:v131 cmdQueue:v130];
    conv3 = v15->_conv3;
    v15->_conv3 = (MPSCNNConvolutionNode *)v50;

    v52 = (void *)MEMORY[0x263F13190];
    v53 = [(MPSCNNConvolutionNode *)v15->_conv3 resultImage];
    uint64_t v54 = [v52 nodeWithSource:v53];
    relu3 = v15->_relu3;
    v15->_relu3 = (MPSCNNNeuronReLUNode *)v54;

    id v124 = objc_alloc(MEMORY[0x263F131B0]);
    v128 = [(MPSCNNNeuronReLUNode *)v15->_relu3 resultImage];
    v56 = [v14 pooling];
    uint64_t v57 = [v56 kernelSize];
    v58 = [v14 pooling];
    uint64_t v59 = [v58 kernelSize];
    v60 = [v14 pooling];
    uint64_t v61 = [v60 strideSize];
    v62 = [v14 pooling];
    uint64_t v63 = objc_msgSend(v124, "initWithSource:kernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:", v128, v57, v59, v61, objc_msgSend(v62, "strideSize"));
    pooling = v15->_pooling;
    v15->_pooling = (MPSCNNPoolingAverageNode *)v63;

    uint64_t v65 = [(MPSCNNPoolingAverageNode *)v15->_pooling resultImage];
    output = v15->_output;
    v15->_output = (MPSNNImageNode *)v65;

    uint64_t v67 = [(MPSCNNNeuronReLUNode *)v15->_relu3 resultImage];
    features = v15->_features;
    v15->_features = (MPSNNImageNode *)v67;
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
  id v8 = [(MPSCNNConvolutionNode *)self->_conv1 tc_weightsData];
  *(float *)&double v5 = a3;
  [v8 setLearningRate:v5];

  id v9 = [(MPSCNNConvolutionNode *)self->_conv2 tc_weightsData];
  *(float *)&double v6 = a3;
  [v9 setLearningRate:v6];

  id v10 = [(MPSCNNConvolutionNode *)self->_conv3 tc_weightsData];
  *(float *)&double v7 = a3;
  [v10 setLearningRate:v7];
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

- (MPSCNNConvolutionNode)conv3
{
  return self->_conv3;
}

- (void)setConv3:(id)a3
{
}

- (MPSCNNNeuronReLUNode)relu3
{
  return self->_relu3;
}

- (void)setRelu3:(id)a3
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
  objc_storeStrong((id *)&self->_relu3, 0);
  objc_storeStrong((id *)&self->_conv3, 0);
  objc_storeStrong((id *)&self->_relu2, 0);
  objc_storeStrong((id *)&self->_conv2, 0);
  objc_storeStrong((id *)&self->_relu1, 0);
  objc_storeStrong((id *)&self->_conv1, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

@end