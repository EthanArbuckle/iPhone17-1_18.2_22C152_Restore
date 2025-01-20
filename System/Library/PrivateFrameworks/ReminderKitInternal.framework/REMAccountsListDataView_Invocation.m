@interface REMAccountsListDataView_Invocation
+ (BOOL)supportsSecureCoding;
- (REMAccountsListDataView_Invocation)initWithCoder:(id)a3;
- (REMAccountsListDataView_Invocation)initWithFetchResultTokenToDiffAgainst:(id)a3;
@end

@implementation REMAccountsListDataView_Invocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountsListDataView_Invocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithFetchResultTokenToDiffAgainst:a3];
}

- (REMAccountsListDataView_Invocation)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithCoder:a3];
}

@end