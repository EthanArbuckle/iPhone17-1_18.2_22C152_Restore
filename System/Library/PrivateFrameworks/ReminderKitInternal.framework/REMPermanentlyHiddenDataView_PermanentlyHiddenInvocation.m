@interface REMPermanentlyHiddenDataView_PermanentlyHiddenInvocation
+ (BOOL)supportsSecureCoding;
- (REMPermanentlyHiddenDataView_PermanentlyHiddenInvocation)initWithCoder:(id)a3;
- (REMPermanentlyHiddenDataView_PermanentlyHiddenInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3;
@end

@implementation REMPermanentlyHiddenDataView_PermanentlyHiddenInvocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMPermanentlyHiddenDataView_PermanentlyHiddenInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithFetchResultTokenToDiffAgainst:a3];
}

- (REMPermanentlyHiddenDataView_PermanentlyHiddenInvocation)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithCoder:a3];
}

@end