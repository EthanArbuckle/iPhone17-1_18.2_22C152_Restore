@interface PMLAWDEvaluationTrackerMock
+ (id)mockTracker;
+ (id)mockTrackerForPlanId:(id)a3;
- (NSArray)trackedEvaluations;
- (PMLAWDEvaluationTrackerMock)initWithAdapter:(id)a3 modelInfo:(id)a4;
- (PMLAWDEvaluationTrackerMock)initWithModel:(id)a3;
- (void)clearTrackedMessages;
@end

@implementation PMLAWDEvaluationTrackerMock

- (void).cxx_destruct
{
}

- (NSArray)trackedEvaluations
{
  adapter = self->_adapter;
  uint64_t v3 = objc_opt_class();
  return (NSArray *)[(PMLTrackerMockAdapter *)adapter trackedMessagesByClass:v3];
}

- (void)clearTrackedMessages
{
}

- (PMLAWDEvaluationTrackerMock)initWithModel:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(PMLAWDEvaluationTrackerMock *)self initWithAdapter:v5 modelInfo:v4];

  return v6;
}

- (PMLAWDEvaluationTrackerMock)initWithAdapter:(id)a3 modelInfo:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMLAWDEvaluationTrackerMock;
  v8 = [(PMLProtoBufTracker *)&v11 initWithAdapter:v7 modelInfo:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_adapter, a3);
  }

  return v9;
}

+ (id)mockTrackerForPlanId:(id)a3
{
  id v4 = +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:a3];
  v5 = (void *)[objc_alloc((Class)a1) initWithModel:v4];

  return v5;
}

+ (id)mockTracker
{
  return (id)[a1 mockTrackerForPlanId:@"foo-1.0-en"];
}

@end