@interface PXStoryInactiveImageAdjustment
- (BOOL)allowsUnadjustedOpportunisticDelivery;
- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3;
- (BOOL)wantsSingleHighQualityDelivery;
- (PXStoryInactiveImageAdjustment)init;
- (id)applyToImage:(id)a3 targetSize:(CGSize)a4;
- (int64_t)contentModeForProposedContentMode:(int64_t)a3;
@end

@implementation PXStoryInactiveImageAdjustment

- (PXStoryInactiveImageAdjustment)init
{
  return (PXStoryInactiveImageAdjustment *)StoryInactiveImageAdjustment.init()();
}

- (id)applyToImage:(id)a3 targetSize:(CGSize)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1AA2577C4(v5);

  return v7;
}

- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3
{
  type metadata accessor for StoryInactiveImageAdjustment();
  if (swift_dynamicCastClass())
  {
    sub_1A9B21070(0, (unint64_t *)&qword_1E98212E0);
    swift_unknownObjectRetain();
    v4 = self;
    char v5 = sub_1AB23B7AC();
    swift_unknownObjectRelease();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)allowsUnadjustedOpportunisticDelivery
{
  return 1;
}

- (BOOL)wantsSingleHighQualityDelivery
{
  return 0;
}

- (int64_t)contentModeForProposedContentMode:(int64_t)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end