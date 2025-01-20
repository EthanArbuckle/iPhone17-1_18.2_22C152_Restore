@interface MRIRRouteRecommendationContext
+ (id)fromObject:(id)a3;
- (MRIRRouteRecommendationContext)init;
- (MRIRRouteRecommendationContext)initWithCandidateResults:(id)a3 contextIdentifier:(id)a4;
- (NSSet)candidateResults;
- (NSString)contextIdentifier;
- (NSString)description;
- (void)setCandidateResults:(id)a3;
- (void)setContextIdentifier:(id)a3;
@end

@implementation MRIRRouteRecommendationContext

+ (id)fromObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)sub_1000079D0(v3);

  return v4;
}

- (NSSet)candidateResults
{
  return (NSSet *)sub_100319A00((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___MRIRRouteRecommendationContext_candidateResults, (void (*)(uint64_t))type metadata accessor for RouteRecommendationCandidateResult, &qword_10047DAF8, (void (*)(void))type metadata accessor for RouteRecommendationCandidateResult);
}

- (void)setCandidateResults:(id)a3
{
}

- (NSString)contextIdentifier
{
  return (NSString *)sub_10027068C();
}

- (void)setContextIdentifier:(id)a3
{
}

- (MRIRRouteRecommendationContext)initWithCandidateResults:(id)a3 contextIdentifier:(id)a4
{
  type metadata accessor for RouteRecommendationCandidateResult();
  sub_10031C7E0(&qword_10047DAF8, (void (*)(void))type metadata accessor for RouteRecommendationCandidateResult);
  v5 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationContext_candidateResults) = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MRIRRouteRecommendationContext_contextIdentifier);
  uint64_t *v7 = v6;
  v7[1] = v8;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RouteRecommendationContext();
  return [(MRIRRouteRecommendationContext *)&v10 init];
}

- (NSString)description
{
  return (NSString *)sub_100318F98(self, (uint64_t)a2, type metadata accessor for RouteRecommendationContext, &qword_10047D8E8, (void (*)(void))type metadata accessor for RouteRecommendationContext);
}

- (MRIRRouteRecommendationContext)init
{
  result = (MRIRRouteRecommendationContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end