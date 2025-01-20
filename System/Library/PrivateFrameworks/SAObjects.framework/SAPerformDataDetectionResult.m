@interface SAPerformDataDetectionResult
+ (id)performDataDetectionResult;
- (BOOL)requiresResponse;
- (NSArray)matches;
- (NSString)detectionTarget;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDetectionTarget:(id)a3;
- (void)setMatches:(id)a3;
@end

@implementation SAPerformDataDetectionResult

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PerformDataDetectionResult";
}

+ (id)performDataDetectionResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)detectionTarget
{
  return (NSString *)[(AceObject *)self propertyForKey:@"detectionTarget"];
}

- (void)setDetectionTarget:(id)a3
{
}

- (NSArray)matches
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"matches", v3);
}

- (void)setMatches:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end