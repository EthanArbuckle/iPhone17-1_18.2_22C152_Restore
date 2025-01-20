@interface MLCGraph(TCMLComputeActivityClassifier)
+ (id)tc_graphForActivityClassifierDescriptor:()TCMLComputeActivityClassifier seed:;
@end

@implementation MLCGraph(TCMLComputeActivityClassifier)

+ (id)tc_graphForActivityClassifierDescriptor:()TCMLComputeActivityClassifier seed:
{
  id v6 = a3;
  if ([v6 isComplete])
  {
    id v7 = objc_alloc_init(a1);
    v8 = [v6 inputTensor];
    v9 = [v6 addConvLayerWithOutputChannels:64 source:v8 graph:v7];

    LODWORD(v10) = 1045220557;
    v11 = [MEMORY[0x263F105C8] layerWithRate:a4 seed:v10];
    v12 = [v7 nodeWithLayer:v11 source:v9];

    v13 = [v6 addLSTMLayerWithInputSize:64 outputSize:200 source:v12 graph:v7];

    v14 = [v6 addDenseLayerWithIndex:0 outputChannels:128 source:v13 graph:v7];

    v15 = [v6 addBatchNormLayerWithSource:v14 graph:v7];

    LODWORD(v16) = 0.5;
    v17 = [MEMORY[0x263F105C8] layerWithRate:a4 seed:v16];
    v18 = [v7 nodeWithLayer:v17 source:v15];

    v19 = objc_msgSend(v6, "addDenseLayerWithIndex:outputChannels:source:graph:", 1, objc_msgSend(v6, "outputChannels"), v18, v7);
    [v6 setOutputTensor:v19];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end