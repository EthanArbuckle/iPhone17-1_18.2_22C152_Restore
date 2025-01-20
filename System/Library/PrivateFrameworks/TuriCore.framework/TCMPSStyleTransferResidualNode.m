@interface TCMPSStyleTransferResidualNode
- (MPSCNNConvolutionNode)conv1;
- (MPSCNNConvolutionNode)conv2;
- (MPSCNNInstanceNormalizationNode)instNorm1;
- (MPSCNNInstanceNormalizationNode)instNorm2;
- (MPSCNNNeuronReLUNode)relu1;
- (MPSNNAdditionNode)add;
- (MPSNNImageNode)output;
- (TCMPSStyleTransferResidualNode)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8;
- (id)backwardPass:(id)a3;
- (id)exportWeights:(id)a3;
- (void)setAdd:(id)a3;
- (void)setConv1:(id)a3;
- (void)setConv2:(id)a3;
- (void)setInstNorm1:(id)a3;
- (void)setInstNorm2:(id)a3;
- (void)setLearningRate:(float)a3;
- (void)setOutput:(id)a3;
- (void)setRelu1:(id)a3;
- (void)setStyleIndex:(unint64_t)a3;
@end

@implementation TCMPSStyleTransferResidualNode

- (TCMPSStyleTransferResidualNode)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  v119[2] = *MEMORY[0x263EF8340];
  id v115 = a3;
  id v112 = a4;
  id v113 = a5;
  id v114 = a6;
  id v14 = a7;
  id v116 = a8;
  v118.receiver = self;
  v118.super_class = (Class)TCMPSStyleTransferResidualNode;
  v117 = [(TCMPSStyleTransferResidualNode *)&v118 init];
  if (v117)
  {
    v15 = (void *)MEMORY[0x263EFF990];
    v16 = [v14 conv1];
    v107 = objc_msgSend(v15, "dataWithLength:", 4 * objc_msgSend(v16, "outputFeatureChannels"));

    v108 = (void *)MEMORY[0x263F13128];
    v93 = [v14 conv1];
    uint64_t v104 = [v93 kernelWidth];
    v91 = [v14 conv1];
    uint64_t v100 = [v91 kernelHeight];
    v89 = [v14 conv1];
    uint64_t v97 = [v89 inputFeatureChannels];
    v87 = [v14 conv1];
    uint64_t v95 = [v87 outputFeatureChannels];
    v85 = [v14 conv1];
    uint64_t v17 = [v85 strideWidth];
    v83 = [v14 conv1];
    uint64_t v18 = [v83 strideHeight];
    v81 = [v14 conv1];
    uint64_t v19 = [v81 paddingWidth];
    v79 = [v14 conv1];
    uint64_t v20 = [v79 paddingHeight];
    v21 = [NSString stringWithFormat:@"%@%@", v115, @"conv_1_weight"];
    v22 = [v116 objectForKeyedSubscript:v21];
    v23 = [v14 conv1];
    v24 = [v23 label];
    v25 = [v14 conv1];
    LOBYTE(v75) = [v25 updateWeights];
    uint64_t v26 = [v108 createConvolutional:v112 kernelWidth:v104 kernelHeight:v100 inputFeatureChannels:v97 outputFeatureChannels:v95 strideWidth:v17 strideHeight:v18 paddingWidth:v19 paddingHeight:v20 weights:v22 biases:v107 label:v24 updateWeights:v75 device:v113 cmdQueue:v114];
    conv1 = v117->_conv1;
    v117->_conv1 = (MPSCNNConvolutionNode *)v26;

    v28 = (void *)MEMORY[0x263F13150];
    v109 = [(MPSCNNConvolutionNode *)v117->_conv1 resultImage];
    v105 = [v14 inst1];
    uint64_t v29 = [v105 channels];
    v101 = [v14 inst1];
    uint64_t v30 = [v101 styles];
    v31 = [NSString stringWithFormat:@"%@%@", v115, @"inst_1_gamma_weight"];
    v32 = [v116 objectForKeyedSubscript:v31];
    v33 = [NSString stringWithFormat:@"%@%@", v115, @"inst_1_beta_weight"];
    v34 = [v116 objectForKeyedSubscript:v33];
    v35 = [v14 inst1];
    v36 = [v35 label];
    uint64_t v37 = [v28 createInstanceNormalization:v109 channels:v29 styles:v30 gamma:v32 beta:v34 label:v36 device:v113 cmdQueue:v114];
    instNorm1 = v117->_instNorm1;
    v117->_instNorm1 = (MPSCNNInstanceNormalizationNode *)v37;

    v39 = (void *)MEMORY[0x263F13190];
    v40 = [(MPSCNNInstanceNormalizationNode *)v117->_instNorm1 resultImage];
    uint64_t v41 = [v39 nodeWithSource:v40];
    relu1 = v117->_relu1;
    v117->_relu1 = (MPSCNNNeuronReLUNode *)v41;

    v43 = (void *)MEMORY[0x263EFF990];
    v44 = [v14 conv2];
    v106 = objc_msgSend(v43, "dataWithLength:", 4 * objc_msgSend(v44, "outputFeatureChannels"));

    v102 = (void *)MEMORY[0x263F13128];
    v110 = [(MPSCNNNeuronReLUNode *)v117->_relu1 resultImage];
    v90 = [v14 conv2];
    uint64_t v98 = [v90 kernelWidth];
    v88 = [v14 conv2];
    uint64_t v96 = [v88 kernelHeight];
    v86 = [v14 conv2];
    uint64_t v94 = [v86 inputFeatureChannels];
    v84 = [v14 conv2];
    uint64_t v92 = [v84 outputFeatureChannels];
    v82 = [v14 conv2];
    uint64_t v45 = [v82 strideWidth];
    v80 = [v14 conv2];
    uint64_t v46 = [v80 strideHeight];
    v78 = [v14 conv2];
    uint64_t v47 = [v78 paddingWidth];
    v77 = [v14 conv2];
    uint64_t v48 = [v77 paddingHeight];
    v49 = [NSString stringWithFormat:@"%@%@", v115, @"conv_2_weight"];
    v50 = [v116 objectForKeyedSubscript:v49];
    v51 = [v14 conv2];
    v52 = [v51 label];
    v53 = [v14 conv2];
    LOBYTE(v76) = [v53 updateWeights];
    uint64_t v54 = [v102 createConvolutional:v110 kernelWidth:v98 kernelHeight:v96 inputFeatureChannels:v94 outputFeatureChannels:v92 strideWidth:v45 strideHeight:v46 paddingWidth:v47 paddingHeight:v48 weights:v50 biases:v106 label:v52 updateWeights:v76 device:v113 cmdQueue:v114];
    conv2 = v117->_conv2;
    v117->_conv2 = (MPSCNNConvolutionNode *)v54;

    v56 = (void *)MEMORY[0x263F13150];
    v111 = [(MPSCNNConvolutionNode *)v117->_conv2 resultImage];
    v103 = [v14 inst2];
    uint64_t v57 = [v103 channels];
    v99 = [v14 inst2];
    uint64_t v58 = [v99 styles];
    v59 = [NSString stringWithFormat:@"%@%@", v115, @"inst_2_gamma_weight"];
    v60 = [v116 objectForKeyedSubscript:v59];
    v61 = [NSString stringWithFormat:@"%@%@", v115, @"inst_2_beta_weight"];
    v62 = [v116 objectForKeyedSubscript:v61];
    v63 = [v14 inst2];
    v64 = [v63 label];
    uint64_t v65 = [v56 createInstanceNormalization:v111 channels:v57 styles:v58 gamma:v60 beta:v62 label:v64 device:v113 cmdQueue:v114];
    instNorm2 = v117->_instNorm2;
    v117->_instNorm2 = (MPSCNNInstanceNormalizationNode *)v65;

    v67 = (void *)MEMORY[0x263F13358];
    v119[0] = v112;
    v68 = [(MPSCNNInstanceNormalizationNode *)v117->_instNorm2 resultImage];
    v119[1] = v68;
    v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:2];
    uint64_t v70 = [v67 nodeWithSources:v69];
    add = v117->_add;
    v117->_add = (MPSNNAdditionNode *)v70;

    uint64_t v72 = [(MPSNNAdditionNode *)v117->_add resultImage];
    output = v117->_output;
    v117->_output = (MPSNNImageNode *)v72;
  }
  return v117;
}

- (void)setStyleIndex:(unint64_t)a3
{
  id v5 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  [v5 setStyleIndex:a3];

  id v6 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  [v6 checkpoint];

  id v7 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  [v7 setStyleIndex:a3];

  id v8 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  [v8 checkpoint];
}

- (id)backwardPass:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  add = self->_add;
  v26[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v7 = [(MPSNNAdditionNode *)add gradientFiltersWithSources:v6];

  instNorm2 = self->_instNorm2;
  v9 = [v7 objectAtIndexedSubscript:0];
  v10 = [v9 resultImage];
  v11 = [(MPSCNNInstanceNormalizationNode *)instNorm2 gradientFilterWithSource:v10];

  conv2 = self->_conv2;
  v13 = [v11 resultImage];
  id v14 = [(MPSCNNConvolutionNode *)conv2 gradientFilterWithSource:v13];

  relu1 = self->_relu1;
  v16 = [v14 resultImage];
  uint64_t v17 = [(MPSCNNNeuronReLUNode *)relu1 gradientFilterWithSource:v16];

  instNorm1 = self->_instNorm1;
  uint64_t v19 = [v17 resultImage];
  uint64_t v20 = [(MPSCNNInstanceNormalizationNode *)instNorm1 gradientFilterWithSource:v19];

  conv1 = self->_conv1;
  v22 = [v20 resultImage];
  v23 = [(MPSCNNConvolutionNode *)conv1 gradientFilterWithSource:v22];

  v24 = [v23 resultImage];

  return v24;
}

- (void)setLearningRate:(float)a3
{
  id v9 = [(MPSCNNConvolutionNode *)self->_conv1 tc_weightsData];
  *(float *)&double v5 = a3;
  [v9 setLearningRate:v5];

  id v10 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  *(float *)&double v6 = a3;
  [v10 setLearningRate:v6];

  id v11 = [(MPSCNNConvolutionNode *)self->_conv2 tc_weightsData];
  *(float *)&double v7 = a3;
  [v11 setLearningRate:v7];

  id v12 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  *(float *)&double v8 = a3;
  [v12 setLearningRate:v8];
}

- (id)exportWeights:(id)a3
{
  v89[2] = *MEMORY[0x263EF8340];
  id v84 = a3;
  id v85 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v82 = [NSString stringWithFormat:@"%@%@", v84, @"conv_1_weight"];
  id v4 = [(MPSCNNConvolutionNode *)self->_conv1 tc_weightsData];
  size_t v5 = 4 * [v4 weightSize];

  id v81 = [MEMORY[0x263EFF990] dataWithLength:v5];
  double v6 = (void *)[v81 mutableBytes];
  double v7 = [(MPSCNNConvolutionNode *)self->_conv1 tc_weightsData];
  memcpy(v6, (const void *)[v7 weights], v5);

  double v8 = [(MPSCNNConvolutionNode *)self->_conv1 tc_weightsData];
  v80 = [v8 weightShape];

  v68 = objc_alloc_init(TCMPSStyleTransferWeights);
  [(TCMPSStyleTransferWeights *)v68 setData:v81];
  [(TCMPSStyleTransferWeights *)v68 setShape:v80];
  [v85 setObject:v68 forKeyedSubscript:v82];
  v79 = [NSString stringWithFormat:@"%@%@", v84, @"conv_2_weight"];
  id v9 = [(MPSCNNConvolutionNode *)self->_conv2 tc_weightsData];
  size_t v10 = 4 * [v9 weightSize];

  id v78 = [MEMORY[0x263EFF990] dataWithLength:v10];
  id v11 = (void *)[v78 mutableBytes];
  id v12 = [(MPSCNNConvolutionNode *)self->_conv2 tc_weightsData];
  memcpy(v11, (const void *)[v12 weights], v10);

  v13 = [(MPSCNNConvolutionNode *)self->_conv2 tc_weightsData];
  v77 = [v13 weightShape];

  v67 = objc_alloc_init(TCMPSStyleTransferWeights);
  [(TCMPSStyleTransferWeights *)v67 setData:v78];
  [(TCMPSStyleTransferWeights *)v67 setShape:v77];
  [v85 setObject:v67 forKeyedSubscript:v79];
  uint64_t v75 = [NSString stringWithFormat:@"%@%@", v84, @"inst_1_gamma_weight"];
  uint64_t v76 = [NSString stringWithFormat:@"%@%@", v84, @"inst_1_beta_weight"];
  id v14 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  uint64_t v15 = [v14 styles];
  v16 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  size_t v17 = 4 * v15 * [v16 numberOfFeatureChannels];

  uint64_t v65 = [MEMORY[0x263EFF990] dataWithLength:v17];
  uint64_t v18 = [MEMORY[0x263EFF990] dataWithLength:v17];
  id v74 = v65;
  uint64_t v19 = (void *)[v74 mutableBytes];
  uint64_t v20 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  memcpy(v19, (const void *)[v20 gammaWeights], v17);

  id v73 = v18;
  v21 = (void *)[v73 mutableBytes];
  v22 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  memcpy(v21, (const void *)[v22 betaWeights], v17);

  v23 = NSNumber;
  v24 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "styles"));
  v89[0] = v25;
  uint64_t v26 = NSNumber;
  v27 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "numberOfFeatureChannels"));
  v89[1] = v28;
  uint64_t v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:2];

  uint64_t v29 = NSNumber;
  uint64_t v30 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  v31 = objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "styles"));
  v88[0] = v31;
  v32 = NSNumber;
  v33 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm1 tc_weightsData];
  v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "numberOfFeatureChannels"));
  v88[1] = v34;
  v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:2];

  v83 = objc_alloc_init(TCMPSStyleTransferWeights);
  v35 = objc_alloc_init(TCMPSStyleTransferWeights);
  [(TCMPSStyleTransferWeights *)v83 setData:v74];
  [(TCMPSStyleTransferWeights *)v83 setShape:v72];
  [(TCMPSStyleTransferWeights *)v35 setData:v73];
  [(TCMPSStyleTransferWeights *)v35 setShape:v71];
  [v85 setObject:v83 forKeyedSubscript:v75];
  [v85 setObject:v35 forKeyedSubscript:v76];
  v69 = [NSString stringWithFormat:@"%@%@", v84, @"inst_2_gamma_weight"];
  uint64_t v70 = [NSString stringWithFormat:@"%@%@", v84, @"inst_2_beta_weight"];
  v36 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  uint64_t v37 = [v36 styles];
  v38 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  uint64_t v39 = [v38 numberOfFeatureChannels];

  size_t v40 = 4 * v37 * v39;
  v64 = [MEMORY[0x263EFF990] dataWithLength:v40];
  id v66 = [MEMORY[0x263EFF990] dataWithLength:v40];
  id v41 = v64;
  v42 = (void *)[v41 mutableBytes];
  v43 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  memcpy(v42, (const void *)[v43 gammaWeights], v40);

  id v44 = v66;
  uint64_t v45 = (void *)[v44 mutableBytes];
  uint64_t v46 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  memcpy(v45, (const void *)[v46 betaWeights], v40);

  uint64_t v47 = NSNumber;
  uint64_t v48 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  v49 = objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v48, "styles"));
  v87[0] = v49;
  v50 = NSNumber;
  v51 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  v52 = objc_msgSend(v50, "numberWithUnsignedInteger:", objc_msgSend(v51, "numberOfFeatureChannels"));
  v87[1] = v52;
  v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];

  uint64_t v54 = NSNumber;
  v55 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  v56 = objc_msgSend(v54, "numberWithUnsignedInteger:", objc_msgSend(v55, "styles"));
  v86[0] = v56;
  uint64_t v57 = NSNumber;
  uint64_t v58 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm2 tc_weightsData];
  v59 = objc_msgSend(v57, "numberWithUnsignedInteger:", objc_msgSend(v58, "numberOfFeatureChannels"));
  v86[1] = v59;
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:2];

  v61 = objc_alloc_init(TCMPSStyleTransferWeights);
  v62 = objc_alloc_init(TCMPSStyleTransferWeights);
  [(TCMPSStyleTransferWeights *)v61 setData:v41];
  [(TCMPSStyleTransferWeights *)v61 setShape:v53];
  [(TCMPSStyleTransferWeights *)v62 setData:v44];
  [(TCMPSStyleTransferWeights *)v62 setShape:v60];
  [v85 setObject:v61 forKeyedSubscript:v69];
  [v85 setObject:v62 forKeyedSubscript:v70];

  return v85;
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

- (MPSCNNInstanceNormalizationNode)instNorm1
{
  return self->_instNorm1;
}

- (void)setInstNorm1:(id)a3
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

- (MPSCNNInstanceNormalizationNode)instNorm2
{
  return self->_instNorm2;
}

- (void)setInstNorm2:(id)a3
{
}

- (MPSNNAdditionNode)add
{
  return self->_add;
}

- (void)setAdd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_add, 0);
  objc_storeStrong((id *)&self->_instNorm2, 0);
  objc_storeStrong((id *)&self->_conv2, 0);
  objc_storeStrong((id *)&self->_relu1, 0);
  objc_storeStrong((id *)&self->_instNorm1, 0);
  objc_storeStrong((id *)&self->_conv1, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end