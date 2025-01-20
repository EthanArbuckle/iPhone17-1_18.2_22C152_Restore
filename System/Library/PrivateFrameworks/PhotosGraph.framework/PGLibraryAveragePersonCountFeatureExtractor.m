@interface PGLibraryAveragePersonCountFeatureExtractor
- (NSArray)featureNames;
- (NSString)name;
- (PGLibraryAveragePersonCountFeatureExtractor)init;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (int64_t)featureLength;
@end

@implementation PGLibraryAveragePersonCountFeatureExtractor

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_1D18FA36C(v5);
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
  *(_OWORD *)(v2 + 16) = xmmword_1D1F387A0;
  *(void *)(v2 + 32) = sub_1D1EBDE60();
  *(void *)(v2 + 40) = v3;
  v4 = (void *)sub_1D1EBE190();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (int64_t)featureLength
{
  return 1;
}

- (PGLibraryAveragePersonCountFeatureExtractor)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGLibraryAveragePersonCountFeatureExtractor *)&v3 init];
}

@end