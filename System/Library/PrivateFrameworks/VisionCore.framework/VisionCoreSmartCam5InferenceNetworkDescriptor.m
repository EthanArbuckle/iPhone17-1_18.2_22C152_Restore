@interface VisionCoreSmartCam5InferenceNetworkDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorAndReturnError:(id *)a3;
- (VisionCoreLabeledConfidencesDescriptor)sceneLabelConfidencesOutput;
- (VisionCoreTensorDescriptor)segmentationLabelConfidencesOutput;
- (id)sceneLabelsFileURL;
- (id)sceneLabelsOutputBlobName;
- (id)sceneSegmentationOutputBlobName;
- (id)segmentationLabelsFileURL;
@end

@implementation VisionCoreSmartCam5InferenceNetworkDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptorAndReturnError:(id *)a3
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__VisionCoreSmartCam5InferenceNetworkDescriptor_descriptorAndReturnError___block_invoke;
  v9[3] = &__block_descriptor_40_e9__16__0__8l;
  v9[4] = a1;
  v4 = (void *)MEMORY[0x230F41C60](v9, a2);
  v5 = +[VisionCoreFrameworkManager sharedManager];
  v6 = [v5 inferenceNetworkDescriptorsCache];
  v7 = [v6 objectForIdentifier:@"SmartCam5" creationBlock:v4 error:a3];

  return v7;
}

id __74__VisionCoreSmartCam5InferenceNetworkDescriptor_descriptorAndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) URLForEspressoModelNamed:@"MRC5heads_76f6w2kjaz_61501_ay5mhf87cq_97501_hbnrcg6e5e_89040_8g7zthf4q3_12751_rucb99jtq8_75751_8d9qwisndd_85501_concat_quant.espresso" error:a2];
  if (v4)
  {
    id v15 = 0;
    id v16 = 0;
    BOOL v5 = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:&v16 outputTensorDescriptors:&v15 forNetworkModelFileURL:v4 inputBlobName:@"data" pixelFormatType:1111970369 outputBlobNamesWithTypes:&unk_26DE6FB78 confidencesBlobNamesWithLabelsFiles:&unk_26DE6FBA0 error:a2];
    id v6 = v16;
    id v7 = v15;
    v8 = 0;
    if (v5)
    {
      v9 = [VisionCoreProcessingDescriptorSpecifier alloc];
      v10 = [[VisionCoreResourceVersion alloc] initWithMajor:5 minor:0 micro:0];
      v11 = [(VisionCoreProcessingDescriptorSpecifier *)v9 initWithIdentifier:@"VisionCoreInferenceNetworkIdentifierSmartCam" version:v10];

      id v12 = objc_alloc(*(Class *)(a1 + 32));
      v13 = [v7 allValues];
      v8 = (void *)[v12 initWithURL:v4 specifier:v11 networkHeadVersions:0 inputImage:v6 outputs:v13 confidencesOutput:0];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (id)segmentationLabelsFileURL
{
  v2 = self;
  objc_sync_enter(v2);
  lazySegmentationLabelsFileURL = v2->_lazySegmentationLabelsFileURL;
  if (!lazySegmentationLabelsFileURL)
  {
    uint64_t v4 = [(id)objc_opt_class() URLForResourceNamed:@"smartcam_assembly-segmentation-labels.txt" error:0];
    BOOL v5 = v2->_lazySegmentationLabelsFileURL;
    v2->_lazySegmentationLabelsFileURL = (NSURL *)v4;

    lazySegmentationLabelsFileURL = v2->_lazySegmentationLabelsFileURL;
  }
  id v6 = lazySegmentationLabelsFileURL;
  objc_sync_exit(v2);

  return v6;
}

- (id)sceneLabelsFileURL
{
  v2 = [(VisionCoreSmartCam5InferenceNetworkDescriptor *)self sceneLabelConfidencesOutput];
  v3 = [v2 labelsFileURL];

  return v3;
}

- (id)sceneSegmentationOutputBlobName
{
  return @"segmentation/MRC_softmax";
}

- (id)sceneLabelsOutputBlobName
{
  return @"leaf_semdev_text_water";
}

- (VisionCoreTensorDescriptor)segmentationLabelConfidencesOutput
{
  v3 = [(VisionCoreSmartCam5InferenceNetworkDescriptor *)self sceneSegmentationOutputBlobName];
  uint64_t v4 = [(VisionCoreInferenceNetworkDescriptor *)self outputNamed:v3 error:0];

  return (VisionCoreTensorDescriptor *)v4;
}

- (VisionCoreLabeledConfidencesDescriptor)sceneLabelConfidencesOutput
{
  v3 = [(VisionCoreSmartCam5InferenceNetworkDescriptor *)self sceneLabelsOutputBlobName];
  uint64_t v4 = [(VisionCoreInferenceNetworkDescriptor *)self outputNamed:v3 error:0];

  return (VisionCoreLabeledConfidencesDescriptor *)v4;
}

@end