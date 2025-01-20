@interface VisualIntelligenceServiceCompatible
+ (NSArray)encryptedVisualSearchDomains;
+ (NSArray)richLabelEligibleVisualSearchDomains;
- (BOOL)isEligibleForEncryptedSearchWithCachedResults:(id)a3;
- (CGSize)targetImageSizeWithInputImageSize:(CGSize)a3;
- (_TtC18VisualIntelligence23OntologyGraphCompatible)ontologyGraph;
- (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible)init;
- (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible)initWithOverrideTrialTypes:(id)a3 namespaces:(id)a4 factors:(id)a5 values:(id)a6;
- (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible)initWithTimeoutInterval:(int64_t)a3;
- (id)detectWithImage:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5;
- (id)detectorModelDescriptions;
- (id)encryptedSearchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6;
- (id)encryptedSearchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 domain:(id)a6 completion:(id)a7;
- (id)experimentalSearchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6;
- (id)generateCachedResultsWithDetectorOutputs:(id)a3 imageSize:(CGSize)a4 imageOrientation:(unsigned int)a5 normalizedRegionOfInterest:(CGRect)a6;
- (id)getEncryptedSearchDomainsWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5;
- (id)parseCachedWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5;
- (id)parseCameraFrameCachedWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5;
- (id)parseCameraFrameWithVisualQuery:(id)a3 completion:(id)a4;
- (id)parseWithVisualQuery:(id)a3 completion:(id)a4;
- (id)pegasusPayloadDataWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 options:(unint64_t)a6 error:(id *)a7;
- (id)refineRegionsWithRequest:(id)a3 error:(id *)a4;
- (id)searchCameraFrameWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6;
- (id)searchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6;
- (id)searchWithVisualQuery:(id)a3 completion:(id)a4;
- (id)submitUserFeedbackWithUserFeedback:(id)a3 completion:(id)a4;
- (void)clearCacheWithCacheOption:(int64_t)a3;
@end

@implementation VisualIntelligenceServiceCompatible

+ (NSArray)encryptedVisualSearchDomains
{
  return (NSArray *)sub_1DCF8CC9C((uint64_t)a1, (uint64_t)a2, &qword_1EBE82D68);
}

+ (NSArray)richLabelEligibleVisualSearchDomains
{
  return (NSArray *)sub_1DCF8CC9C((uint64_t)a1, (uint64_t)a2, &qword_1EAB02060);
}

- (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible)init
{
  return (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *)VisualIntelligenceServiceCompatible.init()();
}

- (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible)initWithTimeoutInterval:(int64_t)a3
{
  return (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *)VisualIntelligenceServiceCompatible.init(timeoutInterval:)(a3);
}

- (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible)initWithOverrideTrialTypes:(id)a3 namespaces:(id)a4 factors:(id)a5 values:(id)a6
{
  return (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *)VisualIntelligenceServiceCompatible.init(overrideTrialTypes:namespaces:factors:values:)();
}

- (_TtC18VisualIntelligence23OntologyGraphCompatible)ontologyGraph
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa
                   + OBJC_IVAR____TtC18VisualIntelligence35VisualIntelligenceServiceCompatible_service))[3];
  v3 = (objc_class *)type metadata accessor for OntologyGraphCompatible();
  v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR____TtC18VisualIntelligence23OntologyGraphCompatible_ontologyGraph] = v2;
  v7.receiver = v4;
  v7.super_class = v3;
  swift_bridgeObjectRetain();
  v5 = [(VisualIntelligenceServiceCompatible *)&v7 init];
  return (_TtC18VisualIntelligence23OntologyGraphCompatible *)v5;
}

- (CGSize)targetImageSizeWithInputImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  swift_retain();
  *(double *)&uint64_t v6 = COERCE_DOUBLE(sub_1DCFE81CC(width, height));
  double v8 = v7;
  char v10 = v9;

  swift_release();
  double v11 = *(double *)&v6;
  double v12 = v8;
  if (v10)
  {
    double v12 = 0.0;
    double v11 = 0.0;
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (id)parseWithVisualQuery:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1DCF97A5C;
  *(void *)(v8 + 24) = v7;
  id v9 = a3;
  char v10 = self;
  swift_retain();
  swift_retain();
  id v11 = VisualIntelligenceService.parse(query:cachedResults:completion:)(v9, 0, (uint64_t)sub_1DCF97AF0, v8);

  swift_release();
  swift_release();
  swift_release();
  return v11;
}

- (id)parseCachedWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1DCF97B00;
  *(void *)(v10 + 24) = v9;
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  swift_retain();
  swift_retain();
  id v14 = VisualIntelligenceService.parse(query:cachedResults:completion:)(v11, a4, (uint64_t)sub_1DCF97AF4, v10);

  swift_release();
  swift_release();
  swift_release();
  return v14;
}

- (id)searchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  v16 = sub_1DCF8DCBC(v12, (uint64_t)v13, a5, (uint64_t)sub_1DCF97A5C, v11);

  swift_release();
  return v16;
}

- (id)detectorModelDescriptions
{
  uint64_t v2 = self;
  swift_retain();
  id v3 = sub_1DCED01B4();

  swift_release();
  return v3;
}

- (id)generateCachedResultsWithDetectorOutputs:(id)a3 imageSize:(CGSize)a4 imageOrientation:(unsigned int)a5 normalizedRegionOfInterest:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  double v11 = a4.height;
  double v12 = a4.width;
  id v14 = a3;
  v15 = self;
  swift_retain();
  v16 = (void *)sub_1DCEB37F8((uint64_t)v14, a5, v12, v11, x, y, width, height);

  swift_release();
  return v16;
}

- (id)parseCameraFrameWithVisualQuery:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1DCF978B8;
  *(void *)(v8 + 24) = v7;
  id v9 = a3;
  uint64_t v10 = self;
  swift_retain();
  swift_retain();
  id v11 = VisualIntelligenceService.parseCameraFrame(query:cachedResults:completion:)(v9, 0, (uint64_t)sub_1DCF97AF0, v8);

  swift_release();
  swift_release();
  swift_release();
  return v11;
}

- (id)parseCameraFrameCachedWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1DCF97878;
  *(void *)(v10 + 24) = v9;
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  swift_retain();
  swift_retain();
  id v14 = VisualIntelligenceService.parseCameraFrame(query:cachedResults:completion:)(v11, a4, (uint64_t)sub_1DCF97AF4, v10);

  swift_release();
  swift_release();
  swift_release();
  return v14;
}

- (id)searchCameraFrameWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  swift_retain();
  id v16 = sub_1DCEDB598((uint64_t)v13, a5, (uint64_t)sub_1DCF97A5C, v11);

  swift_release();
  swift_release();
  return v16;
}

- (id)experimentalSearchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6
{
  return sub_1DCF906F0(self, (int)a2, a3, a4, a5, a6, (uint64_t (*)(id, id, void *, id, void *))sub_1DCF94760);
}

- (id)encryptedSearchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 completion:(id)a6
{
  return sub_1DCF906F0(self, (int)a2, a3, a4, a5, a6, (uint64_t (*)(id, id, void *, id, void *))sub_1DCF95190);
}

- (id)encryptedSearchWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 domain:(id)a6 completion:(id)a7
{
  id v12 = _Block_copy(a7);
  _Block_copy(v12);
  id v13 = (uint8_t *)a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = self;
  id v18 = sub_1DCF95FB8(v13, v14, a5, v16, (uint64_t)v17, v12);
  _Block_release(v12);
  _Block_release(v12);

  return v18;
}

- (BOOL)isEligibleForEncryptedSearchWithCachedResults:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  swift_retain();
  char v7 = sub_1DCEBC544(a3);

  swift_release();
  return v7 & 1;
}

- (id)getEncryptedSearchDomainsWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1DCF97870;
  *(void *)(v10 + 24) = v9;
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  swift_retain();
  swift_retain();
  id v14 = VisualIntelligenceService.parse(query:cachedResults:completion:)(v11, a4, (uint64_t)sub_1DCF97AFC, v10);

  swift_release();
  swift_release();
  swift_release();
  return v14;
}

- (id)submitUserFeedbackWithUserFeedback:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = sub_1DCF92100(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);

  return v9;
}

- (id)searchWithVisualQuery:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  id v10 = sub_1DCF9277C(v8, (uint64_t)sub_1DCF97A5C, v7);

  swift_release();
  return v10;
}

- (id)pegasusPayloadDataWithImage:(id)a3 visualUnderstanding:(id)a4 queryContext:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = self;
  uint64_t v15 = sub_1DCF92B3C(v11, (uint64_t)v12, a5, a6);
  unint64_t v17 = v16;

  id v18 = (void *)sub_1DD0464D8();
  sub_1DCD21954(v15, v17);
  return v18;
}

- (id)detectWithImage:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_1DCF9302C(x, y, width, height);

  swift_unknownObjectRelease();
  sub_1DCD95648(0, &qword_1EAB04670);
  id v11 = (void *)sub_1DD0486A8();
  swift_bridgeObjectRelease();
  return v11;
}

- (void)clearCacheWithCacheOption:(int64_t)a3
{
}

- (id)refineRegionsWithRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  swift_retain();
  uint64_t v7 = (void *)sub_1DCEA64A8(v5);

  swift_release();
  return v7;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end