@interface WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry
+ (BOOL)supportsSecureCoding;
- (WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry)initWithCoder:(id)a3;
@end

@implementation WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry

- (void).cxx_destruct
{
}

- (WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry;
  v5 = [(WFGranularHealthKitAccessResourcePerWorkflowStateMigratedEntry *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAuthorized"];
    authorized = v5->authorized;
    v5->authorized = (NSNumber *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end