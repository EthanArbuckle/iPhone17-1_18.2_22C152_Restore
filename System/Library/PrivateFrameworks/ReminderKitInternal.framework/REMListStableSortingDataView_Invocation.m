@interface REMListStableSortingDataView_Invocation
+ (BOOL)supportsSecureCoding;
- (REMListStableSortingDataView_Invocation)initWithCoder:(id)a3;
- (REMListStableSortingDataView_Invocation)initWithFetchResultTokenToDiffAgainst:(id)a3;
@end

@implementation REMListStableSortingDataView_Invocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListStableSortingDataView_Invocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithFetchResultTokenToDiffAgainst:a3];
}

- (REMListStableSortingDataView_Invocation)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithCoder:a3];
}

@end