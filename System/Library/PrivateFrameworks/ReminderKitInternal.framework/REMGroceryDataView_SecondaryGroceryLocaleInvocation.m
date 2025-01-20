@interface REMGroceryDataView_SecondaryGroceryLocaleInvocation
+ (BOOL)supportsSecureCoding;
- (REMGroceryDataView_SecondaryGroceryLocaleInvocation)initWithCoder:(id)a3;
- (REMGroceryDataView_SecondaryGroceryLocaleInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3;
@end

@implementation REMGroceryDataView_SecondaryGroceryLocaleInvocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMGroceryDataView_SecondaryGroceryLocaleInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithFetchResultTokenToDiffAgainst:a3];
}

- (REMGroceryDataView_SecondaryGroceryLocaleInvocation)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithCoder:a3];
}

@end