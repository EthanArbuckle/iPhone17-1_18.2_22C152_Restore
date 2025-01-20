@interface SAPreSynthesizeTTSCompleted
+ (id)preSynthesizeTTSCompleted;
- (BOOL)requiresResponse;
- (NSArray)approximateSpeechDuration;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setApproximateSpeechDuration:(id)a3;
@end

@implementation SAPreSynthesizeTTSCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PreSynthesizeTTSCompleted";
}

+ (id)preSynthesizeTTSCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)approximateSpeechDuration
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"approximateSpeechDuration"];
}

- (void)setApproximateSpeechDuration:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end