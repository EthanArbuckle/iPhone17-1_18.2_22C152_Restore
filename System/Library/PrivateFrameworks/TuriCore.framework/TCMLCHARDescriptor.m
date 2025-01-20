@interface TCMLCHARDescriptor
+ (id)defineGraphConvDescriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5 numKeypoints:(unint64_t)a6 temporalKernelSize:(unint64_t)a7 stride:(unint64_t)a8 dropout:(float)a9;
+ (id)defineResidualDescriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5 stride:(unint64_t)a6;
+ (id)defineSTGCNActionDescriptor:(id)a3 inputChannels:(unint64_t)a4 batchSize:(unint64_t)a5 numFrames:(unint64_t)a6 numKeypoints:(unint64_t)a7 numClass:(unint64_t)a8 dropout:(float)a9;
+ (id)defineSTGCNDescriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5 numKeypoints:(unint64_t)a6 temporalKernelSize:(unint64_t)a7 stride:(unint64_t)a8 dropout:(float)a9 residual:(BOOL)a10;
+ (id)defineTemporalConvolutionalNetworkDescriptor:(id)a3 channels:(unint64_t)a4 temporalKernelSize:(unint64_t)a5 stride:(unint64_t)a6 dropout:(float)a7;
@end

@implementation TCMLCHARDescriptor

+ (id)defineResidualDescriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5 stride:(unint64_t)a6
{
  v21[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = objc_opt_new();
  v12 = [NSString stringWithFormat:@"%@%@", v9, @"conv"];
  v13 = (void *)MEMORY[0x263F105B0];
  v14 = [NSNumber numberWithUnsignedInteger:a6];
  v21[0] = v14;
  v21[1] = &unk_26D796620;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  v16 = [v13 descriptorWithKernelSizes:&unk_26D796908 inputFeatureChannelCount:a4 outputFeatureChannelCount:a5 strides:v15 paddingPolicy:1 paddingSizes:0];

  [v10 setObject:v16 forKeyedSubscript:v12];
  v17 = [NSString stringWithFormat:@"%@%@", v9, @"batch_norm"];

  v18 = [NSNumber numberWithUnsignedInteger:a5];
  [v11 setObject:v18 forKeyedSubscript:v17];

  v19 = objc_opt_new();
  [v19 setConvDescs:v10];
  [v19 setBatchNormDescs:v11];

  return v19;
}

+ (id)defineTemporalConvolutionalNetworkDescriptor:(id)a3 channels:(unint64_t)a4 temporalKernelSize:(unint64_t)a5 stride:(unint64_t)a6 dropout:(float)a7
{
  v37[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  v32 = objc_opt_new();
  v31 = objc_opt_new();
  v33 = objc_opt_new();
  v34 = [NSString stringWithFormat:@"%@%@", v11, @"batch_norm_0"];
  v12 = [NSNumber numberWithUnsignedInteger:a4];
  [v31 setObject:v12 forKeyedSubscript:v34];

  uint64_t v13 = [NSString stringWithFormat:@"%@%@", v11, @"conv"];
  unint64_t v14 = (a5 - 1) >> 1;
  v28 = (void *)MEMORY[0x263F105B0];
  v30 = (void *)v13;
  v15 = [NSNumber numberWithUnsignedInteger:a5];
  v37[0] = v15;
  v37[1] = &unk_26D796620;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
  v17 = [NSNumber numberWithUnsignedInteger:a6];
  v36[0] = v17;
  v36[1] = &unk_26D796620;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  v19 = [NSNumber numberWithUnsignedInteger:v14];
  v35[0] = v19;
  v35[1] = &unk_26D796638;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  v29 = [v28 descriptorWithKernelSizes:v16 inputFeatureChannelCount:a4 outputFeatureChannelCount:a4 strides:v18 paddingPolicy:2 paddingSizes:v20];

  [v32 setObject:v29 forKeyedSubscript:v30];
  v21 = [NSString stringWithFormat:@"%@%@", v11, @"batch_norm_1"];
  v22 = [NSNumber numberWithUnsignedInteger:a4];
  [v31 setObject:v22 forKeyedSubscript:v21];

  v23 = [NSString stringWithFormat:@"%@%@", v11, @"dropout"];

  *(float *)&double v24 = a7;
  v25 = [NSNumber numberWithFloat:v24];
  [v33 setObject:v25 forKeyedSubscript:v23];

  v26 = objc_opt_new();
  [v26 setConvDescs:v32];
  [v26 setBatchNormDescs:v31];
  [v26 setDropoutDescs:v33];

  return v26;
}

+ (id)defineGraphConvDescriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5 numKeypoints:(unint64_t)a6 temporalKernelSize:(unint64_t)a7 stride:(unint64_t)a8 dropout:(float)a9
{
  id v12 = a3;
  uint64_t v13 = objc_opt_new();
  unint64_t v14 = objc_opt_new();
  v28 = objc_opt_new();
  v15 = objc_opt_new();
  v36 = [NSString stringWithFormat:@"%@%@", v12, @"conv_1"];
  v35 = [MEMORY[0x263F105B0] descriptorWithKernelSizes:&unk_26D796920 inputFeatureChannelCount:a4 outputFeatureChannelCount:3 * a5 strides:&unk_26D796938 paddingPolicy:1 paddingSizes:0];
  [v13 setObject:v35 forKeyedSubscript:v36];
  v34 = [NSString stringWithFormat:@"%@%@", v12, @"chunk_1"];
  [v14 setObject:&unk_26D796950 forKeyedSubscript:v34];
  v31 = [NSString stringWithFormat:@"%@%@", v12, @"cat_1"];
  [v28 setObject:&unk_26D796668 forKeyedSubscript:v31];
  v30 = [NSString stringWithFormat:@"%@%@", v12, @"transpose_1"];
  [v15 setObject:&unk_26D796968 forKeyedSubscript:v30];
  v26 = [NSString stringWithFormat:@"%@%@", v12, @"conv_2"];
  v16 = [MEMORY[0x263F105B0] descriptorWithKernelSizes:&unk_26D796980 inputFeatureChannelCount:3 * a6 outputFeatureChannelCount:a6 strides:&unk_26D796998 paddingPolicy:1 paddingSizes:0];
  [v13 setObject:v16 forKeyedSubscript:v26];
  v17 = [NSString stringWithFormat:@"%@%@", v12, @"transpose_2"];
  [v15 setObject:&unk_26D7969B0 forKeyedSubscript:v17];
  v18 = [NSString stringWithFormat:@"%@%@", v12, @"tcn_"];

  *(float *)&double v19 = a9;
  v20 = +[TCMLCHARDescriptor defineTemporalConvolutionalNetworkDescriptor:v18 channels:a5 temporalKernelSize:a7 stride:a8 dropout:v19];
  v21 = objc_opt_new();
  v22 = [v20 dropoutDescs];
  [v21 setDropoutDescs:v22];

  v23 = [v20 batchNormDescs];
  [v21 setBatchNormDescs:v23];

  [v21 setChunkDescs:v14];
  [v21 setCatDescs:v28];
  [v21 setTransposeDescs:v15];
  double v24 = [v20 convDescs];
  [v13 addEntriesFromDictionary:v24];

  [v21 setConvDescs:v13];
  return v21;
}

+ (id)defineSTGCNDescriptor:(id)a3 inputChannels:(unint64_t)a4 outputChannels:(unint64_t)a5 numKeypoints:(unint64_t)a6 temporalKernelSize:(unint64_t)a7 stride:(unint64_t)a8 dropout:(float)a9 residual:(BOOL)a10
{
  id v16 = a3;
  v32 = objc_opt_new();
  v34 = objc_opt_new();
  v17 = objc_opt_new();
  v36 = [NSString stringWithFormat:@"%@%@", v16, @"residual_"];
  v33 = +[TCMLCHARDescriptor defineResidualDescriptor:v36 inputChannels:a4 outputChannels:a5 stride:a8];
  v35 = [NSString stringWithFormat:@"%@%@", v16, @"graph_conv_"];
  *(float *)&double v18 = a9;
  double v19 = +[TCMLCHARDescriptor defineGraphConvDescriptor:v35 inputChannels:a4 outputChannels:a5 numKeypoints:a6 temporalKernelSize:a7 stride:a8 dropout:v18];
  v20 = [NSString stringWithFormat:@"%@%@", v16, @"addition_key"];

  v21 = [NSNumber numberWithBool:a10];
  [v32 setObject:v21 forKeyedSubscript:v20];

  v22 = objc_opt_new();
  [v22 setAdditionDescs:v32];
  v23 = [v19 catDescs];
  [v22 setCatDescs:v23];

  double v24 = [v19 chunkDescs];
  [v22 setChunkDescs:v24];

  v25 = [v19 dropoutDescs];
  [v22 setDropoutDescs:v25];

  v26 = [v19 transposeDescs];
  [v22 setTransposeDescs:v26];

  v27 = [v33 batchNormDescs];
  [v34 addEntriesFromDictionary:v27];

  v28 = [v19 batchNormDescs];
  [v34 addEntriesFromDictionary:v28];

  [v22 setBatchNormDescs:v34];
  v29 = [v33 convDescs];
  [v17 addEntriesFromDictionary:v29];

  v30 = [v19 convDescs];
  [v17 addEntriesFromDictionary:v30];

  [v22 setConvDescs:v17];
  return v22;
}

+ (id)defineSTGCNActionDescriptor:(id)a3 inputChannels:(unint64_t)a4 batchSize:(unint64_t)a5 numFrames:(unint64_t)a6 numKeypoints:(unint64_t)a7 numClass:(unint64_t)a8 dropout:(float)a9
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v14 = a3;
  unint64_t v81 = a4;
  unint64_t v15 = a4;
  unint64_t v61 = a4;
  long long v82 = xmmword_2246B9EA0;
  long long v83 = xmmword_2246B9EB0;
  long long v84 = xmmword_2246B9EC0;
  v76 = objc_opt_new();
  v70 = objc_opt_new();
  id v16 = objc_opt_new();
  v74 = objc_opt_new();
  v73 = objc_opt_new();
  v72 = objc_opt_new();
  v71 = objc_opt_new();
  v17 = objc_opt_new();
  uint64_t v18 = [NSString stringWithFormat:@"%@%@", v14, @"reshape_1"];
  double v19 = [NSNumber numberWithUnsignedInteger:a5];
  v80[0] = v19;
  unint64_t v20 = a7 * v15;
  v21 = [NSNumber numberWithUnsignedInteger:v20];
  v80[1] = v21;
  v22 = [NSNumber numberWithUnsignedInteger:a6];
  v80[2] = v22;
  v80[3] = &unk_26D796620;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:4];
  v65 = (void *)v18;
  [v17 setObject:v23 forKeyedSubscript:v18];

  uint64_t v24 = [NSString stringWithFormat:@"%@%@", v14, @"batch_norm_1"];
  v25 = [NSNumber numberWithUnsignedInteger:v20];
  v75 = v16;
  v63 = (void *)v24;
  [v16 setObject:v25 forKeyedSubscript:v24];

  uint64_t v26 = [NSString stringWithFormat:@"%@%@", v14, @"reshape_2"];
  v27 = [NSNumber numberWithUnsignedInteger:a5];
  v79[0] = v27;
  v28 = [NSNumber numberWithUnsignedInteger:v61];
  v79[1] = v28;
  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v79[2] = v29;
  v30 = [NSNumber numberWithUnsignedInteger:a6];
  v79[3] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:4];
  v62 = (void *)v26;
  [v17 setObject:v31 forKeyedSubscript:v26];

  id v32 = v14;
  [NSString stringWithFormat:@"%@%@", v14, @"transpose_1"];
  v60 = v33 = v17;
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_26D7969C8);
  for (uint64_t i = 0; i != 7; ++i)
  {
    v35 = [NSString stringWithFormat:@"%@%@%lu", v32, @"stgcn_", i];
    if (i) {
      *(float *)&double v36 = a9;
    }
    else {
      *(float *)&double v36 = 0.0;
    }
    LOBYTE(v57) = i != 0;
    v37 = +[TCMLCHARDescriptor defineSTGCNDescriptor:v35 inputChannels:*(&v81 + i) outputChannels:qword_2246B9ED0[i] numKeypoints:a7 temporalKernelSize:9 stride:qword_2246B9F08[i] dropout:v36 residual:v57];
    v38 = [v37 additionDescs];
    [v76 addEntriesFromDictionary:v38];

    v39 = [v37 batchNormDescs];
    [v75 addEntriesFromDictionary:v39];

    v40 = [v37 catDescs];
    [v74 addEntriesFromDictionary:v40];

    v41 = [v37 chunkDescs];
    [v73 addEntriesFromDictionary:v41];

    v42 = [v37 convDescs];
    [v72 addEntriesFromDictionary:v42];

    v43 = [v37 dropoutDescs];
    [v71 addEntriesFromDictionary:v43];

    v44 = [v37 transposeDescs];
    [v33 addEntriesFromDictionary:v44];
  }
  unint64_t v45 = (a6 + 3) >> 2;
  v66 = v32;
  v68 = [NSString stringWithFormat:@"%@%@", v32, @"average_pool"];
  v46 = [NSNumber numberWithUnsignedInteger:v45];
  v78[0] = v46;
  v47 = [NSNumber numberWithUnsignedInteger:a7];
  v78[1] = v47;
  v48 = [NSNumber numberWithUnsignedInteger:v45];
  v78[2] = v48;
  v49 = [NSNumber numberWithUnsignedInteger:a7];
  v78[3] = v49;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:4];
  [v70 setObject:v50 forKeyedSubscript:v68];

  v59 = [NSString stringWithFormat:@"%@%@", v32, @"conv_1"];
  v51 = [MEMORY[0x263F105B0] descriptorWithKernelSizes:&unk_26D7969E0 inputFeatureChannelCount:256 outputFeatureChannelCount:a8 strides:&unk_26D7969F8 paddingPolicy:1 paddingSizes:0];
  [v72 setObject:v51 forKeyedSubscript:v59];
  v52 = [NSString stringWithFormat:@"%@%@", v66, @"flatten"];
  v53 = [NSNumber numberWithUnsignedInteger:a5];
  v77[0] = v53;
  v77[1] = &unk_26D796698;
  v77[2] = &unk_26D796620;
  v77[3] = &unk_26D796620;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:4];
  [v33 setObject:v54 forKeyedSubscript:v52];

  v55 = objc_opt_new();
  [v55 setAdditionDescs:v76];
  [v55 setAveragePoolDesc:v70];
  [v55 setBatchNormDescs:v75];
  [v55 setCatDescs:v74];
  [v55 setChunkDescs:v73];
  [v55 setConvDescs:v72];
  [v55 setDropoutDescs:v71];
  [v55 setTransposeDescs:v33];

  return v55;
}

@end