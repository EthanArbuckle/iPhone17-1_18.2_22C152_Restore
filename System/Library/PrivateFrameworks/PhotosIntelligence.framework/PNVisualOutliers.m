@interface PNVisualOutliers
+ (BOOL)isAsset:(id)a3 similarToAnyAssets:(id)a4 withinThresholdType:(int64_t)a5;
+ (id)assetsDistancesSummary:(id)a3 inAssets:(id)a4 withinThresholdType:(int64_t)a5;
+ (id)outlierScoresForAssets:(id)a3;
+ (id)requiredFetchPropertySets;
- (PNVisualOutliers)init;
@end

@implementation PNVisualOutliers

+ (id)requiredFetchPropertySets
{
  static VisualOutliers.requiredFetchPropertySets()();
  v2 = (void *)sub_2598444E0();
  swift_bridgeObjectRelease();
  return v2;
}

+ (id)assetsDistancesSummary:(id)a3 inAssets:(id)a4 withinThresholdType:(int64_t)a5
{
  sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
  unint64_t v7 = sub_259844500();
  id v8 = a3;
  static VisualOutliers.assetsDistancesSummary(for:in:with:)(v8, v7, a5);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_259843E90();
  swift_bridgeObjectRelease();
  return v9;
}

+ (BOOL)isAsset:(id)a3 similarToAnyAssets:(id)a4 withinThresholdType:(int64_t)a5
{
  sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
  uint64_t v7 = sub_259844500();
  id v8 = a3;
  LOBYTE(a5) = static VisualOutliers.isSimilarToAnyAssetInAssets(for:in:with:)(v8, v7, a5);

  swift_bridgeObjectRelease();
  return a5 & 1;
}

+ (id)outlierScoresForAssets:(id)a3
{
  sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
  unint64_t v3 = sub_259844500();
  static VisualOutliers.outlierScoresForAssets(assets:)(v3);
  swift_bridgeObjectRelease();
  sub_25935633C(0, (unint64_t *)&qword_26B2FFA10);
  v4 = (void *)sub_259843E90();
  swift_bridgeObjectRelease();
  return v4;
}

- (PNVisualOutliers)init
{
  return (PNVisualOutliers *)VisualOutliers.init()();
}

@end