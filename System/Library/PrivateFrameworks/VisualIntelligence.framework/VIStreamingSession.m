@interface VIStreamingSession
- (VIStreamingSession)init;
- (VIStreamingSession)initWithCompatService:(id)a3;
- (id)extractSignalsWithRequest:(id)a3 error:(id *)a4;
- (id)parseWithRequest:(id)a3 error:(id *)a4;
@end

@implementation VIStreamingSession

- (VIStreamingSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)VIStreamingSession;
  v2 = [(VIStreamingSession *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    compatService = v2->_compatService;
    v2->_compatService = (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *)v3;
  }
  return v2;
}

- (VIStreamingSession)initWithCompatService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIStreamingSession;
  objc_super v6 = [(VIStreamingSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_compatService, a3);
  }

  return v7;
}

- (id)parseWithRequest:(id)a3 error:(id *)a4
{
  compatService = self->_compatService;
  id v6 = a3;
  v7 = [v6 frame];
  v8 = [v7 imageContent];
  objc_super v9 = [v6 frame];

  [v9 normalizedRegionOfInterest];
  v10 = -[VisualIntelligenceServiceCompatible detectWithImage:regionOfInterest:error:](compatService, "detectWithImage:regionOfInterest:error:", v8, a4);

  v11 = (void *)VICompactMapArray(v10, &__block_literal_global_0);
  v12 = [[VIStreamingParseResult alloc] initWithDetectedObjects:v11];

  return v12;
}

VIStreamingDetectedObject *__45__VIStreamingSession_parseWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [VIStreamingDetectedObject alloc];
  v4 = [MEMORY[0x1E4F29128] UUID];
  [v2 boundingBox];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(VIStreamingDetectedObject *)v3 initWithObjectUUID:v4, @"com.apple.argos.domain_key.book", @"book.closed.fill", @"result", v6, v8, v10, v12 normalizedBoundingBox domainKey glyphName displayLabel];
  return v13;
}

- (id)extractSignalsWithRequest:(id)a3 error:(id *)a4
{
  v4 = [VIImageRegion alloc];
  double v5 = -[VIImageRegion initWithRegionOfInterest:domainInfo:](v4, "initWithRegionOfInterest:domainInfo:", MEMORY[0x1E4F1CBF0], *(double *)&VIIdentityRect, unk_1EAB01B60, *(double *)&qword_1EAB01B68, unk_1EAB01B70);
  double v6 = [[VIStreamingSignalExtractionResult alloc] initWithImageRegion:v5 payload:0];

  return v6;
}

- (void).cxx_destruct
{
}

@end