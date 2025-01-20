@interface SATTSEstimateTTSRequestDurationCompleted
+ (id)estimateTTSRequestDurationCompleted;
- (BOOL)requiresResponse;
- (NSArray)durations;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDurations:(id)a3;
@end

@implementation SATTSEstimateTTSRequestDurationCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"EstimateTTSRequestDurationCompleted";
}

+ (id)estimateTTSRequestDurationCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)durations
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"durations"];
}

- (void)setDurations:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end