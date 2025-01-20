@interface TCMLCHARGraph
+ (id)defineGraphConv:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7;
+ (id)defineResidual:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7;
+ (id)defineSTGCN:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7;
+ (id)defineSTGCNAction:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7;
+ (id)defineTemporalConvolutionalNetwork:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7;
@end

@implementation TCMLCHARGraph

+ (id)defineResidual:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7
{
  v11 = NSString;
  id v12 = a7;
  id v36 = a6;
  id v38 = a5;
  id v13 = a4;
  id v14 = a3;
  v42 = [v11 stringWithFormat:@"%@%@", v14, @"conv_1_weight"];
  v41 = [NSString stringWithFormat:@"%@%@", v14, @"conv_1_bias"];
  v43 = [NSString stringWithFormat:@"%@%@", v14, @"conv"];
  v15 = [v36 convDescs];
  v40 = [v15 objectForKeyedSubscript:v43];

  v16 = (void *)MEMORY[0x263F105B8];
  v17 = [v12 objectForKeyedSubscript:v42];
  v18 = [v12 objectForKeyedSubscript:v41];
  v39 = [v16 layerWithWeights:v17 biases:v18 descriptor:v40];

  v37 = [v38 nodeWithLayer:v39 source:v13];

  v35 = [NSString stringWithFormat:@"%@%@", v14, @"batch_norm"];
  v34 = [NSString stringWithFormat:@"%@%@", v14, @"batch_norm_1_running_mean"];
  v33 = [NSString stringWithFormat:@"%@%@", v14, @"batch_norm_1_running_var"];
  v19 = [NSString stringWithFormat:@"%@%@", v14, @"batch_norm_1_beta"];
  v20 = [NSString stringWithFormat:@"%@%@", v14, @"batch_norm_1_gamma"];

  v21 = [v36 batchNormDescs];

  v22 = [v21 objectForKeyedSubscript:v35];

  v23 = (void *)MEMORY[0x263F105A8];
  uint64_t v24 = [v22 integerValue];
  v25 = [v12 objectForKeyedSubscript:v34];
  v26 = [v12 objectForKeyedSubscript:v33];
  v27 = [v12 objectForKeyedSubscript:v19];
  v28 = [v12 objectForKeyedSubscript:v20];

  LODWORD(v29) = 925353388;
  v30 = [v23 layerWithFeatureChannelCount:v24 mean:v25 variance:v26 beta:v27 gamma:v28 varianceEpsilon:v29];

  v31 = [v38 nodeWithLayer:v30 source:v37];

  return v31;
}

+ (id)defineTemporalConvolutionalNetwork:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7
{
  v11 = NSString;
  id v12 = a7;
  id v68 = a6;
  id v67 = a5;
  id v58 = a4;
  id v13 = a3;
  v66 = [v11 stringWithFormat:@"%@%@", v13, @"batch_norm_0"];
  v65 = [NSString stringWithFormat:@"%@%@", v13, @"batch_norm_0_running_mean"];
  v64 = [NSString stringWithFormat:@"%@%@", v13, @"batch_norm_0_running_var"];
  v62 = [NSString stringWithFormat:@"%@%@", v13, @"batch_norm_0_beta"];
  v61 = [NSString stringWithFormat:@"%@%@", v13, @"batch_norm_0_gamma"];
  id v14 = [v68 batchNormDescs];
  v63 = [v14 objectForKeyedSubscript:v66];

  v15 = (void *)MEMORY[0x263F105A8];
  uint64_t v16 = [v63 integerValue];
  v17 = [v12 objectForKeyedSubscript:v65];
  v18 = [v12 objectForKeyedSubscript:v64];
  v19 = [v12 objectForKeyedSubscript:v62];
  v20 = [v12 objectForKeyedSubscript:v61];
  LODWORD(v21) = 925353388;
  v60 = [v15 layerWithFeatureChannelCount:v16 mean:v17 variance:v18 beta:v19 gamma:v20 varianceEpsilon:v21];

  v57 = [v67 nodeWithLayer:v60 source:v58];

  v59 = [MEMORY[0x263F10588] descriptorWithType:1 a:0.0];
  v56 = [MEMORY[0x263F10590] layerWithDescriptor:v59];
  v52 = [v67 nodeWithLayer:v56 source:v57];
  v54 = [NSString stringWithFormat:@"%@%@", v13, @"conv_1_weight"];
  v53 = [NSString stringWithFormat:@"%@%@", v13, @"conv_1_bias"];
  v55 = [NSString stringWithFormat:@"%@%@", v13, @"conv"];
  v22 = [v68 convDescs];
  v51 = [v22 objectForKeyedSubscript:v55];

  v23 = (void *)MEMORY[0x263F105B8];
  uint64_t v24 = [v12 objectForKeyedSubscript:v54];
  v25 = [v12 objectForKeyedSubscript:v53];
  v50 = [v23 layerWithWeights:v24 biases:v25 descriptor:v51];

  v45 = [v67 nodeWithLayer:v50 source:v52];
  v49 = [NSString stringWithFormat:@"%@%@", v13, @"batch_norm_1"];
  v48 = [NSString stringWithFormat:@"%@%@", v13, @"batch_norm_1_running_mean"];
  v47 = [NSString stringWithFormat:@"%@%@", v13, @"batch_norm_1_running_var"];
  v46 = [NSString stringWithFormat:@"%@%@", v13, @"batch_norm_1_beta"];
  v44 = [NSString stringWithFormat:@"%@%@", v13, @"batch_norm_1_gamma"];
  v26 = [v68 batchNormDescs];
  v27 = [v26 objectForKeyedSubscript:v49];

  v28 = (void *)MEMORY[0x263F105A8];
  uint64_t v29 = [v27 integerValue];
  v30 = [v12 objectForKeyedSubscript:v48];
  v31 = [v12 objectForKeyedSubscript:v47];
  v32 = [v12 objectForKeyedSubscript:v46];
  v33 = [v12 objectForKeyedSubscript:v44];

  LODWORD(v34) = 925353388;
  v35 = [v28 layerWithFeatureChannelCount:v29 mean:v30 variance:v31 beta:v32 gamma:v33 varianceEpsilon:v34];

  id v36 = [v67 nodeWithLayer:v35 source:v45];
  v37 = [NSString stringWithFormat:@"%@%@", v13, @"dropout"];

  id v38 = [v68 dropoutDescs];

  v39 = [v38 objectForKeyedSubscript:v37];

  v40 = (void *)MEMORY[0x263F105C8];
  [v39 floatValue];
  v41 = objc_msgSend(v40, "layerWithRate:seed:", 1);
  v42 = [v67 nodeWithLayer:v41 source:v36];

  return v42;
}

+ (id)defineGraphConv:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7
{
  v60[1] = *MEMORY[0x263EF8340];
  v11 = NSString;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v58 = [v11 stringWithFormat:@"%@%@", v16, @"conv_1_weight"];
  v57 = [NSString stringWithFormat:@"%@%@", v16, @"conv_1_bias"];
  v59 = [NSString stringWithFormat:@"%@%@", v16, @"conv_1"];
  v17 = [v13 convDescs];
  v56 = [v17 objectForKeyedSubscript:v59];

  v18 = (void *)MEMORY[0x263F105B8];
  v19 = [v12 objectForKeyedSubscript:v58];
  v41 = v12;
  v20 = [v12 objectForKeyedSubscript:v57];
  v55 = [v18 layerWithWeights:v19 biases:v20 descriptor:v56];

  v52 = [v14 nodeWithLayer:v55 source:v15];

  v54 = [NSString stringWithFormat:@"%@%@", v16, @"chunk_1"];
  double v21 = [v13 chunkDescs];
  v22 = [v21 objectForKeyedSubscript:v54];

  v53 = v22;
  v23 = [v22 objectAtIndexedSubscript:0];
  uint64_t v24 = [v23 integerValue];
  v25 = [v22 objectAtIndexedSubscript:1];
  v50 = objc_msgSend(v14, "splitWithSource:splitCount:dimension:", v52, v24, objc_msgSend(v25, "integerValue"));

  v51 = [NSString stringWithFormat:@"%@%@", v16, @"cat_1"];
  v26 = [v13 catDescs];
  v49 = [v26 objectForKeyedSubscript:v51];

  v47 = objc_msgSend(v14, "concatenateWithSources:dimension:", v50, objc_msgSend(v49, "integerValue"));
  v48 = [NSString stringWithFormat:@"%@%@", v16, @"transpose_1"];
  v27 = [v13 transposeDescs];
  v46 = [v27 objectForKeyedSubscript:v48];

  v43 = [v14 transposeWithDimensions:v46 source:v47];
  v44 = [NSString stringWithFormat:@"%@%@", v16, @"conv_2_weight"];
  v45 = [NSString stringWithFormat:@"%@%@", v16, @"conv_2"];
  v28 = [v13 convDescs];
  v42 = [v28 objectForKeyedSubscript:v45];

  uint64_t v29 = (void *)MEMORY[0x263F105B8];
  v30 = [v12 objectForKeyedSubscript:v44];
  v31 = [v29 layerWithWeights:v30 biases:0 descriptor:v42];

  v60[0] = v43;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:1];
  v33 = [v14 nodeWithLayer:v31 sources:v32 disableUpdate:1];

  double v34 = [NSString stringWithFormat:@"%@%@", v16, @"transpose_2"];
  v35 = [v13 transposeDescs];
  id v36 = [v35 objectForKeyedSubscript:v34];

  v37 = [v14 transposeWithDimensions:v36 source:v33];
  id v38 = [NSString stringWithFormat:@"%@%@", v16, @"tcn_"];

  id v40 = +[TCMLCHARGraph defineTemporalConvolutionalNetwork:v38 input:v37 graph:v14 descriptor:v13 weights:v41];

  return v40;
}

+ (id)defineSTGCN:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7
{
  v50[2] = *MEMORY[0x263EF8340];
  id v47 = a4;
  id v11 = a5;
  id v12 = a6;
  id v48 = a7;
  id v13 = NSString;
  id v14 = a3;
  uint64_t v15 = [v13 stringWithFormat:@"%@%@", v14, @"residual_"];
  id v16 = [NSString stringWithFormat:@"%@%@", v14, @"addition_key"];
  uint64_t v17 = [NSString stringWithFormat:@"%@%@", v14, @"graph_conv_"];

  v18 = [v12 additionDescs];
  v19 = [v18 objectForKeyedSubscript:v16];

  v46 = [MEMORY[0x263F10588] descriptorWithType:1 a:0.0];
  uint64_t v45 = objc_msgSend(MEMORY[0x263F10590], "layerWithDescriptor:");
  uint64_t v38 = v15;
  v20 = (void *)v15;
  double v21 = v12;
  v22 = [NSString stringWithFormat:@"%@%@", v38, @"conv"];
  v23 = [v12 convDescs];
  uint64_t v24 = [v23 objectForKeyedSubscript:v22];

  uint64_t v25 = [v24 inputFeatureChannelCount];
  v44 = (void *)v17;
  if (v25 == [v24 outputFeatureChannelCount] && objc_msgSend(v19, "BOOLValue"))
  {
    v41 = +[TCMLCHARGraph defineGraphConv:v17 input:v47 graph:v11 descriptor:v12 weights:v48];
    [MEMORY[0x263F105A0] layerWithOperation:0];
    v42 = v22;
    v26 = v19;
    v28 = v27 = v16;
    v50[0] = v47;
    v50[1] = v41;
    uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
    v30 = [v11 nodeWithLayer:v28 sources:v29];

    v31 = (void *)v45;
    v32 = [v11 nodeWithLayer:v45 source:v30];

    id v16 = v27;
    v19 = v26;
    v22 = v42;
  }
  else if ([v19 BOOLValue])
  {
    v43 = v22;
    id v40 = +[TCMLCHARGraph defineResidual:v20 input:v47 graph:v11 descriptor:v12 weights:v48];
    v39 = +[TCMLCHARGraph defineGraphConv:v17 input:v47 graph:v11 descriptor:v12 weights:v48];
    v33 = [MEMORY[0x263F105A0] layerWithOperation:0];
    v49[0] = v40;
    v49[1] = v39;
    double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
    v35 = [v11 nodeWithLayer:v33 sources:v34];

    v31 = (void *)v45;
    v32 = [v11 nodeWithLayer:v45 source:v35];

    v22 = v43;
  }
  else
  {
    id v36 = +[TCMLCHARGraph defineGraphConv:v17 input:v47 graph:v11 descriptor:v12 weights:v48];
    v31 = (void *)v45;
    v32 = [v11 nodeWithLayer:v45 source:v36];
  }
  return v32;
}

+ (id)defineSTGCNAction:(id)a3 input:(id)a4 graph:(id)a5 descriptor:(id)a6 weights:(id)a7
{
  v95[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v90 = v12;
  uint64_t v15 = [v12 transposeWithDimensions:&unk_26D796A10 source:a4];
  uint64_t v16 = [NSString stringWithFormat:@"%@%@", v11, @"reshape_1"];
  v91 = v13;
  uint64_t v17 = [v13 transposeDescs];
  v87 = (void *)v16;
  uint64_t v18 = [v17 objectForKeyedSubscript:v16];

  v86 = (void *)v18;
  v88 = (void *)v15;
  v92 = [v12 reshapeWithShape:v18 source:v15];
  uint64_t v19 = [NSString stringWithFormat:@"%@%@", v11, @"batch_norm_1_running_mean"];
  v89 = v11;
  uint64_t v20 = [NSString stringWithFormat:@"%@%@", v11, @"batch_norm_1_running_var"];
  uint64_t v21 = [NSString stringWithFormat:@"%@%@", v11, @"batch_norm_1_beta"];
  uint64_t v22 = [NSString stringWithFormat:@"%@%@", v11, @"batch_norm_1_gamma"];
  uint64_t v23 = [NSString stringWithFormat:@"%@%@", v11, @"batch_norm_1"];
  uint64_t v24 = [v13 batchNormDescs];
  v81 = (void *)v23;
  uint64_t v25 = [v24 objectForKeyedSubscript:v23];

  v26 = (void *)MEMORY[0x263F105A8];
  v80 = v25;
  uint64_t v27 = [v25 integerValue];
  v85 = (void *)v19;
  v28 = [v14 objectForKeyedSubscript:v19];
  v84 = (void *)v20;
  uint64_t v29 = [v14 objectForKeyedSubscript:v20];
  v83 = (void *)v21;
  v30 = [v14 objectForKeyedSubscript:v21];
  v93 = v14;
  v82 = (void *)v22;
  v31 = [v14 objectForKeyedSubscript:v22];
  LODWORD(v32) = 925353388;
  uint64_t v33 = [v26 layerWithFeatureChannelCount:v27 mean:v28 variance:v29 beta:v30 gamma:v31 varianceEpsilon:v32];

  v79 = (void *)v33;
  uint64_t v34 = [v90 nodeWithLayer:v33 source:v92];
  uint64_t v35 = [NSString stringWithFormat:@"%@%@", v89, @"reshape_2"];
  id v36 = [v91 transposeDescs];
  v77 = (void *)v35;
  uint64_t v37 = [v36 objectForKeyedSubscript:v35];

  v76 = (void *)v37;
  v78 = (void *)v34;
  uint64_t v38 = [v90 reshapeWithShape:v37 source:v34];
  v39 = [NSString stringWithFormat:@"%@%@", v89, @"transpose_1"];
  id v40 = [v91 transposeDescs];
  v41 = [v40 objectForKeyedSubscript:v39];
  v42 = [v90 transposeWithDimensions:v41 source:v38];

  id v43 = v42;
  uint64_t v44 = 0;
  v75 = v43;
  do
  {
    uint64_t v45 = v43;
    v46 = [NSString stringWithFormat:@"%@%@%lu", v89, @"stgcn_", v44];
    id v43 = +[TCMLCHARGraph defineSTGCN:v46 input:v43 graph:v90 descriptor:v91 weights:v93];

    ++v44;
  }
  while (v44 != 7);
  v74 = [NSString stringWithFormat:@"%@%@", v89, @"average_pool"];
  id v47 = [v91 averagePoolDesc];
  id v48 = [v47 objectForKeyedSubscript:v74];

  v72 = (void *)MEMORY[0x263F10628];
  v49 = [v48 objectAtIndexedSubscript:0];
  v95[0] = v49;
  v50 = [v48 objectAtIndexedSubscript:1];
  v95[1] = v50;
  v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:2];
  v52 = [v48 objectAtIndexedSubscript:2];
  v94[0] = v52;
  v53 = [v48 objectAtIndexedSubscript:3];
  v94[1] = v53;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:2];
  v73 = [v72 averagePoolingDescriptorWithKernelSizes:v51 strides:v54 paddingPolicy:1 paddingSizes:0 countIncludesPadding:0];

  v71 = [MEMORY[0x263F10630] layerWithDescriptor:v73];
  id v67 = [v90 nodeWithLayer:v71 source:v43];
  v69 = [NSString stringWithFormat:@"%@%@", v89, @"conv_1_weight"];
  id v68 = [NSString stringWithFormat:@"%@%@", v89, @"conv_1_bias"];
  v70 = [NSString stringWithFormat:@"%@%@", v89, @"conv_1"];
  v55 = [v91 convDescs];
  v66 = [v55 objectForKeyedSubscript:v70];

  v56 = (void *)MEMORY[0x263F105B8];
  v57 = [v93 objectForKeyedSubscript:v69];
  id v58 = [v93 objectForKeyedSubscript:v68];
  v59 = [v56 layerWithWeights:v57 biases:v58 descriptor:v66];

  v60 = [v90 nodeWithLayer:v59 source:v67];
  v61 = [NSString stringWithFormat:@"%@%@", v89, @"flatten"];
  v62 = [v91 transposeDescs];
  v63 = [v62 objectForKeyedSubscript:v61];

  v64 = [v90 reshapeWithShape:v63 source:v60];

  return v64;
}

@end