@interface PGKeywordBasedFeatureExtractor
- (PGKeywordBasedFeatureExtractor)init;
- (PGKeywordBasedFeatureExtractor)initWithWeightByKeyword:(id)a3;
- (id)musicCurationFeaturesWithContext:(id)a3 progressReporter:(id)a4 error:(id *)a5;
@end

@implementation PGKeywordBasedFeatureExtractor

- (PGKeywordBasedFeatureExtractor)initWithWeightByKeyword:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = (objc_class *)sub_1D1EBDCE0();
  v6 = (char *)self + OBJC_IVAR___PGKeywordBasedFeatureExtractor____lazy_storage___consistentHash;
  *(void *)v6 = 0;
  v6[8] = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGKeywordBasedFeatureExtractor_weightByKeyword) = v5;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(PGKeywordBasedFeatureExtractor *)&v8 init];
}

- (id)musicCurationFeaturesWithContext:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)KeywordBasedFeatureExtractor.musicCurationFeatures(context:progressReporter:)((uint64_t)v7);

  return v10;
}

- (PGKeywordBasedFeatureExtractor)init
{
  result = (PGKeywordBasedFeatureExtractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end