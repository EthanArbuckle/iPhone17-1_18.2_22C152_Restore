@interface REMListPickerDataView_FlaggedInvocation
+ (BOOL)supportsSecureCoding;
- (REMListPickerDataView_FlaggedInvocation)initWithCoder:(id)a3;
- (REMListPickerDataView_FlaggedInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3;
@end

@implementation REMListPickerDataView_FlaggedInvocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListPickerDataView_FlaggedInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithFetchResultTokenToDiffAgainst:a3];
}

- (REMListPickerDataView_FlaggedInvocation)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithCoder:a3];
}

@end