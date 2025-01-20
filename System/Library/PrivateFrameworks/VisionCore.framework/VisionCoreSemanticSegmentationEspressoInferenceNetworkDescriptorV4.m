@interface VisionCoreSemanticSegmentationEspressoInferenceNetworkDescriptorV4
+ (id)objectClassOutputNameForObjectClassID:(unint64_t)a3 error:(id *)a4;
+ (id)objectClassOutputNamesForObjectClassIDs:(unint64_t)a3 error:(id *)a4;
+ (id)semanticSegmentationV4AndReturnError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)humanAttributesMasksOutput;
- (VisionCoreTensorDescriptor)glassesMaskOutput;
- (VisionCoreTensorDescriptor)personsMaskOutput;
- (VisionCoreTensorDescriptor)skyMaskOutput;
@end

@implementation VisionCoreSemanticSegmentationEspressoInferenceNetworkDescriptorV4

- (BOOL)isEqual:(id)a3
{
  v4 = (VisionCoreSemanticSegmentationEspressoInferenceNetworkDescriptorV4 *)a3;
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
      v7.super_class = (Class)VisionCoreSemanticSegmentationEspressoInferenceNetworkDescriptorV4;
      BOOL v5 = [(VisionCoreInferenceNetworkDescriptor *)&v7 isEqual:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (VisionCoreTensorDescriptor)glassesMaskOutput
{
  v2 = [(VisionCoreInferenceNetworkDescriptor *)self outputs];
  v3 = [v2 objectForKeyedSubscript:@"glasses:0"];

  return (VisionCoreTensorDescriptor *)v3;
}

- (VisionCoreTensorDescriptor)skyMaskOutput
{
  v2 = [(VisionCoreInferenceNetworkDescriptor *)self outputs];
  v3 = [v2 objectForKeyedSubscript:@"sky:0"];

  return (VisionCoreTensorDescriptor *)v3;
}

- (NSArray)humanAttributesMasksOutput
{
  v9[4] = *MEMORY[0x263EF8340];
  v2 = [(VisionCoreInferenceNetworkDescriptor *)self outputs];
  v3 = [v2 objectForKeyedSubscript:@"skin:0"];
  v9[0] = v3;
  v4 = [v2 objectForKeyedSubscript:@"hair:0"];
  v9[1] = v4;
  BOOL v5 = [v2 objectForKeyedSubscript:@"semantics-estimator/split_channels_1__2"];
  v9[2] = v5;
  v6 = [v2 objectForKeyedSubscript:@"teeth:0"];
  v9[3] = v6;
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  return (NSArray *)v7;
}

- (VisionCoreTensorDescriptor)personsMaskOutput
{
  v2 = [(VisionCoreInferenceNetworkDescriptor *)self outputs];
  v3 = [v2 objectForKeyedSubscript:@"person:0"];

  return (VisionCoreTensorDescriptor *)v3;
}

+ (id)semanticSegmentationV4AndReturnError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v4 = [[VisionCoreResourceVersion alloc] initWithMajor:1 minor:0 micro:0];
  BOOL v5 = @"personsemantics-u8-v4.espresso";
  v6 = v4;
  objc_super v7 = @"image:0";
  id v8 = &unk_26DE6FB30;
  self;
  v9 = +[VisionCoreEspressoUtils URLForModelNamed:@"personsemantics-u8-v4.espresso" error:a3];
  if (v9)
  {
    uint64_t v10 = [&unk_26DE6FB30 count];
    v11 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v10];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = &unk_26DE6FB30;
    uint64_t v13 = [&unk_26DE6FB30 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(&unk_26DE6FB30);
          }
          [v11 setObject:&unk_26DE6F830 forKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        }
        uint64_t v14 = [&unk_26DE6FB30 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v14);
    }

    id v25 = 0;
    id v26 = 0;
    BOOL v17 = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:&v26 outputTensorDescriptors:&v25 forNetworkModelFileURL:v9 inputBlobName:@"image:0" pixelFormatType:1111970369 outputBlobNamesWithTypes:v11 confidencesBlobNamesWithLabelsFiles:0 error:a3];
    id v18 = v26;
    id v19 = v25;
    v20 = 0;
    if (v17)
    {
      v21 = [[VisionCoreProcessingDescriptorSpecifier alloc] initWithIdentifier:@"VisionCoreInferenceNetworkIdentifierSemanticSegmentationEspressoV4" version:v6];
      v22 = [VisionCoreSemanticSegmentationEspressoInferenceNetworkDescriptorV4 alloc];
      v23 = [v19 allValues];
      v20 = [(VisionCoreInferenceNetworkDescriptor *)v22 initWithURL:v9 specifier:v21 networkHeadVersions:0 inputImage:v18 outputs:v23 confidencesOutput:0];
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)objectClassOutputNamesForObjectClassIDs:(unint64_t)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  self;
  if (_objectClassIDsToObjectOutputNames_onceToken != -1) {
    dispatch_once(&_objectClassIDsToObjectOutputNames_onceToken, &__block_literal_global_1404);
  }
  id v6 = (id)_objectClassIDsToObjectOutputNames_objectClassIDsToObjectClassOutputNames;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = [v6 allKeys];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (([v13 unsignedIntegerValue] & a3) != 0)
        {
          uint64_t v14 = [v6 objectForKey:v13];
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  uint64_t v15 = [v7 count];
  if (a4 && !v15)
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown object class ID %lu", a3);
    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v16];
  }
  BOOL v17 = (void *)[v7 copy];

  return v17;
}

void __104__VisionCoreSemanticSegmentationEspressoInferenceNetworkDescriptorV4__objectClassIDsToObjectOutputNames__block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26DE6F788;
  v2[1] = &unk_26DE6F7A0;
  v3[0] = @"person:0";
  v3[1] = @"sky:0";
  v2[2] = &unk_26DE6F7B8;
  v2[3] = &unk_26DE6F7D0;
  v3[2] = @"skin:0";
  v3[3] = @"hair:0";
  v2[4] = &unk_26DE6F7E8;
  v2[5] = &unk_26DE6F800;
  v3[4] = @"semantics-estimator/split_channels_1__2";
  v3[5] = @"teeth:0";
  v2[6] = &unk_26DE6F818;
  v3[6] = @"glasses:0";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)_objectClassIDsToObjectOutputNames_objectClassIDsToObjectClassOutputNames;
  _objectClassIDsToObjectOutputNames_objectClassIDsToObjectClassOutputNames = v0;
}

+ (id)objectClassOutputNameForObjectClassID:(unint64_t)a3 error:(id *)a4
{
  if ((uint64_t)a3 > 383)
  {
    if (a3 != 0x1FFF && a3 != 384) {
      goto LABEL_10;
    }
  }
  else if (a3 != 13 && a3 != 60)
  {
LABEL_10:
    id v7 = [a1 objectClassOutputNamesForObjectClassIDs:a3 error:a4];
    BOOL v5 = v7;
    if (v7)
    {
      id v6 = [v7 firstObject];
    }
    else
    {
      id v6 = 0;
    }
    goto LABEL_13;
  }
  if (!a4)
  {
    id v6 = 0;
    goto LABEL_14;
  }
  BOOL v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"This method accepts individual object class ID only %lu", a3);
  [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v5];
  id v6 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
  return v6;
}

@end