@interface VisionCoreInferenceNetworkDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)URLForEspressoModelNamed:(id)a3 error:(id *)a4;
+ (id)_registeredNetworkDescriptors;
+ (id)availableIdentifiers;
+ (id)availableVersionsForIdentifier:(id)a3 error:(id *)a4;
+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5;
+ (id)descriptorsForIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)allInputImages;
- (NSArray)allInputNames;
- (NSArray)allInputs;
- (NSArray)allOutputNames;
- (NSArray)allOutputs;
- (NSDictionary)outputs;
- (NSURL)URL;
- (VisionCoreImageTensorDescriptor)onlyInputImage;
- (VisionCoreInferenceNetworkDescriptor)initWithCoder:(id)a3;
- (VisionCoreInferenceNetworkDescriptor)initWithURL:(id)a3 specifier:(id)a4 networkHeadVersions:(id)a5 inputImage:(id)a6 outputs:(id)a7 confidencesOutput:(id)a8;
- (VisionCoreInferenceNetworkDescriptor)initWithURL:(id)a3 specifier:(id)a4 networkHeadVersions:(id)a5 inputs:(id)a6 outputs:(id)a7 inputImages:(id)a8 confidencesOutput:(id)a9;
- (VisionCoreTensorDescriptor)confidencesOutput;
- (VisionCoreTensorDescriptor)featureprintOutput;
- (id)confidencesOutputOfClass:(Class)a3 error:(id *)a4;
- (id)description;
- (id)inputNamed:(id)a3 error:(id *)a4;
- (id)inputOfClass:(Class)a3 named:(id)a4 error:(id *)a5;
- (id)outputNamed:(id)a3 error:(id *)a4;
- (id)outputOfClass:(Class)a3 named:(id)a4 error:(id *)a5;
- (id)versionOfNetworkHead:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreInferenceNetworkDescriptor

- (NSURL)URL
{
  return self->_url;
}

- (VisionCoreImageTensorDescriptor)onlyInputImage
{
  v2 = [(VisionCoreInferenceNetworkDescriptor *)self allInputImages];
  if ([v2 count] == 1)
  {
    v3 = [v2 firstObject];
  }
  else
  {
    v3 = 0;
  }

  return (VisionCoreImageTensorDescriptor *)v3;
}

- (NSArray)allInputImages
{
  return [(NSDictionary *)self->_inputImages allValues];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidencesOutput, 0);
  objc_storeStrong((id *)&self->_inputImages, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_networkHeadVersions, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (VisionCoreTensorDescriptor)confidencesOutput
{
  return self->_confidencesOutput;
}

- (NSDictionary)outputs
{
  return self->_outputs;
}

- (VisionCoreInferenceNetworkDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      v23 = [v4 decodeObjectOfClass:v7 forKey:@"confidencesOutput"];
      v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), v7, 0);
      v9 = [v4 decodeObjectOfClasses:v8 forKey:@"inputs"];
      if (v9)
      {
        v10 = [v4 decodeObjectOfClasses:v8 forKey:@"outputs"];
        if (v10)
        {
          id v22 = v10;
          id v11 = objc_alloc(MEMORY[0x263EFFA08]);
          uint64_t v12 = objc_opt_class();
          v21 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
          v13 = [v4 decodeObjectOfClasses:v21 forKey:@"inputImages"];
          if (v13)
          {
            if ([v4 containsValueForKey:@"networkHeadVersions"])
            {
              id v14 = objc_alloc(MEMORY[0x263EFFA08]);
              uint64_t v15 = objc_opt_class();
              uint64_t v16 = objc_opt_class();
              v17 = objc_msgSend(v14, "initWithObjects:", v15, v16, objc_opt_class(), 0);
              v18 = [v4 decodeObjectOfClasses:v17 forKey:@"networkHeadVersions"];
            }
            else
            {
              v18 = 0;
            }
            self = [(VisionCoreInferenceNetworkDescriptor *)self initWithURL:v6 specifier:v5 networkHeadVersions:v18 inputs:v9 outputs:v22 inputImages:v13 confidencesOutput:v23];

            v19 = self;
          }
          else
          {
            v19 = 0;
          }

          v10 = v22;
        }
        else
        {
          v19 = 0;
        }
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(VisionCoreProcessingDescriptor *)self specifier];
  [v11 encodeObject:v4 forKey:@"specifier"];

  v5 = [(VisionCoreInferenceNetworkDescriptor *)self URL];
  [v11 encodeObject:v5 forKey:@"URL"];

  v6 = [(VisionCoreInferenceNetworkDescriptor *)self allInputs];
  [v11 encodeObject:v6 forKey:@"inputs"];

  uint64_t v7 = [(VisionCoreInferenceNetworkDescriptor *)self allOutputs];
  [v11 encodeObject:v7 forKey:@"outputs"];

  v8 = [(VisionCoreInferenceNetworkDescriptor *)self allInputImages];
  [v11 encodeObject:v8 forKey:@"inputImages"];

  v9 = [(VisionCoreInferenceNetworkDescriptor *)self confidencesOutput];
  [v11 encodeObject:v9 forKey:@"confidencesOutput"];

  networkHeadVersions = self->_networkHeadVersions;
  if (networkHeadVersions) {
    [v11 encodeObject:networkHeadVersions forKey:@"networkHeadVersions"];
  }
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v16.receiver = self;
  v16.super_class = (Class)VisionCoreInferenceNetworkDescriptor;
  id v4 = [(VisionCoreProcessingDescriptor *)&v16 description];
  v5 = [(VisionCoreInferenceNetworkDescriptor *)self URL];
  v6 = [v5 lastPathComponent];
  uint64_t v7 = (void *)[v3 initWithFormat:@"%@ %@", v4, v6];

  networkHeadVersions = self->_networkHeadVersions;
  if (networkHeadVersions)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __51__VisionCoreInferenceNetworkDescriptor_description__block_invoke;
    v14[3] = &unk_26488B160;
    id v15 = v7;
    [(NSDictionary *)networkHeadVersions enumerateKeysAndObjectsUsingBlock:v14];
  }
  v9 = [(VisionCoreInferenceNetworkDescriptor *)self allInputs];
  if ([v9 count])
  {
    v10 = [v9 componentsJoinedByString:@"\n       "];
    [v7 appendFormat:@"\n   --> %@", v10];
  }
  id v11 = [(VisionCoreInferenceNetworkDescriptor *)self allOutputs];
  if ([v11 count])
  {
    uint64_t v12 = [v11 componentsJoinedByString:@"\n       "];
    [v7 appendFormat:@"\n   <-- %@", v12];
  }
  return v7;
}

uint64_t __51__VisionCoreInferenceNetworkDescriptor_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"\n   (%@ %@)", a2, a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreInferenceNetworkDescriptor *)a3;
  if (v4 == self)
  {
    char v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(VisionCoreProcessingDescriptor *)self version];
      uint64_t v7 = [(VisionCoreProcessingDescriptor *)v5 version];
      char v8 = [v6 isEqualToResourceVersion:v7];

      if ((v8 & 1) == 0) {
        goto LABEL_17;
      }
      v9 = [(VisionCoreInferenceNetworkDescriptor *)self URL];
      v10 = [(VisionCoreInferenceNetworkDescriptor *)v5 URL];
      char v11 = [v9 isEqual:v10];

      if ((v11 & 1) == 0) {
        goto LABEL_17;
      }
      networkHeadVersions = self->_networkHeadVersions;
      if (networkHeadVersions != v5->_networkHeadVersions
        && !-[NSDictionary isEqual:](networkHeadVersions, "isEqual:"))
      {
        goto LABEL_17;
      }
      if (((inputs = self->_inputs, inputs == v5->_inputs) || -[NSDictionary isEqual:](inputs, "isEqual:"))&& ((inputImages = self->_inputImages, inputImages == v5->_inputImages)|| -[NSDictionary isEqual:](inputImages, "isEqual:"))&& ((outputs = self->_outputs, outputs == v5->_outputs)|| -[NSDictionary isEqual:](outputs, "isEqual:")))
      {
        objc_super v16 = [(VisionCoreInferenceNetworkDescriptor *)self confidencesOutput];
        v17 = [(VisionCoreInferenceNetworkDescriptor *)v5 confidencesOutput];
        if (v16 == v17) {
          char v18 = 1;
        }
        else {
          char v18 = [v16 isEqual:v17];
        }
      }
      else
      {
LABEL_17:
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VisionCoreInferenceNetworkDescriptor;
  unint64_t v3 = [(VisionCoreProcessingDescriptor *)&v7 hash];
  id v4 = [(VisionCoreInferenceNetworkDescriptor *)self URL];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)outputOfClass:(Class)a3 named:(id)a4 error:(id *)a5
{
  objc_super v7 = [(VisionCoreInferenceNetworkDescriptor *)self outputNamed:a4 error:a5];
  if (v7
    && +[VisionCoreValidationUtilities validateObject:v7 isKindOfClass:a3 basedOnClass:objc_opt_class() error:a5])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)outputNamed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(NSDictionary *)self->_outputs objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"Network does not have output \"%@\"", v6];
    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v10];
  }
  return v8;
}

- (id)inputOfClass:(Class)a3 named:(id)a4 error:(id *)a5
{
  objc_super v7 = [(VisionCoreInferenceNetworkDescriptor *)self inputNamed:a4 error:a5];
  if (v7
    && +[VisionCoreValidationUtilities validateObject:v7 isKindOfClass:a3 basedOnClass:objc_opt_class() error:a5])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)inputNamed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(NSDictionary *)self->_inputs objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"Network does not have input \"%@\"", v6];
    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v10];
  }
  return v8;
}

- (id)versionOfNetworkHead:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(NSDictionary *)self->_networkHeadVersions objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"Network does not have head with identifier \"%@\"", v6];
    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v10];
  }
  return v8;
}

- (VisionCoreTensorDescriptor)featureprintOutput
{
  return 0;
}

- (id)confidencesOutputOfClass:(Class)a3 error:(id *)a4
{
  id v6 = [(VisionCoreInferenceNetworkDescriptor *)self confidencesOutput];
  if (+[VisionCoreValidationUtilities validateObject:v6 isKindOfClass:a3 basedOnClass:objc_opt_class() error:a4])
  {
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSArray)allOutputNames
{
  return [(NSDictionary *)self->_outputs allKeys];
}

- (NSArray)allOutputs
{
  return [(NSDictionary *)self->_outputs allValues];
}

- (NSArray)allInputNames
{
  return [(NSDictionary *)self->_inputs allKeys];
}

- (NSArray)allInputs
{
  return [(NSDictionary *)self->_inputs allValues];
}

- (VisionCoreInferenceNetworkDescriptor)initWithURL:(id)a3 specifier:(id)a4 networkHeadVersions:(id)a5 inputImage:(id)a6 outputs:(id)a7 confidencesOutput:(id)a8
{
  v23[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v23[0] = v17;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  v21 = [(VisionCoreInferenceNetworkDescriptor *)self initWithURL:v14 specifier:v15 networkHeadVersions:v16 inputs:v20 outputs:v18 inputImages:v20 confidencesOutput:v19];

  return v21;
}

- (VisionCoreInferenceNetworkDescriptor)initWithURL:(id)a3 specifier:(id)a4 networkHeadVersions:(id)a5 inputs:(id)a6 outputs:(id)a7 inputImages:(id)a8 confidencesOutput:(id)a9
{
  id v39 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v40.receiver = self;
  v40.super_class = (Class)VisionCoreInferenceNetworkDescriptor;
  id v22 = [(VisionCoreProcessingDescriptor *)&v40 initWithSpecifier:v16];
  v23 = v22;
  v24 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_url, a3);
    uint64_t v25 = [v17 count];
    if (v25) {
      v26 = (void *)[v17 copy];
    }
    else {
      v26 = 0;
    }
    objc_storeStrong((id *)&v23->_networkHeadVersions, v26);
    if (v25) {

    }
    v27 = _dictionaryOfTensorDescriptors(v18);
    uint64_t v28 = [v27 copy];
    inputs = v24->_inputs;
    v24->_inputs = (NSDictionary *)v28;

    v30 = _dictionaryOfTensorDescriptors(v19);
    uint64_t v31 = [v30 copy];
    outputs = v24->_outputs;
    v24->_outputs = (NSDictionary *)v31;

    v33 = _dictionaryOfTensorDescriptors(v20);
    uint64_t v34 = [v33 copy];
    inputImages = v24->_inputImages;
    v24->_inputImages = (NSDictionary *)v34;

    uint64_t v36 = [v21 copy];
    confidencesOutput = v24->_confidencesOutput;
    v24->_confidencesOutput = (VisionCoreTensorDescriptor *)v36;
  }
  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]();
  id v9 = [v8 objectForKey:v6];

  if (v9)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v15 = [v14 version];
          char v16 = [v15 isEqualToResourceVersion:v7];

          if (v16)
          {
            id v18 = v14;

            goto LABEL_16;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if (a5)
    {
      id v17 = (void *)[[NSString alloc] initWithFormat:@"no inference network for %@ %@", v6, v7];
      *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v17];
    }
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForUnknownProcessingDescriptorIdentifier:v6];
    id v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  id v18 = 0;
LABEL_16:

  return v18;
}

+ (id)_registeredNetworkDescriptors
{
  self;
  if (+[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]::onceToken != -1) {
    dispatch_once(&+[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]::onceToken, &__block_literal_global_375);
  }
  v0 = (void *)+[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]::ourDescriptors;
  return v0;
}

void __69__VisionCoreInferenceNetworkDescriptor__registeredNetworkDescriptors__block_invoke()
{
  v13[5] = *MEMORY[0x263EF8340];
  v12[0] = @"VisionCoreInferenceNetworkIdentifierSceneNet";
  v0 = (objc_class *)objc_opt_class();
  v1 = _obtainDescriptors(v0, (objc_selector *)sel_sceneNetV3AndReturnError_, 0);
  v13[0] = v1;
  v12[1] = @"VisionCoreInferenceNetworkIdentifierSceneNetObjDetNetSliderNet";
  v2 = (objc_class *)objc_opt_class();
  unint64_t v3 = _obtainDescriptors(v2, (objc_selector *)sel_sceneNetObjDetNetSliderNetV3AndReturnError_, 0);
  v13[1] = v3;
  v12[2] = @"VisionCoreInferenceNetworkIdentifierSmartCam";
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = _obtainDescriptors(v4, (objc_selector *)sel_descriptorAndReturnError_, 0);
  v13[2] = v5;
  v12[3] = @"VisionCoreInferenceNetworkIdentifierFaceprint";
  id v6 = (objc_class *)objc_opt_class();
  id v7 = _obtainDescriptors(v6, (objc_selector *)sel_FPrev3_1FArev1_3_MD2AndReturnError_, sel_FPrev4_0FArev1_4_MD2AndReturnError_, 0);
  v13[3] = v7;
  v12[4] = @"VisionCoreInferenceNetworkIdentifierCamGaze";
  id v8 = (objc_class *)objc_opt_class();
  id v9 = _obtainDescriptors(v8, (objc_selector *)sel_camGazeV2AndReturnError_, sel_camGazeV1AndReturnError_, 0);
  v13[4] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
  uint64_t v11 = (void *)+[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]::ourDescriptors;
  +[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]::ourDescriptors = v10;
}

+ (id)descriptorsForIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]();
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = +[VisionCoreResourceVersion newerFirstComparator];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__VisionCoreInferenceNetworkDescriptor_descriptorsForIdentifier_error___block_invoke;
    v13[3] = &unk_26488B138;
    id v14 = v8;
    id v9 = v8;
    uint64_t v10 = [v7 sortedArrayWithOptions:16 usingComparator:v13];

    id v11 = v10;
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForUnknownProcessingDescriptorIdentifier:v5];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __71__VisionCoreInferenceNetworkDescriptor_descriptorsForIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [a2 version];
  id v8 = [v5 version];
  uint64_t v9 = (*(uint64_t (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  return v9;
}

+ (id)availableVersionsForIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]();
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = [v7 valueForKey:@"version"];
    uint64_t v9 = +[VisionCoreResourceVersion newerFirstComparator];
    uint64_t v10 = [v8 sortedArrayUsingComparator:v9];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForUnknownProcessingDescriptorIdentifier:v5];
    uint64_t v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)availableIdentifiers
{
  unint64_t v3 = +[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]();
  id v4 = [v3 allKeys];
  if ((id)objc_opt_class() != a1)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __60__VisionCoreInferenceNetworkDescriptor_availableIdentifiers__block_invoke;
    id v11 = &unk_26488B110;
    id v12 = v3;
    id v13 = a1;
    id v5 = [v4 indexesOfObjectsPassingTest:&v8];
    uint64_t v6 = objc_msgSend(v4, "objectsAtIndexes:", v5, v8, v9, v10, v11);

    id v4 = (void *)v6;
  }

  return v4;
}

uint64_t __60__VisionCoreInferenceNetworkDescriptor_availableIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 0;
LABEL_11:

  return v6;
}

+ (id)URLForEspressoModelNamed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    long long v8 = [v6 pathExtension];
    int v9 = [v8 isEqualToString:@"espresso"];

    if (v9)
    {
      uint64_t v10 = [v7 stringByAppendingPathExtension:@"net"];

      id v7 = (void *)v10;
    }
    long long v11 = [a1 URLForResourceNamed:v7 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:@"model name must be provided"];
    long long v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v11 = 0;
  }
  return v11;
}

@end