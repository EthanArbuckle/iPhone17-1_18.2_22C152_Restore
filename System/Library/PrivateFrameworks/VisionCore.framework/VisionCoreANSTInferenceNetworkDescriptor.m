@interface VisionCoreANSTInferenceNetworkDescriptor
+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5;
- (BOOL)requiresPostProcessing;
- (VisionCoreANSTInferenceNetworkDescriptor)initWithDescriptor:(id)a3 identifer:(id)a4;
- (id)URL;
- (id)_anstPixelBufferRepresentation:(id)a3 pixelBufferRepresentation:(__CVBuffer *)a4 orientation:(unsigned int)a5 error:(id *)a6;
- (id)_anstTensorDataRepresentation:(id)a3 data:(id)a4 error:(id *)a5;
- (id)_outputDescriptorWithName:(id)a3 postProcessor:(id)a4;
- (id)postProcessingOutputDescriptors;
@end

@implementation VisionCoreANSTInferenceNetworkDescriptor

- (void).cxx_destruct
{
}

- (id)postProcessingOutputDescriptors
{
  v2 = (void *)[(ANSTInferenceDescriptor *)self->_descriptor newPostprocessorWithError:0];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 processedOutputDescriptors];
    v5 = VisionCoreTensorDescriptorsFromANSTDescriptors(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_anstPixelBufferRepresentation:(id)a3 pixelBufferRepresentation:(__CVBuffer *)a4 orientation:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v10 = (void *)getANSTPixelBufferClass_softClass;
  uint64_t v18 = getANSTPixelBufferClass_softClass;
  if (!getANSTPixelBufferClass_softClass)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getANSTPixelBufferClass_block_invoke;
    v14[3] = &unk_26488B4B8;
    v14[4] = &v15;
    __getANSTPixelBufferClass_block_invoke((uint64_t)v14);
    v10 = (void *)v16[3];
  }
  v11 = v10;
  _Block_object_dispose(&v15, 8);
  v12 = (void *)[[v11 alloc] initWithDescriptor:v9 pixelBuffer:a4 orientation:v7 error:a6];

  return v12;
}

- (id)_anstTensorDataRepresentation:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 sizeInBytes];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v10 = (void *)getANSTTensorDataClass_softClass;
  uint64_t v20 = getANSTTensorDataClass_softClass;
  if (!getANSTTensorDataClass_softClass)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __getANSTTensorDataClass_block_invoke;
    v16[3] = &unk_26488B4B8;
    v16[4] = &v17;
    __getANSTTensorDataClass_block_invoke((uint64_t)v16);
    v10 = (void *)v18[3];
  }
  v11 = v10;
  _Block_object_dispose(&v17, 8);
  id v12 = [v11 alloc];
  id v13 = v8;
  v14 = objc_msgSend(v12, "initWithDescriptor:dataPointer:length:deallocator:error:", v7, objc_msgSend(v13, "bytes"), v9, 0, a5);

  return v14;
}

- (id)_outputDescriptorWithName:(id)a3 postProcessor:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [a4 processedOutputDescriptors];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "name", (void)v14);
        char v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)requiresPostProcessing
{
  return 0;
}

- (id)URL
{
  v9.receiver = self;
  v9.super_class = (Class)VisionCoreANSTInferenceNetworkDescriptor;
  v2 = [(VisionCoreInferenceNetworkDescriptor *)&v9 URL];
  v3 = [v2 absoluteString];
  int v4 = [v3 hasPrefix:@"file://"];

  if (v4)
  {
    id v5 = NSURL;
    id v6 = [v2 VisionCoreFileSystemPathAndReturnError:0];
    id v7 = [v5 URLWithString:v6];
  }
  else
  {
    id v7 = v2;
  }

  return v7;
}

- (VisionCoreANSTInferenceNetworkDescriptor)initWithDescriptor:(id)a3 identifer:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)&self->_descriptor, a3);
  id v6 = a3;
  id v7 = a4;
  v26 = [v6 assetURL];
  uint64_t v8 = [v6 inputDescriptors];
  v24 = VisionCoreTensorDescriptorsFromANSTDescriptors(v8);

  objc_super v9 = [v6 outputDescriptors];
  v10 = VisionCoreTensorDescriptorsFromANSTDescriptors(v9);

  id v11 = [v6 allInputPixelBufferDescriptors];
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [[VisionCoreImageTensorDescriptor alloc] initWithANSTPixelBufferDescriptor:*(void *)(*((void *)&v27 + 1) + 8 * v17)];
        [v12 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [[VisionCoreResourceVersion alloc] initWithMajor:1];
  uint64_t v20 = [VisionCoreProcessingDescriptorSpecifier alloc];

  v21 = [(VisionCoreProcessingDescriptorSpecifier *)v20 initWithIdentifier:v7 version:v19];
  v22 = [(VisionCoreInferenceNetworkDescriptor *)self initWithURL:v26 specifier:v21 networkHeadVersions:0 inputs:v24 outputs:v10 inputImages:v12 confidencesOutput:0];

  return v22;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5
{
  id v5 = objc_alloc_init(VisionCoreProcessingDescriptor);
  return v5;
}

@end