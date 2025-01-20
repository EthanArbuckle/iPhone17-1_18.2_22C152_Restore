@interface MLCGraph(TCMLComputeStyleTransfer)
+ (id)tc_inferenceGraphForStyleTransferDescriptor:()TCMLComputeStyleTransfer algorithm:;
+ (id)tc_trainingGraphForStyleTransferDescriptor:()TCMLComputeStyleTransfer stopGradientList:lossTensorDictionary:algorithm:;
@end

@implementation MLCGraph(TCMLComputeStyleTransfer)

+ (id)tc_inferenceGraphForStyleTransferDescriptor:()TCMLComputeStyleTransfer algorithm:
{
  id v6 = a3;
  if ([v6 isComplete])
  {
    id v7 = objc_alloc_init(a1);
    v8 = [v6 inferenceContentTensor];
    v9 = [v6 inferencePixelScaleTensor];
    v10 = [v6 weights];
    v11 = [v6 descriptors];
    id v12 = (id)[v7 styleNetwork:v8 pixelScale:v9 weights:v10 descriptors:v11 prefix:@"transformer_" algorithm:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)tc_trainingGraphForStyleTransferDescriptor:()TCMLComputeStyleTransfer stopGradientList:lossTensorDictionary:algorithm:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isComplete])
  {
    id v13 = objc_alloc_init(a1);
    v24 = [v10 contentTensor];
    v25 = [v10 styleTensor];
    v14 = [v10 pixelScaleTensor];
    v23 = [v10 meanTensor];
    v15 = [v10 varianceTensor];
    [v10 styleLossWeightTensor];
    id v26 = v12;
    v17 = id v16 = v11;
    v18 = [v10 weights];
    v19 = [v10 descriptors];
    LODWORD(v22) = a6;
    id v20 = (id)[v13 defineTraining:v24 style:v25 pixelScale:v14 mean:v23 variance:v15 styleLossWeightTensor:v17 weights:v18 stopGradientList:v16 descriptors:v19 lossTensorDictionary:v26 algorithm:v22];

    id v11 = v16;
    id v12 = v26;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end