@interface MLCGraph(TCMLComputeDrawingClassifier)
+ (id)tc_graphForDrawingClassifierDescriptor:()TCMLComputeDrawingClassifier batchSize:;
@end

@implementation MLCGraph(TCMLComputeDrawingClassifier)

+ (id)tc_graphForDrawingClassifierDescriptor:()TCMLComputeDrawingClassifier batchSize:
{
  v23[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 isComplete])
  {
    id v7 = objc_alloc_init(a1);
    v8 = [v6 inputTensor];
    for (uint64_t i = 0; i != 3; ++i)
    {
      v10 = v8;
      v8 = [v6 addConvLayer:i outputChannels:qword_2246B9E78[i] source:v8 graph:v7];
    }
    v11 = (void *)MEMORY[0x263F10638];
    v12 = [NSNumber numberWithUnsignedInteger:a4];
    v23[0] = v12;
    v23[1] = &unk_26D796608;
    v23[2] = &unk_26D7965D8;
    v23[3] = &unk_26D7965D8;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
    v14 = [v11 layerWithShape:v13];

    v15 = [v7 nodeWithLayer:v14 source:v8];

    v16 = [v6 addDenseLayer:0 outputChannels:128 source:v15 graph:v7];

    v17 = (void *)MEMORY[0x263F10590];
    v18 = [MEMORY[0x263F10588] descriptorWithType:1 a:0.0];
    v19 = [v17 layerWithDescriptor:v18];

    v20 = [v7 nodeWithLayer:v19 source:v16];
    v21 = objc_msgSend(v6, "addDenseLayer:outputChannels:source:graph:", 1, objc_msgSend(v6, "outputChannels"), v20, v7);
    [v6 setOutputTensor:v21];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end