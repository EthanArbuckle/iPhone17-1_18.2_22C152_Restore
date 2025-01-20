@interface PGFeatureExtractorCircularDatetime
- (NSArray)featureNames;
- (NSString)name;
- (PGFeatureExtractorCircularDatetime)init;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorCircularDatetime

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_1D183A8D8(v5);
  v8 = v7;

  return v8;
}

- (int64_t)featureLength
{
  return 10;
}

- (NSArray)featureNames
{
  _s11PhotosGraph32FeatureExtractorCircularDatetimeC12featureNamesSaySSGvg_0();
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

- (PGFeatureExtractorCircularDatetime)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGFeatureExtractorCircularDatetime *)&v3 init];
}

@end