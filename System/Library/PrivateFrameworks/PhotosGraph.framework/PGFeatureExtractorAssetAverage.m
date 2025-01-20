@interface PGFeatureExtractorAssetAverage
- (NSArray)featureNames;
- (NSString)name;
- (PGFeatureExtractorAssetAverage)init;
- (PGFeatureExtractorAssetAverage)initWithFeatureExtractor:(id)a3 skipAssetsWithErrors:(BOOL)a4;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAssetAverage

- (PGFeatureExtractorAssetAverage)initWithFeatureExtractor:(id)a3 skipAssetsWithErrors:(BOOL)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PGFeatureExtractorAssetAverage_featureExtractor) = (Class)a3;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___PGFeatureExtractorAssetAverage_skipAssetsWithErrors) = a4;
  v10.receiver = self;
  v10.super_class = ObjectType;
  id v8 = a3;
  return [(PGFeatureExtractorAssetAverage *)&v10 init];
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v5 = (SEL *)a3;
  v6 = self;
  v7 = FeatureExtractorAssetAverage.floatVector(withEntity:)(v5);

  return v7;
}

- (int64_t)featureLength
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PGFeatureExtractorAssetAverage_featureExtractor), sel_featureLength);
}

- (NSArray)featureNames
{
  v2 = self;
  FeatureExtractorAssetAverage.featureNames.getter();

  v3 = (void *)sub_1D1EBE190();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSString)name
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PGFeatureExtractorAssetAverage_featureExtractor);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_name);
  sub_1D1EBDE60();

  sub_1D1EBDE60();
  sub_1D1EBDFA0();
  sub_1D1EBDFA0();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (PGFeatureExtractorAssetAverage)init
{
  result = (PGFeatureExtractorAssetAverage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end