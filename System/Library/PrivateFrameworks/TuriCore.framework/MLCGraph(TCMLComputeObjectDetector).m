@interface MLCGraph(TCMLComputeObjectDetector)
+ (id)tc_graphForObjectDetectorDescriptor:()TCMLComputeObjectDetector;
@end

@implementation MLCGraph(TCMLComputeObjectDetector)

+ (id)tc_graphForObjectDetectorDescriptor:()TCMLComputeObjectDetector
{
  id v4 = a3;
  if ([v4 isComplete])
  {
    id v5 = objc_alloc_init(a1);
    v6 = [v4 inputTensor];
    for (uint64_t i = 0; i != 8; ++i)
    {
      v8 = v6;
      v6 = [v4 addCommonLayersWithIndex:i outputChannels:qword_2246FAD18[i] source:v6 graph:v5];
    }
    v9 = objc_msgSend(v4, "convLayerForIndex:outputChannels:", 8, objc_msgSend(v4, "outputChannels"));
    id v10 = (id)[v5 nodeWithLayer:v9 source:v6];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end