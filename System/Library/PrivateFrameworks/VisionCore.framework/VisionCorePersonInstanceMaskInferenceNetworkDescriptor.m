@interface VisionCorePersonInstanceMaskInferenceNetworkDescriptor
+ (id)modelFileURLForModelVersion:(unint64_t)a3 error:(id *)a4;
+ (id)objectClassOutputNameForObjectClassID:(unint64_t)a3 modelVersion:(unint64_t)a4 error:(id *)a5;
+ (id)objectClassOutputNamesForObjectClassIDs:(unint64_t)a3 modelVersion:(unint64_t)a4 error:(id *)a5;
+ (id)personInstanceMaskForModelVersion:(unint64_t)a3 computeDeviceType:(unint64_t)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)personInstanceMaskConfidencesOutput;
- (NSArray)personInstanceMasksOutput;
- (id)objectMaskDescriptorsForObjectClassIDs:(unint64_t)a3 error:(id *)a4;
- (id)objectMaskDescriptorsForObjectClassNames:(id)a3 error:(id *)a4;
@end

@implementation VisionCorePersonInstanceMaskInferenceNetworkDescriptor

- (BOOL)isEqual:(id)a3
{
  v4 = (VisionCorePersonInstanceMaskInferenceNetworkDescriptor *)a3;
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
      v7.super_class = (Class)VisionCorePersonInstanceMaskInferenceNetworkDescriptor;
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

- (id)objectMaskDescriptorsForObjectClassNames:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = [(VisionCoreInferenceNetworkDescriptor *)self outputs];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v8 objectForKeyedSubscript:v14];
        if (!v15)
        {
          if (a4)
          {
            v18 = (void *)[[NSString alloc] initWithFormat:@"Descriptor with name %@ doesn't exist", v14];
            *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v18];
          }
          id v17 = 0;
          goto LABEL_13;
        }
        v16 = (void *)v15;
        [v7 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v17 = v7;
LABEL_13:

  return v17;
}

- (id)objectMaskDescriptorsForObjectClassIDs:(unint64_t)a3 error:(id *)a4
{
  if (self)
  {
    id v7 = [(VisionCoreE5RTInferenceFunctionDescriptor *)self function];
    v8 = [v7 programLibrary];
    id v9 = [v8 URL];
    uint64_t v10 = [v9 absoluteString];
    uint64_t v11 = [v10 lastPathComponent];

    uint64_t v12 = +[VisionCoreEspressoUtils E5RTBaseModelName:v11 error:a4];
    if ([@"HyperDETR-u8-v1.1.e5.espresso.net" containsString:v12])
    {

      uint64_t v11 = +[VisionCorePersonInstanceMaskInferenceNetworkDescriptor objectClassOutputNamesForObjectClassIDs:a3 modelVersion:1 error:a4];
      v13 = [(VisionCorePersonInstanceMaskInferenceNetworkDescriptor *)self objectMaskDescriptorsForObjectClassNames:v11 error:a4];
    }
    else
    {
      if (a4)
      {
        *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:@"Unknown model version"];
      }

      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

+ (id)personInstanceMaskForModelVersion:(unint64_t)a3 computeDeviceType:(unint64_t)a4 error:(id *)a5
{
  if (a3 == 1)
  {
    char v6 = a4;
    self;
    id v7 = [[VisionCoreResourceVersion alloc] initWithMajor:1 minor:0 micro:0];
    v8 = @"HyperDETR-u8-v1.1.e5.espresso.net";
    id v9 = @"HyperDETR-u8-v1.1";
    uint64_t v10 = @"image:0";
    uint64_t v11 = @"main";
    id v12 = &unk_26DE6FB18;
    v13 = @"person_instance_confidences:0";
    uint64_t v14 = self;
    if ((v6 & 4) != 0)
    {
      v16 = (void *)v14;
      id v17 = @"HyperDETR-u8-v1.1.e5.espresso.net";
      self;
      char v18 = [@"HyperDETR-u8-v1.1.e5.espresso.net" containsString:@"HyperDETR-u8-v1.1.e5.espresso.net"];

      if (v18)
      {
        uint64_t v19 = 13;
      }
      else
      {
        [MEMORY[0x263F087E8] VisionCoreAssert:0 log:@"Unknown person instance model"];
        uint64_t v19 = -1;
      }
      long long v20 = @"HyperDETR-u8-v1.1.e5.espresso.net";
      self;
      char v21 = [@"HyperDETR-u8-v1.1.e5.espresso.net" containsString:@"HyperDETR-u8-v1.1.e5.espresso.net"];

      if (v21)
      {
        uint64_t v22 = 13;
      }
      else
      {
        [MEMORY[0x263F087E8] VisionCoreAssert:0 log:@"Unknown person instance model"];
        uint64_t v22 = -1;
      }
      long long v23 = [v16 loadOrCompileProgramLibrary:@"HyperDETR-u8-v1.1.e5.espresso.net" modelBaseName:@"HyperDETR-u8-v1.1" e5rtComputeDeviceType:4 supportedOnANEFrom:v19 fullyANEResidentFrom:v22 allowCompilation:0 error:a5];
      if (v23)
      {
        uint64_t v15 = +[VisionCoreE5RTInferenceFunctionDescriptor descriptorForProgramLibrary:v23 functionName:@"main" inputImageName:@"image:0" outputNames:&unk_26DE6FB18 confidencesOutputName:@"person_instance_confidences:0" labelsFileName:0 error:a5];
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
    else if (a5)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:@"The model is only supported with the ANE compute device"];
      uint64_t v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    if (!a5)
    {
      uint64_t v15 = 0;
      goto LABEL_21;
    }
    id v7 = (VisionCoreResourceVersion *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown model version %lu", a3);
    [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v7];
    uint64_t v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_21:
  return v15;
}

+ (id)objectClassOutputNamesForObjectClassIDs:(unint64_t)a3 modelVersion:(unint64_t)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  self;
  if (a4 != 1)
  {
    if (!a5)
    {
      id v8 = 0;
      goto LABEL_23;
    }
    id v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown model version %lu", a4);
    *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v17];

    id v8 = 0;
LABEL_18:
    a5 = 0;
    goto LABEL_23;
  }
  self;
  if (_objectClassIDsToObjectOutputNamesV1_onceToken != -1) {
    dispatch_once(&_objectClassIDsToObjectOutputNamesV1_onceToken, &__block_literal_global_1121);
  }
  id v8 = (id)_objectClassIDsToObjectOutputNamesV1_objectClassIDsToObjectClassOutputNames;
  if (!v8) {
    goto LABEL_18;
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v10 = [v8 allKeys];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v15 unsignedIntegerValue] & a3) != 0)
        {
          v16 = [v8 objectForKey:v15];
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
  if ([v9 count])
  {
    a5 = (id *)[v9 copy];
  }
  else if (a5)
  {
    char v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown object class ID %lu", a3);
    *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v18];

    a5 = 0;
  }

LABEL_23:
  return a5;
}

void __94__VisionCorePersonInstanceMaskInferenceNetworkDescriptor__objectClassIDsToObjectOutputNamesV1__block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26DE6F6F8;
  v2[1] = &unk_26DE6F710;
  v3[0] = @"person_instances_1:0";
  v3[1] = @"person_instances_2:0";
  v2[2] = &unk_26DE6F728;
  v2[3] = &unk_26DE6F740;
  v3[2] = @"person_instances_3:0";
  v3[3] = @"person_instances_4:0";
  v2[4] = &unk_26DE6F758;
  v2[5] = &unk_26DE6F770;
  v3[4] = @"person_instance_confidences:0";
  v3[5] = @"person_instance_boxes:0";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)_objectClassIDsToObjectOutputNamesV1_objectClassIDsToObjectClassOutputNames;
  _objectClassIDsToObjectOutputNamesV1_objectClassIDsToObjectClassOutputNames = v0;
}

+ (id)objectClassOutputNameForObjectClassID:(unint64_t)a3 modelVersion:(unint64_t)a4 error:(id *)a5
{
  if (a3 == 63 || a3 == 6)
  {
    if (!a5)
    {
      id v7 = 0;
      goto LABEL_10;
    }
    char v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"This method accepts individual object class ID only %lu", a3);
    [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v6];
    id v7 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = [a1 objectClassOutputNamesForObjectClassIDs:a3 modelVersion:a4 error:a5];
    char v6 = v8;
    if (v8)
    {
      id v7 = [v8 firstObject];
    }
    else
    {
      id v7 = 0;
    }
  }

LABEL_10:
  return v7;
}

+ (id)modelFileURLForModelVersion:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    BOOL v5 = +[VisionCoreEspressoUtils E5RTURLForModelNamed:@"HyperDETR-u8-v1.1.e5.espresso.net" error:a4];
  }
  else if (a4)
  {
    id v6 = [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:@"Unknown model version"];
    BOOL v5 = 0;
    *a4 = v6;
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

@end