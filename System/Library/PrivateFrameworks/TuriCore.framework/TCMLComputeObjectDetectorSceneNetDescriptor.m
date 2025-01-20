@interface TCMLComputeObjectDetectorSceneNetDescriptor
- (BOOL)isComplete;
- (MLCTensor)classificationOutput;
- (MLCTensor)labelClass;
- (MLCTensor)labelConfidence;
- (MLCTensor)labelCoordinates;
- (MLCTensor)localizationOutput;
- (MLCTensor)lossResultTensor;
- (MLCTensor)sceneNetInput1;
- (MLCTensor)sceneNetInput2;
- (MLCTensor)softmaxOutput;
- (MLCTensor)weightsClass;
- (MLCTensor)weightsCoordinates;
- (NSDictionary)weights;
- (id)addCommonFPNLayersWithWeight:(id)a3 bias:(id)a4 headType:(id)a5 scale:(unint64_t)a6 source:(id)a7 graph:(id)a8;
- (id)addHeadWithWeight:(id)a3 bias:(id)a4 outputChannels:(unint64_t)a5 source:(id)a6 graph:(id)a7;
- (id)addInitialConvLayerForScale:(unint64_t)a3 source:(id)a4 graph:(id)a5;
- (id)addReluBatchNormWithWeightPrefix:(id)a3 source:(id)a4 graph:(id)a5;
- (unint64_t)numAnchorBoxes;
- (unint64_t)numClasses;
- (void)defineGraph:(id)a3 batchSize:(unint64_t)a4;
- (void)setClassificationOutput:(id)a3;
- (void)setLabelClass:(id)a3;
- (void)setLabelConfidence:(id)a3;
- (void)setLabelCoordinates:(id)a3;
- (void)setLocalizationOutput:(id)a3;
- (void)setLossResultTensor:(id)a3;
- (void)setNumAnchorBoxes:(unint64_t)a3;
- (void)setNumClasses:(unint64_t)a3;
- (void)setSceneNetInput1:(id)a3;
- (void)setSceneNetInput2:(id)a3;
- (void)setSoftmaxOutput:(id)a3;
- (void)setWeights:(id)a3;
- (void)setWeightsClass:(id)a3;
- (void)setWeightsCoordinates:(id)a3;
@end

@implementation TCMLComputeObjectDetectorSceneNetDescriptor

- (BOOL)isComplete
{
  v3 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self sceneNetInput1];

  if (!v3) {
    return 0;
  }
  v4 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self sceneNetInput2];

  if (!v4) {
    return 0;
  }
  v5 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)addReluBatchNormWithWeightPrefix:(id)a3 source:(id)a4 graph:(id)a5
{
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v32 = [v8 stringWithFormat:@"%@_running_mean", v11];
  v31 = [NSString stringWithFormat:@"%@_running_var", v11];
  v30 = [NSString stringWithFormat:@"%@_beta", v11];
  v12 = [NSString stringWithFormat:@"%@_gamma", v11];

  v13 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  v14 = [v13 objectForKeyedSubscript:v32];

  v15 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  v16 = [v15 objectForKeyedSubscript:v31];

  v17 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  v18 = [v17 objectForKeyedSubscript:v30];

  v19 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  v20 = [v19 objectForKeyedSubscript:v12];

  LODWORD(v21) = 925353388;
  LODWORD(v22) = 1063675494;
  v23 = [MEMORY[0x263F105A8] layerWithFeatureChannelCount:128 mean:v14 variance:v16 beta:v18 gamma:v20 varianceEpsilon:v21 momentum:v22];
  v24 = [v9 nodeWithLayer:v23 source:v10];

  v25 = (void *)MEMORY[0x263F10590];
  v26 = [MEMORY[0x263F10588] descriptorWithType:1 a:0.0];
  v27 = [v25 layerWithDescriptor:v26];

  v28 = [v9 nodeWithLayer:v27 source:v24];

  return v28;
}

- (id)addInitialConvLayerForScale:(unint64_t)a3 source:(id)a4 graph:(id)a5
{
  v74[2] = *MEMORY[0x263EF8340];
  v8 = NSString;
  id v67 = a5;
  id v65 = a4;
  v69 = objc_msgSend(v8, "stringWithFormat:", @"scale%lu_conv0_bias", a3);
  v68 = objc_msgSend(NSString, "stringWithFormat:", @"scale%lu_conv0_weight", a3);
  id v9 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  v59 = [v9 objectForKeyedSubscript:v69];

  id v10 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  id v11 = [v10 objectForKeyedSubscript:v68];

  v12 = [v11 descriptor];
  v13 = [v12 shape];
  v14 = [v13 objectAtIndexedSubscript:1];
  unint64_t v63 = (unint64_t)[v14 unsignedIntegerValue] >> 7;

  v15 = [v11 descriptor];
  v16 = [v15 shape];
  v17 = [v16 objectAtIndexedSubscript:3];
  uint64_t v18 = [v17 unsignedIntegerValue];

  v19 = [v11 descriptor];
  v20 = [v19 shape];
  double v21 = [v20 objectAtIndexedSubscript:2];
  uint64_t v22 = [v21 unsignedIntegerValue];

  if (a3 < 2) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = 2;
  }
  v24 = (void *)MEMORY[0x263F105B0];
  v25 = [NSNumber numberWithUnsignedInteger:v22];
  v74[0] = v25;
  v26 = [NSNumber numberWithUnsignedInteger:v18];
  v74[1] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:2];
  v28 = [NSNumber numberWithUnsignedInteger:v23];
  v73[0] = v28;
  v29 = [NSNumber numberWithUnsignedInteger:v23];
  v73[1] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:2];
  v61 = [v24 descriptorWithKernelSizes:v27 inputFeatureChannelCount:v63 outputFeatureChannelCount:128 strides:v30 paddingPolicy:0 paddingSizes:&unk_26D796A28];

  v62 = [MEMORY[0x263F105B8] layerWithWeights:v11 biases:v59 descriptor:v61];
  v31 = [v67 nodeWithLayer:v62 source:v65];

  v66 = objc_msgSend(NSString, "stringWithFormat:", @"scale%lu_bn0", a3);
  v60 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addReluBatchNormWithWeightPrefix:v66 source:v31 graph:v67];

  v64 = objc_msgSend(NSString, "stringWithFormat:", @"scale%lu_conv1_bias", a3);

  v70 = objc_msgSend(NSString, "stringWithFormat:", @"scale%lu_conv1_weight", a3);

  v32 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  uint64_t v33 = [v32 objectForKeyedSubscript:v64];

  v34 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  v35 = [v34 objectForKeyedSubscript:v70];

  v36 = [v35 descriptor];
  v37 = [v36 shape];
  v38 = [v37 objectAtIndexedSubscript:1];
  unint64_t v39 = (unint64_t)[v38 unsignedIntegerValue] >> 7;

  v40 = [v35 descriptor];
  v41 = [v40 shape];
  v42 = [v41 objectAtIndexedSubscript:3];
  uint64_t v43 = [v42 unsignedIntegerValue];

  v44 = [v35 descriptor];
  v45 = [v44 shape];
  v46 = [v45 objectAtIndexedSubscript:2];
  uint64_t v47 = [v46 unsignedIntegerValue];

  v48 = (void *)MEMORY[0x263F105B0];
  v49 = [NSNumber numberWithUnsignedInteger:v47];
  v72[0] = v49;
  v50 = [NSNumber numberWithUnsignedInteger:v43];
  v72[1] = v50;
  v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:2];
  v52 = [v48 descriptorWithKernelSizes:v51 inputFeatureChannelCount:v39 outputFeatureChannelCount:128 strides:&unk_26D796A40 paddingPolicy:0 paddingSizes:&unk_26D796A58];

  v53 = (void *)v33;
  v54 = [MEMORY[0x263F105B8] layerWithWeights:v35 biases:v33 descriptor:v52];

  v55 = [v67 nodeWithLayer:v54 source:v60];

  v56 = objc_msgSend(NSString, "stringWithFormat:", @"scale%lu_bn1", a3);

  v57 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addReluBatchNormWithWeightPrefix:v56 source:v55 graph:v67];

  return v57;
}

- (id)addCommonFPNLayersWithWeight:(id)a3 bias:(id)a4 headType:(id)a5 scale:(unint64_t)a6 source:(id)a7 graph:(id)a8
{
  v41[2] = *MEMORY[0x263EF8340];
  id v12 = a8;
  id v13 = a7;
  id v38 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [v15 descriptor];
  v17 = [v16 shape];
  uint64_t v18 = [v17 objectAtIndexedSubscript:1];
  unint64_t v19 = (unint64_t)[v18 unsignedIntegerValue] >> 7;

  v20 = [v15 descriptor];
  double v21 = [v20 shape];
  uint64_t v22 = [v21 objectAtIndexedSubscript:3];
  uint64_t v23 = [v22 unsignedIntegerValue];

  v24 = [v15 descriptor];
  v25 = [v24 shape];
  v26 = [v25 objectAtIndexedSubscript:2];
  uint64_t v27 = [v26 unsignedIntegerValue];

  v28 = (void *)MEMORY[0x263F105B0];
  v29 = [NSNumber numberWithUnsignedInteger:v27];
  v41[0] = v29;
  v30 = [NSNumber numberWithUnsignedInteger:v23];
  v41[1] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  v32 = [v28 descriptorWithKernelSizes:v31 inputFeatureChannelCount:v19 outputFeatureChannelCount:128 strides:&unk_26D796A70 paddingPolicy:0 paddingSizes:&unk_26D796A88];

  uint64_t v33 = [MEMORY[0x263F105B8] layerWithWeights:v15 biases:v14 descriptor:v32];

  v34 = [v12 nodeWithLayer:v33 source:v13];

  v35 = [NSString stringWithFormat:@"shared_%@_scale%lu_bn", v38, a6];

  v36 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addReluBatchNormWithWeightPrefix:v35 source:v34 graph:v12];

  return v36;
}

- (id)addHeadWithWeight:(id)a3 bias:(id)a4 outputChannels:(unint64_t)a5 source:(id)a6 graph:(id)a7
{
  v35[2] = *MEMORY[0x263EF8340];
  id v34 = a7;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v13 descriptor];
  id v15 = [v14 shape];
  v16 = [v15 objectAtIndexedSubscript:1];
  unint64_t v17 = [v16 unsignedIntegerValue] / a5;

  uint64_t v18 = [v13 descriptor];
  unint64_t v19 = [v18 shape];
  v20 = [v19 objectAtIndexedSubscript:3];
  uint64_t v21 = [v20 unsignedIntegerValue];

  uint64_t v22 = [v13 descriptor];
  uint64_t v23 = [v22 shape];
  v24 = [v23 objectAtIndexedSubscript:2];
  uint64_t v25 = [v24 unsignedIntegerValue];

  v26 = (void *)MEMORY[0x263F105B0];
  uint64_t v27 = [NSNumber numberWithUnsignedInteger:v25];
  v35[0] = v27;
  v28 = [NSNumber numberWithUnsignedInteger:v21];
  v35[1] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  v30 = [v26 descriptorWithKernelSizes:v29 inputFeatureChannelCount:v17 outputFeatureChannelCount:a5 strides:&unk_26D796AA0 paddingPolicy:0 paddingSizes:&unk_26D796AB8];

  v31 = [MEMORY[0x263F105B8] layerWithWeights:v13 biases:v12 descriptor:v30];

  v32 = [v34 nodeWithLayer:v31 source:v11];

  return v32;
}

- (void)defineGraph:(id)a3 batchSize:(unint64_t)a4
{
  uint64_t v141 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v107 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v122 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v6 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"shared_cls_conv0_scale0_weight"];

  v8 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  uint64_t v104 = [v8 objectForKeyedSubscript:@"shared_cls_conv0_scale0_bias"];

  id v9 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  uint64_t v103 = [v9 objectForKeyedSubscript:@"shared_loc_conv0_scale0_weight"];

  id v10 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self weights];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"shared_loc_conv0_scale0_bias"];

  id v12 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self sceneNetInput1];
  id v13 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addInitialConvLayerForScale:0 source:v12 graph:v5];

  id v14 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addCommonFPNLayersWithWeight:v7 bias:v104 headType:@"cls" scale:0 source:v13 graph:v5];
  id v15 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addCommonFPNLayersWithWeight:v103 bias:v11 headType:@"loc" scale:0 source:v13 graph:v5];
  [v107 addObject:v14];
  [v122 addObject:v15];
  v16 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self sceneNetInput2];
  unint64_t v17 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addInitialConvLayerForScale:1 source:v16 graph:v5];

  v102 = (void *)v7;
  uint64_t v18 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addCommonFPNLayersWithWeight:v7 bias:v104 headType:@"cls" scale:1 source:v17 graph:v5];

  unint64_t v19 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addCommonFPNLayersWithWeight:v103 bias:v11 headType:@"loc" scale:1 source:v17 graph:v5];

  [v107 addObject:v18];
  [v122 addObject:v19];
  for (uint64_t i = 2; i != 5; ++i)
  {
    uint64_t v21 = v19;
    uint64_t v22 = (void *)v18;
    uint64_t v23 = v17;
    unint64_t v17 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addInitialConvLayerForScale:i source:v17 graph:v5];

    uint64_t v18 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addCommonFPNLayersWithWeight:v7 bias:v104 headType:@"cls" scale:i source:v17 graph:v5];

    unint64_t v19 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)self addCommonFPNLayersWithWeight:v103 bias:v11 headType:@"loc" scale:i source:v17 graph:v5];

    v24 = v107;
    [v107 addObject:v18];
    [v122 addObject:v19];
  }
  v93 = (void *)v18;
  v97 = (void *)v11;
  v125 = self;
  id v98 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = v122;
  v126 = v5;
  uint64_t v105 = [obj countByEnumeratingWithState:&v131 objects:v140 count:16];
  if (v105)
  {
    uint64_t v123 = 0;
    uint64_t v100 = *(void *)v132;
    uint64_t v25 = self;
    v119 = v19;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v132 != v100) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v131 + 1) + 8 * v26);
        id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v117 = v26;
        if ([(TCMLComputeObjectDetectorSceneNetDescriptor *)v25 numAnchorBoxes])
        {
          unint64_t v29 = 0;
          v30 = v17;
          v31 = v125;
          do
          {
            v32 = objc_msgSend(NSString, "stringWithFormat:", @"shared_loc_conv1_scale0_anchor%lu_weight", v29);
            uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"shared_loc_conv1_scale0_anchor%lu_bias", v29);
            [(TCMLComputeObjectDetectorSceneNetDescriptor *)v125 weights];
            v35 = uint64_t v34 = v27;
            v36 = [v35 objectForKeyedSubscript:v32];

            v37 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)v125 weights];
            id v38 = [v37 objectForKeyedSubscript:v33];

            uint64_t v27 = v34;
            unint64_t v17 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)v125 addHeadWithWeight:v36 bias:v38 outputChannels:4 source:v34 graph:v126];

            [v28 addObject:v17];
            ++v29;
            v30 = v17;
          }
          while (v29 < [(TCMLComputeObjectDetectorSceneNetDescriptor *)v125 numAnchorBoxes]);
        }
        else
        {
          v31 = v125;
        }
        v115 = v28;
        unint64_t v39 = [v126 concatenateWithSources:v28 dimension:1];
        v40 = (void *)MEMORY[0x263F10638];
        v41 = [NSNumber numberWithUnsignedInteger:a4];
        v139[0] = v41;
        v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TCMLComputeObjectDetectorSceneNetDescriptor numAnchorBoxes](v31, "numAnchorBoxes"));
        v139[1] = v42;
        v139[2] = &unk_26D796740;
        uint64_t v43 = [&unk_26D796AD0 objectAtIndexedSubscript:v123];
        v139[3] = v43;
        v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:4];
        v113 = [v40 layerWithShape:v44];

        v45 = [v126 nodeWithLayer:v113 source:v39];

        v46 = [MEMORY[0x263F10680] layerWithDimensions:&unk_26D796AE8];
        v110 = [v126 nodeWithLayer:v46 source:v45];

        uint64_t v47 = (void *)MEMORY[0x263F10638];
        v48 = [NSNumber numberWithUnsignedInteger:a4];
        v138[0] = v48;
        v138[1] = &unk_26D796740;
        v49 = NSNumber;
        uint64_t v50 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)v31 numAnchorBoxes];
        v51 = [&unk_26D796AD0 objectAtIndexedSubscript:v123];
        v52 = objc_msgSend(v49, "numberWithUnsignedInteger:", v50 * (int)objc_msgSend(v51, "intValue"));
        v138[2] = v52;
        v138[3] = &unk_26D7966B0;
        v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:4];
        v54 = [v47 layerWithShape:v53];

        v55 = [v126 nodeWithLayer:v54 source:v110];
        [v98 addObject:v55];

        ++v123;
        uint64_t v26 = v117 + 1;
        v24 = v107;
        id v5 = v126;
        uint64_t v25 = v31;
        unint64_t v19 = v119;
      }
      while (v117 + 1 != v105);
      uint64_t v105 = [obj countByEnumeratingWithState:&v131 objects:v140 count:16];
    }
    while (v105);
  }
  else
  {
    uint64_t v25 = self;
  }

  id v99 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v56 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)v25 numClasses];
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v94 = v24;
  uint64_t v101 = [v94 countByEnumeratingWithState:&v127 objects:v137 count:16];
  if (v101)
  {
    uint64_t v118 = 0;
    v120 = v19;
    uint64_t v124 = v56 + 1;
    uint64_t v96 = *(void *)v128;
    do
    {
      uint64_t v57 = 0;
      do
      {
        if (*(void *)v128 != v96)
        {
          uint64_t v58 = v57;
          objc_enumerationMutation(v94);
          uint64_t v57 = v58;
        }
        uint64_t v116 = v57;
        uint64_t v59 = *(void *)(*((void *)&v127 + 1) + 8 * v57);
        id v60 = objc_alloc_init(MEMORY[0x263EFF980]);
        if ([(TCMLComputeObjectDetectorSceneNetDescriptor *)v25 numAnchorBoxes])
        {
          unint64_t v61 = 0;
          v62 = v17;
          do
          {
            unint64_t v63 = objc_msgSend(NSString, "stringWithFormat:", @"shared_cls_conv1_scale0_anchor%lu_weight", v61);
            v64 = objc_msgSend(NSString, "stringWithFormat:", @"shared_cls_conv1_scale0_anchor%lu_bias", v61);
            [(TCMLComputeObjectDetectorSceneNetDescriptor *)v25 weights];
            v66 = uint64_t v65 = v59;
            id v67 = [v66 objectForKeyedSubscript:v63];

            v68 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)v25 weights];
            v69 = [v68 objectForKeyedSubscript:v64];

            uint64_t v59 = v65;
            unint64_t v17 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)v125 addHeadWithWeight:v67 bias:v69 outputChannels:v124 source:v65 graph:v126];

            [v60 addObject:v17];
            uint64_t v25 = v125;

            ++v61;
            v62 = v17;
          }
          while (v61 < [(TCMLComputeObjectDetectorSceneNetDescriptor *)v125 numAnchorBoxes]);
        }
        v114 = v60;
        v108 = [v126 concatenateWithSources:v60 dimension:1];
        v111 = (void *)MEMORY[0x263F10638];
        v70 = [NSNumber numberWithUnsignedInteger:a4];
        v136[0] = v70;
        v71 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TCMLComputeObjectDetectorSceneNetDescriptor numAnchorBoxes](v25, "numAnchorBoxes"));
        v136[1] = v71;
        v72 = [NSNumber numberWithUnsignedInteger:v124];
        v136[2] = v72;
        v73 = [&unk_26D796AD0 objectAtIndexedSubscript:v118];
        v136[3] = v73;
        v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:4];
        v112 = [v111 layerWithShape:v74];

        v75 = [v126 nodeWithLayer:v112 source:v108];

        v109 = [MEMORY[0x263F10680] layerWithDimensions:&unk_26D796B00];
        v106 = [v126 nodeWithLayer:v109 source:v75];

        v76 = (void *)MEMORY[0x263F10638];
        v77 = [NSNumber numberWithUnsignedInteger:a4];
        v135[0] = v77;
        v78 = [NSNumber numberWithUnsignedInteger:v124];
        v135[1] = v78;
        v79 = NSNumber;
        uint64_t v80 = [(TCMLComputeObjectDetectorSceneNetDescriptor *)v25 numAnchorBoxes];
        v81 = [&unk_26D796AD0 objectAtIndexedSubscript:v118];
        v82 = objc_msgSend(v79, "numberWithUnsignedInteger:", v80 * (int)objc_msgSend(v81, "intValue"));
        v135[2] = v82;
        v135[3] = &unk_26D7966B0;
        v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:4];
        v84 = [v76 layerWithShape:v83];

        id v5 = v126;
        v85 = [v126 nodeWithLayer:v84 source:v106];
        [v99 addObject:v85];

        ++v118;
        uint64_t v57 = v116 + 1;
        v86 = v102;
        v88 = (void *)v103;
        v87 = (void *)v104;
        v89 = v97;
        unint64_t v19 = v120;
      }
      while (v116 + 1 != v101);
      uint64_t v101 = [v94 countByEnumeratingWithState:&v127 objects:v137 count:16];
    }
    while (v101);
  }
  else
  {
    v86 = v102;
    v88 = (void *)v103;
    v87 = (void *)v104;
    v89 = v97;
  }

  [v5 concatenateWithSources:v99 dimension:2];
  v91 = v90 = v25;
  [(TCMLComputeObjectDetectorSceneNetDescriptor *)v90 setClassificationOutput:v91];

  v92 = [v5 concatenateWithSources:v98 dimension:2];
  [(TCMLComputeObjectDetectorSceneNetDescriptor *)v90 setLocalizationOutput:v92];
}

- (MLCTensor)sceneNetInput1
{
  return self->_sceneNetInput1;
}

- (void)setSceneNetInput1:(id)a3
{
}

- (MLCTensor)sceneNetInput2
{
  return self->_sceneNetInput2;
}

- (void)setSceneNetInput2:(id)a3
{
}

- (MLCTensor)labelCoordinates
{
  return self->_labelCoordinates;
}

- (void)setLabelCoordinates:(id)a3
{
}

- (MLCTensor)labelConfidence
{
  return self->_labelConfidence;
}

- (void)setLabelConfidence:(id)a3
{
}

- (MLCTensor)labelClass
{
  return self->_labelClass;
}

- (void)setLabelClass:(id)a3
{
}

- (MLCTensor)weightsCoordinates
{
  return self->_weightsCoordinates;
}

- (void)setWeightsCoordinates:(id)a3
{
}

- (MLCTensor)weightsClass
{
  return self->_weightsClass;
}

- (void)setWeightsClass:(id)a3
{
}

- (MLCTensor)localizationOutput
{
  return self->_localizationOutput;
}

- (void)setLocalizationOutput:(id)a3
{
}

- (MLCTensor)classificationOutput
{
  return self->_classificationOutput;
}

- (void)setClassificationOutput:(id)a3
{
}

- (MLCTensor)softmaxOutput
{
  return self->_softmaxOutput;
}

- (void)setSoftmaxOutput:(id)a3
{
}

- (MLCTensor)lossResultTensor
{
  return self->_lossResultTensor;
}

- (void)setLossResultTensor:(id)a3
{
}

- (NSDictionary)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
}

- (unint64_t)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(unint64_t)a3
{
  self->_numClasses = a3;
}

- (unint64_t)numAnchorBoxes
{
  return self->_numAnchorBoxes;
}

- (void)setNumAnchorBoxes:(unint64_t)a3
{
  self->_numAnchorBoxes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_lossResultTensor, 0);
  objc_storeStrong((id *)&self->_softmaxOutput, 0);
  objc_storeStrong((id *)&self->_classificationOutput, 0);
  objc_storeStrong((id *)&self->_localizationOutput, 0);
  objc_storeStrong((id *)&self->_weightsClass, 0);
  objc_storeStrong((id *)&self->_weightsCoordinates, 0);
  objc_storeStrong((id *)&self->_labelClass, 0);
  objc_storeStrong((id *)&self->_labelConfidence, 0);
  objc_storeStrong((id *)&self->_labelCoordinates, 0);
  objc_storeStrong((id *)&self->_sceneNetInput2, 0);
  objc_storeStrong((id *)&self->_sceneNetInput1, 0);
}

@end