@interface TCMPSStyleTransferTransformerNetwork
- (MPSCNNConvolutionNode)conv;
- (MPSCNNInstanceNormalizationNode)instNorm;
- (MPSCNNNeuronSigmoidNode)sigmoid;
- (MPSNNImageNode)forwardPass;
- (TCMPSStyleTransferDecodingNode)decoding1;
- (TCMPSStyleTransferDecodingNode)decoding2;
- (TCMPSStyleTransferEncodingNode)encoding1;
- (TCMPSStyleTransferEncodingNode)encoding2;
- (TCMPSStyleTransferEncodingNode)encoding3;
- (TCMPSStyleTransferResidualNode)residual1;
- (TCMPSStyleTransferResidualNode)residual2;
- (TCMPSStyleTransferResidualNode)residual3;
- (TCMPSStyleTransferResidualNode)residual4;
- (TCMPSStyleTransferResidualNode)residual5;
- (TCMPSStyleTransferTransformerNetwork)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8;
- (id)backwardPass:(id)a3;
- (id)exportWeights:(id)a3;
- (void)setConv:(id)a3;
- (void)setDecoding1:(id)a3;
- (void)setDecoding2:(id)a3;
- (void)setEncoding1:(id)a3;
- (void)setEncoding2:(id)a3;
- (void)setEncoding3:(id)a3;
- (void)setForwardPass:(id)a3;
- (void)setInstNorm:(id)a3;
- (void)setLearningRate:(float)a3;
- (void)setResidual1:(id)a3;
- (void)setResidual2:(id)a3;
- (void)setResidual3:(id)a3;
- (void)setResidual4:(id)a3;
- (void)setResidual5:(id)a3;
- (void)setSigmoid:(id)a3;
- (void)setStyleIndex:(unint64_t)a3;
@end

@implementation TCMPSStyleTransferTransformerNetwork

- (TCMPSStyleTransferTransformerNetwork)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v111 = a4;
  id v113 = a5;
  id v112 = a6;
  id v13 = a7;
  id v114 = a8;
  v115.receiver = self;
  v115.super_class = (Class)TCMPSStyleTransferTransformerNetwork;
  v14 = [(TCMPSStyleTransferTransformerNetwork *)&v115 init];
  if (v14)
  {
    v15 = [TCMPSStyleTransferEncodingNode alloc];
    v16 = [v13 encode1];
    uint64_t v17 = [(TCMPSStyleTransferEncodingNode *)v15 initWithParameters:@"transformer_encode_1_" inputNode:v111 device:v113 cmdQueue:v112 descriptor:v16 initWeights:v114];
    encoding1 = v14->_encoding1;
    v14->_encoding1 = (TCMPSStyleTransferEncodingNode *)v17;

    v19 = [TCMPSStyleTransferEncodingNode alloc];
    v20 = [(TCMPSStyleTransferEncodingNode *)v14->_encoding1 output];
    v21 = [v13 encode2];
    uint64_t v22 = [(TCMPSStyleTransferEncodingNode *)v19 initWithParameters:@"transformer_encode_2_" inputNode:v20 device:v113 cmdQueue:v112 descriptor:v21 initWeights:v114];
    encoding2 = v14->_encoding2;
    v14->_encoding2 = (TCMPSStyleTransferEncodingNode *)v22;

    v24 = [TCMPSStyleTransferEncodingNode alloc];
    v25 = [(TCMPSStyleTransferEncodingNode *)v14->_encoding2 output];
    v26 = [v13 encode3];
    uint64_t v27 = [(TCMPSStyleTransferEncodingNode *)v24 initWithParameters:@"transformer_encode_3_" inputNode:v25 device:v113 cmdQueue:v112 descriptor:v26 initWeights:v114];
    encoding3 = v14->_encoding3;
    v14->_encoding3 = (TCMPSStyleTransferEncodingNode *)v27;

    v29 = [TCMPSStyleTransferResidualNode alloc];
    v30 = [(TCMPSStyleTransferEncodingNode *)v14->_encoding3 output];
    v31 = [v13 residual1];
    uint64_t v32 = [(TCMPSStyleTransferResidualNode *)v29 initWithParameters:@"transformer_residual_1_" inputNode:v30 device:v113 cmdQueue:v112 descriptor:v31 initWeights:v114];
    residual1 = v14->_residual1;
    v14->_residual1 = (TCMPSStyleTransferResidualNode *)v32;

    v34 = [TCMPSStyleTransferResidualNode alloc];
    v35 = [(TCMPSStyleTransferResidualNode *)v14->_residual1 output];
    v36 = [v13 residual2];
    uint64_t v37 = [(TCMPSStyleTransferResidualNode *)v34 initWithParameters:@"transformer_residual_2_" inputNode:v35 device:v113 cmdQueue:v112 descriptor:v36 initWeights:v114];
    residual2 = v14->_residual2;
    v14->_residual2 = (TCMPSStyleTransferResidualNode *)v37;

    v39 = [TCMPSStyleTransferResidualNode alloc];
    v40 = [(TCMPSStyleTransferResidualNode *)v14->_residual2 output];
    v41 = [v13 residual3];
    uint64_t v42 = [(TCMPSStyleTransferResidualNode *)v39 initWithParameters:@"transformer_residual_3_" inputNode:v40 device:v113 cmdQueue:v112 descriptor:v41 initWeights:v114];
    residual3 = v14->_residual3;
    v14->_residual3 = (TCMPSStyleTransferResidualNode *)v42;

    v44 = [TCMPSStyleTransferResidualNode alloc];
    v45 = [(TCMPSStyleTransferResidualNode *)v14->_residual3 output];
    v46 = [v13 residual4];
    uint64_t v47 = [(TCMPSStyleTransferResidualNode *)v44 initWithParameters:@"transformer_residual_4_" inputNode:v45 device:v113 cmdQueue:v112 descriptor:v46 initWeights:v114];
    residual4 = v14->_residual4;
    v14->_residual4 = (TCMPSStyleTransferResidualNode *)v47;

    v49 = [TCMPSStyleTransferResidualNode alloc];
    v50 = [(TCMPSStyleTransferResidualNode *)v14->_residual4 output];
    v51 = [v13 residual5];
    uint64_t v52 = [(TCMPSStyleTransferResidualNode *)v49 initWithParameters:@"transformer_residual_5_" inputNode:v50 device:v113 cmdQueue:v112 descriptor:v51 initWeights:v114];
    residual5 = v14->_residual5;
    v14->_residual5 = (TCMPSStyleTransferResidualNode *)v52;

    v54 = [TCMPSStyleTransferDecodingNode alloc];
    v55 = [(TCMPSStyleTransferResidualNode *)v14->_residual5 output];
    v56 = [v13 decode1];
    uint64_t v57 = [(TCMPSStyleTransferDecodingNode *)v54 initWithParameters:@"transformer_decoding_1_" inputNode:v55 device:v113 cmdQueue:v112 descriptor:v56 initWeights:v114];
    decoding1 = v14->_decoding1;
    v14->_decoding1 = (TCMPSStyleTransferDecodingNode *)v57;

    v59 = [TCMPSStyleTransferDecodingNode alloc];
    v60 = [(TCMPSStyleTransferDecodingNode *)v14->_decoding1 output];
    v61 = [v13 decode2];
    uint64_t v62 = [(TCMPSStyleTransferDecodingNode *)v59 initWithParameters:@"transformer_decoding_2_" inputNode:v60 device:v113 cmdQueue:v112 descriptor:v61 initWeights:v114];
    decoding2 = v14->_decoding2;
    v14->_decoding2 = (TCMPSStyleTransferDecodingNode *)v62;

    v64 = (void *)MEMORY[0x263EFF990];
    v65 = [v13 conv];
    v110 = objc_msgSend(v64, "dataWithLength:", 4 * objc_msgSend(v65, "outputFeatureChannels"));

    v101 = (void *)MEMORY[0x263F13128];
    v108 = [(TCMPSStyleTransferDecodingNode *)v14->_decoding2 output];
    v106 = [v13 conv];
    uint64_t v99 = [v106 kernelWidth];
    v105 = [v13 conv];
    uint64_t v98 = [v105 kernelHeight];
    v104 = [v13 conv];
    uint64_t v96 = [v104 inputFeatureChannels];
    v103 = [v13 conv];
    uint64_t v95 = [v103 outputFeatureChannels];
    v102 = [v13 conv];
    uint64_t v94 = [v102 strideWidth];
    v100 = [v13 conv];
    uint64_t v93 = [v100 strideHeight];
    v97 = [v13 conv];
    uint64_t v66 = [v97 paddingWidth];
    v67 = [v13 conv];
    uint64_t v68 = [v67 paddingHeight];
    v69 = [v114 objectForKeyedSubscript:@"transformer_conv5_weight"];
    v70 = [v13 conv];
    v71 = [v70 label];
    v72 = [v13 conv];
    LOBYTE(v92) = [v72 updateWeights];
    uint64_t v73 = [v101 createConvolutional:v108 kernelWidth:v99 kernelHeight:v98 inputFeatureChannels:v96 outputFeatureChannels:v95 strideWidth:v94 strideHeight:v93 paddingWidth:v66 paddingHeight:v68 weights:v69 biases:v110 label:v71 updateWeights:v92 device:v113 cmdQueue:v112];
    conv = v14->_conv;
    v14->_conv = (MPSCNNConvolutionNode *)v73;

    v75 = (void *)MEMORY[0x263F13150];
    v109 = [(MPSCNNConvolutionNode *)v14->_conv resultImage];
    v107 = [v13 inst];
    uint64_t v76 = [v107 channels];
    v77 = [v13 inst];
    uint64_t v78 = [v77 styles];
    v79 = [v114 objectForKeyedSubscript:@"transformer_instancenorm5_gamma_weight"];
    v80 = [v114 objectForKeyedSubscript:@"transformer_instancenorm5_beta_weight"];
    v81 = [v13 inst];
    v82 = [v81 label];
    uint64_t v83 = [v75 createInstanceNormalization:v109 channels:v76 styles:v78 gamma:v79 beta:v80 label:v82 device:v113 cmdQueue:v112];
    instNorm = v14->_instNorm;
    v14->_instNorm = (MPSCNNInstanceNormalizationNode *)v83;

    v85 = (void *)MEMORY[0x263F13198];
    v86 = [(MPSCNNInstanceNormalizationNode *)v14->_instNorm resultImage];
    uint64_t v87 = [v85 nodeWithSource:v86];
    sigmoid = v14->_sigmoid;
    v14->_sigmoid = (MPSCNNNeuronSigmoidNode *)v87;

    uint64_t v89 = [(MPSCNNNeuronSigmoidNode *)v14->_sigmoid resultImage];
    forwardPass = v14->_forwardPass;
    v14->_forwardPass = (MPSNNImageNode *)v89;
  }
  return v14;
}

- (id)backwardPass:(id)a3
{
  v4 = [(MPSCNNNeuronSigmoidNode *)self->_sigmoid gradientFilterWithSource:a3];
  instNorm = self->_instNorm;
  v26 = v4;
  v6 = [v4 resultImage];
  v7 = [(MPSCNNInstanceNormalizationNode *)instNorm gradientFilterWithSource:v6];

  conv = self->_conv;
  v25 = v7;
  v9 = [v7 resultImage];
  v10 = [(MPSCNNConvolutionNode *)conv gradientFilterWithSource:v9];

  decoding2 = self->_decoding2;
  v24 = v10;
  v12 = [v10 resultImage];
  id v13 = [(TCMPSStyleTransferDecodingNode *)decoding2 backwardPass:v12];

  v14 = [(TCMPSStyleTransferDecodingNode *)self->_decoding1 backwardPass:v13];
  v15 = [(TCMPSStyleTransferResidualNode *)self->_residual5 backwardPass:v14];
  v16 = [(TCMPSStyleTransferResidualNode *)self->_residual4 backwardPass:v15];
  uint64_t v17 = [(TCMPSStyleTransferResidualNode *)self->_residual3 backwardPass:v16];
  v18 = [(TCMPSStyleTransferResidualNode *)self->_residual2 backwardPass:v17];
  v19 = [(TCMPSStyleTransferResidualNode *)self->_residual1 backwardPass:v18];
  v20 = [(TCMPSStyleTransferEncodingNode *)self->_encoding3 backwardPass:v19];
  v21 = [(TCMPSStyleTransferEncodingNode *)self->_encoding2 backwardPass:v20];
  uint64_t v22 = [(TCMPSStyleTransferEncodingNode *)self->_encoding1 backwardPass:v21];

  return v22;
}

- (void)setStyleIndex:(unint64_t)a3
{
  -[TCMPSStyleTransferEncodingNode setStyleIndex:](self->_encoding1, "setStyleIndex:");
  [(TCMPSStyleTransferEncodingNode *)self->_encoding2 setStyleIndex:a3];
  [(TCMPSStyleTransferEncodingNode *)self->_encoding3 setStyleIndex:a3];
  [(TCMPSStyleTransferResidualNode *)self->_residual1 setStyleIndex:a3];
  [(TCMPSStyleTransferResidualNode *)self->_residual2 setStyleIndex:a3];
  [(TCMPSStyleTransferResidualNode *)self->_residual3 setStyleIndex:a3];
  [(TCMPSStyleTransferResidualNode *)self->_residual4 setStyleIndex:a3];
  [(TCMPSStyleTransferResidualNode *)self->_residual5 setStyleIndex:a3];
  [(TCMPSStyleTransferDecodingNode *)self->_decoding1 setStyleIndex:a3];
  [(TCMPSStyleTransferDecodingNode *)self->_decoding2 setStyleIndex:a3];
  id v5 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  [v5 setStyleIndex:a3];

  id v6 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  [v6 checkpoint];
}

- (void)setLearningRate:(float)a3
{
  -[TCMPSStyleTransferEncodingNode setLearningRate:](self->_encoding1, "setLearningRate:");
  *(float *)&double v5 = a3;
  [(TCMPSStyleTransferEncodingNode *)self->_encoding2 setLearningRate:v5];
  *(float *)&double v6 = a3;
  [(TCMPSStyleTransferEncodingNode *)self->_encoding3 setLearningRate:v6];
  *(float *)&double v7 = a3;
  [(TCMPSStyleTransferResidualNode *)self->_residual1 setLearningRate:v7];
  *(float *)&double v8 = a3;
  [(TCMPSStyleTransferResidualNode *)self->_residual2 setLearningRate:v8];
  *(float *)&double v9 = a3;
  [(TCMPSStyleTransferResidualNode *)self->_residual3 setLearningRate:v9];
  *(float *)&double v10 = a3;
  [(TCMPSStyleTransferResidualNode *)self->_residual4 setLearningRate:v10];
  *(float *)&double v11 = a3;
  [(TCMPSStyleTransferResidualNode *)self->_residual5 setLearningRate:v11];
  *(float *)&double v12 = a3;
  [(TCMPSStyleTransferDecodingNode *)self->_decoding1 setLearningRate:v12];
  *(float *)&double v13 = a3;
  [(TCMPSStyleTransferDecodingNode *)self->_decoding2 setLearningRate:v13];
  id v16 = [(MPSCNNConvolutionNode *)self->_conv tc_weightsData];
  *(float *)&double v14 = a3;
  [v16 setLearningRate:v14];

  id v17 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  *(float *)&double v15 = a3;
  [v17 setLearningRate:v15];
}

- (id)exportWeights:(id)a3
{
  v67[2] = *MEMORY[0x263EF8340];
  id v64 = a3;
  id v65 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v57 = [NSString stringWithFormat:@"%@%@", v64, @"encode_1_"];
  v58 = -[TCMPSStyleTransferEncodingNode exportWeights:](self->_encoding1, "exportWeights:");
  objc_msgSend(v65, "addEntriesFromDictionary:");
  v55 = [NSString stringWithFormat:@"%@%@", v64, @"encode_2_"];
  v56 = -[TCMPSStyleTransferEncodingNode exportWeights:](self->_encoding2, "exportWeights:");
  objc_msgSend(v65, "addEntriesFromDictionary:");
  v53 = [NSString stringWithFormat:@"%@%@", v64, @"encode_3_"];
  v54 = -[TCMPSStyleTransferEncodingNode exportWeights:](self->_encoding3, "exportWeights:");
  objc_msgSend(v65, "addEntriesFromDictionary:");
  v51 = [NSString stringWithFormat:@"%@%@", v64, @"residual_1_"];
  uint64_t v52 = -[TCMPSStyleTransferResidualNode exportWeights:](self->_residual1, "exportWeights:");
  objc_msgSend(v65, "addEntriesFromDictionary:");
  v49 = [NSString stringWithFormat:@"%@%@", v64, @"residual_2_"];
  v50 = -[TCMPSStyleTransferResidualNode exportWeights:](self->_residual2, "exportWeights:");
  objc_msgSend(v65, "addEntriesFromDictionary:");
  v46 = [NSString stringWithFormat:@"%@%@", v64, @"residual_3_"];
  v48 = -[TCMPSStyleTransferResidualNode exportWeights:](self->_residual3, "exportWeights:");
  objc_msgSend(v65, "addEntriesFromDictionary:");
  v44 = [NSString stringWithFormat:@"%@%@", v64, @"residual_4_"];
  v45 = -[TCMPSStyleTransferResidualNode exportWeights:](self->_residual4, "exportWeights:");
  objc_msgSend(v65, "addEntriesFromDictionary:");
  v41 = [NSString stringWithFormat:@"%@%@", v64, @"residual_5_"];
  v43 = -[TCMPSStyleTransferResidualNode exportWeights:](self->_residual5, "exportWeights:");
  objc_msgSend(v65, "addEntriesFromDictionary:");
  v39 = [NSString stringWithFormat:@"%@%@", v64, @"decoding_1_"];
  uint64_t v42 = -[TCMPSStyleTransferDecodingNode exportWeights:](self->_decoding1, "exportWeights:");
  objc_msgSend(v65, "addEntriesFromDictionary:");
  v40 = [NSString stringWithFormat:@"%@%@", v64, @"decoding_2_"];
  uint64_t v47 = -[TCMPSStyleTransferDecodingNode exportWeights:](self->_decoding2, "exportWeights:");
  objc_msgSend(v65, "addEntriesFromDictionary:");
  v4 = [(MPSCNNConvolutionNode *)self->_conv tc_weightsData];
  size_t v5 = 4 * [v4 weightSize];

  id v63 = [MEMORY[0x263EFF990] dataWithLength:v5];
  double v6 = (void *)[v63 mutableBytes];
  double v7 = [(MPSCNNConvolutionNode *)self->_conv tc_weightsData];
  memcpy(v6, (const void *)[v7 weights], v5);

  v61 = [NSString stringWithFormat:@"%@%@", v64, @"conv5_weight"];
  double v8 = [(MPSCNNConvolutionNode *)self->_conv tc_weightsData];
  uint64_t v62 = [v8 weightShape];

  v38 = objc_alloc_init(TCMPSStyleTransferWeights);
  [(TCMPSStyleTransferWeights *)v38 setData:v63];
  [(TCMPSStyleTransferWeights *)v38 setShape:v62];
  [v65 setObject:v38 forKeyedSubscript:v61];
  v59 = [NSString stringWithFormat:@"%@%@", v64, @"instancenorm5_gamma_weight"];
  v60 = [NSString stringWithFormat:@"%@%@", v64, @"instancenorm5_beta_weight"];
  double v9 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  uint64_t v10 = [v9 styles];
  double v11 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  size_t v12 = 4 * v10 * [v11 numberOfFeatureChannels];

  uint64_t v37 = [MEMORY[0x263EFF990] dataWithLength:v12];
  double v13 = [MEMORY[0x263EFF990] dataWithLength:v12];
  id v14 = v37;
  double v15 = (void *)[v14 mutableBytes];
  id v16 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  memcpy(v15, (const void *)[v16 gammaWeights], v12);

  id v17 = v13;
  v18 = (void *)[v17 mutableBytes];
  v19 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  memcpy(v18, (const void *)[v19 betaWeights], v12);

  v20 = NSNumber;
  v21 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  uint64_t v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "styles"));
  v67[0] = v22;
  v23 = NSNumber;
  v24 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfFeatureChannels"));
  v67[1] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];

  uint64_t v27 = NSNumber;
  v28 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "styles"));
  v66[0] = v29;
  v30 = NSNumber;
  v31 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  uint64_t v32 = objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "numberOfFeatureChannels"));
  v66[1] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:2];

  v34 = objc_alloc_init(TCMPSStyleTransferWeights);
  v35 = objc_alloc_init(TCMPSStyleTransferWeights);
  [(TCMPSStyleTransferWeights *)v34 setData:v14];
  [(TCMPSStyleTransferWeights *)v34 setShape:v26];
  [(TCMPSStyleTransferWeights *)v35 setData:v17];
  [(TCMPSStyleTransferWeights *)v35 setShape:v33];
  [v65 setObject:v34 forKeyedSubscript:v59];
  [v65 setObject:v35 forKeyedSubscript:v60];

  return v65;
}

- (MPSNNImageNode)forwardPass
{
  return self->_forwardPass;
}

- (void)setForwardPass:(id)a3
{
}

- (TCMPSStyleTransferEncodingNode)encoding1
{
  return self->_encoding1;
}

- (void)setEncoding1:(id)a3
{
}

- (TCMPSStyleTransferEncodingNode)encoding2
{
  return self->_encoding2;
}

- (void)setEncoding2:(id)a3
{
}

- (TCMPSStyleTransferEncodingNode)encoding3
{
  return self->_encoding3;
}

- (void)setEncoding3:(id)a3
{
}

- (TCMPSStyleTransferResidualNode)residual1
{
  return self->_residual1;
}

- (void)setResidual1:(id)a3
{
}

- (TCMPSStyleTransferResidualNode)residual2
{
  return self->_residual2;
}

- (void)setResidual2:(id)a3
{
}

- (TCMPSStyleTransferResidualNode)residual3
{
  return self->_residual3;
}

- (void)setResidual3:(id)a3
{
}

- (TCMPSStyleTransferResidualNode)residual4
{
  return self->_residual4;
}

- (void)setResidual4:(id)a3
{
}

- (TCMPSStyleTransferResidualNode)residual5
{
  return self->_residual5;
}

- (void)setResidual5:(id)a3
{
}

- (TCMPSStyleTransferDecodingNode)decoding1
{
  return self->_decoding1;
}

- (void)setDecoding1:(id)a3
{
}

- (TCMPSStyleTransferDecodingNode)decoding2
{
  return self->_decoding2;
}

- (void)setDecoding2:(id)a3
{
}

- (MPSCNNConvolutionNode)conv
{
  return self->_conv;
}

- (void)setConv:(id)a3
{
}

- (MPSCNNInstanceNormalizationNode)instNorm
{
  return self->_instNorm;
}

- (void)setInstNorm:(id)a3
{
}

- (MPSCNNNeuronSigmoidNode)sigmoid
{
  return self->_sigmoid;
}

- (void)setSigmoid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigmoid, 0);
  objc_storeStrong((id *)&self->_instNorm, 0);
  objc_storeStrong((id *)&self->_conv, 0);
  objc_storeStrong((id *)&self->_decoding2, 0);
  objc_storeStrong((id *)&self->_decoding1, 0);
  objc_storeStrong((id *)&self->_residual5, 0);
  objc_storeStrong((id *)&self->_residual4, 0);
  objc_storeStrong((id *)&self->_residual3, 0);
  objc_storeStrong((id *)&self->_residual2, 0);
  objc_storeStrong((id *)&self->_residual1, 0);
  objc_storeStrong((id *)&self->_encoding3, 0);
  objc_storeStrong((id *)&self->_encoding2, 0);
  objc_storeStrong((id *)&self->_encoding1, 0);
  objc_storeStrong((id *)&self->_forwardPass, 0);
}

@end