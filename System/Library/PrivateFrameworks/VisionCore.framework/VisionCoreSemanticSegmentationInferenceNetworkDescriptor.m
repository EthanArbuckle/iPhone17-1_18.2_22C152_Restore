@interface VisionCoreSemanticSegmentationInferenceNetworkDescriptor
+ (id)_descriptorWithModelFileName:(void *)a3 modelBaseName:(void *)a4 version:(void *)a5 modelVersion:(uint64_t)a6 inputImageName:(uint64_t)a7 functionName:pixelFormatType:semanticSegmentationObjectsOutputNames:e5rtComputeDeviceType:error:;
+ (id)_objectClassIDsToObjectClassesDetectionStatusIndexesV6;
+ (id)_objectClassIDsToObjectOutputNamesForModelVersion:(void *)a3 error:;
+ (id)modelFileURLForModelVersion:(unint64_t)a3 error:(id *)a4;
+ (id)objectClassIDsToObjectClassesDetectionStatusIndexes:(unint64_t)a3 modelVersion:(unint64_t)a4 error:(id *)a5;
+ (id)objectClassNamesToObjectClassesDetectionStatusIndexes:(id)a3 modelVersion:(unint64_t)a4 error:(id *)a5;
+ (id)objectClassOutputNameForObjectClassID:(unint64_t)a3 modelVersion:(unint64_t)a4 error:(id *)a5;
+ (id)objectClassOutputNamesForObjectClassIDs:(unint64_t)a3 modelVersion:(unint64_t)a4 error:(id *)a5;
+ (id)semanticSegmentationForModelVersion:(unint64_t)a3 computeDeviceType:(unint64_t)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (id)objectMaskDescriptorsForObjectClassIDs:(unint64_t)a3 error:(id *)a4;
- (id)objectMaskDescriptorsForObjectClassNames:(id)a3 error:(id *)a4;
@end

@implementation VisionCoreSemanticSegmentationInferenceNetworkDescriptor

- (BOOL)isEqual:(id)a3
{
  v4 = (VisionCoreSemanticSegmentationInferenceNetworkDescriptor *)a3;
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
      v7.super_class = (Class)VisionCoreSemanticSegmentationInferenceNetworkDescriptor;
      BOOL v5 = [(VisionCoreInferenceNetworkDescriptor *)&v7 isEqual:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
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
  v4 = self;
  if (self)
  {
    id v7 = [(VisionCoreE5RTInferenceFunctionDescriptor *)self function];
    v8 = [v7 programLibrary];
    id v9 = [v8 URL];
    uint64_t v10 = [v9 absoluteString];
    uint64_t v11 = [v10 lastPathComponent];

    if ([v11 containsString:@"personsemantics-u8-v4"])
    {
      uint64_t v12 = 1;
    }
    else
    {
      if (([v11 containsString:@"camalgoseg.flows.lowres-s2h6ysbnuy_82500"] & 1) == 0)
      {
        if (a4)
        {
          [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:@"Unknown model version"];
          v4 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v4 = 0;
        }
        goto LABEL_7;
      }
      uint64_t v12 = 2;
    }

    uint64_t v11 = +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor objectClassOutputNamesForObjectClassIDs:a3 modelVersion:v12 error:a4];
    v4 = [v4 objectMaskDescriptorsForObjectClassNames:v11 error:a4];
LABEL_7:
  }
  return v4;
}

+ (id)semanticSegmentationForModelVersion:(unint64_t)a3 computeDeviceType:(unint64_t)a4 error:(id *)a5
{
  if (a3 == 2)
  {
    uint64_t v7 = self;
    v8 = [[VisionCoreResourceVersion alloc] initWithMajor:1 minor:0 micro:0];
    id v9 = @"camalgoseg.flows.lowres-s2h6ysbnuy_82500.bundle/camalgoseg.flows.lowres-s2h6ysbnuy_82500.mil";
    uint64_t v10 = @"camalgoseg.flows.lowres-s2h6ysbnuy_82500";
    uint64_t v11 = @"image";
    uint64_t v12 = &unk_26DE6FB60;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v7 = self;
    v8 = [[VisionCoreResourceVersion alloc] initWithMajor:1 minor:0 micro:0];
    id v9 = @"personsemantics-u8-v4.e5.espresso.net";
    uint64_t v10 = @"personsemantics-u8-v4";
    uint64_t v11 = @"image:0";
    uint64_t v12 = &unk_26DE6FB48;
LABEL_5:
    v13 = +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor _descriptorWithModelFileName:modelBaseName:version:modelVersion:inputImageName:functionName:pixelFormatType:semanticSegmentationObjectsOutputNames:e5rtComputeDeviceType:error:](v7, v9, v10, v11, v12, a4, (uint64_t)a5);
LABEL_8:

    goto LABEL_9;
  }
  if (a5)
  {
    v8 = (VisionCoreResourceVersion *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown model version %lu", a3);
    [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v8];
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v13 = 0;
LABEL_9:
  return v13;
}

+ (id)_descriptorWithModelFileName:(void *)a3 modelBaseName:(void *)a4 version:(void *)a5 modelVersion:(uint64_t)a6 inputImageName:(uint64_t)a7 functionName:pixelFormatType:semanticSegmentationObjectsOutputNames:e5rtComputeDeviceType:error:
{
  id v12 = a4;
  v13 = @"main";
  id v14 = a5;
  id v15 = a3;
  id v16 = a2;
  id v17 = self;
  id v18 = v16;
  self;
  if (([v18 containsString:@"personsemantics-u8-v4.e5.espresso.net"] & 1) != 0
    || ([v18 containsString:@"camalgoseg.flows.lowres-s2h6ysbnuy_82500.bundle/camalgoseg.flows.lowres-s2h6ysbnuy_82500.mil"] & 1) != 0)
  {
    uint64_t v19 = 11;
  }
  else
  {
    [MEMORY[0x263F087E8] VisionCoreAssert:0 log:@"Unkknown semantic segmentation model"];
    uint64_t v19 = -1;
  }

  id v20 = v18;
  self;
  if (([v20 containsString:@"personsemantics-u8-v4.e5.espresso.net"] & 1) != 0
    || ([v20 containsString:@"camalgoseg.flows.lowres-s2h6ysbnuy_82500.bundle/camalgoseg.flows.lowres-s2h6ysbnuy_82500.mil"] & 1) != 0)
  {
    uint64_t v21 = 11;
  }
  else
  {
    [MEMORY[0x263F087E8] VisionCoreAssert:0 log:@"Unkknown person instance model"];
    uint64_t v21 = -1;
  }

  long long v22 = [v17 loadOrCompileProgramLibrary:v20 modelBaseName:v15 e5rtComputeDeviceType:a6 supportedOnANEFrom:v19 fullyANEResidentFrom:v21 allowCompilation:1 error:a7];

  if (v22)
  {
    long long v23 = +[VisionCoreE5RTInferenceFunctionDescriptor descriptorForProgramLibrary:v22 functionName:@"main" inputImageName:v12 outputNames:v14 confidencesOutputName:0 labelsFileName:0 error:a7];
  }
  else
  {
    long long v23 = 0;
  }

  return v23;
}

+ (id)objectClassNamesToObjectClassesDetectionStatusIndexes:(id)a3 modelVersion:(unint64_t)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (a4 == 2)
  {
    id v9 = +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor _objectClassIDsToObjectOutputNamesForModelVersion:error:]((uint64_t)a1, 2, a5);
    if (v9)
    {
      uint64_t v25 = a5;
      uint64_t v10 = +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor _objectClassIDsToObjectClassesDetectionStatusIndexesV6]();
      id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = v8;
      uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
        id v24 = v8;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            id v17 = [v9 allKeysForObject:v16];
            id v18 = v17;
            if (!v17 || [v17 count] != 1)
            {
              id v8 = v24;
              if (v25)
              {
                long long v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected object class name %@ or unexpected number of class IDs (%@)", v16, v18];
                *uint64_t v25 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v22];
              }
              a5 = 0;
              goto LABEL_18;
            }
            uint64_t v19 = [v18 firstObject];
            id v20 = [v10 objectForKeyedSubscript:v19];
            [v11 setObject:v20 forKey:v16];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
          id v8 = v24;
          if (v13) {
            continue;
          }
          break;
        }
      }

      a5 = (id *)[v11 copy];
LABEL_18:
    }
    else
    {
      a5 = 0;
    }
  }
  else if (a5)
  {
    uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unexpected model version %lu", a4);
    *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v21];

    a5 = 0;
  }

  return a5;
}

+ (id)_objectClassIDsToObjectOutputNamesForModelVersion:(void *)a3 error:
{
  self;
  if (a2 == 2)
  {
    self;
    if (_objectClassIDsToObjectOutputNamesV6_onceToken != -1) {
      dispatch_once(&_objectClassIDsToObjectOutputNamesV6_onceToken, &__block_literal_global_64);
    }
    BOOL v5 = &_objectClassIDsToObjectOutputNamesV6_objectClassIDsToObjectClassOutputNames;
    goto LABEL_9;
  }
  if (a2 == 1)
  {
    self;
    if (_objectClassIDsToObjectOutputNamesV4_onceToken != -1) {
      dispatch_once(&_objectClassIDsToObjectOutputNamesV4_onceToken, &__block_literal_global_2167);
    }
    BOOL v5 = &_objectClassIDsToObjectOutputNamesV4_objectClassIDsToObjectClassOutputNames;
LABEL_9:
    id v6 = (id)*v5;
    goto LABEL_13;
  }
  if (a3)
  {
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown model version %lu", a2);
    *a3 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v7];
  }
  id v6 = 0;
LABEL_13:
  return v6;
}

+ (id)_objectClassIDsToObjectClassesDetectionStatusIndexesV6
{
  self;
  if (_objectClassIDsToObjectClassesDetectionStatusIndexesV6_onceToken != -1) {
    dispatch_once(&_objectClassIDsToObjectClassesDetectionStatusIndexesV6_onceToken, &__block_literal_global_124);
  }
  v0 = (void *)_objectClassIDsToObjectClassesDetectionStatusIndexesV6_objectClassIDsToObjectClassesDetectionStatusIndexes;
  return v0;
}

void __114__VisionCoreSemanticSegmentationInferenceNetworkDescriptor__objectClassIDsToObjectClassesDetectionStatusIndexesV6__block_invoke()
{
  v3[12] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26DE6F860;
  v2[1] = &unk_26DE6F878;
  v3[0] = &unk_26DE6F998;
  v3[1] = &unk_26DE6F9B0;
  v2[2] = &unk_26DE6F950;
  v2[3] = &unk_26DE6F938;
  v3[2] = &unk_26DE6F9C8;
  v3[3] = &unk_26DE6F9E0;
  v2[4] = &unk_26DE6F908;
  v2[5] = &unk_26DE6F920;
  v3[4] = &unk_26DE6F9F8;
  v3[5] = &unk_26DE6FA10;
  v2[6] = &unk_26DE6F8A8;
  v2[7] = &unk_26DE6F8C0;
  v3[6] = &unk_26DE6FA28;
  v3[7] = &unk_26DE6FA40;
  v2[8] = &unk_26DE6F890;
  v2[9] = &unk_26DE6F8D8;
  v3[8] = &unk_26DE6FA58;
  v3[9] = &unk_26DE6FA70;
  v2[10] = &unk_26DE6F8F0;
  v2[11] = &unk_26DE6F968;
  v3[10] = &unk_26DE6FA88;
  v3[11] = &unk_26DE6FAA0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:12];
  v1 = (void *)_objectClassIDsToObjectClassesDetectionStatusIndexesV6_objectClassIDsToObjectClassesDetectionStatusIndexes;
  _objectClassIDsToObjectClassesDetectionStatusIndexesV6_objectClassIDsToObjectClassesDetectionStatusIndexes = v0;
}

void __96__VisionCoreSemanticSegmentationInferenceNetworkDescriptor__objectClassIDsToObjectOutputNamesV6__block_invoke()
{
  void v3[13] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26DE6F860;
  v2[1] = &unk_26DE6F878;
  v3[0] = @"person";
  v3[1] = @"sky";
  v2[2] = &unk_26DE6F890;
  v2[3] = &unk_26DE6F8A8;
  v3[2] = @"skin";
  v3[3] = @"hair";
  v2[4] = &unk_26DE6F8C0;
  v2[5] = &unk_26DE6F8D8;
  v3[4] = @"beard";
  v3[5] = @"teeth";
  v2[6] = &unk_26DE6F8F0;
  v2[7] = &unk_26DE6F908;
  v3[6] = @"glasses";
  v3[7] = @"cat";
  v2[8] = &unk_26DE6F920;
  v2[9] = &unk_26DE6F938;
  v3[8] = @"dog";
  v3[9] = @"water";
  v2[10] = &unk_26DE6F950;
  v2[11] = &unk_26DE6F968;
  v3[10] = @"foliage";
  v3[11] = @"handheld_object";
  void v2[12] = &unk_26DE6F980;
  v3[12] = @"class_area";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:13];
  v1 = (void *)_objectClassIDsToObjectOutputNamesV6_objectClassIDsToObjectClassOutputNames;
  _objectClassIDsToObjectOutputNamesV6_objectClassIDsToObjectClassOutputNames = v0;
}

void __96__VisionCoreSemanticSegmentationInferenceNetworkDescriptor__objectClassIDsToObjectOutputNamesV4__block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26DE6F860;
  v2[1] = &unk_26DE6F878;
  v3[0] = @"person:0";
  v3[1] = @"sky:0";
  v2[2] = &unk_26DE6F890;
  v2[3] = &unk_26DE6F8A8;
  v3[2] = @"skin:0";
  v3[3] = @"hair:0";
  v2[4] = &unk_26DE6F8C0;
  v2[5] = &unk_26DE6F8D8;
  v3[4] = @"semantics-estimator/split_channels_1__2";
  v3[5] = @"teeth:0";
  v2[6] = &unk_26DE6F8F0;
  v3[6] = @"glasses:0";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)_objectClassIDsToObjectOutputNamesV4_objectClassIDsToObjectClassOutputNames;
  _objectClassIDsToObjectOutputNamesV4_objectClassIDsToObjectClassOutputNames = v0;
}

+ (id)objectClassIDsToObjectClassesDetectionStatusIndexes:(unint64_t)a3 modelVersion:(unint64_t)a4 error:(id *)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a4 == 2)
  {
    uint64_t v7 = +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor _objectClassIDsToObjectClassesDetectionStatusIndexesV6]();
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v9 = [v7 allKeys];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (([v14 unsignedIntegerValue] & a3) != 0)
          {
            id v15 = [v7 objectForKey:v14];
            [v8 setObject:v15 forKey:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
    if ([v8 count])
    {
      BOOL v5 = (id *)[v8 copy];
    }
    else if (v5)
    {
      id v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown object class ID %lu", a3);
      *BOOL v5 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v17];

      BOOL v5 = 0;
    }
  }
  else if (a5)
  {
    uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unexpected model version %lu", a4);
    *BOOL v5 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v16];

    BOOL v5 = 0;
  }
  return v5;
}

+ (id)objectClassOutputNamesForObjectClassIDs:(unint64_t)a3 modelVersion:(unint64_t)a4 error:(id *)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v7 = +[VisionCoreSemanticSegmentationInferenceNetworkDescriptor _objectClassIDsToObjectOutputNamesForModelVersion:error:]((uint64_t)a1, a4, a5);
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v9 = [v7 allKeys];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v14 unsignedIntegerValue] & a3) != 0)
          {
            id v15 = [v7 objectForKey:v14];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
    if ([v8 count])
    {
      BOOL v5 = (id *)[v8 copy];
    }
    else if (v5)
    {
      uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown object class ID %lu", a3);
      *BOOL v5 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v16];

      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)objectClassOutputNameForObjectClassID:(unint64_t)a3 modelVersion:(unint64_t)a4 error:(id *)a5
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
    id v8 = [a1 objectClassOutputNamesForObjectClassIDs:a3 modelVersion:a4 error:a5];
    id v6 = v8;
    if (v8)
    {
      uint64_t v7 = [v8 firstObject];
    }
    else
    {
      uint64_t v7 = 0;
    }
    goto LABEL_13;
  }
  if (!a5)
  {
    uint64_t v7 = 0;
    goto LABEL_14;
  }
  id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"This method accepts individual object class ID only %lu", a3);
  [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v6];
  uint64_t v7 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
  return v7;
}

+ (id)modelFileURLForModelVersion:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    BOOL v5 = @"personsemantics-u8-v4.e5.espresso.net";
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    BOOL v5 = @"camalgoseg.flows.lowres-s2h6ysbnuy_82500.bundle/camalgoseg.flows.lowres-s2h6ysbnuy_82500.mil";
LABEL_5:
    id v6 = +[VisionCoreEspressoUtils E5RTURLForModelNamed:v5 error:a4];
    goto LABEL_9;
  }
  if (a4)
  {
    id v7 = [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:@"Unknown model version"];
    id v6 = 0;
    *a4 = v7;
  }
  else
  {
    id v6 = 0;
  }
LABEL_9:
  return v6;
}

@end