@interface PHFace(PNFaceProtocol)
- (id)faceprintData;
- (void)setQualityMeasure:()PNFaceProtocol;
@end

@implementation PHFace(PNFaceProtocol)

- (void)setQualityMeasure:()PNFaceProtocol
{
  id v4 = [MEMORY[0x263F14DF8] changeRequestForFace:a1];
  [v4 setQualityMeasure:a3];
}

- (id)faceprintData
{
  [a1 fetchPropertySetsIfNeeded];
  v2 = [a1 faceClusteringProperties];
  v3 = [v2 faceprint];
  id v4 = [v3 faceprintData];

  return v4;
}

@end