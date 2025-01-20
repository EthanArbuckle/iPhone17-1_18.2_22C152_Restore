@interface SASSuspendClientEndpointer
+ (id)suspendClientEndpointer;
- (BOOL)requiresResponse;
- (NSNumber)audioProcessedMs;
- (NSNumber)suspendDurationMs;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioProcessedMs:(id)a3;
- (void)setSuspendDurationMs:(id)a3;
@end

@implementation SASSuspendClientEndpointer

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SuspendClientEndpointer";
}

+ (id)suspendClientEndpointer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)audioProcessedMs
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"audioProcessedMs"];
}

- (void)setAudioProcessedMs:(id)a3
{
}

- (NSNumber)suspendDurationMs
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"suspendDurationMs"];
}

- (void)setSuspendDurationMs:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end