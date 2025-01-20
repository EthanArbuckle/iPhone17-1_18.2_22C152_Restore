@interface PMLAWDLogisticRegTrackerMock
+ (id)mockTracker;
+ (id)mockTrackerForPlanId:(id)a3;
- (NSArray)trackedGradients;
- (NSArray)trackedWeights;
- (PMLAWDLogisticRegTrackerMock)initWithAdapter:(id)a3 modelInfo:(id)a4;
- (PMLAWDLogisticRegTrackerMock)initWithModel:(id)a3;
- (void)clearTrackedMessages;
@end

@implementation PMLAWDLogisticRegTrackerMock

- (void).cxx_destruct
{
}

- (NSArray)trackedWeights
{
  adapter = self->_adapter;
  uint64_t v3 = objc_opt_class();
  return (NSArray *)[(PMLTrackerMockAdapter *)adapter trackedMessagesByClass:v3];
}

- (NSArray)trackedGradients
{
  adapter = self->_adapter;
  uint64_t v3 = objc_opt_class();
  return (NSArray *)[(PMLTrackerMockAdapter *)adapter trackedMessagesByClass:v3];
}

- (void)clearTrackedMessages
{
}

- (PMLAWDLogisticRegTrackerMock)initWithModel:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(PMLAWDLogisticRegTrackerMock *)self initWithAdapter:v5 modelInfo:v4];

  return v6;
}

- (PMLAWDLogisticRegTrackerMock)initWithAdapter:(id)a3 modelInfo:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMLAWDLogisticRegTrackerMock;
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
  return (id)[a1 mockTrackerForPlanId:@"mock-1.0-en"];
}

@end