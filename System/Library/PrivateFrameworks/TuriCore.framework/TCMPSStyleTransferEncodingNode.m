@interface TCMPSStyleTransferEncodingNode
- (MPSCNNConvolutionNode)conv;
- (MPSCNNInstanceNormalizationNode)instNorm;
- (MPSCNNNeuronReLUNode)relu;
- (MPSNNImageNode)output;
- (TCMPSStyleTransferEncodingNode)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8;
- (id)backwardPass:(id)a3;
- (id)exportWeights:(id)a3;
- (void)setConv:(id)a3;
- (void)setInstNorm:(id)a3;
- (void)setLearningRate:(float)a3;
- (void)setOutput:(id)a3;
- (void)setRelu:(id)a3;
- (void)setStyleIndex:(unint64_t)a3;
@end

@implementation TCMPSStyleTransferEncodingNode

- (TCMPSStyleTransferEncodingNode)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v69 = a3;
  id v65 = a4;
  id v67 = a5;
  id v66 = a6;
  id v14 = a7;
  id v68 = a8;
  v70.receiver = self;
  v70.super_class = (Class)TCMPSStyleTransferEncodingNode;
  v15 = [(TCMPSStyleTransferEncodingNode *)&v70 init];
  if (v15)
  {
    v16 = (void *)MEMORY[0x263EFF990];
    v17 = [v14 conv];
    v64 = objc_msgSend(v16, "dataWithLength:", 4 * objc_msgSend(v17, "outputFeatureChannels"));

    v53 = (void *)MEMORY[0x263F13128];
    v62 = [v14 conv];
    uint64_t v52 = [v62 kernelWidth];
    v60 = [v14 conv];
    uint64_t v51 = [v60 kernelHeight];
    v58 = [v14 conv];
    uint64_t v49 = [v58 inputFeatureChannels];
    v56 = [v14 conv];
    uint64_t v48 = [v56 outputFeatureChannels];
    v55 = [v14 conv];
    uint64_t v46 = [v55 strideWidth];
    v54 = [v14 conv];
    uint64_t v18 = [v54 strideHeight];
    v50 = [v14 conv];
    uint64_t v19 = [v50 paddingWidth];
    v47 = [v14 conv];
    uint64_t v20 = [v47 paddingHeight];
    v21 = [NSString stringWithFormat:@"%@%@", v69, @"conv_weight"];
    v22 = [v68 objectForKeyedSubscript:v21];
    v23 = [v14 conv];
    v24 = [v23 label];
    v25 = [v14 conv];
    LOBYTE(v45) = [v25 updateWeights];
    uint64_t v26 = [v53 createConvolutional:v65 kernelWidth:v52 kernelHeight:v51 inputFeatureChannels:v49 outputFeatureChannels:v48 strideWidth:v46 strideHeight:v18 paddingWidth:v19 paddingHeight:v20 weights:v22 biases:v64 label:v24 updateWeights:v45 device:v67 cmdQueue:v66];
    conv = v15->_conv;
    v15->_conv = (MPSCNNConvolutionNode *)v26;

    v28 = (void *)MEMORY[0x263F13150];
    v63 = [(MPSCNNConvolutionNode *)v15->_conv resultImage];
    v61 = [v14 inst];
    uint64_t v29 = [v61 channels];
    v59 = [v14 inst];
    uint64_t v30 = [v59 styles];
    v57 = [NSString stringWithFormat:@"%@%@", v69, @"inst_gamma_weight"];
    v31 = [v68 objectForKeyedSubscript:v57];
    v32 = [NSString stringWithFormat:@"%@%@", v69, @"inst_beta_weight"];
    v33 = [v68 objectForKeyedSubscript:v32];
    v34 = [v14 inst];
    v35 = [v34 label];
    uint64_t v36 = [v28 createInstanceNormalization:v63 channels:v29 styles:v30 gamma:v31 beta:v33 label:v35 device:v67 cmdQueue:v66];
    instNorm = v15->_instNorm;
    v15->_instNorm = (MPSCNNInstanceNormalizationNode *)v36;

    v38 = (void *)MEMORY[0x263F13190];
    v39 = [(MPSCNNInstanceNormalizationNode *)v15->_instNorm resultImage];
    uint64_t v40 = [v38 nodeWithSource:v39];
    relu = v15->_relu;
    v15->_relu = (MPSCNNNeuronReLUNode *)v40;

    uint64_t v42 = [(MPSCNNNeuronReLUNode *)v15->_relu resultImage];
    output = v15->_output;
    v15->_output = (MPSNNImageNode *)v42;
  }
  return v15;
}

- (id)backwardPass:(id)a3
{
  v4 = [(MPSCNNNeuronReLUNode *)self->_relu gradientFilterWithSource:a3];
  instNorm = self->_instNorm;
  v6 = [v4 resultImage];
  v7 = [(MPSCNNInstanceNormalizationNode *)instNorm gradientFilterWithSource:v6];

  conv = self->_conv;
  v9 = [v7 resultImage];
  v10 = [(MPSCNNConvolutionNode *)conv gradientFilterWithSource:v9];

  v11 = [v10 resultImage];

  return v11;
}

- (void)setStyleIndex:(unint64_t)a3
{
  id v5 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  [v5 setStyleIndex:a3];

  id v6 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  [v6 checkpoint];
}

- (void)setLearningRate:(float)a3
{
  id v7 = [(MPSCNNConvolutionNode *)self->_conv tc_weightsData];
  *(float *)&double v5 = a3;
  [v7 setLearningRate:v5];

  id v8 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  *(float *)&double v6 = a3;
  [v8 setLearningRate:v6];
}

- (id)exportWeights:(id)a3
{
  v47[2] = *MEMORY[0x263EF8340];
  id v45 = a3;
  id v44 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(MPSCNNConvolutionNode *)self->_conv tc_weightsData];
  size_t v5 = 4 * [v4 weightSize];

  id v43 = [MEMORY[0x263EFF990] dataWithLength:v5];
  double v6 = (void *)[v43 mutableBytes];
  id v7 = [(MPSCNNConvolutionNode *)self->_conv tc_weightsData];
  memcpy(v6, (const void *)[v7 weights], v5);

  v41 = [NSString stringWithFormat:@"%@%@", v45, @"conv_weight"];
  id v8 = [(MPSCNNConvolutionNode *)self->_conv tc_weightsData];
  uint64_t v42 = [v8 weightShape];

  uint64_t v40 = objc_alloc_init(TCMPSStyleTransferWeights);
  [(TCMPSStyleTransferWeights *)v40 setData:v43];
  [(TCMPSStyleTransferWeights *)v40 setShape:v42];
  [v44 setObject:v40 forKeyedSubscript:v41];
  v9 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  uint64_t v10 = [v9 styles];
  v11 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  size_t v12 = 4 * v10 * [v11 numberOfFeatureChannels];

  v39 = [MEMORY[0x263EFF990] dataWithLength:v12];
  v13 = [MEMORY[0x263EFF990] dataWithLength:v12];
  id v14 = v39;
  v15 = (void *)[v14 mutableBytes];
  v16 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  memcpy(v15, (const void *)[v16 gammaWeights], v12);

  id v17 = v13;
  uint64_t v18 = (void *)[v17 mutableBytes];
  uint64_t v19 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  memcpy(v18, (const void *)[v19 betaWeights], v12);

  uint64_t v20 = NSNumber;
  v21 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "styles"));
  v47[0] = v22;
  v23 = NSNumber;
  v24 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfFeatureChannels"));
  v47[1] = v25;
  uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];

  v27 = NSNumber;
  v28 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  uint64_t v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "styles"));
  v46[0] = v29;
  uint64_t v30 = NSNumber;
  v31 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  v32 = objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "numberOfFeatureChannels"));
  v46[1] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];

  v34 = objc_alloc_init(TCMPSStyleTransferWeights);
  v35 = objc_alloc_init(TCMPSStyleTransferWeights);
  [(TCMPSStyleTransferWeights *)v34 setData:v14];
  [(TCMPSStyleTransferWeights *)v34 setShape:v26];
  [(TCMPSStyleTransferWeights *)v35 setData:v17];
  [(TCMPSStyleTransferWeights *)v35 setShape:v33];
  uint64_t v36 = [NSString stringWithFormat:@"%@%@", v45, @"inst_gamma_weight"];
  v37 = [NSString stringWithFormat:@"%@%@", v45, @"inst_beta_weight"];
  [v44 setObject:v34 forKeyedSubscript:v36];
  [v44 setObject:v35 forKeyedSubscript:v37];

  return v44;
}

- (MPSNNImageNode)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
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

- (MPSCNNNeuronReLUNode)relu
{
  return self->_relu;
}

- (void)setRelu:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relu, 0);
  objc_storeStrong((id *)&self->_instNorm, 0);
  objc_storeStrong((id *)&self->_conv, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end