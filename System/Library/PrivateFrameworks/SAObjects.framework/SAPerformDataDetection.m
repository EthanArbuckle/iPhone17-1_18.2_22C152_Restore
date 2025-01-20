@interface SAPerformDataDetection
+ (id)performDataDetection;
- (BOOL)requiresResponse;
- (NSArray)detectionTargets;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDetectionTargets:(id)a3;
@end

@implementation SAPerformDataDetection

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PerformDataDetection";
}

+ (id)performDataDetection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)detectionTargets
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"detectionTargets"];
}

- (void)setDetectionTargets:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end