@interface WFWorkflowRunDescriptor
+ (BOOL)supportsSecureCoding;
- (NSString)kind;
@end

@implementation WFWorkflowRunDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)kind
{
  return (NSString *)@"Unknown";
}

@end