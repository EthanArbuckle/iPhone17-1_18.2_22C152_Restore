@interface PGMomentIngestCLIPFeatureVectorExtractor
+ (id)decodeEncodedCLIPFeatureVector:(id)a3 withError:(id *)a4;
+ (id)encodeCLIPFeatureVector:(id)a3;
- (PGMomentIngestCLIPFeatureVectorExtractor)init;
- (PGMomentIngestCLIPFeatureVectorExtractor)initWithIngestMomentContainer:(id)a3;
- (id)extractCLIPFeatureVectorWithError:(id *)a3;
@end

@implementation PGMomentIngestCLIPFeatureVectorExtractor

- (PGMomentIngestCLIPFeatureVectorExtractor)initWithIngestMomentContainer:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGMomentIngestCLIPFeatureVectorExtractor_ingestMomentContainer) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MomentIngestCLIPFeatureVectorExtractor();
  id v4 = a3;
  return [(PGMomentIngestCLIPFeatureVectorExtractor *)&v6 init];
}

- (id)extractCLIPFeatureVectorWithError:(id *)a3
{
  v3 = self;
  id v4 = sub_1D1B10CD8();

  return v4;
}

+ (id)encodeCLIPFeatureVector:(id)a3
{
  id v3 = a3;
  _s11PhotosGraph38MomentIngestCLIPFeatureVectorExtractorC6encodeySSSo07MAFloatF0CFZ_0(v3);

  id v4 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)decodeEncodedCLIPFeatureVector:(id)a3 withError:(id *)a4
{
  uint64_t v4 = sub_1D1EBDE60();
  id v6 = sub_1D1B11A98(v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

- (PGMomentIngestCLIPFeatureVectorExtractor)init
{
  result = (PGMomentIngestCLIPFeatureVectorExtractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PGMomentIngestCLIPFeatureVectorExtractor_ingestMomentContainer));
}

@end