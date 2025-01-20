@interface SASSetAudioDuckingDelay
+ (id)setAudioDuckingDelay;
- (BOOL)requiresResponse;
- (NSNumber)duckingEventSyncDelay;
- (NSNumber)preTriggerToDuckingEndDuration;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDuckingEventSyncDelay:(id)a3;
- (void)setPreTriggerToDuckingEndDuration:(id)a3;
@end

@implementation SASSetAudioDuckingDelay

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SetAudioDuckingDelay";
}

+ (id)setAudioDuckingDelay
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)duckingEventSyncDelay
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"duckingEventSyncDelay"];
}

- (void)setDuckingEventSyncDelay:(id)a3
{
}

- (NSNumber)preTriggerToDuckingEndDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"preTriggerToDuckingEndDuration"];
}

- (void)setPreTriggerToDuckingEndDuration:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end