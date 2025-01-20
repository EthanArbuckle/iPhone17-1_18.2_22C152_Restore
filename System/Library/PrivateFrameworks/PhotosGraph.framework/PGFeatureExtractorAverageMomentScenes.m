@interface PGFeatureExtractorAverageMomentScenes
- (NSArray)featureNames;
- (NSString)name;
- (PGFeatureExtractorAverageMomentScenes)init;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAverageMomentScenes

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  v7 = (void *)FeatureExtractorAverageMomentScenes.floatVector(withEntity:)(v5);

  return v7;
}

- (NSString)name
{
  sub_1D1EBDE60();
  v2 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)featureNames
{
  v2 = self;
  FeatureExtractorAverageMomentScenes.featureNames.getter();

  v3 = (void *)sub_1D1EBE190();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)featureLength
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PGFeatureExtractorAverageMomentScenes_featureIndexByLowercasedScene))[2];
}

- (PGFeatureExtractorAverageMomentScenes)init
{
  result = (PGFeatureExtractorAverageMomentScenes *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PGFeatureExtractorAverageMomentScenes_sceneNodes));
  swift_bridgeObjectRelease();
}

@end