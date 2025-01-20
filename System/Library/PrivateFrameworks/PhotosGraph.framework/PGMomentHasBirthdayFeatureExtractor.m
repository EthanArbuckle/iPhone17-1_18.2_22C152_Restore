@interface PGMomentHasBirthdayFeatureExtractor
- (NSArray)featureNames;
- (NSString)name;
- (PGMomentHasBirthdayFeatureExtractor)init;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (int64_t)featureLength;
@end

@implementation PGMomentHasBirthdayFeatureExtractor

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  MomentHasBirthdayFeatureExtractor.floatVector(withEntity:)(v5);
  v8 = v7;

  return v8;
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
  *(_OWORD *)(v2 + 16) = xmmword_1D1F39820;
  *(void *)(v2 + 32) = sub_1D1EBDE60();
  *(void *)(v2 + 40) = v3;
  *(void *)(v2 + 48) = sub_1D1EBDE60();
  *(void *)(v2 + 56) = v4;
  *(void *)(v2 + 64) = sub_1D1EBDE60();
  *(void *)(v2 + 72) = v5;
  v6 = (void *)sub_1D1EBE190();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (int64_t)featureLength
{
  return 3;
}

- (PGMomentHasBirthdayFeatureExtractor)init
{
  result = (PGMomentHasBirthdayFeatureExtractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PGMomentHasBirthdayFeatureExtractor_personNodesByMomentNode);
  swift_unknownObjectRelease();
}

@end