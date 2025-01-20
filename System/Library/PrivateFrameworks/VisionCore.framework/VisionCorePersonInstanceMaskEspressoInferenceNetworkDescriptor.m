@interface VisionCorePersonInstanceMaskEspressoInferenceNetworkDescriptor
+ (id)personInstanceMaskV1AndReturnError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)personInstanceMaskConfidencesOutput;
- (NSArray)personInstanceMasksOutput;
@end

@implementation VisionCorePersonInstanceMaskEspressoInferenceNetworkDescriptor

- (BOOL)isEqual:(id)a3
{
  v4 = (VisionCorePersonInstanceMaskEspressoInferenceNetworkDescriptor *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7.receiver = self;
      v7.super_class = (Class)VisionCorePersonInstanceMaskEspressoInferenceNetworkDescriptor;
      BOOL v5 = [(VisionCoreInferenceNetworkDescriptor *)&v7 isEqual:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (NSArray)personInstanceMaskConfidencesOutput
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(VisionCoreInferenceNetworkDescriptor *)self outputs];
  v3 = [v2 objectForKeyedSubscript:@"person_instance_confidences:0"];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return (NSArray *)v4;
}

- (NSArray)personInstanceMasksOutput
{
  v9[4] = *MEMORY[0x263EF8340];
  v2 = [(VisionCoreInferenceNetworkDescriptor *)self outputs];
  v3 = [v2 objectForKeyedSubscript:@"person_instances_1:0"];
  v9[0] = v3;
  v4 = [v2 objectForKeyedSubscript:@"person_instances_2:0"];
  v9[1] = v4;
  BOOL v5 = [v2 objectForKeyedSubscript:@"person_instances_3:0"];
  v9[2] = v5;
  v6 = [v2 objectForKeyedSubscript:@"person_instances_4:0"];
  v9[3] = v6;
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  return (NSArray *)v7;
}

+ (id)personInstanceMaskV1AndReturnError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v4 = VisionCoreANEArchitectureName();
  BOOL v5 = v4;
  if (v4 && [v4 length])
  {
    v6 = [@"." stringByAppendingString:v5];
  }
  else
  {
    v6 = &stru_26DE66AF0;
  }
  objc_super v7 = [(__CFString *)v6 stringByAppendingFormat:@".espresso"];

  v8 = [@"HyperDETR-u8-v1.1" stringByAppendingFormat:@"%@", v7];
  v9 = [[VisionCoreResourceVersion alloc] initWithMajor:1 minor:0 micro:0];
  id v10 = v8;
  v11 = v9;
  v12 = @"image";
  id v13 = &unk_26DE6FB00;
  v14 = @"person_instance_confidences:0";
  self;
  v15 = +[VisionCoreEspressoUtils URLForModelNamed:v10 error:a3];
  if (v15)
  {
    v31 = a3;
    v32 = v7;
    uint64_t v16 = [&unk_26DE6FB00 count];
    v17 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v16];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v18 = &unk_26DE6FB00;
    uint64_t v19 = [&unk_26DE6FB00 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(&unk_26DE6FB00);
          }
          [v17 setObject:&unk_26DE6F6C8 forKeyedSubscript:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        }
        uint64_t v20 = [&unk_26DE6FB00 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v20);
    }

    [v17 setObject:&unk_26DE6F6C8 forKeyedSubscript:@"person_instance_confidences:0"];
    id v33 = 0;
    id v34 = 0;
    BOOL v23 = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:&v34 outputTensorDescriptors:&v33 forNetworkModelFileURL:v15 inputBlobName:@"image" pixelFormatType:1111970369 outputBlobNamesWithTypes:v17 confidencesBlobNamesWithLabelsFiles:0 error:v31];
    id v24 = v34;
    id v25 = v33;
    v26 = 0;
    if (v23)
    {
      v27 = [[VisionCoreProcessingDescriptorSpecifier alloc] initWithIdentifier:@"VisionCoreInferenceNetworkIdentifierPersonInstanceMaskEspresso" version:v11];
      v28 = [VisionCorePersonInstanceMaskEspressoInferenceNetworkDescriptor alloc];
      v29 = [v25 allValues];
      v26 = [(VisionCoreInferenceNetworkDescriptor *)v28 initWithURL:v15 specifier:v27 networkHeadVersions:0 inputImage:v24 outputs:v29 confidencesOutput:0];
    }
    objc_super v7 = v32;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end