@interface REMSuggestedAttributesHarvester_Invocation
+ (BOOL)supportsSecureCoding;
- (REMSuggestedAttributesHarvester_Invocation)initWithCoder:(id)a3;
@end

@implementation REMSuggestedAttributesHarvester_Invocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSuggestedAttributesHarvester_Invocation)initWithCoder:(id)a3
{
  return [(REMStoreSwiftInvocation *)self init];
}

@end