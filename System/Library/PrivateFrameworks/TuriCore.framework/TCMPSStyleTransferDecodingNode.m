@interface TCMPSStyleTransferDecodingNode
- (MPSCNNConvolutionNode)conv;
- (MPSCNNInstanceNormalizationNode)instNorm;
- (MPSCNNNeuronReLUNode)relu;
- (MPSCNNUpsamplingNearestNode)upsample;
- (MPSNNImageNode)output;
- (TCMPSStyleTransferDecodingNode)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8;
- (id)backwardPass:(id)a3;
- (id)exportWeights:(id)a3;
- (void)setConv:(id)a3;
- (void)setInstNorm:(id)a3;
- (void)setLearningRate:(float)a3;
- (void)setOutput:(id)a3;
- (void)setRelu:(id)a3;
- (void)setStyleIndex:(unint64_t)a3;
- (void)setUpsample:(id)a3;
@end

@implementation TCMPSStyleTransferDecodingNode

- (TCMPSStyleTransferDecodingNode)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v76 = a3;
  id v72 = a4;
  id v74 = a5;
  id v73 = a6;
  id v14 = a7;
  id v75 = a8;
  v77.receiver = self;
  v77.super_class = (Class)TCMPSStyleTransferDecodingNode;
  v15 = [(TCMPSStyleTransferDecodingNode *)&v77 init];
  if (v15)
  {
    v16 = (void *)MEMORY[0x263F131E0];
    v17 = [v14 upsample];
    uint64_t v18 = [v17 scale];
    v19 = [v14 upsample];
    uint64_t v20 = objc_msgSend(v16, "nodeWithSource:integerScaleFactorX:integerScaleFactorY:", v72, v18, objc_msgSend(v19, "scale"));
    upsample = v15->_upsample;
    v15->_upsample = (MPSCNNUpsamplingNearestNode *)v20;

    v22 = (void *)MEMORY[0x263EFF990];
    v23 = [v14 conv];
    v71 = objc_msgSend(v22, "dataWithLength:", 4 * objc_msgSend(v23, "outputFeatureChannels"));

    v60 = (void *)MEMORY[0x263F13128];
    v69 = [(MPSCNNUpsamplingNearestNode *)v15->_upsample resultImage];
    v67 = [v14 conv];
    uint64_t v58 = [v67 kernelWidth];
    v65 = [v14 conv];
    uint64_t v57 = [v65 kernelHeight];
    v63 = [v14 conv];
    uint64_t v55 = [v63 inputFeatureChannels];
    v62 = [v14 conv];
    uint64_t v54 = [v62 outputFeatureChannels];
    v61 = [v14 conv];
    uint64_t v52 = [v61 strideWidth];
    v59 = [v14 conv];
    uint64_t v51 = [v59 strideHeight];
    v56 = [v14 conv];
    uint64_t v24 = [v56 paddingWidth];
    v53 = [v14 conv];
    uint64_t v25 = [v53 paddingHeight];
    v26 = [NSString stringWithFormat:@"%@%@", v76, @"conv_weight"];
    v27 = [v75 objectForKeyedSubscript:v26];
    v28 = [v14 conv];
    v29 = [v28 label];
    v30 = [v14 conv];
    LOBYTE(v50) = [v30 updateWeights];
    uint64_t v31 = [v60 createConvolutional:v69 kernelWidth:v58 kernelHeight:v57 inputFeatureChannels:v55 outputFeatureChannels:v54 strideWidth:v52 strideHeight:v51 paddingWidth:v24 paddingHeight:v25 weights:v27 biases:v71 label:v29 updateWeights:v50 device:v74 cmdQueue:v73];
    conv = v15->_conv;
    v15->_conv = (MPSCNNConvolutionNode *)v31;

    v33 = (void *)MEMORY[0x263F13150];
    v70 = [(MPSCNNConvolutionNode *)v15->_conv resultImage];
    v68 = [v14 inst];
    uint64_t v34 = [v68 channels];
    v66 = [v14 inst];
    uint64_t v35 = [v66 styles];
    v64 = [NSString stringWithFormat:@"%@%@", v76, @"inst_gamma_weight"];
    v36 = [v75 objectForKeyedSubscript:v64];
    v37 = [NSString stringWithFormat:@"%@%@", v76, @"inst_beta_weight"];
    v38 = [v75 objectForKeyedSubscript:v37];
    v39 = [v14 inst];
    v40 = [v39 label];
    uint64_t v41 = [v33 createInstanceNormalization:v70 channels:v34 styles:v35 gamma:v36 beta:v38 label:v40 device:v74 cmdQueue:v73];
    instNorm = v15->_instNorm;
    v15->_instNorm = (MPSCNNInstanceNormalizationNode *)v41;

    v43 = (void *)MEMORY[0x263F13190];
    v44 = [(MPSCNNInstanceNormalizationNode *)v15->_instNorm resultImage];
    uint64_t v45 = [v43 nodeWithSource:v44];
    relu = v15->_relu;
    v15->_relu = (MPSCNNNeuronReLUNode *)v45;

    uint64_t v47 = [(MPSCNNNeuronReLUNode *)v15->_relu resultImage];
    output = v15->_output;
    v15->_output = (MPSNNImageNode *)v47;
  }
  return v15;
}

- (void)setStyleIndex:(unint64_t)a3
{
  id v5 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  [v5 setStyleIndex:a3];

  id v6 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  [v6 checkpoint];
}

- (id)backwardPass:(id)a3
{
  v4 = [(MPSCNNNeuronReLUNode *)self->_relu gradientFilterWithSource:a3];
  instNorm = self->_instNorm;
  id v6 = [v4 resultImage];
  v7 = [(MPSCNNInstanceNormalizationNode *)instNorm gradientFilterWithSource:v6];

  conv = self->_conv;
  v9 = [v7 resultImage];
  v10 = [(MPSCNNConvolutionNode *)conv gradientFilterWithSource:v9];

  upsample = self->_upsample;
  v12 = [v10 resultImage];
  v13 = [(MPSCNNUpsamplingNearestNode *)upsample gradientFilterWithSource:v12];

  id v14 = [v13 resultImage];

  return v14;
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

  uint64_t v41 = [NSString stringWithFormat:@"%@%@", v45, @"conv_weight"];
  id v8 = [(MPSCNNConvolutionNode *)self->_conv tc_weightsData];
  v42 = [v8 weightShape];

  v40 = objc_alloc_init(TCMPSStyleTransferWeights);
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
  v19 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  memcpy(v18, (const void *)[v19 betaWeights], v12);

  uint64_t v20 = NSNumber;
  v21 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "styles"));
  v47[0] = v22;
  v23 = NSNumber;
  uint64_t v24 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  uint64_t v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfFeatureChannels"));
  v47[1] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];

  v27 = NSNumber;
  v28 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "styles"));
  v46[0] = v29;
  v30 = NSNumber;
  uint64_t v31 = [(MPSCNNInstanceNormalizationNode *)self->_instNorm tc_weightsData];
  v32 = objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "numberOfFeatureChannels"));
  v46[1] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];

  uint64_t v34 = objc_alloc_init(TCMPSStyleTransferWeights);
  uint64_t v35 = objc_alloc_init(TCMPSStyleTransferWeights);
  [(TCMPSStyleTransferWeights *)v34 setData:v14];
  [(TCMPSStyleTransferWeights *)v34 setShape:v26];
  [(TCMPSStyleTransferWeights *)v35 setData:v17];
  [(TCMPSStyleTransferWeights *)v35 setShape:v33];
  v36 = [NSString stringWithFormat:@"%@%@", v45, @"inst_gamma_weight"];
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

- (MPSCNNUpsamplingNearestNode)upsample
{
  return self->_upsample;
}

- (void)setUpsample:(id)a3
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
  objc_storeStrong((id *)&self->_upsample, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end