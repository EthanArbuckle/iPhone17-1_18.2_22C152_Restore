@interface MLCGraph(TCMLComputeObjectDetectorSceneNetDescriptor)
+ (id)tc_inferenceGraphForObjectDetectorSceneNetDescriptor:()TCMLComputeObjectDetectorSceneNetDescriptor batchSize:;
+ (id)tc_lossGraphForObjectDetectorSceneNetDescriptor:()TCMLComputeObjectDetectorSceneNetDescriptor;
+ (id)tc_trainingGraphForObjectDetectorSceneNetDescriptor:()TCMLComputeObjectDetectorSceneNetDescriptor batchSize:;
@end

@implementation MLCGraph(TCMLComputeObjectDetectorSceneNetDescriptor)

+ (id)tc_inferenceGraphForObjectDetectorSceneNetDescriptor:()TCMLComputeObjectDetectorSceneNetDescriptor batchSize:
{
  v15[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(a1);
  [v6 defineGraph:v7 batchSize:a4];
  v8 = [MEMORY[0x263F10648] layerWithOperation:0];
  v9 = [v6 classificationOutput];
  v10 = [v7 nodeWithLayer:v8 source:v9];

  v11 = [v6 localizationOutput];

  v15[0] = v11;
  v15[1] = v10;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v13 = [v7 concatenateWithSources:v12 dimension:1];

  return v7;
}

+ (id)tc_trainingGraphForObjectDetectorSceneNetDescriptor:()TCMLComputeObjectDetectorSceneNetDescriptor batchSize:
{
  id v6 = a3;
  if ([v6 isComplete])
  {
    id v7 = objc_alloc_init(a1);
    [v6 defineGraph:v7 batchSize:a4];
    v8 = [MEMORY[0x263F10648] layerWithOperation:0];
    v9 = [v6 classificationOutput];
    v10 = [v7 nodeWithLayer:v8 source:v9];
    [v6 setSoftmaxOutput:v10];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)tc_lossGraphForObjectDetectorSceneNetDescriptor:()TCMLComputeObjectDetectorSceneNetDescriptor
{
  v32[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isComplete])
  {
    id v5 = objc_alloc_init(a1);
    id v6 = (void *)MEMORY[0x263F10610];
    id v7 = [v4 weightsCoordinates];
    LODWORD(v8) = 1035489772;
    v27 = [v6 huberLossWithReductionType:2 delta:v7 weights:v8];

    v9 = [v4 localizationOutput];
    v32[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
    v11 = [v4 labelCoordinates];
    v31 = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    v13 = [v5 nodeWithLayer:v27 sources:v10 lossLabels:v12];

    v14 = (void *)MEMORY[0x263F10610];
    uint64_t v15 = [v4 numClasses] + 1;
    v16 = [v4 weightsClass];
    v17 = [v14 softmaxCrossEntropyLossWithReductionType:2 labelSmoothing:v15 classCount:v16 weights:0.0];

    v18 = [v4 classificationOutput];
    v30 = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
    v20 = [v4 labelClass];
    v29 = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    v22 = [v5 nodeWithLayer:v17 sources:v19 lossLabels:v21];

    v23 = [MEMORY[0x263F105A0] layerWithOperation:0];
    v28[0] = v13;
    v28[1] = v22;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    v25 = [v5 nodeWithLayer:v23 sources:v24];
    [v4 setLossResultTensor:v25];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end