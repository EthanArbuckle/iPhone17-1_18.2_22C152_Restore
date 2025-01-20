@interface MPSCNNInstanceNormalizationNode(TCMPSLayerHelper)
+ (id)createInstanceNormalization:()TCMPSLayerHelper channels:styles:gamma:beta:label:device:cmdQueue:;
- (id)tc_weightsData;
- (void)setTc_weightsData:()TCMPSLayerHelper;
@end

@implementation MPSCNNInstanceNormalizationNode(TCMPSLayerHelper)

- (void)setTc_weightsData:()TCMPSLayerHelper
{
}

- (id)tc_weightsData
{
  return objc_getAssociatedObject(a1, &kWeightsKey);
}

+ (id)createInstanceNormalization:()TCMPSLayerHelper channels:styles:gamma:beta:label:device:cmdQueue:
{
  id v15 = a3;
  id v27 = a6;
  id v26 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  v19 = [TCMPSInstanceNormDataLoader alloc];
  id v20 = v27;
  uint64_t v21 = [v20 bytes];
  id v22 = v26;
  v23 = -[TCMPSInstanceNormDataLoader initWithParams:gammaWeights:betaWeights:numberFeatureChannels:styles:device:cmd_queue:](v19, "initWithParams:gammaWeights:betaWeights:numberFeatureChannels:styles:device:cmd_queue:", v16, v21, [v22 bytes], a4, a5, v17, v18);
  v24 = [MEMORY[0x263F13150] nodeWithSource:v15 dataSource:v23];
  objc_msgSend(v24, "setTc_weightsData:", v23);

  return v24;
}

@end