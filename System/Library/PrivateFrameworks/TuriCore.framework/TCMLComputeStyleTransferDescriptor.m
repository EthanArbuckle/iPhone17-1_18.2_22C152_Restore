@interface TCMLComputeStyleTransferDescriptor
+ (id)defineVGG16Block1Descriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5;
+ (id)defineVGG16Block2Descriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5;
+ (id)defineVGG16Descriptor:(id)a3;
+ (id)styleNetDescriptor:(id)a3 algorithmType:(int)a4;
+ (void)convolutionLayerDescriptor:(id)a3 normPrefix:(id)a4 descriptorDictionary:(id *)a5 kernelSize:(unint64_t)a6 strideSize:(unint64_t)a7 inputChannels:(unint64_t)a8 outputChannels:(unint64_t)a9 upsampleType:(int)a10;
+ (void)residualDescriptor:(id)a3 normPrefix:(id)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 descriptorDictionary:(id *)a7;
- (BOOL)isComplete;
- (MLCTensor)contentTensor;
- (MLCTensor)inferenceContentTensor;
- (MLCTensor)inferencePixelScaleTensor;
- (MLCTensor)meanTensor;
- (MLCTensor)pixelScaleTensor;
- (MLCTensor)styleLossWeightTensor;
- (MLCTensor)styleTensor;
- (MLCTensor)varianceTensor;
- (NSArray)contentStrength;
- (NSArray)styleStrength;
- (NSDictionary)descriptors;
- (NSDictionary)weights;
- (id)initTrain:(BOOL)a3 algorithmType:(int)a4;
- (void)setContentStrength:(id)a3;
- (void)setContentTensor:(id)a3;
- (void)setDescriptors:(id)a3;
- (void)setInferenceContentTensor:(id)a3;
- (void)setInferencePixelScaleTensor:(id)a3;
- (void)setMeanTensor:(id)a3;
- (void)setPixelScaleTensor:(id)a3;
- (void)setStyleLossWeightTensor:(id)a3;
- (void)setStyleStrength:(id)a3;
- (void)setStyleTensor:(id)a3;
- (void)setVarianceTensor:(id)a3;
- (void)setWeights:(id)a3;
@end

@implementation TCMLComputeStyleTransferDescriptor

- (id)initTrain:(BOOL)a3 algorithmType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  v6 = [(TCMLComputeStyleTransferDescriptor *)self init];
  if (v6)
  {
    if (v5)
    {
      v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8 = +[TCMLComputeStyleTransferDescriptor styleNetDescriptor:@"transformer_" algorithmType:v4];
      [(NSDictionary *)v7 addEntriesFromDictionary:v8];
      v9 = +[TCMLComputeStyleTransferDescriptor defineVGG16Descriptor:@"vgg_"];
      [(NSDictionary *)v7 addEntriesFromDictionary:v9];
      descriptors = v6->_descriptors;
      v6->_descriptors = v7;
    }
    else
    {
      uint64_t v11 = +[TCMLComputeStyleTransferDescriptor styleNetDescriptor:@"transformer_" algorithmType:v4];
      v8 = v6->_descriptors;
      v6->_descriptors = (NSDictionary *)v11;
    }
  }
  return v6;
}

- (BOOL)isComplete
{
  v3 = [(TCMLComputeStyleTransferDescriptor *)self contentTensor];
  if (v3)
  {
    uint64_t v4 = [(TCMLComputeStyleTransferDescriptor *)self descriptors];
    if (v4)
    {
      BOOL v5 = [(TCMLComputeStyleTransferDescriptor *)self weights];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (void)convolutionLayerDescriptor:(id)a3 normPrefix:(id)a4 descriptorDictionary:(id *)a5 kernelSize:(unint64_t)a6 strideSize:(unint64_t)a7 inputChannels:(unint64_t)a8 outputChannels:(unint64_t)a9 upsampleType:(int)a10
{
  v31[2] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  v29 = +[TCMLComputePaddingDescriptor paddingDescriptorWithPaddingSize:a6 >> 1];
  v16 = [NSNumber numberWithUnsignedInteger:a6];
  v31[0] = v16;
  v17 = [NSNumber numberWithUnsignedInteger:a6];
  v31[1] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];

  v19 = [NSNumber numberWithUnsignedInteger:a7];
  v30[0] = v19;
  v20 = [NSNumber numberWithUnsignedInteger:a7];
  v30[1] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];

  v22 = [MEMORY[0x263F105B0] descriptorWithKernelSizes:v18 inputFeatureChannelCount:a8 outputFeatureChannelCount:a9 strides:v21 paddingPolicy:1 paddingSizes:&unk_26D796B30];
  v23 = +[TCMLComputeNormalizationDescriptor normalizationDescriptorWithInputFeatureChannels:a9];
  v24 = [NSString stringWithFormat:@"%@%@", v14, @"_padding"];
  v25 = NSString;
  id v26 = v14;
  v27 = [v25 stringWithFormat:@"%@%@", v15, @"_normalization"];

  [*a5 setObject:v29 forKey:v24];
  [*a5 setObject:v22 forKey:v26];

  [*a5 setObject:v23 forKey:v27];
}

+ (void)residualDescriptor:(id)a3 normPrefix:(id)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 descriptorDictionary:(id *)a7
{
  id v11 = a4;
  id v12 = a3;
  id v24 = +[TCMLComputePaddingDescriptor paddingDescriptorWithPaddingSize:1];
  v23 = +[TCMLComputePaddingDescriptor paddingDescriptorWithPaddingSize:1];
  v22 = [MEMORY[0x263F105B0] descriptorWithKernelSizes:&unk_26D796B48 inputFeatureChannelCount:a5 outputFeatureChannelCount:a6 strides:&unk_26D796B60 paddingPolicy:1 paddingSizes:&unk_26D796B78];
  v19 = [MEMORY[0x263F105B0] descriptorWithKernelSizes:&unk_26D796B48 inputFeatureChannelCount:a5 outputFeatureChannelCount:a6 strides:&unk_26D796B60 paddingPolicy:1 paddingSizes:&unk_26D796B78];
  v21 = +[TCMLComputeNormalizationDescriptor normalizationDescriptorWithInputFeatureChannels:a6];
  v20 = +[TCMLComputeNormalizationDescriptor normalizationDescriptorWithInputFeatureChannels:a6];
  v18 = [NSString stringWithFormat:@"%@%@", v12, @"_conv_1_padding"];
  v13 = [NSString stringWithFormat:@"%@%@", v12, @"_conv_2_padding"];
  id v14 = [NSString stringWithFormat:@"%@%@", v12, @"_conv_1"];
  id v15 = [NSString stringWithFormat:@"%@%@", v12, @"_conv_2"];

  v16 = [NSString stringWithFormat:@"%@%@", v11, @"_instancenorm0__fwd_normalize_normalization"];
  v17 = [NSString stringWithFormat:@"%@%@", v11, @"_instancenorm1__fwd_normalize_normalization"];

  [*a7 setObject:v24 forKey:v18];
  [*a7 setObject:v23 forKey:v13];
  [*a7 setObject:v22 forKey:v14];
  [*a7 setObject:v19 forKey:v15];
  [*a7 setObject:v21 forKey:v16];
  [*a7 setObject:v20 forKey:v17];
}

+ (id)styleNetDescriptor:(id)a3 algorithmType:(int)a4
{
  BOOL v5 = (objc_class *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = [NSString stringWithFormat:@"%@%@", v6, @"encode_1_conv"];
  v44 = (void *)v8;
  v9 = [NSString stringWithFormat:@"%@%@", v6, @"instancenorm0__fwd_normalize"];
  v56 = [NSString stringWithFormat:@"%@%@", v6, @"encode_2_conv"];
  v55 = [NSString stringWithFormat:@"%@%@", v6, @"instancenorm1__fwd_normalize"];
  v54 = [NSString stringWithFormat:@"%@%@", v6, @"encode_3_conv"];
  v53 = [NSString stringWithFormat:@"%@%@", v6, @"instancenorm2__fwd_normalize"];
  v52 = [NSString stringWithFormat:@"%@%@", v6, @"residual_1"];
  v51 = [NSString stringWithFormat:@"%@%@", v6, @"residualblock0"];
  v50 = [NSString stringWithFormat:@"%@%@", v6, @"residual_2"];
  v49 = [NSString stringWithFormat:@"%@%@", v6, @"residualblock1"];
  v48 = [NSString stringWithFormat:@"%@%@", v6, @"residual_3"];
  v47 = [NSString stringWithFormat:@"%@%@", v6, @"residualblock2"];
  v46 = [NSString stringWithFormat:@"%@%@", v6, @"residual_4"];
  v45 = [NSString stringWithFormat:@"%@%@", v6, @"residualblock3"];
  v10 = [NSString stringWithFormat:@"%@%@", v6, @"residual_5"];
  v39 = [NSString stringWithFormat:@"%@%@", v6, @"residualblock4"];
  v41 = [NSString stringWithFormat:@"%@%@", v6, @"decoding_1_conv"];
  v38 = [NSString stringWithFormat:@"%@%@", v6, @"instancenorm3__fwd_normalize"];
  v42 = [NSString stringWithFormat:@"%@%@", v6, @"decoding_2_conv"];
  v40 = [NSString stringWithFormat:@"%@%@", v6, @"instancenorm4__fwd_normalize"];
  v43 = [NSString stringWithFormat:@"%@%@", v6, @"conv5"];

  uint64_t v11 = 32;
  uint64_t v12 = 64;
  uint64_t v13 = 128;
  uint64_t v14 = 3;
  if (a4)
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  if (a4 == 1) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t v37 = v15;
  if (a4 == 1) {
    uint64_t v16 = 32;
  }
  else {
    uint64_t v16 = v13;
  }
  if (a4 == 1) {
    uint64_t v17 = 32;
  }
  else {
    uint64_t v17 = v12;
  }
  v67[0] = v7;
  if (a4 == 1) {
    uint64_t v18 = 32;
  }
  else {
    uint64_t v18 = v11;
  }
  LODWORD(v31) = 0;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:](TCMLComputeStyleTransferDescriptor, "convolutionLayerDescriptor:normPrefix:descriptorDictionary:kernelSize:strideSize:inputChannels:outputChannels:upsampleType:", v8, v9, v67, 9, 1, v18, v31);
  id v19 = v67[0];

  id v66 = v19;
  LODWORD(v32) = 0;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:v56 normPrefix:v55 descriptorDictionary:&v66 kernelSize:3 strideSize:2 inputChannels:v18 outputChannels:v17 upsampleType:v32];
  id v20 = v66;

  id v65 = v20;
  LODWORD(v33) = 0;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:v54 normPrefix:v53 descriptorDictionary:&v65 kernelSize:3 strideSize:2 inputChannels:v17 outputChannels:v16 upsampleType:v33];
  id v21 = v65;

  id v64 = v21;
  +[TCMLComputeStyleTransferDescriptor residualDescriptor:v52 normPrefix:v51 inputChannels:v16 outputChannels:v16 descriptorDictionary:&v64];
  id v22 = v64;

  id v63 = v22;
  +[TCMLComputeStyleTransferDescriptor residualDescriptor:v50 normPrefix:v49 inputChannels:v16 outputChannels:v16 descriptorDictionary:&v63];
  id v23 = v63;

  id v62 = v23;
  +[TCMLComputeStyleTransferDescriptor residualDescriptor:v48 normPrefix:v47 inputChannels:v16 outputChannels:v16 descriptorDictionary:&v62];
  id v24 = v62;

  id v61 = v24;
  +[TCMLComputeStyleTransferDescriptor residualDescriptor:v46 normPrefix:v45 inputChannels:v16 outputChannels:v16 descriptorDictionary:&v61];
  id v25 = v61;

  id v60 = v25;
  +[TCMLComputeStyleTransferDescriptor residualDescriptor:v10 normPrefix:v39 inputChannels:v16 outputChannels:v16 descriptorDictionary:&v60];
  id v26 = v60;

  id v59 = v26;
  LODWORD(v34) = 1;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:v41 normPrefix:v38 descriptorDictionary:&v59 kernelSize:3 strideSize:1 inputChannels:v16 outputChannels:v17 upsampleType:v34];
  id v27 = v59;

  id v58 = v27;
  LODWORD(v35) = 1;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:v42 normPrefix:v40 descriptorDictionary:&v58 kernelSize:3 strideSize:1 inputChannels:v17 outputChannels:v18 upsampleType:v35];
  id v28 = v58;

  id v57 = v28;
  LODWORD(v36) = 0;
  +[TCMLComputeStyleTransferDescriptor convolutionLayerDescriptor:v43 normPrefix:0 descriptorDictionary:&v57 kernelSize:9 strideSize:1 inputChannels:v18 outputChannels:v37 upsampleType:v36];
  id v29 = v57;

  return v29;
}

+ (id)defineVGG16Block1Descriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263F105B0];
  id v8 = a3;
  v9 = [v7 descriptorWithKernelWidth:3 kernelHeight:3 inputFeatureChannelCount:a4 outputFeatureChannelCount:a5];
  v10 = [MEMORY[0x263F105B0] descriptorWithKernelWidth:3 kernelHeight:3 inputFeatureChannelCount:a5 outputFeatureChannelCount:a5];
  uint64_t v11 = [NSString stringWithFormat:@"%@%@", v8, @"conv_1"];
  uint64_t v12 = [NSString stringWithFormat:@"%@%@", v8, @"conv_2"];

  v15[0] = v11;
  v15[1] = v12;
  v16[0] = v9;
  v16[1] = v10;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v13;
}

+ (id)defineVGG16Block2Descriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5
{
  v18[3] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263F105B0];
  id v8 = a3;
  v9 = [v7 descriptorWithKernelWidth:3 kernelHeight:3 inputFeatureChannelCount:a4 outputFeatureChannelCount:a5];
  v10 = [MEMORY[0x263F105B0] descriptorWithKernelWidth:3 kernelHeight:3 inputFeatureChannelCount:a5 outputFeatureChannelCount:a5];
  uint64_t v11 = [MEMORY[0x263F105B0] descriptorWithKernelWidth:3 kernelHeight:3 inputFeatureChannelCount:a5 outputFeatureChannelCount:a5];
  uint64_t v12 = [NSString stringWithFormat:@"%@%@", v8, @"conv_1"];
  uint64_t v13 = [NSString stringWithFormat:@"%@%@", v8, @"conv_2"];
  uint64_t v14 = [NSString stringWithFormat:@"%@%@", v8, @"conv_3"];

  v17[0] = v12;
  v17[1] = v13;
  v18[0] = v9;
  v18[1] = v10;
  v17[2] = v14;
  v18[2] = v11;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  return v15;
}

+ (id)defineVGG16Descriptor:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v14 = [NSString stringWithFormat:@"%@%@", v4, @"block_1_"];
  id v6 = +[TCMLComputeStyleTransferDescriptor defineVGG16Block1Descriptor:v14 inputChannels:3 outputChannels:64];
  [v5 addEntriesFromDictionary:v6];
  id v7 = [NSString stringWithFormat:@"%@%@", v4, @"block_2_"];
  id v8 = +[TCMLComputeStyleTransferDescriptor defineVGG16Block1Descriptor:v7 inputChannels:64 outputChannels:128];
  [v5 addEntriesFromDictionary:v8];
  v9 = [NSString stringWithFormat:@"%@%@", v4, @"block_3_"];
  v10 = +[TCMLComputeStyleTransferDescriptor defineVGG16Block2Descriptor:v9 inputChannels:128 outputChannels:256];
  [v5 addEntriesFromDictionary:v10];
  uint64_t v11 = [NSString stringWithFormat:@"%@%@", v4, @"block_4_"];

  uint64_t v12 = +[TCMLComputeStyleTransferDescriptor defineVGG16Block2Descriptor:v11 inputChannels:256 outputChannels:512];
  [v5 addEntriesFromDictionary:v12];

  return v5;
}

- (MLCTensor)contentTensor
{
  return self->_contentTensor;
}

- (void)setContentTensor:(id)a3
{
}

- (MLCTensor)inferenceContentTensor
{
  return self->_inferenceContentTensor;
}

- (void)setInferenceContentTensor:(id)a3
{
}

- (MLCTensor)inferencePixelScaleTensor
{
  return self->_inferencePixelScaleTensor;
}

- (void)setInferencePixelScaleTensor:(id)a3
{
}

- (MLCTensor)styleTensor
{
  return self->_styleTensor;
}

- (void)setStyleTensor:(id)a3
{
}

- (MLCTensor)pixelScaleTensor
{
  return self->_pixelScaleTensor;
}

- (void)setPixelScaleTensor:(id)a3
{
}

- (MLCTensor)meanTensor
{
  return self->_meanTensor;
}

- (void)setMeanTensor:(id)a3
{
}

- (MLCTensor)varianceTensor
{
  return self->_varianceTensor;
}

- (void)setVarianceTensor:(id)a3
{
}

- (MLCTensor)styleLossWeightTensor
{
  return self->_styleLossWeightTensor;
}

- (void)setStyleLossWeightTensor:(id)a3
{
}

- (NSArray)styleStrength
{
  return self->_styleStrength;
}

- (void)setStyleStrength:(id)a3
{
}

- (NSArray)contentStrength
{
  return self->_contentStrength;
}

- (void)setContentStrength:(id)a3
{
}

- (NSDictionary)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
}

- (NSDictionary)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_contentStrength, 0);
  objc_storeStrong((id *)&self->_styleStrength, 0);
  objc_storeStrong((id *)&self->_styleLossWeightTensor, 0);
  objc_storeStrong((id *)&self->_varianceTensor, 0);
  objc_storeStrong((id *)&self->_meanTensor, 0);
  objc_storeStrong((id *)&self->_pixelScaleTensor, 0);
  objc_storeStrong((id *)&self->_styleTensor, 0);
  objc_storeStrong((id *)&self->_inferencePixelScaleTensor, 0);
  objc_storeStrong((id *)&self->_inferenceContentTensor, 0);
  objc_storeStrong((id *)&self->_contentTensor, 0);
}

@end