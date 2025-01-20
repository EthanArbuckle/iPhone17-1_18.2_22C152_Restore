@interface MTRecommendationModulesRequest
- (MTRecommendationModulesRequest)init;
- (void)performWithCompletion:(id)a3;
@end

@implementation MTRecommendationModulesRequest

- (void)performWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1ACA503D8(v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (MTRecommendationModulesRequest)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MTRecommendationModulesRequest_kPayloadDataFetchLimit) = (Class)50;
  uint64_t v3 = OBJC_IVAR___MTRecommendationModulesRequest_context;
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_sharedInstance);
  v7 = (objc_class *)objc_msgSend(v6, sel_mainQueueContext);

  *(Class *)((char *)&self->super.super.isa + v3) = v7;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for RecommendationModulesRequest();
  return [(MTBaseMAPIRequest *)&v9 init];
}

- (void).cxx_destruct
{
}

@end