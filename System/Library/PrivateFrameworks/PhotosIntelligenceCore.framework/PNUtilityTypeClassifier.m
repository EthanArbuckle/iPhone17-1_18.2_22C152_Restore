@interface PNUtilityTypeClassifier
+ (BOOL)screenshotInferredInAsset:(id)a3 usingSceneModel:(id)a4;
+ (unint64_t)latestVersion;
+ (unint64_t)utilityTypesDetectedInAsset:(id)a3 usingSceneModel:(id)a4;
- (PNUtilityTypeClassifier)init;
@end

@implementation PNUtilityTypeClassifier

+ (unint64_t)latestVersion
{
  return 9;
}

+ (BOOL)screenshotInferredInAsset:(id)a3 usingSceneModel:(id)a4
{
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  id v6 = a4;
  char v7 = static PNUtilityTypeClassifier.screenshotInferred(in:usingSceneModel:)(a3, v6);
  swift_unknownObjectRelease();

  return v7 & 1;
}

+ (unint64_t)utilityTypesDetectedInAsset:(id)a3 usingSceneModel:(id)a4
{
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  id v6 = a4;
  unint64_t v7 = static PNUtilityTypeClassifier.utilityTypesDetected(in:usingSceneModel:)(a3, v6);
  swift_unknownObjectRelease();

  return v7;
}

- (PNUtilityTypeClassifier)init
{
  return (PNUtilityTypeClassifier *)PNUtilityTypeClassifier.init()();
}

@end