@interface PGFeatureExtractorIsInteresting
- (NSArray)featureNames;
- (NSString)name;
- (PGFeatureExtractorIsInteresting)init;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorIsInteresting

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = FeatureExtractorIsInteresting.floatVector(withEntity:)(v5);

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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD47AC0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1D1F38C60;
  *(void *)(v2 + 32) = sub_1D1EBDE60();
  *(void *)(v2 + 40) = v3;
  *(void *)(v2 + 48) = sub_1D1EBDE60();
  *(void *)(v2 + 56) = v4;
  id v5 = (void *)sub_1D1EBE190();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

- (int64_t)featureLength
{
  return 2;
}

- (PGFeatureExtractorIsInteresting)init
{
  result = (PGFeatureExtractorIsInteresting *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PGFeatureExtractorIsInteresting_interestingMomentNodes));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PGFeatureExtractorIsInteresting_smartInterestingMomentNodes);
}

@end