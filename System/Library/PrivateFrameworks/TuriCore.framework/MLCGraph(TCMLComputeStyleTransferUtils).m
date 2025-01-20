@interface MLCGraph(TCMLComputeStyleTransferUtils)
- (id)activationLayer:()TCMLComputeStyleTransferUtils neuronType:descriptors:prefix:;
- (id)convolutionLayer:()TCMLComputeStyleTransferUtils weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:;
- (id)defineTraining:()TCMLComputeStyleTransferUtils style:pixelScale:mean:variance:styleLossWeightTensor:weights:stopGradientList:descriptors:lossTensorDictionary:algorithm:;
- (id)maxPoolingLayer:()TCMLComputeStyleTransferUtils kernelSize:stride:;
- (id)normalizationLayer:()TCMLComputeStyleTransferUtils normalizationType:weights:descriptors:prefix:;
- (id)paddingLayer:()TCMLComputeStyleTransferUtils paddingType:descriptors:prefix:;
- (id)residualLayer:()TCMLComputeStyleTransferUtils weights:normalizationType:paddingType:neuronType:descriptors:convPrefix:normPrefix:;
- (id)styleNetwork:()TCMLComputeStyleTransferUtils pixelScale:weights:descriptors:prefix:algorithm:;
- (id)upsampleLayer:()TCMLComputeStyleTransferUtils upsampleType:descriptors:prefix:kernel:;
- (id)vgg16:()TCMLComputeStyleTransferUtils weights:descriptors:prefix:;
- (id)vggConvolutionWithRelu:()TCMLComputeStyleTransferUtils weights:descriptors:prefix:;
- (id)vggConvolutionalBlock:()TCMLComputeStyleTransferUtils numConvLayers:weights:descriptors:prefix:;
- (id)vggPreprocessing:()TCMLComputeStyleTransferUtils variance:mean:;
@end

@implementation MLCGraph(TCMLComputeStyleTransferUtils)

- (id)activationLayer:()TCMLComputeStyleTransferUtils neuronType:descriptors:prefix:
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  switch(a4)
  {
    case 0:
      id v14 = v10;
      goto LABEL_10;
    case 2:
      uint64_t v13 = [MEMORY[0x263F10588] descriptorWithType:3];
      break;
    case 1:
      uint64_t v13 = [MEMORY[0x263F10588] descriptorWithType:1 a:0.0];
      break;
    default:
      v15 = 0;
      goto LABEL_9;
  }
  v15 = (void *)v13;
LABEL_9:
  v16 = [MEMORY[0x263F10590] layerWithDescriptor:v15];
  id v14 = [a1 nodeWithLayer:v16 source:v10];

LABEL_10:
  return v14;
}

- (id)normalizationLayer:()TCMLComputeStyleTransferUtils normalizationType:weights:descriptors:prefix:
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (!a4)
  {
    id v32 = v12;
    goto LABEL_10;
  }
  v38 = a1;
  v15 = NSString;
  id v16 = a6;
  v17 = [v15 stringWithFormat:@"%@%@", v14, @"_beta"];
  v18 = [NSString stringWithFormat:@"%@%@", v14, @"_gamma"];
  v19 = [NSString stringWithFormat:@"%@%@", v14, @"_normalization"];
  v20 = [v16 objectForKeyedSubscript:v19];

  uint64_t v21 = [v20 inputFeatureChannelCount];
  v22 = [v13 objectForKeyedSubscript:v17];
  v23 = [v13 objectForKeyedSubscript:v18];
  if (a4 == 2)
  {
    LODWORD(v24) = 925353388;
    v25 = [MEMORY[0x263F105F0] layerWithFeatureChannelCount:v21 beta:v22 gamma:v23 varianceEpsilon:v24 momentum:0.0];
    id v32 = [v38 nodeWithLayer:v25 source:v12];
  }
  else
  {
    if (a4 != 1)
    {
      id v32 = 0;
      goto LABEL_9;
    }
    v25 = [NSString stringWithFormat:@"%@%@", v14, @"_running_mean"];
    v36 = [NSString stringWithFormat:@"%@%@", v14, @"_running_var"];
    v35 = [v13 objectForKeyedSubscript:v25];
    [v13 objectForKeyedSubscript:v36];
    v34 = v37 = v18;
    LODWORD(v26) = 925353388;
    [MEMORY[0x263F105A8] layerWithFeatureChannelCount:v21 mean:v35 variance:v34 beta:v22 gamma:v23 varianceEpsilon:v26 momentum:0.0];
    v27 = v23;
    v28 = v22;
    v29 = v19;
    v31 = v30 = v17;
    id v32 = [v38 nodeWithLayer:v31 source:v12];

    v17 = v30;
    v19 = v29;
    v22 = v28;
    v23 = v27;

    v18 = v37;
  }

LABEL_9:
LABEL_10:

  return v32;
}

- (id)upsampleLayer:()TCMLComputeStyleTransferUtils upsampleType:descriptors:prefix:kernel:
{
  v19[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = v10;
  if (a4)
  {
    id v12 = +[TCMLComputeUpsamplingDescriptor upsamplingDescriptorWithKernelWidth:a7 kernelHeight:a7];
    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "kernelHeight"));
    v19[0] = v13;
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "kernelWidth"));
    v19[1] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];

    if (a4 == 1)
    {
      id v16 = [MEMORY[0x263F10688] layerWithShape:v15 sampleMode:0 alignsCorners:0];
      id v17 = [a1 nodeWithLayer:v16 source:v11];
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = v10;
  }

  return v17;
}

- (id)paddingLayer:()TCMLComputeStyleTransferUtils paddingType:descriptors:prefix:
{
  v25[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = v10;
  if (!a4)
  {
    id v22 = v10;
    goto LABEL_10;
  }
  id v12 = NSString;
  id v13 = a5;
  id v14 = [v12 stringWithFormat:@"%@%@", a6, @"_padding"];
  v15 = [v13 objectForKeyedSubscript:v14];

  id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "paddingSizeInX"));
  v25[0] = v16;
  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "paddingSizeInY"));
  v25[1] = v17;
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "paddingSizeInX"));
  v25[2] = v18;
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "paddingSizeInY"));
  v25[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];

  if (a4 == 2)
  {
    uint64_t v21 = [MEMORY[0x263F10620] layerWithReflectionPadding:v20];
  }
  else
  {
    if (a4 != 1)
    {
      id v22 = 0;
      goto LABEL_9;
    }
    uint64_t v21 = [MEMORY[0x263F10620] layerWithZeroPadding:v20];
  }
  v23 = (void *)v21;
  id v22 = [a1 nodeWithLayer:v21 source:v11];

LABEL_9:
LABEL_10:

  return v22;
}

- (id)convolutionLayer:()TCMLComputeStyleTransferUtils weights:normalizationType:paddingType:neuronType:upsampleType:descriptors:convPrefix:normPrefix:
{
  id v15 = a10;
  id v36 = a11;
  id v16 = a9;
  id v17 = a4;
  id v18 = a3;
  v19 = [v18 descriptor];
  v20 = [v19 shape];
  uint64_t v21 = [v20 lastObject];
  uint64_t v22 = (int)(2 * [v21 intValue]);

  v37 = [a1 upsampleLayer:v18 upsampleType:a8 descriptors:v16 prefix:v15 kernel:v22];

  id v32 = [a1 paddingLayer:v37 paddingType:a6 descriptors:v16 prefix:v15];
  v35 = [NSString stringWithFormat:@"%@%@", v15, @"_weight"];
  v33 = [NSString stringWithFormat:@"%@%@", v15, @"_bias"];
  id v23 = v15;
  v31 = [v17 objectForKeyedSubscript:v35];
  double v24 = [v17 objectForKeyedSubscript:v33];
  v25 = [v16 objectForKeyedSubscript:v23];
  double v26 = [MEMORY[0x263F105B8] layerWithWeights:v31 biases:v24 descriptor:v25];
  v27 = [a1 nodeWithLayer:v26 source:v32];
  v28 = [a1 normalizationLayer:v27 normalizationType:a5 weights:v17 descriptors:v16 prefix:v36];

  v29 = [a1 activationLayer:v28 neuronType:a7 descriptors:v16 prefix:v23];

  return v29;
}

- (id)residualLayer:()TCMLComputeStyleTransferUtils weights:normalizationType:paddingType:neuronType:descriptors:convPrefix:normPrefix:
{
  v34[2] = *MEMORY[0x263EF8340];
  id v13 = NSString;
  id v14 = a10;
  id v15 = a9;
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  v29 = [v13 stringWithFormat:@"%@%@", v15, @"_conv_1"];
  v31 = [NSString stringWithFormat:@"%@%@", v14, @"_instancenorm0__fwd_normalize"];
  v19 = [NSString stringWithFormat:@"%@%@", v15, @"_conv_2"];

  uint64_t v20 = [NSString stringWithFormat:@"%@%@", v14, @"_instancenorm1__fwd_normalize"];

  uint64_t v21 = [a1 convolutionLayer:v18 weights:v17 normalizationType:a5 paddingType:a6 neuronType:a7 upsampleType:0 descriptors:v16 convPrefix:v29 normPrefix:v31];
  uint64_t v22 = (void *)v20;
  id v23 = [a1 convolutionLayer:v21 weights:v17 normalizationType:a5 paddingType:a6 neuronType:0 upsampleType:0 descriptors:v16 convPrefix:v19 normPrefix:v20];

  double v24 = [MEMORY[0x263F105A0] layerWithOperation:0];
  v34[0] = v18;
  v34[1] = v23;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];

  double v26 = [a1 nodeWithLayer:v24 sources:v25];

  return v26;
}

- (id)styleNetwork:()TCMLComputeStyleTransferUtils pixelScale:weights:descriptors:prefix:algorithm:
{
  v58[2] = *MEMORY[0x263EF8340];
  id v14 = (void *)MEMORY[0x263F105A0];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v49 = a4;
  id v50 = a3;
  v57 = [v14 layerWithOperation:2];
  v58[0] = v50;
  v58[1] = v49;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
  uint64_t v19 = [a1 nodeWithLayer:v57 sources:v18];
  v55 = (void *)v19;

  if (a8) {
    uint64_t v20 = a8 == 1;
  }
  else {
    uint64_t v20 = 2;
  }
  v56 = [NSString stringWithFormat:@"%@%@", v15, @"encode_1_conv"];
  v54 = [NSString stringWithFormat:@"%@%@", v15, @"instancenorm0__fwd_normalize"];
  v53 = [a1 convolutionLayer:v19 weights:v17 normalizationType:v20 paddingType:v20 neuronType:1 upsampleType:0 descriptors:v16 convPrefix:v56 normPrefix:v54];
  v52 = [NSString stringWithFormat:@"%@%@", v15, @"encode_2_conv"];
  v51 = [NSString stringWithFormat:@"%@%@", v15, @"instancenorm1__fwd_normalize"];
  v48 = [a1 convolutionLayer:v53 weights:v17 normalizationType:v20 paddingType:v20 neuronType:1 upsampleType:0 descriptors:v16 convPrefix:v52 normPrefix:v51];
  v47 = [NSString stringWithFormat:@"%@%@", v15, @"encode_3_conv"];
  v46 = [NSString stringWithFormat:@"%@%@", v15, @"instancenorm2__fwd_normalize"];
  v45 = [a1 convolutionLayer:v48 weights:v17 normalizationType:v20 paddingType:v20 neuronType:1 upsampleType:0 descriptors:v16 convPrefix:v47 normPrefix:v46];
  v44 = [NSString stringWithFormat:@"%@%@", v15, @"residual_1"];
  v43 = [NSString stringWithFormat:@"%@%@", v15, @"residualblock0"];
  v42 = [a1 residualLayer:v45 weights:v17 normalizationType:v20 paddingType:v20 neuronType:1 descriptors:v16 convPrefix:v44 normPrefix:v43];
  v41 = [NSString stringWithFormat:@"%@%@", v15, @"residual_2"];
  v40 = [NSString stringWithFormat:@"%@%@", v15, @"residualblock1"];
  v39 = [a1 residualLayer:v42 weights:v17 normalizationType:v20 paddingType:v20 neuronType:1 descriptors:v16 convPrefix:v41 normPrefix:v40];
  v38 = [NSString stringWithFormat:@"%@%@", v15, @"residual_3"];
  v37 = [NSString stringWithFormat:@"%@%@", v15, @"residualblock2"];
  id v36 = [a1 residualLayer:v39 weights:v17 normalizationType:v20 paddingType:v20 neuronType:1 descriptors:v16 convPrefix:v38 normPrefix:v37];
  v35 = [NSString stringWithFormat:@"%@%@", v15, @"residual_4"];
  v34 = [NSString stringWithFormat:@"%@%@", v15, @"residualblock3"];
  v33 = [a1 residualLayer:v36 weights:v17 normalizationType:v20 paddingType:v20 neuronType:1 descriptors:v16 convPrefix:v35 normPrefix:v34];
  id v32 = [NSString stringWithFormat:@"%@%@", v15, @"residual_5"];
  v31 = [NSString stringWithFormat:@"%@%@", v15, @"residualblock4"];
  v30 = [a1 residualLayer:v33 weights:v17 normalizationType:v20 paddingType:v20 neuronType:1 descriptors:v16 convPrefix:v32 normPrefix:v31];
  v29 = [NSString stringWithFormat:@"%@%@", v15, @"decoding_1_conv"];
  v28 = [NSString stringWithFormat:@"%@%@", v15, @"instancenorm3__fwd_normalize"];
  v27 = [a1 convolutionLayer:v30 weights:v17 normalizationType:v20 paddingType:v20 neuronType:1 upsampleType:1 descriptors:v16 convPrefix:v29 normPrefix:v28];
  uint64_t v21 = [NSString stringWithFormat:@"%@%@", v15, @"decoding_2_conv"];
  uint64_t v22 = [NSString stringWithFormat:@"%@%@", v15, @"instancenorm4__fwd_normalize"];
  id v23 = [a1 convolutionLayer:v27 weights:v17 normalizationType:v20 paddingType:v20 neuronType:1 upsampleType:1 descriptors:v16 convPrefix:v21 normPrefix:v22];
  double v24 = [NSString stringWithFormat:@"%@%@", v15, @"conv5"];

  v25 = [a1 convolutionLayer:v23 weights:v17 normalizationType:0 paddingType:v20 neuronType:2 upsampleType:0 descriptors:v16 convPrefix:v24 normPrefix:0];

  return v25;
}

- (id)vggConvolutionWithRelu:()TCMLComputeStyleTransferUtils weights:descriptors:prefix:
{
  v28[1] = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = NSString;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v27 = [v11 stringWithFormat:@"%@%@", v10, @"_weight"];
  double v26 = [NSString stringWithFormat:@"%@%@", v10, @"_bias"];
  id v15 = v10;
  id v16 = [v13 objectForKeyedSubscript:v27];
  id v17 = [v13 objectForKeyedSubscript:v26];

  id v18 = [v12 objectForKeyedSubscript:v15];

  uint64_t v19 = [MEMORY[0x263F105B8] layerWithWeights:v16 biases:v17 descriptor:v18];
  v28[0] = v14;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  uint64_t v21 = [a1 nodeWithLayer:v19 sources:v20 disableUpdate:1];

  uint64_t v22 = [MEMORY[0x263F10588] descriptorWithType:1 a:0.0];
  id v23 = [MEMORY[0x263F10590] layerWithDescriptor:v22];

  double v24 = [a1 nodeWithLayer:v23 source:v21];

  return v24;
}

- (id)maxPoolingLayer:()TCMLComputeStyleTransferUtils kernelSize:stride:
{
  v8 = (void *)MEMORY[0x263F10628];
  id v9 = a3;
  id v10 = [v8 poolingDescriptorWithType:1 kernelSize:a4 stride:a5];
  id v11 = [MEMORY[0x263F10630] layerWithDescriptor:v10];
  id v12 = [a1 nodeWithLayer:v11 source:v9];

  return v12;
}

- (id)vggConvolutionalBlock:()TCMLComputeStyleTransferUtils numConvLayers:weights:descriptors:prefix:
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = v12;
  id v23 = v15;
  if ((unint64_t)(a4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    id v17 = 0;
    uint64_t v21 = v15;
  }
  else
  {
    uint64_t v16 = 0;
    id v17 = 0;
    id v18 = v15;
    do
    {
      uint64_t v19 = [NSString stringWithFormat:@"%@%d", a7, ++v16];
      uint64_t v20 = [a1 vggConvolutionWithRelu:v18 weights:v13 descriptors:v14 prefix:v19];

      id v17 = v20;
      uint64_t v21 = v17;
      id v18 = v17;
    }
    while (a4 != v16);
  }

  return v21;
}

- (id)vgg16:()TCMLComputeStyleTransferUtils weights:descriptors:prefix:
{
  v28[4] = *MEMORY[0x263EF8340];
  id v10 = NSString;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v27 = [v10 stringWithFormat:@"%@%@", v11, @"block_1_conv_"];
  double v26 = [NSString stringWithFormat:@"%@%@", v11, @"block_2_conv_"];
  id v15 = [NSString stringWithFormat:@"%@%@", v11, @"block_3_conv_"];
  double v24 = [NSString stringWithFormat:@"%@%@", v11, @"block_4_conv_"];

  uint64_t v16 = [a1 vggConvolutionalBlock:v14 numConvLayers:2 weights:v13 descriptors:v12 prefix:v27];

  v25 = [a1 maxPoolingLayer:v16 kernelSize:2 stride:2];
  id v17 = [a1 vggConvolutionalBlock:v25 numConvLayers:2 weights:v13 descriptors:v12 prefix:v26];
  id v18 = [a1 maxPoolingLayer:v17 kernelSize:2 stride:2];
  uint64_t v19 = [a1 vggConvolutionalBlock:v18 numConvLayers:3 weights:v13 descriptors:v12 prefix:v15];
  uint64_t v20 = [a1 maxPoolingLayer:v19 kernelSize:2 stride:2];
  uint64_t v21 = [a1 vggConvolutionalBlock:v20 numConvLayers:3 weights:v13 descriptors:v12 prefix:v24];

  v28[0] = v16;
  v28[1] = v17;
  void v28[2] = v19;
  v28[3] = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];

  return v22;
}

- (id)vggPreprocessing:()TCMLComputeStyleTransferUtils variance:mean:
{
  v20[2] = *MEMORY[0x263EF8340];
  v8 = (void *)MEMORY[0x263F105A0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 layerWithOperation:1];
  v20[0] = v11;
  v20[1] = v9;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  id v14 = [a1 nodeWithLayer:v12 sources:v13];

  id v15 = [MEMORY[0x263F105A0] layerWithOperation:2];
  v19[0] = v14;
  v19[1] = v10;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];

  id v17 = [a1 nodeWithLayer:v15 sources:v16];

  return v17;
}

- (id)defineTraining:()TCMLComputeStyleTransferUtils style:pixelScale:mean:variance:styleLossWeightTensor:weights:stopGradientList:descriptors:lossTensorDictionary:algorithm:
{
  v167[1] = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v146 = a8;
  id v24 = a9;
  id v147 = a10;
  id v25 = a11;
  id v127 = a12;
  uint64_t v26 = [a1 vggPreprocessing:v19 variance:v23 mean:v22];
  v133 = v20;
  uint64_t v27 = [a1 vggPreprocessing:v20 variance:v23 mean:v22];
  v126 = (void *)v26;
  v28 = [a1 vgg16:v26 weights:v24 descriptors:v25 prefix:@"vgg_"];
  v125 = (void *)v27;
  v29 = [a1 vgg16:v27 weights:v24 descriptors:v25 prefix:@"vgg_"];
  v134 = v19;
  v132 = v21;
  v123 = [a1 styleNetwork:v19 pixelScale:v21 weights:v24 descriptors:v25 prefix:@"transformer_" algorithm:a13];
  v130 = v23;
  v131 = v22;
  v122 = objc_msgSend(a1, "vggPreprocessing:variance:mean:");
  v128 = v25;
  v129 = v24;
  v30 = objc_msgSend(a1, "vgg16:weights:descriptors:prefix:");
  v31 = [MEMORY[0x263F10610] meanSquaredErrorLossWithReductionType:2 weights:0];
  v145 = v30;
  id v32 = [v30 objectAtIndexedSubscript:2];
  v167[0] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v167 count:1];
  v34 = [v28 objectAtIndexedSubscript:2];
  v166 = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v166 count:1];
  v121 = a1;
  v120 = [a1 nodeWithLayer:v31 sources:v33 lossLabels:v35];

  id v36 = [v28 objectAtIndexedSubscript:0];
  [v147 addObject:v36];

  v37 = [v28 objectAtIndexedSubscript:1];
  [v147 addObject:v37];

  v38 = [v28 objectAtIndexedSubscript:2];
  [v147 addObject:v38];

  v124 = v28;
  v39 = [v28 objectAtIndexedSubscript:3];
  [v147 addObject:v39];

  v40 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v29, "count"));
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id v41 = v29;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v148 objects:v165 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v149;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v149 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = [*(id *)(*((void *)&v148 + 1) + 8 * i) descriptor];
        v47 = [v46 shape];

        float v49 = 1.0;
        if ((unint64_t)[v47 count] >= 2)
        {
          unint64_t v50 = 1;
          do
          {
            v51 = [v47 objectAtIndexedSubscript:v50];
            [v51 floatValue];
            float v49 = v49 * v52;

            ++v50;
          }
          while ([v47 count] > v50);
        }
        *(float *)&double v48 = 1.0 / v49;
        v53 = [NSNumber numberWithFloat:v48];
        [v40 addObject:v53];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v148 objects:v165 count:16];
    }
    while (v43);
  }

  v54 = (void *)MEMORY[0x263F105D8];
  v55 = [v40 objectAtIndexedSubscript:0];
  [v55 floatValue];
  v119 = objc_msgSend(v54, "layerWithScale:");

  v56 = (void *)MEMORY[0x263F105D8];
  v57 = [v40 objectAtIndexedSubscript:1];
  [v57 floatValue];
  v118 = objc_msgSend(v56, "layerWithScale:");

  v58 = (void *)MEMORY[0x263F105D8];
  v59 = [v40 objectAtIndexedSubscript:2];
  [v59 floatValue];
  v117 = objc_msgSend(v58, "layerWithScale:");

  v60 = (void *)MEMORY[0x263F105D8];
  v61 = [v40 objectAtIndexedSubscript:3];
  [v61 floatValue];
  v116 = objc_msgSend(v60, "layerWithScale:");

  v62 = [v41 objectAtIndexedSubscript:0];
  v141 = [v121 nodeWithLayer:v119 source:v62];

  v63 = [v41 objectAtIndexedSubscript:1];
  v142 = [v121 nodeWithLayer:v118 source:v63];

  v64 = [v41 objectAtIndexedSubscript:2];
  v143 = [v121 nodeWithLayer:v117 source:v64];

  v65 = [v41 objectAtIndexedSubscript:3];
  v144 = [v121 nodeWithLayer:v116 source:v65];

  v66 = [v41 objectAtIndexedSubscript:0];
  [v147 addObject:v66];

  v67 = [v41 objectAtIndexedSubscript:1];
  [v147 addObject:v67];

  v68 = [v41 objectAtIndexedSubscript:2];
  [v147 addObject:v68];

  v69 = [v41 objectAtIndexedSubscript:3];
  [v147 addObject:v69];

  [v147 addObject:v141];
  [v147 addObject:v142];
  [v147 addObject:v143];
  [v147 addObject:v144];
  v70 = (void *)MEMORY[0x263F105D8];
  v71 = [v40 objectAtIndexedSubscript:0];
  [v71 floatValue];
  v115 = objc_msgSend(v70, "layerWithScale:");

  v72 = (void *)MEMORY[0x263F105D8];
  v73 = [v40 objectAtIndexedSubscript:1];
  [v73 floatValue];
  v114 = objc_msgSend(v72, "layerWithScale:");

  v74 = (void *)MEMORY[0x263F105D8];
  v75 = [v40 objectAtIndexedSubscript:2];
  [v75 floatValue];
  v113 = objc_msgSend(v74, "layerWithScale:");

  v76 = (void *)MEMORY[0x263F105D8];
  v77 = [v40 objectAtIndexedSubscript:3];
  [v77 floatValue];
  v112 = objc_msgSend(v76, "layerWithScale:");

  v78 = [v145 objectAtIndexedSubscript:0];
  v111 = [v121 nodeWithLayer:v115 source:v78];

  v79 = [v145 objectAtIndexedSubscript:1];
  v109 = [v121 nodeWithLayer:v114 source:v79];

  v80 = [v145 objectAtIndexedSubscript:2];
  v139 = [v121 nodeWithLayer:v113 source:v80];

  v81 = [v145 objectAtIndexedSubscript:3];
  v140 = [v121 nodeWithLayer:v112 source:v81];

  v110 = [MEMORY[0x263F10610] meanSquaredErrorLossWithReductionType:2 weights:0];
  v108 = [MEMORY[0x263F10610] meanSquaredErrorLossWithReductionType:2 weights:0];
  v138 = [MEMORY[0x263F10610] meanSquaredErrorLossWithReductionType:2 weights:0];
  v137 = [MEMORY[0x263F10610] meanSquaredErrorLossWithReductionType:2 weights:0];
  v164 = v111;
  v82 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v164 count:1];
  v163 = v141;
  v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v163 count:1];
  v136 = [v121 nodeWithLayer:v110 sources:v82 lossLabels:v83];

  v162 = v109;
  v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v162 count:1];
  v161 = v142;
  v85 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v161 count:1];
  v135 = [v121 nodeWithLayer:v108 sources:v84 lossLabels:v85];

  v160 = v139;
  v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v160 count:1];
  v159 = v143;
  v87 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v159 count:1];
  v106 = [v121 nodeWithLayer:v138 sources:v86 lossLabels:v87];

  v158 = v140;
  v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v158 count:1];
  v157 = v144;
  v89 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v157 count:1];
  v105 = [v121 nodeWithLayer:v137 sources:v88 lossLabels:v89];

  v107 = [MEMORY[0x263F105A0] layerWithOperation:0];
  v104 = [MEMORY[0x263F105A0] layerWithOperation:0];
  v101 = [MEMORY[0x263F105A0] layerWithOperation:0];
  v156[0] = v136;
  v156[1] = v135;
  v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v156 count:2];
  v103 = [v121 nodeWithLayer:v107 sources:v90];

  v155[0] = v106;
  v155[1] = v105;
  v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:v155 count:2];
  v102 = [v121 nodeWithLayer:v104 sources:v91];

  v154[0] = v103;
  v154[1] = v102;
  v92 = [MEMORY[0x263EFF8C0] arrayWithObjects:v154 count:2];
  v93 = [v121 nodeWithLayer:v101 sources:v92];

  v94 = [MEMORY[0x263F105A0] layerWithOperation:2];
  v153[0] = v93;
  v153[1] = v146;
  v95 = [MEMORY[0x263EFF8C0] arrayWithObjects:v153 count:2];
  v96 = [v121 nodeWithLayer:v94 sources:v95];

  v97 = [MEMORY[0x263F105A0] layerWithOperation:0];
  v152[0] = v96;
  v152[1] = v120;
  v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:v152 count:2];
  v99 = [v121 nodeWithLayer:v97 sources:v98];

  [v127 setObject:v120 forKey:@"content_loss"];
  [v127 setObject:v96 forKey:@"style_loss"];

  return v99;
}

@end