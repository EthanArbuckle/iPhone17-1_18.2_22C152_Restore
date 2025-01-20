@interface VisionCoreCamGazeNetworkDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)_descriptorWithModelFileName:(void *)a3 version:(void *)a4 inputImageBlobName:pixelFormatType:probabilitiesOutputName:error:;
+ (id)camGazeV1AndReturnError:(id *)a3;
+ (id)camGazeV2AndReturnError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (VisionCoreCamGazeClassifier)gazeClassifier;
- (VisionCoreCamGazeNetworkDescriptor)initWithCoder:(id)a3;
- (VisionCoreTensorDescriptor)gazeProbabilitiesOutput;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreCamGazeNetworkDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gazeClassifier, 0);
  objc_storeStrong((id *)&self->_gazeProbabilitiesOutput, 0);
}

- (VisionCoreCamGazeClassifier)gazeClassifier
{
  return self->_gazeClassifier;
}

- (VisionCoreTensorDescriptor)gazeProbabilitiesOutput
{
  return self->_gazeProbabilitiesOutput;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VisionCoreCamGazeNetworkDescriptor *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)VisionCoreCamGazeNetworkDescriptor,
          [(VisionCoreInferenceNetworkDescriptor *)&v10 isEqual:v4]))
    {
      v5 = v4;
      v6 = [(VisionCoreCamGazeNetworkDescriptor *)self gazeProbabilitiesOutput];
      v7 = [(VisionCoreCamGazeNetworkDescriptor *)v5 gazeProbabilitiesOutput];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (VisionCoreCamGazeNetworkDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VisionCoreCamGazeNetworkDescriptor;
  v5 = [(VisionCoreInferenceNetworkDescriptor *)&v15 initWithCoder:v4];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gazeProbabilitiesOutput"];
  gazeProbabilitiesOutput = v5->_gazeProbabilitiesOutput;
  v5->_gazeProbabilitiesOutput = (VisionCoreTensorDescriptor *)v6;

  char v8 = v5->_gazeProbabilitiesOutput;
  if (!v8)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  id v14 = 0;
  uint64_t v9 = +[_VisionCoreCamGazeClassifier classifierForGazeProbabilitiesOutputDescriptor:error:]((uint64_t)_VisionCoreCamGazeClassifier, v8, &v14);
  id v10 = v14;
  gazeClassifier = v5->_gazeClassifier;
  v5->_gazeClassifier = (VisionCoreCamGazeClassifier *)v9;

  if (!v5->_gazeClassifier)
  {
    [v4 failWithError:v10];

    goto LABEL_7;
  }

LABEL_5:
  v12 = v5;
LABEL_8:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VisionCoreCamGazeNetworkDescriptor;
  id v4 = a3;
  [(VisionCoreInferenceNetworkDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_gazeProbabilitiesOutput, @"gazeProbabilitiesOutput", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)camGazeV2AndReturnError:(id *)a3
{
  objc_super v5 = [[VisionCoreResourceVersion alloc] initWithMajor:2 minor:0 micro:0];
  uint64_t v6 = +[VisionCoreCamGazeNetworkDescriptor _descriptorWithModelFileName:version:inputImageBlobName:pixelFormatType:probabilitiesOutputName:error:]((uint64_t)a1, @"camgazeflow-f334k5e5zi_91568-quant-fp16.espresso", v5, a3);

  return v6;
}

+ (id)_descriptorWithModelFileName:(void *)a3 version:(void *)a4 inputImageBlobName:pixelFormatType:probabilitiesOutputName:error:
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = @"image";
  char v8 = @"camgaze_probs";
  id v9 = a2;
  self;
  id v10 = +[VisionCoreEspressoUtils URLForModelNamed:v9 error:a4];

  if (v10)
  {
    v27 = @"camgaze_probs";
    v28[0] = &unk_26DE6F6E0;
    v11 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v25 = 0;
    id v26 = 0;
    BOOL v12 = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:&v26 outputTensorDescriptors:&v25 forNetworkModelFileURL:v10 inputBlobName:@"image" pixelFormatType:1111970369 outputBlobNamesWithTypes:v11 confidencesBlobNamesWithLabelsFiles:0 error:a4];
    id v13 = v26;
    id v14 = v25;
    id v15 = 0;
    if (v12)
    {
      v16 = [[VisionCoreProcessingDescriptorSpecifier alloc] initWithIdentifier:@"VisionCoreInferenceNetworkIdentifierCamGaze" version:v6];
      v17 = [VisionCoreCamGazeNetworkDescriptor alloc];
      v18 = [v14 allValues];
      uint64_t v19 = [(VisionCoreInferenceNetworkDescriptor *)v17 initWithURL:v10 specifier:v16 networkHeadVersions:0 inputImage:v13 outputs:v18 confidencesOutput:0];

      uint64_t v20 = [v14 objectForKeyedSubscript:@"camgaze_probs"];
      v21 = *(void **)(v19 + 64);
      *(void *)(v19 + 64) = v20;

      uint64_t v22 = +[_VisionCoreCamGazeClassifier classifierForGazeProbabilitiesOutputDescriptor:error:]((uint64_t)_VisionCoreCamGazeClassifier, *(void **)(v19 + 64), a4);
      v23 = *(void **)(v19 + 72);
      *(void *)(v19 + 72) = v22;

      if (*(void *)(v19 + 72)) {
        id v15 = (id)v19;
      }
      else {
        id v15 = 0;
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)camGazeV1AndReturnError:(id *)a3
{
  objc_super v5 = [[VisionCoreResourceVersion alloc] initWithMajor:1 minor:0 micro:0];
  id v6 = +[VisionCoreCamGazeNetworkDescriptor _descriptorWithModelFileName:version:inputImageBlobName:pixelFormatType:probabilitiesOutputName:error:]((uint64_t)a1, @"camgaze_classification_3class_light-nxbrsq87z6_23998_BGR_opt.espresso", v5, a3);

  return v6;
}

@end