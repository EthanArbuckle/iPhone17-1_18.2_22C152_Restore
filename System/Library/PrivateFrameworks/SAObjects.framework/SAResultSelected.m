@interface SAResultSelected
+ (id)resultSelected;
- (BOOL)requiresResponse;
- (NSNumber)isMitigated;
- (NSNumber)processedAudioDuration;
- (NSString)resultId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIsMitigated:(id)a3;
- (void)setProcessedAudioDuration:(id)a3;
- (void)setResultId:(id)a3;
@end

@implementation SAResultSelected

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ResultSelected";
}

- (NSNumber)isMitigated
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isMitigated"];
}

- (void)setIsMitigated:(id)a3
{
}

+ (id)resultSelected
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)processedAudioDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"processedAudioDuration"];
}

- (void)setProcessedAudioDuration:(id)a3
{
}

- (NSString)resultId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resultId"];
}

- (void)setResultId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end