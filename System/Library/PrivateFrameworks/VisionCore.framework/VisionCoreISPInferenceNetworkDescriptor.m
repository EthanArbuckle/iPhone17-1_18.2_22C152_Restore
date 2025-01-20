@interface VisionCoreISPInferenceNetworkDescriptor
+ (id)_configurationForIdentifer:(id)a3;
+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5;
+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 objectTrackingEnabled:(BOOL)a5 segmentationEnabled:(BOOL)a6 lowFrameRate:(BOOL)a7 error:(id *)a8;
- (BOOL)performPostProcessingForInput:(id)a3 postProcessingOutput:(id)a4 error:(id *)a5;
- (BOOL)requiresPostProcessing;
- (VisionCoreISPInferenceNetworkDescriptor)initWithDescriptor:(id)a3 identifer:(id)a4 error:(id *)a5;
- (__CVBuffer)_bufferForDescriptorName:(id)a3 postProcessingOutput:(id)a4;
- (unsigned)_orientationForDescriptorName:(id)a3 postProcessingOutput:(id)a4;
@end

@implementation VisionCoreISPInferenceNetworkDescriptor

- (void).cxx_destruct
{
}

- (BOOL)performPostProcessingForInput:(id)a3 postProcessingOutput:(id)a4 error:(id *)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v57 = v8;
  id v58 = a4;
  if (self->_anstPostProcessor)
  {
    uint64_t v9 = [v8 inputImageBuffer];
    v54 = [(ANSTInferenceDescriptor *)self->super._descriptor inputPixelBufferDescriptorNamed:@"input_image"];
    v53 = -[VisionCoreANSTInferenceNetworkDescriptor _anstPixelBufferRepresentation:pixelBufferRepresentation:orientation:error:](self, "_anstPixelBufferRepresentation:pixelBufferRepresentation:orientation:error:", v54, v9, [v57 inputImageOrientation], a5);
    if ([(ANSTInferencePostprocessor *)self->_anstPostProcessor setInputPixelBuffer:v53 forInferenceInputDescriptor:v54 withError:a5])
    {
      v52 = [(ANSTInferenceDescriptor *)self->super._descriptor allOutputTensorDescriptors];
      v55 = [v57 inferenceOutputNamedObjects];
      uint64_t v10 = [v52 count];
      if (v10 == [v55 count])
      {
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        obuint64_t j = v52;
        uint64_t v11 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v72;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v72 != v12) {
                objc_enumerationMutation(obj);
              }
              v14 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              v15 = [v14 name];
              id v16 = [v55 dataForName:v15 error:a5];
              if (!v16)
              {
                if (a5)
                {
                  v50 = (void *)MEMORY[0x263F087E8];
                  id v28 = [NSString stringWithFormat:@"missing %@ object", v15];
                  [v50 VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v28];
                  id v16 = 0;
                  BOOL v46 = 0;
                  *a5 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_55;
                }
                id v16 = 0;
LABEL_57:
                BOOL v46 = 0;
                goto LABEL_58;
              }
              v17 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstTensorDataRepresentation:v14 data:v16 error:a5];
              int v18 = [(ANSTInferencePostprocessor *)self->_anstPostProcessor setInputTensorData:v17 forInferenceOutputDescriptor:v14 withError:a5];

              if (!v18) {
                goto LABEL_57;
              }
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      [(ANSTInferencePostprocessor *)self->_anstPostProcessor processedOutputPixelBufferDescriptors];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [obj countByEnumeratingWithState:&v67 objects:v86 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v68;
        while (2)
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v68 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v67 + 1) + 8 * j);
            id v16 = [v22 name];
            v23 = [(VisionCoreISPInferenceNetworkDescriptor *)self _bufferForDescriptorName:v16 postProcessingOutput:v58];
            uint64_t v24 = [(VisionCoreISPInferenceNetworkDescriptor *)self _orientationForDescriptorName:v16 postProcessingOutput:v58];
            if (!v23)
            {
              if (a5)
              {
                v49 = (void *)MEMORY[0x263F087E8];
                id v28 = [NSString stringWithFormat:@"missing %@ object", v16];
                [v49 VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v28];
                BOOL v46 = 0;
                *a5 = (id)objc_claimAutoreleasedReturnValue();
                v15 = (ANSTInferencePostprocessor *)obj;
                goto LABEL_55;
              }
LABEL_51:
              BOOL v46 = 0;
              v15 = (ANSTInferencePostprocessor *)obj;
              goto LABEL_58;
            }
            v25 = [(VisionCoreANSTInferenceNetworkDescriptor *)self _anstPixelBufferRepresentation:v22 pixelBufferRepresentation:v23 orientation:v24 error:a5];
            int v26 = [(ANSTInferencePostprocessor *)self->_anstPostProcessor setOutputPixelBuffer:v25 forProcessedOutputDescriptor:v22 withError:a5];

            if (!v26) {
              goto LABEL_51;
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v67 objects:v86 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      int v27 = [(ANSTInferencePostprocessor *)self->_anstPostProcessor processWithError:a5];
      v15 = self->_anstPostProcessor;
      id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (v27)
      {
        uint64_t v80 = 0;
        v81 = &v80;
        uint64_t v82 = 0x2020000000;
        v29 = (void *)getANSTObjectCategoryHandSymbolLoc_ptr;
        uint64_t v83 = getANSTObjectCategoryHandSymbolLoc_ptr;
        if (!getANSTObjectCategoryHandSymbolLoc_ptr)
        {
          uint64_t v75 = MEMORY[0x263EF8330];
          uint64_t v76 = 3221225472;
          v77 = __getANSTObjectCategoryHandSymbolLoc_block_invoke;
          v78 = &unk_26488B4B8;
          v79 = &v80;
          v30 = (void *)ANSTKitLibrary();
          v31 = dlsym(v30, "ANSTObjectCategoryHand");
          *(void *)(v79[1] + 24) = v31;
          getANSTObjectCategoryHandSymbolLoc_ptr = *(void *)(v79[1] + 24);
          v29 = (void *)v81[3];
        }
        _Block_object_dispose(&v80, 8);
        if (!v29) {
          goto LABEL_61;
        }
        v32 = [(ANSTInferencePostprocessor *)v15 trackedObjectsOfCategory:*v29];
        uint64_t v80 = 0;
        v81 = &v80;
        uint64_t v82 = 0x2020000000;
        v33 = (void *)getANSTObjectCategoryFullBodySymbolLoc_ptr;
        uint64_t v83 = getANSTObjectCategoryFullBodySymbolLoc_ptr;
        if (!getANSTObjectCategoryFullBodySymbolLoc_ptr)
        {
          uint64_t v75 = MEMORY[0x263EF8330];
          uint64_t v76 = 3221225472;
          v77 = __getANSTObjectCategoryFullBodySymbolLoc_block_invoke;
          v78 = &unk_26488B4B8;
          v79 = &v80;
          v34 = (void *)ANSTKitLibrary();
          v35 = dlsym(v34, "ANSTObjectCategoryFullBody");
          *(void *)(v79[1] + 24) = v35;
          getANSTObjectCategoryFullBodySymbolLoc_ptr = *(void *)(v79[1] + 24);
          v33 = (void *)v81[3];
        }
        _Block_object_dispose(&v80, 8);
        if (!v33)
        {
LABEL_61:
          dlerror();
          abort_report_np();
          __break(1u);
        }
        [(ANSTInferencePostprocessor *)v15 trackedObjectsOfCategory:*v33];
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v85 count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v64;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v64 != v38) {
                objc_enumerationMutation(v36);
              }
              v40 = [[VisionCoreISPInferenceNetworkObject alloc] initWithANSTObject:*(void *)(*((void *)&v63 + 1) + 8 * k)];
              [v16 addObject:v40];
            }
            uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v85 count:16];
          }
          while (v37);
        }

        [v58 setFullBodyResults:v16];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v41 = v32;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v59 objects:v84 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v60;
          do
          {
            for (uint64_t m = 0; m != v42; ++m)
            {
              if (*(void *)v60 != v43) {
                objc_enumerationMutation(v41);
              }
              v45 = [[VisionCoreISPInferenceNetworkHandObject alloc] initWithANSTHand:*(void *)(*((void *)&v59 + 1) + 8 * m)];
              [v28 addObject:v45];
            }
            uint64_t v42 = [v41 countByEnumeratingWithState:&v59 objects:v84 count:16];
          }
          while (v42);
        }

        [v58 setHands:v28];
        BOOL v46 = 1;
      }
      else
      {
        BOOL v46 = 0;
      }
LABEL_55:

LABEL_58:
    }
    else
    {
      BOOL v46 = 0;
    }
  }
  else
  {
    if (a5)
    {
      v47 = (void *)MEMORY[0x263F087E8];
      v48 = [NSString stringWithFormat:@"_anstPostProcessor instance nil"];
      *a5 = [v47 VisionCoreErrorForInternalErrorWithLocalizedDescription:v48];
    }
    BOOL v46 = 0;
  }

  return v46;
}

- (unsigned)_orientationForDescriptorName:(id)a3 postProcessingOutput:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"$postprocessed$Person"])
  {
    unsigned int v7 = [v6 personImageBufferOrientation];
  }
  else if ([v5 isEqualToString:@"$postprocessed$SalientPerson"])
  {
    unsigned int v7 = [v6 salientPersonImageBufferOrientation];
  }
  else if ([v5 isEqualToString:@"$postprocessed$Skin"])
  {
    unsigned int v7 = [v6 skinImageBufferOrientation];
  }
  else if ([v5 isEqualToString:@"$postprocessed$Hair"])
  {
    unsigned int v7 = [v6 hairImageBufferOrientation];
  }
  else
  {
    if (![v5 isEqualToString:@"$postprocessed$Sky"])
    {
      unsigned int v8 = 0;
      goto LABEL_12;
    }
    unsigned int v7 = [v6 skyImageBufferOrientation];
  }
  unsigned int v8 = v7;
LABEL_12:

  return v8;
}

- (__CVBuffer)_bufferForDescriptorName:(id)a3 postProcessingOutput:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"$postprocessed$Person"])
  {
    uint64_t v7 = [v6 personImageBuffer];
  }
  else if ([v5 isEqualToString:@"$postprocessed$SalientPerson"])
  {
    uint64_t v7 = [v6 salientPersonImageBuffer];
  }
  else if ([v5 isEqualToString:@"$postprocessed$Skin"])
  {
    uint64_t v7 = [v6 skinImageBuffer];
  }
  else if ([v5 isEqualToString:@"$postprocessed$Hair"])
  {
    uint64_t v7 = [v6 hairImageBuffer];
  }
  else
  {
    if (![v5 isEqualToString:@"$postprocessed$Sky"])
    {
      unsigned int v8 = 0;
      goto LABEL_12;
    }
    uint64_t v7 = [v6 skyImageBuffer];
  }
  unsigned int v8 = (__CVBuffer *)v7;
LABEL_12:

  return v8;
}

- (BOOL)requiresPostProcessing
{
  return 1;
}

- (VisionCoreISPInferenceNetworkDescriptor)initWithDescriptor:(id)a3 identifer:(id)a4 error:(id *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)VisionCoreISPInferenceNetworkDescriptor;
  id v6 = [(VisionCoreANSTInferenceNetworkDescriptor *)&v11 initWithDescriptor:a3 identifer:a4];
  uint64_t v7 = [(ANSTInferenceDescriptor *)v6->super._descriptor newPostprocessorWithError:a5];
  anstPostProcessor = v6->_anstPostProcessor;
  v6->_anstPostProcessor = (ANSTInferencePostprocessor *)v7;

  if (v6->_anstPostProcessor) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 objectTrackingEnabled:(BOOL)a5 segmentationEnabled:(BOOL)a6 lowFrameRate:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v12 = a3;
  v13 = +[VisionCoreISPInferenceNetworkDescriptor _configurationForIdentifer:v12];
  [v13 setObjectTrackingEnabled:v11];
  [v13 setSegmentationEnabled:v10];
  if (v9) {
    [v13 setFrameRate:1];
  }
  v14 = [getANSTISPInferenceDescriptorClass() descriptorWithConfiguration:v13 error:a8];
  if (v14) {
    v15 = [[VisionCoreISPInferenceNetworkDescriptor alloc] initWithDescriptor:v14 identifer:v12 error:a8];
  }
  else {
    v15 = 0;
  }

  return v15;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5
{
  id v6 = a3;
  uint64_t v7 = +[VisionCoreISPInferenceNetworkDescriptor _configurationForIdentifer:v6];
  unsigned int v8 = [getANSTISPInferenceDescriptorClass() descriptorWithConfiguration:v7 error:a5];
  if (v8) {
    BOOL v9 = [[VisionCoreISPInferenceNetworkDescriptor alloc] initWithDescriptor:v8 identifer:v6 error:a5];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)_configurationForIdentifer:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v4 = (void *)getANSTISPInferenceConfigurationClass_softClass;
  uint64_t v14 = getANSTISPInferenceConfigurationClass_softClass;
  if (!getANSTISPInferenceConfigurationClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getANSTISPInferenceConfigurationClass_block_invoke;
    v10[3] = &unk_26488B4B8;
    v10[4] = &v11;
    __getANSTISPInferenceConfigurationClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = [v5 defaultConfigurationForVersion:0x10000 withError:0];
  char v7 = [v3 isEqualToString:@"VisionCoreISPInferenceNetworkIdentifier512x384"];
  uint64_t v8 = 0;
  if ((v7 & 1) == 0)
  {
    if (![v3 isEqualToString:@"VisionCoreISPInferenceNetworkIdentifier512x384"]) {
      goto LABEL_7;
    }
    uint64_t v8 = 1;
  }
  [v6 setResolution:v8];
LABEL_7:

  return v6;
}

@end