@interface MLCGraph(TCMLComputeMLPClassifier)
+ (id)tc_createGraphFromMLPClassifierDescriptor:()TCMLComputeMLPClassifier;
@end

@implementation MLCGraph(TCMLComputeMLPClassifier)

+ (id)tc_createGraphFromMLPClassifierDescriptor:()TCMLComputeMLPClassifier
{
  id v4 = a3;
  if ([v4 isComplete])
  {
    id v5 = objc_alloc_init(a1);
    v6 = [v4 inputTensor];
    v7 = [v4 layerSizes];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 1;
      v10 = v6;
      do
      {
        v11 = [v4 layerSizes];
        v12 = [v11 objectAtIndexedSubscript:v9 - 1];

        v6 = objc_msgSend(v4, "addFullyConnectedLayerWithIndex:outputChannels:source:graph:", v9, objc_msgSend(v12, "unsignedIntegerValue"), v10, v5);

        v13 = [v4 layerSizes];
        unint64_t v14 = [v13 count];

        uint64_t v15 = v9 + 1;
        v10 = v6;
      }
      while (v9++ < v14);
    }
    else
    {
      uint64_t v15 = 1;
    }
    v17 = objc_msgSend(v4, "fullyConnectedLayerForIndex:outputChannels:", v15, objc_msgSend(v4, "outputChannels"));
    v18 = [v5 nodeWithLayer:v17 source:v6];
    [v4 setFcFinalTensor:v18];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end