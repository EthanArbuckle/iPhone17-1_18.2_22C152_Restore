@interface VisionCoreFaceprintInferenceNetworkDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)FPrev3_1FArev1_3_MD2AndReturnError:(id *)a3;
+ (id)FPrev4_0FArev1_4_MD2AndReturnError:(id *)a3;
+ (id)_outputNameForFaceAttribute:(id)a3 error:(id *)a4;
+ (id)faceAttributesV1_3;
+ (id)faceprintInferenceNetworkDescriptorForIndentifier:(uint64_t)a1 modelName:(void *)a2 aneModelName:(void *)a3 pixelFotmatType:(void *)a4 faceAnalyzerDetectorVersion:(void *)a5 faceprintVersion:(void *)a6 faceattributesVersion:(void *)a7 error:(uint64_t)a8;
- (BOOL)isEqual:(id)a3;
- (NSArray)faceAttributes;
- (VisionCoreFaceprintInferenceNetworkDescriptor)initWithCoder:(id)a3;
- (VisionCoreTensorDescriptor)faceprintOutput;
- (id)ANESpecificURL;
- (id)outputForFaceAttribute:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreFaceprintInferenceNetworkDescriptor

void __88__VisionCoreFaceprintInferenceNetworkDescriptor_faceattributesForDescriptorIndentifier___block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"FPrev3_1FArev1_3_MD2";
  v0 = +[VisionCoreFaceprintInferenceNetworkDescriptor faceAttributesV1_3]();
  v4[1] = @"FPrev4_0FArev1_4_MD2";
  v5[0] = v0;
  self;
  v1 = +[VisionCoreFaceprintInferenceNetworkDescriptor faceAttributesV1_3]();
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)faceattributesForDescriptorIndentifier__descriptorIndentifiersToFaceattributes;
  faceattributesForDescriptorIndentifier__descriptorIndentifiersToFaceattributes = v2;
}

+ (id)faceAttributesV1_3
{
  self;
  if (faceAttributesV1_3_onceToken != -1) {
    dispatch_once(&faceAttributesV1_3_onceToken, &__block_literal_global_1805);
  }
  v0 = (void *)faceAttributesV1_3_faceAttributes;
  return v0;
}

+ (id)FPrev3_1FArev1_3_MD2AndReturnError:(id *)a3
{
  v5 = [[VisionCoreResourceVersion alloc] initWithMajor:3 minor:1 micro:0];
  v6 = [[VisionCoreResourceVersion alloc] initWithMajor:3 minor:1 micro:0];
  v7 = [[VisionCoreResourceVersion alloc] initWithMajor:1 minor:3 micro:0];
  v8 = +[VisionCoreFaceprintInferenceNetworkDescriptor faceprintInferenceNetworkDescriptorForIndentifier:modelName:aneModelName:pixelFotmatType:faceAnalyzerDetectorVersion:faceprintVersion:faceattributesVersion:error:]((uint64_t)a1, @"FPrev3_1FArev1_3_MD2", @"facerec_fp3.1_fa1.3.espresso", 0, v5, v6, v7, (uint64_t)a3);

  return v8;
}

+ (id)FPrev4_0FArev1_4_MD2AndReturnError:(id *)a3
{
  v5 = [[VisionCoreResourceVersion alloc] initWithMajor:4 minor:0 micro:0];
  v6 = [[VisionCoreResourceVersion alloc] initWithMajor:4 minor:0 micro:0];
  v7 = [[VisionCoreResourceVersion alloc] initWithMajor:1 minor:4 micro:0];
  v8 = +[VisionCoreFaceprintInferenceNetworkDescriptor faceprintInferenceNetworkDescriptorForIndentifier:modelName:aneModelName:pixelFotmatType:faceAnalyzerDetectorVersion:faceprintVersion:faceattributesVersion:error:]((uint64_t)a1, @"FPrev4_0FArev1_4_MD2", @"facerec_fp4.0_fa1.4_md2_2_fp16.espresso", @"facerec_fp4.0_fa1.4_md2_2_fp16_dev_op.espresso", v5, v6, v7, (uint64_t)a3);

  return v8;
}

+ (id)faceprintInferenceNetworkDescriptorForIndentifier:(uint64_t)a1 modelName:(void *)a2 aneModelName:(void *)a3 pixelFotmatType:(void *)a4 faceAnalyzerDetectorVersion:(void *)a5 faceprintVersion:(void *)a6 faceattributesVersion:(void *)a7 error:(uint64_t)a8
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  uint64_t v20 = self;
  uint64_t v32 = MEMORY[0x263EF8330];
  uint64_t v33 = 3221225472;
  v34 = __211__VisionCoreFaceprintInferenceNetworkDescriptor_faceprintInferenceNetworkDescriptorForIndentifier_modelName_aneModelName_pixelFotmatType_faceAnalyzerDetectorVersion_faceprintVersion_faceattributesVersion_error___block_invoke;
  v35 = &unk_26488B3C8;
  id v36 = v15;
  id v37 = v16;
  id v41 = v17;
  uint64_t v42 = v20;
  int v43 = 1111970369;
  id v38 = v14;
  id v39 = v18;
  id v40 = v19;
  id v21 = v17;
  id v22 = v19;
  id v23 = v18;
  id v24 = v14;
  id v25 = v16;
  id v26 = v15;
  v27 = (void *)MEMORY[0x230F41C60](&v32);
  v28 = +[VisionCoreFrameworkManager sharedManager];
  v29 = [v28 inferenceNetworkDescriptorsCache];
  v30 = [v29 objectForIdentifier:v24 creationBlock:v27 error:a8];

  return v30;
}

- (id)ANESpecificURL
{
  aneSpecificModelURL = self->_aneSpecificModelURL;
  if (aneSpecificModelURL)
  {
    v3 = aneSpecificModelURL;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VisionCoreFaceprintInferenceNetworkDescriptor;
    v3 = [(VisionCoreEspressoNetworkDescriptor *)&v5 ANESpecificURL];
  }
  return v3;
}

VisionCoreFaceprintInferenceNetworkDescriptor *__211__VisionCoreFaceprintInferenceNetworkDescriptor_faceprintInferenceNetworkDescriptorForIndentifier_modelName_aneModelName_pixelFotmatType_faceAnalyzerDetectorVersion_faceprintVersion_faceattributesVersion_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v4 = +[VisionCoreEspressoUtils URLForModelNamed:*(void *)(a1 + 32) error:a2];
  if (!v4) {
    goto LABEL_4;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    uint64_t v6 = +[VisionCoreEspressoUtils URLForModelNamed:v5 error:a2];
    if (!v6)
    {
LABEL_4:
      v7 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v49 = (void *)v6;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = self;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__VisionCoreFaceprintInferenceNetworkDescriptor_faceattributesForDescriptorIndentifier___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v9;
  if (faceattributesForDescriptorIndentifier__onceToken != -1) {
    dispatch_once(&faceattributesForDescriptorIndentifier__onceToken, block);
  }
  v10 = [(id)faceattributesForDescriptorIndentifier__descriptorIndentifiersToFaceattributes objectForKey:v8];

  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v11 setObject:&unk_26DE6F848 forKeyedSubscript:@"flatten_output"];
  [v11 setObject:&unk_26DE6F848 forKeyedSubscript:@"confidence"];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v53 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [(id)objc_opt_class() _outputNameForFaceAttribute:*(void *)(*((void *)&v52 + 1) + 8 * i) error:a2];
        if (!v17)
        {
          v7 = 0;
          id v20 = v12;
          id v22 = v49;
          goto LABEL_24;
        }
        id v18 = (void *)v17;
        [v11 setObject:&unk_26DE6F848 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v52 objects:v59 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v50 = 0;
  id v51 = 0;
  BOOL v19 = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:&v51 outputTensorDescriptors:&v50 forNetworkModelFileURL:v4 inputBlobName:@"data" pixelFormatType:*(unsigned int *)(a1 + 88) outputBlobNamesWithTypes:v11 confidencesBlobNamesWithLabelsFiles:0 error:a2];
  id v20 = v51;
  id v21 = v50;
  v7 = 0;
  id v22 = v49;
  if (v19)
  {
    v57[0] = @"VisionCoreFaceprintInferenceNetworkHeadIdentifierFaceprint";
    v57[1] = @"VisionCoreFaceprintInferenceNetworkHeadIdentifierFaceAttributes";
    uint64_t v23 = *(void *)(a1 + 64);
    v58[0] = *(void *)(a1 + 56);
    v58[1] = v23;
    id v24 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
    v7 = [VisionCoreFaceprintInferenceNetworkDescriptor alloc];
    id v25 = *(void **)(a1 + 72);
    id v46 = v49;
    id v48 = v21;
    id v44 = v21;
    id v26 = @"flatten_output";
    id v45 = v12;
    int v43 = v7;
    v47 = v24;
    if (v7)
    {
      v27 = @"confidence";
      id v42 = v20;
      id v41 = v24;
      id v28 = v25;
      id v29 = v4;
      v30 = [[VisionCoreProcessingDescriptorSpecifier alloc] initWithIdentifier:@"VisionCoreInferenceNetworkIdentifierFaceprint" version:v28];

      v31 = v44;
      uint64_t v32 = [v44 allValues];
      uint64_t v33 = [v44 objectForKeyedSubscript:@"confidence"];

      uint64_t v34 = [(VisionCoreInferenceNetworkDescriptor *)v43 initWithURL:v29 specifier:v30 networkHeadVersions:v41 inputImage:v42 outputs:v32 confidencesOutput:v33];
      id v22 = v49;
      v35 = v45;
      if (v34)
      {
        uint64_t v36 = [v44 objectForKeyedSubscript:@"flatten_output"];
        id v37 = *(void **)(v34 + 64);
        *(void *)(v34 + 64) = v36;

        uint64_t v38 = [v45 copy];
        id v39 = *(void **)(v34 + 80);
        *(void *)(v34 + 80) = v38;

        objc_storeStrong((id *)(v34 + 72), v49);
      }
      v7 = (VisionCoreFaceprintInferenceNetworkDescriptor *)(id)v34;
    }
    else
    {
      id v22 = v49;
      v31 = v44;
      v35 = v45;
    }

    id v21 = v48;
  }

LABEL_24:
LABEL_25:

  return v7;
}

+ (id)_outputNameForFaceAttribute:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"softmax_%@_output", v5];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:@"illegal face attribute"];
    uint64_t v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __67__VisionCoreFaceprintInferenceNetworkDescriptor_faceAttributesV1_3__block_invoke()
{
  v2[18] = *MEMORY[0x263EF8340];
  v2[0] = @"UNKNOWN_0";
  v2[1] = @"UNKNOWN_1";
  v2[2] = @"UNKNOWN_2";
  v2[3] = @"UNKNOWN_3";
  v2[4] = @"UNKNOWN_4";
  v2[5] = @"UNKNOWN_5";
  v2[6] = @"UNKNOWN_6";
  v2[7] = @"UNKNOWN_7";
  v2[8] = @"UNKNOWN_8";
  v2[9] = @"UNKNOWN_9";
  v2[10] = @"UNKNOWN_10";
  v2[11] = @"UNKNOWN_11";
  v2[12] = @"UNKNOWN_12";
  v2[13] = @"UNKNOWN_13";
  v2[14] = @"UNKNOWN_14";
  v2[15] = @"UNKNOWN_15";
  v2[16] = @"UNKNOWN_16";
  v2[17] = @"UNKNOWN_17";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:18];
  v1 = (void *)faceAttributesV1_3_faceAttributes;
  faceAttributesV1_3_faceAttributes = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceAttributes, 0);
  objc_storeStrong((id *)&self->_aneSpecificModelURL, 0);
  objc_storeStrong((id *)&self->_faceprintOutput, 0);
}

- (NSArray)faceAttributes
{
  return self->_faceAttributes;
}

- (VisionCoreTensorDescriptor)faceprintOutput
{
  return self->_faceprintOutput;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VisionCoreFaceprintInferenceNetworkDescriptor *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)VisionCoreFaceprintInferenceNetworkDescriptor,
          [(VisionCoreInferenceNetworkDescriptor *)&v10 isEqual:v4]))
    {
      id v5 = v4;
      uint64_t v6 = [(VisionCoreFaceprintInferenceNetworkDescriptor *)self faceprintOutput];
      v7 = [(VisionCoreFaceprintInferenceNetworkDescriptor *)v5 faceprintOutput];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (VisionCoreFaceprintInferenceNetworkDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VisionCoreFaceprintInferenceNetworkDescriptor;
  id v5 = [(VisionCoreInferenceNetworkDescriptor *)&v10 initWithCoder:v4];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceprintOutput"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        faceprintOutput = v5->_faceprintOutput,
        v5->_faceprintOutput = (VisionCoreTensorDescriptor *)v6,
        faceprintOutput,
        !v5->_faceprintOutput))
  {
    char v8 = 0;
  }
  else
  {
    char v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VisionCoreFaceprintInferenceNetworkDescriptor;
  id v4 = a3;
  [(VisionCoreInferenceNetworkDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceprintOutput, @"faceprintOutput", v5.receiver, v5.super_class);
}

- (id)outputForFaceAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _outputNameForFaceAttribute:v6 error:a4];

  if (v7)
  {
    char v8 = [(VisionCoreInferenceNetworkDescriptor *)self outputNamed:v7 error:a4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end