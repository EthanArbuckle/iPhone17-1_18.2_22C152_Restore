@interface MTRecommendationModuleContentRequest
- (MTRecommendationModuleContentRequest)init;
- (MTRecommendationModuleContentRequest)initWithModuleID:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MTRecommendationModuleContentRequest

- (MTRecommendationModuleContentRequest)initWithModuleID:(id)a3
{
  uint64_t v4 = sub_1ACE761B8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MTRecommendationModuleContentRequest_moduleID);
  uint64_t *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RecommendationModuleContentRequest();
  return [(MTBaseMAPIRequest *)&v8 init];
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1ACAD57B0((char *)v5, v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (MTRecommendationModuleContentRequest)init
{
  result = (MTRecommendationModuleContentRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end