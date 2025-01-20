@interface PGFeatureExtractorStoredCLIP
- (NSArray)featureNames;
- (NSString)name;
- (PGFeatureExtractorStoredCLIP)init;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorStoredCLIP

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1D1A313B0(v5);

  return v7;
}

- (int64_t)featureLength
{
  return 768;
}

- (NSArray)featureNames
{
  _s11PhotosGraph26FeatureExtractorStoredCLIPC12featureNamesSaySSGvg_0();
  v2 = (void *)sub_1D1EBE190();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSString)name
{
  sub_1D1EBDE60();
  v2 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (PGFeatureExtractorStoredCLIP)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGFeatureExtractorStoredCLIP *)&v3 init];
}

@end