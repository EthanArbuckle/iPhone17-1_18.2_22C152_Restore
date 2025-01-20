@interface PNVisualOutliersWrapper
+ (BOOL)isAsset:(id)a3 similarToAnyAssets:(id)a4 withinThresholdType:(int64_t)a5;
+ (id)assetsDistancesSummary:(id)a3 inAssets:(id)a4 withinThresholdType:(int64_t)a5;
+ (id)outlierScoresForAssets:(id)a3;
+ (id)requiredFetchPropertySets;
@end

@implementation PNVisualOutliersWrapper

+ (id)outlierScoresForAssets:(id)a3
{
  return +[PNVisualOutliers outlierScoresForAssets:a3];
}

+ (BOOL)isAsset:(id)a3 similarToAnyAssets:(id)a4 withinThresholdType:(int64_t)a5
{
  return +[PNVisualOutliers isAsset:a3 similarToAnyAssets:a4 withinThresholdType:a5];
}

+ (id)assetsDistancesSummary:(id)a3 inAssets:(id)a4 withinThresholdType:(int64_t)a5
{
  return +[PNVisualOutliers assetsDistancesSummary:a3 inAssets:a4 withinThresholdType:a5];
}

+ (id)requiredFetchPropertySets
{
  return +[PNVisualOutliers requiredFetchPropertySets];
}

@end